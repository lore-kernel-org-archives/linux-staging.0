Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC7E8063B
	for <linux-staging@lists.linux.dev>; Wed, 12 Jun 2024 03:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718162573; cv=none; b=HeEsIrwiRD7+ql0ScuoGtLmlQ3GkXLFqsaT1IQXdQmhQ0Au62YBT2JqXWWX+cTbS/PNoNkcQpyYcks1U/QtLTHEAXnwbSgZWaOWBF+Iyj1Y8YCwTc7x0oz49Y5w4nT2T/aj3GeHTkG2f9NKEE1c8Lt83e9gHZ9I40gc8x3IGYhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718162573; c=relaxed/simple;
	bh=B6419FpNbp+/aBwLGzQozNilV2BWM00eMrzVMInnBmw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=owDjP54dCHiATTJlg7/ele0zZxxd6hZasfnSq9mp1Mx76HFEhT9Nvf322dMHZw5IDrPxiFU9hsQO3UMRAG3VJlYQXrxJuPco/6nou6XOyWPMMrwXNBe+ZiTOXSouMCprM3sTmUbWIEYkMS6Zn0P5UM+PQ+23opnNk1Gki9uIT7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=hr/jyG7F; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="hr/jyG7F"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5ba33b08550so952134eaf.2
        for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 20:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1718162571; x=1718767371; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IkUXIIgxnRHbQ4O/B4sWA8g/vJGypFpqBBuA1kYA6/A=;
        b=hr/jyG7FFvDfuhpjdVI/ZSxjBQ1VJwt68QMgRByiajth9Y6lb1Y1GDiTc/f1Lq93DQ
         4VyuOh3OQXc9mVUFtDmUOsXVYK7sj6YH7ircSwtDZpPep5Wy7JGNQm4r9SdN6Y2McO4G
         0x+WE01U/ZncUXqcVyWRParIwD7bkUS+vk0Q0bW/T7uv6fNub9PqCS1AFTmVsb1/tfWC
         9sH56Xy2aH3bX1UNDHPr0/cH6ExsE2SmWdltzY+kM7aWYlAFmL/4rOgLC6Bdw4fUQw7M
         YvhdTEJMXKIHW+8JdsY7z3jzfgr04uffIBaQAaQ0OVOjL6g0ihBKoC4VUBQZKaOahe56
         zj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718162571; x=1718767371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IkUXIIgxnRHbQ4O/B4sWA8g/vJGypFpqBBuA1kYA6/A=;
        b=GudkBBZDtQbp87ONvQ7ixIBR+T4wNkFIWqxKmpz0VJRL13ciKAwDzC2N5UBAKKfnB3
         Uq3/UCEoiKcI3wP6hiVfTZCZQWiUNGuzKwXsN5MYbFxdWuL5RQPpbNmQcGnKjOQ8m0p/
         Lc4GZ7qzmReHsc+6FZpPf+O3nJ6NV+QlTBSC1TDTrKIXKqF45SvuVSTHR/JEKMWULUHn
         spTQ5i1aD801b2KS1zIoHdru54LBQEPvkV0lTMPLJDepZ1KUAWU9rv3vTFMfN1yU8cXh
         MOnZnBz1GNg/vcL1U1bdHAXtsYmFn+IsfNCD9BEMRuG+27chHXInZFtUArKr3siWEt36
         sOFg==
X-Gm-Message-State: AOJu0YzUI7UmtoYdHewKe8re2ibj/pJj/PFh7TNxRS0ExWPraP2atARL
	AaVpt+mL8hcm9Isc1KFPiwonKxKFqlUFaxm2LULsq9tqW2fwEbocgYQa8iNPnaQ=
X-Google-Smtp-Source: AGHT+IH79lwqNICQ6D0Z3MD9ooOOiJHmZx/dsVgvZvVnkLxSkBzX3m7OiQRxy640o3aaBXoBFOrElw==
X-Received: by 2002:a05:6358:6f18:b0:19f:3764:3c4a with SMTP id e5c5f4694b2df-19f69d35b19mr86669355d.8.1718162570962;
        Tue, 11 Jun 2024 20:22:50 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6e8e8a84949sm5635411a12.32.2024.06.11.20.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 20:22:50 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 21/24] Staging: rtl8192e: Remove parameter bIsAmsdu from rtllib_classify()
Date: Tue, 11 Jun 2024 20:22:27 -0700
Message-Id: <20240612032230.9738-22-tdavies@darkphysics.net>
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

Remove argument, bIsAmsdu from rtllib_classify() as it is
never used.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: Update subject prefix with 'Staging: rtl8192e:'
 drivers/staging/rtl8192e/rtllib_tx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index b6bf10dc1772..9a9bd8450354 100644
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

