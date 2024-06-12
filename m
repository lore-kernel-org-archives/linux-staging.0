Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4388D82482
	for <linux-staging@lists.linux.dev>; Wed, 12 Jun 2024 03:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718162574; cv=none; b=gDMF/evf6QFmLh/UxophM9T/O8trNNhxXqgb7udoglaxb2uoik13wkfgIGlygEweQ+brOJtRkJ1fL7EKMceyJyHkKD9+aRotT1QANRjXMqBN+X8Wn4Zm9hgxWm+aR6aXtjWcZauDdG7XecGNZcdC3HDWj7ZCxf4q1HZlO9V7/eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718162574; c=relaxed/simple;
	bh=c8MR3plf46KFfyFHzwWDM6RMkQukkKt3JMAeSqgetE8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s/jSKJFA35genN5DURuSvn0H1ujWXYIPlun4UIhEfUR6/rmLjxyUkXk/9mcPD54P6ZS9lo/J+mp7FQAwuyettYD8Wa4PUA8K7zY80nxgxoIALw3OKbZHp7bbtPyX6te0JFgEw3MonIvspcKg752KWRLi99ys8y+hSCkSLmN6C0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=HAI+R9E8; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="HAI+R9E8"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3d21e00d9cfso1013406b6e.2
        for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 20:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1718162570; x=1718767370; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MlD23f+arzcg415XUQcgi2kkZZjdw3Csp3SRxDpwH5A=;
        b=HAI+R9E8jqxqPswJ9dYlNM4ZxbnaO5hX3hfCW0zfaoeIVN8J8j5abC6/dKmOF6cH9q
         b0p/Fxvz/XA21F//oWoi5rb7oyoF9ClOd/zDE7EPbQ5VsmQ7XnwjTg3/ZW0USS8ma+hG
         t43Gxn1qsthRQXOELpBbflKNAM/gpeyh+xTdCnnv/TTgvxarC7CSXbqQwSFLuHyh1GlT
         GqVjyi4UgxXnkhX9HTXR9/iXYwR4ZnZrnfxdtGQXd8CPbTLtHLopZAbbQIdIckiVafDx
         ME/1MHnwR4kufxVfKrP2Tnh8PfNDWKmVZ1yaFEI3rBUMj0GXvvbfApczx9HwxfmsJO7B
         0Y8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718162570; x=1718767370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MlD23f+arzcg415XUQcgi2kkZZjdw3Csp3SRxDpwH5A=;
        b=bHCIJVY+lSJryyQH2QxK+kRL/41CtBOPjRXevV826Et8Z66iIRe9hzN2dKSppzJXF3
         +XbU0FaySCwB5qdORYZnWDqLWe8vQpbBG8ROs1PGVkyVBg/tcNj5WfZsyknGU8FQ1L0/
         hcfeez12isBLMk51ncWZZI+LQQ0+oOuTxLMCN7UXE5+awXwQKwjyOEgUpg5UFdpGhhlb
         LRJIA63zrh0YHKfTDFiu4BKP0ldN3YjoN/6J6u5Hwyw8B3OSWfA6pXWgidKBOjq/eKBm
         g8glkNeusRVMpXwZiDRCFK6L373lYIvtieuOcpwWljBu38Wj95XzF7UaVSlGyl73z9uv
         NhuQ==
X-Gm-Message-State: AOJu0YxIFw8ftkYfhTtC7gd+Tts62Lun6SUF+aWYw8P6nNOgcw0s5pn3
	vasVM3qTCVzG8QcDeYTqNVN/YJFPl6zze//uXbrqkBsr55YZsSwhEfQE33bcYZs=
X-Google-Smtp-Source: AGHT+IHbieTndi1KMRbPXtZyNMt7QLIoX+75W/r+HgGQcQ8UzS+ezzdKinncxF4lvj+2qyjawM8FBg==
X-Received: by 2002:a05:6808:13c8:b0:3d2:243e:e4b7 with SMTP id 5614622812f47-3d23e04d2d4mr638193b6e.23.1718162570315;
        Tue, 11 Jun 2024 20:22:50 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6e8e8a84949sm5635411a12.32.2024.06.11.20.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 20:22:49 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 20/24] Staging: rtl8192e: Rename variable bRTSSTBC
Date: Tue, 11 Jun 2024 20:22:26 -0700
Message-Id: <20240612032230.9738-21-tdavies@darkphysics.net>
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

Rename variable bRTSSTBC to rtsstbc
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No Change
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
index 61d383a560f6..022851b7f1a9 100644
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
index 1aad5253ae4e..b6bf10dc1772 100644
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

