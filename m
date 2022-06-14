Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BF51851;
	Tue, 14 Jun 2022 07:49:59 +0000 (UTC)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:4a7b:8d3a:acaa:ec46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 355BA66016A9;
	Tue, 14 Jun 2022 08:49:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655192997;
	bh=bowMSxciKZ4e4jd3aI13NZ259r8hIcdS0hJZN8hF4F0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=am6dIRgB2Z8tcxTQDnF0xQ/hv8i9+hn7Z4CM2Ko7C/xrF/YPjsNcE8jka7UmySIG+
	 pTCNnoB8HHFsn+v12vg3AwUIk2oaBpwzhUhcqyn6CUltI5MHtdNTFqP/pJZLRn8QWP
	 r1KOWngutNnnvY5dFGRUz6DjhDlVL5swtF/vQqkH9dgJMC7IAyRtYbBxRTJ+hmJTQt
	 agnSEAaAXU3SrTs9/Wa7dOj435ATy5TZ1FUCnS1BYvVzgtcc5pWvs0z3cCf6b86Yhp
	 MyHhPJKr+bdl7Aao0Q+FKsI6FI/7XXocMIlKn3Bj7wehOUYW+aDdBjMCgRR/G5P7kT
	 MmTs6g4eN9o4g==
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
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v7 03/17] vivid: add dynamic array test control
Date: Tue, 14 Jun 2022 09:49:33 +0200
Message-Id: <20220614074947.160316-4-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220614074947.160316-1-benjamin.gaignard@collabora.com>
References: <20220614074947.160316-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Add a dynamic array test control to help test support for this
feature.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/test-drivers/vivid/vivid-ctrls.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
index e7516dc1227b..7267892dc18a 100644
--- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
+++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
@@ -34,6 +34,7 @@
 #define VIVID_CID_U8_4D_ARRAY		(VIVID_CID_CUSTOM_BASE + 10)
 #define VIVID_CID_AREA			(VIVID_CID_CUSTOM_BASE + 11)
 #define VIVID_CID_RO_INTEGER		(VIVID_CID_CUSTOM_BASE + 12)
+#define VIVID_CID_U32_DYN_ARRAY		(VIVID_CID_CUSTOM_BASE + 13)
 
 #define VIVID_CID_VIVID_BASE		(0x00f00000 | 0xf000)
 #define VIVID_CID_VIVID_CLASS		(0x00f00000 | 1)
@@ -189,6 +190,19 @@ static const struct v4l2_ctrl_config vivid_ctrl_u32_array = {
 	.dims = { 1 },
 };
 
+static const struct v4l2_ctrl_config vivid_ctrl_u32_dyn_array = {
+	.ops = &vivid_user_gen_ctrl_ops,
+	.id = VIVID_CID_U32_DYN_ARRAY,
+	.name = "U32 Dynamic Array",
+	.type = V4L2_CTRL_TYPE_U32,
+	.flags = V4L2_CTRL_FLAG_DYNAMIC_ARRAY,
+	.def = 50,
+	.min = 10,
+	.max = 90,
+	.step = 1,
+	.dims = { 100 },
+};
+
 static const struct v4l2_ctrl_config vivid_ctrl_u16_matrix = {
 	.ops = &vivid_user_gen_ctrl_ops,
 	.id = VIVID_CID_U16_MATRIX,
@@ -1612,6 +1626,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 	dev->ro_int32 = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_ro_int32, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_area, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_array, NULL);
+	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_dyn_array, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u16_matrix, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u8_4d_array, NULL);
 
-- 
2.32.0

