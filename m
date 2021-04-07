Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBE46D12
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 13:50:13 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id x7so18066441wrw.10
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 06:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RqqLF1GJsQMO/eytwPHha/cMyoAyrXTCJ6Ep4n3zmME=;
        b=UyKdroCrwU1Cr8JPmkmqbk04vYVz+bUEl9mU27Ht5TwwIKArioIGoslH1vvkAR91dr
         t8pvsecs2EMAWvRRd4zSiza5LkWUCTuEaPdtlpjUZnLqsj3Mq3UBG4Xwc8IY6Sf7PDTs
         YIGSOTduW04xt4xcp037IouTim9TuN/VWMXPOspb8WDn+gfmg0AThSXcAJWmaRyo/9os
         d+x6Y+C6MHUXBiHbGjDtHBJXWo3pP9I1iXazAFEbkUgB9tM4WaolgyCB1fVinwu0KsKM
         6XtKeCOFQ93PGthl137i3DqUI4cGc34BA9ijlGR3Bp7EkbUvXV1AkJB0y84bCzRGd4w2
         MAHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RqqLF1GJsQMO/eytwPHha/cMyoAyrXTCJ6Ep4n3zmME=;
        b=doIwThZn4uVeapDtBdlK3g8BbEPDSs0yQhlceGt2/H8tT0tlQUgeoxWyBSYi8MVyDc
         x1m1c5KS/7NdoK6ZHly+XM7oXcpBnMlMq0DbHhA4/GaRKW+RDMeIIHa70crAJYY1AeOj
         DI3KLXHpilcHC/5DKHs++Z+kiQLoyPSmmVlkzkgNcu8VWvp7Pz559umPSXMUqbsOSk1f
         oLRbcy/BRKyC189xeJ1jUs5GjKn3sUQa4k5Uyerx4gfemsG8MxJAa7oVM6WdE/Io8mF1
         1hUyzAW5vyN0k7vzorK4KjLJ78IGczk5Wp/IPfUVkXWFb67yrFkcjnh2CUgQXJmD8uuw
         AXVA==
X-Gm-Message-State: AOAM5318scpgbqGD7Kz7TDk4wNlq7X0bHNsL8bEQoz08qdfqT3GJYHi0
	4zaj7Uk22vlxhaRJdD79XLA=
X-Google-Smtp-Source: ABdhPJznsgOeSX63dQTVBm76RhPTVwGGdz8/udQlGn9K1yDaem+fAAnzFErxLj3QBk4+ySfU4J3/6A==
X-Received: by 2002:a5d:6b86:: with SMTP id n6mr4489592wrx.52.1617803411788;
        Wed, 07 Apr 2021 06:50:11 -0700 (PDT)
Received: from agape ([5.171.81.68])
        by smtp.gmail.com with ESMTPSA id w7sm15188540wrt.15.2021.04.07.06.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 06:50:11 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 10/19] staging: rtl8723bs: remove empty tracing function dump_rx_packet
Date: Wed,  7 Apr 2021 15:49:34 +0200
Message-Id: <281afbaecdb9614c91e648b3a6fc2738a176e57a.1617802415.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617802415.git.fabioaiuto83@gmail.com>
References: <cover.1617802415.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove tracing function dump_rx_packet after DBG_871X removal.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 2d1201b70ab1..cd76fe2afcd0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1452,10 +1452,6 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
 
 }
 
-static inline void dump_rx_packet(u8 *ptr)
-{
-}
-
 static signed int validate_recv_frame(struct adapter *adapter, union recv_frame *precv_frame)
 {
 	/* shall check frame subtype, to / from ds, da, bssid */
@@ -1492,12 +1488,6 @@ static signed int validate_recv_frame(struct adapter *adapter, union recv_frame
 	pattrib->privacy = GetPrivacy(ptr);
 	pattrib->order = GetOrder(ptr);
 	rtw_hal_get_def_var(adapter, HAL_DEF_DBG_DUMP_RXPKT, &(bDumpRxPkt));
-	if (bDumpRxPkt == 1) /* dump all rx packets */
-		dump_rx_packet(ptr);
-	else if ((bDumpRxPkt == 2) && (type == WIFI_MGT_TYPE))
-		dump_rx_packet(ptr);
-	else if ((bDumpRxPkt == 3) && (type == WIFI_DATA_TYPE))
-		dump_rx_packet(ptr);
 
 	switch (type) {
 	case WIFI_MGT_TYPE: /* mgnt */
@@ -1529,8 +1519,6 @@ static signed int validate_recv_frame(struct adapter *adapter, union recv_frame
 			/*  get ether_type */
 			memcpy(&eth_type, ptr + pattrib->hdrlen + pattrib->iv_len + LLC_HEADER_SIZE, 2);
 			eth_type = ntohs((unsigned short) eth_type);
-			if ((bDumpRxPkt == 4) && (eth_type == 0x888e))
-				dump_rx_packet(ptr);
 #endif
 		}
 		break;
-- 
2.20.1

