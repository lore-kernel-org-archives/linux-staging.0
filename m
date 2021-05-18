Received: from mail-m121144.qiye.163.com (mail-m121144.qiye.163.com [115.236.121.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941A370
	for <linux-staging@lists.linux.dev>; Tue, 18 May 2021 11:12:00 +0000 (UTC)
Received: from Wanjb.localdomain (unknown [36.152.145.182])
	by mail-m121144.qiye.163.com (Hmail) with ESMTPA id 8DBC5AC0516;
	Tue, 18 May 2021 19:11:57 +0800 (CST)
From: Wan Jiabing <wanjiabing@vivo.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiabing Wan <kael_w@yeah.net>,
	Wan Jiabing <wanjiabing@vivo.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: media: atomisp: Align block comments
Date: Tue, 18 May 2021 19:11:12 +0800
Message-Id: <20210518111125.87304-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
	oVCBIfWUFZQ0MZS1ZITU4eSktITkpDS09VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
	hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Oj46HQw5Kj8VLysUTA0sHBxN
	EzhPCT5VSlVKTUlKSEhNSEpDSUpCVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
	TVVKTklVSk9OVUpDSVlXWQgBWUFJS0xONwY+
X-HM-Tid: 0a797f2cdf88b039kuuu8dbc5ac0516

From: Jiabing Wan<kael_w@yeah.net>

Fixing the following checkpatch warning:
WARNING: Block comments should align the * on each line

Signed-off-by: Jiabing Wan<kael_w@yeah.net>
---
 .../atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h
index be3534e46c15..9b22f2da45d5 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h
@@ -17,8 +17,8 @@
 #define __IA_CSS_ANR_TYPES_H
 
 /* @file
-* CSS-API header file for Advanced Noise Reduction kernel v1
-*/
+ * CSS-API header file for Advanced Noise Reduction kernel v1
+ */
 
 /* Application specific DMA settings  */
 #define ANR_BPP                 10
-- 
2.20.1

