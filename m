Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5DE3D63
	for <linux-staging@lists.linux.dev>; Fri, 31 Mar 2023 18:54:22 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id cn12so19251006qtb.8
        for <linux-staging@lists.linux.dev>; Fri, 31 Mar 2023 11:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112; t=1680288861;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uAm5w/BgV+ualcvdqUfpIBSmMWRJ7Ixo/8KUSDUf6wY=;
        b=Khz9WpXFZoEp7QKh2GVHbGIFvMum3FoxXwERbrXyJLQdIeQl/rFcxEllenep1Zq8wM
         9CkHSaG64XbMyzbOaffevp1JK1clvO7fpUcQVAltBAPJLYORdjiXklRRvxT3/0HAt0C/
         juuUW0Ce9a2kgk+SFjCthUMnlJm4sqyk/uZq1/+HOIrSTM6OwgyMw8Pn4WSsnV/pkYS4
         fzF8fASURhgdpIQvT8wKwBxvoNkt10co61XwVTX2NwMy6Bb1dS+VdFkJsTsh8CPFiFnG
         J4JNXue1mN8XWPNNGtREwNCFN6ihnuippPVT3B8Z7hiHvh2imFwDArJw4kgl4ZY8McV1
         AJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680288861;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uAm5w/BgV+ualcvdqUfpIBSmMWRJ7Ixo/8KUSDUf6wY=;
        b=4V4MggGuaL5hRXNoMZspaBmUp0Qofe0l8Lq76OUHFculq50SEKb6y8nSrlCzl4I/tM
         sQCiAHz0K3B3N1wW1/cRRFHumkM9AtAaNUMnTO2NVBfd0ucu9b1iZT8OoSz/Zwvh/qG1
         KO+qjcHXNbat+H4tfReVAEzUBcpTA9PdL0689TEZcio+fJEK+zIHFfwg9HTHz98JRu8B
         OYgAQqDPkvA8WtupuYrycputQbF4w3eBuwM/lko8BB69bAKWzkPzRT4f3JcdO6+LPQgt
         dk3e6d7YB2ce+aPKSNS8ffLprpZgqrmv8q3LSmG5rMWHJclIaQmNgx73CwUsH+ydbNvx
         ZQLA==
X-Gm-Message-State: AO0yUKVNNJVQKMU4maQxWIDgpARcFGFcrj/IZfZ/lgvXNq0xqLukN4mE
	MeyfDwx8rQTP0VkZd4isMsfZcQ==
X-Google-Smtp-Source: AK7set+daBkEW3AmOiZY1jXtcAP2pYWH1K1y6fSO6tiLi7UWikLksdVGYOr1S8dgYrtZX1J6wiT2Xg==
X-Received: by 2002:a05:622a:184:b0:3bf:e13e:438f with SMTP id s4-20020a05622a018400b003bfe13e438fmr49210416qtw.36.1680288861692;
        Fri, 31 Mar 2023 11:54:21 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:a07e::580])
        by smtp.gmail.com with ESMTPSA id c7-20020ac84e07000000b003e3921077d9sm799278qtw.38.2023.03.31.11.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 11:54:21 -0700 (PDT)
Message-ID: <40774dc0ef32246af76a202caca3632abc1ae25f.camel@ndufresne.ca>
Subject: Re: [PATCH 2/9] media: v4l2: Add NV12_16L16 pixel format to v4l2
 format info
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Paul Kocialkowski
	 <paul.kocialkowski@bootlin.com>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Chen-Yu Tsai
	 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
	 <samuel@sholland.org>, Adam Pigg <adam@piggz.co.uk>, Thomas Petazzoni
	 <thomas.petazzoni@bootlin.com>
Date: Fri, 31 Mar 2023 14:54:20 -0400
In-Reply-To: <20230325210120.GB22214@pendragon.ideasonboard.com>
References: <20230324151228.2778112-1-paul.kocialkowski@bootlin.com>
	 <20230324151228.2778112-3-paul.kocialkowski@bootlin.com>
	 <20230325210120.GB22214@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Le samedi 25 mars 2023 =C3=A0 23:01 +0200, Laurent Pinchart a =C3=A9crit=C2=
=A0:
> Hi Paul,
>=20
> Thank you for the patch.
>=20
> On Fri, Mar 24, 2023 at 04:12:21PM +0100, Paul Kocialkowski wrote:
> > Represent the NV12_16L16 pixel format in the v4l2 format info table.
> > This is a 16x16 tiled version of NV12.
> >=20
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-common.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2=
-core/v4l2-common.c
> > index 3d044b31caad..5101989716aa 100644
> > --- a/drivers/media/v4l2-core/v4l2-common.c
> > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > @@ -280,6 +280,8 @@ const struct v4l2_format_info *v4l2_format_info(u32=
 format)
> >  		/* Tiled YUV formats */
> >  		{ .format =3D V4L2_PIX_FMT_NV12_4L4, .pixel_enc =3D V4L2_PIXEL_ENC_Y=
UV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .hdiv =
=3D 2, .vdiv =3D 2 },
> >  		{ .format =3D V4L2_PIX_FMT_P010_4L4, .pixel_enc =3D V4L2_PIXEL_ENC_Y=
UV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 2, 4, 0, 0 }, .hdiv =
=3D 2, .vdiv =3D 2 },
> > +		{ .format =3D V4L2_PIX_FMT_NV12_16L16,	.pixel_enc =3D V4L2_PIXEL_ENC=
_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .hdiv=
 =3D 2, .vdiv =3D 2,
> > +		  .block_w =3D { 16, 16, 0, 0 }, .block_h =3D { 16, 16, 0, 0 } },
>=20
> Not necessarily related to this patch, but I'm a bit puzzled by why
> V4L2_PIX_FMT_NV12_4L4 doesn't list block sizes.

It looks like Ezequiel introduced that initially, but didn't introduce any =
tiled
format, as a side effect, we missed it and no one ever used it.

In practice, its not dramatic, since most of the time, the alignment needed=
 is
bigger then the block (specially with only 4x4 tiles), but we should certai=
nly
fix that, thanks for spotting.

>=20
> > =20
> >  		/* YUV planar formats, non contiguous variant */
> >  		{ .format =3D V4L2_PIX_FMT_YUV420M, .pixel_enc =3D V4L2_PIXEL_ENC_YU=
V, .mem_planes =3D 3, .comp_planes =3D 3, .bpp =3D { 1, 1, 1, 0 }, .hdiv =
=3D 2, .vdiv =3D 2 },
>=20

