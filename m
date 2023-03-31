Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDF23D63
	for <linux-staging@lists.linux.dev>; Fri, 31 Mar 2023 19:07:25 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id ga7so22655417qtb.2
        for <linux-staging@lists.linux.dev>; Fri, 31 Mar 2023 12:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112; t=1680289645;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pMRUsebyQ3K+oRbvGz0OgZqKFBtrPEJ2p4+ZFvhigaU=;
        b=I5MV7Ra7W/kSWOXMGIZX/KLAGka3rXJfAxq57+RW9RTNhZzh+AkKzQXMTFC6x9T8JF
         aGTJPaQEvzmHnA330xY24D+Zgx1DZNDVtvTQTRUJE/cCqt4T/mX4AzDjqkjbZqPjnp7J
         dl5wHL4r9BQtpXEEwG3ZAslhQ+h7cQsw+D9iv8L5aTVCGnTXI/keyMeyC6LRzS3CLFd4
         rr4dVc4O2/zXtV4OfdOY3vex3c7urzFLwyAt2Rtrp55YVo5GBRt2bIfb0rBdhFIQY8f/
         9mwrM1bFvRmuYxr9VpzSloxKfjzziTbc2t985meYqH5k2Dm+jsg2vbjVNWTf5oU90pZz
         JuQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680289645;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pMRUsebyQ3K+oRbvGz0OgZqKFBtrPEJ2p4+ZFvhigaU=;
        b=Rks/hOlMl4lJryjS8W1JXidJHHzfE+ApLftsQewz+AtlJGrZ/ZC6a0QO715+wW5fqv
         uj0GUYIdKTyz8QXCQZfgb1ljVoHWpkfIZjI/rwsbKwbbVJuTVlLsJqnMqn/XX0TtX0gY
         xi+aw3XNn04eyRcX45/1wVMXee/lhIsIGMbFUqf4rGC71AjZ7mIfIJ92ia3qTtSXYMDy
         PWLCvFO9vGl9t/kEu8MfUP9MUNvSkNi3ReIjRlwD0hGh/Amn6Ydsuzli8vnhm9hgZ+X2
         gQpXroSadg/l+rO0ULOxgDgJAd+1oIURtcdetLWB/Bwl7P9Tl0im8mc9PiX0MeUXZssR
         qpBA==
X-Gm-Message-State: AO0yUKWSFnMvGGfR+2rc0kc0qyPuOnI5SUB9LI47au114tvLASF1fFs9
	NtiHSFYjBPAGrTO6qGk4uHrGGg==
X-Google-Smtp-Source: AK7set+yzGmjUCCfKmLI0eGwVq5GmGvjBm883sXpbX5Kxiis3RtX5l/GNMfOuCsLPZdohe+mayr6uQ==
X-Received: by 2002:a05:622a:181b:b0:3d0:7bdf:42c4 with SMTP id t27-20020a05622a181b00b003d07bdf42c4mr48530950qtc.59.1680289644733;
        Fri, 31 Mar 2023 12:07:24 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:a07e::580])
        by smtp.gmail.com with ESMTPSA id e1-20020a05620a014100b0074a1d2a17c8sm701489qkn.29.2023.03.31.12.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 12:07:24 -0700 (PDT)
Message-ID: <57144a4a5dc9994319bb1f7c3a75a1943227417c.camel@ndufresne.ca>
Subject: Re: [PATCH 4/9] media: v4l2: Add JPEG pixel format to v4l2 format
 info
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Adam Pigg <adam@piggz.co.uk>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 Mar 2023 15:07:23 -0400
In-Reply-To: <20230324151228.2778112-5-paul.kocialkowski@bootlin.com>
References: <20230324151228.2778112-1-paul.kocialkowski@bootlin.com>
	 <20230324151228.2778112-5-paul.kocialkowski@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Le vendredi 24 mars 2023 =C3=A0 16:12 +0100, Paul Kocialkowski a =C3=A9crit=
=C2=A0:
> Represent the JPEG pixel format in the v4l2 format info table.
>=20
> Note that the bpp is set to 1 which is not a proper way to estimate
> the needed buffer size for a given JPEG image. However the compression
> ratios of JPEG typically allow fitting the image in a smaller size,
> even though extra metadata could increase the total size by an
> arbitrary amount. Thus it is not a perfectly safe way to calculate the
> size of a JPEG buffer for given dimensions but it still provides a
> reasonable approach.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index 5101989716aa..8b2f201a8918 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -317,6 +317,9 @@ const struct v4l2_format_info *v4l2_format_info(u32 f=
ormat)
>  		{ .format =3D V4L2_PIX_FMT_SGBRG12,	.pixel_enc =3D V4L2_PIXEL_ENC_BAYE=
R, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .hdiv =
=3D 1, .vdiv =3D 1 },
>  		{ .format =3D V4L2_PIX_FMT_SGRBG12,	.pixel_enc =3D V4L2_PIXEL_ENC_BAYE=
R, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .hdiv =
=3D 1, .vdiv =3D 1 },
>  		{ .format =3D V4L2_PIX_FMT_SRGGB12,	.pixel_enc =3D V4L2_PIXEL_ENC_BAYE=
R, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .hdiv =
=3D 1, .vdiv =3D 1 },
> +
> +		/* Compressed formats */
> +		{ .format =3D V4L2_PIX_FMT_JPEG,	.pixel_enc =3D V4L2_PIXEL_ENC_COMPRES=
SED, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 1, 0, 0, 0 }, .hdiv =
=3D 1, .vdiv =3D 1 },

This is ackward, at best. Guesstimating the compressed buffer size is a val=
id
use case, but this table and the related helper function seems badly suited=
.
When I look at the stateless decoders that do that, they take into account =
the
fact that the compression can handle different bit depth, and difference
subsampling (choma idc). In this implementation, JPEG is reduce to 4:4:4, 8=
bit.

I'd like to reject this change, and recommand coming back with a suitable
integration, so that it can be special cased and the driver can communicate=
 the
required information to narrow down the estimate. And this way, you are act=
ually
making it usable for other compressed format like H.264, HEVC, VP8, VP9 AV1=
 etc.

Nicolas

Nacked in that form.

>=20
>  	};
>  	unsigned int i;
> =20

