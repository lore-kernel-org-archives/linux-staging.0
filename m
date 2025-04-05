Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0290CC8CE;
	Sat,  5 Apr 2025 14:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743864223; cv=none; b=JrmqU97kGQP/ieVZZTW0JGHUHu8+s3wTV/otwcuGKKpzPLeKDOCePRdyubdOgIdRNdq2WeMG5AthA5Jf4Azlc6KZlyZ5OerphGA3R29WQsoMYDOKxzZP7TSRKmUMXhGNdN6dD+0yF+4lT8UjmCpgLw56qNNy5pYkqYTFJaLA23Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743864223; c=relaxed/simple;
	bh=/RGGbQE7wSqcx/CNweEXfbTvRvbRag9wVbkeqkx8iS4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a1jL5NyTR8f4npMtcfS7WYGFUXoXPR1t0Kx3JfD9SfbXzdg/O/WP6EYCsEk6w3plgyzfukrQgO8dpPdjPy8P/x2871tnUcMOws1vZZc9SNcxDQ3MQX1G8HzLnDAyACSulXBsiCQwrPKQH3qwTSii5rSWrJnczxXL4dfvR7wUYHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXzR8njK; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXzR8njK"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3996af42857so2676883f8f.0;
        Sat, 05 Apr 2025 07:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743864220; x=1744469020; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/RGGbQE7wSqcx/CNweEXfbTvRvbRag9wVbkeqkx8iS4=;
        b=YXzR8njKOLEptDOdLjysbmnJcMdv/FQtmo71HDMr1nFChByM5gqra9pITxhuGCIbU5
         0MMuw/1Cye00SFMckY8Q183Ncamgc/BN9KEDBu20kPLMQXym+ukJSwblIYjK+FoAHSCv
         Pvsxmo51TGIwQ/Pm6urAUJ0sV6QmrkWQ7mwczH4xn2K5A7yO4urLBXuwAB/zAblQF7Ou
         SN5r4zclO5Ph2u6H21ovDj2s9/eTBxVGxnA0pezcrsxqecAKg1CgkWnBbXYS2g06aivp
         OoxN2mhyEHRcjKI+fSYHFdot3rjmF+zjPLnbmW/rNp8ZR1oKWS9JFzqg5o9rixR/6eiu
         UhDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743864220; x=1744469020;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/RGGbQE7wSqcx/CNweEXfbTvRvbRag9wVbkeqkx8iS4=;
        b=lG6c2KCQMQ9+o/SDpFXDHYIE6H97kU9egfdAOrfPbje6IVoSlmJ2mHvJa3dyjRaNRU
         dsEFbavmxw43ULpROgtQmkfhv9+JTKDd7UC/muk5736doOxwoDlTxe9qnWzxihV38Wy2
         p6oPCWe03qcaUgvU1ns4zqCmubMCH6xjnGLLI/HAF7GXmxh017jW9B2pgSC7MJ5WW3by
         ocs3XrX5NZFx6Cc07jV53d3m+x7H1qyVk2KI4SCGEsLi+vMG5uWDNFQ3QfAdWwaw/+gD
         tl07MBDiUEeG55jL4VC5W8U5E/FwEU9HSbJCaFGv6omfrflWm6symlwJQjfcDti3nr1e
         cS1A==
X-Forwarded-Encrypted: i=1; AJvYcCUMTT3Zr1+hIvj6R3BgXjvanA1CB6F35kKMQFwoivf6+zxmeGJj2nX6qcX9xUSpJI+/scAB0Yn8/IVqJq/7@lists.linux.dev, AJvYcCXOqzEwp2hsiPAXmp6aKqT7CuKtGtOT+nn7LkX0Lk0i9iRzlvTNIZ+yZM6uvkosP/wIwbzwv3S6D8jW@lists.linux.dev
X-Gm-Message-State: AOJu0YyjMDHwUql/AQNxCJYHQrDenEtCjYudBYXBx4oQOp8xcJLm0UDg
	txKpBvHJIVD8HYsQK2N4H34giONqphZiXsPX8AwmuYcZ3axd2z2B
X-Gm-Gg: ASbGncuW0KDEd8GQ52rrE8yzIwKISt/q6BeBwMnbUPM5cDUu0A4ntsVW8mQev3C36pK
	t4c8AMJmsaBvBQxr7ZjYDTGfTiZ8UmQFSIiJtRsdiGmt31GiWjjjKqoNYNZAsPtTusHKEHpO3Rl
	sY/xwISfI5y3E0xwq65uy+DmAFx45yi7hlQ5NDpx6jzbUUgqaX2urk+qFK+6He845CdliTf+jnf
	MSK48vzDQZDuQURBL40CglWgYIzjPVFeSN77Uzw9k+bhSgKYw5OsxcNv491ImwYbEkgWsmU0v1O
	K0M00sYxtKj0Cf+kSxCVsZXLEkvydnb8jwErcmZwGU12p+IYX1og6TP3VA==
