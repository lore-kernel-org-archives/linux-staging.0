Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A8D70
	for <linux-staging@lists.linux.dev>; Wed, 11 Aug 2021 23:50:52 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id g12-20020a17090a7d0cb0290178f80de3d8so7630037pjl.2
        for <linux-staging@lists.linux.dev>; Wed, 11 Aug 2021 16:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HEga9V3w054sVWObR8faNCjdILL695VoP9rSy8xFIWo=;
        b=1VDZXLD2+/AyA1j2CUlow20YJ/V4hGd64IsPjmRUEe0vG+LNr+GEpRpuQj3RsqhheJ
         3rKRN1OQykWmQu/jUlMOjJvtsVKRPZApVX8mVPonnIZk78X1eb4NDS6sNf29XIy68/Iq
         R7WHtWRaVh0NnYuIq/XH6ZrW3fmUbzKecRAZqlgCzZFhZRpmFPWfri36H/Q5cYym7RAP
         UPhMCZvnrw1aKGl845110bGqsECF4Joc6+aPvZh0/RcEqKWRWTuX+cqv3qdhl011Ar8O
         BK1byFRlwg0dTB9vaYFGSR0Ze3aOiG83NiVOkalwLg3d/hfQBoFCmYl/LQaA1qvk6Ghf
         Jhig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HEga9V3w054sVWObR8faNCjdILL695VoP9rSy8xFIWo=;
        b=LKVBtm783yE/ntyy7T7o5ZCLANl/q59P90EXoX2wO3mUUw37cDmw8hokEmuiS+JcaA
         47frlDCvazXcr7m0x4t7Fuy5SEx7EBMl0WkbwXJZ7MXf5INrsmRvANIZ9uqmU/eHWcJX
         bR4XZFjOJkqb+akYbB2XopfgW8KUoAvhTMQ9IDL1RfHP2yZ/AEPE60OdcSAbsqQhM9mD
         r+/3oCssTV6HEJA3Iyr44qHGZt//mQgp2vm2j291uBzNFt7e1L8QtaIUTQ99Iym7dWe2
         i2uBnGOnqkaoJqRoTrssypNT8619//8lrAWzZogUIJ2kvcDrwR4RoBugCrMqVnnhXLSt
         o9vA==
X-Gm-Message-State: AOAM530HVWXc+ZPQuFWf4I5ibFYbJZwdtQlyO5KQ85/XJkEIfvpQixgd
	pg2yKTASzD9WWG8ibZ9QSJAMRgKC3QRN3EdmulhNEw==
X-Google-Smtp-Source: ABdhPJyspPyR7V1yxh9d7KLVIgcebLMBHtTy18nFu1WajssrMJz+HL1/hzmEVKFVwf//FLZbzWm3YZSPzQUf6kkZwx0=
X-Received: by 2002:a17:902:8c81:b029:12c:ee37:3f58 with SMTP id
 t1-20020a1709028c81b029012cee373f58mr1065401plo.45.1628725852571; Wed, 11 Aug
 2021 16:50:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210811201450.31366-1-martin@kaiser.cx> <20210811201450.31366-2-martin@kaiser.cx>
In-Reply-To: <20210811201450.31366-2-martin@kaiser.cx>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Thu, 12 Aug 2021 00:50:41 +0100
Message-ID: <CAA=Fs0kYeHsuAUPXZGpkuo4w5WKwjFDR8vURxSDGHZ-nFtZfyA@mail.gmail.com>
Subject: Re: [PATCH 2/5] staging: r8188eu: remove unused function parameters
To: Martin Kaiser <martin@kaiser.cx>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Dan Carpenter <dan.carpenter@oracle.com>, Michael Straube <straube.linux@gmail.com>, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Aug 2021 at 21:15, Martin Kaiser <martin@kaiser.cx> wrote:
>
> rtw_usb_if1_init and chip_by_usb_id do not need a
> struct usb_device_id parameter.
>
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>  drivers/staging/r8188eu/os_dep/usb_intf.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
> index 8f1e33d2fff7..4bf89b78a74a 100644
> --- a/drivers/staging/r8188eu/os_dep/usb_intf.c
> +++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
> @@ -250,8 +250,7 @@ static void usb_dvobj_deinit(struct usb_interface *usb_intf)
>
>  }
>
> -static void chip_by_usb_id(struct adapter *padapter,
> -                          const struct usb_device_id *pdid)
> +static void chip_by_usb_id(struct adapter *padapter)
>  {
>         padapter->chip_type = NULL_CHIP_TYPE;
>         hal_set_hw_type(padapter);
> @@ -569,7 +568,7 @@ int rtw_resume_process(struct adapter *padapter)
>   */
>
>  static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
> -       struct usb_interface *pusb_intf, const struct usb_device_id *pdid)
> +       struct usb_interface *pusb_intf)
>  {
>         struct adapter *padapter = NULL;
>         struct net_device *pnetdev = NULL;
> @@ -587,7 +586,7 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
>
>         /* step 1-1., decide the chip_type via vid/pid */
>         padapter->interface_type = RTW_USB;
> -       chip_by_usb_id(padapter, pdid);
> +       chip_by_usb_id(padapter);
>
>         if (rtw_handle_dualmac(padapter, 1) != _SUCCESS)
>                 goto free_adapter;
> @@ -722,7 +721,7 @@ static int rtw_drv_init(struct usb_interface *pusb_intf, const struct usb_device
>         if (!dvobj)
>                 goto exit;
>
> -       if1 = rtw_usb_if1_init(dvobj, pusb_intf, pdid);
> +       if1 = rtw_usb_if1_init(dvobj, pusb_intf);
>         if (!if1) {
>                 DBG_88E("rtw_init_primarystruct adapter Failed!\n");
>                 goto free_dvobj;
> --
> 2.20.1
>

Dear Martin,

Looks good.

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
