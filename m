Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BA417F6
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 05:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717998549; cv=none; b=gZ/NvEpHf3QLOs0lc/AuD2jyOO2KwDQTJsziwSV2DvtL3VAAInpG59iyUwPtDFTJKa+z+81M49BCdR2VDJKN/MYL6dylHbSt2Z95ZMcRpE9OOVvUMwerAoTOskpsf4lbHTTaZlauLo01Xsuc0HrPlRReUe2NxZDdSkrACpXIoh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717998549; c=relaxed/simple;
	bh=j5sUN1aL3OBeYbItnTAjl4bBUfZj6kaqB01gKK2uoII=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Pih98+ajtxfY0TGG/xvrjpP8LEMB0ZlPSkIpsuy/+gU5RKQz0+gW+Ko4rTs56KjtHBxye8jNWGrtgfMCzMFN052j3mXraCEe+UIrLVHD/qdhkeieRCp1XW57Xppbsr0mv4rqQA3wHzkwcrJSM3Fjdxhi5LG3pEPyS7RghofKwH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=SVE5Hqoy; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="SVE5Hqoy"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1f70fdc9644so4721885ad.0
        for <linux-staging@lists.linux.dev>; Sun, 09 Jun 2024 22:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1717998546; x=1718603346; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X1OIzPcNHoMj27qXrNDJ7NyztzvXdws07L3n32VSMeE=;
        b=SVE5Hqoy9IbuhIadfhQNVY5tQ1Yo153PxHQF+mTXOBH3p3uhmeDW/HQnB52dzNok3S
         t6LSTnthzB03ywn04rbpGe1AUSh7AebXLk13OHxxsLQ4ms4xATgz4o1JSz1jazbweou4
         sO7Xnran8oiDcgVn1HW4KozL88LK8f75L6fT/RyY1NqOiDJDX8yPCQSwboNlIfdZZKlH
         uy21snx8C2cVNMk86KYK1v+95jtYnGJIMppPFb6Z75e7mguyHbhN4FZtWCXjGMrLWrDs
         oC1MP7p9p15I/zUzsRwaFPIkTegGKT2COMEzCAK5jl4j7UZW5ovaF0ldKlz7jlEocp4k
         SI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717998546; x=1718603346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X1OIzPcNHoMj27qXrNDJ7NyztzvXdws07L3n32VSMeE=;
        b=lbKKvdxuYd3l4X3pOKMq29g07+Mw96cK1nMM25SNFf/kWSaJ4R9JKeT21/MxytOYRd
         GJCktfAtyoIaPuRNW2EUkGlCZgeC9njQDSVBY33QxDKZWcRlawQSrZ9EYXVkvmmWaDqx
         YagltRSV5v1Ka6ZHieaX8a3hYB2awujiWIukcqur6ogIJkXuQBdNZwWTA9K1rLNfSWiw
         6Ecf32KRODvHH3WmJ7CZ6FFUeDgqqcMouodPm4m6d0iPTV5wOA/AhSah7VLJ0k2z2SGt
         ev/J0FUAAIKwjdetLhGhVgMoRWAX8pbp+BWDKx9kF8meKICjIo9l/fTVhl61ExJcjAHT
         SgIA==
X-Gm-Message-State: AOJu0Yyb1cA+EaUh1xQ6Ewvv5dJ+a5Ki9E3ahj7ZbjG1Qgln45aDX5a3
	wxDlmv4sSwrswaMq0dEH8A8a2D4Gh5iwtep8ypyFOPfHGGfwSVmlFiELQI2Wv8I=
X-Google-Smtp-Source: AGHT+IFEG6Vc2pZMR0CEERoCvANcsBrGEThmGVpHXLETRQpKr89UfPavThye3WGmwB/7QCurxsEMpw==
X-Received: by 2002:a17:902:dac7:b0:1f6:f0be:4099 with SMTP id d9443c01a7336-1f6f0be4437mr72198835ad.11.1717998546633;
        Sun, 09 Jun 2024 22:49:06 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6f1aced64sm35653725ad.9.2024.06.09.22.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 22:49:06 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 12/24] Staging: rtl8192e: Rename variable CntAfterLink
Date: Sun,  9 Jun 2024 22:44:37 -0700
Message-Id: <20240610054449.71316-13-tdavies@darkphysics.net>
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

Rename variable CntAfterLink to cnt_after_link
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 6 +++---
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c   | 2 +-
 drivers/staging/rtl8192e/rtllib.h            | 2 +-
 drivers/staging/rtl8192e/rtllib_tx.c         | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 08d057ab8f74..9eeae01dc98d 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -951,10 +951,10 @@ static void _rtl92e_watchdog_wq_cb(void *data)
 		return;
 
 	if (priv->rtllib->link_state >= MAC80211_LINKED) {
-		if (priv->rtllib->CntAfterLink < 2)
-			priv->rtllib->CntAfterLink++;
+		if (priv->rtllib->cnt_after_link < 2)
+			priv->rtllib->cnt_after_link++;
 	} else {
-		priv->rtllib->CntAfterLink = 0;
+		priv->rtllib->cnt_after_link = 0;
 	}
 
 	rtl92e_dm_watchdog(dev);
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index d131ef525f46..c21a0560410a 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -241,7 +241,7 @@ static int _rtl92e_wx_set_scan(struct net_device *dev,
 		    (ieee->link_state <= RTLLIB_ASSOCIATING_AUTHENTICATED))
 			return 0;
 		if ((priv->rtllib->link_state == MAC80211_LINKED) &&
-		    (priv->rtllib->CntAfterLink < 2))
+		    (priv->rtllib->cnt_after_link < 2))
 			return 0;
 	}
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 4bd7a85e2411..4abd01ff3d21 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1168,7 +1168,7 @@ struct rtllib_device {
 	bool disable_mgnt_queue;
 
 	unsigned long status;
-	u8	CntAfterLink;
+	u8	cnt_after_link;
 
 	enum rt_op_mode op_mode;
 
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 0c58b70ae03f..bb8ffedaf9f3 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -280,7 +280,7 @@ static void rtllib_tx_query_agg_cap(struct rtllib_device *ieee,
 	if (is_multicast_ether_addr(hdr->addr1))
 		return;
 
-	if (tcb_desc->bdhcp || ieee->CntAfterLink < 2)
+	if (tcb_desc->bdhcp || ieee->cnt_after_link < 2)
 		return;
 
 	if (ht_info->iot_action & HT_IOT_ACT_TX_NO_AGGREGATION)
-- 
2.30.2