X-Google-Smtp-Source: AGHT+IHkyI+chZMq2B1z4osT+V2Q5vUQS53pGFGGOllCNhmpztRxq/RKdq0sPw9xsvq9dYkLFHhWiA==
X-Received: by 2002:a5d:5848:0:b0:39c:1efb:f7c4 with SMTP id ffacd0b85a97d-39c2e65a54fmr9106559f8f.25.1743864220048;
        Sat, 05 Apr 2025 07:43:40 -0700 (PDT)
Received: from [192.168.43.251] ([197.232.62.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c300969e1sm7151427f8f.10.2025.04.05.07.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 07:43:39 -0700 (PDT)
Message-ID: <92f451551548518fe2bc6ebbdbc84efb8cf5ca32.camel@gmail.com>
Subject: Re: [PATCH 1/2] staging: rtl8723bs: Optimize variable
 initialization in rtl8723b_hal_init.c
From: Erick Karanja <karanja99erick@gmail.com>
To: Julia Lawall <Julia.Lawall@inria.fr>, Dan Carpenter
	 <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev, 
	philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Sat, 05 Apr 2025 17:43:35 +0300
In-Reply-To: <F6AA5BB6-46A1-457C-BB99-D26D3744738F@inria.fr>
References: <8ce041b2-087c-4d47-891f-28ecc0c91c76@stanley.mountain>
	 <F6AA5BB6-46A1-457C-BB99-D26D3744738F@inria.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sat, 2025-04-05 at 10:28 -0400, Julia Lawall wrote:
>=20
> > On 5 Apr 2025, at 10:19, Dan Carpenter <dan.carpenter@linaro.org>
> > wrote:
> >=20
> > =EF=BB=BFOn Sat, Apr 05, 2025 at 06:14:48AM +0300, Erick Karanja wrote:
> > > Optimize variable initialization by integrating the
> > > initialization
> > > directly into the variable declaration in cases where the
> > > initialization
> > > is simple and doesn't depend on other variables or complex
> > > expressions.
> > > This makes the code more concise and readable.
> > >=20
> > > Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> > > ---
> > > .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 155 +++++--------
> > > -----
> > > 1 file changed, 41 insertions(+), 114 deletions(-)
> > >=20
> > > diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > > b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > > index e15ec6452fd0..1e980b291e90 100644
> > > --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > > +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > > @@ -152,13 +152,12 @@ static int _WriteFW(struct adapter
> > > *padapter, void *buffer, u32 size)
> > > void _8051Reset8723(struct adapter *padapter)
> > > {
> > > =C2=A0=C2=A0 u8 cpu_rst;
> > > -=C2=A0=C2=A0=C2=A0 u8 io_rst;
> > > +=C2=A0=C2=A0=C2=A0 u8 io_rst =3D rtw_read8(padapter, REG_RSV_CTRL + =
1);
> > >=20
> > >=20
> > > =C2=A0=C2=A0 /*=C2=A0 Reset 8051(WLMCU) IO wrapper */
> > > =C2=A0=C2=A0 /*=C2=A0 0x1c[8] =3D 0 */
> > > =C2=A0=C2=A0 /*=C2=A0 Suggested by Isaac@SD1 and Gimmy@SD1, coding by
> > > Lucas@20130624 */
> > > -=C2=A0=C2=A0=C2=A0 io_rst =3D rtw_read8(padapter, REG_RSV_CTRL+1);
> > > =C2=A0=C2=A0 io_rst &=3D ~BIT(0);
> > > =C2=A0=C2=A0 rtw_write8(padapter, REG_RSV_CTRL+1, io_rst);
> >=20
> > I hate this.=C2=A0 It's a bad idea to put "code" in the declaration
> > block.
>=20
> Erick, you can look around in the output of the semantic patch and
> see if all of the ones with function calls are undesirable. If that=E2=80=
=99s
> the case you can post to the outreachy mailing list a revised
> semantic patch that doesn=E2=80=99t report on that case.
Thanks Julia I will look at it.
>=20
> Julia
>=20
> > > @@ -501,8 +499,7 @@ void Hal_GetEfuseDefinition(
> > > =C2=A0=C2=A0 switch (type) {
> > > =C2=A0=C2=A0 case TYPE_EFUSE_MAX_SECTION:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u=
8 *pMax_section;
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p=
Max_section =3D pOut;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u=
8 *pMax_section =3D pOut;
> >=20
> > This is fine because "pOut" is a variable.=C2=A0 It doesn't have side
> > effects
> > and it's not "code" in that sense.
> >=20
> > regards,
> > dan carpenter
> >=20
> >=20
>=20

