Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BDE378805
	for <linux-staging@lists.linux.dev>; Fri,  6 Mar 2026 23:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772839746; cv=none; b=WoF+EoxxPoeHJSiQNOYfohWaQ41AnJcsC1zF8R6508nzTqRIVD4WLmtxoGs1ZMWbuZ3k0JjItA+FAKfgbG8t1plWfRnw5iBKd4tj/dp44hwRf7BkMJ1fikjtlFw21bSJroUBbLQHYXzFPthBCQl0tHkfb0FBTkPKvl+YLe38rKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772839746; c=relaxed/simple;
	bh=UPz/1qsRdJyWIaGxAjf5OdGUVOKPj4+OWW8N2wpx+5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d2gqOM50Ll+3QCOfWB3dZEBJ2q998nXVaOey+HXntLyHy1jEF3IyHVxZ1tSZV09gpXBIg2J393MRy6MlfcFBA9AZiGlPpkAbQQepg7bFVQIDwCB2ZP4i8aqg+xfa8zJSXPRntAgj6sIKOMO3cIgdsrXoKIRZhcOn1gK4MKqV9wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ciT/SyjC; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ciT/SyjC"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-823c56765fdso5042051b3a.1
        for <linux-staging@lists.linux.dev>; Fri, 06 Mar 2026 15:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772839741; x=1773444541; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jmuJidMV1Wwe0qpdw07DaES1yYrCFjR7mRIMJgUWNXw=;
        b=ciT/SyjCfA11wtT95Np+FtJkzx8VmHtM7uhMcYK4OaY4bPlvQb5XLuLv++JTIe8T1A
         XmjIDbZBmjupy8JcehB+xdbSDFQcCuOSyNqa4nKjqzAb1P9p7Q6AWpQAdFIXsGqV1EOC
         kBtmu7qFEndfVLqveEPjmkrsPsVNNXPVMWZSvgm0t7zcpX8FWo/2kaNbEnFJv8pzzooP
         DmX/alLayDGjCGlY0Xp5kqlCAAuN9bjZKcuy3B6z8kydrMRRuZ5UCwcSkxHD0fexw/s/
         3IghHMxZKHQTAN4sW8T3vTTxQWbdR7uA0cTRTRBJQi1KjQP0vVnGBAabYDk/TIMzRnUy
         PVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772839741; x=1773444541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jmuJidMV1Wwe0qpdw07DaES1yYrCFjR7mRIMJgUWNXw=;
        b=owU6Iyg5UBHeB2yboa4hucRob+jIM+YYdcfcQk9esHqyo3Kux5DTzGG7hkBVpE1rMs
         wGEvrzBvHv29eYRMy9cfyud4u8g9g7m38vQeFH/G3uAqvYGL+oNLen1xhc2HeTfyPT4I
         zPzzRDP4ZsgDs4gtu3hKmjIWmetsp7QeujT3PJL+8C5HHhwSQqIhRlUGR42h7GpgB+RW
         kOY4EExVZNElUFbu/wNRGTLzJV9UMtCJVgmrSKa/mn6WQyPbd6xGDw34mnsoAXJzQYUf
         Q/q/pYv8CKElRt24mhStZ3mf4b3Tm9UUKRsGtT7k+7homM4D4ZEt38DonlxrR5dBfmXZ
         vvFw==
X-Forwarded-Encrypted: i=1; AJvYcCW8JeqkAoTVZkynIqA6yC+lXCBpcpGpsQ45XhYMiw85EcK8V6OFi/uDDgNI6YsSTpoFfR3v1kLsH/vj4efX@lists.linux.dev
X-Gm-Message-State: AOJu0Yzi8ukIlSiTKLhha6PAiDO1WXzRevIQTBJJNlesqDonTeUlN2nw
	voeORjXxPj1ITXgrRdarOdOiWGCuPKQY8gimv3//GPwMNBEDrMLeFwtA
X-Gm-Gg: ATEYQzy5ZxIkvGkucRyFyZgXW4WARbjaGAl61yLE0m642YR7cefQElwFnXVKMnV+F3y
	i6vbUHp5V+fzonbtFpHl/k2eS6GmzqIQ3UkH+Gt8xSRLwd5JZZrbuD9ybkxOoaTX7eVXg6pnKxo
	dtL6cLtH9HazHQQAI82Ljrx6Ojgyw560MmOaQcs1MVvO+qyCjISj2G/yO07ZZzlmVphzhlM3TiZ
	hG5sSDOX5t4isiWc80Z2YB1m9bI5DJ8i2NOApHEjJUts5Jk7TyfbOSOJfGBKvZR0H8OzRqYF8Up
	2h7pptF/UQ9vAGdUyG64Z70y/PF6VkD9Z5uWc3vtjnw/aGKjusJtsCi5ftwcxiDaFC9rQ7XeckX
	mcScbGpiQZ7Pz2MOWe7vA36nYt8WZJ5B5q3Uj5WSixglgVrnZzC0ZenVBFOS4jwl7iZSbV3kPAf
	vgpuFK2pTWBk6BcPO7+/9kb5j4y1zvdvnBzft3
X-Received: by 2002:a05:6a00:9510:b0:829:8942:2c93 with SMTP id d2e1a72fcca58-829a2d86b43mr3749707b3a.9.1772839741072;
        Fri, 06 Mar 2026 15:29:01 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48d3621sm3213092b3a.62.2026.03.06.15.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 15:29:00 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 6 Mar 2026 15:28:59 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sre@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-leds@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 10/14] watchdog: convert the Kconfig dependency on
 OF_GPIO to OF
Message-ID: <2c6ad0ca-fd72-4bf5-9180-f45c20e60d37@roeck-us.net>
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
 <20260304-gpio-of-kconfig-v1-10-d597916e79e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304-gpio-of-kconfig-v1-10-d597916e79e7@oss.qualcomm.com>

On Wed, Mar 04, 2026 at 10:02:31AM +0100, Bartosz Golaszewski wrote:
> OF_GPIO is selected automatically on all OF systems. Any symbols it
> controls also provide stubs so there's really no reason to select it
> explicitly. We could simply remove the dependency but in order to avoid
> a new symbol popping up for everyone in make config - just convert it to
> requiring CONFIG_OF.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/watchdog/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index dc78729ba2a5d6e035ed3cbe5c2b631d11b76b20..ef200339a22a6f9c51a46c9c0b8466add74313e2 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -250,7 +250,7 @@ config DA9062_WATCHDOG
>  
>  config GPIO_WATCHDOG
>  	tristate "Watchdog device controlled through GPIO-line"
> -	depends on OF_GPIO
> +	depends on OF

AI feedback:

  Could this change inadvertently allow the driver to be selected when GPIOLIB
  is disabled?

  In drivers/gpio/Kconfig, OF_GPIO is defined inside the "if GPIOLIB" block,
  so it implicitly depends on GPIOLIB. By changing the dependency directly to
  OF, the GPIOLIB dependency is lost.

  If GPIOLIB is disabled, the driver will still compile because of the stubs
  in include/linux/gpio/consumer.h, but devm_gpiod_get() will unconditionally
  return -ENOSYS, causing the probe to fail. Since the driver's sole purpose
  is to control a watchdog via a GPIO line, should it be prevented from being
  configured without GPIOLIB by using something like:

	depends on OF && GPIOLIB

It has a point. Please update.

Thanks,
Guenter

>  	select WATCHDOG_CORE
>  	help
>  	  If you say yes here you get support for watchdog device
