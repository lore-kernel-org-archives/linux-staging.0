Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F058D70
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 12:44:59 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id d191so12814074wmd.2
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 05:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YOkaJznKMXwXoV9yjUno4xqyLYHIIeZzN/WdlczLEDo=;
        b=qKKiveG2jEyxo9XPX4LGEM7tbY51ghLpgzmi+wfBAZOUJ3RutQ6E7i+1xO+k6DrL9U
         XU5uSIWdNQF7K6W2ONyn7JTkoO8mSUGsRoXwWg+6YPnUhzXlBbLiyylSgu2cwyo3U6Hu
         fjv2hoh3Ln1KMRTXPgbvKOdy2zbJptOGcm40aTXWpUiT8Y1xJrVXszHG/S+H9nQiOUcY
         TUkYIXkM9KKoMkN+4+UbNub7cnvUbzyj7zFVqH4RZyZoC/SoDKwodOcPk47cJpEz2SY4
         4uDu8BIyGLDtFLwTpq7+CNLcZ2dHqwwaUQc8PaHGhgM48KGgm5jqRGD7h55OllMoYTeR
         Xzuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YOkaJznKMXwXoV9yjUno4xqyLYHIIeZzN/WdlczLEDo=;
        b=hDsY1zbqYAOqpKz0JNDN1Z1cePy8eOOmiX0QONXGfrghPDR6Rx+jcAq2jVj89wFkJ5
         8Yth3dYlnE/ujRxB0Mo5xwPFB6san+5C07ytlikqlBmSoaF7OgTH8fbmF7PgEkRkRbL2
         GJpJVJzFCXxulbJnKvGbi/GxvsZ0bjgqeW3rkuIrGgIuNYlKAKwGMVhX15x4qlJOxRuh
         79LAy+JzCegzfbqc7YJDO7uenYagsZH5yBiGi+CDN/zitei+2V5fA0mPqM9u9fTmvT+M
         yRWAfD/chWiSosbV11xGBZfXWvru8oLtpxZ5CS0li8IejTs+YAThQOVnVlEl5Q91Ul9E
         eZMQ==
X-Gm-Message-State: AOAM531/c2Bkaeqjnyz9ppvEU9M1QErPy58huVAZyXZe0xbBhSY4kVaq
	ucRHYFGpV+apOcTh5+UFgh0=
X-Google-Smtp-Source: ABdhPJyaNYYa6VG46lpZ9itAzBMcBuAOHEl89/tp3ZP2ejowJu2MDqilb2cHjZMQ34ns01pwqISCRw==
X-Received: by 2002:a1c:bb89:: with SMTP id l131mr2848937wmf.47.1616589898418;
        Wed, 24 Mar 2021 05:44:58 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id s20sm2324005wmj.36.2021.03.24.05.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:44:58 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 12/33] Staging: rtl8723bs: remove named enums in rtw_pwrctrl.h
Date: Wed, 24 Mar 2021 13:44:35 +0100
Message-Id: <20210324124456.25221-13-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324124456.25221-1-marcocesati@gmail.com>
References: <20210324124456.25221-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum names in
include/rtw_pwrctrl.h:

	enum Power_Mgnt
	enum _PS_BBRegBackup_

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_pwrctrl.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
index cec9fc0cf794..2d77446e9482 100644
--- a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
+++ b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
@@ -31,7 +31,7 @@
 #define BTCOEX_ALIVE	BIT(4)
 
 
-enum Power_Mgnt {
+enum {
 	PS_MODE_ACTIVE	= 0,
 	PS_MODE_MIN,
 	PS_MODE_MAX,
@@ -124,8 +124,7 @@ enum rt_rf_power_state {
 #define	RT_PCI_ASPM_OSC_ENABLE		BIT0 /*  PCI ASPM controlled by OS according to ACPI Spec 5.0 */
 #define	RT_PCI_ASPM_OSC_DISABLE		BIT1 /*  PCI ASPM controlled by driver or BIOS, i.e., force enable ASPM */
 
-
-enum _PS_BBRegBackup_ {
+enum {
 	PSBBREG_RF0 = 0,
 	PSBBREG_RF1,
 	PSBBREG_RF2,
-- 
2.30.2

