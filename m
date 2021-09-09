Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE9272
	for <linux-staging@lists.linux.dev>; Thu,  9 Sep 2021 08:31:35 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id q11so1305456wrr.9
        for <linux-staging@lists.linux.dev>; Thu, 09 Sep 2021 01:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=rhQ+Sg+eJCdyIigz4yW70ETZ6kRtSTGVLdwqIyYFW5M=;
        b=hrzZdJdfcDUhak7xd/oVUPxlQrDu+2MbSGzh9LEyPJRdjxrexFYiWuptUMIspJaV8Y
         AmAMHNtGrQOh28/8HrCcYjJpTP2AWHoWRL4H6GsfI7JWOhlbQaBZ8HilKadd2NDmTwFC
         xHIdeeTZp5e04upiZmDzgD48OtzqpFu8sQWD+79Fn1oLqoAW7RzgZOQh2rET/Oe/29/7
         dyZKNOhX3pwdABwpeRMmV9jLppM/Dg0DvQFcCgwR8omz9bXh1DI/KaS5tLRpYW+/dLsE
         XnnVPDtlVE8yaN/RD74j8c+kRXrG1K2qdPXxWBEW5i6rIqucAnawYXZAsEQL+vgIr7sz
         mBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rhQ+Sg+eJCdyIigz4yW70ETZ6kRtSTGVLdwqIyYFW5M=;
        b=VVfRmXvx8bosz7+ykwGDhVaJs09NHJ7+ZDC+QF+xxHoVUxrgrSzmPbMEhqsdc6+CyO
         f2j363Tpy5u6MFj+4ngG4yf4SUbHkTa8AfgaE+augxTgS5W6j7RI93biPBbUqOehvd1x
         olDPgiqUK4n5fHUEkVZIQb3AaqfSlANAR2TDLDHbqKS/xxLrUNMcrVe1WjiFnOZZahPM
         QAVmm9KIs03xHXdFmYnTarBQWop7vOkWhy5H9l2Xq0zdZ7mGZWlMjpwEpgpHRQUOOf5J
         Iey9fZTuqFi3Gc8j/XDpoyaWWjULUcmYivsQELEUGWocMXNV3SGuamH7V5p1Wn7v9QZB
         nqUw==
X-Gm-Message-State: AOAM532JwfN5qYV1y4lpUP18qEqVsJTidtblw2fAyFC0ajU6takINaWB
	dezMNoTQ3RzYrvC3f3sFRLI=
X-Google-Smtp-Source: ABdhPJwsOiZN1+b3duXLtNpkmW1MNq6jZpjeK66MXOevW1b1ctufRQ6Nh889CPdOnzVWipNy1zJ7Ww==
X-Received: by 2002:adf:e645:: with SMTP id b5mr2124669wrn.34.1631176293502;
        Thu, 09 Sep 2021 01:31:33 -0700 (PDT)
Received: from localhost.localdomain ([37.161.158.236])
        by smtp.gmail.com with ESMTPSA id p4sm893675wmc.11.2021.09.09.01.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 01:31:33 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pavel Skripkin <paskripkin@gmail.com>, "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Laight <David.Laight@aculab.com>
Subject: Re: [PATCH v3 3/3] staging: r8188eu: Shorten calls chain of rtw_write8/16/32/N()
Date: Thu, 09 Sep 2021 10:31:30 +0200
Message-ID: <5319192.FrU0QrjFp7@localhost.localdomain>
In-Reply-To: <0614a5a9a1d54700be6d824bdd7c7469@AcuMS.aculab.com>
References: <20210904220048.12822-1-fmdefrancesco@gmail.com> <10808398.E1SmXddD8m@localhost.localdomain> <0614a5a9a1d54700be6d824bdd7c7469@AcuMS.aculab.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On Thursday, September 9, 2021 10:21:04 AM CEST David Laight wrote:
> From: Fabio M. De Francesco
> > To: Larry Finger <Larry.Finger@lwfinger.net>; Phillip Potter 
<phil@philpotter.co.uk>; Greg Kroah-
> > > ...
> > > > diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/
> > staging/r8188eu/hal/usb_ops_linux.c
> > > > index f9c4fd5a2c53..e31d1b1fdb12 100644
> > > > --- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
> > > > +++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> > > > @@ -8,76 +8,51 @@
> > > >  #include "../include/recv_osdep.h"
> > > >  #include "../include/rtl8188e_hal.h"
> > > >
> > > > -static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, 
void
> > *pdata, u16 len, u8
> > > > requesttype)
> > > > +static int usb_read(struct intf_hdl *intfhdl, u32 addr, void *data, 
u8
> > size)
> > > >  {
> > > > -	struct adapter	*adapt = pintfhdl->padapter;
> > > > -	struct dvobj_priv  *dvobjpriv = adapter_to_dvobj(adapt);
> > > > +	u16 value = (u16)(addr & 0x0000ffff);
> > > > +	struct adapter *adapt = intfhdl->padapter;
> > > > +	struct dvobj_priv *dvobjpriv = adapter_to_dvobj(adapt);
> > > >  	struct usb_device *udev = dvobjpriv->pusbdev;
> > > > -	unsigned int pipe;
> > > > -	int status = 0;
> > > > -	u8 *pIo_buf;
> > > > +	int status;
> > > > +	u8 *io_buf;
> > >
> > > Some of these changes are whitespace or renames.
> > > They ought to be in a different patch.
> > 
> > Dear David,
> > 
> > No, they are not.
> > 
> > I guess you were misled by the structure of the patches. There is nothing 
I
> > can do about it. Please notice that usb_read() is created in 2/3, and I'm
> > free to use the name of the variables I like in new functions. 
Furthermore,
> > usb_read() is untouched in 3/3. I can see why you thought they are 
renames :)
> 
> Hmmm... it might be worth playing with the patches and the
> order of functions so that the diffs are meaningful.

Yes, I agree. Readability of the diffs should be taken into account because 
it make the work of reviewers a bit easier.

I'm trying and see if some clean-up of usbctrl_vendorreq() (from which I 
copied most of the code and pasted in my new functions) can improve patches 
readability if it is carried out preventively (I mean before creating 
usb_read() in 2/3 and usb_write() in 3/3).

I hope that that preventive clean-ups would help when in 3/3 I will delete 
usbctrl_vendorreq() and the new code overlaps the lines that were used by 
that function.

Let's see... Perhaps it may solve out problem :)

Thanks,

Fabio

> 
> Some experimentation can be needed.
> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 
1PT, UK
> Registration No: 1397386 (Wales)
> 




