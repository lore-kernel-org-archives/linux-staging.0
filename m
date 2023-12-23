Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258D6154A1
	for <linux-staging@lists.linux.dev>; Sat, 23 Dec 2023 01:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="UGllYz4X"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d427518d52so5662415ad.0
        for <linux-staging@lists.linux.dev>; Fri, 22 Dec 2023 17:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1703296799; x=1703901599; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKaTV31asg8HNjRCozcslGmEYtbSfFrvyCRGCul8iCc=;
        b=UGllYz4Xv3MhJPZYlK8TiOqqDoH/aIG8iVxzRnlKtRry3fTeu4BL1vYJMVhiwk0WCU
         Y/vFvAgnJucZuu1BX0aqswo1Piu+nItsep8mStzXi6uTjCGiAbVxwA9uRmfJ2ydu9aWE
         ajLq2klYNTnzN9iFY7l6AOQU2aPNlCfmQDKLHPoETsV5Nx42f6qwM5Dlpjb0gwX/HQO/
         eeQUTWmMEd7ygqBTVa3PZ9WideHu6uXaTKFrT3fSrlKklg7elsxcoRBzgVcMsYywFplz
         1zeo0BF6QpTBRxgYZWc77vpuAmGKNBNdIUEzNi8YqrCutu/4bcGdCVmPjVhc9RnJFm4v
         Y3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703296799; x=1703901599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CKaTV31asg8HNjRCozcslGmEYtbSfFrvyCRGCul8iCc=;
        b=MbHNmpCPLn/nr5aH3KIeooE73uqkmOzu+MMnKdMCAhZLukEdZZwHmJADHCG+6UPNd4
         1iFbwXCEEnqZDbCUQtxJsWRp4OGFBrJtb4EOO+zltq6Pfv43YUIDBEmQZtd0FKtm/BHx
         m507IedMQIBmF70ThXV7I+KtDqrYmpJ83e+cJ0CRAhVXJ9JnKn4SlNW9iwdJCESrcVZa
         AVmz9T5qtw+kToJeOvkMwZYxyCH8cK0OBEmgCroc88k8nGtAmlblVCzrIvIoeaQttDmM
         5ckweWJkHBGLfE3y9ptN1Tx1AbGFeKV20Ze90z3JSOoTHqLLhzLQ+/OqYbmVaa2xHDY3
         J+hQ==
X-Gm-Message-State: AOJu0YxQ9ZHOYNvuU/RvEBO3Xbtqek+0iqUQL+cpXWKiaAgFBdzd4IsV
	x5skLfcGjN7C83u/qhaxiHvelOA6CCEnSg==
X-Google-Smtp-Source: AGHT+IFt/Qd3ttE7f9gbYN0UNDH45p0N6KcOyPTYbOXERDvJEGvVR9DPVIBFdgiOOYgL3qNjIabumA==
X-Received: by 2002:a17:902:be06:b0:1d3:fc05:81a4 with SMTP id r6-20020a170902be0600b001d3fc0581a4mr2196870pls.35.1703296799504;
        Fri, 22 Dec 2023 17:59:59 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id kg15-20020a170903060f00b001d3edef115dsm4106546plb.20.2023.12.22.17.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 17:59:59 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 16/20] Staging: rtl8192e: Rename variable QueryRate
Date: Fri, 22 Dec 2023 17:59:38 -0800
Message-Id: <20231223015942.418263-17-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231223015942.418263-1-tdavies@darkphysics.net>
References: <20231223015942.418263-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable QueryRate to query_rate to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 0819efe36171..1e025ef4bed6 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -141,26 +141,26 @@ static void init_mgmt_queue(struct rtllib_device *ieee)
 u8 MgntQuery_TxRateExcludeCCKRates(struct rtllib_device *ieee)
 {
 	u16	i;
-	u8	QueryRate = 0;
+	u8	query_rate = 0;
 	u8	BasicRate;
 
 	for (i = 0; i < ieee->current_network.rates_len; i++) {
 		BasicRate = ieee->current_network.rates[i] & 0x7F;
 		if (!rtllib_is_cck_rate(BasicRate)) {
-			if (QueryRate == 0) {
-				QueryRate = BasicRate;
+			if (query_rate == 0) {
+				query_rate = BasicRate;
 			} else {
-				if (BasicRate < QueryRate)
-					QueryRate = BasicRate;
+				if (BasicRate < query_rate)
+					query_rate = BasicRate;
 			}
 		}
 	}
 
-	if (QueryRate == 0) {
-		QueryRate = 12;
+	if (query_rate == 0) {
+		query_rate = 12;
 		netdev_info(ieee->dev, "No BasicRate found!!\n");
 	}
-	return QueryRate;
+	return query_rate;
 }
 
 static u8 MgntQuery_MgntFrameTxRate(struct rtllib_device *ieee)
-- 
2.39.2

