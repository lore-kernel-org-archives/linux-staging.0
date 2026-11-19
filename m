Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795106093;
	b=BxeOSI+B8c6CEjGeGUQd9ocpo36dP7x/AUQ2bFNE1G9v8Nk3Hx15h/SMvuyNAfaWFChb
	 hepcwQ2/n54aDHo76jNdEnSaARXUnzXtD896IohTcrQtr+rbqfHb+yIQQ5gg9/YbdlOv+
	 MPZbSEnT/TTXWtYS501heyoEfTekWqmtB+3KzC1k7jEHyAIG9aPDmag/4GeM0vje/1/8R
	 oZa0VhidaJw2vrXWlL8LiQ2T9sJqLgWGYvKCo0Bxv0t72yv5tdAVhF6c3j8DbhSTxGvvu
	 g+jWF6wuTAl6kTHoaPCOopbdKpiCD6C3T3egjb8R4NbHqMrNrlKvDsjwX+Q2RE7NkYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106093;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=UKimyI/UHlRpxqjgUHmyLOIFBaaEPfjcq4wI8Pw7Jjw=;
	b=uDsfmeQjnxUWNnQsKentH7BJoz/QKiaMjVOLYybydx2AcNezGb7oGBioxAS1eUdUDXCF
	 lefKrfslHYC9RYsDPZ3Vpgdmwi0ytX8VAMXTKThDKSvttVRJTjNz0ngpIgUAfUCiWtqUn
	 aGcLBDD5vlSReXF/gh/0uDh+S4+Hz4biTY7EOwSx8mz4sThmt01ChzCThFcea3vtij29k
	 lWAY7wsEpiUSx/2W2lcVMiua8xu1J713HydSjM/5xYUKBxtN/mq+je/A4u+yBTsigdAxF
	 WtRLdyeIdHyWhWeNAd5kCTmO9fEHDa0IAIMRmiOWnN1BF88zVH6hlwJkFd6vxPYY7+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Htsh/5Y6";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C79606A33A;
	Thu, 19 Nov 2026 16:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Htsh/5Y6
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795106093;
	b=NEMbay6VlCdZyMBLRnuEWqpxKcuhDUHhLWDwsTgspZvvyNyGr/y0mw+q/qcO4wkM0IW7
	 jA0I7W1M5ohibNZLHVQTideChlnDCfBu2kHGrn+g9avpFrOVuMR7qJ4I7zMqMBUu0OEho
	 XToFm2z7sfbkeL7lXQvQRxNV2XuAnzdBQS9Aj6BCor7XouQbSlgn2L5fJqGrJ5G1EBChL
	 VDWKQUnN03gt28Sm9OEB+aRLVqUMnPxFGo02a/ea3ijvgCoNAvJU9EGMHasCSYXbk9t2K
	 e1CFPKDcJ3nXc/5n1Xv1JUpDgQCFDSmIoMPmkiGnR4Y8Y6n1gZwUZYN4m/aG1AZ4l/w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795106093;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=UKimyI/UHlRpxqjgUHmyLOIFBaaEPfjcq4wI8Pw7Jjw=;
	b=NfTwsqgTWgdlaKAPWKgOpB7KIBHbYaU7a8nhWAwTNUVeWNbGSMTLjhiRgGDWxYLLeB/n
	 jXdZ+tlqz+MEvXie6qozbvyr2pqhpiIOuQCbNlq68ImAGwF4Z7RkiBqNv5oH9qyA6CRlF
	 TnQlcrmFLGg1QA6lG1HyP7WxQQscaozVBg/06Q1i06gXA1tJ4pjECt3oDdrNrTbhYi6iD
	 UXwaYPNf4TkYiRfs3nLfMt1hzq31f6dOEGLdjAFmEba/v7O+3p7HLSUZdUEhhN32ecdTv
	 wUYrR1+nUw+6ipeBIHAAGIrxypNpUUqD+y9QCtJkBCsDPXPK8P8QjQWYShSyo37HIlA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 27BCE1F000CB;
	Thu, 19 Nov 2026 16:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795106092;
	bh=UKimyI/UHlRpxqjgUHmyLOIFBaaEPfjcq4wI8Pw7Jjw=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=Htsh/5Y6p+adSvuKLKaSXxGoaPpkzke7i2/JgR4IhkAhAMGhgNEJnHIap1ITUUmqV
	 mzdh5GXiziCgzJScV7YwUvp7LelC2Zs8IEZ1FJO+hi+5V6n7av/IwxDjUJBoMjzluq
	 OO8caOoF6SqATjQF+It3fA7d2uK1/M/LXW21UxHlt2nM2uLMVK0oUThYK7BoYz8q3s
	 29I6J2RA0k2M1l+YIYP1bHQgMHLgErY/lmGRjy+bW3WsOkb/oG+vKIr2lxO0ndA9Df
	 0keXyIsH6vAbeKmePeK6bilwlqTveftmNiEQuYKe/9zgRr2dOdZVKj9IFDWhIJsILE
	 r7Oo8PGb/rdNg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A907F4B337;
	Thu, 19 Nov 2026 16:34:51 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH RFC 0/2] media: stateless MPEG-1 decoding, cedrus support
