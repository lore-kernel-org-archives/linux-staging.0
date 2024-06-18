Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF5113C80E
	for <linux-staging@lists.linux.dev>; Tue, 18 Jun 2024 16:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718728453; cv=none; b=Lcc0e2F6W91YwZY34c5tjaGziCn/ZBpCWU6ad/AI5tYYexz16xspubMxNm78T/04jU194nfU3Mrc06XIWtK9lSbrX1z4lwUxqYJVTY8ghyQTdJEFsOOOHd3lE6xYuT1m6GydaG38P8RWFoBcVerSbjowujKioiutDyjc+5KW2BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718728453; c=relaxed/simple;
	bh=JwSJvOkZ9FK72lyrJf2XHFu9wWCzAyRi9vx/g3UaMRM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r79QGcIcFtAGjHOE/XggUJoRey55hl19NVDAmni9/f4JMvTHh8wxRXXx5fJ9pzjDf09UIqNS7JKqxT0mNtmcjijrXAbBVba/gtKgyFjMFByKI8Bt+4aC51dVMY7nuNX1cujLogmXJ4nuZsPUj2SilPEzBxw4ggmgdJofc6DLGfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=ZT3qapVP; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="ZT3qapVP"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6b50018e054so1682476d6.1
        for <linux-staging@lists.linux.dev>; Tue, 18 Jun 2024 09:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1718728450; x=1719333250; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UyATPdua0xIvG9IEZTu2KPUCxjrD23ixmP+LULFeCqg=;
        b=ZT3qapVPBPJBMAdqTv/WP8uqpuULmA5h8QDQwqGHoQpQI9uk4xRW9drarqd3VXN3EB
         jlh/QouR1CP2Hx8KqR1HX/6nKDhAqHo9tR/QxW/HtLlmjsDagnDPps7ogiuBPZ5cgQsV
         Vpmeh5olK4Ksm2q/8R1oLqcdivCbl9RparA8v59EzLPM19dNLqUxcujGYhqCXdkAHC5J
         rwEcILHMC/co9JPfSKjQ/bhad0OzgAR1V1s6zl6ZJ/9EGur+ZaJHgaT+PV2y5rYolyyX
         1YtdRw3q8+DoKzfpppLT1zS33/58AIvtkNs1I8XW+R3gKFzfVqCXcwXEo8MEvJ6uhLqh
         WqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718728450; x=1719333250;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UyATPdua0xIvG9IEZTu2KPUCxjrD23ixmP+LULFeCqg=;
        b=LdruhX/Yx0O7arEFms8dmcQO/DcjlDFDdhjk55dfOaksnt64PxBIYnKvbjYCDKaSS1
         sx+rrUfDrX/rO/5896Vo5wbnpNU/qw4qce28Dl0ahpuuNNkRToE0lbBgU1onSgaCk0W0
         J1/68zy0E0jZaf7ZXLRBwAevigXyTptdjakQvBA8GQkWVOFXPHxUJHq2NKZ7sjAJtWb1
         Iy0qt2//jM4xeTpILIR3el/jE01HLMxwvS5qpKL4QLDVSrScLuwSlN0E/2y0m3tbaJFw
         +NKGcg6ESfJbojI03cp1hXSYRwDx6MqDm0ytkyG/nV4bPHD/Ea+ZD7YvxFLAAcJWTz9q
         BVIg==
X-Forwarded-Encrypted: i=1; AJvYcCW/Nz2WcOY2q9EMu4o7VnAh2HSSmA+dwOTq3KYi3Atdk9G9HuacqQSzQKVrOMmURhyAU1qSTMOGu5e8u3MX3lu/upyKfFfP+jxWC2OKgQ==
X-Gm-Message-State: AOJu0YzdXAsOd+aVkwd52gtw2Z1MPO+i0mOVySCzTnDuPxVqi1qCZ1hs
	eCoU2qqti02PG1/ilxiiG6rc9YDJ07KzsoGEVR5caG2nZ2xd1VBb4O+94E6tg0s=
