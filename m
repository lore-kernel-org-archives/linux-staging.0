Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AA33D5C26
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 13:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368649; cv=none; b=Gzm22Dlvhgrd2qB3X1jyrZ5e+hAGE8tzLRKNn+njMQARn8Q/9oOdO+CKC4QynmXgJE59KEzcFdxWOKYvZjjHhuBqCWD0ASflJHCD6srxTwrnNrUTLo8eDEmaqkmyyTm+c58N9xP+8mR8KKjY/MM4HHCNxqEiJ5QwaKoisLtBjfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368649; c=relaxed/simple;
	bh=7SsrYMKDh9rt+9N6EF+fS9nQeI4YX7vkrI18oJQsNRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dGHf86Czsh+67XYqNSUz80c2GwvDGBmEp2SJFhORAICk7ZNwGA+A4+xKrl8DKodeHQ+Dr1IuzGa8BVv4JIYe7rIhVvjHIVqJ+ftS4BzXugPbndQrAZobbul4wDu5eVWGvGzljYA1V/NyWWsNtTp/opq+LFWfZ54MT9MYnflpp6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qu4gjUyB; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qu4gjUyB"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-bd4f8260e4eso1175826266b.1
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 06:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779368646; x=1779973446; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMABQ2lm+8Apo5qMdLPjApIQTOzncW9oYRbW/a64Ly8=;
        b=qu4gjUyBuG1gSMkOmM903eu2c87H/edzUHzCug8mkWFl1qHh+C6AnR17XAzHAuHmZo
         J7gSZ7n4Li5wOS6vNOU/Hv8oRfrt5QCqF7rri+CFl3KV04OJXdUvQ5NNHhLxv/yZUWJZ
         Vc3uGFNCLv8SYk5XldiQzNfc527KDfP0SfdkzFE3IBeD88PRX5lXSL6dLZkS/0h+8YIL
         l9jCa0+BKQGVGnlgw5S28sgKI3FNb8ex2aP4JqH2er9vzkY9wl+OhOtuhmNjKcmxpiC7
         7mqwghhrh62w7U9d7obRNKiNMn7fj6wbtF59tm8IkwZLN9StbSSrR32Gb8Oc3E9pwobx
         3dGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368646; x=1779973446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KMABQ2lm+8Apo5qMdLPjApIQTOzncW9oYRbW/a64Ly8=;
        b=bDzWyq2TXPL6GRSGOcgbfBVDF2bQcZyfA+SjDhSQaYPwYgdQE1mbVZr8bDut3TzECd
         xwghBPI7QDbySp6GczpHKNBhh+EgM6g3PfB47HKb8MOm1GwYm/He89ES0YVHyAkcNJL+
         cXU15idYMZLPQAGFLptKRydjCBJr9OsQ7c7wn2OPzoa2aIJf5HB653PoQJtYa1z7zuNz
         NZgN7yGaVNQbyRgZO6b0TL2Cmnu4Po5g+KUguVjacbB1gVR38JVANK+c4pnwREL5DTNw
         9sxH5qrXCYEfIkgu9RfCaui0DYuIzybsC1kEnMhUEDgiJlow0Pq8tfiU3QL6ZTA3bXwN
         1bCQ==
X-Gm-Message-State: AOJu0YwZUtCI45BxyzOT0AJnut4dIB554qkL+3hjdbm2RdoRkoK+u+4o
	jOgWGt5a5yXjMPDeIiU9RVQeAPHOFZPZsMni07o8N+jU7s3GdZORa9lk
