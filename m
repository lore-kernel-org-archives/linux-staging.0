Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35B7256D;
	Sun,  6 Apr 2025 04:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743912729; cv=none; b=oip6Bzp7H11uBQkGxi4lFUUQy97xuUBt2XtXGnSB8fryLTqdpP6BoNky3r73ehR2pS/sEPli5ueT2Sx7s497D/JYUdkTKuS8Y2ERjuul9enqNPcIMNTYgYuYRIuZaKsXnbhW3L87zsx41pks0Yb7p37FCJxe8ONrEuXdjMX8ueY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743912729; c=relaxed/simple;
	bh=hGIVXXAhHctDsjy1naMvfXrRCQwyDdpNe4VQbCn8dv0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OYo/ZndiidBB5ROsyV//nUgqkN4VvmT3sZvZdt6WYGGXV1IJpRoV2CrwDXYhJkM6tQhfSKoQ/B/iAdnUK24tHK8DYbeFSsyQ4StBHQnvgnVmP0Rp9rVuWzVJMtaVyWklXIRXAb8riOdeS3zuEwZjyrf3Lzxs1TlwV+Y+Bxj8ZsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EkFKPK2F; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EkFKPK2F"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c0dfba946so2036689f8f.3;
        Sat, 05 Apr 2025 21:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743912726; x=1744517526; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CkhZzdyHthH3zlmYOF4rhVybnNJuyP+fVbqgr5eqZcQ=;
        b=EkFKPK2F2g+8oFMNLRbJ2FdwrbjWsDkn9d3FhKV0xSFWqrcoS0ZYNXPW8Bkqc2nGyu
         HEaEBuX1Y/mXqtt5MRB8t0vx9jRbI84ppkjhSe6359Tdx1RBZHKNlBKNlxX+f5hjOhfB
         TgzjtJn48+TGyS8aOMVEUk6Hq/GyEnwPR9GGdUS21AEG+L69Re9+HUpM90btiamPwnLQ
         /VjOJNSwVZI+eg41Wl//RPcvTYfjKsUT7fL6pYoRvq6Vl7efnc1ai1GEKdI11SpnFL14
         lbyox4PSm+PqvV5g4V0Qr/Ap6q+iSmYbWJPewUosPFOJByCtDX5GXPVucOvywLM7bfQF
         5tCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743912726; x=1744517526;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CkhZzdyHthH3zlmYOF4rhVybnNJuyP+fVbqgr5eqZcQ=;
        b=IFo+kSAm6bHXM1dfEUSYVdCzZnnb+IDyO84Mujdaf52wMB+3DJqpUmlUrZ9Q4TVgs4
         WzOnpRABmYsnOaZ1N44QM497qMq08CvsrnGOhIQZDWqkaycst8FxrG7Aw1NytYMJ5jcb
         sI5DbMlR65x3VGD/bhVk3n9EMLfrWjOxNBjfIUGR/Sp/5d+FRypuu12LFKb2m5fIrUoI
         9herTd8NQw4KE8h8M1/c37QUtFk4Ij/CsDjBjf5fu6esWAxBHHN/9sNv555Y1iwpQqU0
         KBgjENIoc1iBEFmpVD0Md/oCDAQVZhjI8UCSMOT4cko62vFPp9VO+YSAEJzRdhOugM/E
         BETg==
X-Forwarded-Encrypted: i=1; AJvYcCVrUbpGW/oD8N6qNnnag/ew8d51Ib3Msx2dPGrN/ChVLYOgz3sXpnPpkzBJ2MatxE9ZZ/kfHbBtXW9j@lists.linux.dev, AJvYcCWs0vmp6gR7GNpF/8tETSh2s7SiCy+0IBzu4D61aC+rEPnmgwvHttpUxjhG5oVLKWCvmm/RM+43zej5n4DG@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8FeewjS1AueM4m0edDtoMLw08WKg1fJX8ldqZ8XBwmVOdpQ2X
	2AeAZEWY4qBwtGo2saEQNDLOoPdK3bbfVNs35CrkXmeqk6sdpvOr
