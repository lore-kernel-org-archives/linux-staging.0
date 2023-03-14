Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF19946A
	for <linux-staging@lists.linux.dev>; Tue, 14 Mar 2023 18:43:07 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id cy23so65847908edb.12
        for <linux-staging@lists.linux.dev>; Tue, 14 Mar 2023 11:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678819386; x=1681411386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TA9zaJ5cm57+RQC5jLFl72abHNghx3LQzCmXrcIYNDI=;
        b=LggMcBwAP4URtNCS2KXeD+vsh8cUFnRZcAeMOaPoaQMUEJeFMnc6gpVgVt9fUplcsn
         dS1wXcboTSxV6Oxiaus9hD61AFByPwEEaS9ZxwlFlnMS8OpuAUv2lCbQOkB8XJSZc45b
         D1cPF5UF2OldJbwB0uIsotEblsniokvsdxJ4B2OIj7GfmWpcS4msRAG+eOvIlYOPB7KS
         mDw2KoUPd/UIJUlz1ZksJm7T0v1E9vp8wbjr/Xq+hVtXIP6st5lxjTfM2aglaR5E7J6m
         Y+q3Sk2RuOvXgrEGJgsWQMe5du52LNQW3kRyJclHsGvy+eYmynwkAeAlEo/DYaeogg7S
         mX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678819386; x=1681411386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TA9zaJ5cm57+RQC5jLFl72abHNghx3LQzCmXrcIYNDI=;
        b=DJLy15dptjGjBeeEoCHHJ1Bja2kRT+AZM9R985veO90ZD5mc/cWJAnTEAezIzCqXOz
         +nZsHAKoQlWc+V+UVBdSxIgplEQ58Y3ABMikyyxNMMp5Nd2zYf8YmPW5n4Ztpav8kBjm
         xPalZY+kxLqyR8aF7atTsbDevnhUDc51s2MiN4Nogkhd0ia3sEX+5S3gYNUfkjzCAPsm
         3D1UEELnP/h4IqXyK3AGSPWDu92wjHhaJrLRdo0lFQu1jtql7uCfOktv1JaZHD71TBFd
         TxoD7UEDDgbX+mp3zNrEL8izwd3jeYOXtpFS+vnrCRMXldhyq8f7/yym9d/0UPAkMmu4
         DyYA==
X-Gm-Message-State: AO0yUKWgiLJSIIPNMWsEgH+IUUCfomT6Pqp9uCBagunYXc4bg3smHFjw
	iHdDALg40KgOlngNBgrPmfk=
X-Google-Smtp-Source: AK7set90F8apQmTQepJarCZvWAZB0Il3suuwXupQV/v2GNqcTmWfdE05HneKUQON1vmy/qZKtTjP7g==
X-Received: by 2002:a17:906:109b:b0:92c:f016:7ac2 with SMTP id u27-20020a170906109b00b0092cf0167ac2mr955084eju.0.1678819385820;
        Tue, 14 Mar 2023 11:43:05 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id hb25-20020a170906b89900b009294524ac21sm1495274ejb.60.2023.03.14.11.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 11:43:05 -0700 (PDT)
Date: Tue, 14 Mar 2023 19:43:03 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 02/12] staging: rtl8192e: Join constants MACPHY_ArrayLength
 with ..LengthPciE
Message-ID: <881ce5739e4237ea9a31029acaa535422d41fa5f.1678814935.git.philipp.g.hortmann@gmail.com>
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

Join constants MACPHY_ArrayLength with MACPHY_ArrayLengthPciE to
RTL8192E_MACPHY_ARR_LEN to improve readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 2 +-
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h | 1 -
 drivers/staging/rtl8192e/rtl8192e/table.h      | 4 ++--
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 54596982bc76..29918a529f77 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -291,7 +291,7 @@ void rtl92e_config_mac(struct net_device *dev)
 		pdwArray = Rtl819XMACPHY_Array_PG;
 
 	} else {
-		dwArrayLen = MACPHY_ArrayLength;
+		dwArrayLen = RTL8192E_MACPHY_ARR_LEN;
 		pdwArray = Rtl819XMACPHY_Array;
 	}
 	for (i = 0; i < dwArrayLen; i += 3) {
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
index d984380bcca3..611756517ce6 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
@@ -9,7 +9,6 @@
 
 #define MAX_DOZE_WAITING_TIMES_9x 64
 
-#define MACPHY_ArrayLength			MACPHY_ArrayLengthPciE
 #define RadioA_ArrayLength			RadioA_ArrayLengthPciE
 #define RadioB_ArrayLength			RadioB_ArrayLengthPciE
 #define MACPHY_Array_PGLength			MACPHY_Array_PGLengthPciE
diff --git a/drivers/staging/rtl8192e/rtl8192e/table.h b/drivers/staging/rtl8192e/rtl8192e/table.h
index 439847b1f52b..cb424c8fbee0 100644
--- a/drivers/staging/rtl8192e/rtl8192e/table.h
+++ b/drivers/staging/rtl8192e/rtl8192e/table.h
@@ -17,8 +17,8 @@ extern u32 Rtl8192PciEPHY_REG_1T2RArray[PHY_REG_1T2RArrayLengthPciE];
 extern u32 Rtl8192PciERadioA_Array[RadioA_ArrayLengthPciE];
 #define RadioB_ArrayLengthPciE 78
 extern u32 Rtl8192PciERadioB_Array[RadioB_ArrayLengthPciE];
-#define MACPHY_ArrayLengthPciE 18
-extern u32 Rtl8192PciEMACPHY_Array[MACPHY_ArrayLengthPciE];
+#define RTL8192E_MACPHY_ARR_LEN 18
+extern u32 Rtl8192PciEMACPHY_Array[RTL8192E_MACPHY_ARR_LEN];
 #define MACPHY_Array_PGLengthPciE 30
 extern u32 Rtl8192PciEMACPHY_Array_PG[MACPHY_Array_PGLengthPciE];
 #define RTL8192E_AGCTAB_ARR_LEN 384
-- 
2.39.2

