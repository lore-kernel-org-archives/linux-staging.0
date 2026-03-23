Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2341F1932
	for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 08:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774253101; cv=none; b=q0P0UwAJZPvWnwZ6n60nQxS4CmihSV/+p+FAFIe7Hl9gd6vs7rLMFZSk8h3tcYnjZdiserUHVEzjpniFy3Uflncy+qdf4t068Maju1wGZ0tlfHNMOwROcuoQ4KTeOeNomBtdiYSiWq1xsvAn0/OUhCLyZKzVOF6MLPIgEjn8a2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774253101; c=relaxed/simple;
	bh=uEdsCzaHopkYv6CEizYbfcQBuyNgQoePrple8BRlyJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ssA9NNdJUicLO4TW80jHuSdkVVU0wYeS2jEckg2VqRBA38wrm07cEAU5mcuJ5PLuiFW0cuYYCpNycogqKWFEdrGdK3qmA5Pn+mdAh97vGP/7hZ4mJIVIzsE4FkEumE7KLX2s5F2rHu9waT0fg2ZBO3U6fL3s2QNxheNT9aolH1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tti5sdAb; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tti5sdAb"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486fd27754bso30706775e9.3
        for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 01:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774253098; x=1774857898; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zocw8FuDkC/LanJ1/4h/CJiS7ZjCNwFDOerkZTo4ZLc=;
        b=Tti5sdAbIARgLl6eZQauwgvzDJehKxT1A8PtLNvYN3dHPtHGETnb5u8Ea2vWSTYaBy
         MvBU9nJzVd6ymkzup7Wn41+SbaIffv7NV3Mg4Bs2QdC7+/PEqh0PGxlFrS3ZHgbVpFF1
         FEW+N2Zsyvm3TPtrmfqm52WVRulnYFDiWiSewleU3UAK3lbDrQ2L2kyygb7vLXl8Blsg
         wABEBSGamFbfhxIYd+9bF+oeA9NE4QxX1WIdnHkPF83NxtG+sgtnBcN2mhFzAtXgq/2u
         ure7P5PglCGOfB11UJd0uDtDzualr8/anKl/2zMLFyyEUgTyshunwzeSgOH/0TI/Zu9A
         8RGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774253098; x=1774857898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zocw8FuDkC/LanJ1/4h/CJiS7ZjCNwFDOerkZTo4ZLc=;
        b=FQcIZyPDV47JEICYWySJvfirCcIvhmGXRd03Xrjo3gu1mpVgOtFbJqWnNNQ+OcipVz
         YpJGgqkitm5umtDErLKDLYEen0lZrJVpF5vHoxPJwEnOADXffoMbWDD2BXYRwGFNqupc
         3gzcqEJbk29I5AHl3owJk7bxD5Uxpak2DO57ciD1IUowHS97EKAh1AbBwjggSIYL+dFJ
         idckBNZaatgxQkUqtQawq/3qI5ZHCRrKJ1jhWnxxN428eMDQjuE1t9coagR8yaYWAjLm
         j+tOO4M8KkBzNnIi/Ygi+eZTNgM1QGEKdBrPHPCnGZpsmgOgehVnT4ZrthjuXc1E65xI
         0CEg==
X-Forwarded-Encrypted: i=1; AJvYcCWuDg+Q5EhAtQKoaURQjY749pacAwa17fI3soM2+uEw5Uny09ai99LvUmMyAC3skB8zrXyrP2WFNvPUP+KA@lists.linux.dev
X-Gm-Message-State: AOJu0Yxd09va6vnlF661RF1cbCq+TZuaEWLqO1UAkFrGlUpaEqlNGxbs
	ynsuV2ovwlFOKL/y/VmSfy/rv7k4JlmQtBs9Eq4jSl7/UZlvWKvFvm73
