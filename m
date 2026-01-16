Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BDD281376
	for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 16:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768579781; cv=none; b=uKCQTZqrYqgoWdjRFEhXCZZd5wHWSbyMHNyITuYI21br4afQdet1TudshS4O/CQceoIi5x0oOkqlbxoYsGSUxrdNMIEn+5V1wrkuuvYemzYOKYGG9ppso0AgzqIZke00Pf6uvh7LBeIPfaP3XSDhQH8SqC6JHYc4JWeMgCwR9Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768579781; c=relaxed/simple;
	bh=TQfT8HfnqyXvDOnsN4mGML3NF3Slg5851bjqJMsgSjw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X1mFOG/9SqZ4j5wQJJPOn30S7u4LcP4WzfyExN8JJKY5BKuxgGz/taueWh48LGAypWCXsB5N+Qed1FVydqO4AauNc2oLjRp40PdTAOT3hOUhQguPX4VpWrnIdqZeR0nCPWISruQAPfoBr+ECKdV7qVHyRnssINUk8P+66Ia1HaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A393oaWW; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A393oaWW"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8b2f0f9e4cbso191250885a.0
        for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 08:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768579779; x=1769184579; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HseWe9zV+sk9O35mVrKBr5QtWwI+opDRx+uVfIXzNJs=;
        b=A393oaWWY34hVNIMSAPeThqT3BrPJNXwiZ3aqQoHeHCSXQEo7+RldmIjWHFmF5g712
         XGCYPnM7C6iXNCP2n2WgR7T5KiJxsBWe41X9bsBpLkF2+KT3VamN1Pq76BtE1FUKHuT4
         Vo3PbOh7JkEs6efI6qT66WPUtlanZnfxtvU448xRIugy9SeOYKE2tpfdK9oLwv7VLjw9
         4XKuha08fWIAOVl4S49TPq0vJ/o31bt9ZomOlABEQAeADNQuwi9UkcGM9L/SXkTN6KBX
         3eb2XzqfcYOqdQnyFwuPI3l5RuaMdS22UU3cNG5SCaq/tdEQsKt9Fpcy8bGefO8NvDpv
         fuQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768579779; x=1769184579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HseWe9zV+sk9O35mVrKBr5QtWwI+opDRx+uVfIXzNJs=;
        b=tZaXGYuJfKaY0RkNPdiC5jzgK08HR5RC8hmrwuwTCDH5ETtT6LXnQlKz0FkJKR2jv3
         pBIg+YE1ngAR/3VsRMgXy/QOQTDZ3pwN1TqpC8cHNgvMYXOm1nnrp+baRVsGuuqbYf3n
         7NIfJuyeLa8a3ZkQN/MiMa5eFX0lOC9CZltyhAN1ghRVDaM9Nn0PRxrM69RL13vI8jYC
         +15Ysy5lnAVGxzZFgZX2VHvldxSQFFtBRUQzFtj4MdVpBUY9uteczs4HNki8txpw86X3
         DwM4bf4sz3DpeubTt7Cc4cWTdZLeCMXULl/9g0wmm3JKVf8SMyVkywOBbKjN/mGxp+iu
         lk1g==
X-Gm-Message-State: AOJu0YxwBR6NZglKqjNFVeMDp94gfcuXlpa0bhlWsOZlBwZj/m7L37+0
	lVZspKGzNWlCMDU82ctzOM81JFHyEy4axHIpOFfNPulsFsAv7PdT4JWHc9JGDfTg
X-Gm-Gg: AY/fxX5mDlRumsjvS83MVmh8QgoI62EfE/3zMP0JHwN10FkKOTxHulCcF6m4WeK/3gh
	6bQNACSaQSUB/iHXL6/oIxHTRG1ZZ9pRJ+gFZsUa/bEb1oAMGzPdOP7pmSVEIgGnMHihmFkb0rO
	n/gw8bpXisM2BsMi7Q1XRSsFnyXSBQ/L77Zk9gPATRIRqSDIaOCZlBO90QCt25VQxr+9OeVDVzv
	fnlw1AYYlpj7lYL6LZnzLrZJEvBVl2fizMQ67AGrYyp57VQqvH/f13ZkWWfT8eV1l5cIbcrscrm
	FVVeWBIls+4QRcxadrr1adBAbHiGr54pNnvKpzOoEsUVq4ptRXANzgA0FWk55ueCUbQ0+zm9gBP
	zRATK9qfjI+0S899xSfreZW2IZI+yxm0+hZjz9Rapmw9qLxTortbx5zcBu5QSL0cbgbSTDQnZQt
	7j/0badW2iz3K4bGWS1j/KGZG7
X-Received: by 2002:a05:620a:294f:b0:828:804a:47f2 with SMTP id af79cd13be357-8c6a645ce9fmr518774985a.9.1768579778555;
        Fri, 16 Jan 2026 08:09:38 -0800 (PST)
Received: from localhost ([132.216.195.103])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71ab272sm266222485a.2.2026.01.16.08.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 08:09:38 -0800 (PST)
From: William Hansen-Baird <william.hansen.baird@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	William Hansen-Baird <william.hansen.baird@gmail.com>
Subject: [PATCH 3/5] staging: rtl8723bs: core/rtw_mlme_ext.c: remove braces for one-line if-statements.
Date: Fri, 16 Jan 2026 11:08:49 -0500
Message-ID: <20260116160914.88069-3-william.hansen.baird@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116160914.88069-1-william.hansen.baird@gmail.com>
References: <20260116160914.88069-1-william.hansen.baird@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unecessary braces for if-statements that have only 1 line
in rtw_parse_security_ies function.
This change is purely stylistic, and makes the single-line if-statements
take up less space.

Signed-off-by: William Hansen-Baird <william.hansen.baird@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index d0c88f6c4ba7..8e41eb61448f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -995,12 +995,10 @@ static unsigned short rtw_parse_assoc_security_ies(struct adapter *padapter,
 
 	pstat->flags &= ~(WLAN_STA_WPS | WLAN_STA_MAYBE_WPS);
 	if (!wpa_ie) {
-		if (elems->wps_ie) {
+		if (elems->wps_ie) 
 			pstat->flags |= WLAN_STA_WPS;
-		} else {
+		else
 			pstat->flags |= WLAN_STA_MAYBE_WPS;
-		}
-
 
 		/*  AP support WPA/RSN, and sta is going to do WPS, but AP is not ready */
 		/*  that the selected registrar of AP is _FLASE */
@@ -1019,9 +1017,8 @@ static unsigned short rtw_parse_assoc_security_ies(struct adapter *padapter,
 	} else {
 		int copy_len;
 
-		if (psecuritypriv->wpa_psk == 0) {
+		if (psecuritypriv->wpa_psk == 0) 
 			return WLAN_STATUS_INVALID_IE;
-		}
 
 		if (elems->wps_ie) {
 			pstat->flags |= WLAN_STA_WPS;
@@ -1035,6 +1032,7 @@ static unsigned short rtw_parse_assoc_security_ies(struct adapter *padapter,
 			memcpy(pstat->wpa_ie, wpa_ie-2, copy_len);
 
 	}
+
 	return WLAN_STATUS_SUCCESS;
 }
 
-- 
2.52.0

