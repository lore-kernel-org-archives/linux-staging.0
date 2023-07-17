Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5D5253CA
	for <linux-staging@lists.linux.dev>; Mon, 17 Jul 2023 15:45:15 +0000 (UTC)
Received: from nicolas-tpx395.localdomain (unknown [IPv6:2606:6d00:11:83d4::7a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 85E7B6602329;
	Mon, 17 Jul 2023 16:45:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689608714;
	bh=nfXpPEOOT+DQxYAty6Ka9OIALcouR/KYehklbnLoYLM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=akO6ybvYtgpoWKI83h/6uRWK6loma3uiqETg9r7daQEK0m9x41dnp17GBuP3YnMDH
	 Ed/giYV5SvqTNjnzYTbMhZVtYpXdYbr0+Nqd6lQZ1NuofLlXGrBTRVMF7TTE8ZDk1n
	 AFzPkNujdIg/SoV8zg7N3m3si82UkDxH2Vs6itu+taJw5c6TuJr+zfMmAScm9wOOG/
	 EERmNTPXzyT030KVtxGAmxzpTKZoRuDc/SMpxwNrN1vxPvZi0+2UW3s0MnRg9mlx38
	 3sCttwOzmSGXBkosxVFKN0fC6nzmhX/f/GB/3Knzq87BBvO9uoYnbok+nXgGNHQpkB
	 iYdf5U2HHJ0bg==
Message-ID: <7046e828625a2acd97c48aec9f3b0ef0cc4930ed.camel@collabora.com>
Subject: Re: [PATCH] media: rkvdec: increase max supported height for H.264
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 ezequiel@vanguardiasur.com.ar, mchehab@kernel.org,
 gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kernel@collabora.com
Date: Mon, 17 Jul 2023 11:45:04 -0400
In-Reply-To: <20230717150611.42832-1-benjamin.gaignard@collabora.com>
References: <20230717150611.42832-1-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Le lundi 17 juillet 2023 =C3=A0 17:06 +0200, Benjamin Gaignard a =C3=A9crit=
=C2=A0:
> After testing it is possible for the hardware to decode H264
> bistream with a height up to 2560.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Thanks, this could possibly have a Fixes tag ?
Fixes: cd33c830448ba ("media: rkvdec: Add the rkvdec driver")

With or without the that though:
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/staging/media/rkvdec/rkvdec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/medi=
a/rkvdec/rkvdec.c
> index 134e2b9fa7d9..84a41792cb4b 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -120,7 +120,7 @@ static const struct rkvdec_coded_fmt_desc rkvdec_code=
d_fmts[] =3D {
>  			.max_width =3D 4096,
>  			.step_width =3D 16,
>  			.min_height =3D 48,
> -			.max_height =3D 2304,
> +			.max_height =3D 2560,
>  			.step_height =3D 16,
>  		},
>  		.ctrls =3D &rkvdec_h264_ctrls,

