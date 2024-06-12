Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61C8374FF
	for <linux-staging@lists.linux.dev>; Wed, 12 Jun 2024 03:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718162561; cv=none; b=nY7NY/cWT2QMuBYD2xz3ULXQXWfeIzX3rR/vhriyH/xsERCe5S1hJjP9wi/BSCnWB8UgqKK8UTGpmeZYjis+HTZuiZBHtsf44Svs/7ZaEGaHdFHdFLcfYixCXQZq4dfvzYZSC1kKREn37BVUrasq6b6ldPJ/kbwQVdD7ZvJmzN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718162561; c=relaxed/simple;
	bh=GxUQdypfFx8mKG5Keo9Q+CYF+U0ENbg51vKbh73Q4yE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nO/IonAWoh554Q5WzTAgBbqENbeJAnbgi7PYe/umBMoHVXlE4LZrNtFaM1YHk9Ja3/KBoqaYdEVAtp8X59No6mhuLokcbfMYvXXQAHSs+EAME2LaFYWSdPXuFvpmn3LEHGJ9rnLLye9ch6MxmNU/f7nJtou7Kdr8p5b+UWfCg6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=MBWFPpVK; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="MBWFPpVK"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7025f4f4572so371526b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 20:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1718162559; x=1718767359; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tu1YovfLQEAsBdhGanL9XJ+Gga/xI5TxCjPr1vPzUmU=;
        b=MBWFPpVK8XQ2LdHldm6oRTo4wWSZe4s+NZgGb5So6cK8j0+wfZVMyT+92RarKI5qQ0
         x4OJboTwiS2RtJfDcLxG/jWPsX9mZLmQJuaN8A3N9gVsDEsOsJu4tOXPtcPgEb1sRpxo
         6k2NhwAqBXnEDB5qo5p3mK2xoeJByrHKCHWQw1H2X4RPUXVXTydRsHIHaE70IHaBeXwj
         RFA4P6BEu2gU5EuzcdUJuPR2Dn3eqF7iz80ETE1Yv4FBBQ0vLTUrb3GGx+SrGEyt9BKi
         vL1dTfFf6bH5Bcyxbx36rXzi1Ut1lZe2DQcM1TkrtGGx/9wZQ8Kp5kJ2JuT/7tnXVbIE
         Eixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718162559; x=1718767359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tu1YovfLQEAsBdhGanL9XJ+Gga/xI5TxCjPr1vPzUmU=;
        b=LPVxL7XKRNj1Tz0FZj74O0TAehIi4KMiKB7K5jPtUBeArLHTqcS9LDGbCmZivsqH+J
         B9FIWifnM4W6Ppk8NePzJ4rFmicSP6bka0KzS8JMRV6Z7meN12H9ED7pReuPGAGReGnX
         1jH1NYX3zSDgnMXlEdXsaPRw9lFK+7o1lZMqtcyw/NygLnVutFYI0Ojpwxi4EZWMH6UH
         bxOnVJeCnLyY5FIbHU9HzY8JrUK3tKZAOTnUf/9agO8VF9IZ++oSlTlL1UvFP7QgFf/c
         oRk3HyO7m+l3s3yohVPx7QyzJ8PWQQ8dYt4pIoPaOefNH1PSxcob1cR7fxcqQQLyXuxH
         L9sw==
X-Gm-Message-State: AOJu0YzKt5Pcmf7efBkDe9CFNaxPyJ1KyhVcMNTc5u4G00nKL4TE7aiS
	wG6sUWwN27nPd3EITxWrU7WKYnPmjTHS+TjhUHDIRemOMe6jSWoClwu2QvWrD+w=
X-Google-Smtp-Source: AGHT+IGbK31oLFywfNaLnSP9D1b26MHKW4EJL/Us0ks3qOwNu0Lp2kbhXjyFeoVfuTZbSyY/tnEc4w==
X-Received: by 2002:a05:6a20:96cf:b0:1b5:88f5:5823 with SMTP id adf61e73a8af0-1b86d376213mr5016905637.27.1718162558807;
        Tue, 11 Jun 2024 20:22:38 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6e8e8a84949sm5635411a12.32.2024.06.11.20.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 20:22:38 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 07/24] Staging: rtl8192e: Rename variable bCTSEnable
