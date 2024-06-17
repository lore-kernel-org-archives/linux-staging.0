Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2460B76036
	for <linux-staging@lists.linux.dev>; Mon, 17 Jun 2024 14:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718633103; cv=none; b=pNsz8p+pheqst3+AEHOJ56urvpry7UT6K/8ZWQqUTBKhhxd3u/iF0vkcuZuQBjqB5OC1kW3vOz8fB6+e0NjU4NEd5qo+FvXrBn2dYA5kIJjhmscWqn5SQCqLrSWuT91cWcBQSptNm4DnrYKJmCxBMC78PK2ZxMvUo7RMLjjd6WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718633103; c=relaxed/simple;
	bh=Zm/QwU2rpGsbu0eOFvD6iNkDmhJOG975MRanNZtbJZ8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u82TUee4VworZM/fZG1n4lkDqS8uDYNvvdPNnonhGwmt8cKag6xiWaFy6DyUfxXT1UmrgI8BxVdh1ekwwhvlNDAPrAn6cpn4HkvMB2iJxorSIuQ34R+daLDObfK9RN9HM1zQc7wfeGbNelPx0rFqVqHwKROwVVFfGeVzemRdKCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=oeXX58ia; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="oeXX58ia"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-795fb13b256so420934085a.0
        for <linux-staging@lists.linux.dev>; Mon, 17 Jun 2024 07:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1718633101; x=1719237901; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VYuchBzcVq+nntl0rByVP4I0/xMFrP/odXfBrhxA/v4=;
        b=oeXX58iam+7hywkNLK0M7Yj5vTXYRf/a2Cy5vuRR3qAdC54as/fAK4rCJdniT5o1Jv
         Di3g+Svyzx4+ysAHr65qVEtPXZ435vjv/srhgGdEhn7+bVaVx63q2hDD4hhEO7Zap1sv
         hk9vKYFmC6iswvplPvwjN1K+Ewb6AlRRdlpmIkWrEyYHCv8ieSMsr+ACaoPzRXsHrvtl
         2sYmfyc0FzZmliWWgyMg5TrSBSyUDOqqpAYnLHZVePlbFAnIc03BPpg4SLOHdxblAFNL
         exNeAxoRtFnx5g3PnghWlWTzMYXSxKSkvDFxxyaX32MJMJpelMoNCM5kRDhLmxJ/TgG0
         egLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718633101; x=1719237901;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VYuchBzcVq+nntl0rByVP4I0/xMFrP/odXfBrhxA/v4=;
        b=mqvA/uD+XB3RYcHTG00WNoe+Sh36+ec26BZ5dy5DZ4lFN0YfHX4ObZUhZNwGJ50PJs
         6IDyj1fTIpr9pQGnMCY1MqJjtMf0eVwSDC4nrF8B2H2gO38JRn/um0jeKoXzG1fyQYTW
         LeWEuP5FFEdD//c+lU+O6WngI8Ukx3kPP6eQev1hqf4m5HFCqIT85PxCjqVIvY/zEARj
         7H291WWE1ymar4AUMqoo89rDGumThGY8wQBzRFRL44OXRJRYdyr6QVaAjtBuKaXcuT48
         A8LKOsBVhqmEChQlobd4ou+DJ4Y6HZ9hwTfnb34ppeKTcuWSKpxUVPuEQkWK9vvwNOpG
         Baug==
X-Forwarded-Encrypted: i=1; AJvYcCVsLsdCbPA9cVCmWWKig+7JNiN3OF3rcUOxH9X0tmeGkzxUF6Aso2OUl/LKeMtJEFAczrscjLp8ALobGSvJsRPaBKhh01gpADU6PPHxFw==
X-Gm-Message-State: AOJu0Yy30wB98FIN1ZkUHYfSH9UDa1ABWhdS+wbCsJPYz1BcmLKtnBpH
	nZEfkrHP9RRwkAB76GwpfDeiz8sMR6HePpKF330ZnOSul2KslbwZJpiR1P++0CQ=
X-Google-Smtp-Source: AGHT+IFk6OpTSQ6HI1XE/Anmj9+FlmPZSHzWjQ2P2c9rtwWOS09Hy7PV7JVncckLBidfUl/d/TkDUg==
X-Received: by 2002:a05:620a:29c1:b0:798:d789:c494 with SMTP id af79cd13be357-798d789c9c6mr1428684685a.29.1718633101025;
        Mon, 17 Jun 2024 07:05:01 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:15:57da::7a9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798abe6a973sm429001985a.128.2024.06.17.07.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 07:05:00 -0700 (PDT)
