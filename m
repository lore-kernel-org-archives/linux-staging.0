Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEF84D8DD
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 05:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717998549; cv=none; b=ZC8u8hsjKZKDvkDUEK8DQ2BHRl3nLrbCqf8U5AijmeyGUZckYggNNK8w60VzcETrL+1OuiEwcdY2QNvYMQsPAXlKYaIXXr9oigAmrqbhiLd0nYhrXFb24s5E+pvXCnJi8fTAHwacVXWf+YwQD+FpyNJRXPD3ujrUzHzhlPWLmgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717998549; c=relaxed/simple;
	bh=ZP570iFe50eXL+fB0Yj50oZJlOy1CttuSa3FHHvYE8E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dVEXn+olBsWzrhyUCuHU5eS154pIUKbc8YktiqZiW6noGUQq59qwbuyLJDf37xrwZ96PQv2M1RmnhBsZojAUfPswAIablWZjIfRVv5kJ0oKDAAnqw50c+FoosLGf/RnMlmahCweHWu85CeB2etnt6ZjqRcmcn+XelDh/PdHTQKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=CAtZspyb; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="CAtZspyb"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1f70fdc9644so4721905ad.0
        for <linux-staging@lists.linux.dev>; Sun, 09 Jun 2024 22:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1717998547; x=1718603347; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xj03Lghk7aCi7Z3Zu4OYL3dwtA/ZrHc3Wn8tP+DcNp0=;
        b=CAtZspybmg5z2yew1G9XZ4VS9sfFtJV1On5fS7amykcwxpHNHFMR2oHFQr9w8cnD2U
         65PF9Ogr9tdAY6d8qJZymldB+Wi+KIUhSFQ7AxMJF/hcrnjA4Z46zrZDsPGNw0RFcHmp
         70dd7/w4Td1YTPv99jrhz5WiWmAoiEztS4+/EYUwpRfxq49a4sbU3y4VkbaqqR4YF0bC
         is5aX+H/DEQOAgx2zkih3JraNWFrvsbsGjtwgafGaI9CBMWTzl5Awmhfcuug5dv60HGW
         gNhfClvDj+vyBYWC6H700jXGF9VM+SPKNJ5AgSxSLQNuZhWDT4tgW27YNhaYHBq9x3Jj
         pijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717998547; x=1718603347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xj03Lghk7aCi7Z3Zu4OYL3dwtA/ZrHc3Wn8tP+DcNp0=;
        b=vbws0Be87lXxFcneGRM71ncfYWfBImWJ/PWdqRq21+Ay9DLc/0qVYGxovG0BMOjLhU
         1GQHdUhFgWibtKtiglDB0UWTPeCPYfDsMMtMfiqgNbF8hnDuco5xYAj4O0cfSMy7Kg9Q
         1aJ41kVqmz2TCbAqHItSbCGBCgxCMtupZgBZBATvKiWQs4WA+MOlK7n8AINwJhAftleD
         uxCHohHp0n3fRKcAug0mSLzGKbQqyrgKGs+WC4Yyp7R1RfXU286YadNJC/HeA5RF58H+
         v7YV/qW0seceVyPjiQJc54tSQN9ISoWFr0VHN2hFra+5l4CO4FL3E6VKDs/PLZAzjGQK
         cGAA==
X-Gm-Message-State: AOJu0YwDw6H2/phy+VgNKuLFydDNC70cfnvYxR+biqDO6Ny8mr8YDYBU
	OKSl0V2cbsf0MFIReJjIpsUalEb/ctJjiDDz20dEQglZC45r5u7JAXWgbmtYNHU=
X-Google-Smtp-Source: AGHT+IEdIFrUi1SB4KfUecvJof2mg/nNWUE4C84XnTKIMNmv4LnAeg4dzy2jRLqRbO4Qu3APpCNCng==
X-Received: by 2002:a17:902:c944:b0:1f6:838f:c710 with SMTP id d9443c01a7336-1f6b8eaabb8mr157632805ad.17.1717998547184;
        Sun, 09 Jun 2024 22:49:07 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6f1aced64sm35653725ad.9.2024.06.09.22.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 22:49:06 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 13/24] Staging: rtl8192e: Rename variable bUseShortGI
Date: Sun,  9 Jun 2024 22:44:38 -0700
Message-Id: <20240610054449.71316-14-tdavies@darkphysics.net>
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

Rename variable bUseShortGI to use_short_gi
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 drivers/staging/rtl8192e/rtllib_tx.c           | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 8dec4e1b89b8..f38d172ddb4b 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -859,7 +859,7 @@ static u8 _rtl92e_query_is_short(u8 TxHT, u8 TxRate, struct cb_desc *tcb_desc)
 {
 	u8   tmp_Short;
 
-	tmp_Short = (TxHT == 1) ? ((tcb_desc->bUseShortGI) ? 1 : 0) :
+	tmp_Short = (TxHT == 1) ? ((tcb_desc->use_short_gi) ? 1 : 0) :
 			((tcb_desc->bUseShortPreamble) ? 1 : 0);
 	if (TxHT == 1 && TxRate != DESC90_RATEMCS15)
 		tmp_Short = 0;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 4abd01ff3d21..33bb1cbb525a 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -112,7 +112,7 @@ struct cb_desc {
 	/* Tx Firmware Related flags (10-11)*/
 	u8 cts_enable:1;
 	u8 rts_enable:1;
-	u8 bUseShortGI:1;
+	u8 use_short_gi:1;
 	u8 bUseShortPreamble:1;
 	u8 tx_enable_fw_calc_dur:1;
 	u8 ampdu_enable:1;
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index bb8ffedaf9f3..56510365f1a9 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -335,15 +335,15 @@ static void rtllib_query_HTCapShortGI(struct rtllib_device *ieee,
 {
 	struct rt_hi_throughput *ht_info = ieee->ht_info;
 
-	tcb_desc->bUseShortGI		= false;
+	tcb_desc->use_short_gi		= false;
 
 	if (!ht_info->current_ht_support || !ht_info->enable_ht)
 		return;
 
 	if (ht_info->cur_bw_40mhz && ht_info->cur_short_gi_40mhz)
-		tcb_desc->bUseShortGI = true;
+		tcb_desc->use_short_gi = true;
 	else if (!ht_info->cur_bw_40mhz && ht_info->cur_short_gi_20mhz)
-		tcb_desc->bUseShortGI = true;
+		tcb_desc->use_short_gi = true;
 }
 
 static void rtllib_query_BandwidthMode(struct rtllib_device *ieee,
-- 
2.30.2

