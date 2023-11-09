Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF1137175
	for <linux-staging@lists.linux.dev>; Thu,  9 Nov 2023 20:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZK5e/wDc"
Received: from relay5-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::225])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 96236C778F
	for <linux-staging@lists.linux.dev>; Thu,  9 Nov 2023 20:16:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 93FD01C0006;
	Thu,  9 Nov 2023 20:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699561011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zbTVYuvmRUaQtmj4VIv+6MHR+6X+gUKoXAkYu3nSfeI=;
	b=ZK5e/wDc09qPgtZXCY6x5stZszvLgejTsenovmCcTYYN//u7hv//TDM2gA3Jw3bYHIHuF+
	rjIHacq6EC/gtVzTHzcGpbb8DKHjRTnFlQunL08hd+GiWHKs9ezS4SISbT9Qjnnai2DIVN
	7RAf7X40ynDSQreWM5dcNUTA2skN5UkEGkyj4Ayi75H/irUJ5uqyCSkJ0ZF0DpKYPiaTL0
	oPjp205T8rEmqMUAZ/MOpudemsoEW1oW85DlbLW2pOWo81VHoxr6yUL/0DMc3HA4viHbCG
	tYOi0Hy8p3grRakL3cCTKL6Aqx+9LYhVnYD15zmD7rjAB2Z1ci+X0W8CwD9LIQ==
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH 2/4] media: visl: Hook the (TRY_)DECODER_CMD stateless ioctls
Date: Thu,  9 Nov 2023 21:16:38 +0100
Message-ID: <20231109201640.340556-2-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231109201640.340556-1-paul.kocialkowski@bootlin.com>
References: <20231109201640.340556-1-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: paul.kocialkowski@bootlin.com

The (TRY_)DECODER_CMD ioctls are used to support flushing when holding capture
buffers is supported. This is the case of this driver but the ioctls were never
hooked to the ioctl ops.

Add them to correctly support flushing.

Fixes: 0c078e310b6d ("media: visl: add virtual stateless decoder driver")
Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 drivers/media/test-drivers/visl/visl-video.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/test-drivers/visl/visl-video.c b/drivers/media/test-drivers/visl/visl-video.c
index 7cac6a6456eb..9303a3e118d7 100644
--- a/drivers/media/test-drivers/visl/visl-video.c
+++ b/drivers/media/test-drivers/visl/visl-video.c
@@ -525,6 +525,9 @@ const struct v4l2_ioctl_ops visl_ioctl_ops = {
 	.vidioc_streamon		= v4l2_m2m_ioctl_streamon,
 	.vidioc_streamoff		= v4l2_m2m_ioctl_streamoff,
 
+	.vidioc_decoder_cmd		= v4l2_m2m_ioctl_stateless_decoder_cmd,
+	.vidioc_try_decoder_cmd		= v4l2_m2m_ioctl_stateless_try_decoder_cmd,
+
 	.vidioc_subscribe_event		= v4l2_ctrl_subscribe_event,
 	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
 };
-- 
2.42.1

