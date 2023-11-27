Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17755566C
	for <linux-staging@lists.linux.dev>; Mon, 27 Nov 2023 05:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="R5bE6pwM"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1ce656b9780so27183985ad.2
        for <linux-staging@lists.linux.dev>; Sun, 26 Nov 2023 21:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1701063389; x=1701668189; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2j4VzOuBt+uyczV2meq0MpY0uQbt9u8nczliuiE+crw=;
        b=R5bE6pwMaPWSSxqnpGOGQQXbpGQfjdXJBhQETPx+8FpzoGvh7BJtS77dNnD09UVxY3
         hUD/IgGWbaMyX+rK+MtknjQB8M+7uHqu6GujPKJx5pp1075MJsI8wNEsQyGx9Y4OQugs
         d+8Sm3zUKYlwssDI0YvCRcuWgSaX8bb1mrdin05dykm6gbX1mcLpl/p6LNBKi+/VMYFq
         1cvPpOJMRWAc3DkShvh7NYPS11mqcLqeP/WlnBL8eWFfJJEbfERPNvZ8pfCnu2JFGvTH
         Ingyv+3jYSEbNAhGptzVFaURAivNJ84drwxClhaG7eYcQdxA9cp2UmGmKN78HZWrp5hY
         qc8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701063389; x=1701668189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2j4VzOuBt+uyczV2meq0MpY0uQbt9u8nczliuiE+crw=;
        b=Fa5r26DzwEYLGfXWr0i1ZuM1+vS7T2QCFZPAZ5Zx0yhN9p3hceuIgH/sV3MqIwvXWC
         dLtV0pWQkeE3g9I2wc8ToYNgqyQKSg7pnbHjy3Q8QCkQikq1Kjcq5tTNdPbkurhYYCTX
         90YaPK+VE47dzKcksDgt8irsJ3qdbZhe7oIj9z8KItUc3UGFqD6xtRo+isGv6B8cww64
         rbDNWMxxbCdv9ePccIuEBYA1ydV6VKkafIvP9ojqTWuDeufg3maMhyFsgU8XNA2u0ZPB
         Ju3d5tQ9id9Gv+YRiybrKKw75C8Y6vO8Pf3lPHyqkYo8Ra4GHc3mTB0EO8HKHGi2jN23
         CBNg==
X-Gm-Message-State: AOJu0Yys5RdFqN2BCOBhj8KMDfHqvbjCc7Y1SlaXXhpH7rzbZs8rWMRP
	NJrbPEqHyUok3lyPN0zN+ULL5A==
X-Google-Smtp-Source: AGHT+IEYUvkttzAlThLW0Vcf5ln7MhtBjPrK2U2R9yrbD0YOHyjjEnCg0+nKVMALiObt7GRANPPgOg==
X-Received: by 2002:a17:902:ab1d:b0:1cf:50a0:566d with SMTP id ik29-20020a170902ab1d00b001cf50a0566dmr8890369plb.7.1701063389492;
        Sun, 26 Nov 2023 21:36:29 -0800 (PST)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id b6-20020a170902ed0600b001cc3875e658sm7300465pld.303.2023.11.26.21.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 21:36:29 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 11/15] Staging: rtl8192e: Rename variable DelbaParamSet
Date: Sun, 26 Nov 2023 21:43:01 -0800
Message-ID: <20231127054305.148276-12-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231127054305.148276-1-tdavies@darkphysics.net>
References: <20231127054305.148276-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable DelbaParamSet to del_ba_param_set to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 2053feb51f61..bd037069d4f3 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -127,7 +127,7 @@ static struct sk_buff *rtllib_DELBA(struct rtllib_device *ieee, u8 *dst,
 				    struct ba_record *ba,
 				    enum tr_select TxRxSelect, u16 reason_code)
 {
-	union delba_param_set DelbaParamSet;
+	union delba_param_set del_ba_param_set;
 	struct sk_buff *skb = NULL;
 	struct ieee80211_hdr_3addr *del_ba = NULL;
 	u8 *tag = NULL;
@@ -137,10 +137,10 @@ static struct sk_buff *rtllib_DELBA(struct rtllib_device *ieee, u8 *dst,
 		netdev_dbg(ieee->dev, "%s(): reason_code(%d) sentd to: %pM\n",
 			   __func__, reason_code, dst);
 
-	memset(&DelbaParamSet, 0, 2);
+	memset(&del_ba_param_set, 0, 2);
 
-	DelbaParamSet.field.initiator = (TxRxSelect == TX_DIR) ? 1 : 0;
-	DelbaParamSet.field.tid	= ba->ba_param_set.field.tid;
+	del_ba_param_set.field.initiator = (TxRxSelect == TX_DIR) ? 1 : 0;
+	del_ba_param_set.field.tid	= ba->ba_param_set.field.tid;
 
 	skb = dev_alloc_skb(len + sizeof(struct ieee80211_hdr_3addr));
 	if (!skb)
@@ -160,7 +160,7 @@ static struct sk_buff *rtllib_DELBA(struct rtllib_device *ieee, u8 *dst,
 	*tag++ = ACT_CAT_BA;
 	*tag++ = ACT_DELBA;
 
-	put_unaligned_le16(DelbaParamSet.short_data, tag);
+	put_unaligned_le16(del_ba_param_set.short_data, tag);
 	tag += 2;
 
 	put_unaligned_le16(reason_code, tag);
-- 
2.39.2

