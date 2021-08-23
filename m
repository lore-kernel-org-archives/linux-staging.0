Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F31A3FC0
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 10:47:49 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id u3so36102644ejz.1
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 03:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vDFsfAzgg8pTYEtlapSW0caiBmfQljPcziSOHOjY7/8=;
        b=l8EiydJYNtcZ5nx6fu/aA4H0DfERCiFxLFNgA/xyQx4LCFPYLRrh3cmB/RJHo/3Ri6
         w98Ln+WoptdDy2d5YJNdlp3FZ3PR5/D2v0a/rwrpnsUtl2ogcQD7ocqNqBAe0wZum4b5
         D+R5VNvc7nnN+BWRVoUTtW8KUBXFUTkzUhWByAl5GNvdVpgbIEL692+txN7W7nNxeQFq
         SuTiN9b4Qj59lFWnbuLhYPRTdAgP2Ui5Nbl8ftogz1+txQrNXJ0IfhFp+wZML2zan0fw
         +WksNkTob+t4Hs3Xxwf2PS1ipE/4rnRtRfPYSsnLAJn3sWQfL4Vwj0hh/ftzWWH2WQ1Z
         G87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vDFsfAzgg8pTYEtlapSW0caiBmfQljPcziSOHOjY7/8=;
        b=qgwwIb4Kninm/qmCZapDTUnH+l3mOZNCfSHe5pkHV4IE/xw1wntnAbQm+pS1jQSDqj
         7obQm1W9ctJpPFnPWfiRd1230AjEjyN6hpp30mR8GBbziXWNYumyq0Icqgd3dBw6naf+
         lXNxTKtcB4us4KIVn4i44J9CDVD34rYcaU5QbMZ6DnpBDC9i/SzPf06wJKkVBQpmG2kv
         0x25xTfom7doEwz++mmYS7xisKBCq3eQdVG0kOovjxDqWZH1DtIZrh1mLE4N34TXJNj8
         6Jl6gRtPf5WHTHDY/HPQIko8tbjD9nbXADiFQwKV572No0j1OSZjymUdEays+sltecS6
         gCqA==
X-Gm-Message-State: AOAM532blqg+rU+yAtH/SsNtiHBJlYlywwe6anT4ZcG/Zc8qiNh4he1C
	zdEL2Jrr/l+fGV37xb81HiM=
X-Google-Smtp-Source: ABdhPJzUgAYUMV7ZimkvzfBCbrfAVY8nvXGQlD+IMyLoWuKhnE1jrRfWvrUcGJYbI5TBA/pslJ+lsA==
X-Received: by 2002:a17:906:ad87:: with SMTP id la7mr8120604ejb.145.1629715667569;
        Mon, 23 Aug 2021 03:47:47 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id bx14sm4506257edb.93.2021.08.23.03.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 03:47:47 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, Pavel Skripkin <paskripkin@gmail.com>
Subject: Re: [PATCH RFC] staging: r8188eu: Use usb_control_msg_recv/send() in usbctrl_vendorreq()
Date: Mon, 23 Aug 2021 12:47:45 +0200
Message-ID: <8275282.m2tVFbhrJk@localhost.localdomain>
In-Reply-To: <69bbb80c-2b30-28b9-ad8c-6862a6c3b911@gmail.com>
References: <20210822230235.10953-1-fmdefrancesco@gmail.com> <69bbb80c-2b30-28b9-ad8c-6862a6c3b911@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Monday, August 23, 2021 10:11:52 AM CEST Pavel Skripkin wrote:
> On 8/23/21 2:02 AM, Fabio M. De Francesco wrote:
> > Replace usb_control_msg() with the new usb_control_msg_recv() and
> > usb_control_msg_send() API of USB Core.
> > 
> > This patch is an RFC for different reasons:
> > 
> > 1) I'm not sure if it is needed: while Greg Kroah-Hartman suggested to
> > use the new API in a message to a thread that was about a series of patches
> > submitted by Pavel Skripkin (who decided to not use it), I cannot explain
> > if and why the driver would benefit from this patch.
> > 2) I have doubts about the semantic of the API I use here, so I'd like to
> > know whether or not I'm using them properly.
> > 3) At the moment I cannot test the driver because I don't have my device
> > with me.
> > 4) This patch could probably lead to a slight change in some lines of
> > Pavel's series (for sure in usb_read*()).
> > 
> > I'd like to hear from the Maintainers and other interested people if this
> > patch is worth to be considered and, in this case, if there are suggestions
> > for the purpose to improve it.
> > 
> > Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> >   drivers/staging/r8188eu/hal/usb_ops_linux.c | 19 ++++++++++---------
> >   1 file changed, 10 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> > index 6a0a24acf292..9e290c1cc449 100644
> > --- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
> > +++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> > @@ -15,7 +15,7 @@ static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata,
> >   	struct adapter	*adapt = pintfhdl->padapter;
> >   	struct dvobj_priv  *dvobjpriv = adapter_to_dvobj(adapt);
> >   	struct usb_device *udev = dvobjpriv->pusbdev;
> > -	unsigned int pipe;
> > +	u8 pipe;
> >   	int status = 0;
> >   	u8 reqtype;
> 
> I think, we can pass REALTEK_USB_VENQT_{READ,WRITE} directly as 
> requesttype argument and get rid of u8 reqtype. + we can define these 
> macros:
> 
> #define
> usbctrl_vendor_read(...)   usbctrl_vendorreq(...,REALTEK_USB_VENQT_READ)
> 
> 
> #define
> usbctrl_vendor_write()    usbctrl_vendorreq(...,REALTEK_USB_VENQT_WRITE)
> 
> 
> This will make code more nice, IMO  :)

