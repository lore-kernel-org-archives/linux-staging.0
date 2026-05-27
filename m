Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F212236E3
	for <linux-staging@lists.linux.dev>; Wed, 27 May 2026 05:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779861054; cv=pass; b=ex6AwnfuX8a43ScPBBKwEkdwZPT74ah0ItL5r5KvUt0LcgatdGxolAh5FlWPaL3WhTQ2IHo39MBIcmHbcAarW25IYJbWOuJ0lG+g6EkQqWKtgo1SsnQ5ziFY/sqFJ/ofGq4h0Dtsvcqoirf1TQGtF9Chxtmyeui5PdOIzYmLEt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779861054; c=relaxed/simple;
	bh=s8Ct4ViIMpvfSQ9jjCfWQIZvZ7lFJ0AUr1z/hkkScG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tUWVzDIITjK4ClGsYlsBWRzW/2Ama2HNa6s0uHC6NM606mtNSY95lhd1EmKnXxFE2KzpN1iVXuEBwJNWY1YEwOEkfZ0K9GXZMSU0RfTY4AltocW54PW8RkNQ21AAxe3tUY3GQOAKNMUHSJLYTunNUkx8MkHVWOfLQ1ukS9NKNnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qaucNyG2; arc=pass smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qaucNyG2"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-69de237f0a3so308472eaf.1
        for <linux-staging@lists.linux.dev>; Tue, 26 May 2026 22:50:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779861051; cv=none;
        d=google.com; s=arc-20240605;
        b=QqwktLQcWc3/yq/livf5gNsPJOY1bUCQqsnCyygUEk1Fyfy1BnNKu55V+yYZSF1GnD
         4omSP2/r2xTIm00/SQaxqeVqiTpCaWmA+chA9SZ2cDWiJ0Q6I+HWaAza6aTmkJwe2Qaj
         krDfb37oRHGOesZeMMNFf3yWuxE4N3dL8imLil34eu/zGcx2pUsr0LLStbGbKcqBIfHA
         C+b3y7I0l//j6EM8VSSrHMu/CfQrL0nozOQRT6+/tendrIS3tTgOb2r0uVBQ5JC6WPTE
         CPHAB0LPj2AU/hNqFtcZbshzX4Wjv8hIF+c9YAuSgmgTv94jVs3RTxfEVb1mRyPAUTNw
         RXBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IN/lZ1MspSWqCEdebYjVtGecjRh9KxGFTFq6UHbS1Fc=;
        fh=ycCdPJydQag6gzY11TSKzb4me6mrJqgxFiGaxiO2nc8=;
        b=Vs2RGEIQZbzb2/K8H/eRhs8Xs9ziXDEi9WtdJGI55aMbG74nFGb63fiJC8gPg3r95Q
         V8tS6iXdbCiCy9v6pZZjd4q+5FzJBvqAWbFZyGLhVD+bd6l7uay7QMjZlM68z6DgLffG
         fJXnkSbqSqY5lI9tvorLEYU0ZMswuC51OsnJVCTUGl/aH+F48R3K4TaFSgP4usE7fN7r
         B0IzPxMb7JDWlRoy4c/PB3g82qQLr9Y0mQyZQrsGfXYe567k+RFddslDoYq9iIWHjJu/
         BUVIMS7/DIHTGA5bDY9dxbreFiH1W3wXPjR5GzBAiU9iTd5PVohAyjTH7LhqcaiXd1IR
         xnvw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779861051; x=1780465851; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IN/lZ1MspSWqCEdebYjVtGecjRh9KxGFTFq6UHbS1Fc=;
        b=qaucNyG2m2MXEzJDD7XVccu2AbxzVEJkyTkymueStxL3k4I35G4ixFOIWpcxbtN8Sa
         wJ8On58jVpniphTViOb/o0Wdi28nTQ2TjZ4iPqCc1Phbk6RF3SI2kWK+qaa4f1tUC23Y
         cswq4EDIAsi3hphyKmqYnRHkiI2Uog2L9rw1CNzaJIn429hdpsAg6SoqM3dTnxLZl8tH
         OaLmzwrRA4BN2o2lEvuv22opq+fSe0o2Q+DfmmNRuF5oM1rEsuWVHyZJLITYI2IsPqmv
         atRQbqM0NTf3kU2pvJ5LGY61NnVZyilY44Z3Pv3bOY1DXX7O2buwLhiPkDPsvb7UrvON
         3xqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779861051; x=1780465851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IN/lZ1MspSWqCEdebYjVtGecjRh9KxGFTFq6UHbS1Fc=;
        b=JXBDk2BKs3RWmnorSaszlJLafkSUAeSkuGQ2PAuW6fI0GQHmgR/LqzxDfZyxF7bHE+
         7MGqZitlk/vwc01i3ue4lsl1XWOkHgtwXuy5bma1PCpDg1A571Nyl0vB3tJjfNHLGo2r
         Ryoy/bvr9ie/Q9ZLbP/PJmOvsWrTOwYdKw8CwQua1UqMrkDcDH4xMtA5vD+dx5JlbG7F
         K8TpTc0JtqY78e1qouyz7KTgCYjrtG7SousgbjxoEZBfTy2rtDREDQj46itcT02WG05d
         IO6DjUJtsLXvjMdmqA4qLPhbTYXuaC9Nx5Am/G6cFA+XWjiu8/weqLbCiNCIVKPh6qto
         /kHQ==
