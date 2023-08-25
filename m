Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28DE101E9
	for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 14:06:19 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-686be3cbea0so1447618b3a.0
        for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 07:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1692972379; x=1693577179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fRPP7TQ9KfSawkNqM8uvBK91gxMIgkxn+DlDjJdQVs8=;
        b=M0dHbT4ffxh7h/+nBJRWUmR9zOdNMG0aqKSpypPyKDFy9YMuZ7F72PuwxclWYVg28g
         fL8UHBruubmlndOfGd/6LcjFKtBGCHi6Z7r+H8hFNTtA5PvAkjTXwahbgkb1aPji9UpY
         OEdkqK82U67b5n/kGyKQXLVJvEN2hvb3pFj9arFpaAAcGff8OxfL2j11Zvxp13J2/+nQ
         WKNFF4FSmBr5i1K7NAA12Cb+ED3HmFsLbINo4uggvWBSBZiy7+e1nzThR2RDzQCSX7VK
         ozBs8BFpHQLBxbxNnuCaOQSaAEE5bz6cln32zdKIxDaYr+Le8/LKSOVSJpIi1i4OdrQN
         tgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692972379; x=1693577179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fRPP7TQ9KfSawkNqM8uvBK91gxMIgkxn+DlDjJdQVs8=;
        b=P2HgJcoKOwdQoyaJsjpLfkr2JnraBxTK/zTZLqiu+gJ35JKbe3iyNieUm/L46JAVmi
         MGDW8In9tvLpOWZ6uBX2+RVgU1H5PBsWV9+XR5wv+OV9XFu3CST7npIi4fvL72r1h0hV
         n2IjoiENSWbudrouk6Roaum4bI5UcKQeG1kizrJX41mCvBjryFp+t07X4UDZuifZhzG6
         CLIXrNF2cxp1vaw1UrOr6qmNyQYFsep2Q4JC8ju80l6MPZXG/dkClLrsYzIm0OwM78sG
         8ywbnD8ZsykeANd5d+7Yjb/5gm7Z77sHTKprryKZnq3d7W6tEtkFjTXgkuXm1pgT3ZxL
         NIhQ==
X-Gm-Message-State: AOJu0YwdaKN47V9LZzwDSkt9PyM9n+MueO/IXrJPYKAPGTRwTj47Q9tX
	o2yUe5Z65rY2UXnHouF1FbRtzixNycDtoJ70fvp1P6v9
X-Google-Smtp-Source: AGHT+IGplBzchvbqmi/hMnA20xZfDwTwABqVEKfA+gaXK0j4yB7R7jeHWAAnpfGCzJHUMKH/z/+6FQ==
X-Received: by 2002:a05:6a20:1456:b0:13f:c159:63ec with SMTP id a22-20020a056a20145600b0013fc15963ecmr27546337pzi.24.1692972379208;
        Fri, 25 Aug 2023 07:06:19 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id v23-20020a62a517000000b006870721fcc5sm1628232pfm.175.2023.08.25.07.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 07:06:18 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v4 03/16] Staging: rtl8192e: Rename variable pRxTs in function rtllib_rx_DELBA()
Date: Fri, 25 Aug 2023 07:08:34 -0700
Message-ID: <20230825140847.501113-4-tdavies@darkphysics.net>
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

Rename variable pRxTs in function rtllib_rx_DELBA() to ts
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
v4:Resending as v4
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

