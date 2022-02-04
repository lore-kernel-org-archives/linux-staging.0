Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64F32F26
	for <linux-staging@lists.linux.dev>; Fri,  4 Feb 2022 08:31:09 +0000 (UTC)
Received: by mail-vk1-f171.google.com with SMTP id y192so3254204vkc.8
        for <linux-staging@lists.linux.dev>; Fri, 04 Feb 2022 00:31:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5LkLCh9tgcGFKu8QRYGFG/lHSI3FKQNh68/jvHDjNJA=;
        b=NPJDaHf8UalY3NVpMRDWbydolkZ7wtvmNtUSJwBby4Y0DU7oA8OiM/Smy2cLB3L/Wv
         vmqv+3nRF4Fq3jQzgh3iUiIN7fOAi2tTCJE3mLju2pnIRiRv4M+v8Xcqvv3pNYFd6X9/
         crOyDodmt8RuWg9guazCYRp/lDmLJkZlw3mZoNpv7Vbj4yQq+WEsZCH4vuxpxpybHq29
         VgyYGI8lFYJ5vNbRvHB2Xw6cBdoI3KUnDNgu6O+apH4hLte1+3xOBRS91mArMHPVCgck
         7pqrt353d2yNRGrL2Unz+KzT9pfnKLkILKQ493BwRskFWgJef3qOlYgbOnWc4+f4t2Pq
         XOKA==
X-Gm-Message-State: AOAM532ayVxJ/jdY/jyEYdbIlDHvZei02cJqlfnTMe0Zd9KyLjk83ZZp
	hYSqi8pOYNVLmY21+UX4LN4B4tLMPB3/dw==
X-Google-Smtp-Source: ABdhPJz/k2xe0OWh7XvHZ46gZ2bsDXixkIb9XzuGX7WetUO1oPXXNnIckixx5rGMl3ACn4Es7tiyqA==
X-Received: by 2002:ac5:c7c3:: with SMTP id e3mr650952vkn.1.1643963468552;
        Fri, 04 Feb 2022 00:31:08 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id e17sm273496vsl.21.2022.02.04.00.31.07
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Feb 2022 00:31:08 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a24so9574917uat.10
        for <linux-staging@lists.linux.dev>; Fri, 04 Feb 2022 00:31:07 -0800 (PST)
X-Received: by 2002:a67:c198:: with SMTP id h24mr484417vsj.5.1643963467627;
 Fri, 04 Feb 2022 00:31:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch> <20220131210552.482606-22-daniel.vetter@ffwll.ch>
In-Reply-To: <20220131210552.482606-22-daniel.vetter@ffwll.ch>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Feb 2022 09:30:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUm76tT6u+i=A50ffh=k8hX5kgoMqH=t_wfHqH95nVOPA@mail.gmail.com>
Message-ID: <CAMuHMdUm76tT6u+i=A50ffh=k8hX5kgoMqH=t_wfHqH95nVOPA@mail.gmail.com>
Subject: Re: [PATCH 21/21] fbdev: Make registered_fb[] private to fbmem.c
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, 
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Jens Frederich <jfrederich@gmail.com>, Jon Nettleton <jon.nettleton@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	Daniel Vetter <daniel.vetter@intel.com>, Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>, 
	Matthew Wilcox <willy@infradead.org>, Sam Ravnborg <sam@ravnborg.org>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Zhen Lei <thunder.leizhen@huawei.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Xiyu Yang <xiyuyang19@fudan.edu.cn>, 
	Zheyu Ma <zheyuma97@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

Thanks for your patch!

On Tue, Feb 1, 2022 at 9:50 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> Well except when the olpc dcon fbdev driver is enabled, that thing
> digs around in there in rather unfixable ways.

Can't the actual frame buffer driver (which one?) used on olpc export
a pointer to its fb_info?

> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -48,10 +48,14 @@
>  static DEFINE_MUTEX(registration_lock);
>
>  struct fb_info *registered_fb[FB_MAX] __read_mostly;
> -EXPORT_SYMBOL(registered_fb);
> -
>  int num_registered_fb __read_mostly;
> +#if IS_ENABLED(CONFIG_OLPC_DCON)

CONFIG_FB_OLPC_DCON (everywhere), cfr. the build failure reported
by the robot.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
