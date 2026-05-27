Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106F53BADB4
	for <linux-staging@lists.linux.dev>; Wed, 27 May 2026 11:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779882857; cv=pass; b=s5tM5QKIa7e9sJLWNFp+lrD3RdmSR5AxMgw9qjXDvtc17OWdsxt53I9e3O/KpbnsyJw8Lu/7ixGoHKmKyWfSBhEPf8OfSYF/ftInXmASL7GEBZ716IrEOwIhp8ljODqmG8ikC+szfT3lvgWHOvBsT/sPTN0akBH64QnyBoQ5kRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779882857; c=relaxed/simple;
	bh=r7JV4Qlc/632i94GYxXPKPWstQRLKr2HGMAhVUjmiKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TVHPJyxln0k5JvidaKV0Bmq8lgjPQ8F9udEU4mkoJyPoDG/JiBVIWwmF2ytrqrnhpfJKnCWoTIKAxdhheAxPB9Ho77o4/7k7Cp1AxiQkLJk45Gt9ST5iaPVtLOWr2iSLh3bf/UMsHH/RPbB1pV7Y0e/IpwIYU/YfLHAB0fk+WAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRqDf0Qv; arc=pass smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRqDf0Qv"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7e66f966d01so558617a34.3
        for <linux-staging@lists.linux.dev>; Wed, 27 May 2026 04:54:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779882855; cv=none;
        d=google.com; s=arc-20240605;
        b=QoXYceG5yI+00o6f/rGmvu0kNmB7ulaOMR6JtmoFCpZXDO1zenj5tgfFWv+vVp1yJ7
         e0FUyjJ6xpy7Iav1pCAGn4rwwred70cTgQW2tgX4NTNjrWyFXXKK8g4LR/D0Phr9QCVg
         U95syNIVrnCc6wKd30pMf7GwkdgJ4p2NIthe1Rbn87Em58MuOIHVXhCeR4chPCbVtiXh
         +bHZcn/S2Jn6FzQNaaG4//fC0KxJXH2M4+0gKLlkfLqwGishNtQ9ckp/GZKwTbCQgCNr
         3/yXQBPgSR4dR6pN2sjsQCOQ5kdSL7JGYtSUc4BxzEBdnThJDB03fZprvp3onIm4ixVw
         764A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3vFoZj3BR3SklGgACKj9VkieCL7MJ3G4MrQ8F1FQu/s=;
        fh=vaDPr9ESCr6yci9slRoW6CXUwMCs6HxDwZZPXpZ4ysc=;
        b=DURG8eFOwkMTmK7lPbnBhgC9xWXaiYCisgfA2vEg/C6CSrLwXdGwv8azbbvaG82O3V
         yhBoUvgH8aNQokX/EYP1nS6P/LULv8momy9T+hpPWCFxYtfSGyRF4kgVY7AjZK2ExPNV
         L3/s/Oann9jjcM9VKe4XKQCEDtKmeY+cUvJe+2ZMtunz1gIbOHZMXzL71y/F+SMCI/pE
         lUh4YI8i4K30VmrxeHv3IKBYO3QRGSEIWtWRryGH3YS/4TfDtx68OPU+23jzTH2khQ28
         zLzYC/25tXWtKRzkneqT3K/4vSWQ65gMbmE6l9iq0Vf3cd03pseTtjOKhtPlVbMtsD3V
         lc2Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779882855; x=1780487655; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vFoZj3BR3SklGgACKj9VkieCL7MJ3G4MrQ8F1FQu/s=;
        b=KRqDf0Qvpdf3PwmJpkUv27kxqZ+B3LZqWj2TOm3gwt7xSFiNzfJmdNB0pKdV1iJpJ0
         EHYPXZyk56/opN5aDpoqobh8XevvpHe1JYfO5JeohdUMZkerZfGb23AvmAZLzSK/wYfu
         ZRE0BOPv2aACwFoEdcnTNOkL4vkmEJwY6zXuGdXJ7SbevMKCGgv+E1S+plnfCK2zN89c
         K4YqtL8YWzP+H28u40yBPy/lUQt/RrYBjppdlBjbXMmQJQp81XkA040Blgm7aIqtmtFi
         aCoJ4Nt0VD7n1/nKBsgROn36mPaGGVyaB00XapmkOQ1Mx8lriGCqn44IrZgkJj5roI4V
         q9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779882855; x=1780487655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3vFoZj3BR3SklGgACKj9VkieCL7MJ3G4MrQ8F1FQu/s=;
        b=flKyCAIoLsjX7RR859F1W90Vnf+odmbtXn4V1WsVz8+CO1mABiyAYdQbeHzGNevfx5
         6hAIo0teXKg2YGbeE+UDIt3qhoEVBTIcIU4LtGDm+wows7pFgVPnq6nUsjFI8KZJupDH
         nBBQGdELqtNBwVAS6NTU1RA6GfTm+24JtoCf0DeFJ0465wzPPyMXNwSlpq9Ri3ckfLBE
         Wq6/Zk5ptFskUq3iRI4UnRf3lmaF8UPH2FteMtetrcVMXSOK/0Zvk2MLO5CsC7AfKMQK
         3kZ5Z4F4+FKeBqV33gUX4dokZrKx+pQ0+9GGW+rKpwC2J9h8T9AJ8XwhoVvONWGELXFQ
         byHA==
