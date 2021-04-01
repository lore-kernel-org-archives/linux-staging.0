Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A194F71
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:22:09 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id x21so1161427eds.4
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 02:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JHe1PdxpLWNY/oUwDctd3fxOVFZ+6y7BNO4mwEPdNFM=;
        b=Pi7Qs8CQmjoQQgZM22idpg99oqa+DTMDkHhsErdA2e1d0m62w7/M1r1qsU9qku/GXR
         DBvtvJUG0yRbl4AK8bgJTuos4dFyslWg3nrIOjR4o/Lfugl5G4FLBp4+LRzE3IFEfGth
         x+ZzmuIo8B+9ptre6s+DepV8ZgoNp/DsVsOa5MBXa+C+ZU756KbYYuMUBNTO5TJKn9Ix
         1NJePh3OJaLhkLKxxDOQd6nYpLiIIyX+Si6KUWF8f3GgUjNv5PD7e+jBShmvtwOAlIgi
         FSovI9y0X9P0ztEhP4nP7Rv2cp6i4oja9KbdbNOB683EPTEQzzGoUoENyjJ6Sqgv1As/
         2FEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JHe1PdxpLWNY/oUwDctd3fxOVFZ+6y7BNO4mwEPdNFM=;
        b=rN9NZOUcYCz6HTjqXBbVObR/d9OdgguhCkguH7dKxnTY6kVxyqISnbb3N2Dz9nBGCW
         WrZGoB09zFduf2/OpjidKfQqpNM/tOkhvAalmtHg36MEwVYv0w/ZVzKHYsFIGS5/t9LC
         1JHGZQi04qEA8LFwliBmD82g4MwAg9sSgCEfNIPEPc+qRwUybvmSsQ3Hi+wtbCP7idvw
         4xE20qO3lUmmylTgrJAslLM3tp+mOPVOeM3/IEEpWRp/LD1Hiqd5kypq+bD+T1Inw14D
         ZyCznUn3lIRKvgsW+Db9Yq1QHEtsZ6TaoYFe8MB9+To57nmC9PLosxbkGx6/cRzL78Z2
         Tcfw==
X-Gm-Message-State: AOAM532eB6MbQMNfrgDgXpmnRODZG1DzEnpd5ro2LiUkYohSJu0DaE4+
	Ft6Qlyj8bZEluLSvwge1YNk=
X-Google-Smtp-Source: ABdhPJy6ft7+i4r3fnb1Wh3YDVKm21FlQFQ2aCyy4G1fjdxfgPP5x3BxBPIsPDpspNnMTdpA1sTg0g==
X-Received: by 2002:a05:6402:4301:: with SMTP id m1mr9075349edc.210.1617268928211;
        Thu, 01 Apr 2021 02:22:08 -0700 (PDT)
Received: from agape ([5.171.80.247])
        by smtp.gmail.com with ESMTPSA id q16sm3285610edv.61.2021.04.01.02.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:22:07 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 27/49] staging: rtl8723bs: remove empty #ifdef blocks in hal/rtl8723b_hal_init.c
Date: Thu,  1 Apr 2021 11:20:57 +0200
Message-Id: <5a857cdd2707efd3213a9db8899afa711bb32d88.1617268327.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617268327.git.fabioaiuto83@gmail.com>
References: <cover.1617268327.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove empty #ifdef blocks

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 20b66bf942e4..fbc6ef0cfe0c 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -2486,8 +2486,6 @@ void Hal_EfuseParseTxPowerInfo_8723B(
 				pHalData->Index24G_CCK_Base[rfPath][ch] = pwrInfo24G.IndexCCK_Base[rfPath][group];
 				pHalData->Index24G_BW40_Base[rfPath][ch] = pwrInfo24G.IndexBW40_Base[rfPath][group];
 			}
-#ifdef DEBUG
-#endif
 		}
 
 		for (TxCount = 0; TxCount < MAX_TX_COUNT; TxCount++) {
@@ -2496,8 +2494,6 @@ void Hal_EfuseParseTxPowerInfo_8723B(
 			pHalData->BW20_24G_Diff[rfPath][TxCount] = pwrInfo24G.BW20_Diff[rfPath][TxCount];
 			pHalData->BW40_24G_Diff[rfPath][TxCount] = pwrInfo24G.BW40_Diff[rfPath][TxCount];
 
-#ifdef DEBUG
-#endif
 		}
 	}
 
-- 
2.20.1

