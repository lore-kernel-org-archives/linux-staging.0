Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF0A31B83D
	for <linux-staging@lists.linux.dev>; Wed, 15 Oct 2025 10:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760523123; cv=none; b=XplbbdzACtvnIblxCeVUtcCr3P1zCrrxf39bmhkFVqonjoWXZY+CEeA20DPFMTTfSMKG67M0aYn0rHBL7U9gYcXGALVvrgTJeQj92Q0T5FTm6Nt6L06+OwwPV2yGs0H2Hr9Irq6K9nnHDnT+Yo9gUUh3fC9WjmMhQ0m5u2OiBwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760523123; c=relaxed/simple;
	bh=ojRHTIsR8Igk+ruRVGTwSbP0lqKdXdYt17A+3/eQqcM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oMT3GYIKyvp8I1EH9zvCZJy0EAt5mi4tBDI4BuQeB1CVVFWvV68syx0oOEP8Yc98S/WmEOnbbsc8/sZNZI7i8mWDlD+0grcuFhMNo6JQSB+7jgOIKipxtMcWCgKh5IkYbPRTemIIZ33RJlqm0oMQQsgKA+F/Z4KFKi7YBXnjLG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v8yU1-0005fF-P4; Wed, 15 Oct 2025 12:11:49 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v8yTv-003hwe-3D;
	Wed, 15 Oct 2025 12:11:44 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v8yTv-000000007QM-3dJv;
	Wed, 15 Oct 2025 12:11:43 +0200
Message-ID: <14f49cddfcb1c86598105ee394cd43a2bdf7fa89.camel@pengutronix.de>
Subject: Re: [PATCH v2] media: v4l2-mem2mem: Don't copy frame flags in
 v4l2_m2m_buf_copy_metadata()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-staging@lists.linux.dev
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew-CT Chen	
 <andrew-ct.chen@mediatek.com>, Benjamin Gaignard	
 <benjamin.gaignard@collabora.com>, Bin Liu <bin.liu@mediatek.com>, Chen-Yu
 Tsai	 <wens@csie.org>, Daniel Almeida <daniel.almeida@collabora.com>,
 Detlev Casanova	 <detlev.casanova@collabora.com>, Devarsh Thakkar
 <devarsht@ti.com>, Dmitry Osipenko <digetx@gmail.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Hans Verkuil	 <hverkuil@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, Jacob Chen	 <jacob-chen@iotwrt.com>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Maxime Ripard <mripard@kernel.org>, Michael
 Tretter	 <m.tretter@pengutronix.de>, Ming Qian <ming.qian@nxp.com>, Mirela
 Rabulea	 <mirela.rabulea@nxp.com>, Nicolas Dufresne
 <nicolas.dufresne@collabora.com>,  Paul Kocialkowski	 <paulk@sys-base.io>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Steve Longerbeam
 <slongerbeam@gmail.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Xavier
 Roumegue	 <xavier.roumegue@oss.nxp.com>, Yunfei Dong
 <yunfei.dong@mediatek.com>, Zhou Peng <eagle.zhou@nxp.com>
Date: Wed, 15 Oct 2025 12:11:43 +0200
In-Reply-To: <20251015100118.8755-1-laurent.pinchart@ideasonboard.com>
References: <20251015100118.8755-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-staging@lists.linux.dev

On Mi, 2025-10-15 at 13:01 +0300, Laurent Pinchart wrote:
> The v4l2_m2m_buf_copy_metadata() function takes a boolean
> copy_frame_flags argument. When true, it causes the function to copy the
> V4L2_BUF_FLAG_KEYFRAME, V4L2_BUF_FLAG_BFRAME and V4L2_BUF_FLAG_PFRAME
> flags from the output buffer to the capture buffer.
>=20
> There is no use cases in any upstream driver for copying the flags.
> KEY/P/B frames are properties of the bitstream buffer in some formats.
> Once decoded, this is no longer a property of the video frame and should
> be discarded.
>=20
> It was considered useful to know if an uncompressed frame was decoded
> from a KEY/P/B compressed frame, and to preserve that information if
> that same uncompressed frame was passed through another M2M device (e.g.
> a scaler). However, the V4L2 documentation makes it clear that the flags
> are meant for compressed frames only.
>=20
> Drop the copy_frame_flags argument from v4l2_m2m_buf_copy_metadata().
> The change to drivers was performed with the following Coccinelle
> semantic patch:
>=20
> @@
> expression src;
> expression dst;
> expression flag;
> @@
> -       v4l2_m2m_buf_copy_metadata(src, dst, flag);
> +       v4l2_m2m_buf_copy_metadata(src, dst);
>=20
> include/media/v4l2-mem2mem.h and drivers/media/v4l2-core/v4l2-mem2mem.c
> have been updated manually.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
