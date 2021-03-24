Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738635F
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 19:47:14 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id g20so13550486wmk.3
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 12:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hza6oGquamGsAj0LENe42t1A5W6slFgaX6TBDjUifOc=;
        b=KFemaSHCgQe0AyAKtM1QHJKD6On2HXOmkdeKWabOjyS2K1lArQSXU8+6d+dFurxBH4
         5ia3PDekTSoAH4GU7Ds7kYjODLIx9X+PXgJQO9t3myUzw/BvCJLWMzUVWI6hl1fEPu3r
         GlWNdbclNFH+yhFnVRavGUPhkr5Z3nY+keFZLvsMKFvwVbDDYiH/hup9SkHyzs6jduQD
         HcwMLwhjfF3g2aaARUXqFO/nJEfNo1gUYpwH010O29b9ENHV7jB3/EVW+b8J2gfD5cCT
         CdInWMBcn+Mp4q5rrDwC0+IBpGIzj14CD4TStzPshnG4pCCA1ZfuGZrrdZ+0ycxVQXiu
         plrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hza6oGquamGsAj0LENe42t1A5W6slFgaX6TBDjUifOc=;
        b=DEqOWPJZ2OnlzQQNXCCGwJcdCuL2EWda6fPKQjwvJaJDjYyVbB8m4+Uaubg5Pgz3sP
         V/MBBuGXBqVPZWmBmwTIoUKXOpzaaIZzLfbdOE7yUJn/QvaDqEq4eek6ajfjqtm2PsIc
         7ypHLbNbRzpAsK5Qw5gZHs1lOkiL+9tQUmzY5YQ6DTW9VkKlSc7k7XR75FE1HPfKiI0L
         o7fHvkE5OJiZ866/TMK0WaosRZrUYALXqfcDSkIPvWmN/BvQxdpd6IIfl7Mg1a14YLSJ
         RbA3EAGaiEnXXDv6ndXrhGt/6G68ieQrkpmIVbLVc9XsTWUOMZxY0SXE+M1XjeNWkdOi
         Yk9Q==
X-Gm-Message-State: AOAM531reO9dhNWLNrwWtOxQ1eueU5CLUCHD1BaB/v5OtbHcLb13Gt/g
	4Szy6lHBfPWiJOxUeZVg91k=
X-Google-Smtp-Source: ABdhPJyi43bIJAOclIDwFdd4uts8vNaaM6WXV95VIsvCeWmHePttTB5qN0rhA6cmZrjnNuN1YpdEeQ==
X-Received: by 2002:a1c:dfc1:: with SMTP id w184mr4441791wmg.21.1616615232802;
        Wed, 24 Mar 2021 12:47:12 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id b17sm4468129wrt.17.2021.03.24.12.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 12:47:12 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH] Staging: rtl8723bs: remove obsolete comments
Date: Wed, 24 Mar 2021 20:47:21 +0100
Message-Id: <20210324194721.14574-1-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove some obsolete comments in the staging/rtl8723bs driver.

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h    | 2 --
 drivers/staging/rtl8723bs/hal/odm.h             | 4 ----
 drivers/staging/rtl8723bs/include/hal_com_h2c.h | 5 -----
 3 files changed, 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
index 08172cc38f09..194db3904982 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
@@ -198,8 +198,6 @@ enum btc_wifi_pnp {
 	BTC_WIFI_PNP_MAX
 };
 
-/* for 8723b-d cut large current issue */
-
 /*  defined for BFP_BTC_GET */
 enum btc_get_type {
 	/*  type bool */
diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index 956357abfcaf..6595a5cc972b 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -1155,10 +1155,6 @@ enum dm_rf_e { /* tag_RF_Type_Definition */
 	RF_MAX = 2,
 };
 
-/* 3 =========================================================== */
-/* 3 Antenna Diversity */
-/* 3 =========================================================== */
-
 /*  Maximal number of antenna detection mechanism needs to perform, added by Roger, 2011.12.28. */
 #define	MAX_ANTENNA_DETECTION_CNT	10
 
diff --git a/drivers/staging/rtl8723bs/include/hal_com_h2c.h b/drivers/staging/rtl8723bs/include/hal_com_h2c.h
index c7c2ff6c83b1..24cd9415fa95 100644
--- a/drivers/staging/rtl8723bs/include/hal_com_h2c.h
+++ b/drivers/staging/rtl8723bs/include/hal_com_h2c.h
@@ -7,11 +7,6 @@
 #ifndef __COMMON_H2C_H__
 #define __COMMON_H2C_H__
 
-/*  */
-/*     H2C CMD DEFINITION    ------------------------------------------------ */
-/*  */
-/*  88e, 8723b, 8812, 8821, 92e use the same FW code base */
-
 #define H2C_RSVDPAGE_LOC_LEN		5
 #define H2C_MEDIA_STATUS_RPT_LEN		3
 #define H2C_KEEP_ALIVE_CTRL_LEN	2
-- 
2.30.2

