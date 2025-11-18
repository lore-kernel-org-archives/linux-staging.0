Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC96530CD88
	for <linux-staging@lists.linux.dev>; Tue, 18 Nov 2025 08:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763453849; cv=none; b=Rqtapn7x5QChIz0P/V4Pp+G0sICKv9tlZ63BQ3YfPbjL5IjKD2PdJZ9Mkx8MWkm2RJr3Esp1ZBwePYWRaMFfvC+NBVqzgzDgOHCB/virfwAI1I55mZ32ZeOwbY9phYdz/a/1wLNq7Q2RtsuGuqMRetsQyAfwrgIWHEGlpxVBdAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763453849; c=relaxed/simple;
	bh=Xbkd0OhYK9CGSu7BYStw60Kktb8UPNtSubpkQmtNXQ4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UclFcgIWh7L0JntvmswrmLQm0lJFvWjwF6QXKcuxO0PeGfVcasCT7eC9/NSXw7JpBJPRdelslL5UZUZYAHVLcuS5zUHtcHxWsABgW17U0OGcsk4kEWTAzy6acpf6mq59LXwgLTHZXI/AhOdE+jsIHGEK+gGR2ROI1V6NEkzVqmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VEsbYMGX; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VEsbYMGX"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477632d9326so35170085e9.1
        for <linux-staging@lists.linux.dev>; Tue, 18 Nov 2025 00:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763453846; x=1764058646; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Xbkd0OhYK9CGSu7BYStw60Kktb8UPNtSubpkQmtNXQ4=;
        b=VEsbYMGXtKuZF/7pYVsZNv6Fv7raUX76gm9JvLe/+A9xgyt9pyfggn5iozwcYMlXDA
         SpdMRM8Q16rCKGUtmUvWxgWUmFl7viw0Jxp+d2QJ7BnH/EqE4t1yO/+hd2h+UciWClsJ
         1Eu05Xhg/Rad85/KYYUOoxEYAvpvZnSFDDbRXYspJjpKJHwK8ofF8y3Q0Ksfs4dw7+lp
         vU1UWPvHNBfmQo1h7dMKsNgbuzJrN5I599YYZZsesjIh+eWsMW9LpOWIXYU0SjTiMZ6T
         ZJTlmkjPfVYKxo5f8aYJ8+VNTmLFv33e8FHIPm+KwuCwzVzinnJs+YCMeeOgFwAHqRmu
         JR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763453846; x=1764058646;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xbkd0OhYK9CGSu7BYStw60Kktb8UPNtSubpkQmtNXQ4=;
        b=Z7UdEV4V0cWwSIIWsGwMTodDEKZzY2ORWra42zbheyNHhDrJRgOHLwZgM0jpst3R+c
         mmozGIttGQPtrxIePH95sdVqDCLKwPxyIQWr0rexnhhW9Y0FpXTDTi0e4dbAz3O8HnU+
         vQccrSSB85cXmxcM3LKvYnB2Jd/D4iTF0Jm6cgVNpn2Och4opaGdIEJnrVC/ZTiv/v3f
         U2+8+k2gZHDGe9OuABLa4UGJAmebfXreTbFrVZW9PjK8PiQEsH0Tcv02YuGVWcqF5HSD
         qdZE30k/YdDE2mmxFLJ7MRKQV4Ef8kQyU4C7R7vAnhD7XhnqEDkzFxVg+lpCRkSdAa3v
         H7CA==
X-Forwarded-Encrypted: i=1; AJvYcCXIIBPs9W7JjJwTNKfS+WbnxYlmpCMgIiWF9awlqP7aLD5wpyCNB2jUuRXlbImaRVtsc4CB/FGyiOA78S1R@lists.linux.dev
X-Gm-Message-State: AOJu0YxbM73OfM5c/bvrxHuY/5+FX7xyo16ooggxcCUY99NB8zJKXhY1
	slJAmsldPf4H6jr8IG96tVndeC6vgLs/M46ijNmVm8/3K6FxqA9gJgxu
