Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08AD72
	for <linux-staging@lists.linux.dev>; Mon,  9 Aug 2021 18:36:34 +0000 (UTC)
Received: from chickenburger.collabora.co.uk (chickenburger.collabora.co.uk [46.235.227.242])
	by bhuna.collabora.co.uk (Postfix) with ESMTP id 139CC1F42E7E;
	Mon,  9 Aug 2021 19:36:31 +0100 (BST)
From: "Ezequiel Garcia" <ezequiel.garcia@collabora.com>
In-Reply-To: <5154683.x8GX3iSW2O@kista>
Content-Type: text/plain; charset="utf-8"
X-Forward: 181.95.8.213
Date: Mon, 09 Aug 2021 19:36:30 +0100
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, "Andrzej Pietrasiewicz" <andrzej.p@collabora.com>, "Benjamin Gaignard" <benjamin.gaignard@collabora.com>, "Boris Brezillon" <boris.brezillon@collabora.com>, "Ezequiel Garcia" <elezegarcia@gmail.com>, "Fabio Estevam" <festevam@gmail.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Hans Verkuil" <hverkuil-cisco@xs4all.nl>, "Heiko Stuebner" <heiko@sntech.de>, "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Nicolas Dufresne" <nicolas.dufresne@collabora.com>, "NXP Linux Team" <linux-imx@nxp.com>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>, kernel@collabora.com, "Adrian Ratiu" <adrian.ratiu@collabora.com>, "Daniel Almeida" <daniel.almeida@collabora.com>
To: =?utf-8?q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <3ce7-61117580-f1-4ae96900@79504131>
Subject: =?utf-8?q?Re=3A?= [PATCH v3 05/10] =?utf-8?q?media=3A?==?utf-8?q?_uapi=3A?= 
 Add VP9 stateless decoder controls
User-Agent: SOGoMail 5.0.1
Content-Transfer-Encoding: quoted-printable

Hi Jernej,

On Monday, August 09, 2021 15:04 -03, Jernej =C5=A0krabec <jernej.skrab=
ec@gmail.com> wrote: 
 
> Hi Andrzej!
> 
> Dne =C4=8Detrtek, 05. avgust 2021 ob 16:42:41 CEST je Andrzej Pietras=
iewicz 
> napisal(a):
> > Add the VP9 stateless decoder controls plus the documentation that =
goes
> > with it.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Co-developed-by: Ezequiel Garcia <ezequiel@collabora.com>
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> > Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> > Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
> > Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> > ---
> >  .../userspace-api/media/v4l/biblio.rst        |  10 +
> >  .../media/v4l/ext-ctrls-codec-stateless.rst   | 545 ++++++++++++++=
++++
> >  .../media/v4l/pixfmt-compressed.rst           |  15 +
> >  .../media/v4l/vidioc-g-ext-ctrls.rst          |   8 +
> >  .../media/v4l/vidioc-queryctrl.rst            |  12 +
> >  .../media/videodev2.h.rst.exceptions          |   2 +
> >  drivers/media/v4l2-core/v4l2-ctrls-core.c     | 174 ++++++
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   8 +
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
> >  include/media/v4l2-ctrls.h                    |   4 +
> >  include/uapi/linux/v4l2-controls.h            | 433 ++++++++++++++=

