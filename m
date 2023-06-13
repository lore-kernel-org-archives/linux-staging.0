Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91B95CB0
	for <linux-staging@lists.linux.dev>; Tue, 13 Jun 2023 10:43:55 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-30c4775d05bso3746331f8f.2
        for <linux-staging@lists.linux.dev>; Tue, 13 Jun 2023 03:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686653034; x=1689245034;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lLutf+KjWhvbo43jAnwMCduq5kRauIVlF499sKJllbw=;
        b=Tebomd8VGnHhE+w+b5CDwdcS6jy9JR89a+qkbngyLC3vc5+twB5SNidRwHh8NSOpTS
         8eixPLK7D9svCm4RQ2GP30c3/796+q4cnYUMOlCy6c40JEPNXkEkS7wrcrdVaUEZSpBD
         gkFF/FftbPA51jZWmI0j8ob+kCrNOdaqU8QdhcbGMFklAApFOnRrXOxr1P5swptKYNSQ
         UhhygDT75/rVeDlcxd07SdAfiga5m8drWXG0wieQRnmDOEWbdLLPegxwmL+T0ifjxOY/
         WIT42o16znUkIkH3rckPRfxp5Zbb5kcGoo79bKSgFm5CR8AkMxcaCxCsJwB05IMDV3co
         1Cqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686653034; x=1689245034;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLutf+KjWhvbo43jAnwMCduq5kRauIVlF499sKJllbw=;
        b=cxzNc6/e5LJftnrF1VhwXMhrVaobVbj5hieOpX80UDrmkXzIA3xHF2I8J26Dw7FBW5
         VEb8pUWDZ2d2X6X/KemtZ6I/uZVVFf+MofahS1BLid8lIyTU86tU+5Z+gOtaqjcsv3wL
         TABDxiCToZ18wD3DIRqnPq0q434s+hOsjwEiOc9GbY/LOclBWPzfPMqozVickqmza4Bs
         c39gMDAs+k0RNkqyyXarLrKZBR+azhm0aM4YlkkhDT36mbYoWcfJYaYoHA8peli5UNf0
         3Nuy+VbfW5yG+gkeG+I9GtiQmr0zroDyAFU8PmpQchmRKe9VHBYvFZpY+4KEt4vF1Rxm
         C4Cw==
X-Gm-Message-State: AC+VfDwLMCkHfkTqzDPzzt17PUlAcXBcxT1tnzW9EMCbdu3XovK1mJux
	gdLr+GiJbz6G/7wkdV1fHlvQi9vshIMLHzW4EgtUWQ==
X-Google-Smtp-Source: ACHHUZ68YtIfx45+cpnaYyoXbSrtLiflqoiv4n5LwHVoZuuqCHc2tdBqIZicnmX+p5XeiXBR68Vz0w==
X-Received: by 2002:a5d:4dd0:0:b0:306:43ad:b34e with SMTP id f16-20020a5d4dd0000000b0030643adb34emr6204325wru.18.1686653033700;
        Tue, 13 Jun 2023 03:43:53 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id n7-20020adff087000000b0030ae5a0516csm14960636wro.17.2023.06.13.03.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 03:43:53 -0700 (PDT)
Date: Tue, 13 Jun 2023 11:43:51 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
	geert+renesas@glider.be, lee@kernel.org, jingoohan1@gmail.com,
	dan.carpenter@linaro.org, michael.j.ruhl@intel.com,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 38/38] fbdev: Make support for userspace interfaces
 configurable
Message-ID: <20230613104351.GG169438@aspen.lan>
References: <20230612141352.29939-1-tzimmermann@suse.de>
 <20230612141352.29939-39-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612141352.29939-39-tzimmermann@suse.de>

On Mon, Jun 12, 2023 at 04:08:16PM +0200, Thomas Zimmermann wrote:
> Add Kconfig option CONFIG_FB_DEVICE and make the virtual fbdev
> device optional. If the new option has not been selected, fbdev
> does not create files in devfs, sysfs or procfs.
>
> Most modern Linux systems run a DRM-based graphics stack that uses
> the kernel's framebuffer console, but has otherwise deprecated fbdev
> support. Yet fbdev userspace interfaces are still present.
>
> The option makes it possible to use the fbdev subsystem as console
> implementation without support for userspace. This closes potential
> entry points to manipulate kernel or I/O memory via framebuffers. It
> also prevents the execution of driver code via ioctl or sysfs, both
> of which might allow malicious software to exploit bugs in the fbdev
> code.
>
> A small number of fbdev drivers require struct fbinfo.dev to be
> initialized, usually for the support of sysfs interface. Make these
> drivers depend on FB_DEVICE. They can later be fixed if necessary.
>
> v2:
> 	* set FB_DEVICE default to y (Geert)
> 	* comment on {get,put}_device() (Sam)
> 	* Kconfig fixes (Sam)
> 	* add TODO item about FB_DEVICE dependencies (Sam)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  Documentation/gpu/todo.rst               | 13 ++++++++
>  drivers/staging/fbtft/Kconfig            |  1 +
>  drivers/video/fbdev/Kconfig              | 13 ++++++++
>  drivers/video/fbdev/core/Makefile        |  7 +++--
>  drivers/video/fbdev/core/fb_internal.h   | 38 ++++++++++++++++++++++++
>  drivers/video/fbdev/omap2/omapfb/Kconfig |  2 +-
>  include/linux/fb.h                       |  2 ++
>  7 files changed, 72 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 68bdafa0284f5..f226f934ca5af 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -452,6 +452,19 @@ Contact: Thomas Zimmermann <tzimmermann@suse.de>
>
>  Level: Starter
>
> +Remove driver dependencies on FB_DEVICE
> +---------------------------------------
> +
> +A number of fbdev drivers provide attributes via sysfs and therefore depend
> +on CONFIG_FB_DEVICE to be selected. Review each driver and attempt to make
> +any dependencies on CONFIG_FB_DEVICE optional. At the minimum, the respective
> +code in the driver could be conditionalized via ifdef CONFIG_FB_DEVICE. Not
> +all drivers might be able to drop CONFIG_FB_DEVICE.
> +
> +Contact: Thomas Zimmermann <tzimmermann@suse.de>
> +
> +Level: Starter
> +
>
>  Core refactorings
>  =================
> diff --git a/drivers/staging/fbtft/Kconfig b/drivers/staging/fbtft/Kconfig
> index 4d29e8c1014e0..5dda3c65a38e7 100644
> --- a/drivers/staging/fbtft/Kconfig
> +++ b/drivers/staging/fbtft/Kconfig
> @@ -2,6 +2,7 @@
>  menuconfig FB_TFT
>  	tristate "Support for small TFT LCD display modules"
>  	depends on FB && SPI
> +	depends on FB_DEVICE
>  	depends on GPIOLIB || COMPILE_TEST
>  	select FB_SYS_FILLRECT
>  	select FB_SYS_COPYAREA
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index f82357d4f84da..19eaca5e04283 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -57,6 +57,16 @@ config FIRMWARE_EDID
>  	  combination with certain motherboards and monitors are known to
>  	  suffer from this problem.
>
> +config FB_DEVICE
> +	bool "Provide legacy /dev/fb* device"
> +	depends on FB
> +	default y
> +	help
> +	  Say Y here if you want the legacy /dev/fb* device file and
> +	  interfaces within sysfs anc procfs. It is only required if you
> +	  have userspace programs that depend on fbdev for graphics output.
> +	  This does not effect the framebuffer console. If unsure, say N.

Nitpicking but this *is* documentation so:
s/effect/affect/


Daniel.
