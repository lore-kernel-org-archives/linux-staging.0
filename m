Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11DA2C80
	for <linux-staging@lists.linux.dev>; Fri,  5 Nov 2021 16:54:01 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id m14so9383135pfc.9
        for <linux-staging@lists.linux.dev>; Fri, 05 Nov 2021 09:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ALMmQlZo8+KWhNKSuIRIbhgj4mQ52Qs0A0EZkuhtla0=;
        b=L7NRUL9Wt8voFjQzLH9tlmbo7jzZgl82GnKlPgD/C8uP543v8mkPcLXjhtld2jKNAs
         8e1KUVs+SDRixGZoPV+S1Bx8FK06oBBviOAv/JlmMiVcG2uzScAXtGBHpBonj+HzZ9CY
         kstdKd3QyG6HzZ5R4PzWJwTrDLciM4PvHKeoI6xXesomwE4dthZ63sIQFYFRy3ErvDaK
         l9sk6Vr4XM7mJrssO9Ip0rInOqDNKhgw/cE1WHHDWW9dG/LC7KK9i+gtvDuU+rwxE9lJ
         64YYXrD7SqXCi1vjrkWfvpkakYYsnWCy2YM7XLbwQruMEO7AfvQl3392xjRrnpnyppMl
         mMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ALMmQlZo8+KWhNKSuIRIbhgj4mQ52Qs0A0EZkuhtla0=;
        b=qFNYRuWwkwH8BR0Kxyf8II56UBXTm/U9arQGaJbV/FJyFuNOE38HewyS3OxNo+T4xR
         8qP3+hBEaXzdICOHHoT6ou7UxftW2eRRsX6gdJD0tiB/Wpr942ie56Stzegua/o2qrFC
         rRP5r7NHNtmXdLL9+Umtm2lNP73K90P26+yKRo7yGkHqCQVBAVtlyapwmebfw24pU8Wt
         V4X/3GcBwRS6unj7aNoSoOwKLtYqulcpLU7a/brCNXM2lthRe445H2cmRxLVMtsuCG9D
         xgTfIl/rS4JKz1YxBNKSIVH7PtBAtnzFnEQTFVl5ea5uz9dNOq5Mhnjz+PeyBMV65Mjp
         ce2g==
X-Gm-Message-State: AOAM532R5lvYP3rAgcyrDmFp1R++M6DNM9XKe3Bq0iowfZu6qFrWmdzS
	pXBjNMfc2xjWiL/7fL+A41A=
X-Google-Smtp-Source: ABdhPJx3xbEG22VrZb+VCW2Mu+XGX6Iwdvy7Ak+su3+8QezkaV/1tT1ZT609I4QTO6lvbOPkEj7V4w==
X-Received: by 2002:a63:3d4c:: with SMTP id k73mr45028603pga.44.1636131241496;
        Fri, 05 Nov 2021 09:54:01 -0700 (PDT)
Received: from localhost.localdomain ([2001:4490:4409:3406:a18f:7c45:2f81:cea2])
        by smtp.gmail.com with ESMTPSA id s30sm8524425pfg.17.2021.11.05.09.53.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Nov 2021 09:54:01 -0700 (PDT)
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: gregkh@linuxfoundation.org,
	fabioaiuto83@gmail.com,
	saurav.girepunje@gmail.com,
	dan.carpenter@oracle.com,
	shreyaskumar1035@gmail.com,
	ross.schm.dev@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] staging: rtl8723bs: core: remove unused local variable padapter
Date: Fri,  5 Nov 2021 22:23:30 +0530
Message-Id: <20211105165330.78524-3-saurav.girepunje@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105165330.78524-1-saurav.girepunje@gmail.com>
References: <saurav.girepunje@gmail.com>
 <20211105165330.78524-1-saurav.girepunje@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the unused variable padapter from Efuse_Write1ByteToFakeContent
This variable is not used in the function.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index bd057e041a08..3d3c77273026 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -43,10 +43,7 @@ Efuse_Read1ByteFromFakeContent(u16 Offset, u8 *Value)
 }
 
 static bool
-Efuse_Write1ByteToFakeContent(
-	struct adapter *padapter,
-	u16 	Offset,
-	u8 Value)
+Efuse_Write1ByteToFakeContent(u16 Offset, u8 Value)
 {
 	if (Offset >= EFUSE_MAX_HW_SIZE)
 		return false;
@@ -288,7 +285,7 @@ u8 efuse_OneByteWrite(struct adapter *padapter, u16 addr, u8 data, bool bPseudoT
 	u32 efuseValue = 0;
 
 	if (bPseudoTest)
-		return Efuse_Write1ByteToFakeContent(padapter, addr, data);
+		return Efuse_Write1ByteToFakeContent(addr, data);
 
 
 	/*  -----------------e-fuse reg ctrl --------------------------------- */
-- 
2.33.0

