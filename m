Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD4938836F
	for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 07:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774339024; cv=none; b=kukpggtaajYAg4ZnWMcikkZvNI3fc6d48YBMIQX7A9Gy0rAkDOXbyr1RQJIBd/D5lj7hdXo7B00h2V143ceZX1PTbsrq5tRAm3apvSJS4F6QCtGy473zrXOvMoYAme5PpFiRoTvZreBIYtUXTgVKYx87qXoyAVqoKVnKbewpNYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774339024; c=relaxed/simple;
	bh=p70KRl2iyiH98RwY4hlNKdUPjdh2xLhI1lhyiI1eZxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M2/t2tTKbU6Y9PEMQqMDKkUYaHO6uRPVeIrBSqBES3KWg0Z4jz9vcs2Z+cHb2VeKUsc69SMuNdRWAQzzTmPeoqBhQjoxbjQ/TW1qWhGNSbO3dvVZb/uwVnMgrdbNBWgtVL0fNeaV11qrPGH+hQwVy/Jq/hjoqhsIjnnZaPBuntc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jLlNif9t; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jLlNif9t"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48541edecf9so7966435e9.1
        for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 00:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774339011; x=1774943811; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFYRVrG/zXzLAZQPA+I4Qd5czvKYpC40unjGxYVlu9I=;
        b=jLlNif9tSX1MuX4GxECDf6xD2AFDU8gfFLJsMmsvz+2XPSkz8V7yMw1EQ8hF0Hw3Po
         TFDINU+DXskZb9wHE/2WZitTBHta55a7HiazjBfJbI3QpZZwvtYIDlX8J5W2gjHsibhr
         9lDXWcs00Dz662CKGLTU3PZsekmJDTzAopEYbqqsIUYX/ri9dahhsOe74q38flKpgkTl
         H2/zrnB3oPMuRKd21V3+zkYEJvoPAGGiYzr6gSHWS5fv3Y2UGGryZzKuvo+qipMI9/03
         istfjrfFa5EtwPS87AlXulsdKKwyJH0Ov+KaS0Q+YDjwhyG/ugxC8I/aKuUceaiv86x4
         8RKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774339011; x=1774943811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wFYRVrG/zXzLAZQPA+I4Qd5czvKYpC40unjGxYVlu9I=;
        b=G9nwHa+rwKBKwrp0Exzaj4ahIjzdN/Jn1x55Ki4MnYWMDTR1pb9zOScc4ylJvStAXm
         q4FuhTQxtsxphMwrzfFhDLZty4ItcxbYN5CytNlHrrL8M6SC0NKv3wpy8I8YbxGJgPrm
         cqpvVEdXLTTiov8mUtkXUS8Ll/NsYHJTC8XZ6DDCnc9mFEWmq2TkebI8m85Y6nnPRQd4
         M2LzVhZcMFpzl1JfCk4J7L4x+32s3s4OsbFXpf6yj4XHcgANTZeVTTAPqCyEnPIvMWbH
         ULF/y1LwxrLuOgw19b4JSGygqM1z8/eZJI6LP6Cf+f99TYAYWxnZtYaoMMfaQ+XCHATn
         Vshg==
X-Forwarded-Encrypted: i=1; AJvYcCUD9Qz37FnDEyPEBw+93XDCvk9GoanIz6fzRYPWl020sCO4MavBpvAOKF2sUqqo344GKqkApR6khX+mPJ72@lists.linux.dev
X-Gm-Message-State: AOJu0YyJgHZysW+0JwwKwF8qiEmyV9qwmsY/dhz+vjkXQrgcQ4aZVBch
	ETvj9HG+vMZbshf70iO/yM4x4uiZJn9mwZXw0JX6gKmhVtBgcO/1pMqS
X-Gm-Gg: ATEYQzz3byymVIrZs1kySl5xhIqiDAqpzgNP4IZOzHPB5jqb3Pk27zu+ewlVv1JF89p
	gxoVfUzKjunv9tMcUMfUHg78TGdln12nF+uRHGW8sdRN3uu3IuK8kZD3M//kpF6buQX6VC5+lyP
	huJS74/TUHyETXvusTUAXBXmQy/fqax4A/RRVkUKSj3Oe/TNPL91HDUY5jby9FyoI3Z2LINCQlO
	1zpe6j8vwG8LyLJ5PKRPLj38GM2BDCGZyKXu2KA25VfHV8DLElYV9e86BYCp4juG9ovhjLzr1cN
	IKyst3sFR2jPG0y7WK1mGZTC2oWTbRH2uMIo4fzRzbOmocnivfakAdmPIpVFhhxdODkiM+LiJak
	aEU5FhEYi4MSr62QgnDc2Yk+pxDE9ar4+f05zpnzkK+bXopmgLLsIr8AARwl8bZ/iQI3Go2BK1R
	v5QSaJCjq8vnteawtInFDSOPDVME7GocnbdC9ud9++vOvlFF5FwuenFuevmx9DZQm5a4ggMl38f
	O7CQE5OEgQ=
