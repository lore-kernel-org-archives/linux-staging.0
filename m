Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846B437B406
	for <linux-staging@lists.linux.dev>; Fri,  6 Mar 2026 23:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772840019; cv=none; b=XIyJ+39+yFlP+zlFH09ebssjt0lh3+BKhGw8eo+jVFK3VmnnKs+/uAoOKANu6ZbYNfJx1Np0k1W69Rp9lP4zdbnFIDsPk0LkOhoCeVXnjP5BrBBddi4djqCUmYO/npc/0IRqTdyjcVc7mtDsjJTy2wU3ihZ6G//d+w99jSBeubk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772840019; c=relaxed/simple;
	bh=plzyiDYL13gMDVwQr9Dj9f8cir0m0t5cKB6vFZUg2cY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FuEi0i166b9jt/89/fKAOEPLAW1bJ1/H7zL1b3/nRfiK3Q7Xu56OMzNWIyEM8XCaRj6cdVi2ipKB1a47SkOcYQ6jqz+mhQc3kkJjp2xrYR41NrbKnpSsKaRWiu1oghBvx4iOTz6Ng+mMgpoyfiF2FaSUbll4mrru1IglLflaZq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OYdB0mcA; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYdB0mcA"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35980423087so3336480a91.3
        for <linux-staging@lists.linux.dev>; Fri, 06 Mar 2026 15:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772840018; x=1773444818; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A3n1MjNRco+xhIuiD22YqqFeZmP/U2HpmvCL9DYQOmg=;
        b=OYdB0mcAFWp6MYNcn+mPbyJGaERvE31qbGv34G8kLIRdpzVUpoPkQZdeDt5FktNYIV
         1ZpYhCo64AQ/B5SSRXXLfT/YzyjXf04hBo2/rX+JNlW8ZdXzXKsQDKtKFsbc46hX2/dl
         lyCQ6RJHwdI0sB7rFzV1uZWpT8DncBE6j4LIDf+jnMQnhb8cU85sTm53pMujTKao6vLA
         8ww2IQ2yDFj5MK0l0VthrZ9c59i+Fj7OG4zA+BJ6tVQs++ENuj5ZKBw41rUAWFTMHNQ2
         K0XbVTzag1pbzqy2ki/jCosf7Bq37g0yYis9Fw4TmjXpq3A+cSQtk/ikWCRZONVftR2E
         Ddsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772840018; x=1773444818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A3n1MjNRco+xhIuiD22YqqFeZmP/U2HpmvCL9DYQOmg=;
        b=Y8v0WA+LQcnGcYuZMlGlKDd78x4D72PC+pO4kT8re8G2ee8XnxnEhq27skyz0M1TWk
         GKVwvkFYy5fIqadyAD1q6rymIiKPbo/P1nAryPpogEmip0ybNzACkL0pR045WGAV97SG
         WtMPMbzFXUhHvpDtNKB2Q10uamDfOh0w6OEwzvwSJm+vfOoZc6+bd3J3Ck53M9Vfg6PI
         iq3SWSQG/HNHPCIv0RDIhY7Kri68aTxWzhNABnbT9eVHg8AvreU03Kc0IeLKcbmG3LjU
         wEj23t89ViUz/Jm15WMKZxAyVWrLWBmxy0JKKQ2w0b3GPGfdRdSfmRrD/unqIk6tG9IV
         XdaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrjctXAsfR1NxwRvJMgektgLUg6iHiS2s4/L97zXmttfMgrIXKbNtcWqw8Iul9anYQWBWdqPKWzIzPMkXu@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+xhvVbJUCm5/2LpH8aummg6c9eoxcQjwodTBKYbNrqbQ04qJ1
	WDX4ttSzMr6SztSIVe4/0E1TMgzACUoT2CX0kdA4W0pChklu1QYJ5Cs6
X-Gm-Gg: ATEYQzwFEnnwmKwAPIXtlHRwfSuFo91L3obFTFBuRoikwt3BG4lb73dWkzSLC2A0vnd
	hcE2BoQmXmmur8p8Z7bMPJnub+B3epuvRG8s6l+U+ILoEaxxzTHRVj+7YyBGw8b2guDUcC39Wz1
	3xW309k3qAXuo2pqzbSytmB9nkLCm3udc7sS+qOmsAeW41iwYb2ckJnTMRlOeJk1R+2ZDsKu5IQ
	nMOJLC8t83RUMO7eVnAewN14dfDv0J9uqbH7FJUD0swPz3h1fQfJOcNiHtAwAW3kGaeYZH1rWod
	t1a4Vus7bigC+zPoAU3aRirPjloEeX9N7SLqqAZluw9cppK692U4n1eg9AXtZrBqeoXCdX/KQHp
	Cph3ANXDmQs7XY1phzG4f4tDT763uw+4tEtGvTwioPaRX8JyWZMuAqAvTq8i2Ja905wEZ67Hx6j
	EUZpBcGvrhUfz4fXmVi4foor0JfY2uOhiCLefw
X-Received: by 2002:a17:90b:38c4:b0:32e:528c:60ee with SMTP id 98e67ed59e1d1-359be31746amr3476775a91.24.1772840017833;
        Fri, 06 Mar 2026 15:33:37 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2de79f6sm6579296a91.9.2026.03.06.15.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 15:33:37 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 6 Mar 2026 15:33:36 -0800
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
Message-ID: <07aa5d40-96b6-41a1-b8ce-22f2c2c94aed@roeck-us.net>
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

Actually, that isn't really true.

if GPIOLIB
...
config OF_GPIO
        def_bool y
        depends on OF
        depends on HAS_IOMEM

OF_GPIO also depends on GPIOLIB and HAS_IOMEM. I don't know why it needs
to depend on HAS_IOMEM, but the GPIOLIB dependency is real.

Guenter

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
>  	select WATCHDOG_CORE
>  	help
>  	  If you say yes here you get support for watchdog device
