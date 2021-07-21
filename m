Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CC672
	for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 13:37:28 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id go30so3275994ejc.8
        for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 06:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yrXsTHWY2k3HUSMD6kvKz+z4pqHJHinlSSpdLkyTkq0=;
        b=O1XFBqfkaxlzRl/tSU33Bap4Te5QArd4J57GfqmJACO9REMDI0I89pUbIlMwXvHBpV
         ALZ601U/qK5FVGJxQoSvEHGhifUts31fg82jE7uq5SLb/4HG03XXOviOcF99zEIfozD8
         qje79UHTbYRIaY8jzG8kqg1KeUOixP9nI9WGjIyCmErwX5xthHPOGZHZqntBBhM68SdV
         CcSK47RtIz5+U0r9p6ZjfwSw++ITyy9dJTB78TU6/JTI1HlQzlg4PNpcrrnO+Y1Qfe6W
         GQJ1hJ/F8nD0CjDQE1AwCelD/UuvAesLSLt+3k3yGJpLMnijNxB7mpzWgp6H0U78Q2NK
         DThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yrXsTHWY2k3HUSMD6kvKz+z4pqHJHinlSSpdLkyTkq0=;
        b=EVagoRTjUegKnD8KqL14qv2AXNIpeYYjwSZ2mND9YMjo5eVMQSFhYnd/hqsuobluz9
         dSNgJTT7kd6OvKrUNbRf0binae86EYUk4RISCn+7AWOBbWoWhuLCT9gJC6S7z7LRDcyg
         mQ7oGzm3fRLhMdNAN+TnkZect73QmSGqQF4AEBPHGTum12/iYxbeMWrb8DCpXxe5Ml5c
         oKHjPA3ZFrs2/Hww74sf/lp/udQjvgSNvVq7kj1qmfkRFDlE4oKwHxsecnea18zIFB36
         zX5Q1kQLUjUzd2W4uu93yEWaRu4SrB68tlMr1rzYqkHm53L3Tq/AjWPUau+H0nh3WgA+
         aMxg==
X-Gm-Message-State: AOAM531A9bnlZZIQl27yCOpOnuuQqUUyQBkKudUOxHhix7xIq0mYTumo
	Khi6LtV4P5qjyD5V/SNxGkA=
X-Google-Smtp-Source: ABdhPJxiNiX6JSyw4QaJCVJBFrcXgOOakeMZYCxIOAdfBEzedsTfqKGa/xoyn/ypN/P2eBKM090X/g==
X-Received: by 2002:a17:907:2ce8:: with SMTP id hz8mr38372921ejc.88.1626874647270;
        Wed, 21 Jul 2021 06:37:27 -0700 (PDT)
Received: from agape ([5.171.73.45])
        by smtp.gmail.com with ESMTPSA id kj26sm8516587ejc.24.2021.07.21.06.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 06:37:26 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/16] staging: rtl8723bs: simplify function selecting channel group
Date: Wed, 21 Jul 2021 15:37:08 +0200
Message-Id: <a5536788004c44fe819c0eab0d19504824af46cd.1626874164.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1626874164.git.fabioaiuto83@gmail.com>
References: <cover.1626874164.git.fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

simplify function Hal_GetChnlGroup8723B(). It returns
an unused and unnecessary bool value telling which
band the device works on. Since we work only on
2.4Ghz band and the useful return value is the
second function argument we convert the return type to
void.

remove 5Ghz dead code either (for channel > 14).

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 62 ++++---------------
 1 file changed, 12 insertions(+), 50 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 059d3050acc6..bd0e9f05eb5c 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -2061,56 +2061,18 @@ s32 rtl8723b_InitLLTTable(struct adapter *padapter)
 	return ret;
 }
 
-static bool Hal_GetChnlGroup8723B(u8 Channel, u8 *pGroup)
-{
-	bool bIn24G = true;
-
-	if (Channel <= 14) {
-		bIn24G = true;
-
-		if (1  <= Channel && Channel <= 2)
-			*pGroup = 0;
-		else if (3  <= Channel && Channel <= 5)
-			*pGroup = 1;
-		else if (6  <= Channel && Channel <= 8)
-			*pGroup = 2;
-		else if (9  <= Channel && Channel <= 11)
-			*pGroup = 3;
-		else if (12 <= Channel && Channel <= 14)
-			*pGroup = 4;
-	} else {
-		bIn24G = false;
-
-		if (36   <= Channel && Channel <=  42)
-			*pGroup = 0;
-		else if (44   <= Channel && Channel <=  48)
-			*pGroup = 1;
-		else if (50   <= Channel && Channel <=  58)
-			*pGroup = 2;
-		else if (60   <= Channel && Channel <=  64)
-			*pGroup = 3;
-		else if (100  <= Channel && Channel <= 106)
-			*pGroup = 4;
-		else if (108  <= Channel && Channel <= 114)
-			*pGroup = 5;
-		else if (116  <= Channel && Channel <= 122)
-			*pGroup = 6;
-		else if (124  <= Channel && Channel <= 130)
-			*pGroup = 7;
-		else if (132  <= Channel && Channel <= 138)
-			*pGroup = 8;
-		else if (140  <= Channel && Channel <= 144)
-			*pGroup = 9;
-		else if (149  <= Channel && Channel <= 155)
-			*pGroup = 10;
-		else if (157  <= Channel && Channel <= 161)
-			*pGroup = 11;
-		else if (165  <= Channel && Channel <= 171)
-			*pGroup = 12;
-		else if (173  <= Channel && Channel <= 177)
-			*pGroup = 13;
-	}
-	return bIn24G;
+static void Hal_GetChnlGroup8723B(u8 Channel, u8 *pGroup)
+{
+	if (1  <= Channel && Channel <= 2)
+		*pGroup = 0;
+	else if (3  <= Channel && Channel <= 5)
+		*pGroup = 1;
+	else if (6  <= Channel && Channel <= 8)
+		*pGroup = 2;
+	else if (9  <= Channel && Channel <= 11)
+		*pGroup = 3;
+	else if (12 <= Channel && Channel <= 14)
+		*pGroup = 4;
 }
 
 void Hal_InitPGData(struct adapter *padapter, u8 *PROMContent)
-- 
2.20.1

