Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4309370
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 18:48:18 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id h10so12383267edt.13
        for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 11:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CLWRaO5ZqKnnKAniIlo1Keihq6ioiH5Ebgdd1JLKcuU=;
        b=Tbw7JlMLqgWsGYOF21ZRyS0bymgqTuwt4PVr2F6MnnlmvSonJJyx3KJmHrKSIJgy0e
         0VSGrJeeZjQA8UFi9AJujw+qgIrazKf+HQJvj9gdTo/sxOmRGA4hnTuES41GB5bRgLKe
         Y0O8FTDiUJsJ/b/zTD/YbrElyMWoFnw/kcSRp3gusC0i7IfEvYfU5uz7FFz0TdW480+U
         2r6wKpDhZDEVdqx1r9xSCZH9cS2vvR6ZTpbdALxJNFCcdBDCZKwKNM9kFZ6tECRO0y/8
         OeYIRheFAKCmu5bHEr2MgkYjkf1Hfydp22y9uXpwRvJrLGK12O615ivS8iSfyFIm+RIr
         gHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CLWRaO5ZqKnnKAniIlo1Keihq6ioiH5Ebgdd1JLKcuU=;
        b=EzQ4FHwdfU3buQekl2ltmF/NV99AL+4kRZBuGLKmXZPTUgPYEUyzOJPH3TlaaSE6Sd
         cfEPVI0+X/M+BLHg7/yiLgueJBFYQwIPlR+6x3JjkiU1dO26pSlVQRjv2B/PqhkP5rI6
         0ClGSqTItEW+lfKyGd+jUOVtX3IC+iZxuhM5qTmJZqKGEPC8EgddOB2C+KdLoG97EnfM
         +wKt9LLrx307WLFsU9myL5+rJeHqEr7q8v5zAcQuveFPe8xkZsCGXbIQtNRXCN0mpMt9
         hs8Yy8Xmb1c4Jx7gU1mO9M8VKdVbd6AE13wfVpQvOmtphbeC7qDMSN4GugJ4KYoFuydI
         fJIQ==
X-Gm-Message-State: AOAM530li+TxvPXjiUZpvYp+5134VN2+ko2s4vEvTQc1HiTTz9p5X3Qo
	6xq6mquaTUi5SEfhBcmklQA=
X-Google-Smtp-Source: ABdhPJzzcPl8/5bSnbMu0Ew1HhIyxhyDt58qBxZT2qiqHwdaStPDKNU+hrfEc0XITXZusIYVYUGfYw==
X-Received: by 2002:aa7:cb89:: with SMTP id r9mr26607291edt.245.1618166896788;
        Sun, 11 Apr 2021 11:48:16 -0700 (PDT)
Received: from localhost.localdomain (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id q18sm5069171edr.26.2021.04.11.11.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 11:48:16 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	outreachy-kernel@googlegroups.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [Outreachy kernel] [PATCH] staging: rtl8192u: Remove function
Date: Sun, 11 Apr 2021 20:48:13 +0200
Message-Id: <20210411184813.22836-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove cmpk_handle_query_config_rx() because it just initializes a local
variable and then returns "void".

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/rtl8192u/r819xU_cmdpkt.c | 40 ------------------------
 1 file changed, 40 deletions(-)

diff --git a/drivers/staging/rtl8192u/r819xU_cmdpkt.c b/drivers/staging/rtl8192u/r819xU_cmdpkt.c
index 4cece40a92f6..d5a54c2d3086 100644
--- a/drivers/staging/rtl8192u/r819xU_cmdpkt.c
+++ b/drivers/staging/rtl8192u/r819xU_cmdpkt.c
@@ -249,46 +249,6 @@ static void cmpk_handle_interrupt_status(struct net_device *dev, u8 *pmsg)
 	DMESG("<---- cmpk_handle_interrupt_status()\n");
 }
 
-/*-----------------------------------------------------------------------------
- * Function:    cmpk_handle_query_config_rx()
- *
- * Overview:    The function is responsible for extract the message from
- *		firmware. It will contain dedicated info in
- *		ws-06-0063-rtl8190-command-packet-specification. Please
- *		refer to chapter "Beacon State Element".
- *
- * Input:       u8    *pmsg	-	Message Pointer of the command packet.
- *
- * Output:      NONE
- *
- * Return:      NONE
- *
- * Revised History:
- *  When		Who	Remark
- *  05/12/2008		amy	Create Version 0 porting from windows code.
- *
- *---------------------------------------------------------------------------
- */
-static void cmpk_handle_query_config_rx(struct net_device *dev, u8 *pmsg)
-{
-	struct cmpk_query_cfg	rx_query_cfg;
-
-	/* 1. Extract TX feedback info from RFD to temp structure buffer. */
-	/* It seems that FW use big endian(MIPS) and DRV use little endian in
-	 * windows OS. So we have to read the content byte by byte or transfer
-	 * endian type before copy the message copy.
-	 */
-	rx_query_cfg.cfg_action		= (pmsg[4] & 0x80) >> 7;
-	rx_query_cfg.cfg_type		= (pmsg[4] & 0x60) >> 5;
-	rx_query_cfg.cfg_size		= (pmsg[4] & 0x18) >> 3;
-	rx_query_cfg.cfg_page		= (pmsg[6] & 0x0F) >> 0;
-	rx_query_cfg.cfg_offset		= pmsg[7];
-	rx_query_cfg.value		= (pmsg[8]  << 24) | (pmsg[9]  << 16) |
-					  (pmsg[10] <<  8) | (pmsg[11] <<  0);
-	rx_query_cfg.mask		= (pmsg[12] << 24) | (pmsg[13] << 16) |
-					  (pmsg[14] <<  8) | (pmsg[15] <<  0);
-}
-
 /*-----------------------------------------------------------------------------
  * Function:	cmpk_count_tx_status()
  *
-- 
2.31.1

