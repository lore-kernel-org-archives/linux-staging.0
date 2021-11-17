Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C752C82
	for <linux-staging@lists.linux.dev>; Wed, 17 Nov 2021 09:25:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D558A6321B;
	Wed, 17 Nov 2021 09:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637141141;
	bh=2NFPJOuua1H2yh5+o5FLJwN4cMgnjF5fSg2Mz48DBrw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SEBvqBE3NyM9pLZSAH6uWYdC4N57YdQ+qs75FquNbCqJzSRPoqTpMzqNRPZv5xRuW
	 seZgOsKNefzaGPc6/QWaJeS1WYEgULexhNlHNFIvrJWGE3GNKFz8DuRSRTckyq41UP
	 LtfZvHMqjWhUrYQCfsfefPe3vw/FEHfDt8ET/VkGK1wN35OJT+7cnweo8jvAD+PAXX
	 bGhfm1Hrw6nLogE5hUMHQCx85G4WAESDGsNfqZf7czB7BjcUjpuQl4EwusVjPNPqLK
	 m1p0WWjh3IK7LRk2T9GduUgAZ04M/+yj5sY7c/0JI1VQKwZ5XpuF9RexAu+6aXvVGQ
	 vMHRkDnIpsxKw==
Received: by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1mnHCF-00Cb61-Aa; Wed, 17 Nov 2021 09:25:39 +0000
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: linuxarm@huawei.com,
	mauro.chehab@huawei.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 09/13] media: atomisp: get rid of #ifdef HAS_BL
Date: Wed, 17 Nov 2021 09:25:34 +0000
Message-Id: <e3e4e62c3b9fa421030121ea19bb829fd393f4fb.1637140900.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637140900.git.mchehab+huawei@kernel.org>
References: <cover.1637140900.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

This does nothing but declare extern to a non-existing var.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/13] at: https://lore.kernel.org/all/cover.1637140900.git.mchehab+huawei@kernel.org/

 drivers/staging/media/atomisp/pci/sh_css_firmware.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.h b/drivers/staging/media/atomisp/pci/sh_css_firmware.h
index 66cd38f08f71..a73ce703adfb 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.h
@@ -29,9 +29,6 @@ struct  sh_css_fw_bi_file_h {
 };
 
 extern struct ia_css_fw_info     sh_css_sp_fw;
-#if defined(HAS_BL)
-extern struct ia_css_fw_info     sh_css_bl_fw;
-#endif /* HAS_BL */
 extern struct ia_css_blob_descr *sh_css_blob_info;
 extern unsigned int sh_css_num_binaries;
 
-- 
2.33.1

