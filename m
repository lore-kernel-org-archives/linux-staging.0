Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE8B74BF8
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 05:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717998554; cv=none; b=S4u4d0UlsGF+L7RCn/FcpcDyuFfKjp78P5ohTrwV90dm2HY2WxyKkYG6hTQDdV17713Y/SiGVNUjXUMHJG+BpwcU5AfCNghO8nmJbQBjxNWHgdlMxokbvil4NJVZTNM11veMs4ceoAnCBEA1Nm5uPy2ritGmem8NOYP2KnfL7GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717998554; c=relaxed/simple;
	bh=LCjGqj7+UkAPy5TAK9k04YQbrrrP/shMwMEy3xeEgy0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mG1kPwsveEAWZoJMsCEiI6g1LGq4s2xJVFBcXuRx+Ob0cbGObBdgTyuyRSlVTHbCvN8tRE+Os6mf0tghIowCRJNik078OLaOtSL/mWwNupTbwcf6M3jQ2kFHTnvnhK/ruO/lhV6IWJr/7APxmG+U/IL8W9b2vRd/SH68GtbevBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=F1kxvNzh; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="F1kxvNzh"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1f6b0a40721so29515235ad.2
        for <linux-staging@lists.linux.dev>; Sun, 09 Jun 2024 22:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1717998553; x=1718603353; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cpjUTHO5n6hg3Nd1Sv8NIxKg+3sBo8Tuyt+QjDrPig4=;
        b=F1kxvNzh3SSI9mu3YFHBLoGKvNWXHS57NY1wuqkVcgMsPLAx61F/05Ju8CepPPtDry
         wxyfQwuSQ7Ep7jbMttFUiN/BLuu73gdocDcRhoBJpYrQT5gSG3+zR+nlWDdyKsQd6o7K
         ebmKvhX56TLfA9S2hSyK2l6vSO7gMpl0tlW6WGYzY135a/80OrhH+YgAX23LpqF/b411
         WhJsxPdHRT+nQuQksznirc92LURzNw2mnu2oTd0bdGDn+evm823g+JLQktXNopJ10yPP
         HyS+OUidQ77z3H6YBGSAqaODaBl9GW7ObPL2pLiTCMmbA5Jet8O8TYoRbsvIGi+A2qAA
         636Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717998553; x=1718603353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cpjUTHO5n6hg3Nd1Sv8NIxKg+3sBo8Tuyt+QjDrPig4=;
        b=GVJnFRfCh3dfuMWtQa+5BiH95n8Is/lq25k2BuT78gNM3NSTeaWyRCfu9RDnanQRWW
         eclOjA1EkfanUmASkhQL3VFycuo3LgeTHaKO1MPvo8X8uUtY41/NI8y7TTtm9dZ5g836
         TOegaoVwqDI6o1olmdaCYSJoLeHf9uEiqcQ3HVLas1ZL4oLmN0aIPvNrYsNGGvRtMb0h
         FWYV4Eg2W3hlWJqhc/3PrkZn4nTougz9AL+cbADylzoW28M2xX1BDY9t2nLQXorXoHSF
         AXM9xFKCXQOGZDrPTqec9R1YYCzyNzKz//+QXGWKPXpvhgxCtu/0qXfQrJW1HRAb4xBE
         o3sw==
X-Gm-Message-State: AOJu0YxXZ49GQiXjJdGaHBLCGDsLsYu1q6nsj3QWgMYGw5FHMnM3IIbU
	a3gSyPHzHLXYMTwLuOhsviH5vdhfnyi+3BEVIDTRWmA8ftDNEi1DjM5ictFvy0k=
X-Google-Smtp-Source: AGHT+IH5RL0UeWdqB9thxy1mhrwnDm4kB1mjJw4jkUwMCw1sbPJq5hkYpHjG7aHf7t5UEyT3u3nM/g==
X-Received: by 2002:a17:903:2286:b0:1f4:9759:b226 with SMTP id d9443c01a7336-1f6d0377381mr102533205ad.52.1717998552969;
        Sun, 09 Jun 2024 22:49:12 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6f1aced64sm35653725ad.9.2024.06.09.22.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 22:49:12 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 22/24] Remove variable IsAmsdu from rtllib_xmit_inter()
Date: Sun,  9 Jun 2024 22:44:47 -0700
Message-Id: <20240610054449.71316-23-tdavies@darkphysics.net>
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

Remove boolean variable, IsAmsdu, and code which does not
execute because it is never set to true.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_tx.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index deae90640e90..eb1668458e30 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -539,7 +539,6 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 	struct lib80211_crypt_data *crypt = NULL;
 	struct cb_desc *tcb_desc;
 	u8 is_multicast = false;
-	u8 IsAmsdu = false;
 	bool	bdhcp = false;
 
 	spin_lock_irqsave(&ieee->lock, flags);
@@ -648,11 +647,7 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 		ether_addr_copy(header.addr1,
 				ieee->current_network.bssid);
 		ether_addr_copy(header.addr2, src);
-		if (IsAmsdu)
-			ether_addr_copy(header.addr3,
-					ieee->current_network.bssid);
-		else
-			ether_addr_copy(header.addr3, dest);
+		ether_addr_copy(header.addr3, dest);
 	}
 
 	is_multicast = is_multicast_ether_addr(header.addr1);
-- 
2.30.2

