Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B8917F
	for <linux-staging@lists.linux.dev>; Sat,  5 Jun 2021 16:59:22 +0000 (UTC)
Received: from dslb-188-096-145-192.188.096.pools.vodafone-ip.de ([188.96.145.192] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1lpZdh-0002hw-S2; Sat, 05 Jun 2021 18:59:13 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/9] staging: rtl8188eu: remove unused RT_PRINT_DATA macro
Date: Sat,  5 Jun 2021 18:58:50 +0200
Message-Id: <20210605165858.3175-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RT_PRINT_DATA macro is not used. Remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/include/rtw_debug.h | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/staging/rtl8188eu/include/rtw_debug.h b/drivers/staging/rtl8188eu/include/rtw_debug.h
index 1fdf16124a0d..7e2be1ba80fb 100644
--- a/drivers/staging/rtl8188eu/include/rtw_debug.h
+++ b/drivers/staging/rtl8188eu/include/rtw_debug.h
@@ -85,24 +85,6 @@ extern u32 GlobalDebugLevel;
 		}							\
 	} while (0)
 
-#define RT_PRINT_DATA(_comp, _level, _titlestring, _hexdata, _hexdatalen)\
-	do {								\
-		if (_level <= GlobalDebugLevel) {			\
-			int __i;					\
-			u8	*ptr = (u8 *)_hexdata;			\
-			pr_info("%s", DRIVER_PREFIX);			\
-			pr_info(_titlestring);				\
-			for (__i = 0; __i < (int)_hexdatalen; __i++) {	\
-				pr_info("%02X%s", ptr[__i],		\
-					 (((__i + 1) % 4) == 0) ?	\
-					 "  " : " ");	\
-				if (((__i + 1) % 16) == 0)		\
-					pr_cont("\n");			\
-			}						\
-			pr_cont("\n");					\
-		}							\
-	} while (0)
-
 int proc_get_drv_version(char *page, char **start,
 			 off_t offset, int count,
 			 int *eof, void *data);
-- 
2.20.1

