Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742C35A79F
	for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 22:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706308312; cv=none; b=DuoI7GICsix/YUl9+9hkN/X4WU8JThZpvNW41cc9aBdr2YQSITnz0s0l37jadPlztiHOKcltiXcbO2Myi63AU69O4SWy/8UFkkx0SFoZ2fJUN1gx4xzmDS9K7kpmxRFH2t4n7mtwW7X9ESRQTh4wwLTYwvyRFlndIMo7CZaFjHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706308312; c=relaxed/simple;
	bh=5DibKgE8ybBng9suKbGUN36Q9+2sX+fsaXEhIlRAuT0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KosUgvOwIpcbhxMeRaALcLNhbwSDuG6jlSqANMUr8ECeDOC0pOZFe+oQ1TfoMCOkXpCPf/ugezN2StLtuZ6f2mXtGQg9E+v4bpF+4wPXxWvO1Z3C2RcfIquO09djoW8rVPOAa5YrPXU1IN2dxaztIi8vwsM7WpaNc5PQO0HxqgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=VFGMjlcF; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="VFGMjlcF"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d71e1d7c78so6820685ad.3
        for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 14:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1706308310; x=1706913110; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WasKokmHV0ULTodbn6qktUa03Tamg95nLPR+rl0Wzos=;
        b=VFGMjlcFcCUaE2DHb3Iw0KHZ3AY8RIDk4AUQThbXegj94xJNcjXCXy6sDA85ZsB09j
         +0wC67D84BiiN/yw0UnwNJ6bjMpcK9idPCx+qDFE9RNRECyFfzAvNPbTiJ+gv29uHP2S
         cjk/8T5dNFqRKxRBxsOtgF6/ZxvIBSZKv2EEz53flGoMeYwi1O9CE1XWwyn2Zh4o7v24
         sKVYYe5K6Z1Ak0z8N0anoO4gOoW7WR9gs/3zz/nXkwICMWcLH38iTzXhHBASjTVFssUJ
         1mNrQTawMbzCSZJRcjd/iu4giz9Bt5TmC4a76uB6+Sgw8XtxTpM6kb67TvQ7BoUcr8pJ
         YMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706308310; x=1706913110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WasKokmHV0ULTodbn6qktUa03Tamg95nLPR+rl0Wzos=;
        b=fI5duBY7CUsdoP7UAJ7h/I27PERhRrryOj7JHzT0hWyv4lyEpHCuRW0tkwubKJaMDo
         pXAsay+3Teo4xv6Cc+Cv/ORGAALZ52Jm/VrDdUtbjs51afYwNpVEZQsD/g0rDXS4BG/i
         jcx16J/MNS6DIQmYqlImu0VTITLYkfAVmwxgzSwGeJZeTgvjvF3pANlZKgsgzjB8c8ZZ
         1JCw4xxZzV/jkOx9V4lQCK+WDyssSsxDo6CJRJZaaNT657b3zeRQhjECYIzBHz0XGVzZ
         /VoQRKVhynHwcG0G2Lr0idPTMI5vHuFYd56bF8QD1bm2SVB2iqdGWI6ir251FBUVb79q
         a95Q==
X-Gm-Message-State: AOJu0YwpT4Dxgvyw1vR/t66j5TxvAQSAObWus+P+9eL73jee8yEOlfRO
	+asj65YO3ADemr1ZWDvti0wsqrDUNEaZPb3HMWsLQlhrkzTEtKce2906EJopTwE=
X-Google-Smtp-Source: AGHT+IFLVF8aBWgITFkX88TnjFdYQ2TPyMUNFabtGOuvYDXx+xiMbQhI3OX3zMTB2z6U+N2C7F5BsA==
X-Received: by 2002:a17:90a:fb58:b0:28f:423f:1cfe with SMTP id iq24-20020a17090afb5800b0028f423f1cfemr541724pjb.18.1706308309861;
        Fri, 26 Jan 2024 14:31:49 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902d0c100b001d8a8f431b7sm737909pln.300.2024.01.26.14.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 14:31:49 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 15/18] Staging: rtl8192e: Rename variable Octet
Date: Fri, 26 Jan 2024 14:31:03 -0800
Message-Id: <20240126223106.986093-16-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240126223106.986093-1-tdavies@darkphysics.net>
References: <20240126223106.986093-1-tdavies@darkphysics.net>
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
v2: No changes.
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

