Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599C9A939
	for <linux-staging@lists.linux.dev>; Tue, 14 Mar 2023 18:44:24 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id cn21so35828068edb.0
        for <linux-staging@lists.linux.dev>; Tue, 14 Mar 2023 11:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678819462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bLOK37kaCCRFSQ6Qfe95p7DC41DH+xkXW4p/2GEywPo=;
        b=o5rcG3ReV5MD3ATMvPIYIfyLf0tGNylYLK6uBZxngMMr3PGyyQrrvif8+lWI8KVBHg
         DqGsDsfiCtzL7vAnFb2N7jGCcBiaGmZ4cAoRqm2fkBq7lexgOmgzUa7cojefENXzd1hT
         ksSLBEiJTlzGP6wWgBOWuD08DviRn+JgAdF9OTXNalT4EGOpDIovQ5YKPWh5jwGgzZS5
         EMLL5VlOC+stUBVUX4akXIDRcjZsIR5JY2Lhww9EQeeUe1zchSLr1stcFdqrBcH0ZWE/
         qXgcFm+m9+OAkoSxnIdjSobknk/7ZruvnUwkTNNQ1qs+4X9uyO512DB0jRuihET3Q/OJ
         JNSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678819462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLOK37kaCCRFSQ6Qfe95p7DC41DH+xkXW4p/2GEywPo=;
        b=6qW42eD8FnI1vX3X2FWCteAsfLTU3lhhlbcCeNswYlEpTruvXBz/3tw8TPI3EFqnxS
         Qtfvm3sXvPkC7q9ke8PlzMi/Snw4rgNpbKGVjdzPAhu29V3jqMLuz6TJUhuMdA1cXCR8
         VoPPbxeu3wCiFYpHdnosTaSzj9A1dJnH/JeNZkPXBYvVDo1Gt2nZykyKs6aNKz/V6HeN
         g/N0qg9gXI6/jeeduMl8ovkNeOaTz5zzGKneLKrEKjvwatEDEvP6OMtahrNT140gFeeb
         6Ze7Jr9HganD+6EJdWhKrXIF1kxOzOnF6CvSToJPl2sYSahwC9n18qDTExcXglvjPXLv
         cUpg==
X-Gm-Message-State: AO0yUKU5IL478BmJqjMyyaA9sHFFVOoi+pmbCgaCqFgPZEl0INhoi0lR
	4RnxF9qlSg4tc7cR/Ath8f0=
X-Google-Smtp-Source: AK7set8sc29DTAjORv8IgrLZDEPnHQwqE8NefI67oQBQEvJxfDt7dYpNCX3Q82APCNeRdWkS3/e7aA==
X-Received: by 2002:a05:6402:268e:b0:4bc:edde:14dd with SMTP id w14-20020a056402268e00b004bcedde14ddmr20474290edd.0.1678819462676;
        Tue, 14 Mar 2023 11:44:22 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id g8-20020aa7d1c8000000b004be11e97ca2sm1400647edp.90.2023.03.14.11.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 11:44:22 -0700 (PDT)
Date: Tue, 14 Mar 2023 19:44:20 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 12/12] staging: rtl8192e: Join constants Rtl819XPHY_REG_..
 with ..PciEPHY_REG_..
Message-ID: <2816a10a8a534014c58e0092b78443e01a67930a.1678814935.git.philipp.g.hortmann@gmail.com>
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

Join constants Rtl819XPHY_REG_1T2RArray with Rtl8192PciEPHY_REG_1T2RArray
to RTL8192E_PHY_REG_1T2R_ARR to improve readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 2 +-
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h | 2 --
 drivers/staging/rtl8192e/rtl8192e/table.c      | 2 +-
 drivers/staging/rtl8192e/rtl8192e/table.h      | 2 +-
 4 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 72ecdb9ea375..2dbddf4ae3d6 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -316,7 +316,7 @@ static void _rtl92e_phy_config_bb(struct net_device *dev, u8 ConfigType)
 	Rtl819XAGCTAB_Array_Table = RTL8192E_AGCTAB_ARR;
 	if (priv->rf_type == RF_1T2R) {
 		PHY_REGArrayLen = RTL8192E_PHY_REG_1T2R_ARR_LEN;
-		Rtl819XPHY_REGArray_Table = Rtl819XPHY_REG_1T2RArray;
+		Rtl819XPHY_REGArray_Table = RTL8192E_PHY_REG_1T2R_ARR;
 	}
 
 	if (ConfigType == BB_CONFIG_PHY_REG) {
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
index 1f9bafd6d3cc..6723fcce8954 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
@@ -9,8 +9,6 @@
 
 #define MAX_DOZE_WAITING_TIMES_9x 64
 
-#define Rtl819XPHY_REG_1T2RArray		Rtl8192PciEPHY_REG_1T2RArray
-
 extern u32 rtl819XAGCTAB_Array[];
 
 enum hw90_block {
diff --git a/drivers/staging/rtl8192e/rtl8192e/table.c b/drivers/staging/rtl8192e/rtl8192e/table.c
index 3a7656facefc..0b5cc6049232 100644
--- a/drivers/staging/rtl8192e/rtl8192e/table.c
+++ b/drivers/staging/rtl8192e/rtl8192e/table.c
@@ -6,7 +6,7 @@
  */
 #include "table.h"
 
-u32 Rtl8192PciEPHY_REG_1T2RArray[RTL8192E_PHY_REG_1T2R_ARR_LEN] = {
+u32 RTL8192E_PHY_REG_1T2R_ARR[RTL8192E_PHY_REG_1T2R_ARR_LEN] = {
 	0x800, 0x00000000,
 	0x804, 0x00000001,
 	0x808, 0x0000fc00,
diff --git a/drivers/staging/rtl8192e/rtl8192e/table.h b/drivers/staging/rtl8192e/rtl8192e/table.h
index 576228882c21..82be44a9d4e8 100644
--- a/drivers/staging/rtl8192e/rtl8192e/table.h
+++ b/drivers/staging/rtl8192e/rtl8192e/table.h
@@ -12,7 +12,7 @@
 #include <linux/types.h>
 
 #define RTL8192E_PHY_REG_1T2R_ARR_LEN 296
-extern u32 Rtl8192PciEPHY_REG_1T2RArray[RTL8192E_PHY_REG_1T2R_ARR_LEN];
+extern u32 RTL8192E_PHY_REG_1T2R_ARR[RTL8192E_PHY_REG_1T2R_ARR_LEN];
 #define RTL8192E_RADIO_A_ARR_LEN 246
 extern u32 RTL8192E_RADIO_A_ARR[RTL8192E_RADIO_A_ARR_LEN];
 #define RTL8192E_RADIO_B_ARR_LEN 78
-- 
2.39.2

