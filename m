Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4401074058
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 05:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717998553; cv=none; b=khcnpi5wlJDv39vK576a5RYdWfzefKGyvkLVJHGXWcXBRFKRHoU7wH0Nz4h4UAWTq8I6dBLoJBoqnvPTRbVRhrXo7FMDN7PXjonvHchC902G6nwLAOLkJFG3OJjsrLhasxFrfEe3XgQFmPNgduESrdGjd19S/2IEVqhyzSyrg4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717998553; c=relaxed/simple;
	bh=5WjYKzyNdive4sa4vHuYC2Dqjq3HbPl37g+TtRrR/OA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NApSnSrWMoTQlEcv8J9qM40q9ZN19KpVnKM0LHBYSf4Dk4qRqufBomQPSpwFr3Gdw4KZED6Gf2LnC33QNdwiLkHaG6PsXRAa+GYQUWTJqzRCM/1yqE431wPumiS6zeUVd+jtW/JgiGz5+G+Ofmn0rf4SwH6+6oM2kL5cQpxyBOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=B4J5Jg/2; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="B4J5Jg/2"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f44b45d6abso33244455ad.0
        for <linux-staging@lists.linux.dev>; Sun, 09 Jun 2024 22:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1717998551; x=1718603351; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/ahLMxx6dJunJKkjljH/YoDaz/TFR0YL9Y5eJ6K8cc=;
        b=B4J5Jg/2/NjLAJnXCmxVy3WIt7bcjRijibXh57g9ILAh4anmSoDCYkfYkrEQ1Na/yC
         aCp0X7rdmPbjlzXf/K3s6k6UwrnPwWqE9Xm68icbypctl575ebvfZYd83iBD9f8M6VzA
         y8zDyzyy+bbGeeG3O3LuUDd/rsGXUW1OPVuA8lLI4X/FiOXyo5qmz0MPczCtomYAuW2o
         ngzlMm7jwFXEDEfic6U4JNSHOfLPPmdI7ORUOF+nIw2iYu/nFmgaeh9W8MArR1kX9WOi
         AGZmQbXVQFdfOUgUWQ4sQNF0BopLpplxtICG9i6zLXzEcwCsqyZeElYesct64pSBjRIE
         tg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717998551; x=1718603351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1/ahLMxx6dJunJKkjljH/YoDaz/TFR0YL9Y5eJ6K8cc=;
        b=MSND1FuItpSIlKjB2BVQfiR+KL93jUFWDVkkZ0S0NIBzqQ/F1pegs8utmtGskjAME0
         v68fPd/jYfp9p2jN2EPn9EvViF9KbUYx/6sYji+rwI65COSt2gsAQQktqCSS6gmhLaFf
         4Z93HIGmrm3TH6WXEIcdAy9f3AaiwFNIF6/x0o5FuI8Zk49n1zB3zO2sTk0Efsy15oNT
         VaJjzQzjIcwBJB8h5qh7J+87THQ9GHgq1odoRDSShnN3jbSXI2yuQK267NWbnVKJ5WCA
         BhQTJbpCjOCTvQ6CFHAKQbPNif795l554iPR5QEa4PPopQai+rCjG6O3QRn40QLBc5Pc
         RNLA==
X-Gm-Message-State: AOJu0YzVmwx3cTmeZtMMz25yKNqo5UHcwa9RI9EHbDUPpUb+EB+81yr9
	oCItPPNUn7jdgP0yacH9OD2uLiDM1IvHz3KGKekmHSNxTf0bBllHyXNBb7ZQFvk=
X-Google-Smtp-Source: AGHT+IF/bbFFnZTV4qHCeHwyWHQFb6vZmha/DloHQmcl6dunh9WsLzXdt0Ag/Kq11qK0akcKPDv6hg==
X-Received: by 2002:a17:903:187:b0:1f7:8a9:91c8 with SMTP id d9443c01a7336-1f708a9973cmr28920175ad.39.1717998551683;
        Sun, 09 Jun 2024 22:49:11 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6f1aced64sm35653725ad.9.2024.06.09.22.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 22:49:11 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 20/24] Staging: rtl8192e: Rename variable bRTSSTBC
Date: Sun,  9 Jun 2024 22:44:45 -0700
Message-Id: <20240610054449.71316-21-tdavies@darkphysics.net>
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

Rename variable bRTSSTBC to rtsstbc
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 drivers/staging/rtl8192e/rtllib_tx.c           | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 46e42fad5834..b3d4b3394284 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -894,7 +894,7 @@ void  rtl92e_fill_tx_desc(struct net_device *dev, struct tx_desc *pdesc,
 
 	pTxFwInfo->RtsEnable =	(cb_desc->rts_enable) ? 1 : 0;
 	pTxFwInfo->CtsEnable = (cb_desc->cts_enable) ? 1 : 0;
-	pTxFwInfo->RtsSTBC = (cb_desc->bRTSSTBC) ? 1 : 0;
+	pTxFwInfo->RtsSTBC = (cb_desc->rtsstbc) ? 1 : 0;
 	pTxFwInfo->RtsHT = (cb_desc->rts_rate & 0x80) ? 1 : 0;
 	pTxFwInfo->RtsRate = _rtl92e_rate_mgn_to_hw(cb_desc->rts_rate);
 	pTxFwInfo->RtsBandwidth = 0;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 7c010534af52..738db4d6180e 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -116,7 +116,7 @@ struct cb_desc {
 	u8 use_short_preamble:1;
 	u8 tx_enable_fw_calc_dur:1;
 	u8 ampdu_enable:1;
-	u8 bRTSSTBC:1;
+	u8 rtsstbc:1;
 	u8 RTSSC:1;
 
 	u8 rts_bw:1;
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index f6525256298a..841d9960385b 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -372,7 +372,7 @@ static void rtllib_query_protectionmode(struct rtllib_device *ieee,
 {
 	struct rt_hi_throughput *ht_info;
 
-	tcb_desc->bRTSSTBC			= false;
+	tcb_desc->rtsstbc			= false;
 	tcb_desc->rts_use_short_gi		= false;
 	tcb_desc->cts_enable			= false;
 	tcb_desc->RTSSC				= 0;
-- 
2.30.2

