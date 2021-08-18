Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4216D17
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 23:42:57 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id j12-20020a05600c1c0c00b002e6d80c902dso2876904wms.4
        for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 16:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fS87NzQwLT8g66B7fskAIWcIr5+nFxmzUVQe97BcNMA=;
        b=2LLT+ZN1EAetJhx8/FJo9T8oYwnVl3/ZAag7ZCfKAylDCaoQUXDJuyrbsP0oYO30xJ
         q7n39aIn28mrkea0MZ60YVEuvGon9pyRg+WIhTUlqL0NwqgGyz+xa7guV94zrs3UECx4
         kMyo7vZejteDT41CG3H0nwDYGQtD7XIdpUMkbRMYZpLd8lNuxY46DfXLq3uV2eivwcPz
         8cqYuztRcpWshNeYLuD79aQWM9M2HQidZ2aH6RpfuKXkPCW89/E902w7D1qc9XgWci9Z
         TMuPXjAUrLPfuk6DjPdKF1r+9Lvs31FKjoMpGh52vC65n3WKjxYz3oIjyHUCeapPCuwK
         v0AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fS87NzQwLT8g66B7fskAIWcIr5+nFxmzUVQe97BcNMA=;
        b=ulV1vhd385N7WJ4tos5AsddiZvY4JGANiP6tWWxkNkZDwdOQVKC07hFRrNqClKqzw8
         2h+HqpcouiyevQS5FBDpkZm+SYXToIDFFVCL5WD1rLJiSD4ZP2j9eC64qLwhewgzO3w+
         5JB6iifTp5JUgXpmHiDCB0aC118irJiuSBPHarhDuhoSV39J+7xJ8O9i7B8Uc8w3o1Jr
         iwagdkUKV3rNq+OHPvf27NPqB7uV3iUNeSvrAlRGjKJb9ItjO1b/6ZwHKUbQd44EiRQX
         pJoF6HwNKkwK8rTAqu9H8CcQ67d6VhopoCL+qWoyWIVXnC/DJOO4eEb36jF/+AAsBeMW
         Ky4A==
X-Gm-Message-State: AOAM533ueE5QEaTkxtdAK/jPr4hjW0Yj7xvm6pIexzOmGask7Jl/XXhS
	/VTRgIm4D/Ty9w9G3u/0C/TH/w==
X-Google-Smtp-Source: ABdhPJy87p+QaMAhA3A9d7t6/3wJ21c0PEe/UwXDw1z5nhan2j7WVLu5bh/Kemv/Bjz/pJx+epFpTQ==
X-Received: by 2002:a7b:ca45:: with SMTP id m5mr10750096wml.158.1629330176181;
        Wed, 18 Aug 2021 16:42:56 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id z8sm1194926wrt.77.2021.08.18.16.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 16:42:55 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	martin@kaiser.cx,
	straube.linux@gmail.com,
	Larry.Finger@lwfinger.net
Subject: [PATCH 2/6] staging: r8188eu: remove unused function dump_txrpt_ccx_88e
Date: Thu, 19 Aug 2021 00:42:49 +0100
Message-Id: <20210818234253.208271-3-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210818234253.208271-1-phil@philpotter.co.uk>
References: <20210818234253.208271-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused function dump_txrpt_ccx_88e from hal/rtl8188e_xmit.c and
remove its declaration in include/rtl8188e_xmit.h, as this function is
not called from anywhere, and is thus dead code.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/hal/rtl8188e_xmit.c   | 22 -------------------
 .../staging/r8188eu/include/rtl8188e_xmit.h   |  1 -
 2 files changed, 23 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_xmit.c b/drivers/staging/r8188eu/hal/rtl8188e_xmit.c
index d2b55d581f95..46b871f3f631 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_xmit.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_xmit.c
@@ -7,28 +7,6 @@
 #include "../include/drv_types.h"
 #include "../include/rtl8188e_hal.h"
 
-void dump_txrpt_ccx_88e(void *buf)
-{
-	struct txrpt_ccx_88e *txrpt_ccx = (struct txrpt_ccx_88e *)buf;
-
-	DBG_88E("%s:\n"
-		"tag1:%u, pkt_num:%u, txdma_underflow:%u, int_bt:%u, int_tri:%u, int_ccx:%u\n"
-		"mac_id:%u, pkt_ok:%u, bmc:%u\n"
-		"retry_cnt:%u, lifetime_over:%u, retry_over:%u\n"
-		"ccx_qtime:%u\n"
-		"final_data_rate:0x%02x\n"
-		"qsel:%u, sw:0x%03x\n",
-		__func__, txrpt_ccx->tag1, txrpt_ccx->pkt_num,
-		txrpt_ccx->txdma_underflow, txrpt_ccx->int_bt,
-		txrpt_ccx->int_tri, txrpt_ccx->int_ccx,
-		txrpt_ccx->mac_id, txrpt_ccx->pkt_ok, txrpt_ccx->bmc,
-		txrpt_ccx->retry_cnt, txrpt_ccx->lifetime_over,
-		txrpt_ccx->retry_over, txrpt_ccx_qtime_88e(txrpt_ccx),
-		txrpt_ccx->final_data_rate, txrpt_ccx->qsel,
-		txrpt_ccx_sw_88e(txrpt_ccx)
-	);
-}
-
 void handle_txrpt_ccx_88e(struct adapter *adapter, u8 *buf)
 {
 	struct txrpt_ccx_88e *txrpt_ccx = (struct txrpt_ccx_88e *)buf;
diff --git a/drivers/staging/r8188eu/include/rtl8188e_xmit.h b/drivers/staging/r8188eu/include/rtl8188e_xmit.h
index d2099da1a41a..20b55e3850ba 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_xmit.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_xmit.h
@@ -150,7 +150,6 @@ s32 rtl8188eu_xmitframe_complete(struct adapter *padapter,
 				 struct xmit_priv *pxmitpriv,
 				 struct xmit_buf *pxmitbuf);
 
-void dump_txrpt_ccx_88e(void *buf);
 void handle_txrpt_ccx_88e(struct adapter *adapter, u8 *buf);
 
 #endif /* __RTL8188E_XMIT_H__ */
-- 
2.31.1

