Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3268258D;
	Thu,  7 Apr 2022 15:30:01 +0000 (UTC)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:4da4:8da5:b6b4:93c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9E6051F467BC;
	Thu,  7 Apr 2022 16:29:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1649345397;
	bh=KvZLsQUppWj4xIkkXbkpLHZvTj++QLRrkWvezh2Rqfk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eKNWT+p0jlTvMHxWVAN+hB0lbs64Rh2brRL9tOkNDvzK1ZlbOVn4z5VBhNkki2fLX
	 k8ZxXqI0ju/ckyEJT6l5B/Rx8fHpHt6WA5milgXS4m81CLzy2zIdLMWIRcRP3MeLr7
	 KP+0xQmSFC67tylvTAt9ALX7ZxHyLk6Aj7EvXqvoJ+TtyRpbjmy7NuWncC6utgSHjC
	 CLtIrAhBU6fOAh86gjY785AgCGHWGXRdX0LEURG+53PoLxiB2d6NAmoVz0defivDk7
	 HywmHgvkgzMi5m5tdx6ewX4DQuzNdCgX3/2pbHuLJjDZ1TpLpxh2O02SQ2Vft8IrzM
	 jRE0en8TS02Og==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org,
	mripard@kernel.org,
	paul.kocialkowski@bootlin.com,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	sebastian.fricke@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v5 13/17] media: controls: Log HEVC stateless control in .std_log
Date: Thu,  7 Apr 2022 17:29:36 +0200
Message-Id: <20220407152940.738159-14-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220407152940.738159-1-benjamin.gaignard@collabora.com>
References: <20220407152940.738159-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simply print the type of the control.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index cb709c74e01e..6a48c9022b74 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -307,6 +307,21 @@ static void std_log(const struct v4l2_ctrl *ctrl)
 	case V4L2_CTRL_TYPE_VP9_FRAME:
 		pr_cont("VP9_FRAME");
 		break;
+	case V4L2_CTRL_TYPE_HEVC_SPS:
+		pr_cont("HEVC_SPS");
+		break;
+	case V4L2_CTRL_TYPE_HEVC_PPS:
+		pr_cont("HEVC_PPS");
+		break;
+	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
+		pr_cont("HEVC_SLICE_PARAMS");
+		break;
+	case V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX:
+		pr_cont("HEVC_SCALING_MATRIX");
+		break;
+	case V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS:
+		pr_cont("HEVC_DECODE_PARAMS");
+		break;
 	default:
 		pr_cont("unknown type %d", ctrl->type);
 		break;
-- 
2.32.0

