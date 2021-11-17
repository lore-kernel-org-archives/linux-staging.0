Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B92F2C9D
	for <linux-staging@lists.linux.dev>; Wed, 17 Nov 2021 09:56:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5DD9863246;
	Wed, 17 Nov 2021 09:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637143017;
	bh=07G0e/N5iiuEK2dNozy5ihyYLeg+YstFI5BSSZf3/hI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B1VTFJi5YnLDv/Ov0MNgyoXLDOejAoy3ynQzqbSlz64MjgQ25ISl1fd4QR9w85IyF
	 y5RGx+yHxlpqDk2cHMItyz4Z6M4PQuS3jUyQSLjfWtgUcdKr1q6SKLWx2vRzmYoV20
	 ei7ae6eFT8+ui7n+nCX3kKhPVoc36cnobVJoX/KTNSQT98BN/OHr6rsnf2vQ9tk608
	 SH7lq2ibSPaYEUw0zbgogUmoDP7ClfA2dBlx8qjd6h0QME4Z6qvFgr0bsZnzr/4KfF
	 6UV8THluTbRdvu/y2SpG0LGUSusT92ukM0WAqsANQw9QxK1f/zSQOXg8r5vcZZE86q
	 jwV6He2YIqTjQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1mnHgV-00DIUt-94; Wed, 17 Nov 2021 09:56:55 +0000
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: linuxarm@huawei.com,
	mauro.chehab@huawei.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 10/12] media: atomisp: get rid of sctbl_legacy_*
Date: Wed, 17 Nov 2021 09:56:52 +0000
Message-Id: <50f1d9343b915a7c3480c0aff9f6a01aea034987.1637142905.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637142905.git.mchehab+huawei@kernel.org>
References: <cover.1637142905.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

Those seem to be used only on certain ISP2401 firmwares that
aren't supported by the driver. So, get rid of them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/12] at: https://lore.kernel.org/all/cover.1637142905.git.mchehab+huawei@kernel.org/

 .../atomisp/pci/runtime/binary/interface/ia_css_binary.h  | 2 --
 .../staging/media/atomisp/pci/runtime/binary/src/binary.c | 6 ------
 drivers/staging/media/atomisp/pci/sh_css_param_shading.c  | 8 ++++----
 3 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/interface/ia_css_binary.h b/drivers/staging/media/atomisp/pci/runtime/binary/interface/ia_css_binary.h
index 6f110d241836..9935ac860bc2 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/interface/ia_css_binary.h
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/interface/ia_css_binary.h
@@ -130,8 +130,6 @@ struct ia_css_binary {
 	int                      sctbl_width_per_color;
 	int                      sctbl_aligned_width_per_color;
 	int                      sctbl_height;
-	int                      sctbl_legacy_width_per_color;
-	int                      sctbl_legacy_height;
 	struct ia_css_sdis_info	 dis;
 	struct ia_css_resolution dvs_envelope;
 	bool                     online;
diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index bbb93cb8c070..9af23fdb127b 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -1339,18 +1339,12 @@ ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
 			binary->sctbl_width_per_color = _ISP2401_SCTBL_WIDTH_PER_COLOR(isp_internal_width, s3a_log_deci);
 			binary->sctbl_aligned_width_per_color = SH_CSS_MAX_SCTBL_ALIGNED_WIDTH_PER_COLOR;
 			binary->sctbl_height = _ISP2401_SCTBL_HEIGHT(isp_internal_height, s3a_log_deci);
-			binary->sctbl_legacy_width_per_color  = _ISP_SCTBL_LEGACY_WIDTH_PER_COLOR(sc_3a_dis_padded_width, s3a_log_deci);
-			binary->sctbl_legacy_height = _ISP_SCTBL_LEGACY_HEIGHT(sc_3a_dis_height, s3a_log_deci);
 		}
 	} else
 	{
 		binary->sctbl_width_per_color         = 0;
 		binary->sctbl_aligned_width_per_color = 0;
 		binary->sctbl_height                  = 0;
-		if (IS_ISP2401) {
-			binary->sctbl_legacy_width_per_color  = 0;
-			binary->sctbl_legacy_height	      = 0;
-		}
 	}
 	ia_css_sdis_init_info(&binary->dis,
 			      sc_3a_dis_width,
diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_shading.c b/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
index dc433fd96d55..0abd5bf36b7f 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
@@ -242,8 +242,8 @@ prepare_shading_table(const struct ia_css_shading_table *in_table,
 
 	if (!in_table) {
 		sh_css_params_shading_id_table_generate(target_table,
-							binary->sctbl_legacy_width_per_color,
-							binary->sctbl_legacy_height);
+							binary->sctbl_width_per_color,
+							binary->sctbl_height);
 		return;
 	}
 
@@ -290,8 +290,8 @@ prepare_shading_table(const struct ia_css_shading_table *in_table,
 
 	/* This prepare_shading_table() function is called only in legacy API (not in new API).
 	   Then, the legacy shading table width and height should be used. */
-	table_width  = binary->sctbl_legacy_width_per_color;
-	table_height = binary->sctbl_legacy_height;
+	table_width  = binary->sctbl_width_per_color;
+	table_height = binary->sctbl_height;
 
 	result = ia_css_shading_table_alloc(table_width, table_height);
 	if (!result) {
-- 
2.33.1

