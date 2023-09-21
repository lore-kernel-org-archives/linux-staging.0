Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B8F4423
	for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 03:21:34 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-57ad95c555eso289547eaf.3
        for <linux-staging@lists.linux.dev>; Wed, 20 Sep 2023 20:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1695266494; x=1695871294; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KtRvKPT9+7eyOX/zT8mRxryLZr0gtKfNxCNmwldDtxU=;
        b=VSdm/RuEMhuvwEKUR4krGK50Bl1f8LAN5OR1nWyAXs6RJrYzxlhu8EpJu8KLT78Vy8
         6LnXnUGRfrPgOUPZNKxFgoHcIELIhIa529VXoa05O/mBc0fZN04ng8XHm1m0fLm1MeUM
         3kXCGQRXRSSsys/RyNQPc6hoPdMm9xOryuIpEhxST9lJu0XaAPS1GDLAbo+mC1avW25r
         hkTcbuVWEfL89DaRIBATWtBIG22YnIL3gpxaqPgpP76cAfU/0WMuiZJo/VKLi/ndHigZ
         lNQ7TNTXMGz/juWEltZCxngyA+Ui1ufzWiVkKAvWL9Ojr3HAsuETCroTQC4b1qKFQk7m
         slfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695266494; x=1695871294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KtRvKPT9+7eyOX/zT8mRxryLZr0gtKfNxCNmwldDtxU=;
        b=ogoEJliHoE4Il/CFU/O+NO0WtAvMpZDlfpifRESxxFKBnR1CFRfQAk+4RFhO7aZzoS
         tVFTggsMEg0RmWFLJUv4UA0+c/IUWLP10aJeI4p/I1adfd4cRJz/IWde2O12O/mSD/Vf
         6/dtTB+EBhH7YBcqvEa12s2fm65yGAUgUBQ2EyvgbFP/zc+s0+kUnVqXqdDSiGILHG3w
         i9r4agp533Z6mp3pujMinfSs5VI7cB6vCd/NBoxUh+/pRV+oGX93KKtgJjsQiLMq9Qz0
         TIhixqKgOHBlvu3scvE/IFxYkDqnh5PDVPgd/E/16YfSKDeOzPJxV0LYG/BMsqPJOnrk
         tPQw==
X-Gm-Message-State: AOJu0YyiPGcfMMd7ee6GkkJpX9s6a3ECh7Gb1zsJTnim+mvr0vUYWQ0p
	WujCf8QDs4ZxpyIjxzcLQNLeDg==
X-Google-Smtp-Source: AGHT+IEbX8Qo9V4QuueKm1KdT+rcfOJ1gMmzn3ve2in8nVuvW+Hh4gvNkRQ99n1WWgiQVfRd8wpWUA==
X-Received: by 2002:a05:6870:8a27:b0:1d5:bb9e:a30e with SMTP id p39-20020a0568708a2700b001d5bb9ea30emr4757501oaq.34.1695266494121;
        Wed, 20 Sep 2023 20:21:34 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id p14-20020a62ab0e000000b0068e49cb1692sm237324pff.1.2023.09.20.20.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 20:21:33 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 08/11] Staging: rtl8192e: Rename variable Policy
Date: Wed, 20 Sep 2023 20:25:12 -0700
Message-ID: <20230921032515.96152-9-tdavies@darkphysics.net>
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

Rename variable Policy to policy to fix checkpatch warning Avoid
CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 4 ++--
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index a5676f01855b..5fc4038708b6 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -462,7 +462,7 @@ int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb)
 }
 
 void rtllib_ts_init_add_ba(struct rtllib_device *ieee, struct tx_ts_record *pTS,
-			   u8 Policy, u8	bOverwritePending)
+			   u8 policy, u8	bOverwritePending)
 {
 	struct ba_record *pBA = &pTS->TxPendingBARecord;
 
@@ -473,7 +473,7 @@ void rtllib_ts_init_add_ba(struct rtllib_device *ieee, struct tx_ts_record *pTS,
 
 	pBA->dialog_token++;
 	pBA->ba_param_set.field.amsdu_support = 0;
-	pBA->ba_param_set.field.ba_policy = Policy;
+	pBA->ba_param_set.field.ba_policy = policy;
 	pBA->ba_param_set.field.tid = pTS->TsCommonInfo.TSpec.f.TSInfo.field.ucTSID;
 	pBA->ba_param_set.field.buffer_size = 32;
 	pBA->ba_timeout_value = 0;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index b518e23ff558..427f97325e87 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1834,7 +1834,7 @@ int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb);
 int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb);
 int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb);
 void rtllib_ts_init_add_ba(struct rtllib_device *ieee, struct tx_ts_record *pTS,
-			   u8 Policy, u8 bOverwritePending);
+			   u8 policy, u8 bOverwritePending);
 void rtllib_ts_init_del_ba(struct rtllib_device *ieee,
 			   struct ts_common_info *pTsCommonInfo,
 			   enum tr_select TxRxSelect);
-- 
2.39.2