Date: Tue, 11 Jun 2024 20:22:13 -0700
Message-Id: <20240612032230.9738-8-tdavies@darkphysics.net>
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

Rename variable bCTSEnable to cts_enable
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No Change
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c |  2 +-
 drivers/staging/rtl8192e/rtllib.h              |  2 +-
 drivers/staging/rtl8192e/rtllib_tx.c           | 10 +++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 0263f3d7179c..4117530f19b1 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -893,7 +893,7 @@ void  rtl92e_fill_tx_desc(struct net_device *dev, struct tx_desc *pdesc,
 	}
 
 	pTxFwInfo->RtsEnable =	(cb_desc->rts_enable) ? 1 : 0;
-	pTxFwInfo->CtsEnable = (cb_desc->bCTSEnable) ? 1 : 0;
+	pTxFwInfo->CtsEnable = (cb_desc->cts_enable) ? 1 : 0;
 	pTxFwInfo->RtsSTBC = (cb_desc->bRTSSTBC) ? 1 : 0;
 	pTxFwInfo->RtsHT = (cb_desc->rts_rate & 0x80) ? 1 : 0;
 	pTxFwInfo->RtsRate = _rtl92e_rate_mgn_to_hw(cb_desc->rts_rate);
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 0131765e451e..2282c709654d 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -110,7 +110,7 @@ struct cb_desc {
 	u8 nStuckCount;
 
 	/* Tx Firmware Related flags (10-11)*/
-	u8 bCTSEnable:1;
+	u8 cts_enable:1;
 	u8 rts_enable:1;
 	u8 bUseShortGI:1;
 	u8 bUseShortPreamble:1;
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 8c9072538688..c0fe00d0df02 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -374,7 +374,7 @@ static void rtllib_query_protectionmode(struct rtllib_device *ieee,
 
 	tcb_desc->bRTSSTBC			= false;
 	tcb_desc->bRTSUseShortGI		= false;
-	tcb_desc->bCTSEnable			= false;
+	tcb_desc->cts_enable			= false;
 	tcb_desc->RTSSC				= 0;
 	tcb_desc->rts_bw			= false;
 
@@ -390,7 +390,7 @@ static void rtllib_query_protectionmode(struct rtllib_device *ieee,
 			tcb_desc->rts_rate = MGN_24M;
 		} else if (ieee->current_network.buseprotection) {
 			tcb_desc->rts_enable = true;
-			tcb_desc->bCTSEnable = true;
+			tcb_desc->cts_enable = true;
 			tcb_desc->rts_rate = MGN_24M;
 		}
 		return;
@@ -400,7 +400,7 @@ static void rtllib_query_protectionmode(struct rtllib_device *ieee,
 
 	while (true) {
 		if (ht_info->iot_action & HT_IOT_ACT_FORCED_CTS2SELF) {
-			tcb_desc->bCTSEnable	= true;
+			tcb_desc->cts_enable	= true;
 			tcb_desc->rts_rate  =	MGN_24M;
 			tcb_desc->rts_enable = true;
 			break;
@@ -412,7 +412,7 @@ static void rtllib_query_protectionmode(struct rtllib_device *ieee,
 		}
 		if (ieee->current_network.buseprotection) {
 			tcb_desc->rts_enable = true;
-			tcb_desc->bCTSEnable = true;
+			tcb_desc->cts_enable = true;
 			tcb_desc->rts_rate = MGN_24M;
 			break;
 		}
@@ -444,7 +444,7 @@ static void rtllib_query_protectionmode(struct rtllib_device *ieee,
 	return;
 NO_PROTECTION:
 	tcb_desc->rts_enable	= false;
-	tcb_desc->bCTSEnable	= false;
+	tcb_desc->cts_enable	= false;
 	tcb_desc->rts_rate	= 0;
 	tcb_desc->RTSSC		= 0;
 	tcb_desc->rts_bw	= false;
-- 
2.30.2

