Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A122CA7
	for <linux-staging@lists.linux.dev>; Sat,  8 Jan 2022 12:50:24 +0000 (UTC)
Received: from dslb-188-097-214-229.188.097.pools.vodafone-ip.de ([188.97.214.229] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n6BAm-0005EJ-1l; Sat, 08 Jan 2022 13:50:16 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 05/12] staging: r8188eu: remove obsolete defines and comments
Date: Sat,  8 Jan 2022 13:49:52 +0100
Message-Id: <20220108124959.313215-6-martin@kaiser.cx>
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

Remove some unused phycfg defines and obsolete comments.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
index 302b15b2874d..c06a332f6b20 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
@@ -8,25 +8,6 @@
 #include "../include/rtw_iol.h"
 #include "../include/rtl8188e_hal.h"
 
-/*---------------------------Define Local Constant---------------------------*/
-/* Channel switch:The size of command tables for switch channel*/
-#define MAX_PRECMD_CNT 16
-#define MAX_RFDEPENDCMD_CNT 16
-#define MAX_POSTCMD_CNT 16
-
-#define MAX_DOZE_WAITING_TIMES_9x 64
-
-/*---------------------------Define Local Constant---------------------------*/
-
-/*------------------------Define global variable-----------------------------*/
-
-/*------------------------Define local variable------------------------------*/
-
-/*--------------------Define export function prototype-----------------------*/
-/*  Please refer to header file */
-/*--------------------Define export function prototype-----------------------*/
-
-/*----------------------------Function Body----------------------------------*/
 /*  */
 /*  1. BB register R/W API */
 /*  */
-- 
2.30.2

