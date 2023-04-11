Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A10B8F51
	for <linux-staging@lists.linux.dev>; Tue, 11 Apr 2023 15:30:56 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id cg4so376359qtb.11
        for <linux-staging@lists.linux.dev>; Tue, 11 Apr 2023 08:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112; t=1681227055; x=1683819055;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cfTBJGcArvpMvQorRR/sDUXlP2hWx7bq+L50IV9DIms=;
        b=JKZPjE5NStYFMsyKIK+QBmpGoGQK5yp5uKuW4jvH8JOoyl5W/KcBtlebcPLgyZpB8R
         r/eXObo8oZId0qiXxdDmIY6RII3S7Z4bHBThx9Nw7CKGTl48ToVAkcaQYs6qFNojsl+R
         y+MMllVyCd5SGUfPsMvA8/qt8bgYnjwJIM83kvu1MOuNOAv8YuVUuILmkIgV8zwGDb3Y
         k6jTM8A5W0np+KUdxQP2T+eptr44mVGsjeSIHM08lq9LMb5XTrkIsZaPMkVNOHwPhvOG
         /o7ba1w6i1gE6rxqaPP+u5yQ00cE64lXGP5TfpgpPd0qtoWJ9CE+sfBMQf8KNLbBjKpk
         JDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681227055; x=1683819055;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cfTBJGcArvpMvQorRR/sDUXlP2hWx7bq+L50IV9DIms=;
        b=ivV4foQBM2GMuqr1m3KmwaAtnmyhmeCCgaLRK2sBamsPJjPDdhmpDO8lVHYM+d9UqK
         ud/wxUkWEw/upm/Y2G4oqJCQuNnP+JemWEYdzDsfgQmUVIz5/OqvCDNwxsrBfZOvREf1
         8qt7zJhPeaCgrx+eYoVxXBZnRbeoR4N3oNtJS1UsRCytrZdwn6htoQmgOZB+GUkY/A6l
         22/OYK8jqWkYIU69GDWAUHQXvDcFEUOSLKp7sLBOzSKFXZC3X3Yyb/oAYDtEneV6qG5J
         xFberUHLJrrG702hsd7xsNKBbYHQA+s8YlTC34+YV6o4TuF3AVo3bvwjz6InUkzgeCwB
         fhGg==
X-Gm-Message-State: AAQBX9dqdxvW+WNc+AsBteBKzuep39NbcEkaT7tO7WCXLrLfOVylIICi
	1tGmWeyx8MIerW9ttXlQiAW8QQ==
X-Google-Smtp-Source: AKy350aFEJeoltoyWsD6S1OqbhVS42G2M1t36SP58Nd2uIo2BOAovB2zr1zgb510F7xMjZesc4AYiQ==
X-Received: by 2002:a05:622a:291:b0:3bf:d9f3:debe with SMTP id z17-20020a05622a029100b003bfd9f3debemr4919958qtw.59.1681227055380;
        Tue, 11 Apr 2023 08:30:55 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:199e::580])
        by smtp.gmail.com with ESMTPSA id x1-20020ac87301000000b003e6610471c1sm3634284qto.16.2023.04.11.08.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 08:30:55 -0700 (PDT)
Message-ID: <ebbfcf603930f0414abff23b329e66a59bf1f812.camel@ndufresne.ca>
Subject: Re: [PATCH 2/9] media: v4l2: Add NV12_16L16 pixel format to v4l2
 format info
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
Date: Tue, 11 Apr 2023 11:30:54 -0400
In-Reply-To: <20230324151228.2778112-3-paul.kocialkowski@bootlin.com>
References: <20230324151228.2778112-1-paul.kocialkowski@bootlin.com>
	 <20230324151228.2778112-3-paul.kocialkowski@bootlin.com>
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
> Represent the NV12_16L16 pixel format in the v4l2 format info table.
> This is a 16x16 tiled version of NV12.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/v4l2-core/v4l2-common.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index 3d044b31caad..5101989716aa 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -280,6 +280,8 @@ const struct v4l2_format_info *v4l2_format_info(u32 f=
ormat)
>  		/* Tiled YUV formats */
>  		{ .format =3D V4L2_PIX_FMT_NV12_4L4, .pixel_enc =3D V4L2_PIXEL_ENC_YUV=
, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .hdiv =3D=
 2, .vdiv =3D 2 },
>  		{ .format =3D V4L2_PIX_FMT_P010_4L4, .pixel_enc =3D V4L2_PIXEL_ENC_YUV=
, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 2, 4, 0, 0 }, .hdiv =3D=
 2, .vdiv =3D 2 },
> +		{ .format =3D V4L2_PIX_FMT_NV12_16L16,	.pixel_enc =3D V4L2_PIXEL_ENC_Y=
UV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .hdiv =
=3D 2, .vdiv =3D 2,
> +		  .block_w =3D { 16, 16, 0, 0 }, .block_h =3D { 16, 16, 0, 0 } },
> =20
>  		/* YUV planar formats, non contiguous variant */
>  		{ .format =3D V4L2_PIX_FMT_YUV420M, .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 3, .comp_planes =3D 3, .bpp =3D { 1, 1, 1, 0 }, .hdiv =3D =
2, .vdiv =3D 2 },

