Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E04A3EF646
	for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 11:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777461027; cv=none; b=LfPiEBVVv5VWqZ0aLO26XqNrUQGkHqNq/ze20M1DJ3/rItafFYpj2vcJu0cepjXw7ToDI8hgbtn3huAZYvFW7WW0nFFqrmXPj9U+EWOoxHz+RAb88LSjSI9yZZ0Y9N9z9ingidWvao/EohxH2gtKnXlripFySkekSYQG55sCf/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777461027; c=relaxed/simple;
	bh=gV1m5kJaR+4PFhB12dRHn3Hn15UHY/7B+jn/4mKAuac=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EMN/t2jZxfSxpgswIS0npwCyYzZUd4Yj1wcKYNPymxaqawqd4w+z+ccsth1G6Wma8YQ3FHUeg/7OIUaLGzOD9x8S4E6FhNpw1adR5ajgiCwCuMiz0/r7Kht/F45ytVo2eysSL7jtnzUUPGaa5UPmsxUfGeRzrNYAu1I/8oeEzkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OFe2/O4w; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OFe2/O4w"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so89097495e9.3
        for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 04:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777461022; x=1778065822; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qxyPStcojxHgvpxKVMISd/wfgWnS9k+N27aPIWZ+4Kg=;
        b=OFe2/O4wvUKwv5AM8SUTB6r7fHSiSOXHCFSU32MUBvdo8ofKyrcs88pRcN7AvGLD97
         mU/n3pnEUXh54GUMlQ8ap0w+Lgt7K/ubFUf2Tr8Sogc/e+QRKapJ+4Q1PsjQmHXlgY00
         yjcsfpsttO9pJmhXBLxj7A0gigqXQbs1IQ57FzJWqoJiTyPVSnAqbLpctXM2gqEg1Lk4
         hKabhuujLEKpYDOuD/5MBdSFhAo7EXZSxHps07tWwHt1I6XJJyQn3Qu+bz/hTDVlFpus
         byk8Cuud6oETisT5MWKP5OPYZV40+3K50iY6m7Am2RDKMT28SB9jakaj4WrlhCVl3Oib
         HdpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777461022; x=1778065822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxyPStcojxHgvpxKVMISd/wfgWnS9k+N27aPIWZ+4Kg=;
        b=gyXPZ9jgXI6s4SpunCMmAuxHjSp6/KiGK+wiZ6ZB0LE/IqWXvW19nH7kHn1zuUiWf7
         5+7STWozt+dDtgm4fk2/nczL3crpvv4biELPBwgBbxZik9FJNDWV4bYsWtSHPXPL09C9
         1oIGrjTQ5s4N1uTNW8hs8nYoD/51DGz9OudmTk2Ao5l7vcHD5Gi33/gyOTR5WLET+f3h
         2Fw5gqRBaexJo7AM36jGe+9rub2JxASW9drDHknj0/oWdPNkgNAmIhZY89Wk9diBehr4
         WiitenNZBEr0IZ77kio22d+XLWSfZKwn9YTTXex8nd+7uiKk0q8kWeKJKhSO6+Tx6uV7
         NCeg==
X-Forwarded-Encrypted: i=1; AFNElJ+zWflv6FNgv+RYkF8SOw2QJsb7xADXOGvfjaXxSLCMTHcKljBEDLgu8H60PuORKKmJmkrprXYKKpsBnUgd@lists.linux.dev
X-Gm-Message-State: AOJu0YwbcVI6aUVp2LfMUlPMn3i/pMObXJrYXEcz+n8OzjEVZuEIOxpQ
	cSyjEl6ihXAb0qs6UheFBiMJAeaAP7rsTXjkfxlbRnZrntgc817K3Af92C6l6Adt
X-Gm-Gg: AeBDiesiiGqGr8S+JwjJhbFpoxSztnzQcILqEFVhGaMZWg4sDq2kJd6UI3jdUHuOpDH
	GXCJAQZLGQTmID3h7pBabsoVhA1bEziJI9XfnOCdPYe9ZOfTURPMxFwz9r18iNJYKUToTpv6nPu
	ILrZbzmaOommMLCl8h16Elaz653I9ChH/9M8yrDiuVwbigl8mqiPv1GLC3YI6mKqpyrnr2N1EIN
	wi8GWqBd1InYIBd9Zedqc9Lk9wKksSfvDiGyf3QYjM45mnOdc7RwA8xk4Ifquv4WJ1KSxa6sZuH
	FNGPtXvpQfeRyqImouJOW2w9VfHjdUjH7jtD1oQUoBPNmAciGodYFE/XB24lSFCnzCzSW+FUBbI
	4Q9dUaNg10cLqYFP0b7kddF29wyyAddV1wqnByXFpd3dlHcFjaEXMxbq560WS3pREf/Zigf3XI7
	Jo9tydkYtgV9N1XhQltgBFP/SRa7U63aG0lUgikZEf+YL/94lP29ehFVdl3ju0tefXNCkDO106
X-Received: by 2002:a05:600c:1d0a:b0:488:a824:fe04 with SMTP id 5b1f17b1804b1-48a77b1e893mr120619325e9.26.1777461021482;
        Wed, 29 Apr 2026 04:10:21 -0700 (PDT)
Received: from localhost (c188-150-77-196.bredband.tele2.se. [188.150.77.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b3d4843bsm5047744f8f.7.2026.04.29.04.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 04:10:20 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	error27@gmail.com
Cc: kernel-janitors@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix potential speculative cpu oob read
Date: Wed, 29 Apr 2026 13:10:16 +0200
Message-ID: <20260429111016.1260295-1-linus.probert@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes potential speculative cpu oob read in os_intfs.c by guarding the
index with array_index_nospec.

Fixes smatch warning:
warn: potential spectre issue 'rtw_1d_to_queue' [r]

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---

I can't argue with 100% certainty if this is a real risk. I found the
warning when I was testing out smatch (awesome work on that by the way)
and thought I'd take a look.

I did a quick search on the linux-staging list but couldn't find any
mention of 'spectre'. So as far as I could see it hasn't been brought up
before.

Was unsure if I should prefix this with RFC first.

 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index e943dcea1a21..8eea05111e79 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -347,7 +347,7 @@ static u16 rtw_select_queue(struct net_device *dev, struct sk_buff *skb,
 	if (pmlmepriv->acm_mask != 0)
 		skb->priority = qos_acm(pmlmepriv->acm_mask, skb->priority);
 
-	return rtw_1d_to_queue[skb->priority];
+	return rtw_1d_to_queue[array_index_nospec(skb->priority, ARRAY_SIZE(rtw_1d_to_queue))];
 }
 
 u16 rtw_recv_select_queue(struct sk_buff *skb)
@@ -374,7 +374,7 @@ u16 rtw_recv_select_queue(struct sk_buff *skb)
 		priority = 0;
 	}
 
-	return rtw_1d_to_queue[priority];
+	return rtw_1d_to_queue[array_index_nospec(priority, ARRAY_SIZE(rtw_1d_to_queue))];
 }
 
 static int rtw_ndev_init(struct net_device *dev)
-- 
2.54.0