X-Forwarded-Encrypted: i=1; AFNElJ+iNc0sZ9MRMIiktgoWSgBdoF6Dwtq+Rf7fzEa6Qxwct5EGlfHnoY9KA2OEDq1J1NXNyaeENjauEbdTgnc2@lists.linux.dev
X-Gm-Message-State: AOJu0YzFisEm1+MS7cuqXVKYO9TB+FQtorLoxkAL0KX/Om+vSW9TmS+B
	TmQlfn+Xau+yZ9ZMDYcGH076fBuGEorPoR99uBDnJbpeiUQ6eV0hCHr7B4+f1Izx2F1OLtbsizd
	logqhAztLOzBONV/B/AboRQSZ+vgpTWg=
X-Gm-Gg: Acq92OF6chBkAPoal3vQUHLBPf5p4WqP/oIItVi2eIUXrUS1p+HNv+0ZyckfhVaTI6w
	pEvX9ExT5+MeaEz5cSVm6kMQQzWhFd4nA0HGcnL5HZ48oD7tQ2RRWmHv0DYzLzMFBz2KAKF8uEd
	QM1WhMNLGxxZDHp65YYzQw1FieP4nu5slXGzIq7UCO8XDCMQb9cZ6RBXEkxf+uVD8dIB+K/Tx9f
	1ncuCPOElFDXikptZdBWu7/Y/a30zTl50B4rw6f4vghua/Mu066pdD7edvmlUBvbZLQeCQ48wl8
	rNh+qFQrXkQI/gcV+Zsj41UijD8tLezM4erthxP6wiSJ7sSiDNIWgxS4+vS6x6z0GZ8UZ5MYkmc
	Blg==
X-Received: by 2002:a05:6820:8c6:b0:67d:e7c3:3c6c with SMTP id
 006d021491bc7-69d7ece5518mr11407499eaf.53.1779861051499; Tue, 26 May 2026
 22:50:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260518102451.417971-1-paulk@sys-base.io> <20260518102451.417971-11-paulk@sys-base.io>
In-Reply-To: <20260518102451.417971-11-paulk@sys-base.io>
From: arash golgol <arash.golgol@gmail.com>
Date: Wed, 27 May 2026 09:20:20 +0330
X-Gm-Features: AVHnY4KCcmkhN5ddeEl3UKGwn2lpmjAHGW1bfUh9bIDJK3bFLtCx7fk5EGqR9us
Message-ID: <CAMxPZkiKBFsPA5x6KpBajGqO5xqxD5AOd26j3uwqnQko1VzknQ@mail.gmail.com>
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

