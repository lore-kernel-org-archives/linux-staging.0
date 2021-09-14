Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907B53FC3
	for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 12:55:49 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id bt14so28711855ejb.3
        for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 05:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WGC4R8+TCrwsk8jUyujs7YCwt7cCpSEx6KAtmzDpy4U=;
        b=Q+L5kQBtZZ+cnyz+4OO/oeqEHGFS7pkCA+YGjH9kYyTHmthFAR01fPD9JsmFyBuZA+
         XFexmEarc1fe37+KnVsI6+XasXwme8WEytgREOaitwiLjgBJq3cqk7Nsb7TwGuVR5kG5
         f+JDiTf2ww/Xytx3sRXfgIu3vk1wZ2mihev3MuRK28oquFnIBy09mWAfKy6MJDpryKNb
         rFvtv6uhmftk6jjdN/a9i1E0G89uMfBIlUHrmebz3V1voDjujE78c9QnjOVsUOwCc7gF
         6aR6FEhSg+UFqr9UGEv9i3/jTEyxKGugWA06GwmNyHSX05RFRKw/TtanASZqMe/HbHFj
         ENxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WGC4R8+TCrwsk8jUyujs7YCwt7cCpSEx6KAtmzDpy4U=;
        b=oz1VOXcj9HKY4nMhhfDAmWEdHjwzmgbXi7fZkuOHjZ5LlsiU50ZT8YTJz+drQVP1ut
         9FOnKUschmFykzzFO2hBJxfgYgGgr4PO8r7HSAXzGp8tnEn4wR5oG9f8/ciRYkPmHm13
         5zZFZQ7mCefSP2D8MknU/A4fpU/bQ9Z1SwWjcHSslwf1MdQe9VyJeRm9lRzJYH31dVNO
         VySTlG5482/zoODJkX/E4f+4yM+UEzxJ+AslVFnIrJmAzFd3DqF/NvlnZfpIXaqeoefb
         GftUDH+bNfIYyaRm/OfKMXX0N3IgabSsbL7lU275NvQqrjrhTG1jm449iYPAL9gBjWP8
         IK9w==
X-Gm-Message-State: AOAM531xKSKEPAwaeWG/3MZKWKZraOKZtOVglBVHLXlLZGVslh4TxXk3
	oHjYyPFufSkdCzWQpQx7w4c=
X-Google-Smtp-Source: ABdhPJxFuUA9Yu8HgrGRJZiM/3YqAiLODtvRJE8/enZvzwzkyCMuOOPMu88aCmcGd2fVqvBblTBuGg==
X-Received: by 2002:a17:906:c1c9:: with SMTP id bw9mr18693801ejb.3.1631624147902;
        Tue, 14 Sep 2021 05:55:47 -0700 (PDT)
Received: from localhost.localdomain (host-79-43-5-131.retail.telecomitalia.it. [79.43.5.131])
        by smtp.gmail.com with ESMTPSA id p19sm4845600ejo.81.2021.09.14.05.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 05:55:47 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Michael Straube <straube.linux@gmail.com>, Pavel Skripkin <paskripkin@gmail.com>
