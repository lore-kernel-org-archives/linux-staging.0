Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429852C86
	for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 19:59:55 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id i5so13947608wrb.2
        for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 11:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ODnVjpTLttRxb05aaD1tiJImMPR2M4ruN0kVPtiNAwg=;
        b=oq44UYjhCUqKbjpyqQrmPBV473RckuYm4ABcyk2rmk5elUP4yJvPHTtbv4rrAqYMvt
         XPA+VE/Gr9vsj6TgyCcQWMHdWmNdBIPttj6r1Ay8ioqpS8pJecACGhullNYES8UKqwBg
         Mk47BN0liyiIdxDE7iP3s5dG4jG0J47p1Cr+k/moCOK/4B1D9sMDNPFvjreAx/SZn9Pa
         k+hX5aUXA5ZwNOQNADTWa/vQ8iEMWeL+oxiyBCpJx1KLN1eznCQRqUTCgrfO4GGWjnns
         KMWT6pCc2Huos/cw9tzmWxtnqa4Ir2nzKPwkI7sowjfPYJi8WgnafKUPY8TbrJh2eTAD
         gegA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ODnVjpTLttRxb05aaD1tiJImMPR2M4ruN0kVPtiNAwg=;
        b=RiQ33cCCKmb3hMAK3wYOkDQ55RFyCcdM5Elzj6ty515HMrXZVbp9Q0TZl1DS5fxqrw
         OGFAZtPKJYGEIM0JIZ38fnVZrf29iPDejcYgJsmylOe7EcURCmKvSObYxoUeQA/HU5YG
         6mfYmM71mmxUsMH2PfP1S2hnMU7yUYd/lHuRVLS/RVdg4FWhKotY5SvSHIX1K64o37zf
         YYFrBYmt2WpP4dA6qsgLf9q4ZQby+dMBLeKYO1YpJasSkk0u5nMiNp7Xz8/pcZbu2vkB
         KFVdg21huTujttuES3aF93CWG0aQpIl6ehO1oJpSFJ6mP2vbZUYuHWSvfE+OaOrSk6RF
         OGqA==
X-Gm-Message-State: AOAM532IuFB8eI0M8lilEFlqyJ546cGRUFRdEIhs7N8Ej2zWx1DTwqTr
	I8Z9KpcGRd4TFxuIw8r9Pec=
X-Google-Smtp-Source: ABdhPJz+8Cjzvt0+IZhAoMtYNDgYheZj7U5yyvVSr5tyTGmgnTexg4MUuz6OgmhK1rUOmY6McaM9mw==
X-Received: by 2002:adf:aac5:: with SMTP id i5mr9886807wrc.67.1637870393725;
        Thu, 25 Nov 2021 11:59:53 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ac86])
        by smtp.gmail.com with ESMTPSA id h13sm3762721wrx.82.2021.11.25.11.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 11:59:53 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 5/5] staging: r8188eu: remove TxCount from getTxPowerIndex88E()
Date: Thu, 25 Nov 2021 20:59:36 +0100
Message-Id: <20211125195936.10060-6-straube.linux@gmail.com>
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

In getTxPowerIndex88E() the variable TxCount is set to RF_PATH_A and
never changed. Remove the unnecessary extra variable and replace its
usage with RF_PATH_A.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
index 7124b9880efa..73d5eb53a927 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
@@ -611,18 +611,17 @@ static void getTxPowerIndex88E(struct adapter *Adapter, u8 channel, u8 *cckPower
 {
 	struct hal_data_8188e *pHalData = GET_HAL_DATA(Adapter);
 	u8 index = (channel - 1);
-	u8 TxCount = RF_PATH_A;
 
 	/*  1. CCK */
-	cckPowerLevel[TxCount] = pHalData->Index24G_CCK_Base[TxCount][index];
+	cckPowerLevel[RF_PATH_A] = pHalData->Index24G_CCK_Base[RF_PATH_A][index];
 	/* 2. OFDM */
-	ofdmPowerLevel[TxCount] = pHalData->Index24G_BW40_Base[RF_PATH_A][index] +
-		pHalData->OFDM_24G_Diff[TxCount][RF_PATH_A];
+	ofdmPowerLevel[RF_PATH_A] = pHalData->Index24G_BW40_Base[RF_PATH_A][index] +
+		pHalData->OFDM_24G_Diff[RF_PATH_A][RF_PATH_A];
 	/*  1. BW20 */
-	BW20PowerLevel[TxCount] = pHalData->Index24G_BW40_Base[RF_PATH_A][index] +
-		pHalData->BW20_24G_Diff[TxCount][RF_PATH_A];
+	BW20PowerLevel[RF_PATH_A] = pHalData->Index24G_BW40_Base[RF_PATH_A][index] +
+		pHalData->BW20_24G_Diff[RF_PATH_A][RF_PATH_A];
 	/* 2. BW40 */
-	BW40PowerLevel[TxCount] = pHalData->Index24G_BW40_Base[TxCount][index];
+	BW40PowerLevel[RF_PATH_A] = pHalData->Index24G_BW40_Base[RF_PATH_A][index];
 }
 
 static void phy_PowerIndexCheck88E(struct adapter *Adapter, u8 channel, u8 *cckPowerLevel,
-- 
2.33.1

