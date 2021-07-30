Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE61E70
	for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 09:24:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 243ED61019;
	Fri, 30 Jul 2021 09:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1627637076;
	bh=g/dXt/cFBU0Nui5Tbj/TQ5h9fg+EzWM8pM3nB1HcNMg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OUaT6pWokQNAbk2GUH3M51Lfg+rAjv2kjlemnS9aVEJQZ9nzxZOCJxWFo6GUhncQQ
	 28Cvhx4g/REjJYiYxYmRAAmnkGTKMxI44i5OqMDfrl9awDkxXTjd+cqZbde//7Q1gn
	 4JyEphB5h46tJea+HOYvke67TQ62/C/bQpgJjkRE=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-staging@lists.linux.dev
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 06/12] staging: r8188eu: remove include/Hal8188EReg.h
Date: Fri, 30 Jul 2021 11:24:11 +0200
Message-Id: <20210730092417.1014392-6-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210730092417.1014392-1-gregkh@linuxfoundation.org>
References: <20210730092417.1014392-1-gregkh@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1569; h=from:subject; bh=g/dXt/cFBU0Nui5Tbj/TQ5h9fg+EzWM8pM3nB1HcNMg=; b=owGbwMvMwCRo6H6F97bub03G02pJDInMRx1uT95ZfUZi9nZ9a8l0y0fbYhWnRoirugikyup/fyi4 5W18RywLgyATg6yYIsuXbTxH91ccUvQytD0NM4eVCWQIAxenAEyE4x7Dgr49R3hf3kzr5q0xq9P/tu 5RVbxSCcOCmV1K8iInaxXljet3brs9cee6okwtAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

No one is using the defines in this file, so remove it as it is not
needed anywhere.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/r8188eu/include/Hal8188EReg.h | 19 -------------------
 drivers/staging/r8188eu/include/odm_precomp.h |  1 -
 2 files changed, 20 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/include/Hal8188EReg.h

diff --git a/drivers/staging/r8188eu/include/Hal8188EReg.h b/drivers/staging/r8188eu/include/Hal8188EReg.h
deleted file mode 100644
index e04fae68fa4b..000000000000
--- a/drivers/staging/r8188eu/include/Hal8188EReg.h
+++ /dev/null
@@ -1,19 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
-/* Copyright(c) 2007 - 2011 Realtek Corporation. */
-
-#ifndef	__HAL_8188E_REG_H__
-#define __HAL_8188E_REG_H__
-
-/*  */
-/*  Register Definition */
-/*  */
-#define TRX_ANTDIV_PATH             0x860
-#define RX_ANTDIV_PATH              0xb2c
-#define	ODM_R_A_AGC_CORE1_8188E		0xc50
-
-/*  */
-/*  Bitmap Definition */
-/*  */
-#define	BIT_FA_RESET_8188E			BIT0
-
-#endif
diff --git a/drivers/staging/r8188eu/include/odm_precomp.h b/drivers/staging/r8188eu/include/odm_precomp.h
index 7e5db893c1ea..b3d8f6463658 100644
--- a/drivers/staging/r8188eu/include/odm_precomp.h
+++ b/drivers/staging/r8188eu/include/odm_precomp.h
@@ -32,7 +32,6 @@
 #include "HalHWImg8188E_MAC.h"
 #include "HalHWImg8188E_RF.h"
 #include "HalHWImg8188E_BB.h"
-#include "Hal8188EReg.h"
 
 #include "odm_RegConfig8188E.h"
 #include "odm_RTL8188E.h"
-- 
2.32.0