Subject: Re: [PATCH v4 17/18] staging: r8188eu: Shorten calls chain of rtw_read8/16/32()
Date: Tue, 14 Sep 2021 14:55:45 +0200
Message-ID: <5747368.884CoaO9ss@localhost.localdomain>
In-Reply-To: <20210914093258.GC2088@kadam>
References: <20210913181002.16651-1-fmdefrancesco@gmail.com> <20210913181002.16651-18-fmdefrancesco@gmail.com> <20210914093258.GC2088@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Tuesday, September 14, 2021 11:32:58 AM CEST Dan Carpenter wrote:
> On Mon, Sep 13, 2021 at 08:10:01PM +0200, Fabio M. De Francesco wrote:
> > diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/
staging/r8188eu/hal/usb_ops_linux.c
> > index 04402bab805e..75475b0083db 100644
> > --- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
> > +++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> > @@ -89,6 +89,56 @@ static int usbctrl_vendorreq(struct intf_hdl *intfhd=
l,=20
u16 value, void *data, u1
> >  	return status;
> >  }
> > =20
> > +static int usb_read(struct intf_hdl *intfhdl, u16 addr, void *data, u8=
=20
size)
> > +{
> > +	int status;
> > +	u8 *io_buf; /* pointer to I/O buffer */
> > +	struct adapter *adapt =3D intfhdl->padapter;
> > +	struct dvobj_priv *dvobjpriv =3D adapter_to_dvobj(adapt);
> > +	struct usb_device *udev =3D dvobjpriv->pusbdev;
> > +
> > +	if (adapt->bSurpriseRemoved || adapt->pwrctrlpriv.pnp_bstop_trx)=20
{
> > +		status =3D -EPERM;
> > +		goto exit;
> > +	}
>=20
> Just return directly.
>=20
> 	if (adapt->bSurpriseRemoved || adapt->pwrctrlpriv.pnp_bstop_trx)
> 		return -EPERM;

Dear Dan,

I agree with you, I'll return it directly in v5.

> > +
> > +	mutex_lock(&dvobjpriv->usb_vendor_req_mutex);
> > +
> > +	io_buf =3D dvobjpriv->usb_vendor_req_buf;
> > +
> > +	status =3D usb_control_msg_recv(udev, 0, REALTEK_USB_VENQT_CMD_REQ,
> > +				      REALTEK_USB_VENQT_READ,=20
addr,
> > +				      REALTEK_USB_VENQT_CMD_IDX,=20
io_buf,
> > +				      size,=20
RTW_USB_CONTROL_MSG_TIMEOUT,
> > +				      GFP_KERNEL);
> > +	if (!status) {
> > +		/*  Success this control transfer. */
>=20
> It's always better to do error handling instead of success handling.

Yes, you're right again. I blindly followed the style that was in the parts=
=20
of the code of usbctrl_vendorreq() that I'm reusing here.
=20
> 	if (status) {
>=20
> Remove the comment because now it's in the standard format.

OK, those comments are not necessary: I'll remove them.

> > +		rtw_reset_continual_urb_error(dvobjpriv);
> > +		memcpy(data, io_buf, size);
> > +		goto mutex_unlock;
> > +	}
> > +	/*  error cases */
> > +	if (status =3D=3D (-ESHUTDOWN || -ENODEV || -ENOENT)) {
>=20
> 	if (status =3D=3D -ESHUTDOWN ||
> 	    status =3D=3D -ENODEV ||
> 	    status =3D=3D -ENOENT) {

This is a stupid mistake and Pavel soon noticed it. Yesterday I sent a=20
message to ask reviewers for disregarding v4 and wait for v5 with the fix o=
f=20
this test. :(

However, I noticed that usb_control_msg_recv() might return in "status" som=
e=20
recoverable errors (like -ENOMEM and others); so I guess that the code must=
=20
retry in a while loop (exactly as it did with usb_control_msg() in=20
usbctrl_vendorreq()).=20

Actually I'm not 100% sure that the "while" loop is needed. What I know is=
=20
that I've been using this version (with _no_ loop) for about a week, not le=
ss=20
than 12 hours a day and I didn't notice any problem...

Can you please tell if a loop for retries is *really* necessary?

>=20
> > +		/*
> > +		 * device or controller has been disabled due to
> > +		 * some problem that could not be worked around,
> > +		 * device or bus doesn=E2=80=99t exist, endpoint does not
> > +		 * exist or is not enabled.
> > +		 */
> > +		adapt->bSurpriseRemoved =3D true;
> > +			goto mutex_unlock;
>=20
> Indented wrong.

Yes, it must be fixed.

Regards,

=46abio

>=20
> > +	}
> > +	GET_HAL_DATA(adapt)->srestpriv.wifi_error_status =3D=20
USB_VEN_REQ_CMD_FAIL;
> > +	if (rtw_inc_and_chk_continual_urb_error(dvobjpriv)) {
> > +		adapt->bSurpriseRemoved =3D true;
> > +		goto mutex_unlock;
> > +	}
> > +mutex_unlock:
> > +	mutex_unlock(&dvobjpriv->usb_vendor_req_mutex);
> > +exit:
> > +	return status;
> > +}
>=20
> regards,
> dan carpenter
>


