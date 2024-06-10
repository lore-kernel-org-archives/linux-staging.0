Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70407407F
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 05:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717998554; cv=none; b=hsdrQ2Xwkn8RYIihk0klu2bFMypqNqlQOOfN/iGJWUoOuOfhfiQYnng9b2dKQ8PYQM1+ZkxEs0zMLCSgTqJ2bIreF8kQHwIR/1l9DkchSj+rE3jy7129bvE8LdJPbmzyARNn/9gCj3B7ueBH1j/fKeQ3DzCwojmw/lSKIjSYJ6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717998554; c=relaxed/simple;
	bh=TzS+2SyTPi+QEkE8BC594KnimsII7PaWpgUR1Ys+4gE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rLt+Lvc2J34gp/FpM68xxHLoR8x9S93Xo1m9Ju+STI2qD8Ss+zl68RFHbM36OwIl705zmOLQlG4XSP1N/fhtrUMzcBrioTCvun+m1MmziDn/Eo4ufctOP4qZkyt8r00fikWsJxBg6aetrAVpVb+DPUebHHObr+HuhOPeOz0pZJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=McBRB451; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="McBRB451"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1f68834bfdfso29702605ad.3
        for <linux-staging@lists.linux.dev>; Sun, 09 Jun 2024 22:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1717998552; x=1718603352; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EC6Tele6QaEsDWjCYka+sqSIKWFJjEBZoQF3EczNhN4=;
        b=McBRB451QyzDpb6QO565ICPsCjJHLCivIvCqBGaeFpFsvFc9/l75rMRgZRcogALIZ7
         4IvkSuwn/9qmvcwEkd9kjm0z8os2Sq3tQGCEHWyMWUZNdZ7Fc9dJtReqW1PV4ZtfIFwY
         JFzecHGyGGy4IrBynG7HDnQGkarHKWVkg33Mkjr1pLXMZb8SmoQVT16jN32K/46c8jPt
         CQ9OjUPB4RaP+KihnvqxfR1P5gPtlF1138b+s/mL50tYzx2uQ8P+eNvfBlziTbqGuHed
         +bohHod2Dz0n0S4Qo9Axq4KJtP608HAzUCu71vaFJc4bQ5QZnaJ3kAZWVGvLhifDRaCE
         8eqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717998552; x=1718603352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EC6Tele6QaEsDWjCYka+sqSIKWFJjEBZoQF3EczNhN4=;
        b=oDCQuij96QUoedWuj3OwXBgZnzfSvOp1owQb9KexRAgUdKM9N4pujjjQMZpbcPqY17
         xToFuFMzZOWBY8Ij5HonZjoqbGN4BFJrJA/a8H8pgm4Yy9DitpDjSIQGzjDY2CWHyHnh
         rw7Ryl4Av3iMNK4FJN24sctS1xB/scK0qTVxeDYQBcF0iDjtj2d0dfnqW8+CGK6IUiYJ
         /SzSMA/ZxXlfMdJ4Awvz6kmSiqX+hVDP1HmFchyK4Gaj3S7YEofgtmxlJW40GiGSonGo
         KHNJ9JwYnUuRer9o2RobQLKsWwgSUMCzYO2kBemPmasFgC1Fo6AT+P0jkqjyhXdM8j6r
         2QLg==
X-Gm-Message-State: AOJu0Yyw2Qi+VttaRr6Z+a06LD7xMb9mGw5RXLW8HzLJzwf3PJfVfP0D
	RMrtCCnFggiUJ0ujZLksCc8Jf+VIFwZ8LG6es+5QGWcn0znppQGqplgPUCs9RLLEXkN4HrBBVV5
	WKls=
X-Google-Smtp-Source: AGHT+IE4CP6ZfcXnVdl65DEw+FE9wqEhiS8NzeAZeTvZoxRqscmHF4lb+qQVQQqSR7fOnOicRbDt3A==
X-Received: by 2002:a17:902:ea06:b0:1f4:8a01:283e with SMTP id d9443c01a7336-1f6d02cc84fmr98180365ad.5.1717998552334;
        Sun, 09 Jun 2024 22:49:12 -0700 (PDT)
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
Subject: [PATCH 21/24] Remove parameter bIsAmsdu from rtllib_classify()
Date: Sun,  9 Jun 2024 22:44:46 -0700
Message-Id: <20240610054449.71316-22-tdavies@darkphysics.net>
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

Remove argument, bIsAmsdu from rtllib_classify() as it is
never used.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_tx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 841d9960385b..deae90640e90 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -228,7 +228,7 @@ static struct rtllib_txb *rtllib_alloc_txb(int nr_frags, int txb_size,
 	return NULL;
 }
 
-static int rtllib_classify(struct sk_buff *skb, u8 bIsAmsdu)
+static int rtllib_classify(struct sk_buff *skb)
 {
 	struct ethhdr *eth;
 	struct iphdr *ip;
@@ -607,7 +607,7 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 		}
 	}
 
-	skb->priority = rtllib_classify(skb, IsAmsdu);
+	skb->priority = rtllib_classify(skb);
 	crypt = ieee->crypt_info.crypt[ieee->crypt_info.tx_keyidx];
 	encrypt = !(ether_type == ETH_P_PAE && ieee->ieee802_1x) && crypt && crypt->ops;
 	if (!encrypt && ieee->ieee802_1x &&
-- 
2.30.2