Message-ID: <f295f41ef1c9ee920ac3ac8e70ccf672ba7c9648.camel@ndufresne.ca>
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jianfeng Liu <liujianfeng1994@gmail.com>, detlev.casanova@collabora.com
Cc: alchark@gmail.com, andy.yan@rock-chips.com, conor+dt@kernel.org, 
	cristian.ciocaltea@collabora.com, devicetree@vger.kernel.org, 
	didi.debian@cknow.org, dsimic@manjaro.org, gregkh@linuxfoundation.org, 
	heiko@sntech.de, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, 
	mchehab@kernel.org, robh@kernel.org, sebastian.reichel@collabora.com
Date: Mon, 17 Jun 2024 10:04:59 -0400
In-Reply-To: <20240617094735.27928-1-liujianfeng1994@gmail.com>
References: <20240615015734.1612108-2-detlev.casanova@collabora.com>
	 <20240617094735.27928-1-liujianfeng1994@gmail.com>
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

Le lundi 17 juin 2024 =C3=A0 17:47 +0800, Jianfeng Liu a =C3=A9crit=C2=A0:
> Hi Detlev,
>=20
> Thanks a lot for your work! I try to use rkvdec2 with chromium but it
> can't play h264 video. Here is the log of chromium:
>=20
> [5799:5873:0617/171224.850061:VERBOSE2:video_decoder_pipeline.cc(473)] In=
itialize(): config: codec: h264, profile: h264 high, level: not available, =
alpha_mode: is_opaque, coded size: [1920,1080], visible rect: [0,0,1920,108=
0], natural size: [1920,1080], has extra data: true, encryption scheme: Une=
ncrypted, rotation: 0=C2=B0, flipped: 0, color space: {primaries:BT709, tra=
nsfer:BT709, matrix:BT709, range:LIMITED}
> [5799:5886:0617/171224.850915:VERBOSE2:v4l2_video_decoder.cc(182)] V4L2Vi=
deoDecoder():
> [5799:5886:0617/171224.851218:VERBOSE1:v4l2_device.cc(128)] Open(): No de=
vices supporting H264 for type: 0
> [5799:5886:0617/171224.851346:VERBOSE4:v4l2_queue.cc(1069)] This queue do=
es  support requests.: No such file or directory (2)

This one indicates that V4L2_BUF_CAP_SUPPORTS_REQUESTS might be missing in =
the
REQBUFS implementation. I suspect GStreamer simply assumes this today for d=
river
exposing stateless formats (which is fair, its not a compliance test, and w=
e
don't have a codec compliance yet).

I'd suggest to check and fix this one, and retry, might only be noise, migh=
t be
the main cause, we cannot tell.

> [5799:5886:0617/171224.851426:VERBOSE1:v4l2_video_decoder.cc(476)] Initia=
lizeBackend(): Using a stateless API for profile: h264 high and fourcc: S26=
4
> [5799:5886:0617/171224.851687:VERBOSE1:v4l2_video_decoder.cc(598)] SetupI=
nputFormat(): Input (OUTPUT queue) Fourcc: S264
> [5799:5886:0617/171224.851797:VERBOSE1:v4l2_video_decoder.cc(636)] Alloca=
teInputBuffers(): Requesting: 17 OUTPUT buffers of type V4L2_MEMORY_MMAP
> [5799:5886:0617/171224.867687:VERBOSE1:v4l2_queue.cc(1511)] Streamon(): (=
OUTPUT_MPLANE) VIDIOC_STREAMON failed: Invalid argument (22)
> [5799:5886:0617/171224.867902:VERBOSE1:v4l2_video_decoder.cc(937)] StartS=
treamV4L2Queue(): Failed to streamon V4L2 queue.
> [5799:5886:0617/171224.868009:VERBOSE1:v4l2_video_decoder.cc(1377)] SetSt=
ate(): Error occurred, stopping queues.
> [5799:5886:0617/171224.868105:ERROR:v4l2_video_decoder.cc(120)] StartStre=
amV4L2Queue failed at Decode@media/gpu/v4l2/v4l2_video_decoder.cc:915
> [5799:5886:0617/171224.871898:WARNING:v4l2_video_decoder_backend_stateles=
s.cc(126)] There is/are 0 pending CAPTURE queue buffers pending dequeuing. =
This might be fine or a problem depending on the destruction semantics (of =
theclient code.
>=20
> Here is the chromium code failed when calling VIDIOC_STREAMON:
> https://github.com/chromium/chromium/blob/125.0.6422.60/media/gpu/v4l2/v4=
l2_queue.cc#L1508
>=20
> I'm running chromium v125.0.6422.60 and I can decode 1080p h264 with
> hantro g1 decoder on rk3588.

Are you using minigbm ? Because if you do, we don't have minigbm code for t=
his
driver (and have no plan to do so, since we don't aim for ChromeOS support)=
.

Nicolas

>=20
> Best regards,
> Jianfeng
>=20

