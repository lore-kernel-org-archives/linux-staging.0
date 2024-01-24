Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8510A13BE90
	for <linux-staging@lists.linux.dev>; Wed, 24 Jan 2024 22:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706136311; cv=none; b=LQriaC4VMESrbSPmg1SIDBW+W+zRgk+DzI7LzfBcYKsTqYuJQRfjJTFm5qfPNYI6BEvYwclzOgVzjUmhqUwrn6/ru5AJEeFl53PyIRoiyek1zgeI980sJZCe4nOzLL8X979xSAl2vDd5V2n3BHtGDufzbzmjtu4wjHCpbix8dDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706136311; c=relaxed/simple;
	bh=k5ksk20LekzjDVXZmHyF5qRlDgyHicjEbCn3PLaBcOQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FTscImQuL3JG5OEM2SLqPD8b12/88umRkT+3VTamKtD0oTd8jpcE8+GvYdfI0sLK1AOWhkhPkqIpJFM2+1raq/b7NAO6BKeTf+NGlcNRQG7URBwHv4793q/sjyRkIKsPuTyRyGpUzeaGeaC3rFTEJSQkAH0kSAZ95YTOUK7NrPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=I5SF6Rfd; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="I5SF6Rfd"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d720c7fc04so36429155ad.2
        for <linux-staging@lists.linux.dev>; Wed, 24 Jan 2024 14:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1706136310; x=1706741110; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBPudamBprV8WQHg9cEsc7jdDIfPIVmpPvPejAN2DrA=;
        b=I5SF6RfdRxk3A8VYcxMWEqI05CqDZhzX/3G4IJUtjdBunPgIdYlPhCzZzsQWR6pygC
         oKkxule/b/8c04gd0DvBz/4t3LkQA08FCLi0S7eeGDcBJtBFXd0M8iWAej5mCaunD8w7
         8he1Hq1KHePpKqCTOU1ZNzj9igYGwxZku8+dQq613Nlxzdl/k4cDivvjbbXo9xr8/E0L
         Rl1HYTkKuH7P+uOXL3VqMpscUXX5o8a4tVFTB/DgGMa93UXiUBUjf4ZjuFUwTuNkdiUJ
         tJqU7Ift4LZ8tdxf33Vn908zIRb+IsybxeKP1X8b1tiC5/b2Y7GIH9HYpduvE30gJbSI
         Y/nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706136310; x=1706741110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EBPudamBprV8WQHg9cEsc7jdDIfPIVmpPvPejAN2DrA=;
        b=Bidp7D9AHyrmRP7v38wMBSGn++imGOdxxwC5GokNF58OOpqOhXBK9itZ1jra2dZyxy
         22BkSeXyuEZoENyIk5V7UgFntmEUoSwq3/eNyb01qVpOSY9klUmoTz5PAJ92QkUNOCM5
         gXRsBLUmYpQRGNidz/n5ASLbrEowXMqare7tnahZF4GJ3rzAoQ/ZUjVn0+VpPbzpLp+n
         Yd+8UEjO5kXtz70sf//j23mIddnsaa8OZTesRw9gs0DvGwBc1N2fhzzVWShnchCYGocV
         bMy1cdKIbXmwuyobSenOfA/x/q6ntcj4FuAL9GHChHkJbgSkH1x8IOFACHxKmHhWTP9S
         cFnw==
X-Gm-Message-State: AOJu0Yw/w3V2yeeaHWuvE4G0QlxeuB+pplKs+KeqMt/XlMMBDpLQe3T4
	EZVsU80o5pZAePNqkScWvxR2QXdZAv78+i7xdE6w6ITwnrqhemHdsAtkHgX1Klc=
X-Google-Smtp-Source: AGHT+IHbyjNZZTgVSen4AZgSOoFktQB6IviIR5x2EbPNA+39zEfu8efyalzMRLZBiVAYtkiDAr3PDw==
X-Received: by 2002:a17:903:24e:b0:1d7:5bde:7c2f with SMTP id j14-20020a170903024e00b001d75bde7c2fmr69425plh.21.1706136309783;
        Wed, 24 Jan 2024 14:45:09 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id i5-20020a170902c28500b001d73a2acc0csm6743987pld.283.2024.01.24.14.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 14:45:09 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 15/18] Staging: rtl8192e: Rename variable Octet