X-Gm-Gg: Acq92OFudLxXaxJJJ1fXOmUlSWGP2UXVmoploEsPjF/RufS9XqB8ceMCfES/dGdfWr4
	H7NKTR5J4JF7fiRk+GsVq6Y/Uj9S8/w/4KD81244fpqUeOf73bOD1hSCRxTfI33X7X6bTIeKpN1
	z+6JpImFaABY13k3Qwqrugpd24qzkWSWxjzYhJJryrfdAiuqUC9n+iJtPXIg7YyrULxhzZYKurg
	8pQT0jBIugiKZ+AmYh8C260TpOv54QYvMJl++Ytt7+P7+wCF3qouQXayJIV7qMPFDDGmROmROOp
	mJuLm5dDZPzuIyOuvF4JrkUhX3dsl783/6DV8Q1FY9NGAxiqLaW794hEtOofuGimL7YujCXcztk
	spGzlEaDxhiwctMFRcc/lAwm0pDxFedjCUzGchmQuwvlmbuBI+735sZpzllJqrEQetGrwunPEaz
	ocXU5mwMjVlm+5IZeK3CfOKY6LuyVP298ckydKx0EFa5oDmtgsUm+5ZJWd/wrX49DoFCOmaHdto
	O4oYSTzNOVkk6MK5CSqwQymdiVoqf2qEtu1RknJ5bxkcVc6V78feyxi8atkto2hJbwxySXLzmEX
	C18GlZuzXUjTOu3QlVrRcDHrZUVqDjPWhhjTwYA=
X-Received: by 2002:a17:907:86a8:b0:ba6:8f34:b419 with SMTP id a640c23a62f3a-bdc12f85f54mr164286466b.13.1779368645816;
        Thu, 21 May 2026 06:04:05 -0700 (PDT)
Received: from ahossu.localdomain (ip-217-105-56-94.ip.prioritytelecom.net. [217.105.56.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc8a505905sm43766266b.37.2026.05.21.06.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:04:05 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	stable@vger.kernel.org,
	hossu.alexandru@gmail.com
Subject: [PATCH v6 6/7] staging: rtl8723bs: fix OOB reads in is_ap_in_tkip() IE loop
Date: Thu, 21 May 2026 15:03:29 +0200
Message-ID: <20260521130330.754181-7-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521130330.754181-1-hossu.alexandru@gmail.com>
References: <20260521130330.754181-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The loop in is_ap_in_tkip() iterates over IEs without verifying that
enough bytes remain before dereferencing the IE header or its payload:

- pIE->element_id and pIE->length are read without checking that
  i + sizeof(*pIE) <= ie_length, so a truncated IE at the end of the
  buffer causes an OOB read.

- For WLAN_EID_VENDOR_SPECIFIC the code compares pIE->data + 12,
  which requires pIE->length >= 16.  For WLAN_EID_RSN it compares
  pIE->data + 8, requiring pIE->length >= 12.  Neither requirement
  is checked.

Add the missing IE header and payload bounds checks and guard each
data access with an explicit pIE->length minimum, matching the
pattern established in update_beacon_info().

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index dd34f229df12..94bbe7ac13ac 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1335,15 +1335,23 @@ unsigned int is_ap_in_tkip(struct adapter *padapter)
 		for (i = sizeof(struct ndis_802_11_fix_ie); i < pmlmeinfo->network.ie_length;) {
 			pIE = (struct ndis_80211_var_ie *)(pmlmeinfo->network.ies + i);
 
+			if (i + sizeof(*pIE) > pmlmeinfo->network.ie_length)
+				break;
+			if (i + sizeof(*pIE) + pIE->length > pmlmeinfo->network.ie_length)
+				break;
+
 			switch (pIE->element_id) {
 			case WLAN_EID_VENDOR_SPECIFIC:
-				if ((!memcmp(pIE->data, RTW_WPA_OUI, 4)) && (!memcmp((pIE->data + 12), WPA_TKIP_CIPHER, 4)))
+				if (pIE->length >= 16 &&
+				    !memcmp(pIE->data, RTW_WPA_OUI, 4) &&
+				    !memcmp((pIE->data + 12), WPA_TKIP_CIPHER, 4))
 					return true;
 
 				break;
 
 			case WLAN_EID_RSN:
-				if (!memcmp((pIE->data + 8), RSN_TKIP_CIPHER, 4))
+				if (pIE->length >= 12 &&
+				    !memcmp((pIE->data + 8), RSN_TKIP_CIPHER, 4))
 					return true;
 				break;
 
@@ -1351,7 +1359,7 @@ unsigned int is_ap_in_tkip(struct adapter *padapter)
 				break;
 			}
 
-			i += (pIE->length + 2);
+			i += sizeof(*pIE) + pIE->length;
 		}
 
 		return false;
-- 
2.54.0