X-Forwarded-Encrypted: i=1; AFNElJ9bL+ZfOSD1Zl0CWA0M3UkQEfMRHw9C4/odI1IcghDOATWtv1x5M9KYzEiHm2J+c58/oWYWh4ephrnbI+Iz@lists.linux.dev
X-Gm-Message-State: AOJu0YzGjwj9D5/KKUfSVx6SgRvanJV8k9VRFtbDrtaiI2LBoOmLZFDU
	KJ/ltrpESzNkchCqEUZNCipObLvg7kfh4rIPsLqbJKZraOCTbrRBKiqbI4TVS5XK64BTRsIJ0Xf
	4PCIrLL12Y3sgdErCQO/TOdTKtDzxL/Y=
X-Gm-Gg: Acq92OGQC9zktDSUcHq1xu3xGRkOThMkpzO49876rvPn57GeT72mggkCyjz87MWZefM
	0l2yJx1IOXqlTveM/USewbi/0TNeuUSaroid2G1TPDxcoX/060mnEhCf4wt7URRYLWQ3t+4Rr6W
	VEX8PBdJsfw5cMGw3IfOdiyHqld5apdIHqB41qZeUaP3OLLzA/ATpc1MLp5hdn75Ze/evMRdNZI
	TNliyaXe3mKwJluA8v4sB/Y37Uc1+3zou8XFAbEO/GKMxDHMrE0E6AumdEEjEPqbIyhzaJCxfZ0
	0SLhxSUaw8ukKdzOozuFnGyE6TkcU7wm9fbvzG1Q2YJMIN5ySV+pSmBT9ppAx9KP5l0=
X-Received: by 2002:a05:6820:4dcc:b0:67e:251a:bd3e with SMTP id
 006d021491bc7-69d7eb50ef8mr12523541eaf.18.1779882855023; Wed, 27 May 2026
 04:54:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260518102451.417971-1-paulk@sys-base.io> <20260518102451.417971-11-paulk@sys-base.io>
 <CAMxPZkiKBFsPA5x6KpBajGqO5xqxD5AOd26j3uwqnQko1VzknQ@mail.gmail.com> <ahakVq7Fv78ODicG@shepard>
