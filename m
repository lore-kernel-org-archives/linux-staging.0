Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE241F09AD;
	Thu, 10 Apr 2025 05:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744263597; cv=none; b=ZX9aTul06MVUiGW8iY5YYNqMBz2AGStDx0vKKGsFClyMsEbO5G6QHIMn0G/0y0iXi4hNpi5dnCg+4LFQMdB8L0kBFG3TmhJnuCpwo4i8KB5TQ9MDJewaAMWDn6mRQgTTa1gcl/5XELJt0db88APNCEFH0DSk4aSizqOXohXnUWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744263597; c=relaxed/simple;
	bh=fgwbzsingwUfnQ+gsoI2iEA9VoiPlOxSoyEJo7rzwYg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X7Te3w8skYktmry82komORDrVgfZyPWYwTHXJMN2Jpjk3d+O72Gjn/CTWAJnrvGXG28bNHWtLaIVJOyBfb12ls2Unfllvt/0ikBDQA9nnPhKffw09Vnw57Vxlwi6mpuV6+zTQIvsAsJKEeLj2gwbpHBQ84Ii/EFjNrVIkmhf6k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cRG5gYOg; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cRG5gYOg"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso3641875e9.2;
        Wed, 09 Apr 2025 22:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744263594; x=1744868394; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c8MydQlA2RiT7SHimC4AoBdSKOF7b77708bmfRvloZ8=;
        b=cRG5gYOgT1/adnAdLFSdrRUSZypvzHC7nFsZCRpCPxd4TxxBL8+XICk66AiyuE6WZv
         hhmBHIuUBcPJujhCz96z6n8h33dK/qCi+IMuMrxjeJe6hxQd8PJ+cnAF7GjyAA1Ud74z
         ZHaEE/4P4KhdN44dDNN21WJPnlx/5cAslw/UShdXaRK3CkD+S31+wZRYy5jR0fwz54AD
         ZqB47nPki1iwDNqC2cqMPM13091qJM+Zw7fmD0bTzj7iTzuDbcvnPnkzCL1YVck7Ia52
         uNQzdr57GV7iKFH/9hSPr+uytK674P98t1Q7GpzYFOZXLsYVlTMbtnQ+cms98mCd6qwB
         amZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744263594; x=1744868394;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c8MydQlA2RiT7SHimC4AoBdSKOF7b77708bmfRvloZ8=;
        b=eWmaAdZ7BoZl+usS7KFEuRS7riAcKBOYF9OvshL6bgyTDjUIjc830bKUNhoLCvDLOA
         Zt/L/U2gIU+lWLEwWvyYmSUbZnVKrhDpNPX8Ttb+Be2BJ5hSeG908+J1684A6sjxIrj3
         RYa0FKGTMDBuGGc7bhnIq6X7fHFCVoHRjgiKcmHay4gN2Kj/f0cpPyvfy/XekniAdFSQ
         MaqcjEMn12GHYN1WoYuHPIGkYg31SE1FZHV6RV4uRojr6x9yfiWzNBoeFocINYAqD2ai
         NQiX8xBdO1rKPLf/tn945+OXLQYePR3sIoJgjQXfcwFPFzt4odVjNVUavodawkHYC8wx
         GQug==
X-Forwarded-Encrypted: i=1; AJvYcCUifDZjqeQZv9tz2wvfaDk8vtwSgv5oAjXbxvoqTfnnmWlghsZ2kFiEN+8Iqw+G78J56vupKYM/ekty@lists.linux.dev, AJvYcCXrRNcWxnA3SCP26ew+WyaO91MQ4ReDSu8I8j+7Kg6lINSBMTa6Ts6+XP16EKhUdZXMSIm+/ZpV9qf9YY/8@lists.linux.dev
X-Gm-Message-State: AOJu0YwviJxioGv5kL9cQajXY1FGe9D4QScGwXRQlxFL9f5klaRuf2T0
	HxRmBlomvssw3afrtwO7fhv2vSEKVqAQh79Qog3ZIOm1m902h8ma
X-Gm-Gg: ASbGncveE9TkPABjbPixF+CZc6wnZY3DzLniCFhenF9uOR4PvJydzooN2FrBqlCqvbf
	GfInN4BgnqnQcjsGCiNMZNY7EnHl2EKPiH1KTUVh3sRO3OWzkDSzSSpYRY6oBwEBpeTmm+E5Czy
	M+POzBrfPfHpDXrlY0ebz8ZW4gX4qgJ+/EgIkd8UDxLG7HXx+WQezvN8py+Vf/QVLsZAeZt9pg6
	/z5gjql/5XJ6vRzIEPi5jkwRDl6TdAGSoCiNRmLa99bvKgt437LaKp42dD2FIBJl65oqpUbbvyu
	GSGQlojBJsGuRWTRM2G+ZiQ0QwP7BJSAxO8o0NUBPjFyru8ty54=
