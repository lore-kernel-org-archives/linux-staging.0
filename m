Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619D96D32
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:11:42 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id l4so32776491ejc.10
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Pc+UpZW6zuxxtN78JPj6CuF7dRwvtE3THoyVwHgkKBA=;
        b=dNQOS3OPsK1yEpG/WPtWXrVFiuG7etkOI51Sh9VWStjwJ+AOL9MuoXu47NqWWv+tDz
         KCXY3sVN64WOJn70+JpS4OCSBqbcFnmU2Ny3ZwLofpD8cQ02KHfeSzFUE+W3sPt7H/Cv
         9tZy72QEa+1obg97WycCqCLRFWYJRBowwNQmkDwmmcKvSCbYWihrxgMcVTrVOejdRXj7
         FtzWHTTGErr2ZpgA/8d1aS3Jnv00Rlvtje3wdEpyJJIVUGvRFsRax6eUYFhMotN91wJA
         6DHhihHmCU0xEvuWPUaFxBzll9zhQKlvSPUF5Sp7lIgoDgVEP2wLajecTBC7qLfylnVb
         c2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Pc+UpZW6zuxxtN78JPj6CuF7dRwvtE3THoyVwHgkKBA=;
        b=T4kU381YteDSASRwBFAd4caq3n74QcdBAKsAHDY6BQwurg5dvuWqHxUgSuSDpTR+z5
         QH09ChBYkIIHsWkhedV1S2vtfaXpXPbECQo464gm0d+FFak9BDV94119fIjcceh/v77I
         sKt/yvBbqjECWBpqspzpsdvSh2uGgCq2kZgvC2sKhqLnRdCezT/RYl3pehNxQ1D0l40L
         hH5eFJ/4s9OADlVxpHjAy5eo4LmwUXmhnR3D8T5/MfSNrDtDNnlYcX4DqOdI24ac9+aV
         WnUcJOdsxG8SQBEhQmJiS5JQEfEooyWCtOnibZiAogiyRiloFJtO5u7WCtdVLwnBfquU
         i1JQ==
X-Gm-Message-State: AOAM532xVv414/72+rbLqUKV0KQ9VIguqn5m5SScVT5sDzJzqht1a+MW
	D6K032InJcJBem7C22wdfFotuQ==
X-Google-Smtp-Source: ABdhPJy5+FISslOZnI5Q3QXlgGgghtIXmARVW03ZmvzAC1dW0ak/HnOQKRBMhI/V7eAiK16wIbYMww==
X-Received: by 2002:a17:907:7785:: with SMTP id ky5mr135881ejc.133.1618423900933;
        Wed, 14 Apr 2021 11:11:40 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:11:40 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH 06/57] staging: r819xU_cmdpkt: Remove functionless method 'cmpk_handle_query_config_rx'
Date: Wed, 14 Apr 2021 19:10:38 +0100
Message-Id: <20210414181129.1628598-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 drivers/staging/rtl8192u/r819xU_cmdpkt.c: In function ‘cmpk_handle_query_config_rx’:
 drivers/staging/rtl8192u/r819xU_cmdpkt.c:274:24: warning: variable ‘rx_query_cfg’ set but not used [-Wunused-but-set-variable]

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/rtl8192u/r819xU_cmdpkt.c | 41 ------------------------
 1 file changed, 41 deletions(-)

diff --git a/drivers/staging/rtl8192u/r819xU_cmdpkt.c b/drivers/staging/rtl8192u/r819xU_cmdpkt.c
index 4cece40a92f6e..30a320422358d 100644
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
@@ -514,7 +474,6 @@ u32 cmpk_message_handle_rx(struct net_device *dev,
 			break;
 
 		case BOTH_QUERY_CONFIG:
-			cmpk_handle_query_config_rx(dev, pcmd_buff);
 			cmd_length = CMPK_BOTH_QUERY_CONFIG_SIZE;
 			break;
 
-- 
2.27.0

