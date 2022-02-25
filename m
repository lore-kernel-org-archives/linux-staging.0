Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AB123CF;
	Fri, 25 Feb 2022 16:46:18 +0000 (UTC)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:947c:7c9e:f96:1bc])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 262671F462F1;
	Fri, 25 Feb 2022 16:46:16 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1645807576;
	bh=YWoA037snSA7wD3VkSa07RJuXKwU1NO6Ilf4uAXZ1Vw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ewzCencoe1xXlPBvcYAUgetXy/tMPMuMy3goy23eQknrt0IE9Sbx3lkJVWjsEQH/A
	 1yll2W6ja0lbFUDGEKFwLksDs491HeiUCtqTdVNqFPPBsUlKVcdw7EDWn97FjRH9qQ
	 +o3HVp+FnKsBvlWANbygQQuN9nZHZvn/SyLdtfPXkYdy2kWJh8NOBoMKS9fvyatPUx
	 zVpBTLT1KzobSviue5Sn3nx5K/6WrSCzSjuGn30vEiCWrmeOuiuCbYy6Ef9Rq1jgHU
	 XpfZ+zkMIlWClMcei68KwE10mJp6nxG9yaUMVUzqFm3XUIdExQHCShJppMw1/4TJMh
	 ooMkPYuGU5Wxg==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org,
	mripard@kernel.org,
	paul.kocialkowski@bootlin.com,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	jonas@kwiboo.se,
	nicolas@ndufresne.ca
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	kernel@collabora.com,
	knaerzche@gmail.com,
	jc@kynesim.co.uk,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v3 10/14] media: uapi: Move the HEVC stateless control type out of staging
Date: Fri, 25 Feb 2022 17:45:56 +0100
Message-Id: <20220225164600.1044663-11-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220225164600.1044663-1-benjamin.gaignard@collabora.com>
References: <20220225164600.1044663-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the HEVC stateless controls types out of staging,
and re-number them.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../userspace-api/media/videodev2.h.rst.exceptions         | 5 +++++
 include/media/hevc-ctrls.h                                 | 7 -------
 include/uapi/linux/videodev2.h                             | 6 ++++++
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 9cbb7a0c354a..ee34f13e8142 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -153,6 +153,11 @@ replace symbol V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_VP9_FRAME :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HDR10_CLL_INFO :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS :c:type:`v4l2_ctrl_type`
 
 # V4L2 capability defines
 replace define V4L2_CAP_VIDEO_CAPTURE device-capabilities
diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
index 3f8a67924df3..cbf41d180fe9 100644
--- a/include/media/hevc-ctrls.h
+++ b/include/media/hevc-ctrls.h
@@ -22,13 +22,6 @@
 #define V4L2_CID_STATELESS_HEVC_START_CODE	(V4L2_CID_CODEC_BASE + 1016)
 #define V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSET (V4L2_CID_CODEC_BASE + 1017)
 
-/* enum v4l2_ctrl_type type values */
-#define V4L2_CTRL_TYPE_HEVC_SPS 0x0120
-#define V4L2_CTRL_TYPE_HEVC_PPS 0x0121
-#define V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS 0x0122
-#define V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX 0x0123
-#define V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS 0x0124
-
 enum v4l2_stateless_hevc_decode_mode {
 	V4L2_STATELESS_HEVC_DECODE_MODE_SLICE_BASED,
 	V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 959a849388f5..9af1c2460148 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1830,6 +1830,12 @@ enum v4l2_ctrl_type {
 
 	V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR	= 0x0260,
 	V4L2_CTRL_TYPE_VP9_FRAME		= 0x0261,
+
+	V4L2_CTRL_TYPE_HEVC_SPS			= 0x0270,
+	V4L2_CTRL_TYPE_HEVC_PPS			= 0x0271,
+	V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS	= 0x0272,
+	V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX	= 0x0273,
+	V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS	= 0x0274,
 };
 
 /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
-- 
2.32.0

