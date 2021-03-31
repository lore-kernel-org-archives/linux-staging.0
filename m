Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683E36F
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 09:41:08 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id h10so21506155edt.13
        for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 02:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cioluv068BWZZVTvNHvrKSQdGLCkCRUED0iLUEaae4k=;
        b=YvNVFL6Nf6wNjcGPIJrJ0nQPd/TQ3W4pdMva3xmLk7KjVQxEo9R/8k0LVaymLDu6NN
         g60HrP9SaQ/JWnM5HF2d89yBT4JhcHT4ZymhwTI6yL3Icz2B6IhgihTXmtG7Vafsq9Rq
         rF08srpmIi+/u5t8TwyWkMeywQ3gCZjazwSmGyAKX+vuwp8yPr2AKKu+3riAr5kKfWM1
         NQBMTn1dKBRORz/sPbv20TZpN2RxfPZ7YjjYZYz9INf5BDwH/Bql6V8a3k+2MxiDOZ9s
         2IlMcuxp6/TN6deEu3YdbXx/YJiGSP2xQjNDCGgD1eTUI88nUbDKtd2u+yFK1d3pj9ix
         uCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cioluv068BWZZVTvNHvrKSQdGLCkCRUED0iLUEaae4k=;
        b=sqULSH+l8AHqOBLW+Kb5c6ubFTzM5btEz1byTifoNV8RtFk6/sIuzdwoP3So1uExZz
         T+Kas+R27TzvN8iiDCSde7bU+klKvSyfZ0Pi5hDQOTJZT3VpcNMDlY4wpYEjEoQp64Kj
         4Paj5Z1RYEVANDf96QuQA1pvUUwHq0gsTclXDU6TxBMoyWpi1MuKcwce8+h1gSGKOvqk
         lA0j3dE4T0F7TLvpF32XVFTC5M2RO+9E17dlvQ0oJ91WDYLnmzueDCeRsjI2z9JAy9/U
         5XgHHp/s7r8zMBULFh7q8/i7Ax8nyUXt1tqEDAebziKtCR6JvQIDwT4rBR0sTmj/t1Dq
         aNKw==
X-Gm-Message-State: AOAM530n5hGKiy7k+V4WuKdsnyQT0npSobt8qEM+kTfuowZBhCjTfkpz
	8RvT40Sq+ehVksoRbHoE2cE=
X-Google-Smtp-Source: ABdhPJyWYybZ2vratvK6qdEZKhldxeG2zIHvoz5Rt9vjiYhe14nyEj+qForF7F4X1bAEqPnUGyuq7A==
X-Received: by 2002:a50:ec07:: with SMTP id g7mr2586847edr.72.1617183666985;
        Wed, 31 Mar 2021 02:41:06 -0700 (PDT)
Received: from agape ([5.171.73.44])
        by smtp.gmail.com with ESMTPSA id q26sm835499eja.45.2021.03.31.02.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 02:41:06 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 29/40] staging: rtl8723bs: remove commented RT_TRACE calls in hal/rtl8723b_rf6052.c
Date: Wed, 31 Mar 2021 11:39:57 +0200
Message-Id: <c94f0bfba6c79a7ac7102e9f8ee26662a49d48bc.1617183374.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617183374.git.fabioaiuto83@gmail.com>
References: <cover.1617183374.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove commented RT_TRACE calls in hal/rtl8723b_rf6052.c

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c b/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
index 73b47f053549..38228b46b1ee 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
@@ -74,7 +74,6 @@ void PHY_RF6052SetBandwidth8723B(
 		break;
 
 	default:
-		/* RT_TRACE(COMP_DBG, DBG_LOUD, ("PHY_SetRF8225Bandwidth(): unknown Bandwidth: %#X\n", Bandwidth)); */
 		break;
 	}
 
@@ -153,7 +152,6 @@ static int phy_RF6052_Config_ParaFile(struct adapter *Adapter)
 
 	ODM_ConfigRFWithTxPwrTrackHeaderFile(&pHalData->odmpriv);
 
-	/* RT_TRACE(COMP_INIT, DBG_LOUD, ("<---phy_RF6052_Config_ParaFile()\n")); */
 	return _SUCCESS;
 }
 
-- 
2.20.1

