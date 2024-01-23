require 'gosu'

class BallCatchGame < Gosu::Window
  def initialize
    super(800, 600)
    self.caption = "Ball Catch Game"
    @player_x = 400
    @ball_x = rand(800)
    @ball_y = 0
    @score = 0
  end

  def update

    @ball_y += 20

    if @ball_y > 600

      @ball_x = rand(800)
      @ball_y = 0
    end


    if ( @player_x - @ball_x ).abs < 30 && ( 550 - @ball_y ).abs < 30
      @score += 1
      @ball_x = rand(800)
      @ball_y = 0
    end


    if button_down?(Gosu::KbLeft)
      @player_x -= 20
    end

    if button_down?(Gosu::KbRight)
      @player_x += 20
    end
  end

  def draw
    Gosu.draw_rect(0, 0, 800, 600, Gosu::Color::WHITE)
    Gosu.draw_rect(@player_x - 30, 550, 60, 20, Gosu::Color::GREEN)


    Gosu.draw_rect(@ball_x - 15, @ball_y - 15, 30, 30, Gosu::Color::RED)

    draw_score
  end

  def draw_score
    draw_text("Score: #{@score}", 10, 10, 20, Gosu::Color::BLACK)
  end

  def draw_text(text, x, y, size, color)
    font = Gosu::Font.new(size)
    font.draw_text(text, x, y, 1, 1, 1, color)
  end
end

BallCatchGame.new.show
