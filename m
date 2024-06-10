Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A94D762CD
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 05:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717998555; cv=none; b=uTENLTVnyCirt1ryuIrN9ztZ8+K0D+nR0LbK+k87rol/CVxFEmAGKSPv+quGs5gPvP1VHrVV+swDdyj92D+8BUV85ooGtl7en2Czu3eB7AxGdPoiLLaSnAG41y6oBz2XWAkephHZ5gMxS/wcYiBY2vGmJavE4peAPtFrn13bmVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717998555; c=relaxed/simple;
	bh=YSSCkUPWhj0gj8cLd3caar8iUYt4A9KmG6srrWfGldA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q1HsjyXrnSWq9H4pJt9nzl9vKDAHrcxQwWcwDwLGDor713itBLGoj9pBFI9UBrnhK0FmPc5GokXBs0O1NrtU7hTjRn3Q/Ka1k/nimeppRglRWrg6K0BQIBgdXhf06bPhsoCmTOz5m7stxVzrhZtPyuI+Wy9HHmczauOFPKD5Pp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=C3e4hBRj; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="C3e4hBRj"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-701b0b0be38so3767414b3a.0
        for <linux-staging@lists.linux.dev>; Sun, 09 Jun 2024 22:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1717998554; x=1718603354; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EAqqY+LoHchiSuHoilEjGopTQ6RwSJwH85o8vDOSlSM=;
        b=C3e4hBRjkU7YsNvxOCb9AI4IFTUMsupg4+a4v4ZORjy7AXrHrwgx37Egy/oeEH/WAI
         Cwn1hraQH/ngmJE9mfAUYeWFN8kRva4YSyNPSdNXF/539spIz10oQGZ4aW33MdFhE7lJ
         pgMYmS4jXHcta0vb5whspVi1fnLVTb93d5uAcD55z4+nw1ka7FuRaTeJCl8lJCMpiPw0
         qJtNQNnA/9NdL+/pgCdZv+koiuI0Mz2wl8lFN5Ub0Uq3t9jo6ULgXYgki6PLBKiJtxZQ
         leFnQl+ZETVdaQ+OUCSgJM6NfnQ4JCSondrqD1NCBI+hNmt3WgiA63qjpdl68au/EiQt
         Y4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717998554; x=1718603354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EAqqY+LoHchiSuHoilEjGopTQ6RwSJwH85o8vDOSlSM=;
        b=lWQKMJESyh4tyEIrH667bDWED01KAEMj+g9sAAB5nPPDRBy2+JcTK66VLan22xNo2K
         m+wnaAToLcQ5yHv+j3F4cla/3LtfBkJGue6YDRZMZu4vwXgmdb99Gx9GAUhzDKrQITke
         qnagOnkqe6vVixWbrn1w2omD9qvkA1HkzkbMFiexEokswkEqQ47f0EXDLZDp4PrsqzDT
         pKlLs3ZoOxnIGmGtm1KM1Rd/jf4+DF0QtKX4M08Th0Cyvs/JnI70RWlXm1c6fIWalpTy
         Q1FNnDCKU0pcCHU2PCFtWtXmtaIUwQ8L89IH1njOxbv4FlAyAQeKSFGcsiV3o0zfxpQ2
         bUwA==
X-Gm-Message-State: AOJu0YzI5F2oPeIUatXn+qeMx01LD1Kcfbhqio/6IV2UhbSXcOMCcuoC
	OYDI5h6rmLOxg9+Fk/PCQn7gHJhZIMFx4EGP1a6QJaSAvLQDNNtAz3MhKY1pN7g=
X-Google-Smtp-Source: AGHT+IEBr9424Ps5fOgQVlG/45YsibmxXaLaRHS3ufkHJ+OHaEd1LLWJB41pwnvxEs+p8MQo0PyWIA==
X-Received: by 2002:a05:6a21:998d:b0:1b6:dffa:d6ec with SMTP id adf61e73a8af0-1b6dffad7a4mr2906556637.46.1717998553717;
        Sun, 09 Jun 2024 22:49:13 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6f1aced64sm35653725ad.9.2024.06.09.22.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 22:49:13 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 23/24] Fix space/tab alignment to match open parenthesis in rtllib_tx.c
Date: Sun,  9 Jun 2024 22:44:48 -0700
Message-Id: <20240610054449.71316-24-tdavies@darkphysics.net>
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

Add spaces and tabs to fix warning: Alignment should match open
parenthesis.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_tx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index eb1668458e30..0f73dbf53c03 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -320,7 +320,7 @@ static void rtllib_tx_query_agg_cap(struct rtllib_device *ieee,
 }
 
 static void rtllib_query_short_preamble_mode(struct rtllib_device *ieee,
-					   struct cb_desc *tcb_desc)
+					     struct cb_desc *tcb_desc)
 {
 	tcb_desc->use_short_preamble = false;
 	if (tcb_desc->data_rate == 2)
@@ -331,7 +331,7 @@ static void rtllib_query_short_preamble_mode(struct rtllib_device *ieee,
 }
 
 static void rtllib_query_ht_cap_short_gi(struct rtllib_device *ieee,
-				      struct cb_desc *tcb_desc)
+					 struct cb_desc *tcb_desc)
 {
 	struct rt_hi_throughput *ht_info = ieee->ht_info;
 
@@ -347,7 +347,7 @@ static void rtllib_query_ht_cap_short_gi(struct rtllib_device *ieee,
 }
 
 static void rtllib_query_bandwidth_mode(struct rtllib_device *ieee,
-				       struct cb_desc *tcb_desc)
+					struct cb_desc *tcb_desc)
 {
 	struct rt_hi_throughput *ht_info = ieee->ht_info;
 
-- 
2.30.2

