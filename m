Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6D033985
	for <linux-staging@lists.linux.dev>; Thu, 23 May 2024 04:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716436804; cv=none; b=ONaQj9isfKATRCeXiXFxlLoj/c2rsh4mVyxKFqB/1W83w2GKEg49q0O5DVaOvejoLpR7TrmUImH8QP+ciNEBtCwpbwJ5jpp+zsHSe0R5E8qegqVRu+xV0HvqcNX7txFtfd6M7BAkxS0z0xOWNTczZ29ORA8uj8ihNhD0fRwX9P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716436804; c=relaxed/simple;
	bh=B2gzviBGjtnYiHgLNjFoKRHvFC2PraWQH9BuIVHuRgs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=syjFJcH77uBEaVW7GyUZp6H9gtoERH1pIzHXOfQN46rinrGSPKwVifFEVyu8KRbtmPACzpETJ0FGONoTt5huF5UlZ3phPTAaKaivnMoUiVapPG7RQqnmQjGKcNHqBlLFliVKBU74mRYKlRzpYR8gv/VNtRbEMkqvT//Nrk3HwAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MT8YWN35; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MT8YWN35"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2b346712919so2711980a91.2
        for <linux-staging@lists.linux.dev>; Wed, 22 May 2024 21:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716436801; x=1717041601; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AYayg9Q3I1iT06AmylVzr/L0YJUgQCxPueqQrQfFEGU=;
        b=MT8YWN35SCAhMuk2ZfQt18W+GBWlzvhPbHNqzAgrVDwWJkSCAKh0mTJ+sQ6VjL/iDu
         Qo9bV4FjNt+VtuIyj3GlKYTy4jfDqbh1zSIzGbApE+06NjxTm4O6TiJ+ejnPhkPdgMWD
         9feA4OXDq8kNPk4SZUYamExmGL4FmtFurho/45BN0N95rJ/fc8Xy4eTszlG3TpIVmZLf
         vVpYfRYH82iZujFKXrN6ZiZdG0/a5IHe7vwxcxzFB1xQquvpCFyR7TIEyRMNZIQVGN3Z
         b9fHkcpAxJ8Lck0XuyjfcbU/bIyI9V1Waz/D/1G4ggx3+L6bx3HCGSRP7R3g257KKvdC
         jB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716436801; x=1717041601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AYayg9Q3I1iT06AmylVzr/L0YJUgQCxPueqQrQfFEGU=;
        b=egP/O419Jqzwmt7U+KBWm/JsuTNpgWj7iPCZkzsMj4PK009jfR8iC6H1fmD1ThikNu
         +5OG9qiLMpnPJf0WvjaUHh3+KkFHAb+PtN0sSv/oz/zyTLhvIMGohJV+HS0Ejeaj34Aa
         znq2EGFzTJGeuztSxIRA+IECsdb96ubpBKezKXFqWX68lRcrShqmhfJLSsylpSI1SK7E
         sndaK+IQM1MM6WuJtPflmO8bFz+fwTJzHsKmj72z2SIlcSBk6B52oFm4klz3mDpgcW7H
         ua0IudXYK4CDwItI+ICf2Y1T+nBjdueDUByunym7eakX9KzorJQO5COZO8vbg4jyvz7G
         TTUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWd8w2EyntYJLXU8FTP8vxMgHEa3k+SNdBjcancQ3CWZU8MSHVVcBqx/piA/tF5kD2D+DvIvUj32T/V1OnEHo88hOW2/0xstaVaaaihxQ==
X-Gm-Message-State: AOJu0YyCaob2pFhWTA17CZE5tPx2Gn069dVNvOWsqU8zrVv8XXc/rh3l
	cmM0x5nOP1oZZRC+S347owcPyRP3pOAJqJhrrOnyq59WnRZN2/Cq
X-Google-Smtp-Source: AGHT+IH6TQ0Tw4CtxyVBxNAKNmaTmFz4jky+RFReIKrb/aCt3QJAjhO29XXhjGVUm4q4gnyIcLAvjw==
X-Received: by 2002:a17:90a:b00a:b0:2bd:83e9:8764 with SMTP id 98e67ed59e1d1-2bd9f455301mr3562356a91.12.1716436801232;
        Wed, 22 May 2024 21:00:01 -0700 (PDT)
Received: from ubuntukernelserver.. ([110.44.116.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2bdd9f35303sm573963a91.53.2024.05.22.20.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 21:00:00 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: gregkh@linuxfoundation.org,
	tdavies@darkphysics.net,
	philipp.g.hortmann@gmail.com,
	garyrookard@fastmail.org
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8192e: Fix spelling mistakes in rtllib_softmac.c
Date: Thu, 23 May 2024 09:44:52 +0545
Message-Id: <20240523035952.59724-1-topofeverest8848@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

codespell reported misspellings of temporarily, possibly, notify and
param on rtllib_softmac.c. This patch fixes the misspellings to increase
code readability and searching.

Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 97fdca828da7..0fc97c868f81 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -421,7 +421,7 @@ static void rtllib_softmac_scan_syncro(struct rtllib_device *ieee)
 		 *    So we switch to MAC80211_LINKED_SCANNING to remember
 		 *    that we are still logically linked (not interested in
 		 *    new network events, despite for updating the net list,
-		 *    but we are temporarly 'unlinked' as the driver shall
+		 *    but we are temporarily 'unlinked' as the driver shall
 		 *    not filter RX frames and the channel is changing.
 		 * So the only situation in which are interested is to check
 		 * if the state become LINKED because of the #1 situation
@@ -934,7 +934,7 @@ static void rtllib_associate_abort(struct rtllib_device *ieee)
 
 	ieee->associate_seq++;
 
-	/* don't scan, and avoid to have the RX path possibily
+	/* don't scan, and avoid to have the RX path possibly
 	 * try again to associate. Even do not react to AUTH or
 	 * ASSOC response. Just wait for the retry wq to be scheduled.
 	 * Here we will check if there are good nets to associate
@@ -1359,7 +1359,7 @@ static short rtllib_sta_ps_sleep(struct rtllib_device *ieee, u64 *time)
 		return 0;
 	timeout = ieee->current_network.beacon_interval;
 	ieee->current_network.dtim_data = RTLLIB_DTIM_INVALID;
-	/* there's no need to nofity AP that I find you buffered
+	/* there's no need to notify AP that I find you buffered
 	 * with broadcast packet
 	 */
 	if (dtim & (RTLLIB_DTIM_UCAST & ieee->ps))
@@ -1806,7 +1806,7 @@ void rtllib_softmac_xmit(struct rtllib_txb *txb, struct rtllib_device *ieee)
 
 	spin_lock_irqsave(&ieee->lock, flags);
 
-	/* called with 2nd parm 0, no tx mgmt lock required */
+	/* called with 2nd param 0, no tx mgmt lock required */
 	rtllib_sta_wakeup(ieee, 0);
 
 	/* update the tx status */
-- 
2.34.1

