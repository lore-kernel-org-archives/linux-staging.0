Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EB682C8E
	for <linux-staging@lists.linux.dev>; Wed, 12 Jun 2024 03:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718162574; cv=none; b=KeKIWBzuNGSnKe9dIHojtVJb2/2qN5QkjhLtv5S2rxw+M7Hxs8tvqqd+kODSbffWUVm6xRDLJW4gUUuzTgpgpi/zI6iqhUhA+fouxFg9rcqfdJWDwAvE9U8YoNKZ2F/hKqO2FOmV/A7N5tFkreekQ1Ez57DRET1/hh14j92wROI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718162574; c=relaxed/simple;
	bh=a0AR5YGMHIOP52fU6nssMemSeg/SfHbIA2c8V//RH98=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DIBKrzofjuKUpWXceL7dKaTVLZGZhz/ZyI76/JUBvC1BwzAhrMAYCBQY1NqI+KwIStPlNzcxuyeyw0pLTcTxh3EOZyk+O/FOMNlnKVVfdmdTeDaIPWcw4re/w8mH14B+fhoDUa9VlHeWcIXvOBuzjf6mB86XDuj+Swo6ntuPgyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=SLj8TmiN; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="SLj8TmiN"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3d23a0a32afso538405b6e.3
        for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 20:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1718162572; x=1718767372; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MbK3BP5tI5o4/49SrdtlAw9SnoV1ioIONkhc+yAhOBo=;
        b=SLj8TmiNDpudv6auTMq9Za8LzYlWp3yajqyAdDj6JaBOOoOfiyYB5DVVBJLbD2k/GI
         rZV64nQX1wqz475uYXpgglJDfUGePQfNNeRZ7p03JWb7qF/mzFIY+UWva5aoHnnR12ft
         t+nmdR6MRsDg+FmkHhuamiWOCexeWRx/Oo6wHme4e2K06BwBGeIuwiGAV8TfeCMmumw0
         aUQtEw9OgJkMKLInJyOWtyqk73i+0bt7jiVoW7isbr70chvq0MHHKXfqlkESSPpUfxIl
         DEWLFmaJYualEirx6hden9PJ8ul9L9FGaP5au4ttCbfjlATeuSSqPm8qJnpWHGbmAEwQ
         82+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718162572; x=1718767372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MbK3BP5tI5o4/49SrdtlAw9SnoV1ioIONkhc+yAhOBo=;
        b=pqNSgiMG7vPHJvj+6XNAebF4SoSixJMl80T9kCQgp2WMLOf7RNk6myc0rTBW/fLH1+
         fBeejGGzDzKtIaCSN30+Cf1tlNqrjvjQcJvD/IKlF/j9nhKOx1oCdKdf8mC23xbKjcB9
         n0ZqqbcsWFGwgWaO3BXSXrkfoHFq0NN12tGHS3sROdNm2tC+67fddxpgbayRXveoMxir
         pRnMcOynXVXIiz7nfH2xvaSczm7Iej4t6jf1wj71ujeSIq8FK9Kn88gs5kEElWhw65rT
         pKB5L2s4stBKzv4cd5lAVcVQ8lzhQzteJdwe8FwkbGZEXXY0ktephtd154AxAS5ex2ke
         ppWA==
X-Gm-Message-State: AOJu0YzN5ygJPJxaCqPLdJv8D6ziqRSA+W/b9zWU2dH35X/70DoTd2SM
	4HmWBxJyUBa9xgV0RI10XLYxAw003PoHDGZHH4MmbKa7XL7RB3rlRNAS6mMiEcw=
X-Google-Smtp-Source: AGHT+IGS438Lm1LZwydy3UhOIIMDpANz2Yfv5F5W81izEj3Zx99F0lRsPMzouhO+ihHx5LfZroGGdg==
X-Received: by 2002:a05:6870:7248:b0:254:930c:fa08 with SMTP id 586e51a60fabf-25514c03a65mr735213fac.12.1718162571800;
        Tue, 11 Jun 2024 20:22:51 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6e8e8a84949sm5635411a12.32.2024.06.11.20.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 20:22:51 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 22/24] Staging: rtl8192e: Remove variable IsAmsdu from rtllib_xmit_inter()
Date: Tue, 11 Jun 2024 20:22:28 -0700
Message-Id: <20240612032230.9738-23-tdavies@darkphysics.net>
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

Remove boolean variable, IsAmsdu, and code which does not
execute because it is never set to true.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: Update subject prefix with 'Staging: rtl8192e:'
 drivers/staging/rtl8192e/rtllib_tx.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 9a9bd8450354..2f5005689a36 100644
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

