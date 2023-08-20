Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90F77F1
	for <linux-staging@lists.linux.dev>; Sun, 20 Aug 2023 00:45:21 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1c4de3b9069so1359846fac.0
        for <linux-staging@lists.linux.dev>; Sat, 19 Aug 2023 17:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1692492321; x=1693097121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PWQQsv7kFWgeQHT/Yq5qIyfESDh5t6Uw6gZfyjJY5+M=;
        b=Twsf1xAMLd/DPZOXPb+fhb4p+9b30O+TQ7fyspz5Ps1crEAl4DMTMClQNgcBSLeqOG
         nP0lfVTpJKfIzyxphhnWX1N86FVRM2ApBSt4Z/Jm2lpk7LChSBeo41hufBYBspiUkC6O
         3FqqRKMGotVAY3uWxhtqOGST5OxJBhM5AEr2Ha9VhlZD6uaHLuSZBC8Yh1ZVHGgmyaEn
         Ia74ubvd/mkW4qUc3v/MWrdqr0u8iVjRyK3YBbLMkCrOMgcwCsmjNxjrFhW7wkjD4L5H
         W13Tnq7L6v4zmDY/gvu0bTMXi+wXNsRKpzIy82JRNVA1UmZbfRHOK9eYT9Iyir4Kwqy3
         rm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692492321; x=1693097121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PWQQsv7kFWgeQHT/Yq5qIyfESDh5t6Uw6gZfyjJY5+M=;
        b=Ui/tm5PbgrrtaZqLJq1KNLdYMJ4s6ACFC10/zWD/np/doRrX2qjvTMyRMhjRv5BhBp
         YaTU/gahZVDSqwTK7ANrSDhT1kyv5QlJ8A6SVEq6A7TTLMOt3kXqeF1nbLH+tL9vt1kX
         NNGdVZyWVEAVuaw2LSOmncNg9aocZAdph4d/eYlaaRY4oFl/1jxl2xAZYrZ6o/2AOyx2
         TSKxP6oJiWDSXhD1vM9NOiUpOAv7T7HhKM4zTX6dSF1rl35GXBfrEO+KY35i1d00sEsH
         1mk9HjlBXDBPe6m+sycO7jJzofQdCeFcSsmeQxx3sjYD3GhbmMtVvhiWRL5dixGiBlGa
         izog==
X-Gm-Message-State: AOJu0YydA2S9lhnmmU7zXHCan1ZjjHUUA6mFd3ij9kTGrOfW+WBzkN5O
	vcqMsCuePhRMDmHjBV06SQaTrw==
X-Google-Smtp-Source: AGHT+IF9UIajOIooUgvdl+U9eGGnBNrjW0vOH+LRG+GxZM32b970kY0+jvQ8KEd/v7FG5GFeME3prA==
X-Received: by 2002:a05:6870:9722:b0:1b3:715c:463e with SMTP id n34-20020a056870972200b001b3715c463emr5014038oaq.0.1692492320812;
        Sat, 19 Aug 2023 17:45:20 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 25-20020a17090a1a1900b00268b439a0cbsm4004884pjk.23.2023.08.19.17.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Aug 2023 17:45:20 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v3 03/16] Staging: rtl8192e: Rename variable pRxTs in function rtllib_rx_DELBA()
Date: Sat, 19 Aug 2023 17:47:31 -0700
Message-ID: <20230820004744.278022-4-tdavies@darkphysics.net>
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

Rename variable pRxTs in function rtllib_rx_DELBA() to ts
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v3:Resend as 16 patch series - no longer throttled by email provider
v2:Resending in smaller patch series
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 03d76765e85f..c584e9ec48b6 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -430,9 +430,9 @@ int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb)
 	pDelBaParamSet = (union delba_param_set *)&delba->payload[2];
 
 	if (pDelBaParamSet->field.initiator == 1) {
-		struct rx_ts_record *pRxTs;
+		struct rx_ts_record *ts;
 
-		if (!GetTs(ieee, (struct ts_common_info **)&pRxTs, dst,
+		if (!GetTs(ieee, (struct ts_common_info **)&ts, dst,
 			   (u8)pDelBaParamSet->field.tid, RX_DIR, false)) {
 			netdev_warn(ieee->dev,
 				    "%s(): can't get TS for RXTS. dst:%pM TID:%d\n",
@@ -441,7 +441,7 @@ int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb)
 			return -1;
 		}
 
-		rx_ts_delete_ba(ieee, pRxTs);
+		rx_ts_delete_ba(ieee, ts);
 	} else {
 		struct tx_ts_record *pTxTs;
 
-- 
2.41.0

