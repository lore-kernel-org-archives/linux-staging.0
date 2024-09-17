Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E11364BE
	for <linux-staging@lists.linux.dev>; Tue, 17 Sep 2024 05:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726551120; cv=none; b=Pt2aBuiRhAKuCawM3Zpni7Nqjaq+eYdnsHNmNp3cfO8qOHLixoTn8JR/Mfd2FUSiOl3HGRaTdsS3tAbeZdZHBlp7RUgavfWkjkHp0jhNODyRscpMYF1nJJTogTxnAJ8LD8nUvcZMPr3yJ6tZf+ZmZZKLiOEKyCyMDrkgQHnCe6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726551120; c=relaxed/simple;
	bh=x9/n3nUCuDoppKmd1upL/WLC6npkIViQv5mk7pLbQAs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gVrFGhgPsp1OpF05LxOA1AJoJpgDzd03qAFOkEtJ8aSDzyrarD7ek6yVhPaqoqTMMwCpfcdNgM0H0AXgcwUFhIpsF2jzjlGfbSDFDsDF9ub8C3u5AawKb0iNT0KU2zXQ746KaZfTL8J7oijFjcLnLDZQ4R1U5eRO8PQlRY9STSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=GQrsvHLW; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="GQrsvHLW"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7db0fb03df5so3927500a12.3
        for <linux-staging@lists.linux.dev>; Mon, 16 Sep 2024 22:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1726551118; x=1727155918; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ScgoUvC5TGwexehGv5u/sh0ZN6ENbtB+PiBjom74qIg=;
        b=GQrsvHLWJyzH02GMx1Q3OKarORbRLXpmgeitwnn3qeKVf0QEOSyon+J5Itm/cQ2lVD
         avDKQlZK6pqHZKjgpdzufuW3uxdEKZsk9c4B7gC/IdCMe0AuFupJu8aHWJVRZwvcnENH
         c3fYzXcLMNa0RhpjTgJSvyR3jPoxz8Ma5VTtJ7B0KMGKdc5tbFhivGOiOdT7xVsTnBWJ
         HlT1CZvdFSKtJ8bQp+cWtZAGA/3CYt7dwWgP9pAQDz6YtgYal50L2KmzHJ4onSmbrkZe
         0Lq/swZFKtPpFG66g+aVJBxl/DInhw+vFcwcgJ3bEZgzx6mN0uPg/dnlBBDQmGSm/DIC
         jauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726551118; x=1727155918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ScgoUvC5TGwexehGv5u/sh0ZN6ENbtB+PiBjom74qIg=;
        b=es4bwrF92Otk7bVzg4mN/AJaMZ40ywFtdK+pfUtcYquiCIa4hlzsbjBI7mx5SOuYQe
         jGcISyKZG/nkA48tX/00fgW0kbLaQex0vBrJ7D2smqUNye3W5KjXclPkMHYbIbgq+GXK
         a+y52pTiDvcrz1LyApnP1iOZtFlSb4ocgeG11uPz4DO0CLb8n2/2gXJmCl7a3RyMl7Sg
         Cj7c4poTYTNASqRUWwd7pT7ly7SfD5yI6p8mC/bYcDVEj/wITpCQ5iGhfX4dal37yzza
         tqHyxHM4TDYSq2Mc0LJN9ENL67gr1WMUUespjjkrbX2qkkcYt6qzw0mvlN8v1p7luOr4
         Pb2A==
X-Gm-Message-State: AOJu0YyQb1xc5wGeYFG8ASM46mRdanVclPJyn7rOI9YnBo8sYDLHaW3j
	opYLYLAzX195ei2xLgNJEuTKHXNIAFPNIUuzJTmcMd1as6XwcJWZHpu3YOqdNFflq1GyOHK/8tR
	1
X-Google-Smtp-Source: AGHT+IFhwkuE2gp/Xsh6U54/TyXvwq6IFCnAFivkMg9hatItSagsZLB4FFEoK2OGhjzy+qXHwAIy7A==
X-Received: by 2002:a05:6a20:a9a0:b0:1d2:e78d:2147 with SMTP id adf61e73a8af0-1d2e78d227emr643812637.6.1726551117803;
        Mon, 16 Sep 2024 22:31:57 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db498e0607sm4392328a12.8.2024.09.16.22.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 22:31:57 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 03/18] Staging: rtl8192e: Rename variable bCRC
Date: Mon, 16 Sep 2024 22:31:37 -0700
Message-Id: <20240917053152.575553-4-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240917053152.575553-1-tdavies@darkphysics.net>
References: <20240917053152.575553-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bCRC to crc
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 6 +++---
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 2000289720b3..8d645d3296d2 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1506,7 +1506,7 @@ static void _rtl92e_translate_rx_signal_stats(struct net_device *dev,
 				  (fc & IEEE80211_FCTL_TODS) ? hdr->addr1 :
 				  (fc & IEEE80211_FCTL_FROMDS) ? hdr->addr2 :
 				  hdr->addr3) &&
-		 (!pstats->hw_error) && (!pstats->bCRC) && (!pstats->bICV));
+		 (!pstats->hw_error) && (!pstats->crc) && (!pstats->bICV));
 	bpacket_toself = bpacket_match_bssid &&		/* check this */
 			 ether_addr_equal(praddr, priv->rtllib->dev->dev_addr);
 	if (ieee80211_is_beacon(hdr->frame_control))
@@ -1525,7 +1525,7 @@ static void _rtl92e_update_received_rate_histogram_stats(struct net_device *dev,
 	u32 rcvType = 1;
 	u32 rate_index;
 
-	if (pstats->bCRC)
+	if (pstats->crc)
 		rcvType = 2;
 	else if (pstats->bICV)
 		rcvType = 3;
@@ -1629,7 +1629,7 @@ bool rtl92e_get_rx_stats(struct net_device *dev, struct rtllib_rx_stats *stats,
 	struct rx_fwinfo *pDrvInfo = NULL;
 
 	stats->bICV = pdesc->ICV;
-	stats->bCRC = pdesc->CRC32;
+	stats->crc = pdesc->CRC32;
 	stats->hw_error = pdesc->CRC32 | pdesc->ICV;
 
 	stats->Length = pdesc->Length;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 08eaa98c0a1a..5bb928d9cd12 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -468,7 +468,7 @@ struct rtllib_rx_stats {
 	s32 RecvSignalPower;
 	u8  signal_strength;
 	u16 hw_error:1;
-	u16 bCRC:1;
+	u16 crc:1;
 	u16 bICV:1;
 	u16 decrypted:1;
 	u32 time_stamp_low;
-- 
2.30.2

