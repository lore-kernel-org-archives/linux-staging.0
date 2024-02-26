Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E941C683
	for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 03:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708919797; cv=none; b=rH4/JRUpC62ou+ARAx6eywf+5L0nFhCuhN40xSEN0/U5ohE3GotE3EUUgU6rjvL7qXpgr9BYol15erAHNcIgJXOeCja/os1flNuAb5WwagLBEPNLReopetKPoeVzt/vDWgha5JmgRWb1XTvx1qHK7IRNMk+rXFZCo7/kScXBKGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708919797; c=relaxed/simple;
	bh=feRmvYGb2I/8Joqfn39hSQRLq9jVSX6Ip8zqh2pMZww=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uZTm2+bVy4D5CEea9UjK4oKpAF0WOBahO12zU/WcjOpDAjQq3KAS2bCUwxUdCjMyMVQLesppwCFLt+yHLU4DE3vsa04nCh9Tptr0aIqERCwFwDAWAb9BMPfTMEfschADpEjepRkQXByJnrub35fZ7Oj+83dBIbeB3Zibe4uyOPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=FZsFBaiu; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="FZsFBaiu"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5d3907ff128so2280576a12.3
        for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 19:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1708919795; x=1709524595; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bHZ4Dy1MrJ8rtOqk9em+bLvh1hFQIoUwHqrhLCKwAIc=;
        b=FZsFBaiurLY0pd/AT2cLQQwcGc8m2YrfFL4gzgHieTLK0y6SqcI+QgEexMAlQ6Qex9
         eXClzMoPeZkCZorSiT1525B6n5zyZtDI2jbDYGxymnekDks+j52a5+eBstRHz1AZDDCX
         4HDgW2tiB/x5gIRFha8vkemTFbYGMN9VtD9GEDOro3qYhtYCEkKVE/s4/hzsFBAz5MOB
         qb+jdvkh6O0SpHm59yNsB4gdDxHRiw5IhNDPAKSecHaJezF1dHxI5Zms762ETFLS6/oE
         znint0YH4uEzpwMWO0nACi6xtjvOI+hmDkUN2w91sYwyF8hGbs6uqgPkLa2BQh3Da5AI
         B/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708919795; x=1709524595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bHZ4Dy1MrJ8rtOqk9em+bLvh1hFQIoUwHqrhLCKwAIc=;
        b=BheAPaQf/5wJNSeUVXm/lLle5Q2+T+jlSh/cE5bPkOkFBh5enjTplxKXJVlg+cZh18
         Q1Zd6RH81og/XxHJfluJkp0/1JyCp30UBnOEjcU6B8tbejF37VuRvjYlKKZjp9u3bHb9
         Xn0RBsA/KPKNPz6hCkI08af0dOYhv+3G+FQAKgOS/e3uhmIJjk5H2ompqnxfa+FV2+/P
         S9s1+Otkn5INYteHUxH406Bql92SQIVhfE+/4ZnCHofG8XdDbmOKqOd/zNEAdU//0cbN
         jtBoqCsphyICABdZ8bGAxFt0GQ8e0W6eek42DQ2xDrIhdIThtJEqi4hNTu2SZrM9ja7U
         fEBw==
X-Gm-Message-State: AOJu0YzkbqZW3IeuD2s9/lf8UACdo8zkgBZiS6a4n5JHtEIF+I+7ZI59
	PG5b6akgr1Fm8c1DgpxtR1kvpsYidfSwDT+C9I7wRii+gEvEXQE5ucGHfILS1iA=
X-Google-Smtp-Source: AGHT+IF5OZ29RGlYUvjMLdVi1JSUJb+EpyTP+DluLyoXRqkNeISIJ4V/b3iwMPxiw8DdFtwP1vsqww==
X-Received: by 2002:a05:6a21:920a:b0:19e:378a:124c with SMTP id tl10-20020a056a21920a00b0019e378a124cmr9105913pzb.12.1708919795170;
        Sun, 25 Feb 2024 19:56:35 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id kh5-20020a170903064500b001d8a93fa5b1sm2897615plb.131.2024.02.25.19.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 19:56:34 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 08/20] Staging: rtl8192e: Rename variable bCcxRmEnable
Date: Sun, 25 Feb 2024 19:56:12 -0800
Message-Id: <20240226035624.370443-9-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240226035624.370443-1-tdavies@darkphysics.net>
References: <20240226035624.370443-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bCcxRmEnable to ccx_rm_enable to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c      | 8 ++++----
 drivers/staging/rtl8192e/rtllib_softmac.c | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 6cab19b03f4f..9ec4a3b8ae3c 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -929,7 +929,7 @@ struct rtllib_network {
 
 	bool	bWithAironetIE;
 	bool	ckip_supported;
-	bool	bCcxRmEnable;
+	bool	ccx_rm_enable;
 	u8	CcxRmState[2];
 	bool	bMBssidValid;
 	u8	MBssidMask;
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index cdb7e87c0c89..103117692a88 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1818,9 +1818,9 @@ static void rtllib_parse_mife_generic(struct rtllib_device *ieee,
 		if (info_element->len == 6) {
 			memcpy(network->CcxRmState, &info_element->data[4], 2);
 			if (network->CcxRmState[0] != 0)
-				network->bCcxRmEnable = true;
+				network->ccx_rm_enable = true;
 			else
-				network->bCcxRmEnable = false;
+				network->ccx_rm_enable = false;
 			network->MBssidMask = network->CcxRmState[1] & 0x07;
 			if (network->MBssidMask != 0) {
 				network->bMBssidValid = true;
@@ -1833,7 +1833,7 @@ static void rtllib_parse_mife_generic(struct rtllib_device *ieee,
 				network->bMBssidValid = false;
 			}
 		} else {
-			network->bCcxRmEnable = false;
+			network->ccx_rm_enable = false;
 		}
 	}
 	if (info_element->len > 4  &&
@@ -2351,7 +2351,7 @@ static inline void update_network(struct rtllib_device *ieee,
 	dst->bWithAironetIE = src->bWithAironetIE;
 	dst->ckip_supported = src->ckip_supported;
 	memcpy(dst->CcxRmState, src->CcxRmState, 2);
-	dst->bCcxRmEnable = src->bCcxRmEnable;
+	dst->ccx_rm_enable = src->ccx_rm_enable;
 	dst->MBssidMask = src->MBssidMask;
 	dst->bMBssidValid = src->bMBssidValid;
 	memcpy(dst->MBssid, src->MBssid, 6);
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index d3837fa2c859..db1a47ce3528 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -742,7 +742,7 @@ rtllib_association_req(struct rtllib_network *beacon,
 
 	if (beacon->ckip_supported)
 		ckip_ie_len = 30 + 2;
-	if (beacon->bCcxRmEnable)
+	if (beacon->ccx_rm_enable)
 		ccxrm_ie_len = 6 + 2;
 	if (beacon->BssCcxVerNumber >= 2)
 		cxvernum_ie_len = 5 + 2;
@@ -837,7 +837,7 @@ rtllib_association_req(struct rtllib_network *beacon,
 		tag += osCcxAironetIE.Length;
 	}
 
-	if (beacon->bCcxRmEnable) {
+	if (beacon->ccx_rm_enable) {
 		static const u8 CcxRmCapBuf[] = {0x00, 0x40, 0x96, 0x01, 0x01,
 			0x00};
 		struct octet_string os_ccx_rm_cap;
-- 
2.39.2

