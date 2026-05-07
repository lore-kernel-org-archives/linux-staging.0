Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496A32D97BA
	for <linux-staging@lists.linux.dev>; Thu,  7 May 2026 17:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778176487; cv=none; b=nwaztYX1UTKyC6sG9cYPpG68gNPRO5VsWfIuxLn7Ne0q4Zny726GETxpZoMcefk3rm9J2ugKxMA6x6bVPvbdqvy3qyRPydFxPFvUQ3yN2YtGB9At3Wm00ssO/2M8twVLPY3c82pthtNTv//NRvxC//DONFSMEEXar2dGqmuySzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778176487; c=relaxed/simple;
	bh=ApIdv6ScYarklrgejDtBJS4KJIjKeS7V0CybnauQijU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YagdSA6Un8bFFssFABxNNANb3OCXfMOo3rSxYyW3nR8Gn9WcTy3WUS96z2yYgdFj4W61cTwg9NQJ4G9pqZq81/ezKnjn88N6a5LrlHQ67xzB7Blg2T/LQchGcY88vXQVk18qE3KnGVnikq3zZIpc0vy6K5dtgOifoC1CPy1q/Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hh/C4AcD; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hh/C4AcD"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2b9e9a6802aso4554585ad.3
        for <linux-staging@lists.linux.dev>; Thu, 07 May 2026 10:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778176486; x=1778781286; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sS2b5XRDHlulXvvSoNXnc31hTrbe+aIGEPYfO1L1ivs=;
        b=hh/C4AcDbjhY9x5p7Afysn7EHOkPEJiThzmdNYrAOXbkPKpe1lxEFphqZthkfW4Y7E
         29eeogJe2FWEy6jtnaIoeYZpcvnLSN4MtLJmKGMHMCAyLnqSKOuhkn08IPRaj8cR/le/
         melAWOfcu4/AhPLgruXTkwZ7GoFZ7HA14Ymyfw4x6WnGJA5y5yTUTpXONwIHnF9v/CSd
         D1JXn/Wd37q943Px92DLSO+tLeu4SAH2ZN7RjNVALzyC4n7s6nvM7QEZV4inYmbPkfw0
         s9NLR9HHe9Virdczs4357nMbaO2y4sKec629X8Ml44XNEYY5IFsamhizhZgGZmnsjiFH
         cGpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778176486; x=1778781286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sS2b5XRDHlulXvvSoNXnc31hTrbe+aIGEPYfO1L1ivs=;
        b=IKAVRHgGMo8MQtbx/fZGfA2aPelLOW4g/pjOYM7u8Ls9KGpKI3NQC4MaDGNRhPCSzj
         /z64zSwH4h/JJuA5Ij/RybpiCgXwPk9OyIAqZfQbJbmQDpi4uUhzPLUT27vaLhW7B4gp
         WnPLdRJBBzOb/9PEaSChsRMrHFY7lMANFNlYjouP9+32Ze/jGdrBWMg40BVRQYR1m4Bq
         auUVaUsdOzdi5Fd3YLWiCLnUOoqO0hGYCCB9aL/AIqEHv5kGWneUUY4E02kAsmaNyL0P
         h6jSj8wsZZ/6bIbQ0Nvu87irdXkk0hdiTM9yTQ2TfxmQVMjSmiQEqYWbdGBAe8VOVzwD
         TGvw==
X-Gm-Message-State: AOJu0Yx9RSRQgrS3VP3CyrVmhQNMuNTgWp/T8Z2QObVWD4Fp8OMRxD8u
	H4XMkLI5HbJCaWisr69yH4pCb4LPSAf4dZAW0C9OlxOfMvrdiSYQHXQE80CrNwGpXwRG4wD5
X-Gm-Gg: AeBDietQ2zQ+HDW9+LpE6LEhqvx1ghDjhZ305DR6EPnsNAmmO5vS74O9vQiXZ/ZXib3
	GqkXm8kVGSyYheNsx9vRq/pTDyRTEc1ZDn8dW0mQtaN2vz+8STDkxuNV6mdHxygFXjSvRcusRhn
	s2TZxljAfgkUwVxULcoGS8AAteazCZTMOJ1vVYyCyF7JfF1oirKbgJMhyeOtA+ZnKlPp+IICB9J
	6zVO1pQsPTou52pzW2W+TdedaH9aRGs9y5+c+AcL9UiK5lLsqCI6mnwRHHnIzcJD8O9aRu3/nCx
	I+VwkswOUtv3yn3nzofK593x/x1CkOXqKqxJZVHBjQcdPpbiCd46ASrs14rPQSWSzHTJJ3OdPax
	XOWLfY91dFjczFpbQE4dcLePvzMuy9RiQL60uCCVmf9U7FxalNABRtzlFld2DdJknkKQ780DEwx
	vAiMhpF0Jko17NTQ82m43flRNo6/V4tNpLd/bdLz8VQZ5D2N6huEBbgBi3cLbcZtQEUThHB15zc
	to/9I8ODcJiVwk=
X-Received: by 2002:a17:903:1a88:b0:2ba:7610:3f21 with SMTP id d9443c01a7336-2ba792b2efemr94837605ad.5.1778176485375;
        Thu, 07 May 2026 10:54:45 -0700 (PDT)
Received: from dreamhell.. ([157.15.35.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bae752d0e6sm3818565ad.10.2026.05.07.10.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 10:54:44 -0700 (PDT)
From: Shivam Gupta <shivgupta751157@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Shivam Gupta <shivgupta751157@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary braces
Date: Thu,  7 May 2026 23:22:18 +0530
Message-Id: <20260507175218.16831-1-shivgupta751157@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary braces around a single statement block
reported by checkpatch.

Signed-off-by: Shivam Gupta <shivgupta751157@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
index 58f6cf063498..f3195f6f7e57 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
@@ -294,9 +294,8 @@ static u8 halbtc8723b2ant_ActionAlgorithm(struct btc_coexist *pBtCoexist)
 
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_HS_OPERATION, &bBtHsOn);
 
-	if (!pBtLinkInfo->bBtLinkExist) {
+	if (!pBtLinkInfo->bBtLinkExist)
 		return algorithm;
-	}
 
 	if (pBtLinkInfo->bScoExist)
 		numOfDiffProfile++;
-- 
2.34.1

