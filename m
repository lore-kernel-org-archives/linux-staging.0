Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C1835E943;
	Mon, 23 Mar 2026 07:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774249481; cv=none; b=AGmxYwGYjEkim5/fCN0dqoe414kd3WC1zOb2lZNbdEf7x/1JVtFk9c+xAHlLP+4jwg/SKtmA+LppJt9w9cEdP25dhxLkdeV3QqjZkT46pMKhN3UGyikMNSJAtxI2dbn6n3fAS7vgegnh/CW/8+QjNdIapswqYYDryBRPRSgv+7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774249481; c=relaxed/simple;
	bh=tMEYlVHp6hUFnHSYMVowf2FmdIrqmaKgC8udEcLl9Ng=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wvtc1pnB2oX0UG7uWjg/q7itApX581/EzmEtMzL040OL1eyuwqvFmWDLIwV1M3jV8F3xZuyYeIncpQObIyIQifouF8OE2W11NS5GNSsIhyvNd8Qp2dyqMLvJ+F5w7dHcX/yJ9uHId2Dh7auAGPEE8qwiiXQ0BgAolgT207KtGCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.197])
	by APP-03 (Coremail) with SMTP id rQCowAC31dyy5cBphAWGCw--.41446S2;
	Mon, 23 Mar 2026 15:03:14 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: mripard@kernel.org
Cc: paulk@sys-base.io,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	pengpeng@iscas.ac.cn
Subject: [PATCH 7/7] media: cedrus: validate HEVC slice reference lists
Date: Mon, 23 Mar 2026 15:03:14 +0800
Message-ID: <20260323070314.42949-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAC31dyy5cBphAWGCw--.41446S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF4fAFW5ArWrGF43AF18Zrb_yoW8Cryfpr
	4Y9r15Za1kJr43KFW3Zw4UZ3W5uas3AFZxGrW7W3WxuanxtFyxXr1Yka45ZFn5Ar4rCrWx
	Arn3tw1jkFyUZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8Jw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUL0edUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

Cedrus consumes HEVC slice parameters directly from stateless V4L2
controls, but it does not validate the active reference counts or the
ref_idx_l0/ref_idx_l1 values before using them in fixed-size 16-entry
reference arrays. Oversized counts or indices can therefore walk past
the end of those arrays in the HEVC decode path.

Reject HEVC slice controls whose active reference counts or reference
indices exceed V4L2_HEVC_DPB_ENTRIES_NUM_MAX.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 22 +++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 6600245dff0e..d68da1eaa7aa 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -77,6 +77,28 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 			ctx->bit_depth = bit_depth;
 			cedrus_reset_cap_format(ctx);
 		}
+	} else if (ctrl->id == V4L2_CID_STATELESS_HEVC_SLICE_PARAMS) {
+		const struct v4l2_ctrl_hevc_slice_params *slice = ctrl->p_new.p_hevc_slice_params;
+		unsigned int i;
+
+		if (slice->num_ref_idx_l0_active_minus1 >=
+		    V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
+			return -EINVAL;
+
+		for (i = 0; i <= slice->num_ref_idx_l0_active_minus1; i++)
+			if (slice->ref_idx_l0[i] >= V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
+				return -EINVAL;
+
+		if (slice->slice_type == V4L2_HEVC_SLICE_TYPE_B) {
+			if (slice->num_ref_idx_l1_active_minus1 >=
+			    V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
+				return -EINVAL;
+
+			for (i = 0; i <= slice->num_ref_idx_l1_active_minus1; i++)
+				if (slice->ref_idx_l1[i] >=
+				    V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
+					return -EINVAL;
+		}
 	}
 
 	return 0;
-- 
2.50.1 (Apple Git-155)

