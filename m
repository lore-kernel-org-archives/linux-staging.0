Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA319138C;
	Tue, 15 Feb 2022 11:01:18 +0000 (UTC)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:6d7b:ae43:289b:7e7c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C91C61F444EC;
	Tue, 15 Feb 2022 11:01:16 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1644922877;
	bh=EVoYd2VUxnshChUNTMhTwtDEy2xrxnjx59gb/i+wQfo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X7QcTKa14ICpheQxh2o/ux1GrwHbUoWFe4fO9H/PMBdsNZskkMN22h3ZojbV6WWcs
	 AoSS3ltQzzdrdDPU46GbLekBpGGaIUUHJYB2jEhHWYCWZgMgWeDRgzd5NOtzoleMmV
	 BTbPy8hGU7vLmukLgqPruKGzw+13j1vFIYZvZXs9F8eXimnr5m5xXCq5OJs9hpvcjA
	 wlJEPQt0AtImkhbsGUDe8H0YT4v1vCIQ8cJnMnl0LKn+uHYG9gvmH3NQdcPIWSt6Ml
	 +MfQ5QBL153RuWvGi1QI3UE3onKoJti0etIE7iemOVgOaUfQziOC/QI2RDhZ6ebKoI
	 mTcAVzOtyPwVA==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org,
	mripard@kernel.org,
	paul.kocialkowski@bootlin.com,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	hverkuil-cisco@xs4all.nl,
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
Subject: [RFC v2 7/8] media: uapi: Add V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSET control
Date: Tue, 15 Feb 2022 12:01:02 +0100
Message-Id: <20220215110103.241297-8-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220215110103.241297-1-benjamin.gaignard@collabora.com>
References: <20220215110103.241297-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The number of 'entry point offset' could be very variable.
Rather than use a large static array define a v4l2 dynamic array
of integer control.
The number of entry point offsets is reported by the elems field.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
version 2:
- Define a new CID for entry point offsets parameters
 .../userspace-api/media/v4l/ext-ctrls-codec.rst          | 9 +++++++++
 include/uapi/linux/v4l2-controls.h                       | 1 +
 2 files changed, 10 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index c3ae97657fa7..679595e94643 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -3101,6 +3101,15 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
 
     \normalsize
 
+``V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS (integer)``
+    Specifies the i-th entry point offset in bytes and is represented by
+    offset_len_minus1 plus 1 bits.
+    This control is a dynamically sized array. The number of entry point
+    offsets is reported by the ``elems`` field.
+    This bitstream parameter is defined according to :ref:`hevc`.
+    They are described in section 7.4.7.1 "General slice segment header
+    semantics" of the specification.
+
 ``V4L2_CID_STATELESS_HEVC_SCALING_MATRIX (struct)``
     Specifies the HEVC scaling matrix parameters used for the scaling process
     for transform coefficients.
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 27f5d272dc43..700e6cce958c 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -2314,6 +2314,7 @@ struct v4l2_ctrl_vp9_compressed_hdr {
 #define V4L2_CID_STATELESS_HEVC_DECODE_PARAMS	(V4L2_CID_CODEC_STATELESS_BASE + 404)
 #define V4L2_CID_STATELESS_HEVC_DECODE_MODE	(V4L2_CID_CODEC_STATELESS_BASE + 405)
 #define V4L2_CID_STATELESS_HEVC_START_CODE	(V4L2_CID_CODEC_STATELESS_BASE + 406)
+#define V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSET	(V4L2_CID_CODEC_STATELESS_BASE + 407)
 
 enum v4l2_stateless_hevc_decode_mode {
 	V4L2_STATELESS_HEVC_DECODE_MODE_SLICE_BASED,
-- 
2.32.0

