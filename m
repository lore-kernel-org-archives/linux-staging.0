Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BADB6CDAC
	for <linux-staging@lists.linux.dev>; Wed, 15 May 2024 04:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715748777; cv=none; b=Nt4NUDkxJD5Id9tx9cZviQ55a89Lko2Plr8qB877Qmiy/dOt3AqJHGGIWgpkcLRSmNy6S9eRM8u6Lx4Vyk8Bpzq4shHk2vTdO0wKTzSM/5g7cK0s2GGhQ7BxxFi7vGWzIhFtfJB93VU/e8EOfF7OONSZshim/HsSA3qoogckc/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715748777; c=relaxed/simple;
	bh=YgfIGaWfPXM0A521V0pgfcIQ1IktpJGFCjIqpUA6O9k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u9z0VR8sjT5h8q8zsWP8nNBNi5YtMguJfOY0NRYCkDyVGoduyPjDQ5bmwYsj3QwlDpRSLxvBuZ2g0MrYqXXLwGXsFVOydSTZbGIimEFM3CWp84We5b2kLJJVO7bWXARR35jB8g4xmZ7pFb40xvEyz6GlgoYebwXnwWwKpeJ/E3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=T0zQJ4a/; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="T0zQJ4a/"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-23ee34c33ceso3978408fac.3
        for <linux-staging@lists.linux.dev>; Tue, 14 May 2024 21:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1715748775; x=1716353575; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kBPmuk5VXOM/W5GBJsDLvPQlcshMIMkziBMZPCVoQM=;
        b=T0zQJ4a//8GueKNVPSn5cxXKkpRn08f2uEVKzKQxuFYB5edrTnBBNQrT8h3t7N3z7J
         ZYHHiLqM3GI1lFoiqhA3cDzo9NtaLJvuCprAsGlTbL4BxOgP4MgJn3ADoXxtZiyPc8WO
         pSB3Ykmfnt9UJIcmlmwMtW+wAF9d3cbOMhpPcYYwrqYD8i3Y3OxKz6o4/WGLYnZc45oX
         V+ZOxypVeKcYYoAavjwh1A2+ZPYwlg1u8ZyKJiQAzzc9j1AqY95oWS7q0FDlLzra0E0q
         F4bNyQbp4PNKIoQzZU3idZErGLVoBYtId2kvMxOKxbzFBo4zRGeWlGiQ8n3OqcDuMdoI
         7PzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715748775; x=1716353575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+kBPmuk5VXOM/W5GBJsDLvPQlcshMIMkziBMZPCVoQM=;
        b=Gq0Xrnip0VurSIl9x4F4vvIhsEX6d+Jk/YTkSACpG4pd8x/F/DFZI+oojx7wuKGaTk
         eHG3EAJwL4HBAJGR/BddedtByqNEcqlVvd7sbhAY0xZ24PASyIU9tofkF3FT3P6LBWq1
         +J1bQwLc1hviUjbAZaGyQim3UcXHUBjlGs7zN+lbDfQZOOmilqWanoUecQgyJdMd+k7W
         k01r+hQF31ZB33g6InzduP4MqOsoMXswIgC1/e6VDeXD7s4CNvTcWV+E5e3/ekREihf+
         xgbx1ttPl8569HVOeFMRiUlIHrzrwzwYVltkB882UoA+xFzTJ1ib0SYyQ7Q/c0Q0QfsC
         6l4Q==
X-Gm-Message-State: AOJu0YxNZuSdULDnnitcv+tdHD21KsrYA2641m0wRoajO4i4R3uRaRKy
	6FzqH8qxxad5a39Od8oCzg6/MXROPuPFgjUzR0fNd2It67iFA58M+yB6tUtgD+g=
X-Google-Smtp-Source: AGHT+IFjnKIl12vhw4j9yAI+y7qOnxO/arAw+X/M7hef+jV5XKvPa227ibTby/D3/41vipY7aIT7aQ==
X-Received: by 2002:a05:6871:713:b0:244:bf6e:c94d with SMTP id 586e51a60fabf-244bf6ee995mr12183746fac.11.1715748774724;
        Tue, 14 May 2024 21:52:54 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a827fdsm10135035b3a.60.2024.05.14.21.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 21:52:54 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 29/31] Staging: rtl8192e: Rename variable RfdCnt
Date: Tue, 14 May 2024 21:52:26 -0700
Message-Id: <20240515045228.35928-30-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240515045228.35928-1-tdavies@darkphysics.net>
References: <20240515045228.35928-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable RfdCnt to rfd_cnt
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 976e8b4da1d4..89dcbead5e11 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -491,13 +491,13 @@ void rtllib_flush_rx_ts_pending_pkts(struct rtllib_device *ieee,
 				     struct rx_ts_record *ts)
 {
 	struct rx_reorder_entry *pRxReorderEntry;
-	u8 RfdCnt = 0;
+	u8 rfd_cnt = 0;
 
 	del_timer_sync(&ts->rx_pkt_pending_timer);
 	while (!list_empty(&ts->rx_pending_pkt_list)) {
-		if (RfdCnt >= REORDER_WIN_SIZE) {
+		if (rfd_cnt >= REORDER_WIN_SIZE) {
 			netdev_info(ieee->dev,
-				    "-------------->%s() error! RfdCnt >= REORDER_WIN_SIZE\n",
+				    "-------------->%s() error! rfd_cnt >= REORDER_WIN_SIZE\n",
 				    __func__);
 			break;
 		}
@@ -509,13 +509,13 @@ void rtllib_flush_rx_ts_pending_pkts(struct rtllib_device *ieee,
 			   pRxReorderEntry->SeqNum);
 		list_del_init(&pRxReorderEntry->list);
 
-		ieee->rfd_array[RfdCnt] = pRxReorderEntry->prxb;
+		ieee->rfd_array[rfd_cnt] = pRxReorderEntry->prxb;
 
-		RfdCnt = RfdCnt + 1;
+		rfd_cnt = rfd_cnt + 1;
 		list_add_tail(&pRxReorderEntry->list,
 			      &ieee->RxReorder_Unused_List);
 	}
-	rtllib_indicate_packets(ieee, ieee->rfd_array, RfdCnt);
+	rtllib_indicate_packets(ieee, ieee->rfd_array, rfd_cnt);
 
 	ts->rx_indicate_seq = 0xffff;
 }
-- 
2.30.2

