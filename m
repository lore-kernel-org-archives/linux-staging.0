Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E32441A
	for <linux-staging@lists.linux.dev>; Thu, 21 Jul 2022 14:17:14 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id c20so1324850qtw.8
        for <linux-staging@lists.linux.dev>; Thu, 21 Jul 2022 07:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IlgcF/GK95Rjt3bgvSjXlIF1TgHRln+uJln/ZYG0UwI=;
        b=qsgTdyFFryrWQfO5QLLK6FQFwh1HeBJwZuJkIoDRz6KKaCiQmPab5RBXWtol0JtDSu
         uAt11jJhdXrUOV7F9sYslZQFj5c/OwfhJUgb9EXsNkvj0TKijxlEcY4MhFy+0szRH1Af
         RGv51tKLyWkNqKtl5tCMLL8Co5t/Q/quJBKIakQFE4g5FQd+tME2iDweNwYSTwd3hJ0i
         mJrMoxspcCkohz1y9MgrQVZpqOWRJxV8sW4AHU+qUkxQ7+ue68gFfy7HI+3PZXUFZAL3
         2uTQv7800IqU3+DP0zzibsOzapOWJcjJolFWcy+g3vtx5PC5JxZBi0jUezYd20AkwCX3
         YDtg==
X-Gm-Message-State: AJIora+nx+rtC+79F776wSEFqVpc1LzBy9LPt3PV3SSX3BChb8U+/nT8
	i384sd2EoDQG4772zmZ5swqbqglBl3SsCA==
X-Google-Smtp-Source: AGRyM1uPU8X4A21LSrgzWVm7eEY3XiNX1GJ5IFrOC6W1OBfjQ0rxtW+kmv+S75iCO2+HkW6n13QYew==
X-Received: by 2002:a05:622a:5d4:b0:31e:e357:f843 with SMTP id d20-20020a05622a05d400b0031ee357f843mr21017384qtb.588.1658413033044;
        Thu, 21 Jul 2022 07:17:13 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id l68-20020a378947000000b006b58fce19dasm1522065qkd.20.2022.07.21.07.17.11
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 07:17:12 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-31e623a4ff4so18668927b3.4
        for <linux-staging@lists.linux.dev>; Thu, 21 Jul 2022 07:17:11 -0700 (PDT)
X-Received: by 2002:a81:6088:0:b0:31e:79fd:3dfa with SMTP id
 u130-20020a816088000000b0031e79fd3dfamr4529972ywb.47.1658413031348; Thu, 21
 Jul 2022 07:17:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220718072322.8927-1-tzimmermann@suse.de> <20220718072322.8927-7-tzimmermann@suse.de>
In-Reply-To: <20220718072322.8927-7-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 Jul 2022 16:17:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVnZDu2jZyUsuCG_Z+NRUoJ_0bK2zxezo92V2XTuRgzdQ@mail.gmail.com>
Message-ID: <CAMuHMdVnZDu2jZyUsuCG_Z+NRUoJ_0bK2zxezo92V2XTuRgzdQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/11] fbdev: Remove conflicting devices on PCI bus
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>, Helge Deller <deller@gmx.de>, Daniel Vetter <daniel@ffwll.ch>, 
	Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>, 
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>, linux-staging@lists.linux.dev, 
	DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Mon, Jul 18, 2022 at 9:24 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Remove firmware devices on the PCI bus, by calling
> aperture_remove_conflicting_pci_devices() in the probe function of
> each related fbdev driver. iSo far, most of these drivers did not
> remove conflicting VESA or EFI devices, or outride failed for
> resource conflicts (i.e., matroxfb.) This must have been broken
> for quite some time.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks for your patch!

> --- a/drivers/video/fbdev/tgafb.c
> +++ b/drivers/video/fbdev/tgafb.c
> @@ -12,6 +12,7 @@
>   *  more details.
>   */
>
> +#include <linux/aperture.h>
>  #include <linux/bitrev.h>
>  #include <linux/compiler.h>
>  #include <linux/delay.h>
> @@ -106,6 +107,12 @@ static struct pci_driver tgafb_pci_driver = {
>  static int tgafb_pci_register(struct pci_dev *pdev,
>                               const struct pci_device_id *ent)
>  {
> +       int ret;
> +
> +       ret = aperture_remove_conflicting_pci_devices(pdev, "tgafb");
> +       if (ret)
> +               return ret;
> +
>         return tgafb_register(&pdev->dev);
>  }

I am wondering which driver could possibly conflict with TGA?

Probably there are a few other drivers in the same category (tdfxfb?).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
