Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795713696;
	b=g8i4EwEJgHOGFESmnI/Mm3RdA6o4JBpZWvbn2eTvsQSq4qD6KWnxGMWqrEKZA9Pvfh1L
	 IwFcfCk9F+u7FBxX3mL8W5o5DjvmYMqvIBtN3o1O27xmuSNRNgqICxiAO1ObtQfDKY5ow
	 aBtoFOW/1ygRqG/YCkPBOH5179sflGvzTtmE6u0yJ90/nAyws0V99UHWuxcUOiw81jmGG
	 JFTe+rVqseldRapc9RUXi5rE0r+poyEWShbclgmdRpTABEFdkL5zcIZP6tZI5MRWufU63
	 sgsdgVbzHSHCb3tgsxWsKermnSeCPWcY8xYpMYzOeKoQnYresLTXCy6g44zyU3aO1eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795713696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=sPlvcQPGEEm8iV8OkCIRBzVDRIB9FJj4cVWpQcsCjok=;
	b=gGuacvAbmKYnj5yVc1RSaOinZhrdRlLwTwIVQMt8aA4BDDw29hncPS3cOYHtG2luOjWz
	 fEUsFOo9bAVaC/7g/vX4JUg9/ps7YyMpTOimGjj15Ntj5kCxrT0ire9u5XojFx+vZPR+Z
	 9dnZAX0bFcvzsWslrebI+ytaCK0X0yxff0eObsoI5OqaJArt3H/RSrj7nfa6EXt0wBDlB
	 hlsJCW7XLuKC0T+HKmC6vgaFZg51HlkKNGS417WIS9bYoZv4qrevJ802dd90MXtCA+3KU
	 A+LcFv+Efavwd/9DPNctTHergwespawHkwds/yvQWc4lgMJ6c4wzf6pWbGAUnA3yHPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sJuHOjPI;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492AB606A339
	for <linux-staging@lists.linux.dev>; Thu, 26 Nov 2026 17:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 492AB606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sJuHOjPI
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4b467581b98so70623125e9.0
        for <linux-staging@lists.linux.dev>; Thu, 26 Nov 2026 09:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795713694; x=1796318494; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sPlvcQPGEEm8iV8OkCIRBzVDRIB9FJj4cVWpQcsCjok=;
        b=sJuHOjPI+iuteZF29g7WxksUA/sAlvfYcZB4RFMpFkj1JiMU77aKEnym3qdbOEAnZo
         WBogN8Tjnpe/R9mj8tRYV2OAWgeekkA+Q5bNxhT/XaGWlJCvgYgmwpNcpoTfuGhWNle1
         XuKoZR23WMhUMvuXqC+CBuEYiv8pAWf98aKSir+v6RFH/5UdnmYJXK0ybgvffGGbioio
         MNXJjvku7y9o4YsuVGaE/aBVe1ddXPthrRQkiDa50QWs5NVxPWjOdf9PtX4Frk/JpSN1
         oh+tKxhKcMr+EPdWQh68koj5pzy0A1TcEemMTss47MKp55OQIB4qrMI+R06DThvpOgPy
         vGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795713694; x=1796318494;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sPlvcQPGEEm8iV8OkCIRBzVDRIB9FJj4cVWpQcsCjok=;
        b=XyhhfmEEwDjG6DDPfLnLqNg7nULLm5mYojQVtph6OrHWep3xi8lmanZSSs8E253NuS
         bKz52vQhVSbofNtyn3qYMww23BSudDWDYFnJhD8xJN+xTAaoSaCHWuJaxOQaWSTSsv6n
         WbfyeI53ganIWA3G3+Pqu6J50tDMK6jvoE0ZDR2zP3UA9yVt/glywF432BE0w/N1Bv/h
         ij1qcFnycClM8cvhHljhXl+EamIfpoq08ati/q58pSxDTZ3yY9mBGMUq0veNIjrPIb5L
         lK1tfgIYlXE3aESVZodhZAPPZaEMviWyisLBm1woMPx1NxWQCM2hMGrwyZIRroZBrEcV
         dlHQ==
X-Forwarded-Encrypted: i=1; AL+hErFWbxN/R4pb2pC4CmeO5hbnWDjLrP7CBQBxAj4h5wPoY5uBA78KdBgRY1N6FfBcdpbd9uJdOOOCkdkMK402@lists.linux.dev
X-Gm-Message-State: APuU4Z8I4JJgvQ0mUPNglUokrsKaOJr1M7CeRGxai+d38PU9btHec/QC
	uE3NdgEqSD3tDRDlpm7yNJaZrRVlbe8Lg56W7Enit0dY7n+fsr1spFmw
