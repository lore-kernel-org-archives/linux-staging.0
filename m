Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF52481DF
	for <linux-staging@lists.linux.dev>; Wed, 15 May 2024 04:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715748767; cv=none; b=USpJKBtiRb5A8gcLX/kRgU+cb5UUb+Mi2OY/EQnO6q+/yxPfe45M0U35RNzK/8aDTTtcKdeJdu7rshzor0d5FnAyJ+qu/+hiPBXgVggt7BCe/XcaLO4L8o/yfKlhjVxaGWV3s+peO7Qu8DR7cnY9lvJN+6R5aMKDfWjVPoJVPWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715748767; c=relaxed/simple;
	bh=OQCA/Wuv/HfcLT3KLlRcg8Og+eLrIFBwwBqRoIqjfpQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cm3ihGOqvQMcGsZU0xT+fU8EHNxC0hbPpeWGXZN/CyFpKDbM+h/G9wZaQi2SduBF30SYuqugUbdJ0JHr5ox/mQUY1vkWTwMzccq96FVquJ0fURwhwlNFQVxcJ/+krl3nClCTCwheCc5htp7qZNCZlaAKMx975+5pEEpdpTjF2kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=ApC0LW86; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="ApC0LW86"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5b2733389f9so3496656eaf.1
        for <linux-staging@lists.linux.dev>; Tue, 14 May 2024 21:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1715748764; x=1716353564; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9dZh+TjKA4PTqq8oux7GZt+IFGMZGNC7LsD9Ci9/UDI=;
        b=ApC0LW86mh8el3q9K0BDgkfz5vvnKBeumPsENwP1Za1VOIZwKyTyY379sqC21mpRkX
         rbLh+oxSVOfTg66eUrGEzZvY3T/n/8xZ9J9bZBNnVRB9BZoDhV0KF4q5de8XQS4TLzdV
         7Nq0eXn0H4ubl+LqnSl1YbUTwj/w/hgpx/DJvBHqSFuxU54my8saFdCsWb8TzuKsNdvy
         Ov97C5bVvTsQ7Z6IfSNch0+gLHU6MIpj6jUjrDg8m5axDHItihmGLebRL0z2p8Wu3PLu
         x4MzLbdgvGPVcCA7gCefMebek1GANHoIleJJZtm0da+xw6fz+PCTTkBaFfLHL50j7Xsu
         5J4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715748764; x=1716353564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9dZh+TjKA4PTqq8oux7GZt+IFGMZGNC7LsD9Ci9/UDI=;
        b=g45TR8CZq0f/O1SiS+VAlPt3Qkj9u8uRrAEQK/GbtftnDHtQxjtIQCi7HhCfBb9n6i
         +ereipvD2582jaTWBwMLITgtHShtm1IxZWK34UCeo/JtVK/QdMYab9b8H5rNT1aF6fmW
         DKJrxC/wUaHJDQrIwMGhwMAhOEVXZPDJ5qJbvyX6mfxN0S8B5SRVcd6O44naT8EjiVOi
         K/oQRHojzfCbVcR3gA6+sy2q2l6gBwS6iUQlbMCmhK6VW/ATI6mWsj/P39YI85UKne5S
         MEuaqEGt9kCvZ1Ll+702M9BSDP0wE7PGSWINCeu+3/nGcU882BCPgUXn7FKsQptKbWy4
         ph2g==
X-Gm-Message-State: AOJu0YyJtHHFRO3hAq7I2OBh/FcZP9vpp+6RteTqnYEMWmRRu1LkqOvA
	QTTV0D+qs4q4f7FH5uEl3SZbwwezONRFu02GIT0F8goaB5Las+9V7aUAEMochMrgLqE33agSs5v
	/
X-Google-Smtp-Source: AGHT+IETKpJHTIGgyOdig88uRhkcCct6gCbyK/ArdRVDW/rPCpb+83MR9NMIqp097Ctk+y26VdNS3g==
X-Received: by 2002:a05:6871:5892:b0:244:bec8:febc with SMTP id 586e51a60fabf-244bec90232mr11318039fac.56.1715748763820;
        Tue, 14 May 2024 21:52:43 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a827fdsm10135035b3a.60.2024.05.14.21.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 21:52:43 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 13/31] Staging: rtl8192e: Rename variable RfdArray
Date: Tue, 14 May 2024 21:52:10 -0700
Message-Id: <20240515045228.35928-14-tdavies@darkphysics.net>
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

Rename variable RfdArray to rfd_array
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
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

