Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CD1946A
	for <linux-staging@lists.linux.dev>; Tue, 14 Mar 2023 18:43:00 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id h8so22184932ede.8
        for <linux-staging@lists.linux.dev>; Tue, 14 Mar 2023 11:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678819378; x=1681411378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Oag7SRyOaaDLTQg5hnswCsWRIe6BhWUvxQa3wS0l66I=;
        b=kdC3swFyZDWi5RSaPn88tz9mzktNSOz5/86XDNBqyqZkhQemGxcYz45eV+PlCqfp60
         IuaiymNaOrsf/kVvxHZcvS4H2l8V94LP1kVO+G4lo24GFphuab7u0wGOMOaT3gElTtLj
         /crjxQlN6ZPGzb+FOAX7/NDe86Q3VtndPXKrV/IF1BWK49r8DskmvA8in3nMsGy7jwMf
         yNgcy37P2hv/xJG0PpRDzEbvhC8xLAd9IqIW02RWcjObKvq03/3IwUu0FCz7ZpEYdpfw
         5FiCbHly7uXd7UtZWYagxKOPir2gJAY/V2IaXWrOYzGn6wJRTzxC7aKfK3zWiJonzuu7
         IqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678819378; x=1681411378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oag7SRyOaaDLTQg5hnswCsWRIe6BhWUvxQa3wS0l66I=;
        b=SbpHi7G2p0RXHNJw9xgqwjtYK3p66/89r3nn/eoAubgOnhNywldtSgRroHRBz66Oqu
         h3yCsIcOjy8Em6uvSLyWKH9MbszTyQcKwRs15t5IaRlpK/QeRs+veJX/EZjDB+4IAFPE
         5sPEUMwuCUF1Usjo7SiUu/RKuldiDBgblrTcz5WPZsrNYtHQ1+cIZkd7neBFdyPg4afo
         c//PRyqNrpIubbpmMz9NeSShP7esRLWxRvKiXKrLHpo++F65wy4UXg+5o2u30znIiGEk
         HtVGsYRtOJKkOJ2+cyhx+GTKdkmadXAWojBPljxHtqxhY8ARVoPPi9POs5b7ZTNY1UdU
         Z4qg==
X-Gm-Message-State: AO0yUKVa/mU6SwTbKcL4YDtnPNh68IDe4wCdsEJhcJBegNz7BUfL4T1f
	I2pP3Dsx8ioGtKlIARphnWM=
X-Google-Smtp-Source: AK7set+PtHeCz9gvdn1bo7bVwP0Av7gyhUd1M2UZViQrnkf4XRCK1ajIOKMw+xTEVOnY8gIV/+S7EA==
X-Received: by 2002:a17:906:748c:b0:92d:5cc4:4aca with SMTP id e12-20020a170906748c00b0092d5cc44acamr908645ejl.1.1678819378295;
        Tue, 14 Mar 2023 11:42:58 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id v10-20020a170906858a00b008d173604d72sm1477988ejx.174.2023.03.14.11.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 11:42:57 -0700 (PDT)
Date: Tue, 14 Mar 2023 19:42:56 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 01/12] staging: rtl8192e: Join constants AGCTAB_ArrayLength
 with ..LengthPciE
Message-ID: <98a7553403ef95609fbcb84e4cc653628b96c56c.1678814935.git.philipp.g.hortmann@gmail.com>
References: <cover.1678814935.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678814935.git.philipp.g.hortmann@gmail.com>

Join constants AGCTAB_ArrayLength with AGCTAB_ArrayLengthPciE to
RTL8192E_AGCTAB_ARR_LEN to improve readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 2 +-
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h | 1 -
 drivers/staging/rtl8192e/rtl8192e/table.c      | 2 +-
 drivers/staging/rtl8192e/rtl8192e/table.h      | 4 ++--
 4 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 51a20379dca0..54596982bc76 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -312,7 +312,7 @@ static void _rtl92e_phy_config_bb(struct net_device *dev, u8 ConfigType)
 	u16 AGCTAB_ArrayLen, PHY_REGArrayLen = 0;
 	struct r8192_priv *priv = rtllib_priv(dev);
 
-	AGCTAB_ArrayLen = AGCTAB_ArrayLength;
+	AGCTAB_ArrayLen = RTL8192E_AGCTAB_ARR_LEN;
 	Rtl819XAGCTAB_Array_Table = Rtl819XAGCTAB_Array;
 	if (priv->rf_type == RF_1T2R) {
 		PHY_REGArrayLen = PHY_REG_1T2RArrayLength;
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
index f1d183ed7ca4..d984380bcca3 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
@@ -9,7 +9,6 @@
 
 #define MAX_DOZE_WAITING_TIMES_9x 64
 
-#define AGCTAB_ArrayLength			AGCTAB_ArrayLengthPciE
 #define MACPHY_ArrayLength			MACPHY_ArrayLengthPciE
 #define RadioA_ArrayLength			RadioA_ArrayLengthPciE
 #define RadioB_ArrayLength			RadioB_ArrayLengthPciE
diff --git a/drivers/staging/rtl8192e/rtl8192e/table.c b/drivers/staging/rtl8192e/rtl8192e/table.c
index 7101061e3519..be6c4b7c0e0e 100644
--- a/drivers/staging/rtl8192e/rtl8192e/table.c
+++ b/drivers/staging/rtl8192e/rtl8192e/table.c
@@ -347,7 +347,7 @@ u32 Rtl8192PciEMACPHY_Array_PG[] = {
 	0x318, 0x00000fff, 0x00000800,
 };
 
-u32 Rtl8192PciEAGCTAB_Array[AGCTAB_ArrayLengthPciE] = {
+u32 Rtl8192PciEAGCTAB_Array[RTL8192E_AGCTAB_ARR_LEN] = {
 	0xc78, 0x7d000001,
 	0xc78, 0x7d010001,
 	0xc78, 0x7d020001,
diff --git a/drivers/staging/rtl8192e/rtl8192e/table.h b/drivers/staging/rtl8192e/rtl8192e/table.h
index b6d4e9696452..439847b1f52b 100644
--- a/drivers/staging/rtl8192e/rtl8192e/table.h
+++ b/drivers/staging/rtl8192e/rtl8192e/table.h
@@ -21,7 +21,7 @@ extern u32 Rtl8192PciERadioB_Array[RadioB_ArrayLengthPciE];
 extern u32 Rtl8192PciEMACPHY_Array[MACPHY_ArrayLengthPciE];
 #define MACPHY_Array_PGLengthPciE 30
 extern u32 Rtl8192PciEMACPHY_Array_PG[MACPHY_Array_PGLengthPciE];
-#define AGCTAB_ArrayLengthPciE 384
-extern u32 Rtl8192PciEAGCTAB_Array[AGCTAB_ArrayLengthPciE];
+#define RTL8192E_AGCTAB_ARR_LEN 384
+extern u32 Rtl8192PciEAGCTAB_Array[RTL8192E_AGCTAB_ARR_LEN];
 
 #endif
-- 
2.39.2

