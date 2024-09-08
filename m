Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EFE17839E
	for <linux-staging@lists.linux.dev>; Sun,  8 Sep 2024 19:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725823610; cv=none; b=UDj38RKGJ+3LCmKwK7tzWc/Yn9thDQELUbiOrmgHhdcX6RVCABfn/6ON6GOxhVoK6mb1l9Xi93S04sQsxyABhF3GYJ3dneVSOk18NJ6UQizPa2prIJhF6ya2vIaamQG7QkeC4WiWCfTIkf3iKjyvTo8bZNDg88dFcN5rxrZX54I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725823610; c=relaxed/simple;
	bh=QOJK5XCFnUgF4GgLDRGGWmBcTIrKAWOlHImOERfob9I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NOMZgK8aBB4t7HaqDCjRiENjYL/pSDBDcLMdVdwHc4iB67BnElt8CQ1dzOCYIywIKGkANKmlkPk7ej09ELkSAyM95PfPShyWzrchPMhoQB1BZVMkl+yrfbvPN6NSdxDlBorSt9G2bWJ9z1aSpUE/mHtu5Lt7inRv7v3LeGiQwDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=kOYfEHzQ; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="kOYfEHzQ"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7d4ed6158bcso2582034a12.1
        for <linux-staging@lists.linux.dev>; Sun, 08 Sep 2024 12:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1725823608; x=1726428408; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=by6Pfc3Lz7+BT06vS7vmVqgE+mV643pZhMGdpE7msFg=;
        b=kOYfEHzQxGyYfJDiB2Wiccgj3ROnY3sj2ToL0x06yz1fgd8mhF4xzZufvOeAtul7Ni
         XtKs4gTeDM5/XQXSN2CviGmjvDuicpoCXLrtdQ/lpyF0yvWMHYV9RCfQEpVaaeUcus9q
         z2RvRFgyaDTGvbi1VdRl1Db2PJyat+CVGoOy9kl4Hui0AnDgYbvQGw/MZ4xQUw3YAIab
         AB7i7xvPhRdhcmw3HinTAqm5YThcgJKBIlgNJlB+Gm0k/glLAD3DL48nVW0qsgMK2Ahj
         zt+9hkGTZDxsobI83WDN91qtlfaUQaQJSMN+46HR8x0uGI/VqGh0BkRy0Yl2hKjplbxP
         GxIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725823608; x=1726428408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=by6Pfc3Lz7+BT06vS7vmVqgE+mV643pZhMGdpE7msFg=;
        b=gE0nD8XJRcFkdWUF9dHIKQJUIGD6Fk5jhj17YR/ssxpvMe04vAn0rJBi7mw+hIgQ6L
         t5gk9IfBbFRA4pdQO/myfotYjdrKUOar8+bRKejoP+/NHG94Z9HNMvieypT0rIhKt80T
         18TvtvEoFufQaPAJHF68crDUVW95knAKkgCSH6Cv5N+01mbQHH2uvQPpWL9wEhc99Zxg
         lLGNKa5Oi3UFvxCu+G8WVlfQmSp82fvulTW6NUO3J98+eHfU6+Acx+gLGYrQT18wT/f4
         JuAMZdbYBSAVIlThykTN/2kWu15u5ctGiVhPlSF2mC+ZaIIOqSTvxsmWugxN3lgBOloH
         UcQQ==
X-Gm-Message-State: AOJu0Yw2XTBzAJYZ4iQgVicSzXtYg9zlC7Pz8RRXNXcXWSZHAQKFKZqv
	cPzpngD7qAwxmHnkbVQ9ZFzVD/+XDIU1uMEwgxSo4Y6NG/8N5fArw8IOAcwy4Fo=
X-Google-Smtp-Source: AGHT+IF0GAwWiGPFMhHa4izSvBq9RDiVdKEosBub1bRKUBYV9DctApLpV695+6Qkw9GxW02kKEZhPg==
X-Received: by 2002:a05:6a20:d80a:b0:1cf:3245:5227 with SMTP id adf61e73a8af0-1cf324553d2mr3042023637.46.1725823608345;
        Sun, 08 Sep 2024 12:26:48 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710e1b085sm22703305ad.36.2024.09.08.12.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 12:26:47 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 15/16] Staging: rtl8192e: Rename variable RxBufShift
Date: Sun,  8 Sep 2024 12:26:32 -0700
Message-Id: <20240908192633.94144-16-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240908192633.94144-1-tdavies@darkphysics.net>
References: <20240908192633.94144-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable RxBufShift to rx_buf_shift
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 6 +++---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c   | 2 +-
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index eab6bbf9f3bf..d25ac5adfc49 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1493,7 +1493,7 @@ static void _rtl92e_translate_rx_signal_stats(struct net_device *dev,
 	u8 *tmp_buf;
 	u8 *praddr;
 
-	tmp_buf = skb->data + pstats->RxDrvInfoSize + pstats->RxBufShift;
+	tmp_buf = skb->data + pstats->RxDrvInfoSize + pstats->rx_buf_shift;
 
 	hdr = (struct ieee80211_hdr_3addr *)tmp_buf;
 	fc = le16_to_cpu(hdr->frame_control);
@@ -1640,10 +1640,10 @@ bool rtl92e_get_rx_stats(struct net_device *dev, struct rtllib_rx_stats *stats,
 		return false;
 
 	stats->RxDrvInfoSize = pdesc->RxDrvInfoSize;
-	stats->RxBufShift = (pdesc->Shift) & 0x03;
+	stats->rx_buf_shift = (pdesc->Shift) & 0x03;
 	stats->decrypted = !pdesc->SWDec;
 
-	pDrvInfo = (struct rx_fwinfo *)(skb->data + stats->RxBufShift);
+	pDrvInfo = (struct rx_fwinfo *)(skb->data + stats->rx_buf_shift);
 
 	stats->rate = _rtl92e_rate_hw_to_mgn((bool)pDrvInfo->RxHT,
 					     pDrvInfo->RxRate);
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 5a4113c97b1c..d43841a9b21b 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -1523,7 +1523,7 @@ static void _rtl92e_rx_normal(struct net_device *dev)
 
 		skb_put(skb, pdesc->Length);
 		skb_reserve(skb, stats.RxDrvInfoSize +
-			stats.RxBufShift);
+			stats.rx_buf_shift);
 		skb_trim(skb, skb->len - S_CRC_LEN);
 		rtllib_hdr = (struct ieee80211_hdr *)skb->data;
 		if (!is_multicast_ether_addr(rtllib_hdr->addr1)) {
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index d8155ea3a002..6cd374a9a955 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -475,7 +475,7 @@ struct rtllib_rx_stats {
 	u32 time_stamp_high;
 
 	u8    RxDrvInfoSize;
-	u8    RxBufShift;
+	u8    rx_buf_shift;
 	bool  bIsAMPDU;
 	bool  bFirstMPDU;
 	bool  contain_htc;
-- 
2.30.2

