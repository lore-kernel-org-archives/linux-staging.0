Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9C8A29
	for <linux-staging@lists.linux.dev>; Sun, 20 Aug 2023 00:45:31 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1c26bb27feeso1425016fac.0
        for <linux-staging@lists.linux.dev>; Sat, 19 Aug 2023 17:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1692492330; x=1693097130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04bHVEEkcCQfELj7BMGzistsSMzG1MFXGIOcgHixp1Y=;
        b=lWyKD0/Y974RZ9Dke+vF8iXtySRYqZ2OW5RnA/vPXAWz+XzZyLFapjmZOkkX5Pqicq
         hciiXW8VoT51xt3TbIXLK5OQHi/eRsuNDGQ8pVm6wPPUguiNkoOAWbEXT4KMrYKgFzLB
         VKtsGBrPauLLsrQH5MShRRuqtQiLxzrxKY5yLlfxgB4alqlO1sgZfl+zlWiJiyN9Dp4L
         oHm6rQ7BOj3/wg/hvm6bq5j+5eZwlfvqc4ScBdg0yDX0DnmX0i+RVax5wFCyiZAMt79e
         fsLcCIdVk/Se4RdsdwpbbN9hgspQdVOz0GGQZJOsr3+gjkpZHcSkr+UXRf+O6GoSxngy
         saKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692492330; x=1693097130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=04bHVEEkcCQfELj7BMGzistsSMzG1MFXGIOcgHixp1Y=;
        b=TxeNpR/Nh8HjBB2JyzYrtQ7/cqFPC5YuoKa2Uyi9nWU2BU+pOPu6ARq6lV97QJQ7RR
         0fHjhebaQYNKn7JQlZnBW55qotucCatNiFgKN+jJJcG0uSH/SqZbF7n0Bm2PpyFdQAoT
         kaIUU2JQ6C7KUdY64RuYDV43SJewRfSRp1knDclAyeU4viCauPat4DiSaCx8QVRKMpvf
         6ZR/C4LxZ3cGmX22jpr0V6lDpCQtFemAdpzs3Vv0OrD5SfpZchbC7B3OGJ4UqaXXN78c
         rFXNi3nwfZmpmyEPf4dmGj/YiCyCSub1NV3OOvmpG835eL9X4gV4HjAVXAtgRrKVjwrc
         CHaw==
X-Gm-Message-State: AOJu0YwY0hoxvyGxX+qWh6115qLuXX2fo2u4TQ8QWnnaU0cXpTEv40PO
	iBvfuaSPUHwNNR5jkmvtjsnMA5Z+iFWQxW4Bmtc4FKfM
X-Google-Smtp-Source: AGHT+IHtMPqGwgIfqW46Yc3fC8nKTtlYxQaGvqVtg7G6g10VyIsKcrL+Wj2vtkyttvmDfYXo/Wi8Kw==
X-Received: by 2002:a05:6870:fb8a:b0:1bb:6ee1:114e with SMTP id kv10-20020a056870fb8a00b001bb6ee1114emr4173284oab.28.1692492330446;
        Sat, 19 Aug 2023 17:45:30 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 25-20020a17090a1a1900b00268b439a0cbsm4004884pjk.23.2023.08.19.17.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Aug 2023 17:45:30 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 15/16] Staging: rtl8192e: Rename variable pRxTS in function rtllib_rx_check_duplicate()
Date: Sat, 19 Aug 2023 17:47:43 -0700
Message-ID: <20230820004744.278022-16-tdavies@darkphysics.net>
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

Rename variable pRxTS in function rtllib_rx_check_duplicate() to ts
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index e97debe6a7d2..491789ebcc08 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -922,15 +922,15 @@ static int rtllib_rx_check_duplicate(struct rtllib_device *ieee,
 				return -1;
 		}
 	} else {
-		struct rx_ts_record *pRxTS = NULL;
+		struct rx_ts_record *ts = NULL;
 
-		if (GetTs(ieee, (struct ts_common_info **)&pRxTS, hdr->addr2,
+		if (GetTs(ieee, (struct ts_common_info **)&ts, hdr->addr2,
 			(u8)Frame_QoSTID((u8 *)(skb->data)), RX_DIR, true)) {
-			if ((fc & (1 << 11)) && (frag == pRxTS->rx_last_frag_num) &&
-			    (WLAN_GET_SEQ_SEQ(sc) == pRxTS->rx_last_seq_num))
+			if ((fc & (1 << 11)) && (frag == ts->rx_last_frag_num) &&
+			    (WLAN_GET_SEQ_SEQ(sc) == ts->rx_last_seq_num))
 				return -1;
-			pRxTS->rx_last_frag_num = frag;
-			pRxTS->rx_last_seq_num = WLAN_GET_SEQ_SEQ(sc);
+			ts->rx_last_frag_num = frag;
+			ts->rx_last_seq_num = WLAN_GET_SEQ_SEQ(sc);
 		} else {
 			netdev_warn(ieee->dev, "%s(): No TS! Skip the check!\n",
 				    __func__);
-- 
2.41.0

