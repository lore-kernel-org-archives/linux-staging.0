Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1327870
	for <linux-staging@lists.linux.dev>; Wed, 11 Aug 2021 23:53:28 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id oa17so6310279pjb.1
        for <linux-staging@lists.linux.dev>; Wed, 11 Aug 2021 16:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yH5g66y79L9H25uzVilhEw52pa/PdLgYYJLVxPnNFwE=;
        b=Gu8C+0lvV/onCX19VoAQrGJVAwO0pe5rLgV2iJSRspNvJYs31k6U0P24DLkiASxBFo
         seTBfU16F214u7vJCow8uRfnhKZCDmqzni7wCHHJDRTmVCo2Q53N0DSPR9XEPR8srNb4
         +lGOlw23VCctvaxqjbkSCa4+0Lu+Ru1ybUmfl9sHqUw1894vvG+klkGeHksUV0GFWQkR
         87Rxs/5gu0AV5cdWR+/NbCkmX6awps9iFaCPwFxsbf6Dm+5avd6es/ZNbzbsvuTzdi45
         MBb70raS8VZcoFiz0rkz7WkvjEuZsjGh5OOXlCTMzTXzV3/0UHXnCkpTlfWWkY4kaV76
         xNlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yH5g66y79L9H25uzVilhEw52pa/PdLgYYJLVxPnNFwE=;
        b=ff5WtCRhN4ObSTpnbbbW+1mFJdPE4FTOGnDrKZMbAALn7paBHKDWNKLIl7IvdBNGnU
         PATxYeh1PGoSZPHo3ROc6ljt2PZz31cNBuKOgLKPPoY6EH0C9C04dKgGWLY4qcJaxC2o
         Ij//aUNvm1cLvuKRJiHMTXawrwVOqtM8Ct8EohOJsTFq95xcpaNTEZApLG6ixPz7blz5
         Cwo6Jm1LGdgoCzElC+RkvdRcOxlKD/Rzm87g2wFOWg6UrG/fmqyV3HexyKMHHUJ98aIN
         I+8dUZ19cYg+AaQBLQkaUMVyvUsVM+aBQb8BE6GulZb64sBi/Fcs4X0zPYu8t9j/hXim
         8+yA==
X-Gm-Message-State: AOAM531xEmRMMvh3NJV4OqEGERkfm3f10adv6lTQNRRcMvR81+z8NsGD
	ZN9uNPY4izoRuoyd51X1j3ndp0nwnbsFk0jhqkaHHA==
X-Google-Smtp-Source: ABdhPJyWBUWTR4y/5fMrTK3+S6BvM654Efr4KgJCYniLU5jnvNzUGHEt9kiGhurqZJyemkylUhU6vcGjF4u5FG6d6rk=
X-Received: by 2002:a65:6a0a:: with SMTP id m10mr1199403pgu.82.1628726007667;
 Wed, 11 Aug 2021 16:53:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210811201450.31366-1-martin@kaiser.cx> <20210811201450.31366-3-martin@kaiser.cx>
In-Reply-To: <20210811201450.31366-3-martin@kaiser.cx>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Thu, 12 Aug 2021 00:53:16 +0100
Message-ID: <CAA=Fs0n0U62cZADeEGXD7HUYzCXpZuHXGZZruztNoTeShFw5aA@mail.gmail.com>
Subject: Re: [PATCH 3/5] staging: r8188eu: (trivial) remove a duplicate debug print
To: Martin Kaiser <martin@kaiser.cx>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Dan Carpenter <dan.carpenter@oracle.com>, Michael Straube <straube.linux@gmail.com>, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Aug 2021 at 21:15, Martin Kaiser <martin@kaiser.cx> wrote:
>
> Keep the one that shows the wakeup capability.
>
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>  drivers/staging/r8188eu/os_dep/usb_intf.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
> index 4bf89b78a74a..6e4bf623f788 100644
> --- a/drivers/staging/r8188eu/os_dep/usb_intf.c
> +++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
> @@ -624,7 +624,6 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
>                 dvobj->pusbdev->do_remote_wakeup = 1;
>                 pusb_intf->needs_remote_wakeup = 1;
>                 device_init_wakeup(&pusb_intf->dev, 1);
> -               DBG_88E("\n  padapter->pwrctrlpriv.bSupportRemoteWakeup~~~~~~\n");
>                 DBG_88E("\n  padapter->pwrctrlpriv.bSupportRemoteWakeup~~~[%d]~~~\n",
>                         device_may_wakeup(&pusb_intf->dev));
>         }
> --
> 2.20.1
>

Dear Martin,

Just my personal opinion, but I'd be inclined to strip out all DBG_88E
calls totally. If there are necessary functions being called such as
device_may_wakeup() we can always just keep this part and remove the
macro call (not checked this function out myself yet). Thanks.

Regards,
Phil
