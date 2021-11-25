Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83742C83
	for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 19:59:51 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id u1so13843773wru.13
        for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 11:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A0/+FVbmz3ZoXYwB+U+QV/+unmh1ykLuUGfSEjydxaQ=;
        b=AgK40Tknb6IwT7M0ylBv9MCHjD/mkseQR8WFTvwiBpAQBK56u025zxD5FYE9szdWXk
         /c9gezlnKZhhKnTOF16jfOKyL81ByQognQUJaILorQ4gagLjr7PuM8w9tPwj8OeyyH6u
         Z4k9nyYWDyhjlJZWE77iTA1sOP6QP97AWLTL+YxbG4B8g/xfN9Ha+dkUsWEHyX0OKSK3
         ny50bXbMv9gRnepL+EIgelv5apTIGTYIBH3wG9gkfK8KaShJtDb/lZIu32NQl72uQB6s
         cnVOc/6Gjcgn8cGHgs+RrGwHz8r9KGNAeWuGbneSBl2nu3V6VVMFbN3wta5GOVQz+mdf
         aq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A0/+FVbmz3ZoXYwB+U+QV/+unmh1ykLuUGfSEjydxaQ=;
        b=kL+y2dQZL51PJA3HdH0WFkL3XpnIsJzEI2FD2PWpDNtu1mX9mbhwDc21qr37w4r4ZI
         GO9qCeaQxMb7XjoK5wRnU7zf1P7v8KsRfb5ipFFe9/tVbmi+IQKnQTUWWAMxBi+4yWwI
         74FMvMnNdosQbNlyC79uTXyWtPWNDGVK41oPj8C9f9UUJ2GBbS1NE4gHmmmO89+XCTci
         CDlfeeHbYjCbxAqnaeQYzM/b81VnJ7j4smRN+aZv7B4Gax7plbbqNELI/ciLc+cy+Ogc
         ZWsEflIsS+hfc5F5v9zkECjXcc3wOC8FYDC/JKb9EptsP9S3HHhPRy4CZAEofLbW6QFc
         oKFg==
X-Gm-Message-State: AOAM533iuGypO/APhOOIyNUUWr1AS4oxYH7X96uK22FKifAcHrqpJO2y
	7NvCpKLxE7RwS/ouzmYh0io=
X-Google-Smtp-Source: ABdhPJx0os0MQLQmHnSqWkYUBH/rMZMNuhpgSnVJ77ya9HoACudWqhnAr70TthZZZZ9s1f2bxCpVtg==
X-Received: by 2002:adf:f749:: with SMTP id z9mr9698775wrp.379.1637870390162;
        Thu, 25 Nov 2021 11:59:50 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ac86])
        by smtp.gmail.com with ESMTPSA id h13sm3762721wrx.82.2021.11.25.11.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 11:59:49 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/5] staging: r8188eu: remove rf_type from storePwrIndexDiffRateOffset()
Date: Thu, 25 Nov 2021 20:59:34 +0100
Message-Id: <20211125195936.10060-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211125195936.10060-1-straube.linux@gmail.com>
References: <20211125195936.10060-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pHalData->rf_type is always RF_1T1R. Remove unnecessary checks and
related dead code from storePwrIndexDiffRateOffset().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
index 47402851700b..258349e6104f 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
@@ -506,8 +506,7 @@ void storePwrIndexDiffRateOffset(struct adapter *Adapter, u32 RegAddr, u32 BitMa
 		pHalData->MCSTxPowerLevelOriginalOffset[pHalData->pwrGroupCnt][4] = Data;
 	if (RegAddr == rTxAGC_A_Mcs15_Mcs12) {
 		pHalData->MCSTxPowerLevelOriginalOffset[pHalData->pwrGroupCnt][5] = Data;
-		if (pHalData->rf_type == RF_1T1R)
-			pHalData->pwrGroupCnt++;
+		pHalData->pwrGroupCnt++;
 	}
 	if (RegAddr == rTxAGC_B_Rate18_06)
 		pHalData->MCSTxPowerLevelOriginalOffset[pHalData->pwrGroupCnt][8] = Data;
@@ -523,11 +522,8 @@ void storePwrIndexDiffRateOffset(struct adapter *Adapter, u32 RegAddr, u32 BitMa
 		pHalData->MCSTxPowerLevelOriginalOffset[pHalData->pwrGroupCnt][11] = Data;
 	if (RegAddr == rTxAGC_B_Mcs11_Mcs08)
 		pHalData->MCSTxPowerLevelOriginalOffset[pHalData->pwrGroupCnt][12] = Data;
-	if (RegAddr == rTxAGC_B_Mcs15_Mcs12) {
+	if (RegAddr == rTxAGC_B_Mcs15_Mcs12)
 		pHalData->MCSTxPowerLevelOriginalOffset[pHalData->pwrGroupCnt][13] = Data;
-		if (pHalData->rf_type != RF_1T1R)
-			pHalData->pwrGroupCnt++;
-	}
 }
 
 static	int phy_BB8188E_Config_ParaFile(struct adapter *Adapter)
-- 
2.33.1

