Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF4C7C;
	Wed,  6 Jul 2022 09:13:20 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id z41so18465351ede.1;
        Wed, 06 Jul 2022 02:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=WKlacHhWVR2IblvCAgYMcCw7cvtmo7gBzlhxFpijOWM=;
        b=UyINPEp8aUU7+iO4UvYReAysG8acJi4s0lW7fYS990hIHuI2KgReqshlPjlC0FcdQX
         RWLEJ1iagzj5JHTLAwg1Tfl34CjKErUg06qCwRi5FpbuqXpIfRK0B8kuUc2l5x+40o+8
         2YldATzAdsq2GhIZIL2D0cZi8oKOkVG5Y5xLvvP4kajNiX5yCXAJSyEYBx1RvA9W9SdO
         piij5Lfa0VXVwqnHofYdHxRPOmYTBO/NXTATLm6C9JRKYr2iRvgzlsZTZRGqO8gtc9pI
         zkPBxco6Fa5B8qkZy3WblPhpXY+1PsQ3ol/zLxC+L8wAov5SdI1JA4byrn/VHyXJavbs
         ZPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=WKlacHhWVR2IblvCAgYMcCw7cvtmo7gBzlhxFpijOWM=;
        b=q8FTJbSxfuJ7gOzA+S/UM8nn3OGGQ1BIfbNPLvuo+o1P47BFd5oYBubAxg0jirsKQ5
         NT6Ng+oi1pY69V/jWBb/3NjYyeqGqWHiEt7DDBxzdon7WubhP+RViLajbrGP8fpGUaLK
         MFtcNlHCWqEbw0CfaCjc235OLCHU5xnqHy4J/3RcFEICd6i/ekySzmRZELU0iFMcoPYg
         pLtVJT37+VFBwL03pwzuzbjp3SyJ05jxGgDKEI9Ct+IfctZOWgZzAIUtOG6oHePNPiDC
         DIXJjpNqMqmGycaVOhMw77JndWOEcmwsvtVGLzGFFC7lPbLv6Y5xwLaAoUSDtMD3vH2B
         9+dA==
X-Gm-Message-State: AJIora/HxlQ7XdtGyvDXUEAGno+aeNk6deu4/LAYEY4QKNkmbvN0N97d
	WwnddueRJq7VM1dpoqkHK0E=
X-Google-Smtp-Source: AGRyM1tgzHocOxIjG9HexS+g9z9ap2nsem/HblqVyMjIbl5ZbLhG8nAvflW5PCvUObUWjIPHfLadCA==
X-Received: by 2002:a05:6402:350a:b0:435:df44:30aa with SMTP id b10-20020a056402350a00b00435df4430aamr51209856edd.403.1657098799156;
        Wed, 06 Jul 2022 02:13:19 -0700 (PDT)
Received: from skbuf ([188.26.185.61])
        by smtp.gmail.com with ESMTPSA id er13-20020a056402448d00b0043a5bcf80a2sm6350790edb.60.2022.07.06.02.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 02:13:18 -0700 (PDT)
Date: Wed, 6 Jul 2022 12:13:15 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Wolfram Sang <wsa@kernel.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	openipmi-developer@lists.sourceforge.net,
	linux-integrity@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-gpio@vger.kernel.org,
	dri-devel@lists.freedesktop.org, chrome-platform@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
	patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
	linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	acpi4asus-user@lists.sourceforge.net, linux-pm@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
	linux-watchdog@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
Message-ID: <20220706091315.p5k2jck3rmyjhvqw@skbuf>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>

On Tue, Jun 28, 2022 at 04:03:12PM +0200, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <uwe@kleine-koenig.org>
> 
> The value returned by an i2c driver's remove function is mostly ignored.
> (Only an error message is printed if the value is non-zero that the
> error is ignored.)
> 
> So change the prototype of the remove function to return no value. This
> way driver authors are not tempted to assume that passing an error to
> the upper layer is a good idea. All drivers are adapted accordingly.
> There is no intended change of behaviour, all callbacks were prepared to
> return 0 before.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---

Assuming you remove the spurious kasan change:

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
