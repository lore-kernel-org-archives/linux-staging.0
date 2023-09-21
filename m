Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9191845
	for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 03:21:28 +0000 (UTC)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-573249e73f8so335777eaf.1
        for <linux-staging@lists.linux.dev>; Wed, 20 Sep 2023 20:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1695266487; x=1695871287; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9T28hoTLO5x87Ag4jPx5k+ew24pfn/Ng0oLtGe8Q28Q=;
        b=lyNx0bw/Xw6+CTUd2G2xl3fSK0J1hbl64eZDUjegiSFx6sL/n9XpyvscP8tfVxUk/J
         4Im8XfH0lx0+mvlNm4ohwmoWqeZ7MRBFjRRGBfwOYAag/IgBtbvMszM/cdLB1URdAVZq
         HUaQVOq6+BvFjiMO/KZz3pjeIsT1zCQBZGutS0ylhZkitdlePh9MhvX6YtIV0C8ffcS+
         PSNs0oZVeQXgWsemoDDs8ptiLHNUaairb0+MPXjVMFJZqWbNVKKBNEsV6uFhH8VwEhfD
         HonRSej3PAzSt0B4Z4vc2kog3967kx6GPaxGIOFh9em83/Uphfe9e8Ea5paVTLYu4rHH
         N7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695266487; x=1695871287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9T28hoTLO5x87Ag4jPx5k+ew24pfn/Ng0oLtGe8Q28Q=;
        b=puXBn3RAhWEOsMpvzxaZ16LzMycJyXRNv8MiYul5rtPWO5tc1yIrm+6Z+aRpHXbuHm
         mdgcTvnMwtyzUHDJvz2Lwdro49uuHKjFTZmeNISN/eZ6ZrRBCsN3YBNLew7PGQGV5CZd
         U8sW1O8sSTbGC39nQ6H5A3XNC/pR/1khS5Wp1h97l1Ii7FvAohEA1DLcN4QZxoPt+FrW
         tPsvLUiKPiMj+Vl7hfBNSCAje1QYqFVCLrLxwoiMdmHQxwWAsZJNeJlf2fGjSAaw2yq7
         C4C5DTweaKg7Ippt3WgJHLMAPzWhwyvBlWQ+5Wfu5n+lFFhpiQn8Wslzctfi3Diwjwqz
         l4Tg==
X-Gm-Message-State: AOJu0YykGGq58X4+KDh79PwpvI87LHAMDxKU7sq0nlpFDCtVnoQevydW
	ZaIWtgomOes9rzqvOUyB7O5NfA==
X-Google-Smtp-Source: AGHT+IHsYeM75yCubkThm39347Ub1pA0th/L+sZyeodDPuns08ZJlB2AazSGK2eQEmTUCju7/FMPmw==
X-Received: by 2002:a05:6870:14d2:b0:1d5:e15c:5dba with SMTP id l18-20020a05687014d200b001d5e15c5dbamr4980714oab.45.1695266487482;
        Wed, 20 Sep 2023 20:21:27 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id p14-20020a62ab0e000000b0068e49cb1692sm237324pff.1.2023.09.20.20.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 20:21:27 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 02/11] Staging: rtl8192e: Rename variable pAdmittedBa
Date: Wed, 20 Sep 2023 20:25:06 -0700
Message-ID: <20230921032515.96152-3-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230921032515.96152-1-tdavies@darkphysics.net>
References: <20230921032515.96152-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable pAdmittedBa to admitted_ba to fix checkpatch warning Avoid
CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index fbac0e598cf9..a12966cadbca 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -25,7 +25,7 @@ static void deactivate_ba_entry(struct rtllib_device *ieee, struct ba_record *pB
 
 static u8 tx_ts_delete_ba(struct rtllib_device *ieee, struct tx_ts_record *pTxTs)
 {
-	struct ba_record *pAdmittedBa = &pTxTs->TxAdmittedBARecord;
+	struct ba_record *admitted_ba = &pTxTs->TxAdmittedBARecord;
 	struct ba_record *pPendingBa = &pTxTs->TxPendingBARecord;
 	u8 bSendDELBA = false;
 
@@ -34,8 +34,8 @@ static u8 tx_ts_delete_ba(struct rtllib_device *ieee, struct tx_ts_record *pTxTs
 		bSendDELBA = true;
 	}
 
-	if (pAdmittedBa->b_valid) {
-		deactivate_ba_entry(ieee, pAdmittedBa);
+	if (admitted_ba->b_valid) {
+		deactivate_ba_entry(ieee, admitted_ba);
 		bSendDELBA = true;
 	}
 	return bSendDELBA;
-- 
2.39.2