> >  include/uapi/linux/videodev2.h                |   6 +
> >  12 files changed, 1218 insertions(+)
> > 
> 
> <snip>
> 
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linu=
x/v4l2-
> controls.h
> > index 5532b5f68493..8f8c3c1ad885 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -2010,6 +2010,439 @@ struct v4l2=5Fctrl=5Fhdr10=5Fmastering=5Fdi=
splay {
> >  	=5F=5Fu32 min=5Fdisplay=5Fmastering=5Fluminance;
> >  };
> >  
> > +/* Stateless VP9 controls */
> > +
> > +/**
> > + * enum v4l2=5Fvp9=5Floop=5Ffilter=5Fflags - VP9 loop filter flags=

> > + *
> > + * @V4L2=5FVP9=5FLOOP=5FFILTER=5FFLAG=5FDELTA=5FENABLED: the filte=
r level depends on
> > + *	the mode and reference frame used to predict a block
> > + * @V4L2=5FVP9=5FLOOP=5FFILTER=5FFLAG=5FDELTA=5FUPDATE: the bitstr=
eam contains 
> additional
> > + *	syntax elements that specify which mode and reference frame del=
tas 
> are to be updated
> > + *
> > + * Those are the flags that may be passed to &v4l2=5Fvp9=5Floop=5F=
filter.flags. See
> > + * section '7.2.8 Loop filter semantics' of the VP9 specification =
for more
> > + * details.
> > + */
> > +enum v4l2=5Fvp9=5Floop=5Ffilter=5Fflags {
> > +	V4L2=5FVP9=5FLOOP=5FFILTER=5FFLAG=5FDELTA=5FENABLED =3D 1 << 0,
> > +	V4L2=5FVP9=5FLOOP=5FFILTER=5FFLAG=5FDELTA=5FUPDATE =3D 1 << 1,
> > +};
> > +
> > +/**
> > + * struct v4l2=5Fvp9=5Floop=5Ffilter - VP9 loop filter parameters
> > + *
> > + * @ref=5Fdeltas: contains the adjustment needed for the filter le=
vel based on 
> the chosen
> > + *	reference frame. If this syntax element is not present in the 
> bitstream, users
> > + *	should pass its last value.
> > + * @mode=5Fdeltas: contains the adjustment needed for the filter l=
evel based 
> on the chosen mode.
> > + *	If this syntax element is not present in the bitstream, users
> > + *	should pass its last value.
> > + * @level: indicates the loop filter strength
> > + * @sharpness: indicates the sharpness level
> > + * @flags: combination of V4L2=5FVP9=5FLOOP=5FFILTER=5FFLAG=5F* fl=
ags
> > + * @reserved: padding field. Should be zeroed by applications.
> > + *
> > + * This structure contains all loop filter related parameters. See=
 sections
> > + * '7.2.8 Loop filter semantics' of the VP9 specification for more=
 details.
> > + */
> > +struct v4l2=5Fvp9=5Floop=5Ffilter {
> > +	=5F=5Fs8 ref=5Fdeltas[4];
> > +	=5F=5Fs8 mode=5Fdeltas[2];
> > +	=5F=5Fu8 level;
> > +	=5F=5Fu8 sharpness;
> > +	=5F=5Fu8 flags;
> > +	=5F=5Fu8 reserved[7];
> > +};
> > +
> > +/**
> > + * struct v4l2=5Fvp9=5Fquantization - VP9 quantization parameters
> > + *
> > + * @base=5Fq=5Fidx: indicates the base frame qindex
> > + * @delta=5Fq=5Fy=5Fdc: indicates the Y DC quantizer relative to b=
ase=5Fq=5Fidx
> > + * @delta=5Fq=5Fuv=5Fdc: indicates the UV DC quantizer relative to=
 base=5Fq=5Fidx
> > + * @delta=5Fq=5Fuv=5Fac: indicates the UV AC quantizer relative to=
 base=5Fq=5Fidx
> > + * @reserved: padding field. Should be zeroed by applications.
> > + *
> > + * Encodes the quantization parameters. See section '7.2.9 Quantiz=
ation 
> params
> > + * syntax' of the VP9 specification for more details.
> > + */
> > +struct v4l2=5Fvp9=5Fquantization {
> > +	=5F=5Fu8 base=5Fq=5Fidx;
> > +	=5F=5Fs8 delta=5Fq=5Fy=5Fdc;
> > +	=5F=5Fs8 delta=5Fq=5Fuv=5Fdc;
> > +	=5F=5Fs8 delta=5Fq=5Fuv=5Fac;
> > +	=5F=5Fu8 reserved[4];
> > +};
> > +
> > +/**
> > + * enum v4l2=5Fvp9=5Fsegmentation=5Fflags - VP9 segmentation flags=

> > + *
> > + * @V4L2=5FVP9=5FSEGMENTATION=5FFLAG=5FENABLED: indicates that thi=
s frame makes use 
> of
> > + *	the segmentation tool
> > + * @V4L2=5FVP9=5FSEGMENTATION=5FFLAG=5FUPDATE=5FMAP: indicates tha=
t the segmentation 
> map
> > + *	should be updated during the decoding of this frame
> > + * @V4L2=5FVP9=5FSEGMENTATION=5FFLAG=5FTEMPORAL=5FUPDATE: indicate=
s that the updates 
> to
> > + *	the segmentation map are coded relative to the existing 
> segmentation map
> > + * @V4L2=5FVP9=5FSEGMENTATION=5FFLAG=5FUPDATE=5FDATA: indicates th=
at new parameters 
> are
> > + *	about to be specified for each segment
> > + * @V4L2=5FVP9=5FSEGMENTATION=5FFLAG=5FABS=5FOR=5FDELTA=5FUPDATE: =
indicates that the
> > + *	segmentation parameters represent the actual values to be used
> > + *
> > + * Those are the flags that may be passed to &v4l2=5Fvp9=5Fsegment=
ation.flags. 
> See
> > + * section '7.2.10 Segmentation params syntax' of the VP9 specific=
ation for
> > + * more details.
> > + */
> > +enum v4l2=5Fvp9=5Fsegmentation=5Fflags {
> > +	V4L2=5FVP9=5FSEGMENTATION=5FFLAG=5FENABLED =3D 1 << 0,
> > +	V4L2=5FVP9=5FSEGMENTATION=5FFLAG=5FUPDATE=5FMAP =3D 1 << 1,
> > +	V4L2=5FVP9=5FSEGMENTATION=5FFLAG=5FTEMPORAL=5FUPDATE =3D 1 << 2,
> > +	V4L2=5FVP9=5FSEGMENTATION=5FFLAG=5FUPDATE=5FDATA =3D 1 << 3,
> > +	V4L2=5FVP9=5FSEGMENTATION=5FFLAG=5FABS=5FOR=5FDELTA=5FUPDATE =3D =
1 << 4,
> > +};
> > +
> > +#define V4L2=5FVP9=5FSEGMENT=5FFEATURE=5FENABLED(id)	(1 << (id))
> > +#define V4L2=5FVP9=5FSEGMENT=5FFEATURE=5FENABLED=5FMASK	0xf
> > +
> > +/**
> > + * enum v4l2=5Fvp9=5Fsegment=5Ffeature - VP9 segment feature IDs
> > + *
> > + * @V4L2=5FVP9=5FSEG=5FLVL=5FALT=5FQ: quantizer segment feature
> > + * @V4L2=5FVP9=5FSEG=5FLVL=5FALT=5FL: loop filter segment feature
> > + * @V4L2=5FVP9=5FSEG=5FLVL=5FREF=5FFRAME reference frame segment f=
eature
> > + * @V4L2=5FVP9=5FSEG=5FLVL=5FSKIP: skip segment feature
> > + * @V4L2=5FVP9=5FSEG=5FLVV=5FMAX: number of segment features
> > + *
> > + * Segment feature IDs. See section '7.2.10 Segmentation params sy=
ntax' of 
> the
> > + * VP9 specification for more details.
> > + */
> > +enum v4l2=5Fvp9=5Fsegment=5Ffeature {
> > +	V4L2=5FVP9=5FSEG=5FLVL=5FALT=5FQ,
> > +	V4L2=5FVP9=5FSEG=5FLVL=5FALT=5FL,
> > +	V4L2=5FVP9=5FSEG=5FLVL=5FREF=5FFRAME,
> > +	V4L2=5FVP9=5FSEG=5FLVL=5FSKIP,
> > +	V4L2=5FVP9=5FSEG=5FLVL=5FMAX,
> > +};
> 
> What is the reason not to assign values like 1 << 0, 1 << 1, etc. and=
 instead 
> provide separate macro V4L2=5FVP9=5FSEGMENT=5FFEATURE=5FENABLED()? Th=
is is a departure 
> from current practice.
> 

Fully agreed.

Thanks,
Ezequiel