Dear Pavel,

I agree in full: nicer and cleaner :)

I'll do that, but please notice that I will also need to change the code of the three 
usb_read*() for calling usbctrl_vendor_read(). Furthermore, "else res = 0;" becomes
unnecessary. Please take these changes into account when you'll send them again
as "regular" patches.

> (Sorry for this formatting, my email client disabled "paste without 
> formatting" option)

Actually I don't see any oddities in the format of your message :)

> >   	u8 *pIo_buf;
> > @@ -47,19 +47,20 @@ static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void *pdata,
> >   		memset(pIo_buf, 0, len);
> >   
> >   		if (requesttype == 0x01) {
> > -			pipe = usb_rcvctrlpipe(udev, 0);/* read_in */
> >   			reqtype =  REALTEK_USB_VENQT_READ;
> > +			status = usb_control_msg_recv(udev, pipe, REALTEK_USB_VENQT_CMD_REQ,
> > +						      reqtype, value, REALTEK_USB_VENQT_CMD_IDX,
> > +						      pIo_buf, len, RTW_USB_CONTROL_MSG_TIMEOUT,
> > +						      GFP_KERNEL);
> >   		} else {
> > -			pipe = usb_sndctrlpipe(udev, 0);/* write_out */
> >   			reqtype =  REALTEK_USB_VENQT_WRITE;
> > -			memcpy(pIo_buf, pdata, len);
> 
> I guess, this memcpy is needed, since we want to send data from pdata

Oh, dear! How could I have missed that? Two alternatives: either because of working 
during bedtime, or I'm definitely losing my mind... :(
 
> 
> > +			status = usb_control_msg_send(udev, pipe, REALTEK_USB_VENQT_CMD_REQ,
> > +						      reqtype, value, REALTEK_USB_VENQT_CMD_IDX,
> > +						      pIo_buf, len, RTW_USB_CONTROL_MSG_TIMEOUT,
> > +						      GFP_KERNEL);
> >   		}
> >   
> > -		status = usb_control_msg(udev, pipe, REALTEK_USB_VENQT_CMD_REQ,
> > -					 reqtype, value, REALTEK_USB_VENQT_CMD_IDX,
> > -					 pIo_buf, len, RTW_USB_CONTROL_MSG_TIMEOUT);
> > -
> > -		if (status == len) {   /*  Success this control transfer. */
> > +		if (!status) {   /*  Success this control transfer. */
> >   			rtw_reset_continual_urb_error(dvobjpriv);
> >   			if (requesttype == 0x01)
> >   				memcpy(pdata, pIo_buf,  len);
> > 
> 
> 
> With regards,
> Pavel Skripkin

Thanks for you review, I really appreciate it.

Regards,

Fabio

P.S.: As I wrote, I have not my ASUS N10 Nano with me and I won't have the opportunity
to test this as well as any other patch until the end of August. I hope to not break anything.
If somebody has time to test the final patch that I'm going to submit, I'd really appreciate it.