In-Reply-To: <ahakVq7Fv78ODicG@shepard>
From: arash golgol <arash.golgol@gmail.com>
Date: Wed, 27 May 2026 15:23:44 +0330
X-Gm-Features: AVHnY4IBJ2USZh9zewtK1mpREASscLC7umJs8sYSO8dfl7Vqb2mCAkjyaVX__p0
Message-ID: <CAMxPZkjQGFxGeafUhCSn82PnWeRpW3YQ-5ZTZUwE1psTq2hJiw@mail.gmail.com>
Subject: Re: [PATCH 10/16] media: sun6i-csi: Add support for MC-centric format enumeration
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Wed, May 27, 2026 at 11:29=E2=80=AFAM Paul Kocialkowski <paulk@sys-base.=
io> wrote:
>
> Hi Arash,
>
> On Wed 27 May 26, 09:20, arash golgol wrote:
> > On Mon, May 18, 2026 at 2:00=E2=80=AFPM Paul Kocialkowski <paulk@sys-ba=
se.io> wrote:
> > >
> > > Use the dedicated helper to check possible pixelformats against the
> > > provided mbus code in order to support MC-centric format enumeration.
> > >
> > > Note that multiple pixelformats may be returned for a given mbus code=
.
> > >
> > > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > > ---
> > >  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 38 +++++++++++++++++=
--
> > >  1 file changed, 34 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture=
.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> > > index a836fa7f081a..409c28621093 100644
> > > --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> > > +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> > > @@ -773,14 +773,43 @@ static int sun6i_csi_capture_querycap(struct fi=
le *file, void *priv,
> > >  static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
> > >                                       struct v4l2_fmtdesc *fmtdesc)
> > >  {
> > > +       const struct sun6i_csi_capture_format *capture_format;
> > > +       const struct sun6i_csi_bridge_format *bridge_format;
> > > +       u32 mbus_code =3D fmtdesc->mbus_code;
> > >         u32 index =3D fmtdesc->index;
> > > +       unsigned int index_valid =3D 0;
> > > +       unsigned int i;
> > > +
> > > +       /* Video-node-centric enumeration. */
> > > +       if (!mbus_code) {
> > > +               if (index >=3D ARRAY_SIZE(sun6i_csi_capture_formats))
> > > +                       return -EINVAL;
> > > +
> > > +               fmtdesc->pixelformat =3D
> > > +                       sun6i_csi_capture_formats[index].pixelformat;
> > > +               return 0;
> > > +       }
> > >
> > > -       if (index >=3D ARRAY_SIZE(sun6i_csi_capture_formats))
> > > +       bridge_format =3D sun6i_csi_bridge_format_find(mbus_code);
> > > +       if (!bridge_format)
> > >                 return -EINVAL;
> > >
> > > -       fmtdesc->pixelformat =3D sun6i_csi_capture_formats[index].pix=
elformat;
> > > +       for (i =3D 0; i < ARRAY_SIZE(sun6i_csi_capture_formats); i++)=
 {
> > > +               capture_format =3D &sun6i_csi_capture_formats[i];
> > >
> > > -       return 0;
> > > +               if (!sun6i_csi_capture_format_check(capture_format,
> > > +                                                   bridge_format))
> > > +                       continue;
> > > +
> > > +               if (index_valid =3D=3D index) {
> > > +                       fmtdesc->pixelformat =3D capture_format->pixe=
lformat;
> > > +                       return 0;
> > > +               }
> > > +
> > > +               index_valid++;
> > > +       }
> > > +
> > > +       return -EINVAL;
> > >  }
> > >
> > >  static int sun6i_csi_capture_enum_framesize(struct file *file, void =
*fh,
> > > @@ -1076,7 +1105,8 @@ int sun6i_csi_capture_setup(struct sun6i_csi_de=
vice *csi_dev)
> > >
> > >         strscpy(video_dev->name, SUN6I_CSI_CAPTURE_NAME,
> > >                 sizeof(video_dev->name));
> > > -       video_dev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_=
STREAMING;
> > > +       video_dev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_=
STREAMING |
> > > +                                V4L2_CAP_IO_MC;
> > >         video_dev->vfl_dir =3D VFL_DIR_RX;
> > >         video_dev->release =3D video_device_release_empty;
> > >         video_dev->fops =3D &sun6i_csi_capture_fops;
> > > --
> > > 2.54.0
> > >
> >
> > Tested on a LicheePi Zero Dock (V3s) with the following pipeline:
> >
> > ov7670 -> sun6i-csi-bridge -> sun6i-csi-capture
> >
> > I verified that mbus-code-based format enumeration works correctly
> > from userspace and that the reported capture formats change according
> > to the selected media bus format.
> >
> > I could also successfully start streaming with several of the
> > enumerated capture formats (e.g. YUYV and BA81)
>
> Excellent, thank-you very much for testing this!
>

Happy to help.

> > However, I could not fully validate actual format conversion behavior
> > (e.g. MEDIA_BUS_FMT_YUYV8_2X8 to NV12) because my OV7670 setup
> > currently has non-functional test patterns except for 'shifting-1'
> > mode.
>
> That's fine. I don't think I have tested it recently either.
>
> > Tested-by: Arash Golgol <arash.golgol@gmail.com>
> >
> > PS:
> >
> > While testing this patch I also noticed that
> > VIDIOC_SUBDEV_ENUM_MBUS_CODE reports duplicate entries for:
> >  - MEDIA_BUS_FMT_UYVY8_2X8
> >  - MEDIA_BUS_FMT_UYVY8_1X16
> > on sun6i-csi-bridge.
>
> I just had a look and you are definitely right, the entries are clearly
> duplicates and at the same time all the relevant formats are included, so=
 they
> are not taking the place of another format that was forgotten.
>
> You're welcome to submit a patch to remove these entries if you'd like,
> or I could do it otherwise.
>

Thanks, I'll send a small patch to remove the duplicate mbus format entries=
.

> By the way would you be interested in testing the H.264 encoder support f=
or
> V3/V3s once I send a first version for it? I had written initial support =
for
> it a while ago (did not send it to the list) and now that my work on the =
V4L2
> stateless uAPI has reached a point of usability I will probably try to up=
date
> my rework of the cedrus driver to use it.
>

Yes, I would definitely be interested in testing the H.264 encoder
support on V3s once you post it. I previously did some experiments
with Cedrus on V3s (bootlin, cedrus/h264-encoding branch).

Looking forward to it!

--=20
Regards,
Arash Golgol
