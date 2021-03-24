Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E1C71
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 18:38:51 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id x13so25460796wrs.9
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 11:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZtMe28vNzlAcKlraEzN8Z/usNKpWrtmh91OiY2aldOU=;
        b=kryszGK8Drw6gqE3+a0KPKVie13qVCct0PGgZYDHebBnkAkFPul8q4e33hcDUzP6Wn
         OG38E1mAkwuIOvbZLbRhwQHG+kGYljBZ457gwPQvPn81hXFlWzNMn9x5U8gmkpOla6HB
         hgRE0y4heHl1xnqO6sG7vUKFyXT2Y6ZhDIgk7uglBSgOrmQTy6X89rBZkfTC8QcBepVo
         TQUjhfBH5qUKp9kwSw8nfCMCSQv3gzj+ZL5V3jMuBcS9Eh0t0hwkX7xrDZ/D7GSCaCrL
         tvFLE+r4TEJC8fKLEO9Rlv2yjx571MWv+WfyFNJuKexRw9peCCXyLfjRQ8JVnJ99LVEJ
         MMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZtMe28vNzlAcKlraEzN8Z/usNKpWrtmh91OiY2aldOU=;
        b=YymBJmD/4B+sJus+csxt0NbuI+BikhgtO+c0gZqvziE74MDapGVVEI0Tk67qVskPGV
         6CLdCHDmFjzg+ShtrJy/dQAYyXtFgzLtQ3Sw+bWdUaCjsmo8ArH7CZBT7qr/Ijre1dax
         E5ZgDr7WRBrVXlio6Vl1V1YPDYv/kwr0IRMj5GtcWcre0y/Lri7l47TpaLlxqUj4IX9O
         JKF4GHE0u7zhC0rlVMttuShwpjv/Ra7KSaoq2uH4y9cGTNExu/QXq8w58A8wxGaO1Lt6
         n1uw+/2OsTznm+J4p0iD1kP2Kg440V7zIFt8gPUe4Rs6cpK1o/rOix8d5+wLjjxJsxNA
         N3Qw==
X-Gm-Message-State: AOAM532tKxsOGbrlCdl7ceu5mOtzeteYDjM7hxmrvNPoME8/HQe9uzvv
	6vXomRpvCZC45LbxFGMXYhM=
X-Google-Smtp-Source: ABdhPJxgN+REW4kmzWvNuEJSXxXOi2Yv45inieiXwj5EmfiqL+/+B0fDlvPpl7aHN7cvvvVQmgv4tQ==
X-Received: by 2002:adf:e603:: with SMTP id p3mr4972841wrm.360.1616611130378;
        Wed, 24 Mar 2021 11:38:50 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id z2sm4358040wrm.0.2021.03.24.11.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 11:38:50 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 14/21] Staging: rtl8723bs: remove enums in rtw_rf.h
Date: Wed, 24 Mar 2021 19:38:40 +0100
Message-Id: <20210324183847.5595-15-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324183847.5595-1-marcocesati@gmail.com>
References: <20210324183847.5595-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum definitions in
include/rtw_rf.h:

	enum _rtl8712_rf_mimo_config_
	enum rf90_radio_path
	enum protection_mode

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_rf.h | 24 ----------------------
 1 file changed, 24 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_rf.h b/drivers/staging/rtl8723bs/include/rtw_rf.h
index a8ddd6fe5f95..e8465f675762 100644
--- a/drivers/staging/rtl8723bs/include/rtw_rf.h
+++ b/drivers/staging/rtl8723bs/include/rtw_rf.h
@@ -74,24 +74,6 @@ enum	_reg_preamble_mode {
 	PREAMBLE_SHORT	= 3,
 };
 
-enum _rtl8712_rf_mimo_config_ {
-	RTL8712_RFCONFIG_1T = 0x10,
-	RTL8712_RFCONFIG_2T = 0x20,
-	RTL8712_RFCONFIG_1R = 0x01,
-	RTL8712_RFCONFIG_2R = 0x02,
-	RTL8712_RFCONFIG_1T1R = 0x11,
-	RTL8712_RFCONFIG_1T2R = 0x12,
-	RTL8712_RFCONFIG_TURBO = 0x92,
-	RTL8712_RFCONFIG_2T2R = 0x22
-};
-
-enum rf90_radio_path {
-	RF90_PATH_A = 0,		/* Radio Path A */
-	RF90_PATH_B = 1,		/* Radio Path B */
-	RF90_PATH_C = 2,		/* Radio Path C */
-	RF90_PATH_D = 3			/* Radio Path D */
-};
-
 /*  Bandwidth Offset */
 #define HAL_PRIME_CHNL_OFFSET_DONT_CARE	0
 #define HAL_PRIME_CHNL_OFFSET_LOWER	1
@@ -130,12 +112,6 @@ enum vht_data_sc {
 	VHT_DATA_SC_40_LOWER_OF_80MHZ = 10,
 };
 
-enum protection_mode {
-	PROTECTION_MODE_AUTO = 0,
-	PROTECTION_MODE_FORCE_ENABLE = 1,
-	PROTECTION_MODE_FORCE_DISABLE = 2,
-};
-
 /* 2007/11/15 MH Define different RF type. */
 enum rt_rf_type_definition {
 	RF_1T2R = 0,
-- 
2.30.2

