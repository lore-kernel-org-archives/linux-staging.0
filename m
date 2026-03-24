Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276E337D119;
	Tue, 24 Mar 2026 02:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317904; cv=none; b=bROo9sy4oaqlQV5q+S+01ZlqYLrDXbsmmeb5b8Xpci7MPLnn56f1He24LSLFEpineor5z8SLidKRFLBnhGzGIHwpUtYjR798w43gejfoFU1vZVuw9UhCO+WFDnZ+QfUGJr9c30BCuKH+IiWlqQh5zLLY0/78NboqPyGGgTtLBCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317904; c=relaxed/simple;
	bh=DAwIrXebhENqL23L45uimbqY/43wBEmFqnRddH3bpLg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FpdiWfj+el8yy+CB3EYa/2uDqXz5eOiy+4JkFIdjvS19xUwbsTLQttzySrPkI7r0wYavMx89sM6eyBmk6vQYQSqMC+cXqscziBFcYpB92OrbLCendp2UDMrqMavgK41sQI4e28Vy9Bsslw1G+pjHZ1ZqWiMXMs21RIOgVZwOS9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.197])
	by APP-05 (Coremail) with SMTP id zQCowAAXrA8v8cFpkBFKCw--.34865S2;
	Tue, 24 Mar 2026 10:04:54 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	pengpeng@iscas.ac.cn
Subject: [PATCH] media: cedrus: validate H.264 reference list indices
Date: Tue, 24 Mar 2026 10:04:31 +0800
Message-ID: <20260324020431.1800-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAAXrA8v8cFpkBFKCw--.34865S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KF48WFykJr4fGrW3ZFyDGFg_yoW8tFyxpF
	45Cr13ZayUXF43KF43Zr4kXa4a9as3AFsxKrWag3W3X3W3GFy7Xr4rKw1UZrn8Aa15C3ya
	yrn5J3yUKFyUAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUGVWUXwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjfUO9N3UUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

Cedrus validates HEVC slice reference lists in cedrus_try_ctrl(), but
the H.264 path still consumes ref_pic_list0/ref_pic_list1 indices
straight from the stateless slice control. Those indices are later
used to index the fixed-size decode_params->dpb[] array in
_cedrus_write_ref_list().

Reject H.264 slice controls whose active reference counts or
reference indices exceed V4L2_H264_NUM_DPB_ENTRIES before the driver
reaches the DPB lookup. This keeps the validation next to the existing
Cedrus stateless control checks and avoids driver-specific
out-of-bounds reads from malformed userspace control payloads.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 23 +++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index d68da1eaa7aa..905084c097a9 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -42,6 +42,29 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 		if (sps->bit_depth_luma_minus8 != 0)
 			/* Only 8-bit is supported */
 			return -EINVAL;
+	} else if (ctrl->id == V4L2_CID_STATELESS_H264_SLICE_PARAMS) {
+		const struct v4l2_ctrl_h264_slice_params *slice = ctrl->p_new.p_h264_slice_params;
+		unsigned int i;
+
+		if (slice->num_ref_idx_l0_active_minus1 >=
+		    V4L2_H264_NUM_DPB_ENTRIES)
+			return -EINVAL;
+
+		for (i = 0; i <= slice->num_ref_idx_l0_active_minus1; i++)
+			if (slice->ref_pic_list0[i].index >=
+			    V4L2_H264_NUM_DPB_ENTRIES)
+				return -EINVAL;
+
+		if (slice->slice_type == V4L2_H264_SLICE_TYPE_B) {
+			if (slice->num_ref_idx_l1_active_minus1 >=
+			    V4L2_H264_NUM_DPB_ENTRIES)
+				return -EINVAL;
+
+			for (i = 0; i <= slice->num_ref_idx_l1_active_minus1; i++)
+				if (slice->ref_pic_list1[i].index >=
+				    V4L2_H264_NUM_DPB_ENTRIES)
+					return -EINVAL;
+		}
 	} else if (ctrl->id == V4L2_CID_STATELESS_HEVC_SPS) {
 		const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
 		struct cedrus_ctx *ctx = container_of(ctrl->handler, struct cedrus_ctx, hdl);
-- 
2.50.1 (Apple Git-155)

