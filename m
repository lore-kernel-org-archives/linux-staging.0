Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27C92CAD
	for <linux-staging@lists.linux.dev>; Sat,  8 Jan 2022 12:50:23 +0000 (UTC)
Received: from dslb-188-097-214-229.188.097.pools.vodafone-ip.de ([188.97.214.229] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n6BAl-0005EJ-6c; Sat, 08 Jan 2022 13:50:15 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 04/12] staging: r8188eu: remove unused chip type settings
Date: Sat,  8 Jan 2022 13:49:51 +0100
Message-Id: <20220108124959.313215-5-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220108124959.313215-1-martin@kaiser.cx>
References: <20220108124959.313215-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove some unused defines and macros related to chip type.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/HalVerDef.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/r8188eu/include/HalVerDef.h b/drivers/staging/r8188eu/include/HalVerDef.h
index 62b94c993f0d..f4816ac765e5 100644
--- a/drivers/staging/r8188eu/include/HalVerDef.h
+++ b/drivers/staging/r8188eu/include/HalVerDef.h
@@ -6,7 +6,6 @@
 enum HAL_CHIP_TYPE {
 	TEST_CHIP	=	0,
 	NORMAL_CHIP	=	1,
-	FPGA		=	2,
 };
 
 enum HAL_CUT_VERSION {
@@ -40,8 +39,6 @@ struct HAL_VERSION {
 /* HAL_VERSION VersionID */
 
 /* HAL_CHIP_TYPE_E */
-#define IS_TEST_CHIP(version)				\
-	((GET_CVID_CHIP_TYPE(version) == TEST_CHIP) ? true : false)
 #define IS_NORMAL_CHIP(version)				\
 	((GET_CVID_CHIP_TYPE(version) == NORMAL_CHIP) ? true : false)
 
@@ -60,7 +57,5 @@ struct HAL_VERSION {
 /* HAL_VENDOR_E */
 #define IS_CHIP_VENDOR_TSMC(version)			\
 	((GET_CVID_MANUFACTUER(version) == CHIP_VENDOR_TSMC) ? true : false)
-#define IS_CHIP_VENDOR_UMC(version)			\
-	((GET_CVID_MANUFACTUER(version) == CHIP_VENDOR_UMC) ? true : false)
 
 #endif
-- 
2.30.2

