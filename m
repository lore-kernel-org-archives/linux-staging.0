Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41B519EEAB
	for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 12:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722342877; cv=none; b=h0bIWdtyjJuBbKOwOZ8ceWTX/UxaCTN/zlzwkXNseNPl2EaWKNEB0+IJu+Qy+CH6rsMFCB0IcP23piOpaw4NkpFbf4rOEHcwhB+qnJksoHaLT4uFlg7Du9Y0TLDLa56SIFyMYofUtxQoj/H8Wy3kGvPEFDZQRjlJsgn9i2Bq8WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722342877; c=relaxed/simple;
	bh=AheSok/set++hCKnCB869atTXJwLL5hA18wRr7jK5wM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hm9pkgn7TaTqj5IxzD0rYNz9y3G5A8Ikvdb3MYQADS6NIzfBIsSKptjQRNtW3fApsABDNmHYet4y+jyrehwQ/XMEmSL24yoM0zbab4mY5udU5N38vnN7iWaU74uoK7SeRKqPXDLvISk3lIULRpSVa5g2Ie05OWPgY2KaxcEiRTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Whc/Fkim; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Whc/Fkim"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-710439ad77dso270931b3a.2
        for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 05:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722342875; x=1722947675; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9FkvLRq3+TTTPGRtqPvtfbmioR0sEJjLCE36JfFewt8=;
        b=Whc/FkimmVCr+FORVeiiMfoMhPj3mp8HbIf7Ex0vd9T5nP9DCqIu9AAQgqwZYbuqOP
         NyGQhfb+hW6x/jMD25XhRy0PFvD4kEii3gInEl10Vv9Wn3LHGRxsVGszY0Q7aaOzoE8R
         p36+ga/0kZyxuBrvxelATYVxHvQuOtDS633yCw2T2b49h3WcrS6wMu84hqLX9Yvj9EsO
         bSWdmXpzJhPW029+I7jI8H8CNBSU8nBR1Ugh8Gi3SS8o/xcZqpz63iGTwS/IOIKuYj8c
         6kRLdEmQt/Cumw6/oh5lP5pkKfGNlu3v1hc5uBKja/nA8jYxSzhs6AHLzxAkWeon2uUO
         xVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722342875; x=1722947675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9FkvLRq3+TTTPGRtqPvtfbmioR0sEJjLCE36JfFewt8=;
        b=ftmVuFsB2WT1RSWMhM9pJVzfnjTBVvUizesySsstJ9HQHmN9juZzxNA3Hx4VIKepC3
         9ihB1D4iOs8gHRZhXypBlxtrtJwqwiTLPj2QQKGYKkfGK2GJQhLRIchNfUT67cwa+HH9
         +Hnjk9TulWZ6N2z2K++IR+AlQLLg/BWMcBLygyXsnFY1JnR8MCTrfIZ9qS+oZGGLumo2
         Pmlpx21oB6ndpm1a6tGNevTCKJnZk40LTH61v0UXpOk1ChBuf7agLkjbhoPDSFh1A34z
         wZkDTkn/2iAFOOHp/qDrcf40Iu2JeC+E3Ux5h/YaRwttmN8vdQXSxDdLXAtwH5D0Ui/4
         vgtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBG2EdlltYjfuexSZ297oFXBajHS6FVEG+NkcpbvmbkTHa5tgMWsoBLjgMX//xd7BVWM51XhFwPzPJJ8S+IPdZNoMWwsKF55Gio8SBOA==
X-Gm-Message-State: AOJu0YyD86pugBUYQZ4EREY0PvIhetJL9hN9zPOd8QkpS6nB0npQeIdB
	fGvevmNdKf31YC5YWMtzUP9mHvzqLnc6rMz5kg1kQfTBqjqAIu69
X-Google-Smtp-Source: AGHT+IFvi3GdNcRIqS1egTY+BzvncDXNjUQwpDv4dZG9nbzXHJ4oUtfATQIpv9400XAbcO3JW46ZTg==
X-Received: by 2002:a05:6a21:7892:b0:1c0:ed80:6e69 with SMTP id adf61e73a8af0-1c4a13a35fdmr9106158637.39.1722342875290;
        Tue, 30 Jul 2024 05:34:35 -0700 (PDT)
Received: from localhost.localdomain ([211.171.34.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cf28ca1058sm10511890a91.31.2024.07.30.05.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 05:34:34 -0700 (PDT)
From: Kartik Kulkarni <kartik.koolks@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	akari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: ~lkcamp/patches@lists.sr.ht,
	helen.koike@collabora.com,
	kartik.koolks@gmail.com
Subject: [PATCH] staging: rtl8723bs: remove space after pointer
Date: Tue, 30 Jul 2024 12:34:27 +0000
Message-Id: <20240730123427.37339-1-kartik.koolks@gmail.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch error "foo * bar" should be "foo *bar"
in osdep_service.h:105

Signed-off-by: Kartik Kulkarni <kartik.koolks@gmail.com>
---
Newbie to contributing to kernel code
---
---
 drivers/staging/rtl8723bs/include/osdep_service.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index cf96b5f7a..d6d651342 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -102,7 +102,7 @@ static inline int rtw_bug_check(void *parg1, void *parg2, void *parg3, void *par
 #define MAC_ARG(x) (x)
 #endif
 
-extern void rtw_free_netdev(struct net_device * netdev);
+extern void rtw_free_netdev(struct net_device *netdev);
 
 /* Macros for handling unaligned memory accesses */
 
-- 
2.20.1