On Mon, May 18, 2026 at 2:00=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> Use the dedicated helper to check possible pixelformats against the
> provided mbus code in order to support MC-centric format enumeration.
>
> Note that multiple pixelformats may be returned for a given mbus code.
>
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 38 +++++++++++++++++--
>  1 file changed, 34 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b=
/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> index a836fa7f081a..409c28621093 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> @@ -773,14 +773,43 @@ static int sun6i_csi_capture_querycap(struct file *=
file, void *priv,
>  static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
>                                       struct v4l2_fmtdesc *fmtdesc)
>  {
> +       const struct sun6i_csi_capture_format *capture_format;
> +       const struct sun6i_csi_bridge_format *bridge_format;
> +       u32 mbus_code =3D fmtdesc->mbus_code;
>         u32 index =3D fmtdesc->index;
> +       unsigned int index_valid =3D 0;
> +       unsigned int i;
> +
> +       /* Video-node-centric enumeration. */
> +       if (!mbus_code) {
> +               if (index >=3D ARRAY_SIZE(sun6i_csi_capture_formats))
> +                       return -EINVAL;
> +
> +               fmtdesc->pixelformat =3D
> +                       sun6i_csi_capture_formats[index].pixelformat;
> +               return 0;
> +       }
>
> -       if (index >=3D ARRAY_SIZE(sun6i_csi_capture_formats))
> +       bridge_format =3D sun6i_csi_bridge_format_find(mbus_code);
> +       if (!bridge_format)
>                 return -EINVAL;
>
> -       fmtdesc->pixelformat =3D sun6i_csi_capture_formats[index].pixelfo=
rmat;
> +       for (i =3D 0; i < ARRAY_SIZE(sun6i_csi_capture_formats); i++) {
> +               capture_format =3D &sun6i_csi_capture_formats[i];
>
> -       return 0;
> +               if (!sun6i_csi_capture_format_check(capture_format,
> +                                                   bridge_format))
> +                       continue;
> +
> +               if (index_valid =3D=3D index) {
> +                       fmtdesc->pixelformat =3D capture_format->pixelfor=
mat;
> +                       return 0;
> +               }
> +
> +               index_valid++;
> +       }
> +
> +       return -EINVAL;
>  }
>
>  static int sun6i_csi_capture_enum_framesize(struct file *file, void *fh,
> @@ -1076,7 +1105,8 @@ int sun6i_csi_capture_setup(struct sun6i_csi_device=
 *csi_dev)
>
>         strscpy(video_dev->name, SUN6I_CSI_CAPTURE_NAME,
>                 sizeof(video_dev->name));
> -       video_dev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STRE=
AMING;
> +       video_dev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STRE=
AMING |
> +                                V4L2_CAP_IO_MC;
>         video_dev->vfl_dir =3D VFL_DIR_RX;
>         video_dev->release =3D video_device_release_empty;
>         video_dev->fops =3D &sun6i_csi_capture_fops;
> --
> 2.54.0
>

Tested on a LicheePi Zero Dock (V3s) with the following pipeline:

ov7670 -> sun6i-csi-bridge -> sun6i-csi-capture

I verified that mbus-code-based format enumeration works correctly
from userspace and that the reported capture formats change according
to the selected media bus format.

I could also successfully start streaming with several of the
enumerated capture formats (e.g. YUYV and BA81)

However, I could not fully validate actual format conversion behavior
(e.g. MEDIA_BUS_FMT_YUYV8_2X8 to NV12) because my OV7670 setup
currently has non-functional test patterns except for 'shifting-1'
mode.

Tested-by: Arash Golgol <arash.golgol@gmail.com>

PS:

While testing this patch I also noticed that
VIDIOC_SUBDEV_ENUM_MBUS_CODE reports duplicate entries for:
 - MEDIA_BUS_FMT_UYVY8_2X8
 - MEDIA_BUS_FMT_UYVY8_1X16
on sun6i-csi-bridge.

This appears to come from duplicate format entries being exposed by
the bridge driver.

--=20
Regards,
Arash Golgol
