Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FD22C81;
	Tue, 12 Oct 2021 14:36:08 +0000 (UTC)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:4cb:a870:dcd8:9f87:c3be:dc06])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5BA5A1F43BC7;
	Tue, 12 Oct 2021 15:36:01 +0100 (BST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org,
	mripard@kernel.org,
	paul.kocialkowski@bootlin.com,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	hverkuil-cisco@xs4all.nl,
	jc@kynesim.co.uk,
	ezequiel@vanguardiasur.com.ar
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 1/4] media: hevc: Remove RPS named flags
Date: Tue, 12 Oct 2021 16:35:49 +0200
Message-Id: <20211012143552.661751-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211012143552.661751-1-benjamin.gaignard@collabora.com>
References: <20211012143552.661751-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Marking a picture as long-term reference is valid for DPB but not for RPS.
Change flag name to match with it description in HEVC spec chapiter
"8.3.2 Decoding process for reference picture set".
Remove the other unused RPS flags.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
version 2:
- change DPB field name from rps to flags

 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 8 +++-----
 drivers/staging/media/hantro/hantro_g2_hevc_dec.c         | 2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c          | 2 +-
 include/media/hevc-ctrls.h                                | 6 ++----
 4 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index e141f0e4eec9..38da33e61c3d 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -3166,11 +3166,9 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
 	:c:func:`v4l2_timeval_to_ns()` function to convert the struct
 	:c:type:`timeval` in struct :c:type:`v4l2_buffer` to a __u64.
     * - __u8
-      - ``rps``
-      - The reference set for the reference frame
-        (V4L2_HEVC_DPB_ENTRY_RPS_ST_CURR_BEFORE,
-        V4L2_HEVC_DPB_ENTRY_RPS_ST_CURR_AFTER or
-        V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR)
+      - ``flags``
+      - Long term flag for the reference frame
+        (V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE)
     * - __u8
       - ``field_pic``
       - Whether the reference is a field picture or a frame.
diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
index 76a921163b9a..bbf71dcea099 100644
--- a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
+++ b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
@@ -445,7 +445,7 @@ static int set_ref(struct hantro_ctx *ctx)
 		chroma_addr = luma_addr + cr_offset;
 		mv_addr = luma_addr + mv_offset;
 
-		if (dpb[i].rps == V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR)
+		if (dpb[i].flags == V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE)
 			dpb_longterm_e |= BIT(V4L2_HEVC_DPB_ENTRIES_NUM_MAX - 1 - i);
 
 		hantro_write_addr(vpu, G2_REG_ADDR_REF(i), luma_addr);
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index 3d9561d4aadb..1edfc3823a57 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -169,7 +169,7 @@ static void cedrus_h265_ref_pic_list_write(struct cedrus_dev *dev,
 		unsigned int index = list[i];
 		u8 value = list[i];
 
-		if (dpb[index].rps == V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR)
+		if (dpb[index].flags == V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE)
 			value |= VE_DEC_H265_SRAM_REF_PIC_LIST_LT_REF;
 
 		/* Each SRAM word gathers up to 4 references. */
diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
index ef63bc205756..01ccda48d8c5 100644
--- a/include/media/hevc-ctrls.h
+++ b/include/media/hevc-ctrls.h
@@ -127,15 +127,13 @@ struct v4l2_ctrl_hevc_pps {
 	__u64	flags;
 };
 
-#define V4L2_HEVC_DPB_ENTRY_RPS_ST_CURR_BEFORE	0x01
-#define V4L2_HEVC_DPB_ENTRY_RPS_ST_CURR_AFTER	0x02
-#define V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR		0x03
+#define V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE	0x01
 
 #define V4L2_HEVC_DPB_ENTRIES_NUM_MAX		16
 
 struct v4l2_hevc_dpb_entry {
 	__u64	timestamp;
-	__u8	rps;
+	__u8	flags;
 	__u8	field_pic;
 	__u16	pic_order_cnt[2];
 	__u8	padding[2];
-- 
2.30.2