X-Gm-Gg: AZFdTZeh3u014+pMy4bnMaEAi54j3vVVokzbe3MefhrP29OqVj7EqjgX5aBfjFyoG+N
	15Jy8IHR1GS9GLsmjZCL5lZ60o7BfgmFJ15j+A6WKGafnAMou/NvpaSLPkT9DznhRo+MFZLV/c8
	UjZuMZdAx3nk8diUF65ulj5XyZtCdkIbx2FgKFnqss5fko/16crunc3EubYh+6zNW8fmoyzm9Lw
	oasqEx3vGQJ+Ii7diZBNT98OgJivMa09W8cnj+QmiV5xexGBaKJQe63VN1hxBNVZKqIDdZoVD/+
	S7Cbhep4mEbw14RidrX2IMtT/6QdwQtyCdm73lb1WBmzYYQitO/gJw3O/olnLv8gJBucSyu8fIE
	vB8J7HoeLe7beYcARYh/vIx7HLyJqtpbZPuytLGulELhSy/StZEnzRawHXfVsYqiwqIfDZhA04g
	fe62Ne3GFZzpZI+qgc6Mtgw8Rg9ONrRyGdlLsUGNdpwVWQ4qPye3gvwN13rda7l1bwpZNeP6tv0
	LWGundVgYSt3BN09zbnLlS1hRXDhIbrA7ScWT9cQJ1625Bg88hEkw5tZeoMZcTYxsYDLHTfVzYN
	GHC/xJA8uog7B2BjBdfCAMJ8CSPkgNuPhCX/uN2laZwnVCDPwArhcPYctNdA+Z65zLE8t66P6mv
	iVVj1ZK6dI5WDoDllZZ4ApAFdn0nxNGKnhFGR8d7w2zmnSee411O+DV3vdAIvrqJeZgRiFWFr2K
	tnevltqL3W8QBm14Jy93LxgJFa+ugQ92qLRrcWJOeTvWqV1JXxJ0AW4qy7lZY50a7X7z7VSTl4V
	jzddZVKQj9+b8MtCYiOdIdzv0gljZCJsFEB4haGOUQ/qb49W+tDRuMae+bNVGQ=
X-Received: by 2002:a05:600c:a55:b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4bb889234a7mr403969765e9.16.1795713694512;
        Thu, 26 Nov 2026 09:21:34 -0800 (PST)
Received: from jernej-laptop.localnet (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906e4ce6sm373445195e9.4.2026.11.26.09.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:21:33 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Hans Verkuil <hverkuil@kernel.org>, aiyengar1990@gmail.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
Subject:
 Re: [PATCH 1/2] media: cedrus: fail buffer allocations that do not fit with
 -ENOMEM
Date: Thu, 26 Nov 2026 18:21:32 +0100
Message-ID: <euqQyxcYQfOA1pYfEtNPBw@gmail.com>
In-Reply-To: <20261119-b4-cedrus-generic-fixes-v1-1-f9f50812c85b@gmail.com>
References:
 <20261119-b4-cedrus-generic-fixes-v1-0-f9f50812c85b@gmail.com>
 <20261119-b4-cedrus-generic-fixes-v1-1-f9f50812c85b@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 19. november 2026 ob 17:34:47 Srednjeevropski standardni =
=C4=8Das je Arun Iyengar via B4 Relay napisal(a):
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> vb2-dma-contig allocates with GFP_KERNEL, so a buffer pool that does
> not fit in memory invokes the OOM killer. Set __GFP_RETRY_MAYFAIL on
> both queues: the request returns fewer buffers or -ENOMEM instead.

This is correct only for IOMMU allocation. CMA fails directly.

Please update commit message.

Best regards,
Jernej

>=20
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_video.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/=
staging/media/sunxi/cedrus/cedrus_video.c
> index ad4ec3490775..9b2d24e77fdb 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> @@ -602,6 +602,7 @@ int cedrus_queue_init(void *priv, struct vb2_queue *s=
rc_vq,
>  	src_vq->dev =3D ctx->dev->dev;
>  	src_vq->supports_requests =3D true;
>  	src_vq->requires_requests =3D true;
> +	src_vq->gfp_flags =3D __GFP_RETRY_MAYFAIL;
> =20
>  	ret =3D vb2_queue_init(src_vq);
>  	if (ret)
> @@ -616,6 +617,7 @@ int cedrus_queue_init(void *priv, struct vb2_queue *s=
rc_vq,
>  	dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
>  	dst_vq->lock =3D &ctx->dev->dev_mutex;
>  	dst_vq->dev =3D ctx->dev->dev;
> +	dst_vq->gfp_flags =3D __GFP_RETRY_MAYFAIL;
> =20
>  	return vb2_queue_init(dst_vq);
>  }
>=20
>=20




