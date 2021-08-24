Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7D63FC6
	for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 00:10:27 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id n13-20020a17090a4e0d00b0017946980d8dso586043pjh.5
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 17:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZfWVzktMxFBUosQGWhnlqAx2+R7s6/uzKrDuyrsA6Zk=;
        b=nQO0ffTc32SuK+wMgVV8kHaRDBEj4A1+rBEoC9gcIPVTBnGpXuubkX1GTd1fJqTf0l
         uEByUl8HHv6buPU66HzPp3RgEOAAnANMzbHMZYKoOmznUpxyueGeV1Cn3hkaOHLmYIVs
         bHmxxFiycZ4Cn4tDhQHgZXg73HCY3vjL/OkV0Ay9/GwO9pv+F+De8Wefu5jQwwWh1GQ2
         fMD/OUsiLE5XiRVjwith1QQgzErlxq+1+t+QE03q2V0yxz/BYFJZmpKqRCyOKgUTt+5X
         on4AlB1cZsz1SNvU7U/zTZTcW6iAlARC6JKqzs/ZX8sMIX9IS0EXACfotjIHXnrzpsed
         VQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZfWVzktMxFBUosQGWhnlqAx2+R7s6/uzKrDuyrsA6Zk=;
        b=fCNP3Ze7Pk9CvwQTl00/439+z5+xKJh+cwIdNJtrrGSbk7Gn4ccuN4Y98D8e4Rz+qM
         ExkyeQrqCGYKBTySGwyKBPy9Zes3QCre2ceAZCkDzZEell/9jSndxAYkuuY9wlhGL1Nb
         vBWD06bAweP+E/pKnJ9djYdI2VBSvVhwdgpXhZ+jc77v/ZCT9JDCvCGTbH1WZDiQt/XW
         GVBKEulJuqP/sPTyeodI03VXGRoSK5vBTTrvpb9Py/SY+GV4Wkmhm40wrM14teoHFSQH
         0mzf7Of40HvFFU5FWx8LX9EuQckGVhpHenKArRSxJCBY87XTFkSkGhBtM4XonojKDuKx
         XEKQ==
X-Gm-Message-State: AOAM531VsOrjj5mBE8qh2HiB1l24ABYM7T5LjlYDSZQWIGakdOReXqOw
	0NNZoXclESz3trB+1b0H2wAiPuK9s17re/TLT4ZDPw==
X-Google-Smtp-Source: ABdhPJz0osPWjjqPuM9YoEuEcJ79AQYgo995Kfx9wULAdaa/Z92FhkhBAXEY0AAgcp08lhZ7Gwk89H9TcmuyKL7egPg=
X-Received: by 2002:a17:90a:1f49:: with SMTP id y9mr1185534pjy.225.1629763827280;
 Mon, 23 Aug 2021 17:10:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210823223751.25104-1-fmdefrancesco@gmail.com> <20210823223751.25104-3-fmdefrancesco@gmail.com>