X-Google-Smtp-Source: AGHT+IEu7GddxYv7ARpepPfXludN9b52TSG/j4MufAMrgSu7NbiFaPNKVwgFqPz+aOZCBhkP3Qx5zw==
X-Received: by 2002:a05:600c:c17:b0:43d:b85:1831 with SMTP id 5b1f17b1804b1-43f2d6875c7mr15418175e9.0.1744263593886;
        Wed, 09 Apr 2025 22:39:53 -0700 (PDT)
Received: from [172.16.8.120] ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f23572b5bsm38513735e9.28.2025.04.09.22.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 22:39:52 -0700 (PDT)
Message-ID: <4dcbf1fc70d565b5845ab7bc823cb1e9a94f6084.camel@gmail.com>
Subject: Re: [PATCH v2 2/2] staging: rtl8723bs: Initializing variables at
 declaration
From: Erick Karanja <karanja99erick@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev, 
	philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Thu, 10 Apr 2025 08:39:47 +0300
In-Reply-To: <9dce3c-6ac-8b7e-fdbc-75e14f73fcc4@inria.fr>
References: <cover.1744192642.git.karanja99erick@gmail.com>
	 <0fb58ca930030af2a4c730b0f5328e64210b795b.1744192642.git.karanja99erick@gmail.com>
	 <9dce3c-6ac-8b7e-fdbc-75e14f73fcc4@inria.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2025-04-09 at 11:41 -0400, Julia Lawall wrote:
>=20
>=20
> On Wed, 9 Apr 2025, Erick Karanja wrote:
>=20
> > Make the code more readable by moving trivial
> > initializations up with the declarations instead
> > of wasting a line on that.
> >=20
> > Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> > ---
> > =C2=A0.../staging/rtl8723bs/hal/rtl8723bs_xmit.c=C2=A0=C2=A0=C2=A0 | 39=
 ++++++---------
