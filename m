Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DA92FB2
	for <linux-staging@lists.linux.dev>; Sun, 18 Jul 2021 17:37:36 +0000 (UTC)
Received: from dslb-178-004-206-019.178.004.pools.vodafone-ip.de ([178.4.206.19] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1m5AjO-0006oR-9R; Sun, 18 Jul 2021 19:37:34 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 09/10] staging: rtl8188eu: remove PWR_CMD_READ
Date: Sun, 18 Jul 2021 19:36:09 +0200
Message-Id: <20210718173610.894-9-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210718173610.894-1-martin@kaiser.cx>
References: <20210718173610.894-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

None of the power flows and transitions includes a read command.
PWR_CMD_READ can be removed.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/hal/pwrseqcmd.c     | 2 --
 drivers/staging/rtl8188eu/include/pwrseqcmd.h | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/pwrseqcmd.c b/drivers/staging/rtl8188eu/hal/pwrseqcmd.c
index f2b973b377dd..cab774e31c60 100644
--- a/drivers/staging/rtl8188eu/hal/pwrseqcmd.c
+++ b/drivers/staging/rtl8188eu/hal/pwrseqcmd.c
@@ -25,8 +25,6 @@ u8 rtl88eu_pwrseqcmdparsing(struct adapter *padapter, struct wl_pwr_cfg pwrseqcm
 		pwrcfgcmd = pwrseqcmd[aryidx];
 
 		switch (GET_PWR_CFG_CMD(pwrcfgcmd)) {
-		case PWR_CMD_READ:
-			break;
 		case PWR_CMD_WRITE:
 			offset = GET_PWR_CFG_OFFSET(pwrcfgcmd);
 
diff --git a/drivers/staging/rtl8188eu/include/pwrseqcmd.h b/drivers/staging/rtl8188eu/include/pwrseqcmd.h
index e364ee450beb..a5eb95fc58b9 100644
--- a/drivers/staging/rtl8188eu/include/pwrseqcmd.h
+++ b/drivers/staging/rtl8188eu/include/pwrseqcmd.h
@@ -10,7 +10,6 @@
 #include <drv_types.h>
 
 /* The value of cmd: 4 bits */
-#define PWR_CMD_READ		0x00
 #define PWR_CMD_WRITE		0x01
 #define PWR_CMD_POLLING		0x02
 #define PWR_CMD_DELAY		0x03
-- 
2.20.1