X-Gm-Gg: ATEYQzw5Vf3sgz0p/HC3eljt9Q/8CttYvb8/7qsMo3xTUxH7fz63+o7pzYuko0zSiRf
	WyN6gGK7BpAIMJB7WGazP1A9SNapXIUWdeaZ2u+ao5C/XrdjUmLJvVcdnRHp2ZMT28WIbVxkzrh
	tuTTSElEFK3yxDZRUqXEsCb8mPd6hzt3te588nEvxpF0gF6Y+tKfKZxpKvdcqr7+iF1B1rdyCEH
	DCj4vTeEqqB49gcDf67Daq2um546qYJziNBFu+CODF69P9xk/fxxWigwpr28oHVcW2NTzt25+7u
	E+gKN63fzqXsv4PygFohdzKn0PFgN2LJdORkAlnL2X7KEtMh869UwNcC60nyeKfplbjMiJqTPIm
	HAZ9eXKGl4vi1vbM5ITZj04I07RF9DYgzedslOp8Z8wXmUAgowzZsM84hu2QWLBQetGhGgZwCG4
	CvVpEQGzR0i2+ZQehirGADrbD1pA+Ar0Vbta/FFFbY+9LQVDwZJJS2Bevdw9UJKY+arEDhC0UIi
	LSpEirC
X-Received: by 2002:a05:600c:4e8e:b0:485:3e6c:aacb with SMTP id 5b1f17b1804b1-486feda8c69mr158012695e9.4.1774253098203;
        Mon, 23 Mar 2026 01:04:58 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-69-125.dynamic.telemach.net. [178.79.69.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff19d452sm76320155e9.19.2026.03.23.01.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 01:04:57 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mripard@kernel.org, Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: paulk@sys-base.io, mchehab@kernel.org, gregkh@linuxfoundation.org,
 wens@kernel.org, samuel@sholland.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 pengpeng@iscas.ac.cn
Subject: Re: [PATCH 7/7] media: cedrus: validate HEVC slice reference lists
Date: Mon, 23 Mar 2026 09:04:56 +0100
Message-ID: <2402496.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20260323070314.42949-1-pengpeng@iscas.ac.cn>
References: <20260323070314.42949-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 23. marec 2026 ob 08:03:14 Srednjeevropski standardni =C4=
=8Das je Pengpeng Hou napisal(a):
> Cedrus consumes HEVC slice parameters directly from stateless V4L2
> controls, but it does not validate the active reference counts or the
> ref_idx_l0/ref_idx_l1 values before using them in fixed-size 16-entry
> reference arrays. Oversized counts or indices can therefore walk past
> the end of those arrays in the HEVC decode path.
>=20
> Reject HEVC slice controls whose active reference counts or reference
> indices exceed V4L2_HEVC_DPB_ENTRIES_NUM_MAX.
>=20
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

There is nothing Cedrus specific here. Why not move it to common code?

Best regards,
Jernej

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.c | 22 +++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.c
> index 6600245dff0e..d68da1eaa7aa 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -77,6 +77,28 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
>  			ctx->bit_depth =3D bit_depth;
>  			cedrus_reset_cap_format(ctx);
>  		}
> +	} else if (ctrl->id =3D=3D V4L2_CID_STATELESS_HEVC_SLICE_PARAMS) {
> +		const struct v4l2_ctrl_hevc_slice_params *slice =3D ctrl->p_new.p_hevc=
_slice_params;
> +		unsigned int i;
> +
> +		if (slice->num_ref_idx_l0_active_minus1 >=3D
> +		    V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
> +			return -EINVAL;
> +
> +		for (i =3D 0; i <=3D slice->num_ref_idx_l0_active_minus1; i++)
> +			if (slice->ref_idx_l0[i] >=3D V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
> +				return -EINVAL;
> +
> +		if (slice->slice_type =3D=3D V4L2_HEVC_SLICE_TYPE_B) {
> +			if (slice->num_ref_idx_l1_active_minus1 >=3D
> +			    V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
> +				return -EINVAL;
> +
> +			for (i =3D 0; i <=3D slice->num_ref_idx_l1_active_minus1; i++)
> +				if (slice->ref_idx_l1[i] >=3D
> +				    V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
> +					return -EINVAL;
> +		}
>  	}
> =20
>  	return 0;
>=20