Date: Wed, 24 Jan 2024 14:44:49 -0800
Message-Id: <20240124224452.968724-16-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240124224452.968724-1-tdavies@darkphysics.net>
References: <20240124224452.968724-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable Octet to octet to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_Qos.h    |  2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_Qos.h b/drivers/staging/rtl8192e/rtl819x_Qos.h
index 50e01ca49a4c..dc991100742f 100644
--- a/drivers/staging/rtl8192e/rtl819x_Qos.h
+++ b/drivers/staging/rtl8192e/rtl819x_Qos.h
@@ -13,7 +13,7 @@ struct qos_tsinfo {
 };
 
 struct octet_string {
-	u8 *Octet;
+	u8 *octet;
 	u16 Length;
 };
 
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 5281138ad468..e47292455585 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -823,17 +823,17 @@ rtllib_association_req(struct rtllib_network *beacon,
 		struct octet_string osCcxAironetIE;
 
 		memset(CcxAironetBuf, 0, 30);
-		osCcxAironetIE.Octet = CcxAironetBuf;
+		osCcxAironetIE.octet = CcxAironetBuf;
 		osCcxAironetIE.Length = sizeof(CcxAironetBuf);
-		memcpy(osCcxAironetIE.Octet, AironetIeOui,
+		memcpy(osCcxAironetIE.octet, AironetIeOui,
 		       sizeof(AironetIeOui));
 
-		osCcxAironetIE.Octet[IE_CISCO_FLAG_POSITION] |=
+		osCcxAironetIE.octet[IE_CISCO_FLAG_POSITION] |=
 					 (SUPPORT_CKIP_PK | SUPPORT_CKIP_MIC);
 		tag = skb_put(skb, ckip_ie_len);
 		*tag++ = MFIE_TYPE_AIRONET;
 		*tag++ = osCcxAironetIE.Length;
-		memcpy(tag, osCcxAironetIE.Octet, osCcxAironetIE.Length);
+		memcpy(tag, osCcxAironetIE.octet, osCcxAironetIE.Length);
 		tag += osCcxAironetIE.Length;
 	}
 
@@ -842,12 +842,12 @@ rtllib_association_req(struct rtllib_network *beacon,
 			0x00};
 		struct octet_string osCcxRmCap;
 
-		osCcxRmCap.Octet = (u8 *)CcxRmCapBuf;
+		osCcxRmCap.octet = (u8 *)CcxRmCapBuf;
 		osCcxRmCap.Length = sizeof(CcxRmCapBuf);
 		tag = skb_put(skb, ccxrm_ie_len);
 		*tag++ = MFIE_TYPE_GENERIC;
 		*tag++ = osCcxRmCap.Length;
-		memcpy(tag, osCcxRmCap.Octet, osCcxRmCap.Length);
+		memcpy(tag, osCcxRmCap.octet, osCcxRmCap.Length);
 		tag += osCcxRmCap.Length;
 	}
 
@@ -856,12 +856,12 @@ rtllib_association_req(struct rtllib_network *beacon,
 		struct octet_string osCcxVerNum;
 
 		CcxVerNumBuf[4] = beacon->BssCcxVerNumber;
-		osCcxVerNum.Octet = CcxVerNumBuf;
+		osCcxVerNum.octet = CcxVerNumBuf;
 		osCcxVerNum.Length = sizeof(CcxVerNumBuf);
 		tag = skb_put(skb, cxvernum_ie_len);
 		*tag++ = MFIE_TYPE_GENERIC;
 		*tag++ = osCcxVerNum.Length;
-		memcpy(tag, osCcxVerNum.Octet, osCcxVerNum.Length);
+		memcpy(tag, osCcxVerNum.octet, osCcxVerNum.Length);
 		tag += osCcxVerNum.Length;
 	}
 	if (ieee->ht_info->current_ht_support && ieee->ht_info->enable_ht) {
-- 
2.39.2

