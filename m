Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F9E1DC198
	for <linux-staging@lists.linux.dev>; Thu,  4 Sep 2025 01:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756949357; cv=none; b=PMr7WpbmdeECU46t68S++qQS/p/cmBJUTczqOI6xjPcZq1ne6A6fIxSn7SexK7eVqv7K7/8Q9rGtFv2O9IBnL+FXpb96Gq0wKk1LFhJXmA/lF1jwO6yfSpySaGkuofNnRTeb5IGo2w7Lu/kPhRB8JBy3nUZtsEzxH3CgGd+wRG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756949357; c=relaxed/simple;
	bh=h1Ogs/KI+mapGEJM/7burIP1V8we40RoeBp8e9GSjc4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hw9BptJf3F2jCTlIikhZoiXTSMy055r0JoyGfheVD+5oj1+XJcR8OYB5y1S2fFg7xiKcs/UHO5ex8f1HS0WKfum9UnKRnsJcEdEEDzoNush87TVtGhhEpzqndAwLHxbhbTt71DTdSyKBWUeVqk2nPSVZVqoAkOITWxAW50ndlyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=glozdL+m; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="glozdL+m"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4b33945989bso10041031cf.2
        for <linux-staging@lists.linux.dev>; Wed, 03 Sep 2025 18:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756949354; x=1757554154; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cBZIhFsCm/lIrzVsuaOeokkxM+T+BWKeNExcKXnDrMw=;
        b=glozdL+m1MXlVc0tUVqj3SeYv2eob9BGJCukwJiVYnXQUpTOmhcX0KJoi7yYXMnL2s
         K/KdAu6bNAJqaCVpgqTTzFjrodGS1BMxE5ORkAeTP4bZ5RDStyX9vE3Gq/I4tk0sEVkm
         /AYvbR1aigzliap2mTku6MX3/UdFIAxLAT3McfSwBoiDfhqDZbFZ4CETCBIPqJ/djCl+
         Qql0n7NjXX4Qk+m0VpfYjSj0amT6zwN305tl7YvV9p1WiVhS6ik5BKEba74pR455yzVS
         6KzvhVyo8rCu93gYxDezSdJgkQqKqcamIAnaq/wJ83HKLmhWL/I1tsHuv0j5FgFNEJxa
         CxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756949354; x=1757554154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cBZIhFsCm/lIrzVsuaOeokkxM+T+BWKeNExcKXnDrMw=;
        b=cSgvnSZME8wi77vclnnTTD7o5ViaVNS09I/b50dhT6nwgPdZAC8PejSLkxUnl9WK8s
         CPT5HNfa1uaLXtJCaNcQ3XXceNwwcNqCslagfunP/Lv++SP69OclO90J4pMoFKGRlKGU
         Tc0zmVE9ieBbyv9oJygI4tYvLEtMW9nq9RLQPxiO6nt1vmYF7eirkg4ZF2Uz3Kargbmn
         eKklF3FUl4rxRGsBR/vyOHH7cLHrzTURqeYutFidrWt86TcgbFKp5qk6LY5JuYpBY87r
         tJHh7KCKo+KKWwIaL78uDqvxv0QKo9XMwFS5GcaxyoRDDlhCzp9NSq10EIlPvgc5f5/Z
         ITAw==
X-Gm-Message-State: AOJu0Yx67Ae5OxvIiJca/Vs4OYCtJgXg5MjiVtso2pDtOzVo3jsnU6vg
	Avr4br33XysNSGDDfF60a62+Jn1+uYWnm9JfD44G94j2Gwo0SI+fzDEc
X-Gm-Gg: ASbGncspd4Hvzo6pkB9zT8KNt+yNhhJLSmy59frEpoig5Ubd9P4FMQOscdRee7er5bA
	IQI1atybPudxmFUPOPEPV1Lp9Zr8++ULnLWuge9Zdm0SJHh7wpXx/fyvEyortMHx63nlPXYgnmQ
	igcdhNewrYGd1eYhtRWeLMFkf9gjVXnMeiakm6GOKJ+C7SyGTvsWHjmaJ52DVRj3EM+yvohRe8i
	k1LVVCU3fywip9b40RFu7m55c6lsDymsWJPuSQ37ngC56FgO/MnuIx/3ewDO7WS+v+iM2tNFehX
	g6ofFKuTXw+sH36bzdcUDvxoAEHU9owoEQuQNZnTA0dBrWM7wznA0WbrkQX+OudBQEsI0yePXTJ
	thCnRcRO8fkXsUTqItaVMQn6JsUl09sLBkgHSITYIorojRMcVTG0=
X-Google-Smtp-Source: AGHT+IGQNXKXRNa/56XxhtdOFgify33huflAjGqtq07eZh2LuQ4YgOzu3PQlAQxhklpwBmRzOY+0yA==
X-Received: by 2002:ac8:5805:0:b0:4ab:6bd2:e25 with SMTP id d75a77b69052e-4b31d842179mr202769561cf.25.1756949353760;
        Wed, 03 Sep 2025 18:29:13 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b48f78757fsm20378921cf.43.2025.09.03.18.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 18:29:13 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Subject: [PATCH 11/16] staging: rtl8723bs: remove unnecessary parentheses in conditional
Date: Thu,  4 Sep 2025 01:28:54 +0000
Message-Id: <20250904012859.215565-2-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250904012859.215565-1-vivek.balachandhar@gmail.com>
References: <20250904012859.215565-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant parentheses from a function in an if-condition.

These parentheses are not required and violate the kernel coding style.
Dropping them simplifies the expression without changing its logic.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 050fc54e251b..ef9057456768 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -730,7 +730,7 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 	rtw_set_signal_stat_timer(&adapter->recvpriv);
 
 	if (pmlmepriv->to_join) {
-		if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true)) {
+		if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) {
 			if (check_fwstate(pmlmepriv, _FW_LINKED) == false) {
 				set_fwstate(pmlmepriv, _FW_UNDER_LINKING);
 
-- 
2.39.5