X-Google-Smtp-Source: AGHT+IHobfGlJhLnHEFotyk1CGxdoLtB4S8IrrxZ0v/h08LqEqBMy+9LORb68TjsMWCIXoDBM5yDLA==
X-Received: by 2002:a05:6214:80c:b0:6b0:724a:6ed9 with SMTP id 6a1803df08f44-6b501e1e3acmr2439486d6.17.1718728450578;
        Tue, 18 Jun 2024 09:34:10 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:17:5fb9::7a9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b2a5bf1f96sm68175396d6.12.2024.06.18.09.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 09:34:10 -0700 (PDT)
Message-ID: <0e8561108c4fc99291ad7cdc0c6af2dbb8e58f02.camel@ndufresne.ca>
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Detlev Casanova <detlev.casanova@collabora.com>, Jianfeng Liu
	 <liujianfeng1994@gmail.com>
Cc: alchark@gmail.com, andy.yan@rock-chips.com, conor+dt@kernel.org, 
	cristian.ciocaltea@collabora.com, devicetree@vger.kernel.org, 
	didi.debian@cknow.org, dsimic@manjaro.org, gregkh@linuxfoundation.org, 
	heiko@sntech.de, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, 
	mchehab@kernel.org, robh@kernel.org, sebastian.reichel@collabora.com
Date: Tue, 18 Jun 2024 12:34:07 -0400
In-Reply-To: <4302165.yKVeVyVuyW@arisu>
References: <4116468.VLH7GnMWUR@arisu>
	 <20240618121329.79936-1-liujianfeng1994@gmail.com>
	 <4302165.yKVeVyVuyW@arisu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi,

Le mardi 18 juin 2024 =C3=A0 08:39 -0400, Detlev Casanova a =C3=A9crit=C2=
=A0:
> On Tuesday, June 18, 2024 8:13:29 A.M. EDT Jianfeng Liu wrote:
> > Hi Detlev,
> >=20
> > On Fri, 14 Jun 2024 21:56:27 -0400, Detlev Casanova wrote:
> > > +		.frmsize =3D {
> > > +			.min_width =3D 16,
> > > +			.max_width =3D  65520,
> > > +			.step_width =3D 16,
> > > +			.min_height =3D 16,
> > > +			.max_height =3D  65520,
> > > +			.step_height =3D 16,
> > > +		},
> >=20
> > I think the min/max width/height are incorrect. From rockchip's TRM V1.=
0
> > Part1 page 374, supported image size is 64x64 to 65472x65472.
> i,
> Page 374 shows the sizes for h265. h264 is the next table, where 16x16 an=
d=20
> 65520x65520 is documented.

Just a theory, but 64x64 looks like Mali GPU requirement to me. Can you giv=
e
more details how it fails exactly ?

Meanwhile, if fluster suite does not exercise it already, we can craft a st=
ream
to verify the its decodes fine. We also have issues in rkvdec were the driv=
er
reports CAPTURE queue constraints for OUTPUT formats.

Nicolas

>=20
> > And my
> > chromium can't use rkvdec2 because min width/height are set to 16, whic=
h
> >=20
> > will cause error at here in rkvdec2_h264_validate_sps:
> > > +	if (width > ctx->coded_fmt.fmt.pix_mp.width ||
> > > +	    height > ctx->coded_fmt.fmt.pix_mp.height)
> > > +		return -EINVAL;
> >=20
> > width is 16, height is 32 while ctx->coded_fmt.fmt.pix_mp.width and
> > ctx->coded_fmt.fmt.pix_mp.height are both 16.
>=20
> Maybe
>=20
> if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
> 	height *=3D 2;
>=20
> is causing issues in this case, I can check.
>=20
> > After changing them to 64 my chromium can use rkvdec2 to decode h264
> > videos now.
> >=20
> > Anyway many thanks to your amazing work!
> >=20
> > Best regards,
> > Jianfeng
>=20

