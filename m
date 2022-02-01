Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B762F25
	for <linux-staging@lists.linux.dev>; Tue,  1 Feb 2022 17:01:07 +0000 (UTC)
Received: by mail-vk1-f174.google.com with SMTP id l14so9670069vko.12
        for <linux-staging@lists.linux.dev>; Tue, 01 Feb 2022 09:01:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rEgpI3G2nX9Lw9uqceH2eAdidBvBzk5i80XCAAy1o9c=;
        b=yRYp4SQ0mtYAmMoAymQHTTmtYGbu7Y+Yej3SvHAS6TilWg9FCiO0bcB6o8KaluOhJ/
         CfyDbuunU+ITFLi8DHx3WZ6RpYD9g3/G1S9odhehxfUJSYB/xdwaBi116/5v2DRgtilP
         b7iKTZVn+Hd4jIjXBgaD1hz8nYnNSEZNzmaWs4w1+0/BZyuawbcp6rlCqbpuT6ov37jI
         IfUeRQRS1tJNwiUTVq3r2DKiBKsUjq7WNFsqAVOlRHYIzX3UJCZMAgZS297f8Sxntndx
         Jir0ftU+re89c/ektSomM9ZtOjPbtSOhe5RuhUXSwnQxtvZp9BzbfdVyQhsNWjzoQdOH
         SIBQ==
X-Gm-Message-State: AOAM530j0GfFzwqbZ8X6OXMw3HX6V6jztAfmVSsvFzAyhgAGP3BEo/tp
	2vSbzFHS9qxb05OSlIFhlTpfagrbt/RCuL6h
X-Google-Smtp-Source: ABdhPJyQipvnLDn+iy0OdLNwux1lfF/iSmAz78OoPE3XoT3cHPQSBFTkIr52QQ90w2QiDcortImDrA==
X-Received: by 2002:a1f:9b93:: with SMTP id d141mr10657503vke.12.1643734866302;
        Tue, 01 Feb 2022 09:01:06 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id u70sm2422008vsu.10.2022.02.01.09.01.04
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Feb 2022 09:01:05 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id u76so14298743uau.3
        for <linux-staging@lists.linux.dev>; Tue, 01 Feb 2022 09:01:04 -0800 (PST)
X-Received: by 2002:ab0:6cf9:: with SMTP id l25mr10528741uai.122.1643734864638;
 Tue, 01 Feb 2022 09:01:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <20220125202118.63362-2-andriy.shevchenko@linux.intel.com>
 <YfEG2qVO9K9G+g1d@kroah.com> <CAKMK7uGoRC9a4cMCADTipV67oivfWvTw=6RYm2kOthB_bhWnXQ@mail.gmail.com>
 <f671a112-880d-1526-a395-360947b40c5a@gmx.de> <YfEv7OQs98O9wJdJ@kroah.com>
 <YfFIpBb7lL4ukWjm@smile.fi.intel.com> <b8eb7111-43aa-cc8a-a1bc-f08e0f2987ed@redhat.com>
 <YfFV4EJosayH+e6C@smile.fi.intel.com> <YfFWPmG2D093gz4N@smile.fi.intel.com>
 <6e74d4cc-655a-e38e-0856-a59e4e6deb36@redhat.com> <c423a2f0-e7be-3884-3568-7629c7e9104e@redhat.com>
 <ddb0f354-be19-92fe-20b3-56b00c9304ab@suse.de> <840ec74d-60c6-9480-709c-8cd597c6f5b0@redhat.com>
 <e7fbef3c-2f87-15f9-b24d-34ffaa5a2853@suse.de>
In-Reply-To: <e7fbef3c-2f87-15f9-b24d-34ffaa5a2853@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Feb 2022 18:00:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXnn+JcyMAV_Vbb4Yj8hJmae=Snc2R2fLviq67UYXg7Ew@mail.gmail.com>
Message-ID: <CAMuHMdXnn+JcyMAV_Vbb4Yj8hJmae=Snc2R2fLviq67UYXg7Ew@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] fbtft: Unorphan the driver
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, 
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>, 
	Michael Hennerich <michael.hennerich@analog.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	DRI Development <dri-devel@lists.freedesktop.org>, Phillip Potter <phil@philpotter.co.uk>, 
	Carlis <zhangxuezhi1@yulong.com>, Lee Jones <lee.jones@linaro.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Tue, Feb 1, 2022 at 5:16 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 31.01.22 um 11:18 schrieb Javier Martinez Canillas:
> > Another thing that's missing is a DRM_MODE_CONNECTOR_I2C, because I used for
> > now a DRM_MODE_CONNECTOR_Unknown.
>
> That might have implications on userspace. Maybe ask around. (Not that
> we actually run userspace on the device).

Looking at the list of connector types (and wondering if we're gonna
need more when converting existing fbdev drivers to drm drivers),
there seem to be two different families of connector types, for
  1. transports between CRTC and display (e.g. VGA, DVID, HDMI),
  2. transports between CPU and CRTC (e.g. SPI, possibly USB, and
     the proposed I2C)?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
