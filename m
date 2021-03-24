Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE3971
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 12:45:11 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id b9so24320463wrt.8
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 05:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EZVVyZOq1mXDjnDGqzyWzhx241Hm8lUZWI2lwxaR8MA=;
        b=NF9DQ4WShNUkbUoN8ujXsYLIKk183whRiIbITzW8g+gd6O3wuaUExTXsm/7N3J84Np
         NBX66U0fhN71VQ+RMWTaNSyMf/lMM/t0xhhdtA1gETggenLEExm4ZgTYLQan5QfyjzkO
         YMt9gFxZka39RkOUQaWUHiWDOXDtKK1iZtDF743wrpWRV51W9jYGkw9ibD3ZeTr98aBC
         SYLRxvmtskGXZXWtpGESjpRWvADRIQE0OepLKmvqFE5AtazW9xzmgFdfg84UEXetNdVa
         5RW99XmMC8qSbhO+fikekRjge/86j1VPDizZshs+ggungVtKNipWaaQbSLG8h2h9QuhJ
         P+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EZVVyZOq1mXDjnDGqzyWzhx241Hm8lUZWI2lwxaR8MA=;
        b=uccySY4LPgZBcrcrqdZG2UKlZD2VInwm+kftz2pFbUbQ9vELJmq39UnMQz+Y1cYmHf
         MMedCpPxdpcH0Dzo4j72eeP+BKug2VUDC29EaGOXziTWGzol0EnBtSz+VZUcbmlaXe2d
         MPvLiHT68E07xLG1H25dgpIc6qn11F6U5E4civ5MVSeFTLU/lf3oWH1DCP95kKGN9tJT
         V2B/lEeBmmop8EjWMiP3J9QEU0HRbXDKo5bVNjWjG/JPVs+5GEVi5zhlmga+c+HDZbpP
         avsaaNBc/ERqkp26/7jRLk09QhVJxaqT7Be985j1iOGLeNaYoJhdA1PpbsWuCC/fijtZ
         DBWw==
X-Gm-Message-State: AOAM5323mYNSk0+q5mTn4W2v7NDJ1b6Cczj3Xf7fr//CAyR2Lb6+Ds2H
	Be7LkL8NA6T5rr4fuRmghh57PKj0Gsw=
X-Google-Smtp-Source: ABdhPJwdvHN0IUspf3JNUX2hliaCgk+X797GLyGwA63JiqkqGffLwEDb70ssWYl2FtorUxFrIF7cQA==
X-Received: by 2002:a5d:4bcc:: with SMTP id l12mr3354527wrt.343.1616589909776;
        Wed, 24 Mar 2021 05:45:09 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id s20sm2324005wmj.36.2021.03.24.05.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:45:09 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 25/33] Staging: rtl8723bs: remove named enums in rtw_efuse.h
Date: Wed, 24 Mar 2021 13:44:48 +0100
Message-Id: <20210324124456.25221-26-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324124456.25221-1-marcocesati@gmail.com>
References: <20210324124456.25221-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum name in
include/rtw_efuse.h:

	enum _efuse_def_type

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_efuse.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index 5bae46ecd9de..5938a6bfb573 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -25,7 +25,7 @@
 #define	EFUSE_WIFI				0
 #define	EFUSE_BT				1
 
-enum _efuse_def_type {
+enum {
 	TYPE_EFUSE_MAX_SECTION				= 0,
 	TYPE_EFUSE_REAL_CONTENT_LEN			= 1,
 	TYPE_AVAILABLE_EFUSE_BYTES_BANK		= 2,
-- 
2.30.2

