Received: from cvsmtppost06.nm.naver.com (cvsmtppost06.nm.naver.com [114.111.35.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2358185B48
	for <linux-staging@lists.linux.dev>; Sun, 28 Dec 2025 15:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766934525; cv=none; b=D4sqGglIlf0MDMAxE7h59s9dWvt10r5nB4MtP+on7O3zqO42KizkutxWSGdjGv1b04hOvoNHDhLlgWfQJcJVSvu8t7k85K4JXWc68ehDPNa1ZLWMAQtwigV41XS+jgl7tNjOJUQrCKRL1JF+COPGuCDfGv09S+2mefan0dXN168=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766934525; c=relaxed/simple;
	bh=Frvj/entSvMCMMNUjhAxwvB8VkFzQfUNvBpWvIOEKFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WjR5VmTcX9r3XZ12bdlzMf5YUNmrcxp614kDtRQi2YEZEedRVC2+LieSCBdoTbjXv4pAUvy32dTk2YzzLgl2JSfDvKwlg5nPRqPA3DB9vlEv+pc2+uiHP+JFvdH/UlWahIHHhlIKrGhDnHUePrqxo7eaLxLV3j/Hllxcy74rG1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=f8W8U5Qm; arc=none smtp.client-ip=114.111.35.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="f8W8U5Qm"
Received: from cvsendbo034.nm ([10.112.20.50])
  by cvsmtppost06.nm.naver.com with ESMTP id RzlgS2tIROibVkDuKbw2Uw
  for <linux-staging@lists.linux.dev>;
  Sun, 28 Dec 2025 14:58:33 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1766933913; bh=Frvj/entSvMCMMNUjhAxwvB8VkFzQfUNvBpWvIOEKFU=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=f8W8U5Qmj6UN+kQfOSfBmEAb9NZFwqKwMeCFUeH+c9rdaYG3UDMpQcrnz+VcWVQ50
	 EWety4KqzrkLW9vOrP3RicMd/93qto7vE9T7IiqiaVQIsoDUaKlKSM/lyBk5rZW8MJ
	 tWLvKLyM/iTg3XVayQiRLoKYBf89wBy/yaZQWfkS0y1OB/iBxRfyyxiNWGhzW3wBPv
	 RM29gafnn3d/uiESoT+Uqlbxub/VqDaWXTvloqhtgS5N7bX2coFP/3GBNUhsPOvWx5
	 OiMVfs3DXMSHxp2nGkPDazmUvWvaBS4NWFJ/bTrIdlDaD8dTBgSPcXCOcEZqFs+gLI
	 IPwdrX9Jl418w==
X-Session-ID: Rbd0LRaSTPaqAHRIcmyxqQ
X-Works-Send-Opt: E/YqjAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: ewnmaxMrFqJZ+HmqKxEw+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by mvnsmtp01.nm.naver.com with ESMTP id Rbd0LRaSTPaqAHRIcmyxqQ
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Sun, 28 Dec 2025 14:58:33 -0000
From: Minu Jin <s9430939@naver.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	s9430939@naver.com
Subject: [PATCH] staging: rtl8723bs: use PTR_ALIGN for buffer alignment
Date: Sun, 28 Dec 2025 23:58:23 +0900
Message-ID: <20251228145823.3250174-1-s9430939@naver.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace manual pointer alignment calculation with the standard PTR_ALIGN
macro in rtw_init_cmd_priv()

This improves code readability and ensures the use of kernel's
preferred alignment mechanism instead of manual calculation

Signed-off-by: Minu Jin <s9430939@naver.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index ef2d92b5588a..0d2e8fade9c4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -7,6 +7,7 @@
 #include <drv_types.h>
 #include <hal_btcoex.h>
 #include <linux/jiffies.h>
+#include <linux/align.h>
 
 static struct _cmd_callback rtw_cmd_callback[] = {
 	{GEN_CMD_CODE(_Read_MACREG), NULL}, /*0*/
@@ -175,7 +176,7 @@ int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
 	if (!pcmdpriv->cmd_allocated_buf)
 		return -ENOMEM;
 
-	pcmdpriv->cmd_buf = pcmdpriv->cmd_allocated_buf  +  CMDBUFF_ALIGN_SZ - ((SIZE_PTR)(pcmdpriv->cmd_allocated_buf) & (CMDBUFF_ALIGN_SZ-1));
+	pcmdpriv->cmd_buf = PTR_ALIGN(pcmdpriv->cmd_allocated_buf, CMDBUFF_ALIGN_SZ);
 
 	pcmdpriv->rsp_allocated_buf = rtw_zmalloc(MAX_RSPSZ + 4);
 
-- 
2.43.0

