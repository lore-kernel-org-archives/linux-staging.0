Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECDC4EB51
	for <linux-staging@lists.linux.dev>; Wed, 15 May 2024 04:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715748767; cv=none; b=MMGSgCAp4gcnowPJAItXxo9dopS5tqbwlmbb9ezBdz35pdixW0suLbv7QguzRkM4q/PWg8KxSAh8ui1ypTPP81SMpykIV+ptLjG93ZVWYK00VSF4vy0grQZf94ZKr2P4EEzLmuAWLrJ9JVjKa7boBY28pa6ugIjZ+28zOMexvys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715748767; c=relaxed/simple;
	bh=ew7QTjnBQLH0PTpIA8W7zoW+lQRRUkKEJUaHs9Sl+38=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VG1UFpEon1MQcDTtpelfCzUpB8LUxdUNBOGeOSPghWLZpMcnn4DFsH/z+Mr3XyGeyr1Oi4O2KXqaFDdQkWGSBHt1ufchwCFtFYFbsxgNH/CQH9TGhpxsGmoPZRyvb6D96g9qYsJ3nZ5c4JKKV7+O9vJM42iMx3b4GJilgqH1eAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=bMY5EymC; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="bMY5EymC"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6f4ed9dc7beso2626615b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 14 May 2024 21:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1715748766; x=1716353566; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DEx6vAr52pGxysjGe3jw5iXqLZA63B3Rf1CnGustKUE=;
        b=bMY5EymCJ5GbuuD8x75NaHyxL8mF5EAhZ8PBbEwvPtpGLT1xgwApK+rqwV9dZ3mXkV
         nWBm4hptY5si4x45uIdRiselfOLgSWERbMrNBPxhUQuoWDNZ6phWEw+PpbmxLPkJjATb
         ouCFQw4g2jGN6Ypn+/dVYV9bX8rli551cEbHzMBUwN9fwq6qijlngJNgu2KBK7ReZhBi
         gPtWrFnO2JuFhZINCke0qGCPcahmwHNHB1/zgfJIiQIfMIOfcglHL77zrq+4a9XblJPp
         TqeF1LdmX4O73ZtcIpipwP8IOZHeeR1HHdEt3Tdxhw87cg4iUOKI89GuUqvOtgpi5XB5
         M9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715748766; x=1716353566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DEx6vAr52pGxysjGe3jw5iXqLZA63B3Rf1CnGustKUE=;
        b=TKO4NC/138lLuWcRKqX5NSmlDTlx3oUQR6QFgMMzcSzVYNw9fsbnlu70Ay6I5PAkLb
         +eWke9ooSd5H6sU7aYN0sfgqgOMbb/uzL8WuksaQxebFDxX0SKF1ZwByKJHRcycVFAuY
         XEnYayrTRtCDHJbNKoXJgYj6AXaNupyPkdPjtUgq3AovKnc6AA3TL8895D2XZraLDaHm
         NrJ2EqNLrTXPI7aZMuoP9aJ/y/hBSv5R6eusaiOECkzywXBDhp3ZBZYYtx/KaGRvOyLI
         ay+oIh4t1v9uSdgpU8dGrN8WQXYizwgiO/JQDlsSTBjwsXJC3ps+iTvbPB11J8DYzkKt
         BvVg==
X-Gm-Message-State: AOJu0YwouA5OGm5qNH21Lv5FfZvcBJqU8IuTH7XM107B6pydNWrsarb2
	b1oRQQEnmqEJ4ZgvVUvf8ar7i8apRqPzkmyQWeqyUuCAetSBQF3iQH5u4Zc8skg=
X-Google-Smtp-Source: AGHT+IEU3v7pENlKhFG6PdHM+Xs0TQ2WLZQ8Zb7U6UcQlLVQL8MHf7S6XzWlBzqSwaDRgqPpu67fmg==
X-Received: by 2002:a05:6a00:4613:b0:6ed:41f4:1886 with SMTP id d2e1a72fcca58-6f4df3db383mr25644408b3a.8.1715748765879;
        Tue, 14 May 2024 21:52:45 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a827fdsm10135035b3a.60.2024.05.14.21.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 21:52:45 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 16/31] Staging: rtl8192e: Rename variable pList
Date: Tue, 14 May 2024 21:52:13 -0700
Message-Id: <20240515045228.35928-17-tdavies@darkphysics.net>
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

Rename variable pList to plist
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 30bd6f49e915..fb679229f173 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -406,24 +406,24 @@ static int is_duplicate_packet(struct rtllib_device *ieee,
 static bool add_reorder_entry(struct rx_ts_record *ts,
 			    struct rx_reorder_entry *pReorderEntry)
 {
-	struct list_head *pList = &ts->rx_pending_pkt_list;
+	struct list_head *plist = &ts->rx_pending_pkt_list;
 
-	while (pList->next != &ts->rx_pending_pkt_list) {
+	while (plist->next != &ts->rx_pending_pkt_list) {
 		if (SN_LESS(pReorderEntry->SeqNum, ((struct rx_reorder_entry *)
-		    list_entry(pList->next, struct rx_reorder_entry,
+		    list_entry(plist->next, struct rx_reorder_entry,
 		    list))->SeqNum))
-			pList = pList->next;
+			plist = plist->next;
 		else if (SN_EQUAL(pReorderEntry->SeqNum,
-			((struct rx_reorder_entry *)list_entry(pList->next,
+			((struct rx_reorder_entry *)list_entry(plist->next,
 			struct rx_reorder_entry, list))->SeqNum))
 			return false;
 		else
 			break;
 	}
-	pReorderEntry->list.next = pList->next;
+	pReorderEntry->list.next = plist->next;
 	pReorderEntry->list.next->prev = &pReorderEntry->list;
-	pReorderEntry->list.prev = pList;
-	pList->next = &pReorderEntry->list;
+	pReorderEntry->list.prev = plist;
+	plist->next = &pReorderEntry->list;
 
 	return true;
 }
-- 
2.30.2

