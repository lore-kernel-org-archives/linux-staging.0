Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F051B374C2
	for <linux-staging@lists.linux.dev>; Thu,  9 Nov 2023 20:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="j4y3CJax"
Received: from relay5-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::225])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 7FD9ECCE80
	for <linux-staging@lists.linux.dev>; Thu,  9 Nov 2023 20:16:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21C8F1C0008;
	Thu,  9 Nov 2023 20:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699561012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g44nGM0ulGdPmsKjAGuOOVpTRwfyVkwDcA7l+uwsI6Y=;
	b=j4y3CJaxX8sR0enPCYnGV1fGz8oN1sM4XbJlVX4NqPWbVT5itq0mQqJKJ3qb65iombJ0Qg
	U0SBXeRsB0rdLBHMCcibN7qfOGH751/DVhyjiNW1uMYec8gaOW+PHWN30NQqUEGGd59Im4
	GeIuTsJVRL0xDEslefgltpHiis5nVxQAzQxWTYou9/IZQ2rww6Q2RLiSMBO8lgPjBSwEhT
	VxdQVRGUwuEcHjVwiAQBpKLAozY0L5Ehu0XshlsF11RN0z3Kvfm8dsILxjzK+E406YFmK4
	FI2GZEBO3R5WjEbx+CY0g3d6avWTlHAK2U63zjw6u81ikBCoAxHzX8unGdhzvQ==
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
Subject: [PATCH 4/4] media: rkvdec: Hook the (TRY_)DECODER_CMD stateless ioctls
Date: Thu,  9 Nov 2023 21:16:40 +0100
Message-ID: <20231109201640.340556-4-paul.kocialkowski@bootlin.com>
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

Fixes: ed7bb87d3d03 ("media: rkvdec: Enable capture buffer holding for H264")
Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 drivers/staging/media/rkvdec/rkvdec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index 84a41792cb4b..ac398b5a9736 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -461,6 +461,9 @@ static const struct v4l2_ioctl_ops rkvdec_ioctl_ops = {
 
 	.vidioc_streamon = v4l2_m2m_ioctl_streamon,
 	.vidioc_streamoff = v4l2_m2m_ioctl_streamoff,
+
+	.vidioc_decoder_cmd = v4l2_m2m_ioctl_stateless_decoder_cmd,
+	.vidioc_try_decoder_cmd = v4l2_m2m_ioctl_stateless_try_decoder_cmd,
 };
 
 static int rkvdec_queue_setup(struct vb2_queue *vq, unsigned int *num_buffers,
-- 
2.42.1

