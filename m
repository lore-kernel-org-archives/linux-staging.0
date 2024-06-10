Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622FD6F2E8
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 05:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717998551; cv=none; b=obFAhogFhf/Mmcyo3hqg9tMR+Ca9d74WGTPmbN7Z+RuFxudxW+pR3DUF3Ir9G15tFV0Whe4QeCuWoTcCU6f6iAx/+wPC7m531OhdIaV4pOfNL4R3IQc9Dq+Vz2HhfmPnyoPGyWYllmWIXQ+pIpvCbNJts6K0DuaCUKHpYmVQ+O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717998551; c=relaxed/simple;
	bh=X/E3Pq3kvyKK7IWx4aFnVwyrhl9NLwEvBdXDdVjlmFk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AjCTRzGYvstfBQnmK0EmQRRahF/XDdOd4ww7RVlxB71UZ7ExQQBJZBlu6aVRUFhg5stnBsNk/Gkqmhp82+WeGXbS9s2sOaVw4vFz3RATFdN1ajTRtfkrBqiX/0Ttvhumr6ZzoyuCMLY4jnyPOscMsCRHzYKD/mgIj3Ar/LDczvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=DdJrrfeD; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="DdJrrfeD"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7046211e455so443179b3a.3
        for <linux-staging@lists.linux.dev>; Sun, 09 Jun 2024 22:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1717998549; x=1718603349; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9K4lcpf2OkEYR2xZopw2ineD+0yCBYkA1VqFFHt8Mek=;
        b=DdJrrfeDHhk4Ro9qBGbsbYUU5TV6RZBvwWASx4ZCG2r/eTqEfA2020cFhalWmzlsHv
         S7kcQfEBdDy1Uu/IfBt8Vr3Jqp5B1+DETAZuNWNfleA1NVJPXFavHX60NktRJMBbOQ4a
         Y2HwaTPiITKrsZyFLBEIjS+xMVrW6Gj6lmQZXE2oZkAy3zSwYklO+EJWWYxMgg7SNmrE
         P2WM1AHkktHqN53hkpPhd8B3dNUhD363gmM5jtauIvUojNzC4nGNQ+niLLUFaLoFSfNo
         MGhZZrJtWYZ2WpAeb25CBipSbrpolq/+K0M2iyFXscDzua6VDEWA+Zo+c5ptNIYrTf2v
         Ca4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717998549; x=1718603349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9K4lcpf2OkEYR2xZopw2ineD+0yCBYkA1VqFFHt8Mek=;
        b=W8giVKiigcmMlRdCXCsECusSdujEvaUKxDbSM5D+KmphvmnV8AQl5O3NnS8aMVU8pi
         mOaztHA1KsiaVdqicgyGu9iE32eGrqyarzhiQ9G1RRlTe7pRS3NgyECoVGs74Wo2brAq
         mZJoyOcWjUArcxk2FF7ptrwnK7wd/h0oW1qyKaR3Z8TPxDw6i2eH9O95ArtBIZ+MYkAD
         qA1RZdpmpGhQXK8lWBP3qf7RSzizfubCP/e7I5uNU33Rb6/kQ1Qb0AV5rGou39Z1/r4b
         PTqi5VmKAuKphxj4WF+9Pe1Q7cwsVzFCaGRO0bAuZtwysADMBNJYlxci0f9MVxIcOG9l
         iDAg==
X-Gm-Message-State: AOJu0Yy3+VM2jOdLWN2lirbs7Vin/9dcloOQFTq8O3yH3ipHMAN1hJVE
	gRElS8W5XZqTnYCzF6LRJCk8YmoZQfpr4UNRAvYMhgS2OJiinnUjpWX6aqpjjB4=
X-Google-Smtp-Source: AGHT+IHtInTe/sPu8KWMorUgVUZIEkw3ZQa4pgT4eRdIsIn7FfmmjKu6CINpnzbdDhF7HzTzjaDk+w==
X-Received: by 2002:a05:6a20:7483:b0:1b7:bdb3:7bc7 with SMTP id adf61e73a8af0-1b7bdb384d6mr1157261637.20.1717998549707;
        Sun, 09 Jun 2024 22:49:09 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6f1aced64sm35653725ad.9.2024.06.09.22.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 22:49:09 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 17/24] Staging: rtl8192e: Rename function rtllib_query_ShortPreambleMode
Date: Sun,  9 Jun 2024 22:44:42 -0700
Message-Id: <20240610054449.71316-18-tdavies@darkphysics.net>
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

Rename function rtllib_query_ShortPreambleMode to
rtllib_query_short_preamble_mode to fix checkpatch warning Avoid
CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_tx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 4ac8140d7e68..97581cd58571 100644
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

