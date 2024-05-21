Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981A36A33E
	for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 03:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716261456; cv=none; b=VUnq3ayUg5QDxThe9JjvumdvguEWPYZuVsQur8v3t3NoEBCh5HeMYOVBGDH8byc26+kxOG1g1TlvwFdJMYd5AtQL0xsUNGig5cmqWK97N0br4c88GjojrgSjZt+OLsDPSfoMp+W30kA4bEItWpTo+8xUjfJU6jW/qLp1dQEZze4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716261456; c=relaxed/simple;
	bh=iv5vtIT0B8sEKOqWsGuNVC0aO5c9WspHnf3XLIvStwg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y1GEXr86Mheu1chGYmAeSOo3JhrkGFiHmnkUzN8kWpw2KFfG9HTSZ+nHXJ/ZXjztU+nOCiy//uYs6pl1GYeZri8jCqF8vG6j6Qf266n+TR9FFqkx1gKRpTiPXZiCCKx2/TUW3xzhLTyLh9QuDvisKaNIU2ScLwBEIvlJb0tI2Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=ZyL73BTR; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="ZyL73BTR"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1ec92e355bfso107912575ad.3
        for <linux-staging@lists.linux.dev>; Mon, 20 May 2024 20:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1716261454; x=1716866254; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EnnNiGWOZDyrhURhTHUizVWuJYzYU9zmKFPIjPvFtcQ=;
        b=ZyL73BTRFBu11tGNTzl94gooIXpztOaaPGpOZT8LP6KGV0XBtaxm5B2Y3bYnG/qzIF
         6lcBuDMf8T8O/+ryEQXbwV8mvyqAwB9hkpN3IVbYYGwaeJC+2plO81MWvkzuZCMw7jJb
         SpIbpj6OjSV3syHBWjsqwNLlJnHqCNP0lIG004CS7GrEHSDy/5SKfW8laOWxxdq/QH7e
         841CWkRJ3l4bq5H+w6G8vpZEuD9AExMum7sRRYDsbB8WOrqyV4u098zRktSn7Pc0+bwl
         Z+0o19sFWqpcFAmvX4dBddCmljeefZiMaY6HJFagVncSieU67EvrXFkE5K/BLBhqYQ4w
         FBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716261454; x=1716866254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EnnNiGWOZDyrhURhTHUizVWuJYzYU9zmKFPIjPvFtcQ=;
        b=jg916XMd0poQBM+19iN1HLYQILeIujwu6sPn1jPa8LcBbQC2XednvyoVYwFFyz8CCN
         RgrLSV04b8LAe5U9J9Df57gb7fc9K8PFcAbzmnt+q/grRKkvmWYomEbSCzOfzI7mRLX+
         gScwC+PCykDdn0U5th0gF0UGxQGLL8R3hBV3XlccUO+zm8DX8S9YxnavKN5HVKq7tW3H
         OC6qcWLoGwWXHRZGhEDASGPHN6zlVG6jk7HIq8yddXfj3tPAeU2fHA+5zqPA+AvxeIwx
         UI46TPT2IDY/OurW/8rxNhSDU+2saiv5b7SvZrUsJMukcpvKkmeXtJB0DHgUJXHRuGAk
         IGnQ==
X-Forwarded-Encrypted: i=1; AJvYcCV14g9jgLEC2cGR/AKQMupK6VvIX1ECnEMCmqtCEVuFGaZWyTFR5vwb8AoEdHroub+Toa5N5iUX8h59JPa/+RHGN/Mz9g9U7hW0uKZqAw==
X-Gm-Message-State: AOJu0Yzvm2bfk5Yq2qGs/uJ/I5hqqML4ejk/X5J7GS5OMeZfjM4bzSxI
	JTK2ds/ZClYnRKUqLh72wbZKTb9kJQyzjgYZyWlbMrjFX8wNyphZKxwq9xpL3nxJ6WfQKzmpd1X
	Y
X-Google-Smtp-Source: AGHT+IFNOmj7w6LmZdeRnpTuqNZeDgFn5eoz7xWciHwLByvAWVY21M/4Ib9p5iHD9xbeAMtT/1Mk+w==
X-Received: by 2002:a17:902:8308:b0:1eb:3d68:fc2d with SMTP id d9443c01a7336-1ef43e25fabmr305373295ad.34.1716261454070;
        Mon, 20 May 2024 20:17:34 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf31a93sm214885415ad.134.2024.05.20.20.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 20:17:33 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 16/31] Staging: rtl8192e: Rename variable pList
Date: Mon, 20 May 2024 20:17:03 -0700
Message-Id: <20240521031718.17852-17-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240521031718.17852-1-tdavies@darkphysics.net>
References: <20240521031718.17852-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable pList to list
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: Rename plist to list
 drivers/staging/rtl8192e/rtllib_rx.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 30bd6f49e915..b1cb73c2177d 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -406,24 +406,24 @@ static int is_duplicate_packet(struct rtllib_device *ieee,
 static bool add_reorder_entry(struct rx_ts_record *ts,
 			    struct rx_reorder_entry *pReorderEntry)
 {
-	struct list_head *pList = &ts->rx_pending_pkt_list;
+	struct list_head *list = &ts->rx_pending_pkt_list;
 
-	while (pList->next != &ts->rx_pending_pkt_list) {
+	while (list->next != &ts->rx_pending_pkt_list) {
 		if (SN_LESS(pReorderEntry->SeqNum, ((struct rx_reorder_entry *)
-		    list_entry(pList->next, struct rx_reorder_entry,
+		    list_entry(list->next, struct rx_reorder_entry,
 		    list))->SeqNum))
-			pList = pList->next;
+			list = list->next;
 		else if (SN_EQUAL(pReorderEntry->SeqNum,
-			((struct rx_reorder_entry *)list_entry(pList->next,
+			((struct rx_reorder_entry *)list_entry(list->next,
 			struct rx_reorder_entry, list))->SeqNum))
 			return false;
 		else
 			break;
 	}
-	pReorderEntry->list.next = pList->next;
+	pReorderEntry->list.next = list->next;
 	pReorderEntry->list.next->prev = &pReorderEntry->list;
-	pReorderEntry->list.prev = pList;
-	pList->next = &pReorderEntry->list;
+	pReorderEntry->list.prev = list;
+	list->next = &pReorderEntry->list;
 
 	return true;
 }
-- 
2.30.2

