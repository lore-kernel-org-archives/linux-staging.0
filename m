Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9596A7FA
	for <linux-staging@lists.linux.dev>; Sun, 20 Aug 2023 00:45:20 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-26d2b3860daso1503177a91.1
        for <linux-staging@lists.linux.dev>; Sat, 19 Aug 2023 17:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1692492320; x=1693097120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7p3fw0kwSoZpKrJw9KM7osJqs5KPh0SGVdEcaIOTdU=;
        b=RAJ9uS44fZVALqAfHfrFKcMqAsF6v1FxZKGw1B3FLwQjQz+pYcrkiGWlwXTQ92l1is
         Cdfo7nIpT7xd3eRLSQChC+8S50WePsefmzagISmFva92mf9Tt1PNIKI1gszLswmdXTjP
         NoN7/9yD+bB+wiPZe+QsVu6MyqGazUsRJrZPjo7HFqtEZmxnqKH77KmigOvCy77iJ85V
         ajYum42WGVfzCjhJSEO8Y4QVgAKVqkLdKsc3wiBWSK9LDE2Nev1V0W/1aTxCo2K7DSyP
         P+IMpOlg/Qo7fLRyzE6ZahN8lWa9Yerlw5SQaIN/l+mB0ZQZGhUNB+GDVRMyHuyKtjqT
         O1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692492320; x=1693097120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m7p3fw0kwSoZpKrJw9KM7osJqs5KPh0SGVdEcaIOTdU=;
        b=hb3ctStMU7NcCY6jdpjf3L59g7neban7TcGhBDiqqNSbAW3zYnkZpxAvlNbCOMtqPS
         zfKGuC2BgS+dws3HxHPpZ+cWyuSC7PHDZWw+a1My6b277mr481VhXdSg9hyV61KVVSqW
         epN67bNrj3gmf2Juxmf0dbsIkE6ecDNtDoE96HN+zn1rNHutclWk7UWhA3uTQ7NwL11o
         5t37Pjvjgj2mRIHQ/CNM7m6MXQUh4s5d2L+hLJyIei1xOlqUuQUnG5Kn0Jn/kHYfMrqL
         P9eaGOdqp+qGWhCVKNCzdsmntu8MTYQM1wjGgDyzWH7L5UhjN7T6TXrxmKS1+brdhy+V
         cybA==
X-Gm-Message-State: AOJu0YymXRHYi0DFw43HdlpH8LETu5JfviZspqpdfV2kXJR9iSfli1C3
	D5O732owskTywtT/9S9hFSsvsg==
X-Google-Smtp-Source: AGHT+IGm5IP0WszE8rWDTpMzx+0/sR6s+ScbtHYEs85ddB6aTPJgrQQZtsrwd3VH8HH/6WjHAeqpnQ==
X-Received: by 2002:a17:90a:8a95:b0:268:b7a2:62e8 with SMTP id x21-20020a17090a8a9500b00268b7a262e8mr2633842pjn.7.1692492319742;
        Sat, 19 Aug 2023 17:45:19 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 25-20020a17090a1a1900b00268b439a0cbsm4004884pjk.23.2023.08.19.17.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Aug 2023 17:45:19 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v3 02/16] Staging: rtl8192e: Rename variable pTS in function rtllib_rx_ADDBAReq()
Date: Sat, 19 Aug 2023 17:47:30 -0700
Message-ID: <20230820004744.278022-3-tdavies@darkphysics.net>
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

Rename variable pTS in function rtllib_rx_ADDBAReq() to ts
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v3:Resend as 16 patch series - no longer throttled by email provider
v2:Resending in smaller patch series
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index da29163f3022..03d76765e85f 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -220,7 +220,7 @@ int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb)
 	union ba_param_set *pBaParamSet = NULL;
 	u16 *pBaTimeoutVal = NULL;
 	union sequence_control *pBaStartSeqCtrl = NULL;
-	struct rx_ts_record *pTS = NULL;
+	struct rx_ts_record *ts = NULL;
 
 	if (skb->len < sizeof(struct rtllib_hdr_3addr) + 9) {
 		netdev_warn(ieee->dev, "Invalid skb len in BAREQ(%d / %d)\n",
@@ -253,13 +253,13 @@ int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb)
 			    ieee->ht_info->bCurrentHTSupport);
 		goto OnADDBAReq_Fail;
 	}
-	if (!GetTs(ieee, (struct ts_common_info **)&pTS, dst,
+	if (!GetTs(ieee, (struct ts_common_info **)&ts, dst,
 		   (u8)(pBaParamSet->field.tid), RX_DIR, true)) {
 		rc = ADDBA_STATUS_REFUSED;
 		netdev_warn(ieee->dev, "%s(): can't get TS\n", __func__);
 		goto OnADDBAReq_Fail;
 	}
-	pBA = &pTS->rx_admitted_ba_record;
+	pBA = &ts->rx_admitted_ba_record;
 
 	if (pBaParamSet->field.ba_policy == BA_POLICY_DELAYED) {
 		rc = ADDBA_STATUS_INVALID_PARAM;
@@ -268,7 +268,7 @@ int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb)
 		goto OnADDBAReq_Fail;
 	}
 
-	rtllib_FlushRxTsPendingPkts(ieee, pTS);
+	rtllib_FlushRxTsPendingPkts(ieee, ts);
 
 	deactivate_ba_entry(ieee, pBA);
 	pBA->dialog_token = *pDialogToken;
-- 
2.41.0