In-Reply-To: <20210823223751.25104-3-fmdefrancesco@gmail.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Tue, 24 Aug 2021 01:10:16 +0100
Message-ID: <CAA=Fs0nzTtbvo7FH4FmUNcKy4a20r35QtbPYY_H9LbP-FdURSw@mail.gmail.com>
Subject: Re: [PATCH 2/2] staging: r8188eu: Make some clean-ups in usbctrl_vendorreq()
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Pavel Skripkin <paskripkin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Aug 2021 at 23:38, Fabio M. De Francesco
<fmdefrancesco@gmail.com> wrote:
>
> After replacing usb_control_msg() with the new usb_control_msg_recv() and
> usb_control_msg_send() API of USB Core, remove camelcase from the pIo_buf
> variable that is passed as argument to the new API and remove the initial
> 'p' (that probably stands for "pointer") from the same pIo_buf and from
> the pintfhdl and pdata arguments of usbctrl_vendorreq().
>
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
>  drivers/staging/r8188eu/hal/usb_ops_linux.c | 26 ++++++++++-----------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> index 6f51660b967a..5ce31ae18ed8 100644
> --- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
> +++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> @@ -10,14 +10,14 @@
>  #include "../include/recv_osdep.h"
>  #include "../include/rtl8188e_hal.h"
>
> -static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata, u16 len, u8 requesttype)
> +static int usbctrl_vendorreq(struct intf_hdl *intfhdl, u16 value, void *data, u16 len, u8 requesttype)
>  {
> -       struct adapter  *adapt = pintfhdl->padapter;
> +       struct adapter  *adapt = intfhdl->padapter;
>         struct dvobj_priv  *dvobjpriv = adapter_to_dvobj(adapt);
>         struct usb_device *udev = dvobjpriv->pusbdev;
>         u8 pipe;
>         int status = 0;
> -       u8 *pIo_buf;
> +       u8 *io_buf;
>         int vendorreq_times = 0;
>
>         if ((adapt->bSurpriseRemoved) || (adapt->pwrctrlpriv.pnp_bstop_trx)) {
> @@ -34,10 +34,10 @@ static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata,
>         mutex_lock(&dvobjpriv->usb_vendor_req_mutex);
>
>         /*  Acquire IO memory for vendorreq */
> -       pIo_buf = dvobjpriv->usb_vendor_req_buf;
> +       io_buf = dvobjpriv->usb_vendor_req_buf;
>
> -       if (!pIo_buf) {
> -               DBG_88E("[%s] pIo_buf == NULL\n", __func__);
> +       if (!io_buf) {
> +               DBG_88E("[%s] io_buf == NULL\n", __func__);
>                 status = -ENOMEM;
>                 goto release_mutex;
>         }
> @@ -47,25 +47,25 @@ static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata,
>                         status = usb_control_msg_recv(udev, pipe, REALTEK_USB_VENQT_CMD_REQ,
>                                                       REALTEK_USB_VENQT_READ, value,
>                                                       REALTEK_USB_VENQT_CMD_IDX,
> -                                                     pIo_buf, len, RTW_USB_CONTROL_MSG_TIMEOUT,
> +                                                     io_buf, len, RTW_USB_CONTROL_MSG_TIMEOUT,
>                                                       GFP_KERNEL);
>                 } else {
> -                       memcpy(pIo_buf, pdata, len);
> +                       memcpy(io_buf, data, len);
>                         status = usb_control_msg_send(udev, pipe, REALTEK_USB_VENQT_CMD_REQ,
>                                                       REALTEK_USB_VENQT_WRITE, value,
>                                                       REALTEK_USB_VENQT_CMD_IDX,
> -                                                     pIo_buf, len, RTW_USB_CONTROL_MSG_TIMEOUT,
> +                                                     io_buf, len, RTW_USB_CONTROL_MSG_TIMEOUT,
>                                                       GFP_KERNEL);
>                 }
>
>                 if (!status) {   /*  Success this control transfer. */
>                         rtw_reset_continual_urb_error(dvobjpriv);
>                         if (requesttype == 0x01)
> -                               memcpy(pdata, pIo_buf,  len);
> +                               memcpy(data, io_buf,  len);
>                 } else { /*  error cases */
>                         DBG_88E("reg 0x%x, usb %s %u fail, status:%d value=0x%x, vendorreq_times:%d\n",
>                                 value, (requesttype == 0x01) ? "read" : "write",
> -                               len, status, *(u32 *)pdata, vendorreq_times);
> +                               len, status, *(u32 *)data, vendorreq_times);
>
>                         if (status < 0) {
>                                 if (status == (-ESHUTDOWN) || status == -ENODEV) {
> @@ -77,8 +77,8 @@ static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata,
>                         } else { /*  status != len && status >= 0 */
>                                 if (status > 0) {
>                                         if (requesttype == 0x01) {
> -                                               /*  For Control read transfer, we have to copy the read data from pIo_buf to pdata. */
> -                                               memcpy(pdata, pIo_buf,  len);
> +                                               /*  For Control read transfer, we have to copy the read data from io_buf to data. */
> +                                               memcpy(data, io_buf,  len);
>                                         }
>                                 }
>                         }
> --
> 2.32.0
>

Dear Fabio,

This one doesn't apply at all for me - it may just be because of the
churn in my local tree though, I don't have all previous patches
applied as I've been testing select series etc. Many thanks.

Regards,
Phil
