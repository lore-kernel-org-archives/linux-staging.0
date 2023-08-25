Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2651096F
	for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 14:06:32 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-68a529e1974so778301b3a.3
        for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 07:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1692972392; x=1693577192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8uZGn2rcr8NpmsddpOyVm5Sphf/55sH0+4L2Cu0FSA=;
        b=AKdRlJEYU6psAoEVGBsYYok8ix5lDY0otfHYW812fh6kToF4lXC4NDFUDMowtOKUVt
         e9O1qn3LeA8iRzyrVLUjGCI3jqrMD/UOQCrxw7A7m0mTHVFblAYwfbBKOdiwGItquHD7
         j+nSEOf8Ol+cmv17brgTKvB6fKeytR81LPXmU5u4CzHrhx//STuP6YHKLzd05EoWV/cf
         3MKzQrD2yg+t1V9fM1kdmH/SyQZlD63sPyUrT+E7TyEEWsvYtb/i9bh8H/kMcmxbDDwS
         +37jUkqwtW7lzmLUsNLSOJx0tGCgVibiOPnueP6qnJAp3nMfrZIMpmxFrgDCH0YFrAjx
         /Qxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692972392; x=1693577192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b8uZGn2rcr8NpmsddpOyVm5Sphf/55sH0+4L2Cu0FSA=;
        b=XWFNYIe7dAawI0hU/F1Fu02/xPskJZ0Zc3xRC0Tpfw1+p9O3mjj7ii21CULcpwrqcC
         UuU3CzBFVgndeD2TcVEga9eM1QB+bk5ygSLiDORdLpv5IjjuLzqaW0qP0OkZsgTsOrN2
         V/Wxqa4YFh5rfhfN4GiJ41sb0PT+/1I85bAFzvQtxBNIhi+s7IHxbHZYTZ99NlypiDKp
         85cGYZdQTYryoLQYrmkEyn7UYXJnLRS+n55QlVDLMeFkdfysj5dLzXcfNhpW1gaTFvgP
         r7ino3WRI1SBROMtsEdFZbQPduVCqAF/1Je3Vijz6d5SyykJ+NUIhMVxpf/s/V7XoDjP
         dkUQ==
X-Gm-Message-State: AOJu0Yz0Ym750+aLrxPYqoi86uEBDVpI+OBqfJwbW/sAAMMEUlUqI+rU
	f6cgbVTTjj1pVVdi8nxOQBrtZA==
X-Google-Smtp-Source: AGHT+IEo7LTkz1ucBHQ9GfN2n8Hk4OLNSZrioh3z59fcp535MkMdKBvKRvasUZb9/5nRsDRNLBSirw==
X-Received: by 2002:a05:6a00:22c1:b0:686:f84d:a4ec with SMTP id f1-20020a056a0022c100b00686f84da4ecmr18251315pfj.27.1692972392134;
        Fri, 25 Aug 2023 07:06:32 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id v23-20020a62a517000000b006870721fcc5sm1628232pfm.175.2023.08.25.07.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 07:06:31 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v4 16/16] Staging: rtl8192e: Rename variable pTS in function rtllib_rx_InfraAdhoc()
Date: Fri, 25 Aug 2023 07:08:47 -0700
Message-ID: <20230825140847.501113-17-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825140847.501113-1-tdavies@darkphysics.net>
References: <20230825140847.501113-1-tdavies@darkphysics.net>
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
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
v4:Resending whole series as v4
v3:No Changes
v2:No Changes
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

