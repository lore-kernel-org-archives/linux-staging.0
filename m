Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9970B71B48
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 05:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717998553; cv=none; b=M0bHkhFMmCezO46Kd1YZr0qi89s8uZJKgioBnky5dcc44OV0My22e8eKbdsSEoCtrIueApfbmTC87IzTwP+HHZou6Eu7cftwmcQoSZvUXu/LxGmoSwLhTluSFY+rpG71+mC0vwI/YtjU+Tur/D5gphp9NAS9K8dK+SDJG5ZdHzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717998553; c=relaxed/simple;
	bh=ve3KFxH+K9wQH/GyIYM4nHXWzVnbDUe10k+8QftzC+Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q0Mt5hBbXjV5rccI7zC6Bre+TTaLSY0GC/GZGPMVIiEwfTyTX7VNfoFlRCvtVzOn9AGhIoN0t7n8ImEIWxQO3GcGRxbC/hZloQuOE6YozoRGood+XBkvwWnPC2HEifBC/GMTDS3oef7tLGSHohADU3n0nKj5R/jyjIypMCiQ3so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=JS2q1Sfq; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="JS2q1Sfq"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-70435f4c330so583811b3a.1
        for <linux-staging@lists.linux.dev>; Sun, 09 Jun 2024 22:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1717998551; x=1718603351; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pKMOHjX0dBFGTbHN1lyyqgytPIEy01BtwR9BPVPAbQg=;
        b=JS2q1SfqUfAoaUbP9vAqgOJMeupRcbwEcdoV0wfY/bW/A2dhBnvkr6Rsth3tH5I4Nn
         BZnqOxGQvWJBSv4Tm8BOZiEnRO7idIx0n3dMzqpxBzaIO7SmuGbmqrgl2K2U8Mgjxjoz
         UBKhZvJiiPxJNhxKX4+amof3CAVqza31N5AXdlVB7ASno58D3wsuXoJPjSKO+5wMF3oy
         aegsNvcAtRS9aPnFqO0evkQeKajl7jAzImOvtfiMgAl6nNNEAfEp9ExrIwgr/2nkLGFH
         F3/PBcWqtNVfwYl8s7hABjyRIaJbbJSVotx0UEZUkqNCn0dVMhPXLa3ij5oImb/oUqWO
         hGAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717998551; x=1718603351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pKMOHjX0dBFGTbHN1lyyqgytPIEy01BtwR9BPVPAbQg=;
        b=NUHNCBd1zdpteuz3LbttuhTvh6XNz6WsSEZ1/DtyJLyO1EQgwCcZW0Casix39tothk
         7HqwLrCiu+0YhBYADwNdUZZbJ3haHe40uU95MiOoiuXg07HjrtmaXzkJYyslzvsahde5
         ZCPJNqNPkciId8dAPIk3B3vpWoe6QdOufrCptrmbKqHdF6dZPwxqCvk4XBrxvTZFa9M9
         E/sYgBhmEoVbuFuI28l4RkIk2AuhZ8KON6oZLrUdfa8NVKXabUcDaEnnI4CZpiWIYImw
         1L161Jc07S+YNTgvvpB4dPmJbg3SYAkF8zKivzbSxma/cdiynt32XGCNb9XTZDnmu7AI
         NaAw==
X-Gm-Message-State: AOJu0Yy+X4Cc8kG9XqWl7LQObAvfkNun5VLgqxuSIISf4pYjVTeaA0tf
	3FXEoILPOR+k0AATATemToh4msIbAMMwARUw8osS0I5wPmz5Ca4BEaTeL6LCiRU=
X-Google-Smtp-Source: AGHT+IFdJkBBbrTjtUiZ45juFBZV8I1iEU2B9aJnyUWuXWICiASrR3IGShacvrduuXuODFCa5b3DkQ==
X-Received: by 2002:a05:6a20:6a2c:b0:1af:cecb:b64a with SMTP id adf61e73a8af0-1b2f969ed90mr7481115637.9.1717998551011;
        Sun, 09 Jun 2024 22:49:11 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6f1aced64sm35653725ad.9.2024.06.09.22.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 22:49:10 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 19/24] Staging: rtl8192e: Rename variable bUseShortPreamble
Date: Sun,  9 Jun 2024 22:44:44 -0700
Message-Id: <20240610054449.71316-20-tdavies@darkphysics.net>
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

Rename variable bUseShortPreamble to use_short_preamble
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 drivers/staging/rtl8192e/rtllib_tx.c           | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index f38d172ddb4b..46e42fad5834 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -860,7 +860,7 @@ static u8 _rtl92e_query_is_short(u8 TxHT, u8 TxRate, struct cb_desc *tcb_desc)
 	u8   tmp_Short;
 
 	tmp_Short = (TxHT == 1) ? ((tcb_desc->use_short_gi) ? 1 : 0) :
-			((tcb_desc->bUseShortPreamble) ? 1 : 0);
+			((tcb_desc->use_short_preamble) ? 1 : 0);
 	if (TxHT == 1 && TxRate != DESC90_RATEMCS15)
 		tmp_Short = 0;
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 0029e4ab4394..7c010534af52 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -113,7 +113,7 @@ struct cb_desc {
 	u8 cts_enable:1;
 	u8 rts_enable:1;
 	u8 use_short_gi:1;
-	u8 bUseShortPreamble:1;
+	u8 use_short_preamble:1;
 	u8 tx_enable_fw_calc_dur:1;
 	u8 ampdu_enable:1;
 	u8 bRTSSTBC:1;
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 183a3897687e..f6525256298a 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -322,12 +322,12 @@ static void rtllib_tx_query_agg_cap(struct rtllib_device *ieee,
 static void rtllib_query_short_preamble_mode(struct rtllib_device *ieee,
 					   struct cb_desc *tcb_desc)
 {
-	tcb_desc->bUseShortPreamble = false;
+	tcb_desc->use_short_preamble = false;
 	if (tcb_desc->data_rate == 2)
 		return;
 	else if (ieee->current_network.capability &
 		 WLAN_CAPABILITY_SHORT_PREAMBLE)
-		tcb_desc->bUseShortPreamble = true;
+		tcb_desc->use_short_preamble = true;
 }
 
 static void rtllib_query_ht_cap_short_gi(struct rtllib_device *ieee,
@@ -440,7 +440,7 @@ static void rtllib_query_protectionmode(struct rtllib_device *ieee,
 		goto NO_PROTECTION;
 	}
 	if (ieee->current_network.capability & WLAN_CAPABILITY_SHORT_PREAMBLE)
-		tcb_desc->bUseShortPreamble = true;
+		tcb_desc->use_short_preamble = true;
 	return;
 NO_PROTECTION:
 	tcb_desc->rts_enable	= false;
-- 
2.30.2

