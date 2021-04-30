Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B8B2F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:58:01 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id u21so105733560ejo.13
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oXNpztwSPie87ZGBOUIq/Wsi+dyDvcyo8iFcSTDhBAs=;
        b=LbGox2N2QODja8YDDpDX1Qwr780Xn2Uh83Y1yS0C6VDGsPl2s+uZsJXCV5UPdwn1ia
         wAvT6u0l7F/1g490ad3pQKRY/15sK48HeaAh3rwHtaG7TUzRpTk1HXH0+eGuMQEsbgjk
         gY8O+Jo8fXLJ3Tbkj9kdNHcar48dhcMIhBk2Wz3P2zFVQcdJ1Mv2OboPYKs7Si3sMs+E
         g9F730VVt3J5FcPLmlSd+v8hHu4N3d0RL/4P2LmZjq0ag7Bk6cFMBIdo9nhZQk5CjpAe
         JaqiHVLbfZgAg2K7TNGS5FcdY3R1vF0VIxvFX7zLfecdwPmEgY/6qL4R9JCx/SSzI7mZ
         m5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oXNpztwSPie87ZGBOUIq/Wsi+dyDvcyo8iFcSTDhBAs=;
        b=S3eqzD/Y05GDzAhAb4yY5WuMT8l76LtU95EIV5loH9H3j9Ao0zWlPIQXTDqZ2/k386
         O3qMn4T48kNucRKvemqd1W7zeBXmK9ud4eqrg9QvJ5coE4lY1kQm4WHkqPkHspbLNgb7
         2mNT3pelEZTR4zvBsU7UvcnZbHV1p99JxS70vnUgW2DAYcM9sams5yVImwAbg8QuTxKk
         /tiJnnu+vfTQypCzZg6Ab3ZrBPe1z+tv1iUfwzx8t281qNX9XvjPicKg/K0ZPsvDyBBI
         5TK5dt1NK8o5uXN2e1p5Jrrizcn2De6lH0QM4z0+028lOHwIp/TxHgI4j7JFDFZelLp4
         oy8A==
X-Gm-Message-State: AOAM531OJbc05BD3cAFfEVCBJiJbAXWWkv3zgChhB7k2p5btAe1zOpjz
	HRyYjU9xXJYOD3D/XHwzEhOfLrhS4mQ=
X-Google-Smtp-Source: ABdhPJyJ9RMj7uN2UsNEjSFu3OkIUYamprlQXJOqS7NAfO3RpiLUqPqLGFzc108H3vZI7QSvlDF6Mg==
X-Received: by 2002:a17:907:3e23:: with SMTP id hp35mr4859305ejc.437.1619794679776;
        Fri, 30 Apr 2021 07:57:59 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id f24sm1496798edt.44.2021.04.30.07.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:57:59 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 32/43] staging: rtl8723bs: remove obsolete GLBtcDbgType array declarations
Date: Fri, 30 Apr 2021 16:56:54 +0200
Message-Id: <000825941048c41cc53a0cc675fae2b45b781aad.1619794331.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619794331.git.fabioaiuto83@gmail.com>
References: <cover.1619794331.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove obsolete GLBtcDbgType declarations for it was intended
for private debug facilities.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h | 1 -
 drivers/staging/rtl8723bs/hal/hal_btcoex.c   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
index f2793d5d9a30..c5444f965699 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
@@ -83,7 +83,6 @@ enum {
 	BTC_MSG_ALGORITHM	= 0x1,
 	BTC_MSG_MAX
 };
-extern u32 		GLBtcDbgType[];
 
 /*  following is for BTC_MSG_INTERFACE */
 #define INTF_INIT	BIT0
diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index fd26187a976a..da545c4eaac0 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -17,7 +17,6 @@ struct btc_coexist GLBtCoexist;
 static u8 GLBtcWiFiInScanState;
 static u8 GLBtcWiFiInIQKState;
 
-u32 GLBtcDbgType[BTC_MSG_MAX];
 static u8 GLBtcDbgBuf[BT_TMP_BUF_SIZE];
 
 struct btcdbginfo { /* _btcoexdbginfo */
-- 
2.20.1

