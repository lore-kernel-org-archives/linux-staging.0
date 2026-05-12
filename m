Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D13203710
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 00:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778545989; cv=none; b=F65Uc6M8umr40QJFLIAouS8psZLl1EoNjGPw2HJxgnxXOU+IuGsgyKPJsLk3OjLxI0dbM/CvKWJ7pXh4LKmrZY6Hd5BFWmAYzUImEKCw+bMnNJyrZ9fnnEdt1jYqR32ZZk7MRXehR0np3sDUyN4w6gbKjasLHsAWHTS5AQSXKkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778545989; c=relaxed/simple;
	bh=8apqNBwiUQ3KFEg2m0RNCENPpWhJVedpM0Uk42cNPhg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qxT88orK9L9LFab/+lTe1sTyNRm1NVTBFIZulz2fFpXIiaOpXBf0omMcsgnjTNLuRxFaSlmGaCkQvfOQhZq3DEKDxdy5C4NYD4t8y30lafAttJi76rq0SmBa9bytelcWN+801CnAStWG2oI4M2dfcx31v/1qb/GU3+nuYTAnUzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XTgKr8eA; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XTgKr8eA"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6587cee8b57so5289982d50.2
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 17:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778545987; x=1779150787; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YFO4d3KKfbsFkrq+A20d24Xfl/9uhV3LI/OXh0Z5sZ0=;
        b=XTgKr8eAn6NNezml0SNNfAPTnTf3pKcnafNszbyO5nk0kg5BnKp9jlIovSx9rIY/nh
         PawsBnHuYN1HDJQDUMG7KKweWCJ5Nm00NjN+jlTLP9KveUld4Pa2Ju80DSmg+fC/k4JA
         MKKa8z6YXaLWEi/xUis1VMGQQ2PuWkNhxrohLuhhZWhaOUDdyQlPhWj7gxWcfUFpxnmZ
         K6Yhkvjd6xYLLeJssD8FqIrDm4EQaRoZqcZTOv8mLtSg+UcNUTESx/SmFiukUDsJQnr6
         0CfEPEnj9TvXoPUWIeevbjYHTC4a1728BUAgpbtKza0lys8CZ72oYj81td8JQIJ80qrw
         nkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778545987; x=1779150787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YFO4d3KKfbsFkrq+A20d24Xfl/9uhV3LI/OXh0Z5sZ0=;
        b=jgK791RObDRmumxcZiLTBqh2CmCfQBISuMiqriNiOjmhVBvk+IrWLvullczp4ISIpq
         FtAbmhq+yxOKVkmKGWBDAm3T6/a4aB6aCOL+WMaKlyFRp7p4oApH6UEyGwfq7mTPtlTw
         PhfnablTYu5exdB1cY/uRle6yg4t1g3nRr13qjECby7J54VpQWKCC/UE506sZsLW5242
         Xgi3BQbJGPJwHhJB+kXYICkTFRJPObvLrFb/TiP7cRXW3ykh3AfaJitt+BmsLCPaOisJ
         mbKj8sojGaOmWFYmeF4Ny3HuSEMc3/Av3aCIIjq7mDszqPtzfJLzP0n1ut/FelSzjWko
         2mVA==
X-Forwarded-Encrypted: i=1; AFNElJ9w2QuwB5dAywhQg4E10tv4bUQxFcVKQejrtskK1jJ8LdfKWvOK8QW7AyTD1Jp1+E96UxZfA1fZMAPCZq++@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0qcWt9z2kUnSNpDIy+FBX5mweEmtWU7itJ+qGmfG2Oaqo5u3B
	K0JJoZSl1J3FcIgiPAp5iAc8n2j9rGoUun9BTWxzNpkDgpp5xUrINyRV
X-Gm-Gg: Acq92OGvdzLS5v6gb+p2yfLVSC+nR69sUlNxqhOReTpXhPaFGNYAvzPQf5X0n2A0Ucy
	C0DcZjQHRX5H2r02E3/iSIts/diOXtcxaVLbooHMj4OhSQkQIDQQzeg0T9dlhznTHMVLn23Z/FS
	kB+aAUIhJAiwTy/7iqwo4NFsk0wuM//S/NT6wC/JiTXc7zBLkkzvP7kLKvkNi/cd+ee0+i72t+A
	2nSmRJyq2TvNo0KvFOrs34JGedgsVzGCT4BFNbbIqVCHIJcZ58OFBsnCKiuofcdEir94xNRjU3n
	ni/8T3cp6WwQCkNrDcFRthxD93PdeRATeDf/4wMwqbipLbasYJWyuZlsGoO3fX6z+sOue6//Kgn
	uFhJaNhKnnOlgmHvxxdV28rNcuZ0r3dso2UaOElCBKCqDdPVXoWZlJirnIT5nt4nVUEMYvmmlXB
	j6FZhTPrU8OOc3f5Qp6pD0eg8zIm3iYukM1v84wSzS1yYe+Wo8wH8Z5Wxb6KGMtwKmaxtnlAtWC
	3yBxQCbk/o46+KrSrHMprxpotnOI3Yjt8t0JWwlsFSnKlZQv3CPIKOJxKWvGn4mwxUtprc29tVS
	WrWfVL+jALmml88=
X-Received: by 2002:a05:690e:b8a:b0:65c:47ad:26c1 with SMTP id 956f58d0204a3-65de128608emr736702d50.46.1778545986903;
        Mon, 11 May 2026 17:33:06 -0700 (PDT)
