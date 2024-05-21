Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABD156759
	for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 03:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716261454; cv=none; b=u37+kh0+7bk6LANR7bbiuybKtHDm/l1M4CWUaPvaBP+JobMdyA9Ee3fED8pvost6C1vlZV2QbsG9plDX3zixwSeU70Hc4wA+huzglnNlJffkiMWA5rnNYGhOeghN0zO72k5z4F+mbyVkAlbPTMQkh1OtIpz3MohrkovW7nbjM6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716261454; c=relaxed/simple;
	bh=4zQZ/o4OTAP1Q63eyDdLz+A695cMhyvRSK0keQfQf1c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D9hLY3DXASqj5OGoS64EAqxoycysBgrjT0piQP34/0wotsYYeBW8PAaiS85FDrIo1IqctMlnwk541Seww5JPkFiyHVxosP4xTDWg2LinuJgFA3/YJiRHturYc8OML49qFIGS5hyb8taophwG/V6EcbOV1eY/SWjbzXQ+We+HXtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=eP5jCRbY; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="eP5jCRbY"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1ee42b97b32so95589915ad.2
        for <linux-staging@lists.linux.dev>; Mon, 20 May 2024 20:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1716261452; x=1716866252; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2NY82JNhe1Lcp3d6UGeyI0G7Bbb4dBlKnBMAKZ+t4Vw=;
        b=eP5jCRbYxHBsUXclr8cO9OFQYr07zafrtclnzgW90j4GImUaRVDw4SuFqBeQp4Z0X9
         rmz0YQ65AuW7nQkdLthFlTlRQXyYsVK5ydeHHg4jvLybm2IPDdm+plBKnKLCqVrfvIvM
         0BHKeMhRK/g7zqBlVV1dSzI2+fB6Y5ZL4V/JB3r55fB1IytpEAd420TI3GWwyTr2c3BY
         Mq/1YugYCZF5r3I5/tARzgjIsoVru3FHAvqjrA2cWM1PMq8UMB0Yk8VOqxceKWzbaDZU
         z0jIvmmx52+wd94f3i9RMA0izHiIpZogopclxtjKXR7xdHIJi5bFCwWTr7m9koRMKt1g
         qpgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716261452; x=1716866252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2NY82JNhe1Lcp3d6UGeyI0G7Bbb4dBlKnBMAKZ+t4Vw=;
        b=mXh8zKKoFtbmS98Hw7JuyBUTNM5rqYWdcm2PwIR2O03s6HOKbtVJ7qQjrrVzxODhLN
         0t+RXTD2cBix+0h6K96vVf7repivPjAwR2wGPQXsMdgL9yVFnO/opyIdT3qYMynWasHl
         heO8zL3/3d7dHfneF/qn3B4eW45PXlZjRXlNBpPOhcIWy8IAO/s6ZZOmYOYFg5LKV/ok
         QwOHJqf/l6iE5YdCrZ4FcLeD6eJO8LeOjFhivKM9a8s3PqF/22qJow0BMN3mmugmBNdq
         7CFvyO7/g2YUH4S6Vnq62Zt5c10JbBGk+1ME3e6f3NdUU8F7tuAYU2VlhSy/Eq4HI9ul
         YARg==
X-Forwarded-Encrypted: i=1; AJvYcCUAUtpnaZkM5aCYv+/l7mxoDyx7zOKjyThgrB4N2VhE0UFUx8aMjh4oUcbTaZNhvMnQKvUZAXdLPzsUfTEA4Pd3EXxsVeKjcLyWzywotg==
X-Gm-Message-State: AOJu0YyKxd152Naqf/wb4Ldf1xk+Xo48LQ5CptNyfeL7Vb46gcqJwfbS
	AFd4+q81XtrApnzyi/DIGEb3AzwpzecCI8+F63g03cb+EnrKUWsf1kpP9FNdvPw=
X-Google-Smtp-Source: AGHT+IF/KndwB5JM/Mysm9NlKwnpEQ4rYTS2YQtb2qNKae5M3qcQWbQEJeZj5ZqRLsVnNipPseSjzA==
X-Received: by 2002:a17:902:e891:b0:1f2:fc8b:ebfe with SMTP id d9443c01a7336-1f2fc8bf12cmr60440765ad.48.1716261451785;
        Mon, 20 May 2024 20:17:31 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf31a93sm214885415ad.134.2024.05.20.20.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 20:17:31 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 13/31] Staging: rtl8192e: Rename variable RfdArray
Date: Mon, 20 May 2024 20:17:00 -0700
Message-Id: <20240521031718.17852-14-tdavies@darkphysics.net>
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

Rename variable RfdArray to rfd_array
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No change.
 drivers/staging/rtl8192e/rtllib.h    | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index cdb3ebc77a53..996662a06e3f 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1407,7 +1407,7 @@ struct rtllib_device {
 	struct work_struct wx_sync_scan_wq;
 
 	union {
-		struct rtllib_rxb *RfdArray[REORDER_WIN_SIZE];
+		struct rtllib_rxb *rfd_array[REORDER_WIN_SIZE];
 		struct rtllib_rxb *stats_IndicateArray[REORDER_WIN_SIZE];
 		struct rtllib_rxb *prxbIndicateArray[REORDER_WIN_SIZE];
 		struct {
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index a30945f30e14..4c8cfa40927c 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -509,13 +509,13 @@ void rtllib_flush_rx_ts_pending_pkts(struct rtllib_device *ieee,
 			   pRxReorderEntry->SeqNum);
 		list_del_init(&pRxReorderEntry->list);
 
-		ieee->RfdArray[RfdCnt] = pRxReorderEntry->prxb;
+		ieee->rfd_array[RfdCnt] = pRxReorderEntry->prxb;
 
 		RfdCnt = RfdCnt + 1;
 		list_add_tail(&pRxReorderEntry->list,
 			      &ieee->RxReorder_Unused_List);
 	}
-	rtllib_indicate_packets(ieee, ieee->RfdArray, RfdCnt);
+	rtllib_indicate_packets(ieee, ieee->rfd_array, RfdCnt);
 
 	ts->rx_indicate_seq = 0xffff;
 }
-- 
2.30.2

