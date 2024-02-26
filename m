Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B291BDE7
	for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 03:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708919796; cv=none; b=UzJkJz9w41CIN3O7LiGZH3j9d1IazkW8jC2uT5rzK8C6S73AbPXc2YA0LDbHrD9NsOl2XAY9JpA2YgGRl84LyVt0kcRbeBnuijaidZTTjJQOKgjul+m5hmJdEjxtdaNcgSgQnCSV94o1anuvTABNrpM9JlSqowCBxoAsEwJmjYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708919796; c=relaxed/simple;
	bh=tvCd1JZbDcbdK3kn4usK7ETaBJvFw9gj/XdlgVRJmic=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dpgpJcA7UHVQZqpV2XuUlwLE0aYyaXonCGoQ4CkjGpi1VGsC43gVwJINYFvASEo9EdrBGcRsDSlNFh6hX7mKHBfoOQShjs2nuCKZJHbxWDa1qDv6W5GSTGCXxQPtjApD4+gMFm9ryoO0CChPUCo8bU8Iqr8UN3GbpctdgtUqjAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=FfINgvE9; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="FfINgvE9"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1dc98892850so6623635ad.0
        for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 19:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1708919794; x=1709524594; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1BD0k6CXlE1uoUebpY42xLDy9lNO1Gq7kA5Vc0ymnQ0=;
        b=FfINgvE92/ZFpK0Q5QHf7S5iDsxPAzArZV3v0YnNz0njYXwOlD1VHA6lmOQOFTO98b
         JdQ+sx92kC337vrntE7b4hL4K7fx7JuKOXxB5OzkN9WRCzo4/qG4q8NKzQ2O1or6fGgB
         D1326RHG/EslWd64fwsoTL7MVut37wDNr34EdNeD79Dahyt4e7jqFh1tEHnQ4PvCaWHc
         ffIv+nQIdkAX13dqBSWgUJgU7FiyESDwHBGIEF5DEcZtnF57UsnIa78keoN1TJvmXzJI
         j44H99oxhIoL7uLCPM3jYLuUc4mjDBPJcssHZnZFcu4gstVMLiEurkBk0xkvG0PxnU3B
         gVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708919794; x=1709524594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1BD0k6CXlE1uoUebpY42xLDy9lNO1Gq7kA5Vc0ymnQ0=;
        b=ZBeYsN1A9dlldmtcRU2JEf+KrvimenS8lc37z7fuOdzGURSUNVQln4whiWU/7eoQbE
         ARKBl12ESIzXlKqVDhdohVRbY+lkW+rm5KBq6czKCiaIjUpqVQnEw3fxYANfK/UQ5H9L
         qxL13RsuP1YMgAL1C0jQlyHCswyDJCs5G8Zr5a0hYldcnhFmgJUxN5QrqxOLR8GZ/0sm
         qckAEa7JPvzd1iSTs51qI1Ac5UyyLrXrmo3fgasmUULJTbbU1yABUhPu8eEBMfz6eHFO
         Mik07/Wz/Bca4hvEhETsjrSav/0VO5Z1SSpQMN27IdcLzu+vFYIwxVp2XE7Y9GeJFbtO
         FiLA==
X-Gm-Message-State: AOJu0Yx8tWF1CY3QeAqZFH4Oulz9x88IEp+95S73/kVkImrNMhD/4+vQ
	GbE8kdEZMy9DP4vsNQg0vDaUAeVgp4hsVXR3EiYv7o4Djq0jmw2Z5h0z/wQ7Ldw=
X-Google-Smtp-Source: AGHT+IFfmXluDCSnkzzStA4PWMC531WtouMTNhGivXaIBwHrHdEwzGEOO2m9A/r84P6yjsHUwIBk9w==
X-Received: by 2002:a17:902:cec3:b0:1dc:90c0:1e9a with SMTP id d3-20020a170902cec300b001dc90c01e9amr4544170plg.64.1708919794062;
        Sun, 25 Feb 2024 19:56:34 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id kh5-20020a170903064500b001d8a93fa5b1sm2897615plb.131.2024.02.25.19.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 19:56:33 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 07/20] Staging: rtl8192e: Rename variable bCkipSupported
Date: Sun, 25 Feb 2024 19:56:11 -0800
Message-Id: <20240226035624.370443-8-tdavies@darkphysics.net>
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

Rename variable bCkipSupported to ckip_supported to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c      | 8 ++++----
 drivers/staging/rtl8192e/rtllib_softmac.c | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index ea08ac058421..6cab19b03f4f 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -928,7 +928,7 @@ struct rtllib_network {
 	struct rtllib_qos_data qos_data;
 
 	bool	bWithAironetIE;
-	bool	bCkipSupported;
+	bool	ckip_supported;
 	bool	bCcxRmEnable;
 	u8	CcxRmState[2];
 	bool	bMBssidValid;
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 63e3b655e4ee..cdb7e87c0c89 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -2099,12 +2099,12 @@ int rtllib_parse_info_param(struct rtllib_device *ieee,
 				     & SUPPORT_CKIP_MIC) ||
 				     (info_element->data[IE_CISCO_FLAG_POSITION]
 				     & SUPPORT_CKIP_PK))
-					network->bCkipSupported = true;
+					network->ckip_supported = true;
 				else
-					network->bCkipSupported = false;
+					network->ckip_supported = false;
 			} else {
 				network->bWithAironetIE = false;
-				network->bCkipSupported = false;
+				network->ckip_supported = false;
 			}
 			break;
 		case MFIE_TYPE_QOS_PARAMETER:
@@ -2349,7 +2349,7 @@ static inline void update_network(struct rtllib_device *ieee,
 	memcpy(dst->CountryIeBuf, src->CountryIeBuf, src->CountryIeLen);
 
 	dst->bWithAironetIE = src->bWithAironetIE;
-	dst->bCkipSupported = src->bCkipSupported;
+	dst->ckip_supported = src->ckip_supported;
 	memcpy(dst->CcxRmState, src->CcxRmState, 2);
 	dst->bCcxRmEnable = src->bCcxRmEnable;
 	dst->MBssidMask = src->MBssidMask;
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index fd4bf3486804..d3837fa2c859 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -740,7 +740,7 @@ rtllib_association_req(struct rtllib_network *beacon,
 		}
 	}
 
-	if (beacon->bCkipSupported)
+	if (beacon->ckip_supported)
 		ckip_ie_len = 30 + 2;
 	if (beacon->bCcxRmEnable)
 		ccxrm_ie_len = 6 + 2;
@@ -817,7 +817,7 @@ rtllib_association_req(struct rtllib_network *beacon,
 			*tag++ = beacon->rates_ex[i];
 	}
 
-	if (beacon->bCkipSupported) {
+	if (beacon->ckip_supported) {
 		static const u8 AironetIeOui[] = {0x00, 0x01, 0x66};
 		u8	CcxAironetBuf[30];
 		struct octet_string osCcxAironetIE;
-- 
2.39.2