Received: from noahzen.tailef97f4.ts.net (host-119-66.flgaliv.gainesville.fl.us.clients.pavlovmedia.net. [153.33.119.66])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65de4aec812sm39439d50.7.2026.05.11.17.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 17:33:06 -0700 (PDT)
From: Noah Techoueyres <noahtechoueyres@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: nikolayof23@gmail.com,
	linux-kernel@vger.kernel.org,
	Noah Techoueyres <noahtechoueyres@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: fix line length checks in rtw_cmd.c
Date: Mon, 11 May 2026 20:31:15 -0400
Message-ID: <20260512003115.5570-1-noahtechoueyres@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix both block comments and assignment statements that exceed the
100-column limit to follow Linux guidelines for readability. Used
intermediate pointers to fix assignment statements.

Signed-off-by: Noah Techoueyres <noahtechoueyres@gmail.com>
---
 Changes in v2:
 - Replaced repeated struct access paths with an intermediate 
   pointer to traffic_stat to resolve the 100-column limit.

 drivers/staging/rtl8723bs/core/rtw_cmd.c | 38 ++++++++++++++----------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index c1185c25ed36..5c6999ac17f6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1106,24 +1106,25 @@ static void collect_traffic_statistics(struct adapter *padapter)
 {
 	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(padapter);
 
+	struct rtw_traffic_statistics *stat = &pdvobjpriv->traffic_stat;
+
 	/*  Tx */
-	pdvobjpriv->traffic_stat.tx_bytes = padapter->xmitpriv.tx_bytes;
-	pdvobjpriv->traffic_stat.tx_pkts = padapter->xmitpriv.tx_pkts;
-	pdvobjpriv->traffic_stat.tx_drop = padapter->xmitpriv.tx_drop;
+	stat->tx_bytes = padapter->xmitpriv.tx_bytes;
+	stat->tx_pkts = padapter->xmitpriv.tx_pkts;
+	stat->tx_drop = padapter->xmitpriv.tx_drop;
 
 	/*  Rx */
-	pdvobjpriv->traffic_stat.rx_bytes = padapter->recvpriv.rx_bytes;
-	pdvobjpriv->traffic_stat.rx_pkts = padapter->recvpriv.rx_pkts;
-	pdvobjpriv->traffic_stat.rx_drop = padapter->recvpriv.rx_drop;
+	stat->rx_bytes = padapter->recvpriv.rx_bytes;
+	stat->rx_pkts = padapter->recvpriv.rx_pkts;
+	stat->rx_drop = padapter->recvpriv.rx_drop;
 
 	/*  Calculate throughput in last interval */
-	pdvobjpriv->traffic_stat.cur_tx_bytes = pdvobjpriv->traffic_stat.tx_bytes - pdvobjpriv->traffic_stat.last_tx_bytes;
-	pdvobjpriv->traffic_stat.cur_rx_bytes = pdvobjpriv->traffic_stat.rx_bytes - pdvobjpriv->traffic_stat.last_rx_bytes;
-	pdvobjpriv->traffic_stat.last_tx_bytes = pdvobjpriv->traffic_stat.tx_bytes;
-	pdvobjpriv->traffic_stat.last_rx_bytes = pdvobjpriv->traffic_stat.rx_bytes;
-
-	pdvobjpriv->traffic_stat.cur_tx_tp = (u32)(pdvobjpriv->traffic_stat.cur_tx_bytes * 8 / 2 / 1024 / 1024);
-	pdvobjpriv->traffic_stat.cur_rx_tp = (u32)(pdvobjpriv->traffic_stat.cur_rx_bytes * 8 / 2 / 1024 / 1024);
+	stat->cur_tx_bytes = stat->tx_bytes - stat->last_tx_bytes;
+	stat->cur_rx_bytes = stat->rx_bytes - stat->last_rx_bytes;
+	stat->last_tx_bytes = stat->tx_bytes;
+	stat->last_rx_bytes = stat->rx_bytes;
+	stat->cur_tx_tp = (u32)(stat->cur_tx_bytes * 8 / 2 / 1024 / 1024);
+	stat->cur_rx_tp = (u32)(stat->cur_rx_bytes * 8 / 2 / 1024 / 1024);
 }
 
 bool traffic_status_watchdog(struct adapter *padapter, bool from_timer)
@@ -1743,7 +1744,11 @@ u8 rtw_drvextra_cmd_hdl(struct adapter *padapter, unsigned char *pbuf)
 	pdrvextra_cmd = (struct drvextra_cmd_parm *)pbuf;
 
 	switch (pdrvextra_cmd->ec_id) {
-	case DYNAMIC_CHK_WK_CID:/* only  primary padapter go to this cmd, but execute dynamic_chk_wk_hdl() for two interfaces */
+	case DYNAMIC_CHK_WK_CID:
+		/*
+		 * only primary padapter go to this cmd, but execute
+		 * dynamic_chk_wk_hdl() for two interfaces
+		 */
 		dynamic_chk_wk_hdl(padapter);
 		break;
 	case POWER_SAVING_CTRL_WK_CID:
@@ -1881,7 +1886,10 @@ void rtw_createbss_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
 		_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
 
 		spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
-		/*  we will set _FW_LINKED when there is one more sat to join us (rtw_stassoc_event_callback) */
+		/*
+		 * we will set _FW_LINKED when there is one more sta
+		 * to join us (rtw_stassoc_event_callback)
+		 */
 	}
 
 createbss_cmd_fail:
-- 
2.53.0

