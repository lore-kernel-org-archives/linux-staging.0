Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131C23FC6
	for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 00:09:00 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id k14so18164623pga.13
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 17:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8x3/UqQR8bd8C1qjUbEbZOd8gxC4pFu+vpKcAnvRE5w=;
        b=VesUANvK36el3h6wmJIezyhO4FnEsqkNYKFTws6PZkkPtk1G8++WNn7OUXDrQyYNLg
         rJqdwSUv3BgSIK+kzlmK28i7DyrRn7RKvmterBq/eDBkF7VUNsZgCmMAYwt5c9AsdbAj
         tzpOAWVdaPKOXlfG8cjMzs70rQBOTSmei/2w0lkBKkXFcAH0HGT9Wb5STG2YlLt3AZPE
         6dTl/PhE0e6AolaK0s65duAqLVEOhIF9y7DdmCRp/ygm4wo8nUjilY8kjCkaS9ae866j
         kE4UpRrd3h5jVwtm9Uy/BmjTAwhazVNWQpilNisRFa791YtK9exlyJfET5+mGZIxUnBB
         HMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8x3/UqQR8bd8C1qjUbEbZOd8gxC4pFu+vpKcAnvRE5w=;
        b=J7LLNlfQA+lQyClrhCQctw24MHrlxYx098cCWFTHwqcttKcNpRwLw9innZsWREXqQA
         GfcB9JvhnjQ/hnZaSKIY+tpQdHOeFRhrVNp5AJi9HzDMCUVBG2rX5strS5wIqRdRX7U3
         jQbBfjWiEBWW9+o4RWOFiDSMDa2koZ1k62U9Xa8t29DPrTQIo9GTHfxXTDCqMetmfuwc
         CbrkqaCaqTgsPrY3tn3qmgFso44zVqgQXlGV95e9b4n6GmeC+p/2XcHv/Yhs/3tpTi18
         FKH3gD4MU/cfivraNIUvmZGOBOBY4pYY6a3MhJSlTQxTHsxAdp/BrYAUGaB017yvoyyT
         RMPg==
X-Gm-Message-State: AOAM531/DORjbVM91yxWfJRhCjmvsZq9UbWaOn1RDqwl6lOyi3OeF0ca
	f2hRPgE9GCgzlAvtZcGxMNytcuU+KaKxeiRxsHBdoA==
X-Google-Smtp-Source: ABdhPJz4A8FpV6mxFhCg2sNgTcbZImvVPl0UNcUCu4Wv2YZyB6yhgFRUvkH/IRicjeI8egBSQHCY0yUtpyhTmWAfsjE=
X-Received: by 2002:a63:aa43:: with SMTP id x3mr34608690pgo.208.1629763740430;
 Mon, 23 Aug 2021 17:09:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210823223751.25104-1-fmdefrancesco@gmail.com> <20210823223751.25104-2-fmdefrancesco@gmail.com>
In-Reply-To: <20210823223751.25104-2-fmdefrancesco@gmail.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Tue, 24 Aug 2021 01:08:49 +0100
Message-ID: <CAA=Fs0ki91VvBOd2Wd59KqeCN+BmF-eWv+r0sH+e3fUG61Zxsg@mail.gmail.com>
Subject: Re: [PATCH 1/2] staging: r8188eu: Use usb_control_msg_recv/send() in usbctrl_vendorreq()
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Pavel Skripkin <paskripkin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Aug 2021 at 23:38, Fabio M. De Francesco
<fmdefrancesco@gmail.com> wrote:
>
> Replace usb_control_msg() with the new usb_control_msg_recv() and
> usb_control_msg_send() API of USB Core in usbctrl_vendorreq().
>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
>
> Thanks to Pavel Skripkin <paskripkin@gmail.com> for his review of the
> RFC patch.
>
> drivers/staging/r8188eu/hal/usb_ops_linux.c | 25 ++++++++++-----------
> 1 file changed, 12 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> index a93d5cfe4635..6f51660b967a 100644
> --- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
> +++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> @@ -15,9 +15,8 @@ static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata,
>         struct adapter  *adapt = pintfhdl->padapter;
>         struct dvobj_priv  *dvobjpriv = adapter_to_dvobj(adapt);
>         struct usb_device *udev = dvobjpriv->pusbdev;
> -       unsigned int pipe;
> +       u8 pipe;
>         int status = 0;
> -       u8 reqtype;
>         u8 *pIo_buf;
>         int vendorreq_times = 0;
>
> @@ -44,22 +43,22 @@ static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata,
>         }
>
>         while (++vendorreq_times <= MAX_USBCTRL_VENDORREQ_TIMES) {
> -               memset(pIo_buf, 0, len);
> -
>                 if (requesttype == 0x01) {
> -                       pipe = usb_rcvctrlpipe(udev, 0);/* read_in */
> -                       reqtype =  REALTEK_USB_VENQT_READ;
> +                       status = usb_control_msg_recv(udev, pipe, REALTEK_USB_VENQT_CMD_REQ,
> +                                                     REALTEK_USB_VENQT_READ, value,
> +                                                     REALTEK_USB_VENQT_CMD_IDX,
> +                                                     pIo_buf, len, RTW_USB_CONTROL_MSG_TIMEOUT,
> +                                                     GFP_KERNEL);
>                 } else {
> -                       pipe = usb_sndctrlpipe(udev, 0);/* write_out */
> -                       reqtype =  REALTEK_USB_VENQT_WRITE;
>                         memcpy(pIo_buf, pdata, len);
> +                       status = usb_control_msg_send(udev, pipe, REALTEK_USB_VENQT_CMD_REQ,
> +                                                     REALTEK_USB_VENQT_WRITE, value,
> +                                                     REALTEK_USB_VENQT_CMD_IDX,
> +                                                     pIo_buf, len, RTW_USB_CONTROL_MSG_TIMEOUT,
> +                                                     GFP_KERNEL);
>                 }
>
> -               status = usb_control_msg(udev, pipe, REALTEK_USB_VENQT_CMD_REQ,
> -                                        reqtype, value, REALTEK_USB_VENQT_CMD_IDX,
> -                                        pIo_buf, len, RTW_USB_CONTROL_MSG_TIMEOUT);
> -
> -               if (status == len) {   /*  Success this control transfer. */
> +               if (!status) {   /*  Success this control transfer. */
>                         rtw_reset_continual_urb_error(dvobjpriv);
>                         if (requesttype == 0x01)
>                                 memcpy(pdata, pIo_buf,  len);
> --
> 2.32.0
>

Dear Fabio,

Thanks for the patch. Sorry, but for some reason with my N10-Nano I
can't get a connection at all with this patch applied - it just won't
associate with my network. Interface shows up and no OOPS in log, but
just disassociates/no IP address/interface down etc. so perhaps
semantics differ slightly here somehow? Tried two separate
rollbacks/builds/runs just to make sure I wasn't losing my mind :-)

Regards,
Phil