X-Received: by 2002:a05:600c:4707:b0:480:20f1:7aa6 with SMTP id 5b1f17b1804b1-486fee231cdmr200567305e9.21.1774339011116;
        Tue, 24 Mar 2026 00:56:51 -0700 (PDT)
Received: from jernej-laptop.localnet (31.red-83-50-72.dynamicip.rima-tde.net. [83.50.72.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487110dd718sm12885685e9.29.2026.03.24.00.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 00:56:50 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn,
 nicolas.dufresne@collabora.com
Subject: Re: [PATCH] media: cedrus: validate H.264 reference list indices
Date: Tue, 24 Mar 2026 08:56:46 +0100
Message-ID: <5056688.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <20260324020431.1800-1-pengpeng@iscas.ac.cn>
References: <20260324020431.1800-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

CC: Nicolas

Dne torek, 24. marec 2026 ob 03:04:31 Srednjeevropski standardni =C4=8Das j=
e Pengpeng Hou napisal(a):
> Cedrus validates HEVC slice reference lists in cedrus_try_ctrl(), but
> the H.264 path still consumes ref_pic_list0/ref_pic_list1 indices
> straight from the stateless slice control. Those indices are later
> used to index the fixed-size decode_params->dpb[] array in
> _cedrus_write_ref_list().
>=20
> Reject H.264 slice controls whose active reference counts or
> reference indices exceed V4L2_H264_NUM_DPB_ENTRIES before the driver
> reaches the DPB lookup. This keeps the validation next to the existing
> Cedrus stateless control checks and avoids driver-specific
> out-of-bounds reads from malformed userspace control payloads.
>=20
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

This has same issue as doing it in common code, e.g. it would break
userspace.

One improvement would be to skip all indices which have value higher
or equal to V4L2_H264_NUM_DPB_ENTRIES here:

https://elixir.bootlin.com/linux/v6.19.9/source/drivers/staging/media/sunxi=
/cedrus/cedrus_h264.c#L212

Best regards,
Jernej

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.c | 23 +++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.c
> index d68da1eaa7aa..905084c097a9 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -42,6 +42,29 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
>  		if (sps->bit_depth_luma_minus8 !=3D 0)
>  			/* Only 8-bit is supported */
>  			return -EINVAL;
> +	} else if (ctrl->id =3D=3D V4L2_CID_STATELESS_H264_SLICE_PARAMS) {
> +		const struct v4l2_ctrl_h264_slice_params *slice =3D ctrl->p_new.p_h264=
_slice_params;
> +		unsigned int i;
> +
> +		if (slice->num_ref_idx_l0_active_minus1 >=3D
> +		    V4L2_H264_NUM_DPB_ENTRIES)
> +			return -EINVAL;
> +
> +		for (i =3D 0; i <=3D slice->num_ref_idx_l0_active_minus1; i++)
> +			if (slice->ref_pic_list0[i].index >=3D
> +			    V4L2_H264_NUM_DPB_ENTRIES)
> +				return -EINVAL;
> +
> +		if (slice->slice_type =3D=3D V4L2_H264_SLICE_TYPE_B) {
> +			if (slice->num_ref_idx_l1_active_minus1 >=3D
> +			    V4L2_H264_NUM_DPB_ENTRIES)
> +				return -EINVAL;
> +
> +			for (i =3D 0; i <=3D slice->num_ref_idx_l1_active_minus1; i++)
> +				if (slice->ref_pic_list1[i].index >=3D
> +				    V4L2_H264_NUM_DPB_ENTRIES)
> +					return -EINVAL;
> +		}
>  	} else if (ctrl->id =3D=3D V4L2_CID_STATELESS_HEVC_SPS) {
>  		const struct v4l2_ctrl_hevc_sps *sps =3D ctrl->p_new.p_hevc_sps;
>  		struct cedrus_ctx *ctx =3D container_of(ctrl->handler, struct cedrus_c=
tx, hdl);
>=20




