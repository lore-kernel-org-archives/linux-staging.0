Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980632FB0
	for <linux-staging@lists.linux.dev>; Sat, 14 Aug 2021 17:16:58 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id j1so20008870pjv.3
        for <linux-staging@lists.linux.dev>; Sat, 14 Aug 2021 10:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NSDkNCURFEIerS4iE9wKcdTIcG2uwI6A6CD3SDPBRN8=;
        b=FcEHlEZz3GfI58B1aUkkpBH3m8rYUGuBC14Rhh9bN+ZH3MCMDjI9vD1lvee2lSvpk7
         wxSyeMY0ngtGGen96qYWmUG8Xwx98HCFwJPUG5daFR0pVLDxS2zFpczr6zWa9dPOU5cU
         xYftjJMQOSk0B+2oxL01LPdKo3XgvwiU585kCS4K2qXPJa60oLiXOYUQ/MazxSR9y3Ou
         7ziIHssx6c0jX8OVbzLXITQpz9UvVcGnph7TdoS1N2s32Ucz/dk2uyMRiKzOTgf7Nix/
         5GS8PVBdsnZIcx07jJHGbc2kraDwY3U0NGw3g1fZKU3jClOkY6WWjELYXenbIMwJjmHW
         SebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NSDkNCURFEIerS4iE9wKcdTIcG2uwI6A6CD3SDPBRN8=;
        b=dX64NOnMahBjlG0bmweKfnNxXheTSmJzjW0D5FxECzsXQJWDmWshhogIbjtT3KtoL3
         LLespm67oE3F+j9yqmqL2SFlaQvhFJTV1kzLywkko1tuTz7NYWRonX1NMRpOvwWE1cCT
         2f2XTeMa123WgyWxkXlcfQCLS8w7yU8rxttlLTLByx3hZI8FWaTUiS/JR259t7CBCqps
         k7fI7UlqEEloKP2ukKQrmuqwh02iE55Bm0b6WnSQnunESZvEBcGcE9ym3nOFS1nTy4Sq
         G6PG7redn6V2TzSH9ZibQ0LAPJEOvIFzdrrHLTA1iDK4qtavERW4jYKRMj1lTFSkupJl
         9oeA==
X-Gm-Message-State: AOAM533TfpYcdu+gqUk5IzN/8EKScmtPal/sfUUxIYzscZ3QDohEeh/j
	/PBeogHyrSeS72qBVWHgToblmW75dRaazXW1bLylgQ==
X-Google-Smtp-Source: ABdhPJzmR7voE8ENxlTFiH68Wa1IFqhTypLcQw/V3cnzGoCIdsQOqQrHG3YRu3i45Eet6yBmt14LCKHYGwBSRu+Dp0g=
X-Received: by 2002:a17:90a:1b2e:: with SMTP id q43mr8090780pjq.217.1628961418202;
 Sat, 14 Aug 2021 10:16:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210813201418.4018631-1-nathan@kernel.org>
In-Reply-To: <20210813201418.4018631-1-nathan@kernel.org>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Sat, 14 Aug 2021 18:16:47 +0100
Message-ID: <CAA=Fs0nbbzOKhYs_AgpiAfDCLvuUGKz0cSSHwxct6k4eFzEUZg@mail.gmail.com>
Subject: Re: [PATCH] staging: r8188eu: Remove unnecessary ret variable in rtw_drv_init()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"Fabio M . De Francesco" <fmdefrancesco@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Aug 2021 at 21:14, Nathan Chancellor <nathan@kernel.org> wrote:
>
> ret is unnecessary as both error paths set the same error code so just
> return that directly.
>
> Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/staging/r8188eu/os_dep/usb_intf.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
> index 667f41125a87..3e5f4b5eb0fc 100644
> --- a/drivers/staging/r8188eu/os_dep/usb_intf.c
> +++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
> @@ -705,22 +705,18 @@ static int rtw_drv_init(struct usb_interface *pusb_intf, const struct usb_device
>  {
>         struct adapter *if1 = NULL;
>         struct dvobj_priv *dvobj;
> -       int ret;
>
>         /* step 0. */
>         process_spec_devid(pdid);
>
>         /* Initialize dvobj_priv */
>         dvobj = usb_dvobj_init(pusb_intf);
> -       if (!dvobj) {
> -               ret = -ENODEV;
> +       if (!dvobj)
>                 goto err;
> -       }
>
>         if1 = rtw_usb_if1_init(dvobj, pusb_intf);
>         if (!if1) {
>                 DBG_88E("rtw_init_primarystruct adapter Failed!\n");
> -               ret = -ENODEV;
>                 goto free_dvobj;
>         }
>
> @@ -734,7 +730,7 @@ static int rtw_drv_init(struct usb_interface *pusb_intf, const struct usb_device
>  free_dvobj:
>         usb_dvobj_deinit(pusb_intf);
>  err:
> -       return ret;
> +       return -ENODEV;
>  }
>
>  /*
>
> base-commit: 0bd35146642bdc56f1b87d75f047b1c92bd2bd39
> --
> 2.33.0.rc2
>

Dear Nathan,

Thanks for this.

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
