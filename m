Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2F713D509
	for <linux-staging@lists.linux.dev>; Wed, 24 Jan 2024 22:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706136315; cv=none; b=AIuN4PyW7Qodrz7WXGMZxhg6rQxGBYpMw6jglyZP9nF6nwp/b9LhabJZ9hHeuXRR3kqRfA6PU8NzX9IbgxK1ayI54CKyv4LYvnG8g5hYB2HGyFPrljxciB9SOR8gE1up4mTexBq1Xivy3P7dcIFEoIfmw9x0JoGedQQrKMZE63c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706136315; c=relaxed/simple;
	bh=AscnLBC/gI9vMHyhNJgjD3txTicaELoHziKudejDUBo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I6JtZ6l2oC2ZdPRbjIx0Ewfyhu4lJiXWkY5Sy5DT5hLeh7lTEghLJPPx7noxQa6FzRdTnNsROTiNtr9B6liLSDxIj5qJQu1sYsBXleca072LUZCaxZ3e/TsNV3C7mgqcS5cvHDSGvtQ9RCfQuqzkaDdIsE6VJp2xc7ciDO6JtLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=VDUUKN1o; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="VDUUKN1o"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d75c97ea6aso1138375ad.1
        for <linux-staging@lists.linux.dev>; Wed, 24 Jan 2024 14:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1706136313; x=1706741113; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QdqPBUNZraqL43uan7u+LFep+ywrWr8czcYGFA+EC7o=;
        b=VDUUKN1oX+DoMfHz/iLrbkzIfI/0Bzucd3htMRU1+dpfGfzzDUMtP/LPlFM6gtn7S7
         s8wVXV7sf3142pqsfmmHmYoP5A2/NmqvuOaXsFSdSrc/U+dG4jxf0zDrJaQn7KsH7+TE
         R6Ch2/kPxpOGoLpBIIEKI4VofHQMUtgSjXcr/dINGhgt6x9ZOeLJtm8MeRkixRNjfkdF
         3zMPoI4M40/yuAnZflwlcDsrIqFta3WeQB4eOkP9uOOImlh6hjf5jPPUOmAUig2tV7lg
         QNZCUtzLU00qEaxYIT7VTSy/98PRSInMpyDHJGQDEnokmEPU2r/MC8iuLHQ45vXDR/dy
         aJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706136313; x=1706741113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QdqPBUNZraqL43uan7u+LFep+ywrWr8czcYGFA+EC7o=;
        b=kER1jUDvdw7r4NHv7Ty1pFIRg3l2dpomxMR3bp/S3lnIOHpI60QkcKlpUGx/frh27c
         ai9YG58LTcEml7G5SKKpMwQAuefC4AiikJyOHgRgnyCO1aVLcP1X2ayGX05x7vp0DtCd
         t0uFZt/BKY6vaSTVQopqziyLytL8ZkiU1Zmmovjy0SyPwYrO0xi0CvbC+UjoDdJGCqz/
         osH+dIu7CRhYNrhyP9PjSUMGjdSB4m/Cv9NNeCB1JyXhYt4hL0nyPR7oS4nARkyKyCOC
         I6cK2hpu4wnGaT1WphrxVLijUUsx7dMtKD5780Qwl417COJONb6lJTdTimeKH5AMHR33
         ombw==
X-Gm-Message-State: AOJu0YzkH2y9e8Ws+ssYp+j9MWv3YgNerEQ216ZAkYWwkJw6G6NQeXG7
	OBFMep+ZUEF7sDRenODloV4B6xZ1LX9JTxidQXQEWbuGMajSs0epJEqm3flzZpQ=
X-Google-Smtp-Source: AGHT+IEWAtVzCHwnAwLVcDAG+VKM2RHUDYDuxI/3BFfm0YN83ZD+clW9UYbGq0hNYqoOAoUwfpKI3w==
X-Received: by 2002:a17:903:594:b0:1d4:ceab:58b9 with SMTP id jv20-20020a170903059400b001d4ceab58b9mr66432plb.40.1706136312992;
        Wed, 24 Jan 2024 14:45:12 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id i5-20020a170902c28500b001d73a2acc0csm6743987pld.283.2024.01.24.14.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 14:45:12 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 18/18] Staging: rtl8192e: Rename variable bForcedBgMode
Date: Wed, 24 Jan 2024 14:44:52 -0800
Message-Id: <20240124224452.968724-19-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240124224452.968724-1-tdavies@darkphysics.net>
References: <20240124224452.968724-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bForcedBgMode to forced_bg_mode to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 07a89d1af86d..348644998744 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1193,7 +1193,7 @@ struct rtllib_device {
 	u8 *assocreq_ies, *assocresp_ies;
 	size_t assocreq_ies_len, assocresp_ies_len;
 
-	bool	bForcedBgMode;
+	bool	forced_bg_mode;
 
 	u8 hwsec_active;
 	bool is_roaming;
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index ba35714f83af..2545ac8963c4 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -721,7 +721,7 @@ rtllib_association_req(struct rtllib_network *beacon,
 
 	if ((ieee->rtllib_ap_sec_type &&
 	    (ieee->rtllib_ap_sec_type(ieee) & SEC_ALG_TKIP)) ||
-	    ieee->bForcedBgMode) {
+	    ieee->forced_bg_mode) {
 		ieee->ht_info->enable_ht = 0;
 		ieee->mode = WIRELESS_MODE_G;
 	}
-- 
2.39.2