> > ----
> > =C2=A01 file changed, 11 insertions(+), 28 deletions(-)
> >=20
> > diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> > b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> > index 5dc1c12fe03e..d134d185bfae 100644
> > --- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> > +++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
> > @@ -120,13 +120,10 @@ static s32 rtl8723_dequeue_writeport(struct
> > adapter *padapter)
> > =C2=A0 */
> > =C2=A0s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter)
> > =C2=A0{
> > -	struct xmit_priv *pxmitpriv;
> > +	struct xmit_priv *pxmitpriv =3D &padapter->xmitpriv;
> > =C2=A0	u8 queue_empty, queue_pending;
> > =C2=A0	s32 ret;
> >=20
> > -
> > -	pxmitpriv =3D &padapter->xmitpriv;
> > -
> > =C2=A0	if (wait_for_completion_interruptible(&pxmitpriv-
> > >xmit_comp)) {
> > =C2=A0		netdev_emerg(padapter->pnetdev,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 "%s: down SdioXmitBufSema fail!\n",
> > __func__);
> > @@ -242,8 +239,7 @@ static s32 xmit_xmitframes(struct adapter
> > *padapter, struct xmit_priv *pxmitpriv
> > =C2=A0						/* pxmitbuf-
> > >priv_data will be NULL, and will crash here */
> > =C2=A0						if (pxmitbuf->len
> > > 0 &&
> > =C2=A0						=C2=A0=C2=A0=C2=A0 pxmitbuf-
> > >priv_data) {
> > -							struct
> > xmit_frame *pframe;
> > -							pframe =3D
> > (struct xmit_frame *)pxmitbuf->priv_data;
> > +							struct
> > xmit_frame *pframe =3D (struct xmit_frame *)pxmitbuf->priv_data;
>=20
> I'm not sure that it's worth making this change here given that it
> makes
> the line even longer.
Hello Julia. I will make the necessary changes.
Thank you.
>=20
> > =C2=A0							pframe-
> > >agg_num =3D k;
> > =C2=A0							pxmitbuf-
> > >agg_num =3D k;
> > =C2=A0							rtl8723b_u
> > pdate_txdesc(pframe, pframe->buf_addr);
> > @@ -326,8 +322,7 @@ static s32 xmit_xmitframes(struct adapter
> > *padapter, struct xmit_priv *pxmitpriv
> > =C2=A0		/*=C2=A0 dump xmit_buf to hw tx fifo */
> > =C2=A0		if (pxmitbuf) {
> > =C2=A0			if (pxmitbuf->len > 0) {
> > -				struct xmit_frame *pframe;
> > -				pframe =3D (struct xmit_frame
> > *)pxmitbuf->priv_data;
> > +				struct xmit_frame *pframe =3D
> > (struct xmit_frame *)pxmitbuf->priv_data;
>=20
> This also makes a long line.
>=20
> > =C2=A0				pframe->agg_num =3D k;
> > =C2=A0				pxmitbuf->agg_num =3D k;
> > =C2=A0				rtl8723b_update_txdesc(pframe,
> > pframe->buf_addr);
> > @@ -357,12 +352,9 @@ static s32 xmit_xmitframes(struct adapter
> > *padapter, struct xmit_priv *pxmitpriv
> > =C2=A0 */
> > =C2=A0static s32 rtl8723bs_xmit_handler(struct adapter *padapter)
> > =C2=A0{
> > -	struct xmit_priv *pxmitpriv;
> > +	struct xmit_priv *pxmitpriv =3D &padapter->xmitpriv;
> > =C2=A0	s32 ret;
> >=20
> > -
> > -	pxmitpriv =3D &padapter->xmitpriv;
> > -
> > =C2=A0	if (wait_for_completion_interruptible(&pxmitpriv-
> > >SdioXmitStart)) {
> > =C2=A0		netdev_emerg(padapter->pnetdev, "%s: SdioXmitStart
> > fail!\n",
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __func__);
> > @@ -408,13 +400,9 @@ static s32 rtl8723bs_xmit_handler(struct
> > adapter *padapter)
> >=20
> > =C2=A0int rtl8723bs_xmit_thread(void *context)
> > =C2=A0{
> > -	s32 ret;
> > -	struct adapter *padapter;
> > -	struct xmit_priv *pxmitpriv;
> > -
> > -	ret =3D _SUCCESS;
> > -	padapter =3D context;
> > -	pxmitpriv =3D &padapter->xmitpriv;
> > +	s32 ret =3D _SUCCESS;
> > +	struct adapter *padapter =3D context;
> > +	struct xmit_priv *pxmitpriv =3D &padapter->xmitpriv;
> >=20
> > =C2=A0	allow_signal(SIGTERM);
> >=20
> > @@ -435,16 +423,13 @@ s32 rtl8723bs_mgnt_xmit(
> > =C2=A0)
> > =C2=A0{
> > =C2=A0	s32 ret =3D _SUCCESS;
> > -	struct pkt_attrib *pattrib;
> > -	struct xmit_buf *pxmitbuf;
> > +	struct pkt_attrib *pattrib =3D &pmgntframe->attrib;
> > +	struct xmit_buf *pxmitbuf =3D pmgntframe->pxmitbuf;
> > =C2=A0	struct xmit_priv *pxmitpriv =3D &padapter->xmitpriv;
> > =C2=A0	struct dvobj_priv *pdvobjpriv =3D
> > adapter_to_dvobj(padapter);
> > =C2=A0	u8 *pframe =3D (u8 *)(pmgntframe->buf_addr) + TXDESC_OFFSET;
> > =C2=A0	u8 txdesc_size =3D TXDESC_SIZE;
> >=20
> > -	pattrib =3D &pmgntframe->attrib;
> > -	pxmitbuf =3D pmgntframe->pxmitbuf;
> > -
> > =C2=A0	rtl8723b_update_txdesc(pmgntframe, pmgntframe->buf_addr);
> >=20
> > =C2=A0	pxmitbuf->len =3D txdesc_size + pattrib->last_txcmdsz;
> > @@ -557,15 +542,13 @@ s32 rtl8723bs_init_xmit_priv(struct adapter
> > *padapter)
> >=20
> > =C2=A0void rtl8723bs_free_xmit_priv(struct adapter *padapter)
> > =C2=A0{
> > -	struct xmit_priv *pxmitpriv;
> > +	struct xmit_priv *pxmitpriv =3D &padapter->xmitpriv;
> > =C2=A0	struct xmit_buf *pxmitbuf;
> > -	struct __queue *pqueue;
> > +	struct __queue *pqueue =3D &pxmitpriv-
> > >pending_xmitbuf_queue;
> > =C2=A0	struct list_head *plist, *phead;
> > =C2=A0	struct list_head tmplist;
> >=20
> >=20
> > -	pxmitpriv =3D &padapter->xmitpriv;
> > -	pqueue =3D &pxmitpriv->pending_xmitbuf_queue;
> > =C2=A0	phead =3D get_list_head(pqueue);
> > =C2=A0	INIT_LIST_HEAD(&tmplist);
> >=20
> > --
> > 2.43.0
> >=20
> >=20
> >=20

