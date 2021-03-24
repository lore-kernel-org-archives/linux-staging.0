Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1025F71
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 18:38:56 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id k128so11051904wmk.4
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 11:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/iuAYCkylVx5j5jv0oESLumvsivAdphbpwMNPrf8hZU=;
        b=TakgojBQBHvLxTipjjD5r61M1ruzJzIaPJwRtvckHymPNJ/dW1wZvHekEh03ZxRT78
         kPouQl7+IWC8KGKyZ7KEgxCHXgg68FdiV0NO+TURRE9V2QIjNP7aHPzoFiuGfTQSYC4y
         06PZ7RreUNQz7o9dfQKhwhfqIGYJGOiXjCZiXlhcJtnEyPf7gHUIQGlr2YcWyvDE3YHE
         C+BKB2TYCT8lVp4WJi/3tkyGkaBR7xTllQ9dw90LhV3/ZB9YzrEsx9if0eJ5ZJMwV0Ur
         dpUp+cseBwaJkbsLw8Dg65rJ/TyAWsOWDQezgvAVQSoD0aoOM2WZix/7mqG0PZefyuP5
         Eo4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/iuAYCkylVx5j5jv0oESLumvsivAdphbpwMNPrf8hZU=;
        b=b7trEPOkPs+ShJrSYfF6PZaV2zKvyhRAGpaS8ly1+9pG2ZE8t9ervYcreFKOHwjn95
         eB06P7M0NhN64WUsT2WiBc0gyySFYFP205B7+dtg91/Yef+5y5cG6sGBwTTQWT3l/HDU
         CJGPjsFSxC+j+fvwpkhkG1Q0+PRZcBr+od2dlAz7qZOOlUBx+Shz6g+RRZM6O0DBtRjf
         khI7jTPoz3gtnelvrhD0XqLm6L2xhX/HbHTn63JyQIydak7BHVGkTB+1dl1QDMFuOMHo
         nPJfeHD3dMMAAJkyjDSFUnrqHGy3KtZWdJ1tUUKo3IIj1pDD7rlAXZUbOts5dLlEbYEA
         iFiA==
X-Gm-Message-State: AOAM533ho5RjfaiG3eQp9fA+4Q5vNFmoLvlJeXfn23KYvYHVjU+MVXlZ
	hj1+qTdxyvK9i7nLVhBlKeQ=
X-Google-Smtp-Source: ABdhPJxqXXx4b4n+MZ4fqcR8uknnETul/hQOwLnLVf+S1PduWfnbniz/DAw8FETW88xTDXpep39yhQ==
X-Received: by 2002:a1c:4e0e:: with SMTP id g14mr4141928wmh.160.1616611135535;
        Wed, 24 Mar 2021 11:38:55 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id z2sm4358040wrm.0.2021.03.24.11.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 11:38:55 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 20/21] Staging: rtl8723bs: remove enums in HalPhyRf.h
Date: Wed, 24 Mar 2021 19:38:46 +0100
Message-Id: <20210324183847.5595-21-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324183847.5595-1-marcocesati@gmail.com>
References: <20210324183847.5595-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum definition in
hal/HalPhyRf.h:

	enum spur_cal_method

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalPhyRf.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf.h b/drivers/staging/rtl8723bs/hal/HalPhyRf.h
index d7eda508d04d..fdbdd68edf2a 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf.h
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf.h
@@ -8,11 +8,6 @@
  #ifndef __HAL_PHY_RF_H__
  #define __HAL_PHY_RF_H__
 
-enum spur_cal_method {
-	PLL_RESET,
-	AFE_PHASE_SEL
-};
-
 enum pwrtrack_method {
 	BBSWING,
 	TXAGC,
-- 
2.30.2

