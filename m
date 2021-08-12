Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A486D13
	for <linux-staging@lists.linux.dev>; Thu, 12 Aug 2021 21:16:09 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id a20so9112807plm.0
        for <linux-staging@lists.linux.dev>; Thu, 12 Aug 2021 14:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WyarTx/bV9rblC65snb3qvytdBQ7XGyyP0s6efBhIqA=;
        b=rYySSj0VwvwfzRfA2inQGsoF5d5tVMHmp3wsktT+vwPuUuEaJiIcektHIBKiXvot98
         CJNM36xypN8Dmk1qwV77xlpIs3uoFFka1CM1/KdLt3mAb9Gl3nlanWtLtiMHciUHI6+2
         0GDoEPNO7RWQj9AqoWjzq94TOqT4KLoEvHEjVSjuOJP5MrXg41lKnVMO/vc/GMKVBsUz
         Q2gbtNNMLVZ54kQAF5OwRwnP3bQWp0xzITlJXUDh4vHscUQ4b6OyxVaxRYJ8ijbeDL0b
         AB0s7Y/tubMc8rG/rr8l1tFXBisNucRK/JEzHHR8sM+jj8U66HI3iA3UeKDFXEcHyOtH
         iksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WyarTx/bV9rblC65snb3qvytdBQ7XGyyP0s6efBhIqA=;
        b=oQSSjqpOksBLdrSsdSu3Oz98thxAX5KTAjkMF3IJTK5y9SPBpRSQMVX5AvFfl5VzuA
         r+IVRcU3UHY4l/9wXq5bezAqyhB60niKvfAeNIv9y3KFp1gaEUv9O4xBS3cWEmaQCshA
         Nl5ZXyfmKVLvXQu51XqK/v0vqAQpaA6IlHKg9LqHDrr0/XTKlmt0SQG2PaFGzo1bSCIn
         pq9Ege3RpGgU1fSWWCMyVTK2eNPkQg97nBy9QmmpEp1e1NYk9LaJHSnC2/KOtUPCPHQF
         nO9gBXsT1fC3RJ5C4q5/I27+/0haqfnaUbAvnAJNahUtbO3rcMoqiYn6BgljbIT5a2+v
         egiQ==
X-Gm-Message-State: AOAM533eAtx4IHubU/dX8i3JeABbT5mcGvRIcyATEEw5jpZt2MRHKJ4X
	kIufSD471syF/i6CDjRp9FN63hHxDh9acz/flbZWAA==
X-Google-Smtp-Source: ABdhPJw3xkP2I4v+8GX4co+V0ZlshS24c/1y1thLN3EojyeCkmdZUycMogvOn/eTIjMciEwdhgoJo9fUjOoxjtLXeyM=
X-Received: by 2002:a63:aa43:: with SMTP id x3mr5645795pgo.208.1628802969580;
 Thu, 12 Aug 2021 14:16:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210812204027.338872-1-nathan@kernel.org> <20210812204027.338872-4-nathan@kernel.org>
In-Reply-To: <20210812204027.338872-4-nathan@kernel.org>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Thu, 12 Aug 2021 22:15:58 +0100
Message-ID: <CAA=Fs0k00kWr-e+40uMVQy9gNfnYy+znaQ4OS5XqE4ouc4fpmg@mail.gmail.com>
Subject: Re: [PATCH 3/3] staging: r8188eu: Reorganize error handling in rtw_drv_init()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Nick Desaulniers <ndesaulniers@google.com>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Aug 2021 at 21:40, Nathan Chancellor <nathan@kernel.org> wrote:
>
> After commit 987219ad34a6 ("staging: r8188eu: remove lines from Makefile
> that silence build warnings"), clang warns:
>
> drivers/staging/r8188eu/os_dep/usb_intf.c:726:6: warning: variable
> 'status' is used uninitialized whenever 'if' condition is true
> [-Wsometimes-uninitialized]
>         if (!if1) {
>             ^~~~
> drivers/staging/r8188eu/os_dep/usb_intf.c:741:6: note: uninitialized use
> occurs here
>         if (status != _SUCCESS)
>             ^~~~~~
> drivers/staging/r8188eu/os_dep/usb_intf.c:726:2: note: remove the 'if'
> if its condition is always false
>         if (!if1) {
>         ^~~~~~~~~~~
> drivers/staging/r8188eu/os_dep/usb_intf.c:714:12: note: initialize the
> variable 'status' to silence this warning
>         int status;
>                   ^
>                    = 0
> 1 warning generated.
>
> status is not initialized if the call to usb_dvobj_init() or
> rtw_usb_if1_init() fails.
>
> Looking at the error function as a whole, the error handling is odd
> compared to the rest of the kernel, which prefers to set error codes on
> goto paths, rather than a global "status" variable which determines the
> error code at the end of the function and function calls in the case of
> error.
>
> Rearrange the error handling of this function to bring it more inline
> with how the kernel does it in most cases, which helps readability.
>
> The call to rtw_usb_if1_deinit() is eliminated because it is not
> possible to ever hit it; if rtw_usb_if1_init() fails, the goto call
> jumps over the call to rtw_usb_if1_deinit() and in the success case,
> status is set to _SUCCESS.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/staging/r8188eu/os_dep/usb_intf.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
> index a462cb6f3005..667f41125a87 100644
> --- a/drivers/staging/r8188eu/os_dep/usb_intf.c
> +++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
> @@ -704,20 +704,23 @@ static void rtw_usb_if1_deinit(struct adapter *if1)
>  static int rtw_drv_init(struct usb_interface *pusb_intf, const struct usb_device_id *pdid)
>  {
>         struct adapter *if1 = NULL;
> -       int status;
>         struct dvobj_priv *dvobj;
> +       int ret;
>
>         /* step 0. */
>         process_spec_devid(pdid);
>
>         /* Initialize dvobj_priv */
>         dvobj = usb_dvobj_init(pusb_intf);
> -       if (!dvobj)
> -               goto exit;
> +       if (!dvobj) {
> +               ret = -ENODEV;
> +               goto err;
> +       }
>
>         if1 = rtw_usb_if1_init(dvobj, pusb_intf);
>         if (!if1) {
>                 DBG_88E("rtw_init_primarystruct adapter Failed!\n");
> +               ret = -ENODEV;
>                 goto free_dvobj;
>         }
>
> @@ -726,15 +729,12 @@ static int rtw_drv_init(struct usb_interface *pusb_intf, const struct usb_device
>                 rtw_signal_process(ui_pid[1], SIGUSR2);
>         }
>
> -       status = _SUCCESS;
> +       return 0;
>
> -       if (status != _SUCCESS && if1)
> -               rtw_usb_if1_deinit(if1);
>  free_dvobj:
> -       if (status != _SUCCESS)
> -               usb_dvobj_deinit(pusb_intf);
> -exit:
> -       return status == _SUCCESS ? 0 : -ENODEV;
> +       usb_dvobj_deinit(pusb_intf);
> +err:
> +       return ret;
>  }
>
>  /*
> --
> 2.33.0.rc2
>

Looks good as far as I can see, nicely done. Thanks.

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