X-Gm-Gg: ASbGncsEssLDCKPVAAz0BhVc7wjpTxoJlViX4ToK44rlEY/52ACwxMPW3ab2TPGgd1i
	AtSdxC8vDNKtpSjo5gmCKaTMQnsrvfRyOQd9uUW4MZ8Rk0bPGHEfBT2t6GUdUmrOoeJn8a9Ra/r
	znvLU3ACLpS5Awg8N4QfV3508pLbjETq85PtrRBud8ONfLCIZpA2VYjwhMDR0eBbMVPOe4QMNtk
	YT0HXfj7AeFjWJI88IXcx/1agJAT6BvEeBiGaZC3lswhU2wNY9SdfD+AEQL8jsdn6I3dL+NqUS0
	ZMpI1u6Crk43eJhVaC/QTRWRCGrV5Vgb4s+Ym/qpFKgwEalrwAWILQbOupd8jsOiTPBkltqaW3m
	OuHqO+Y/djIHKL2MNc4Ocx/QYJh2/I9DLvfB256o23D4ZM5wwJYhhPo4Q+jugIu+/Buvb1q9NzX
	mNH+c0HbNO2Evn6RTmmfvWIV7wte2TdmWYucHNoFzhrQkwF9vs
X-Google-Smtp-Source: AGHT+IEQK9M+UEhXUxY/WFeaRZPh0DFjsNVaCKSh+luJ0k+GHsFsMy0/x61VLnd/4XfZ5D3SUwZ4aw==
X-Received: by 2002:a05:600c:a07:b0:46f:c55a:5a8d with SMTP id 5b1f17b1804b1-4778fe55101mr136563585e9.4.1763453845879;
        Tue, 18 Nov 2025 00:17:25 -0800 (PST)
Received: from ?IPv6:2001:818:ea56:d000:94c4:fb0e:28f:2a8d? ([2001:818:ea56:d000:94c4:fb0e:28f:2a8d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779920f2cdsm200467775e9.10.2025.11.18.00.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 00:17:25 -0800 (PST)
Message-ID: <34a55901fe0729145097d287a98746f23eea13d8.camel@gmail.com>
Subject: Re: [PATCH] staging: iio: adt7316: replace sprintf() with
 sysfs_emit()
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko
	 <andy.shevchenko@gmail.com>
Cc: Shi Hao <i.shihao.999@gmail.com>, Michael.Hennerich@analog.com, 
	lars@metafoo.de, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, 	gregkh@linuxfoundation.org, linux-iio@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Tue, 18 Nov 2025 08:18:28 +0000
In-Reply-To: <20251116152800.4c1849cc@jic23-huawei>
References: <20251116101620.25277-1-i.shihao.999@gmail.com>
		<CAHp75VdY7W8EgOfKuxtTALj777aVatxV5dqsxm688JTy=iVW2Q@mail.gmail.com>
	 <20251116152800.4c1849cc@jic23-huawei>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sun, 2025-11-16 at 15:28 +0000, Jonathan Cameron wrote:
> On Sun, 16 Nov 2025 13:08:07 +0200
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>=20
> > On Sun, Nov 16, 2025 at 12:16=E2=80=AFPM Shi Hao <i.shihao.999@gmail.co=
m> wrote:
> > >=20
> > > Convert several sprintf() calls to sysfs_emit() in the
> > > sysfs show functions, as it is the preferred helper and
> > > prevents potential buffer overruns.
> > >=20
> > > No functional changes intended.=C2=A0=20
> >=20
> > I briefly looked at it and see no issues,
> > Reviewed-by: Andy Shevchenko <andy@kernel.org>
> >=20
>=20
> Applied, but I will note that this driver is a long way from suitable
> for moving out of staging and I would be surprised if more than
> one or two of the lines changed in this patch make it through the
> necessary refactors (should anyone actually have another go at
> doing them).=C2=A0 Anyhow, I still think this is worth taking just to
> reduce the noise of remaining instances of this.
>=20
> I'd have deleted this long ago except I actually have one somewhere
> and it one of the supported parts was still listed as suitable for
> new designs when I checked not long ago.

Seems to be now "just" in production. So no longer advised for new designs.=
 I gave a
quick look and this is far from being a simple driver. It would require a f=
air amount
of work to bring it out of staging. So, are there users relying on staging =
drivers?
But I would assume that for staging we are still free to drop support it?

>=20
> ADI folk, I would like to hear if we should just delete this one.

I guess Michael is the best person to answer this question.

- Nuno S=C3=A1
