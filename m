Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A5772
	for <linux-staging@lists.linux.dev>; Thu,  9 Sep 2021 08:11:20 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id n7-20020a05600c3b8700b002f8ca941d89so718457wms.2
        for <linux-staging@lists.linux.dev>; Thu, 09 Sep 2021 01:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=x+UCdF8srfyBKX6sfJVqLuvAmV+5/qlEuc9NYz72bcA=;
        b=e5f9kT8LiALpuvmnMLUmybaZW/m/RI5WHQ52WYwEauYWGqSWiE3jq6LkqNtoXJgIwb
         X6CCkEqttt8VGVKxf2C4O4EKFGvhg3NMM1FRJETjNKEYWqef0BTHtWXlmqqIZNiD8l1L
         iney65/enD3ELEJ9x4Zs0QW1cFP8i9QqAhtppOtbvhV7gC4m16GF1ErxeDnWBRSWs4qD
         BbvJOX4YQNMLqy5xHZbROj5AXRVQ08p9gTNZ02uuG0dy4k6yw/mKK8hoD0yr9fWr1FPs
         Dv7Vfqa2MbW0gv8oACNeGqIBP0kJKQtAV6fEdviFMtJWnXRVcfTOnEXcLm5XLdcyV5nF
         cS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x+UCdF8srfyBKX6sfJVqLuvAmV+5/qlEuc9NYz72bcA=;
        b=b8ascDLItP2flie0TAC/3NdGAnC1BTiiyXSqFLUB0/qDM3xxFLcosNorgJF0y7734p
         zb/kqqBikUaJ+fpiNcX3E5Fr1x6I7crP1n7QXcnmS6beYRWS5SO1xgpn7CBvdYngQCox
         ym37IK+NEIVQUAA5qyr6Y6wUqbP2Nh27YG2Of3r2MUeYHBm6s+CEPeVeVhkdJzXBaVT/
         EUSFwstdvrp3/F9IHo/w6wcb6ySWqMHdoMFOfzBH9Y3i5nJe49b8IIWY6RC5TEewdoeb
         Bt00xZJ/8EXuYwSqdljFT/QvR36ouW2k8+fLowW/0Ajj7064CHUlAfrM8oxD9uHi5sVN
         mzWw==
X-Gm-Message-State: AOAM530joPgOos8ypI/OrZXxQZrFYXVXMUvu2IT09M18jtHZ8Pkt0IQM
	gCI94KtJ2RXsX/j2DLcTeLY=
X-Google-Smtp-Source: ABdhPJzFN2mN44wxp+Ep1uZCy3ljqboEsD1ioq89wIJhUlVHLAv3fGZLty3BK5lZyq5tvkXu6srDtQ==
X-Received: by 2002:a1c:9d4d:: with SMTP id g74mr1565305wme.14.1631175078413;
        Thu, 09 Sep 2021 01:11:18 -0700 (PDT)
Received: from localhost.localdomain ([37.163.141.235])
        by smtp.gmail.com with ESMTPSA id v10sm1019813wrg.15.2021.09.09.01.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 01:11:17 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pavel Skripkin <paskripkin@gmail.com>, "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Laight <David.Laight@aculab.com>
Subject: Re: [PATCH v3 3/3] staging: r8188eu: Shorten calls chain of rtw_write8/16/32/N()
Date: Thu, 09 Sep 2021 10:11:10 +0200
Message-ID: <10808398.E1SmXddD8m@localhost.localdomain>
In-Reply-To: <5a359f20e80341c9910ecc6286eb0aec@AcuMS.aculab.com>
References: <20210904220048.12822-1-fmdefrancesco@gmail.com> <20210904220048.12822-4-fmdefrancesco@gmail.com> <5a359f20e80341c9910ecc6286eb0aec@AcuMS.aculab.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On Tuesday, September 7, 2021 12:10:19 PM CEST David Laight wrote:
> From: Fabio M. De Francesco
> > Sent: 04 September 2021 23:01
> >
> > Shorten the calls chain of rtw_write8/16/32() down to the actual writes.
> > For this purpose unify the four usb_write8/16/32/N() into the new
> > usb_write(); make the latter parameterizable with 'size'; embed most of
> > the code of usbctrl_vendorreq() into usb_write() and use in it the new
> > usb_control_msg_send() API of USB Core.
> > 
> ...
> > diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/
staging/r8188eu/hal/usb_ops_linux.c
> > index f9c4fd5a2c53..e31d1b1fdb12 100644
> > --- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
> > +++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> > @@ -8,76 +8,51 @@
> >  #include "../include/recv_osdep.h"
> >  #include "../include/rtl8188e_hal.h"
> > 
> > -static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void 
*pdata, u16 len, u8
> > requesttype)
> > +static int usb_read(struct intf_hdl *intfhdl, u32 addr, void *data, u8 
size)
> >  {
> > -	struct adapter	*adapt = pintfhdl->padapter;
> > -	struct dvobj_priv  *dvobjpriv = adapter_to_dvobj(adapt);
> > +	u16 value = (u16)(addr & 0x0000ffff);
> > +	struct adapter *adapt = intfhdl->padapter;
> > +	struct dvobj_priv *dvobjpriv = adapter_to_dvobj(adapt);
> >  	struct usb_device *udev = dvobjpriv->pusbdev;
> > -	unsigned int pipe;
> > -	int status = 0;
> > -	u8 *pIo_buf;
> > +	int status;
> > +	u8 *io_buf;
> 
> Some of these changes are whitespace or renames.
> They ought to be in a different patch.

Dear David,

No, they are not.

I guess you were misled by the structure of the patches. There is nothing I 
can do about it. Please notice that usb_read() is created in 2/3, and I'm 
free to use the name of the variables I like in new functions. Furthermore, 
usb_read() is untouched in 3/3. I can see why you thought they are renames :)

> 
> I think you'll need 'reverse xmas tree' ordering as well.
> 

I didn't know this rule, but I must agree that this style is horrible. I'll 
change the order of variables declaration for the purpose of fixing this 
ugly "reverse Xmas tree".

Thanks for your review.

Regards,

Fabio

> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 
1PT, UK
> Registration No: 1397386 (Wales)
> 
> 




