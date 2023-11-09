Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A733DA29
	for <linux-staging@lists.linux.dev>; Thu,  9 Nov 2023 20:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GztfFeM7"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2776FFF803;
	Thu,  9 Nov 2023 20:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699561528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Q5JlwMJpMIt/MHhbVPYmlbPUzRqUQBvdijuUa1ufz/g=;
	b=GztfFeM7qmVKMjv9o6GV5qzc4uqlkgxE+fJdHnlcscUrLo1enusWvlUCbdrB0lf0Wso8Gd
	uGFGiW6VGim8H5FQiyqjssJgT3AKahZKR0sEaRvUCnZncfb6tO/VtuyqkI4X+hhue6wysz
	3EkcQVIbB2lGeJH+YZmHxAnK87in69yna6JPSGVBbjQ6U9Pntw5lbd8CpFmfEQ32AtS+6k
	tgzALHd4yPlGjMrLUOo9f5MKAYn0fW8RCRoG/EciSxpXvTdkrQFL4nvARzP6bwWB3iApqY
	RGzkxt6Dl3lOxqMXiiJmVaq8LR1iuq4rEi4a7HDm+N2zmx8Gf+m0hqqXFrL/bQ==
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH] v4l2-compliance: codecs: Add stateless (TRY_)DECODER_CMD tests
Date: Thu,  9 Nov 2023 21:25:17 +0100
Message-ID: <20231109202517.341923-1-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.42.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: paul.kocialkowski@bootlin.com

Stateless codecs that support holding the capture buffer should implement the
(TRY_)DECODER_CMD ioctls for the flushing command (and only this command).

Add a conditional to separate the stateless case from stateful one and move
the existing tests there.

Add new tests for the stateless case which ensure that the flush command is
supported and that the other stateful commands are note.

And existing check will already return early (without error) when the ioctls
are not implemented at all. Note that there is no easy way to check for the
capture buffer holding buffer flag since it requires setting up a coded format
in particular to be visible, which is far from trivial to implement here.
As a result we just carry out the tests when the ioctls are available.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 utils/v4l2-compliance/v4l2-test-codecs.cpp | 111 ++++++++++++++-------
 1 file changed, 75 insertions(+), 36 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-test-codecs.cpp b/utils/v4l2-compliance/v4l2-test-codecs.cpp
