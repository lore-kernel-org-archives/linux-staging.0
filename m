Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DA04423
	for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 03:21:36 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3ab29af398aso327417b6e.1
        for <linux-staging@lists.linux.dev>; Wed, 20 Sep 2023 20:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1695266496; x=1695871296; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezc9OmR5yedthZ9g5F70+CNner2Or9B8MzoP6J9I9Ho=;
        b=W/Idc4T6r4j/wt4DS0nH2WP1c0lXKC8uCUFrAaCvwXnPNYbBOYE6ElwLsNIgrR5A2B
         eTTtk1Lp2zVqlQ+9GRxvMGTbz177UlOz9e+YiXI6zMlKtA8T86/V2H5GtupFAjK1gbiD
         zrgjQnPNZf+QvGixhrw4IVF/whRokAMDVYUsH9yk8WobHWDRsE2gotV616fjVZyFTYms
         j2JXql4QrFovskKd7vTAbfCvv9PVE4rGreAjelG4CFZaeG6j4BAb7xdN83MZ+hW0fbUl
         /pyDkIIPEIEDylwa7mfjNZTz572RdfSwxjazkhReMR0kkcRs6gspyOTcdWuL/hI602Ju
         lSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695266496; x=1695871296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ezc9OmR5yedthZ9g5F70+CNner2Or9B8MzoP6J9I9Ho=;
        b=CE0XopQW9cVUZLqLK/m0J2sguLSaXwgdC+Kig7eAvSYMkwwNDlXRJl6xj3wFomDdRg
         JPkXBsIHdfJFQT/DWI3RzQHsDsbWA/vOq6rv7DEGpE0DQ5LJp1WViHFRqqhUrUgOd5XS
         vXh92MjjHuUnwyREpB71SWX14n0Y4Y60uTEfs+FwEsCGzzvvF9rfRsKHsC7VIXUxYR3T
         CT6o4JudV7BLn04z7bunALRoJviFiaND53hbeuQaJXccU5P6YtT+xGDEZXFJJD8ExzkK
         KxEq7Er48LHE2cho0yLhCrI9pfOh6OOb3GPTssZ05KekFaTTLxTd1qKTyiq9MGZpOn+j
         DKgQ==
X-Gm-Message-State: AOJu0YyV9WgYi1VfzQZzeP0ejXqiHqQ+QQ4+w4Cy/kwPw/skZx+QsaY/
	ExgnJPlTgAM65nralHt0OJ7qPA==
X-Google-Smtp-Source: AGHT+IGEJBimbigrOD3g2s4seBK77ByvczbtIpyLEP7HvmmZfcSayeQlh8qqRBIoF88s87CiwZpOpQ==
X-Received: by 2002:a05:6808:1387:b0:3a8:5c24:4ef6 with SMTP id c7-20020a056808138700b003a85c244ef6mr4946471oiw.58.1695266496267;
        Wed, 20 Sep 2023 20:21:36 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id p14-20020a62ab0e000000b0068e49cb1692sm237324pff.1.2023.09.20.20.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 20:21:35 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 10/11] Staging: rtl8192e: Rename function TSInitialize
Date: Wed, 20 Sep 2023 20:25:14 -0700
Message-ID: <20230921032515.96152-11-tdavies@darkphysics.net>
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

Rename function TSInitialize to rtllib_ts_init to fix checkpatch warning Avoid
CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 drivers/staging/rtl8192e/rtllib_module.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index d52deba1f20e..637e22897803 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -120,7 +120,7 @@ static void ResetRxTsEntry(struct rx_ts_record *ts)
 	rtllib_reset_ba_entry(&ts->rx_admitted_ba_record);
 }
 
-void TSInitialize(struct rtllib_device *ieee)
+void rtllib_ts_init(struct rtllib_device *ieee)
 {
 	struct tx_ts_record *pTxTS  = ieee->TxTsRecord;
 	struct rx_ts_record *rxts  = ieee->RxTsRecord;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 727bdcf7455d..c314324720c4 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1844,7 +1844,7 @@ void rtllib_rx_ba_inact_timeout(struct timer_list *t);
 void rtllib_reset_ba_entry(struct ba_record *pBA);
 bool rtllib_get_ts(struct rtllib_device *ieee, struct ts_common_info **ppTS, u8 *addr,
 	   u8 TID, enum tr_select TxRxSelect, bool bAddNewTs);
-void TSInitialize(struct rtllib_device *ieee);
+void rtllib_ts_init(struct rtllib_device *ieee);
 void TsStartAddBaProcess(struct rtllib_device *ieee,
 			 struct tx_ts_record *pTxTS);
 void RemovePeerTS(struct rtllib_device *ieee, u8 *addr);
diff --git a/drivers/staging/rtl8192e/rtllib_module.c b/drivers/staging/rtl8192e/rtllib_module.c
index 2416e0c60255..abd6bfd4dfa3 100644
--- a/drivers/staging/rtl8192e/rtllib_module.c
+++ b/drivers/staging/rtl8192e/rtllib_module.c
@@ -128,7 +128,7 @@ struct net_device *alloc_rtllib(int sizeof_priv)
 
 	HTUpdateDefaultSetting(ieee);
 	HTInitializeHTInfo(ieee);
-	TSInitialize(ieee);
+	rtllib_ts_init(ieee);
 	for (i = 0; i < IEEE_IBSS_MAC_HASH_SIZE; i++)
 		INIT_LIST_HEAD(&ieee->ibss_mac_hash[i]);
 
-- 
2.39.2

