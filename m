Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B883FC0
	for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 10:38:24 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id x11so43444000ejv.0
        for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 03:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4gBKr5Su/PnxnA+c35DCA2AuEwsy9cp9ieoty+J7/6s=;
        b=DaY6aP24jNeATcWLxb+or3diikBL03eyvWM/iHHlYFs4m0McOE0qqYCP5jQu7WM5py
         nBVwJozod0A7RekJU9IvSpEpTSfw9BD7qv6l1UlhTPATEEkTPssE+RiMmmnXoBepufE1
         6zCxl9ym9oXXP33YRCvCIVhSsul2A2QuiQSkehfw5pnAker5IFjLTVb65LjtNkEdiVDW
         cNlM1VDGrA+t8SHz0X7D1+xS+FuGIe3NWPy2WzyUE2/LbKSlfcBS/XKPs57TMLolpTrc
         8AuUOSoOMQnP0j+rncC9Ix8o9xzRQfJizlvvZCt13R36T6cUIcdCWJ1ohxxSszmUo1zu
         G8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4gBKr5Su/PnxnA+c35DCA2AuEwsy9cp9ieoty+J7/6s=;
        b=RZDtdIafYzNy6ub+8dXEYuQfz9pWMhF6s9h5topRY7OJGOOq35QUQMxDqK7eWOPThI
         A0hDMc73jdhDtbg4XNIvAm9dCW30PU7eYkntJw9E/u3S3UkWT6CS5yTSKSfj/TondOJV
         1QueRA6RqyAivBq1SVVbyvxmGblMXSlCjNP2//TSOfVSmh4FqV50cP631ixfQz+CiZxW
         kVGkRyyN5hL2zoIiwRhy1tyHPvVeW6rg7nSaWYC7hD0OjmdtssS6vy75S9f6rVws5ix7
         6WxIkC8fQkm7VRZH2hqChlLQ25O1KAl6h0YLdy7DLspgzDCGFhV9dPe0OH8AUEAJGyqv
         MXMQ==
X-Gm-Message-State: AOAM533Tv9cY6mWBtBS2xlExBzJBDOw7/+AvoIiIphepMjkxB5/RoPK3
	oHzKkSb0F6mAVDycwRs0iqs=
X-Google-Smtp-Source: ABdhPJw17RHEaoyxTh+tq24OrhzheFzjMC6oLeNnpWbSA8Za9XqDentosi6gdBCxz4Vrv4wqNGLzHA==
X-Received: by 2002:a17:906:1bb1:: with SMTP id r17mr40469127ejg.533.1629801502341;
        Tue, 24 Aug 2021 03:38:22 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id v8sm10576027edc.2.2021.08.24.03.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 03:38:21 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Phillip Potter <phil@philpotter.co.uk>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Pavel Skripkin <paskripkin@gmail.com>
Subject: Re: [PATCH 1/2] staging: r8188eu: Use usb_control_msg_recv/send() in usbctrl_vendorreq()
Date: Tue, 24 Aug 2021 12:38:20 +0200
Message-ID: <1751314.Y7PUP2lcel@localhost.localdomain>
In-Reply-To: <50d40020-5b0e-4bb9-357b-3640a0f9e8c6@wanadoo.fr>
References: <20210823223751.25104-1-fmdefrancesco@gmail.com> <4118209.ZeClQeRtK1@localhost.localdomain> <50d40020-5b0e-4bb9-357b-3640a0f9e8c6@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Tuesday, August 24, 2021 7:44:40 AM CEST Christophe JAILLET wrote:
> Le 24/08/2021 =C3=A0 04:01, Fabio M. De Francesco a =C3=A9crit :
> > On Tuesday, August 24, 2021 3:38:03 AM CEST Fabio M. De Francesco wrote:
> >> I think that I've inadvertently switched the order by which usb_contro=
l_msg_send()
> >> and memcpy() are called. I'm very sorry for not doing my tests, but (a=
s I had said
> >> before) at the moment I don't have my device with me.
> >=20
> > No, I did not switch them. There must be something else...
> > Sorry for the noise.
> >=20
> > Fabio
> >=20
>=20
> Hi,
>=20
> 'usb_control_msg_recv()' looks like:
>=20
> int usb_control_msg_recv(struct usb_device *dev, __u8 endpoint, ...)
> {
> 	unsigned int pipe =3D usb_rcvctrlpipe(dev, endpoint);
> 	...
> 	ret =3D usb_control_msg(dev, pipe, ...);
>=20
>=20
> 'usb_control_msg()' looks like:
> int usb_control_msg(struct usb_device *dev, unsigned int pipe, ...)
> {
>=20
> The difference is that one expect an 'endpoint' (and compute the pipe=20
> from it), and the other expect a 'pipe'.

Hi Christophe,

Yes, correct. That's why I changed the type of 'pipe' from "unsigned int"
to "u8". I also saw that usb_control_msg_recv/send take care of calling=20
usb_rcvctrpipe() and usb_sndctrlpipe(); so, in my patch I deleted=20
those calls.

Not related to my patch... why Linux has u8 and __u8? What are the =20
different use cases they are meant for?=20

> Also, in your code, 'pipe' looks un-initialized.

Oh yes, good catch.  Thanks!

> So, my guess is that you should rename 'pipe' into 'endpoint' (to keep=20
> the semantic),
> have "endpoint =3D 0;" somewhere and pass it to=20
> usb_control_msg_{recv|send}.
> Or just remove 'pipe' and pass an explicit 0 directly.

I've just seen that in other drivers the code passes an explicit 0.
So, also according to your suggestion, I'll remove "pipe/endpoint".

> Not sure it is enough, but it looks like a difference between before and=
=20
> after your patch.

Since I cannot see other issues, I'm about to fix the code as said above and
then submit a v2 series.

Your 2c are worth much more than how much you think :)

Thanks very much,

=46abio

> just my 2c,
> CJ
>=20