Date: Thu, 19 Nov 2026 16:34:51 +0000
Message-Id: <20261119-b4-cedrus-mpeg1-v1-0-aa5ba1192822@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQuCQBBG/4rMuQFn0RCvQT+ga3TYXT91gkx2M
 gTxv7fV8T14byNDUhi1xUYJbzV9ThnkUFAc/TSAtctMrnRHEak4VBzRpcX4MWMQboL3qL0DelC
 u5oRe19/xSpfziW5/aUu4I76+L9r3D2CfiaF4AAAA
X-Change-ID: 20261114-b4-cedrus-mpeg1-8baae5a2eefe
To: Hans Verkuil <hverkuil@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Maxime Ripard <mripard@kernel.org>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Jonas Karlman <jonas@kwiboo.se>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, 
 =?utf-8?q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795106091; l=2835;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=QsCl51k6uk/8eEVXP0Noi7pULDA/cGnoC7OzqiRMj5g=;
 b=MYPO5m+L0jmlqTvYEY0eCmCBMWbjwjJHDslt1mReSBrEQU7MTDgJ1D3KZkcUhztoSEOsBraMV
 xTNroU694dVBGFSp+ZoGG2ldSZGOKMDVuVi8/YwrZytRZTyKa5S1TKc
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com

Builds on Jernej Skrabec's cedrus work; tested with an FFmpeg hwaccel
on top of Jonas Karlman's V4L2 request API series (FFmpeg PR 20847).

MPEG-1 decoded as MPEG-2 is wrong: the mismatch control differs, and
MPEG-1 has full pel motion vectors and D-pictures. Patch 1 adds
V4L2_PIX_FMT_MPEG1_SLICE, which reuses the MPEG-2 controls with one
sequence flag and two picture flags; hantro rejects the new flags and
D-pictures (compile tested only). Patch 2 implements it in cedrus.

RFC questions:
- Is a separate pixel format the right way to make MPEG-1
  discoverable? Christian's Amlogic series decodes MPEG-1 through
  V4L2_PIX_FMT_MPEG2_SLICE.
- V4L2_MPEG2_SEQ_FLAG_MPEG1 is redundant with the format. I kept it so
  that the controls describe the bitstream on their own; happy to drop
  it.

FFmpeg patches (the second corrects D-picture handling of the first):
https://github.com/SomeComputerGuy/orangepizero2/blob/7ed24f39cbf0f4b285cd142c291267c9cfb818f4/patches/ffmpeg/0304-avcodec-add-V4L2-Request-API-MPEG-1-hwaccel.patch
https://github.com/SomeComputerGuy/orangepizero2/blob/7ed24f39cbf0f4b285cd142c291267c9cfb818f4/patches/ffmpeg/0309-avcodec-mpeg12dec-hand-D-pictures-only-to-hwaccels-t.patch

Tested on H616 only, on media-committers next: MPEG-1 (D-pictures
included), MPEG-2, H.264 and H.265 decode bit-exact against FFmpeg
software decoding; v4l2-compliance 49 of 49 with the v4l-utils patch
that teaches it the new format (sent separately).

Developed with Claude (Anthropic) as a coding assistant, which wrote
the code and the commit messages. I reviewed and tested them as
described above.

---
Arun Iyengar (2):
      media: uapi: mpeg2: add MPEG-1 flags and the MPEG-1 parsed slice format
      media: cedrus: mpeg2: decode MPEG-1 as V4L2_PIX_FMT_MPEG1_SLICE

 .../media/v4l/ext-ctrls-codec-stateless.rst        | 35 ++++++++++++++++++--
 .../userspace-api/media/v4l/pixfmt-compressed.rst  | 23 +++++++++++++
 drivers/media/platform/verisilicon/hantro_drv.c    | 12 +++++++
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |  1 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |  1 +
 drivers/staging/media/sunxi/cedrus/cedrus.c        | 22 +++++++++++++
 drivers/staging/media/sunxi/cedrus/cedrus_dec.c    |  1 +
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c     |  1 +
 drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c  | 38 +++++++++++++++++++---
 drivers/staging/media/sunxi/cedrus/cedrus_video.c  |  7 ++++
 include/uapi/linux/v4l2-controls.h                 |  3 ++
 include/uapi/linux/videodev2.h                     |  1 +
 12 files changed, 139 insertions(+), 6 deletions(-)
---
base-commit: aa0f4c41d4870a18e65772a1817af16427200371
change-id: 20261114-b4-cedrus-mpeg1-8baae5a2eefe

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>


