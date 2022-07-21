module AlertHelper

  def alert_header(key)
    if key == "error"
      "Oh No!"
    else
      "Success!"
    end
  end

  def alert_svg(key)

    check_circle =  <<-EOS
<!-- Heroicon name: outline/check-circle -->
            <svg class="h-6 w-6 text-green-400" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" aria-hidden="true">
              <path stroke-linecap="round" stroke-linejoin="round" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
    EOS

    error_circle =  <<-EOS
<svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-red-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
  <path stroke-linecap="round" stroke-linejoin="round" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
</svg>
    EOS

    if key == "error"
      error_circle.html_safe
    else
    check_circle.html_safe
    end

  end




end