X-Gm-Gg: ASbGncs2YF8pO9UsOcJVY83CrwOZeTvXILfsypnVK7fMKOVyoZDZTts+wkQlEdOvFcx
	n/4GzRDIopkCWeMAoSOIbjXBtC15CE2veS2o7X4DZu0dsg9nZXeagDCPP9tWVZq3T0aF3RI21Kq
	eAFnKsaEnpCwh89aBsdcElVW4pNRO7IaCbdBDyx4AWvhdASCv2VnoYkisQuJ7doCEog6QUqtBGl
	ZbDb6THZx/t0MPn5MPJdH8Sr+cUbO2QcNWc4zzYwagtnpUrAypIgltdKqhLDhVm8VXD4FbVHj0M
	9k6caCqR4nQBFplWRZRsyROYr+SP31EoN1AgjYS6PGNYVM0852Rjl2h8KOw=
X-Google-Smtp-Source: AGHT+IGC1ME0LK4Hbev186Hx/YDZFRCSQdBf01P3L8jVlOccePJ7qVSVmJivVIhwZkJfuIasb9ou4w==
X-Received: by 2002:a05:6000:400f:b0:391:4674:b10f with SMTP id ffacd0b85a97d-39cba9332fdmr7099197f8f.36.1743912725851;
        Sat, 05 Apr 2025 21:12:05 -0700 (PDT)
Received: from [192.168.210.251] ([197.232.62.223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096964sm8471638f8f.15.2025.04.05.21.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 21:12:05 -0700 (PDT)
Message-ID: <b5cc9143f1ff84ac13aff6e5f56e1c14b4a181f7.camel@gmail.com>
Subject: Re: [PATCH 1/2] staging: rtl8723bs: Optimize variable
 initialization in rtl8723b_hal_init.c
From: Erick Karanja <karanja99erick@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev, 
	philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Sun, 06 Apr 2025 07:11:56 +0300
In-Reply-To: <8ce041b2-087c-4d47-891f-28ecc0c91c76@stanley.mountain>
References: <cover.1743820815.git.karanja99erick@gmail.com>
	 <f7b63d834b98aedfe2ce277d8008d7e398ea29ba.1743820815.git.karanja99erick@gmail.com>
	 <8ce041b2-087c-4d47-891f-28ecc0c91c76@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sat, 2025-04-05 at 17:19 +0300, Dan Carpenter wrote:
> On Sat, Apr 05, 2025 at 06:14:48AM +0300, Erick Karanja wrote:
> > Optimize variable initialization by integrating the initialization
> > directly into the variable declaration in cases where the
> > initialization
> > is simple and doesn't depend on other variables or complex
> > expressions.
> > This makes the code more concise and readable.
> >=20
> > Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> > ---
> > =C2=A0.../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 155 +++++--------=
-
> > ----
> > =C2=A01 file changed, 41 insertions(+), 114 deletions(-)
> >=20
> > diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > index e15ec6452fd0..1e980b291e90 100644
> > --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > @@ -152,13 +152,12 @@ static int _WriteFW(struct adapter *padapter,
> > void *buffer, u32 size)
> > =C2=A0void _8051Reset8723(struct adapter *padapter)
> > =C2=A0{
> > =C2=A0	u8 cpu_rst;
> > -	u8 io_rst;
> > +	u8 io_rst =3D rtw_read8(padapter, REG_RSV_CTRL + 1);
> > =C2=A0
> > =C2=A0
> > =C2=A0	/*=C2=A0 Reset 8051(WLMCU) IO wrapper */
> > =C2=A0	/*=C2=A0 0x1c[8] =3D 0 */
> > =C2=A0	/*=C2=A0 Suggested by Isaac@SD1 and Gimmy@SD1, coding by
> > Lucas@20130624 */
> > -	io_rst =3D rtw_read8(padapter, REG_RSV_CTRL+1);
> > =C2=A0	io_rst &=3D ~BIT(0);
> > =C2=A0	rtw_write8(padapter, REG_RSV_CTRL+1, io_rst);
>=20
> I hate this.=C2=A0 It's a bad idea to put "code" in the declaration block=
.
Thank you on the review I believe updating the semantic patch to check
for this could be great.
>=20
> > @@ -501,8 +499,7 @@ void Hal_GetEfuseDefinition(
> > =C2=A0	switch (type) {
> > =C2=A0	case TYPE_EFUSE_MAX_SECTION:
> > =C2=A0		{
> > -			u8 *pMax_section;
> > -			pMax_section =3D pOut;
> > +			u8 *pMax_section =3D pOut;
>=20
> This is fine because "pOut" is a variable.=C2=A0 It doesn't have side
> effects
> and it's not "code" in that sense.
>=20
> regards,
> dan carpenter
>=20

