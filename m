Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37538A2A
	for <linux-staging@lists.linux.dev>; Sun, 20 Aug 2023 00:45:32 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1ba5cda3530so1412598fac.3
        for <linux-staging@lists.linux.dev>; Sat, 19 Aug 2023 17:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1692492331; x=1693097131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysy6KqWBdSIiPtqdG1q8s0EmvM3hksz/JnZTcoVMaYg=;
        b=SDqR35oC2HkOSMM1WGpi3NWTOWCkl43q3xZ5Gko3Vhvt7aQOmQqc/wnfKjTR0SEDR1
         DwJM6J82Gp3Wo7SGU4WJkqBeBZqoqdMHOtqNV2vOjppVynr9xA+YGKtOf+rK1pox1GHx
         3Z886WniKdEsCzRZ9frmXiMx3A+RAh++1Gol0bPsVVmezEMuY4GKtGFb2WcqMknaPcB6
         b+TZGtN9zYnwRnGFmCXIwoS12nc5faznB46vYMotjommIKvBUgNPOajLHHIHzQBUU7QR
         TGgJwQkQB8/L2ixvH5SiiqXc6nGwSPtS2iSssPc1CU2sxkARfNfpl8QBc5fQLiwdgsOw
         YnHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692492331; x=1693097131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ysy6KqWBdSIiPtqdG1q8s0EmvM3hksz/JnZTcoVMaYg=;
        b=Hccj3pzAbnSODLUPCuKCkYaUlSuhO79KdxYSH8waKOMkFU7JDMlkJjzn8i2U/d+JB3
         E4dEUi8/BQ0Q6N4n8d36/61vf8yXDDo3Z41n12brSJgQbXDMIIKkQgFK9fVqj7nZp9xQ
         gQ+75zEeUsu3Y3p2Pl7wrQKwua9WLgK/pwWbCdLeUdcFmWkiwxU8HyNdPYguC+7nBIZX
         zRVWwpt4GgapiDKVDEdKpBhWIi2o9DCkKYDuCBlK6fCIxkjPsGJu3a/gJZYQlAUm1m3G
         tT90ew5CuSgSD7G8PgNBsusfPsXd5ZEEHu/3aAKhqR5N5cuNAE3jENpIygMkz/HnsMAZ
         gjqA==
X-Gm-Message-State: AOJu0Yz0+k9tffDay6tkYeOz+zKQPprPEWv7plNXFR4PshmQsDev5C8v
	g4IkiIZnCxZ1BRmFy8hMqHc4YA==
X-Google-Smtp-Source: AGHT+IHOF0/g/YsZ5K8+gBCvADVjrSIfrL9ZcK0dM/YcukPXFZacvttvxqKEdBr/qhW1XVPQsOb1fw==
X-Received: by 2002:a05:6870:32ce:b0:1c0:131b:2bb8 with SMTP id r14-20020a05687032ce00b001c0131b2bb8mr4532785oac.58.1692492331213;
        Sat, 19 Aug 2023 17:45:31 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 25-20020a17090a1a1900b00268b439a0cbsm4004884pjk.23.2023.08.19.17.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Aug 2023 17:45:30 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 16/16] Staging: rtl8192e: Rename variable pTS in function rtllib_rx_InfraAdhoc()
Date: Sat, 19 Aug 2023 17:47:44 -0700
Message-ID: <20230820004744.278022-17-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230820004744.278022-1-tdavies@darkphysics.net>
References: <20230820004744.278022-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable pTS in function rtllib_rx_InfraAdhoc() to ts
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 491789ebcc08..53ec4f077bd8 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1280,7 +1280,7 @@ static int rtllib_rx_InfraAdhoc(struct rtllib_device *ieee, struct sk_buff *skb,
 	struct rtllib_hdr_4addr *hdr = (struct rtllib_hdr_4addr *)skb->data;
 	struct lib80211_crypt_data *crypt = NULL;
 	struct rtllib_rxb *rxb = NULL;
-	struct rx_ts_record *pTS = NULL;
+	struct rx_ts_record *ts = NULL;
 	u16 fc, sc, SeqNum = 0;
 	u8 type, stype, multicast = 0, unicast = 0, nr_subframes = 0, TID = 0;
 	u8 dst[ETH_ALEN];
@@ -1386,7 +1386,7 @@ static int rtllib_rx_InfraAdhoc(struct rtllib_device *ieee, struct sk_buff *skb,
 		&& (!bToOtherSTA)) {
 		TID = Frame_QoSTID(skb->data);
 		SeqNum = WLAN_GET_SEQ_SEQ(sc);
-		GetTs(ieee, (struct ts_common_info **)&pTS, hdr->addr2, TID,
+		GetTs(ieee, (struct ts_common_info **)&ts, hdr->addr2, TID,
 		      RX_DIR, true);
 		if (TID != 0 && TID != 3)
 			ieee->bis_any_nonbepkts = true;
@@ -1425,10 +1425,10 @@ static int rtllib_rx_InfraAdhoc(struct rtllib_device *ieee, struct sk_buff *skb,
 	}
 
 	/* Indicate packets to upper layer or Rx Reorder */
-	if (!ieee->ht_info->cur_rx_reorder_enable || pTS == NULL || bToOtherSTA)
+	if (!ieee->ht_info->cur_rx_reorder_enable || ts == NULL || bToOtherSTA)
 		rtllib_rx_indicate_pkt_legacy(ieee, rx_stats, rxb, dst, src);
 	else
-		RxReorderIndicatePacket(ieee, rxb, pTS, SeqNum);
+		RxReorderIndicatePacket(ieee, rxb, ts, SeqNum);
 
 	dev_kfree_skb(skb);
 
-- 
2.41.0

