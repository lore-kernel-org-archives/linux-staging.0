Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2B2A939
	for <linux-staging@lists.linux.dev>; Tue, 14 Mar 2023 18:43:46 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id z21so668855edb.4
        for <linux-staging@lists.linux.dev>; Tue, 14 Mar 2023 11:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678819425; x=1681411425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ze6PWDtpTyasNsC7Si9pFrohRL/yry2tJYYV5FMAIsk=;
        b=AxozyntRZTjPmQW0qX60okLObdCPhR78Cbee2F68YOzLSq6PiLjOn6AjnE9RNK+LMV
         p+B+QejozmdjgqJ4h173WdLqv26MbWgd7xL4OW+cZh+XGOngmQS/61CwBTvmODASzIMx
         n1xZI8W96gSeFSicgPF/YWwLcqKiRsEwBJZtV5AxJof7SpeqmxRzpOqKNyQwBetBDwHv
         K8QvKUDXFKJlCxPhcITslgWwTC6ObZyOmaH1bqnRYId+NT1VVvizqKs3FjOH395hd0kZ
         ce/uPxUBP2iMoE37vC9GN6cTkW96jQIgWiSKvaK+SG2pWTlp3dfJ+POoUWUhH63wIQoN
         OSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678819425; x=1681411425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ze6PWDtpTyasNsC7Si9pFrohRL/yry2tJYYV5FMAIsk=;
        b=OnewqeoXkWI608l6XKgNOjUwakM1+VSrDeUsxuq2WpU0bD0P++ftNz/hAzimqlGWD+
         yzQzk2ruMyXDaaEEoswhdakBsO+NZ3eRZoaaboALrMtf9sILWFeGdZbv7yK0wQK5bnSJ
         GsOAQT871qBeaWG1EzIJpBgLF8CbPnV0PAsk3XFOobu02CrOZ/6hJEfynxfQpygWuGA4
         CmEXa36QrveopfeBW/A+mXMu+zC3XhbszX3AGL1z88m1qz2dFtT1UVVzNKBWq9hgZLiV
         9nvBs2z/quFMVOJenWhRlVPjRATBa7U/AhV0PiDXSCAN1Fhrf35AHJMfCYHXnuBd0y6V
         ln+w==
X-Gm-Message-State: AO0yUKX/SKl8yA6sNTSDkNJiN1Euh6tHn9iCLZE2N12p15ZEFl4ftMWF
	KbG1bhwDaggnlaV5oDq3KSqFF0odhM0=
X-Google-Smtp-Source: AK7set96Tg+oaZgxZ3DonRo1JULWHayrtLNdW+cZjGYUvK/wR88d6TWPVNRtWkds7hIpFTC1/83ehQ==
X-Received: by 2002:a17:906:738f:b0:8aa:c0d5:25b1 with SMTP id f15-20020a170906738f00b008aac0d525b1mr862960ejl.5.1678819425543;
        Tue, 14 Mar 2023 11:43:45 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id go37-20020a1709070da500b00927b85e48b0sm1449001ejc.111.2023.03.14.11.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 11:43:45 -0700 (PDT)
Date: Tue, 14 Mar 2023 19:43:43 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 07/12] staging: rtl8192e: Join constants Rtl819XMACPHY_..PG
 with Rtl8192PciE..
Message-ID: <c8effbad931c1f7bcdee7245bf16bd2e85c03679.1678814935.git.philipp.g.hortmann@gmail.com>
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

Join constants Rtl819XMACPHY_Array_PG with Rtl8192PciEMACPHY_Array_PG to
RTL8192E_MACPHY_ARR_PG to improve readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 2 +-
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h | 1 -
 drivers/staging/rtl8192e/rtl8192e/table.c      | 2 +-
 drivers/staging/rtl8192e/rtl8192e/table.h      | 2 +-
 4 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 231bd49b8892..ef33f651f018 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -288,7 +288,7 @@ void rtl92e_config_mac(struct net_device *dev)
 
 	if (priv->tx_pwr_data_read_from_eeprom) {
 		dwArrayLen = RTL8192E_MACPHY_ARR_PG_LEN;
-		pdwArray = Rtl819XMACPHY_Array_PG;
+		pdwArray = RTL8192E_MACPHY_ARR_PG;
 
 	} else {
 		dwArrayLen = RTL8192E_MACPHY_ARR_LEN;
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
index 96c581475ffe..694528ca7910 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
@@ -9,7 +9,6 @@
 
 #define MAX_DOZE_WAITING_TIMES_9x 64
 
-#define Rtl819XMACPHY_Array_PG			Rtl8192PciEMACPHY_Array_PG
 #define Rtl819XMACPHY_Array			Rtl8192PciEMACPHY_Array
 #define Rtl819XRadioA_Array			Rtl8192PciERadioA_Array
 #define Rtl819XRadioB_Array			Rtl8192PciERadioB_Array
diff --git a/drivers/staging/rtl8192e/rtl8192e/table.c b/drivers/staging/rtl8192e/rtl8192e/table.c
index b2cf4d147c63..aed1c46dedf6 100644
--- a/drivers/staging/rtl8192e/rtl8192e/table.c
+++ b/drivers/staging/rtl8192e/rtl8192e/table.c
@@ -334,7 +334,7 @@ u32 Rtl8192PciEMACPHY_Array[] = {
 	0x318, 0x00000fff, 0x00000100,
 };
 
-u32 Rtl8192PciEMACPHY_Array_PG[] = {
+u32 RTL8192E_MACPHY_ARR_PG[] = {
 	0x03c, 0xffff0000, 0x00000f0f,
 	0xe00, 0xffffffff, 0x06090909,
 	0xe04, 0xffffffff, 0x00030306,
diff --git a/drivers/staging/rtl8192e/rtl8192e/table.h b/drivers/staging/rtl8192e/rtl8192e/table.h
index d00aa394c36a..f94975b112aa 100644
--- a/drivers/staging/rtl8192e/rtl8192e/table.h
+++ b/drivers/staging/rtl8192e/rtl8192e/table.h
@@ -20,7 +20,7 @@ extern u32 Rtl8192PciERadioB_Array[RTL8192E_RADIO_B_ARR_LEN];
 #define RTL8192E_MACPHY_ARR_LEN 18
 extern u32 Rtl8192PciEMACPHY_Array[RTL8192E_MACPHY_ARR_LEN];
 #define RTL8192E_MACPHY_ARR_PG_LEN 30
-extern u32 Rtl8192PciEMACPHY_Array_PG[RTL8192E_MACPHY_ARR_PG_LEN];
+extern u32 RTL8192E_MACPHY_ARR_PG[RTL8192E_MACPHY_ARR_PG_LEN];
 #define RTL8192E_AGCTAB_ARR_LEN 384
 extern u32 Rtl8192PciEAGCTAB_Array[RTL8192E_AGCTAB_ARR_LEN];
 
-- 
2.39.2

