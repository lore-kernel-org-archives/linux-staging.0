Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A6E70
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 17:41:38 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id a7so9650197ejs.3
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 10:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GLRmdIxpXJ3Jps3jNfOMafGC3GpgmWJHxKC5SQHvNws=;
        b=UesCDFo772/qVwK3eoJmeF0HEMzEBp8PWdEYXe+lobOSsSmn3LHjrNr3hu4VjyzHVj
         2m/sIwK6P4MIEwuNsmiJxIMncyAZYJO1WmyLoeRPqmUiv0GAID0cB9mQFJhbozvkCn4L
         7Odzc5KLFjPCtlpaS+KbQeINOxZ4JNwWtT/rT0vx9mmja0GDCER2RmthuJvsbiWDsHV3
         WQs8abIXnyER6l+YXBQ5v5mWF5KOGApZ3v7fGrwjdoPE2NJZp/YxLjuGuDRnzmR+Svw+
         opAuLgufHmpInhAPwJGvGOf6EY9ydfDPWU8tjx5IyVWdc02flinW5H/qGPT8+pncHQup
         JtaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GLRmdIxpXJ3Jps3jNfOMafGC3GpgmWJHxKC5SQHvNws=;
        b=TiY/0w1E9MOstvgBHZxtRFAOftmCDucIEx2SiRNT2UbyYJ/SbGftJfsCgsT9aCtCis
         0KaqNzcXxtTwPRrhj56U4/hfW84wPPx+c2Tt1c11sfaa/IJCP9to74wkadQR8NYbOIOs
         0W+BByuOk5bjwmPOdCjxHlIwoJVn9NET5yREStWJN2n0okV1PuWKtiUTze3HJiwXUpE0
         IBpXhE6roSzjj5rUtiXHtWKnkWwPR4cxkfgP5Gts2klr2lksh6/XcRWbSz8i6gwDLPyN
         z8hrh5tdcITWzF3CeoqQ5KFvq6UjZZYjRlulYSiOkRiYvYC/RAppdoTBib37mVtUZ/0u
         0tig==
X-Gm-Message-State: AOAM5319SP7S/rPEz9ELbSUyeH9Dm8rvpP7yaS4nr63N9rLy5YvCiC/y
	Ty7Llrmc3eJdm6n+Z+rmgNk=
X-Google-Smtp-Source: ABdhPJwyctcff0iMES27O6yevNLkuNCje1DUi2CYNumL58t0ZAiylcaQ4xV6xbSQath/2eZj3qV3cw==
X-Received: by 2002:a17:906:b316:: with SMTP id n22mr16225424ejz.249.1616780496834;
        Fri, 26 Mar 2021 10:41:36 -0700 (PDT)
Received: from gimli.cesven (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id mc10sm4142345ejb.56.2021.03.26.10.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 10:41:36 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH 1/2] Staging: rtl8723bs: remove obsolete comments
Date: Fri, 26 Mar 2021 18:41:44 +0100
Message-Id: <20210326174145.19427-1-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove some orphan comments in the staging/rtl8723bs driver

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h    | 2 --
 drivers/staging/rtl8723bs/hal/odm.h             | 3 ---
 drivers/staging/rtl8723bs/hal/odm_interface.h   | 2 --
 drivers/staging/rtl8723bs/include/hal_com_h2c.h | 5 -----
 4 files changed, 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
index 75e1d1a37626..7b2d94a33d9c 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
@@ -198,8 +198,6 @@ enum {
 	BTC_WIFI_PNP_MAX
 };
 
-/* for 8723b-d cut large current issue */
-
 /*  defined for BFP_BTC_GET */
 enum {
 	/*  type bool */
diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index dd0c4616086d..ff21343fbe0b 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -1147,9 +1147,6 @@ enum { /* tag_RF_Type_Definition */
 	RF_MAX = 2,
 };
 
-/* 3 =========================================================== */
-/* 3 Antenna Diversity */
-/* 3 =========================================================== */
 /*  Maximal number of antenna detection mechanism needs to perform, added by Roger, 2011.12.28. */
 #define	MAX_ANTENNA_DETECTION_CNT	10
 
diff --git a/drivers/staging/rtl8723bs/hal/odm_interface.h b/drivers/staging/rtl8723bs/hal/odm_interface.h
index 4ee5903c41b5..d19347b02890 100644
--- a/drivers/staging/rtl8723bs/hal/odm_interface.h
+++ b/drivers/staging/rtl8723bs/hal/odm_interface.h
@@ -11,8 +11,6 @@
 
 
 
-/*  =========== Constant/Structure/Enum/... Define */
-
 /*  =========== Macro Define */
 
 #define _reg_all(_name)			ODM_##_name
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

