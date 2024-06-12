Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B1C7C086
	for <linux-staging@lists.linux.dev>; Wed, 12 Jun 2024 03:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718162569; cv=none; b=K5ga36QON4bjtMP4CbaOwTZgZYTvaWH+eF/w+XfpDw11Ypj3TyUtyUtwGY2CjreRddfumizMYXMr4AcFJlGw8/KDNvgq6ONdL7uxo7IjgZEAVku8jxSBXsFoazdp1dCpUZdP+hWhhespAXog8exdS/c50J4xtL0RPBQE8OsNg5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718162569; c=relaxed/simple;
	bh=PMBr1YYNuZJA6HyrdZulTQpmDuqmO4Ov8c7SotPvG2g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FsvzGbofWHJ4m2b8gWe1Gg0y9my0+eWnj+/118Xny3bjlNoR1Hqsc4AhioQ931TrwEz0R+7MHizeg5pD1/ONI1L1eEqvQw8lCT6XC+S7ydbbGAp4JlMoF2EzEZppufR0QlEtN9mOVQoGIHzvLYSVaKjvrjS21xvtZ6lhFebwHis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=BUTSE6jO; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="BUTSE6jO"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7041053c0fdso3525377b3a.3
        for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 20:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1718162567; x=1718767367; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRT6W8iVB5TH/crkmlwaDlIVBxRo8bFFTV9sN1VFjZc=;
        b=BUTSE6jOEYCqtDiZ/7LkSkqID+dtdvG7f99Za9BbKgPTcyXStruGY6Dhl4+Vx7WBAA
         TKJF3zlI9oiX3yl70ypvlLth+UcWofRRftGM230wTKV5NZf/vQaEoOGisrj7qJjODlV4
         7icvzw4k6K/bdazVH8d9kglI9vEIYRVnMSdUoHHoyDJnhBjtWQEQIZhn0SS+oqovcRFa
         tSPHupyvdOjHeXR3hDGpqDaImwXdoQVLe6cQHbTByQ8kvZFA/9P5cAnG34jFtvUuRG3t
         lK+UwTI19KDhXBQHkIeKEk4wUli6a2ikE3vgu1v/c9Th+mMo+6WfZ3hTY/6Gof1ZhzIM
         m/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718162567; x=1718767367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GRT6W8iVB5TH/crkmlwaDlIVBxRo8bFFTV9sN1VFjZc=;
        b=PPXbH85xkvCxdXKDKwXTCi2mVbuaItHDwvmMLF7DIU06zGZU6BErdp6Af0LIw0zbUJ
         fKWkjIglaUbWMD89taoY9KSciEx0XzIhD1jZoEK8g0KrUuNC5LondtXOtVGPGjpfnLW1
         uuoL8Cik47AuSDPScnXns7V9DaKqMIeXYwHacmJpihfPKzH8x9/dQUpPqOF39TtDm9zx
         xRnFQlZutKeyrvm8mfMAk0EqbT5PpeVvwkljLiO83/OLLjIoKP1hgHMfchGdOgI0m1jo
         MDUH9tlEUnslgyTvJPEVvD4s9Ojd9/g1lhJZ67BHs9cKcnF7BwQP3bCWFK7rWCBfEhjt
         6oZQ==
X-Gm-Message-State: AOJu0Yylv7g0eyi9jqHkQ5FTgQxjHhnUV1nKiOZD7/uPFoTfqUvzGk20
	ce9wSTOvt1TtyYFyeXLZ2oD453l0CJ+ZuYD5mMLThEruM3DKXpmfwGsC4djnjJo=
X-Google-Smtp-Source: AGHT+IGZdQyolydFOX1yTIyzNKpwzTfV5AzcpkckaHLJKdXgYjzu4RuXNrxgsTNujadAQhl/3iDzyQ==
X-Received: by 2002:a05:6a20:3d8a:b0:1b4:4568:4c3e with SMTP id adf61e73a8af0-1b8a9b77ac9mr892626637.9.1718162567564;
        Tue, 11 Jun 2024 20:22:47 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6e8e8a84949sm5635411a12.32.2024.06.11.20.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 20:22:47 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 17/24] Staging: rtl8192e: Rename function rtllib_query_ShortPreambleMode
Date: Tue, 11 Jun 2024 20:22:23 -0700
Message-Id: <20240612032230.9738-18-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240612032230.9738-1-tdavies@darkphysics.net>
References: <20240612032230.9738-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function rtllib_query_ShortPreambleMode to
rtllib_query_short_preamble_mode to fix checkpatch warning Avoid
CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No Change
 drivers/staging/rtl8192e/rtllib_tx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 06c3166a5b47..93b9f0609428 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -319,7 +319,7 @@ static void rtllib_tx_query_agg_cap(struct rtllib_device *ieee,
 	}
 }
 
-static void rtllib_query_ShortPreambleMode(struct rtllib_device *ieee,
+static void rtllib_query_short_preamble_mode(struct rtllib_device *ieee,
 					   struct cb_desc *tcb_desc)
 {
 	tcb_desc->bUseShortPreamble = false;
@@ -868,7 +868,7 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 				tcb_desc->bdhcp = 1;
 			}
 
-			rtllib_query_ShortPreambleMode(ieee, tcb_desc);
+			rtllib_query_short_preamble_mode(ieee, tcb_desc);
 			rtllib_tx_query_agg_cap(ieee, txb->fragments[0],
 						tcb_desc);
 			rtllib_query_HTCapShortGI(ieee, tcb_desc);
-- 
2.30.2

