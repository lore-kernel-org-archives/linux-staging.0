Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1564E6BFA5
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 05:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717998551; cv=none; b=iFzGMG7Dk4DrKj6iE5Bjtba0C4u3b32uMq8e9OwHQ5zYQYlOPKHql47EUqOzRJUJSbjIguTnR2SuaJEhp40bPf5eX3CmbC93J9XGJmX/IJO16KtoC8KrOOB78bx8PrXMaC5pEXIx7Ynq7TbV0o/X5W3oTJrOxd6bBAn4aYy4daI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717998551; c=relaxed/simple;
	bh=jUsOBVvjpdN3rPTiiI+7juYCKgxR7k7mTfEHMy9DHGM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eG7urdUGB9HW64wexkPjOuQxwFtEvV1kTrmzO8O08a2DrClenBayir6+20WFdDpny44GTMAGF2EvCnelgfn9DnowlBQ2H0vGVMtpcnHAcnc2bP7FFJeeqPpJ/fRHgiH+Y0xJp/o4HJMaqkkMT3K381Nl25EMJDwtj8ON9vHptiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=ZUW1kIVb; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="ZUW1kIVb"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-70421e78edcso1546911b3a.3
        for <linux-staging@lists.linux.dev>; Sun, 09 Jun 2024 22:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1717998548; x=1718603348; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=og+3qSLwnDyl77cuuZuCfLwj0nCBz/c/by/cBANoQ84=;
        b=ZUW1kIVboGCsg5FuDw8d8g7LaBB9mNfjBKhZ5D7Rnm2T0bpiPx64SRKqwVl8gaDaIV
         W5BoHzGtGiagoSvXGCaUJntcGX0Wq55SvpaqNsGY44hF2MY6RbsejS22x7H+7fMA7R5K
         rw2RBfaBQ4ZeZNybBBPsZAkZt9oYF8dQjTVfyeepx8BYQCVBkV63vsYXyLaHXqUKxOfE
         aRuuA5UJ3mR5tZGDIIloTCzm6jHfCkqQ6gtXmJOUAuncH16NszBAxOwMIacbqyLwaUvf
         WymAV59OY96EXfOyRxKkC3e1DAnngjs9Ev9dRHk8QzrZ+HU4nx6kLLDmcoZonLi5NXqW
         d43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717998548; x=1718603348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=og+3qSLwnDyl77cuuZuCfLwj0nCBz/c/by/cBANoQ84=;
        b=PIZ5Tn4hr6L+1yAjVeiwjXZjCCaUtmdh7UReeKKuqrqzNkRr2tlau1Ujpce5ERCOTp
         26o6vzvKtjyy3z8p+DlDCXiqhjUOe48QWhnY+PZmzKMKQBLrsmwiGFtyYh0uNdhGJZx/
         Kc4jZJLF7k/fdVYrvbGfVqjMgdD8c7MyspcYcowYtHWxxTQD12dw9m40/M8xdl17qkXG
         dwlkanDrlswyG+YeQcpCJHVK94vAxBdiUYDochb+1E79lMhWYlZxLXJqdqOSZ3zjKOer
         +6lFs7Ns9PX/c2eK38/3izPFr4P/FRLFL1laWwvX/p1QGnNiYk3bS2ysjwDv4XTwCJDs
         mR4A==
X-Gm-Message-State: AOJu0YzHww4NJmmuH69ztM0XPwVr87ZenQCYrP2Kb1FDmEyYKdWvw3zz
	F9GByC7EgshK09g6+1sbYD6DormQxkWZ8lVZZNX+Fw9fLue/2YkI5m6JXXRW5ffO68SgFIoFXf8
	2RF8=
X-Google-Smtp-Source: AGHT+IE2CCHwa8n7OUmP/aiNwlIFB9vrHHL4L9WeXHa3QTMhQ3vs5tafZcaVre7RIyk41/e1O1jGWg==
X-Received: by 2002:a05:6a20:a124:b0:1b5:d10a:1b70 with SMTP id adf61e73a8af0-1b5d10a1f56mr5828674637.11.1717998548545;
        Sun, 09 Jun 2024 22:49:08 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6f1aced64sm35653725ad.9.2024.06.09.22.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 22:49:08 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 15/24] Staging: rtl8192e: Fix spaces/tab alignment to match open parenthesis
Date: Sun,  9 Jun 2024 22:44:40 -0700
Message-Id: <20240610054449.71316-16-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240610054449.71316-1-tdavies@darkphysics.net>
References: <20240610054449.71316-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added tabs and spaces to fix warning:
Alignment should match open parenthesis

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_tx.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 369fd26180fa..c46bd0ea061e 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -290,7 +290,7 @@ static void rtllib_tx_query_agg_cap(struct rtllib_device *ieee,
 		return;
 	if (ht_info->current_ampdu_enable) {
 		if (!rtllib_get_ts(ieee, (struct ts_common_info **)(&ts), hdr->addr1,
-			   skb->priority, TX_DIR, true)) {
+				   skb->priority, TX_DIR, true)) {
 			netdev_info(ieee->dev, "%s: can't get TS\n", __func__);
 			return;
 		}
@@ -420,7 +420,7 @@ static void rtllib_query_protectionmode(struct rtllib_device *ieee,
 			u8 ht_op_mode = ht_info->current_op_mode;
 
 			if ((ht_info->cur_bw_40mhz && (ht_op_mode == 2 ||
-						      ht_op_mode == 3)) ||
+						       ht_op_mode == 3)) ||
 			     (!ht_info->cur_bw_40mhz && ht_op_mode == 3)) {
 				tcb_desc->rts_rate = MGN_24M;
 				tcb_desc->rts_enable = true;
@@ -476,7 +476,7 @@ static u16 rtllib_query_seqnum(struct rtllib_device *ieee, struct sk_buff *skb,
 		struct tx_ts_record *ts = NULL;
 
 		if (!rtllib_get_ts(ieee, (struct ts_common_info **)(&ts), dst,
-			   skb->priority, TX_DIR, true))
+				   skb->priority, TX_DIR, true))
 			return 0;
 		seqnum = ts->tx_cur_seq;
 		ts->tx_cur_seq = (ts->tx_cur_seq + 1) % 4096;
@@ -548,8 +548,8 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 	 * creating it...
 	 */
 	if (!(ieee->softmac_features & IEEE_SOFTMAC_TX_QUEUE) ||
-	   ((!ieee->softmac_data_hard_start_xmit &&
-	   (ieee->softmac_features & IEEE_SOFTMAC_TX_QUEUE)))) {
+	    ((!ieee->softmac_data_hard_start_xmit &&
+	     (ieee->softmac_features & IEEE_SOFTMAC_TX_QUEUE)))) {
 		netdev_warn(ieee->dev, "No xmit handler.\n");
 		goto success;
 	}
-- 
2.30.2