index df25a1ddc358..8c3527359813 100644
--- a/utils/v4l2-compliance/v4l2-test-codecs.cpp
+++ b/utils/v4l2-compliance/v4l2-test-codecs.cpp
@@ -99,6 +99,7 @@ int testDecoder(struct node *node)
 {
 	struct v4l2_decoder_cmd cmd;
 	bool is_decoder = node->codec_mask & (STATEFUL_DECODER | JPEG_DECODER);
+	bool is_stateless = node->codec_mask & STATELESS_DECODER;
 	int ret;
 
 	fail_on_test((node->codec_mask & STATELESS_DECODER) && !node->has_media);
@@ -118,42 +119,80 @@ int testDecoder(struct node *node)
 	fail_on_test(ret == ENOTTY);
 	fail_on_test(ret != EINVAL);
 
-	cmd.cmd = V4L2_DEC_CMD_STOP;
-	cmd.flags = ~0;
-	ret = doioctl(node, VIDIOC_TRY_DECODER_CMD, &cmd);
-	fail_on_test(ret != 0);
-	fail_on_test(cmd.flags & ~(V4L2_DEC_CMD_STOP_TO_BLACK | V4L2_DEC_CMD_STOP_IMMEDIATELY));
-	fail_on_test(is_decoder && cmd.flags);
-	ret = doioctl(node, VIDIOC_DECODER_CMD, &cmd);
-	fail_on_test(ret != 0);
-
-	cmd.cmd = V4L2_DEC_CMD_START;
-	cmd.flags = ~0;
-	ret = doioctl(node, VIDIOC_TRY_DECODER_CMD, &cmd);
-	fail_on_test(ret);
-	fail_on_test(cmd.flags & ~V4L2_DEC_CMD_START_MUTE_AUDIO);
-	fail_on_test(is_decoder && cmd.flags);
-
-	cmd.cmd = V4L2_DEC_CMD_START;
-	cmd.flags = 0;
-	cmd.start.speed = ~0;
-	cmd.start.format = ~0U;
-	ret = doioctl(node, VIDIOC_TRY_DECODER_CMD, &cmd);
-	fail_on_test(ret);
-	fail_on_test(cmd.start.format == ~0U);
-	fail_on_test(cmd.start.speed == ~0);
-	fail_on_test(is_decoder && cmd.start.format);
-	fail_on_test(is_decoder && cmd.start.speed);
-
-	cmd.cmd = V4L2_DEC_CMD_PAUSE;
-	cmd.flags = 0;
-	ret = doioctl(node, VIDIOC_DECODER_CMD, &cmd);
-	fail_on_test(ret != EPERM && ret != EINVAL);
-	fail_on_test(is_decoder && ret != EINVAL);
+	if (is_stateless) {
+		cmd.cmd = V4L2_DEC_CMD_FLUSH;
+		cmd.flags = 0;
+		ret = doioctl(node, VIDIOC_TRY_DECODER_CMD, &cmd);
+		fail_on_test(ret);
+		ret = doioctl(node, VIDIOC_DECODER_CMD, &cmd);
+		fail_on_test(ret);
+
+		cmd.cmd = V4L2_DEC_CMD_STOP;
+		cmd.flags = 0;
+		ret = doioctl(node, VIDIOC_TRY_DECODER_CMD, &cmd);
+		fail_on_test(!ret);
+		ret = doioctl(node, VIDIOC_DECODER_CMD, &cmd);
+		fail_on_test(!ret);
+
+		cmd.cmd = V4L2_DEC_CMD_START;
+		cmd.flags = 0;
+		ret = doioctl(node, VIDIOC_TRY_DECODER_CMD, &cmd);
+		fail_on_test(!ret);
+		ret = doioctl(node, VIDIOC_DECODER_CMD, &cmd);
+		fail_on_test(!ret);
+
+		cmd.cmd = V4L2_DEC_CMD_PAUSE;
+		cmd.flags = 0;
+		ret = doioctl(node, VIDIOC_TRY_DECODER_CMD, &cmd);
+		fail_on_test(!ret);
+		ret = doioctl(node, VIDIOC_DECODER_CMD, &cmd);
+		fail_on_test(!ret);
+
+		cmd.cmd = V4L2_DEC_CMD_RESUME;
+		cmd.flags = 0;
+		ret = doioctl(node, VIDIOC_TRY_DECODER_CMD, &cmd);
+		fail_on_test(!ret);
+		ret = doioctl(node, VIDIOC_DECODER_CMD, &cmd);
+		fail_on_test(!ret);
+	} else {
+		cmd.cmd = V4L2_DEC_CMD_STOP;
+		cmd.flags = ~0;
+		ret = doioctl(node, VIDIOC_TRY_DECODER_CMD, &cmd);
+		fail_on_test(ret);
+		fail_on_test(cmd.flags & ~(V4L2_DEC_CMD_STOP_TO_BLACK | V4L2_DEC_CMD_STOP_IMMEDIATELY));
+		fail_on_test(is_decoder && cmd.flags);
+		ret = doioctl(node, VIDIOC_DECODER_CMD, &cmd);
+		fail_on_test(ret);
+
+		cmd.cmd = V4L2_DEC_CMD_START;
+		cmd.flags = ~0;
+		ret = doioctl(node, VIDIOC_TRY_DECODER_CMD, &cmd);
+		fail_on_test(ret);
+		fail_on_test(cmd.flags & ~V4L2_DEC_CMD_START_MUTE_AUDIO);
+		fail_on_test(is_decoder && cmd.flags);
+
+		cmd.cmd = V4L2_DEC_CMD_START;
+		cmd.flags = 0;
+		cmd.start.speed = ~0;
+		cmd.start.format = ~0U;
+		ret = doioctl(node, VIDIOC_TRY_DECODER_CMD, &cmd);
+		fail_on_test(ret);
+		fail_on_test(cmd.start.format == ~0U);
+		fail_on_test(cmd.start.speed == ~0);
+		fail_on_test(is_decoder && cmd.start.format);
+		fail_on_test(is_decoder && cmd.start.speed);
+
+		cmd.cmd = V4L2_DEC_CMD_PAUSE;
+		cmd.flags = 0;
+		ret = doioctl(node, VIDIOC_DECODER_CMD, &cmd);
+		fail_on_test(ret != EPERM && ret != EINVAL);
+		fail_on_test(is_decoder && ret != EINVAL);
+
+		cmd.cmd = V4L2_DEC_CMD_RESUME;
+		ret = doioctl(node, VIDIOC_DECODER_CMD, &cmd);
+		fail_on_test(ret != EPERM && ret != EINVAL);
+		fail_on_test(is_decoder && ret != EINVAL);
+	}
 
-	cmd.cmd = V4L2_DEC_CMD_RESUME;
-	ret = doioctl(node, VIDIOC_DECODER_CMD, &cmd);
-	fail_on_test(ret != EPERM && ret != EINVAL);
-	fail_on_test(is_decoder && ret != EINVAL);
 	return 0;
 }
-- 
2.42.1

