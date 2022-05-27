Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C411FA5;
	Fri, 27 May 2022 14:31:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: benjamin.gaignard)
	with ESMTPSA id 3CF1A1F462AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1653661912;
	bh=pjNKQqJt+fujWp4j47KE/erfcCEMJ6ylcH5fLNYA0qE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mmZA/mXEea/eW/uxsDU1U0FHkgOXSSfTYCckMo23T8W0bOLcRRCBya4+s0p+f3mWB
	 5gdmKu5OclUZxANkKkSzzPmqxtcfMfaevZfRImYuou3I/L6nvCS70ZbXnioPUnj3L6
	 UoYbsaDDe7vlpJrzmg8b45pAavaaBF9V51QRBZwV2KAXRW95FI3jMCYwTR7F5NR3kK
	 orL//OOJEnRGLAONeE2VEDMcjetuBYpqrFTp8t5i6fa1j8Yu/pxMXQ0Lb5/1p4E6SY
	 4bEoewky+ojuIXCRj+w77ReylzXl33StbKUxx7N72k6MNb/PUVAuGPqlBFQHmkc74F
	 +I/xfQR1Ea+Aw==
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
	nicolas.dufresne@collabora.com,
	andrzej.p@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v6 04/17] media: uapi: HEVC: Add missing fields in HEVC controls
Date: Fri, 27 May 2022 16:31:21 +0200
Message-Id: <20220527143134.3360174-5-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220527143134.3360174-1-benjamin.gaignard@collabora.com>
References: <20220527143134.3360174-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Complete the HEVC controls with missing fields from H.265 specifications.
Even if these fields aren't used by the current mainlined drivers
they will be required for (at least) the rkvdec driver.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
version 6:
- Add short_term_ref_pic_set_size and long_term_ref_pic_set_size
  in v4l2_ctrl_hevc_decode_params structure.

 .../media/v4l/ext-ctrls-codec.rst             | 32 +++++++++++++++++++
 include/media/hevc-ctrls.h                    |  8 ++++-
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 6183f43f4d73..aa7556e200c9 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -2683,6 +2683,16 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
     :stub-columns: 0
     :widths:       1 1 2
 
+    * - __u8
+      - ``video_parameter_set_id``
+      - Specifies the value of the vps_video_parameter_set_id of the active VPS
+        as descibed in section "7.4.3.2.1 General sequence parameter set RBSP semantics"
+        of H.265 specifications.
+    * - __u8
+      - ``seq_parameter_set_id``
+      - Provides an identifier for the SPS for reference by other syntax elements
+        as descibed in section "7.4.3.2.1 General sequence parameter set RBSP semantics"
+        of H.265 specifications.
     * - __u16
       - ``pic_width_in_luma_samples``
       -
@@ -2822,6 +2832,9 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
     :stub-columns: 0
     :widths:       1 1 2
 
+    * - __u8
+      - ``pic_parameter_set_id``
+      - Identifies the PPS for reference by other syntax elements.
     * - __u8
       - ``num_extra_slice_header_bits``
       -
@@ -3048,6 +3061,15 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
     * - __u8
       - ``ref_idx_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
       - The list of L1 reference elements as indices in the DPB.
+    * - __u16
+      - ``short_term_ref_pic_set_size``
+      - Specifies the size, in bits, of the short-term reference picture set, described as st_ref_pic_set()
+        in the specification, included in the slice header or SPS (section 7.3.6.1).
+    * - __u16
+      - ``long_term_ref_pic_set_size``
+      - Specifies the size, in bits, of the long-term reference picture set include in the slice header
+        or SPS. It is the number of bits in the conditional block if(long_term_ref_pics_present_flag)
+        in section 7.3.6.1 of the specification.
     * - __u8
       - ``padding``
       - Applications and drivers must set this to zero.
@@ -3385,6 +3407,16 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
       - ``pic_order_cnt_val``
       - PicOrderCntVal as described in section 8.3.1 "Decoding process
         for picture order count" of the specification.
+    * - __u16
+      - ``short_term_ref_pic_set_size``
+      - Specifies the size, in bits, of the short-term reference picture set, of the first slice
+        described as st_ref_pic_set() in the specification, included in the slice header
+        or SPS (section 7.3.6.1).
+    * - __u16
+      - ``long_term_ref_pic_set_size``
+      - Specifies the size, in bits, of the long-term reference picture set, of the first slice
+        included in the slice header or SPS. It is the number of bits in the conditional block
+        if(long_term_ref_pics_present_flag) in section 7.3.6.1 of the specification.
     * - __u8
       - ``num_active_dpb_entries``
       - The number of entries in ``dpb``.
diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
index 01ccda48d8c5..752a8d10782c 100644
--- a/include/media/hevc-ctrls.h
+++ b/include/media/hevc-ctrls.h
@@ -58,6 +58,8 @@ enum v4l2_mpeg_video_hevc_start_code {
 /* The controls are not stable at the moment and will likely be reworked. */
 struct v4l2_ctrl_hevc_sps {
 	/* ISO/IEC 23008-2, ITU-T Rec. H.265: Sequence parameter set */
+	__u8	video_parameter_set_id;
+	__u8	seq_parameter_set_id;
 	__u16	pic_width_in_luma_samples;
 	__u16	pic_height_in_luma_samples;
 	__u8	bit_depth_luma_minus8;
@@ -108,6 +110,7 @@ struct v4l2_ctrl_hevc_sps {
 
 struct v4l2_ctrl_hevc_pps {
 	/* ISO/IEC 23008-2, ITU-T Rec. H.265: Picture parameter set */
+	__u8	pic_parameter_set_id;
 	__u8	num_extra_slice_header_bits;
 	__u8	num_ref_idx_l0_default_active_minus1;
 	__u8	num_ref_idx_l1_default_active_minus1;
@@ -199,7 +202,8 @@ struct v4l2_ctrl_hevc_slice_params {
 	__u32	slice_segment_addr;
 	__u8	ref_idx_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
 	__u8	ref_idx_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
-
+	__u16	short_term_ref_pic_set_size;
+	__u16	long_term_ref_pic_set_size;
 	__u8	padding;
 
 	/* ISO/IEC 23008-2, ITU-T Rec. H.265: Weighted prediction parameter */
@@ -214,6 +218,8 @@ struct v4l2_ctrl_hevc_slice_params {
 
 struct v4l2_ctrl_hevc_decode_params {
 	__s32	pic_order_cnt_val;
+	__u16	short_term_ref_pic_set_size;
+	__u16	long_term_ref_pic_set_size;
 	__u8	num_active_dpb_entries;
 	struct	v4l2_hevc_dpb_entry dpb[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
 	__u8	num_poc_st_curr_before;
-- 
2.32.0

