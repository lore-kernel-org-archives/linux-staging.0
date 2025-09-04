Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151D9266B56
	for <linux-staging@lists.linux.dev>; Thu,  4 Sep 2025 02:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756952125; cv=none; b=mBYBjyQu7/L0p7HXo0ZLElG2IXlSjjc7Mu32a0U/Eq5/6VrNSaY/0MLoPnttvqtMBKa0ciG2uB15Ho9oNaDZJrsoK0c6asgFUmYMUH6bVdC5GtnM00SHQbXPhRGKatV+f+hmt3Avx90fDdiRRm1fbklPmMXatg1V8g5Low0yyvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756952125; c=relaxed/simple;
	bh=1L6YyzW3erKcj33GY/6Si2DL2c5yax3FQGavbAJ0Bgw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qbxywz898W+deZljYCjw4vOwLQ8oiwP3JXGa0YHKMiuVTs71ho004jbeHw/ZzCprpbWeE40ebadlY0labTsm835+386Bw43XZxJu68y1FMl9i4tcUpJvFmyqm7NPR8uyOzdMk067re/TiK5C+BkLjFfywkAvaFX3e9hoZHtsAbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c8ldZ+/q; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c8ldZ+/q"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-70ba7aa131fso5515356d6.2
        for <linux-staging@lists.linux.dev>; Wed, 03 Sep 2025 19:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756952122; x=1757556922; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d01B01AXVKk9If9XJH5GhITUvVOiKXQj/np/FqkF0PA=;
        b=c8ldZ+/q2hy3oK0O5z2OTExo/jt9s6Tu+W0j9bGgFsZkC/f1KAVf5YxC+onujQkou5
         Vvvn7oRekN8053UgPZ7R5Cy19MTMeWXGXbH+BGgMr41+Dvy1LYDOPDdEM7/n9tB5AGu/
         3fmgzBaPz2tEo9Nt1Sc1DEMuVN77W9n+VlG+4jBvEn2Ri5TpIKNn5yt0cT82t29vNmf0
         nuBho1zCWG+sOx3HL0/lH30Qgqyo8KqolFO2ucewoRkejT1NejgrHJojsRXbXk8udMEN
         Kn5jAbKQAlSFQxCdwau2xBmJhg5J7tn342IGm76CwNQ07IlY+SJy8kRFYjI1XrISJMjj
         /Rdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756952122; x=1757556922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d01B01AXVKk9If9XJH5GhITUvVOiKXQj/np/FqkF0PA=;
        b=BANTkM78dgMdiYJb+VbCRHVCYLWIIJRY2x+hvQwXHcMlTFW1bQu9vX3LjCipkI93OD
         7k3xLfnvKXcGXgreZi0tC5TeNkoL+lW4oXFcK3Ypv5L5nZPdRW+rqAXvaPEOImNGwxli
         WwYz4eTu85Md9QX/CYEPQW7JU/PrKbbaDbwUK5ME7LQjCMt6at9KC1HVLilwnDHgg3Fq
         qi61JiXtHavb7JSI+QCe6v4yuKDOs4e5V1QsQjS264j8adbA0AvSBQXNBN2MZ+76zR9B
         JVJK3QiUbi7MRrPqEmhdVaCx1cHp9igcmb+N9Wu+ZODEkR5dan3N6G6xHlapjP0KOSRx
         dP3g==
X-Gm-Message-State: AOJu0YwvTlRGwa975pl0Bl2uoLtAT8SoXuPIZfOc04bj7vUAkYhqc2vP
	AZZS5LTgESVWbg3+J3QcxYpYm5KpGlvrMnxtYTChlKAzdIehnX9RHuzN
X-Gm-Gg: ASbGncuEg4xuCuZFPs+IM2SJGE6UhXva2lsDvJSn3gIFgoVNDjDhlao8gBc5ZazhiKO
	LIRJ3/AcJadhKU9U+kFsL51Rj84RkzFhAHkP3SEbmYIzjppfXwV1c/h87uIee85Mmmb7kmjWaPB
	BwPfTvagLu4B4teE0IPqAfnr4jHLFPsmAMS0gtnkj970Tu7MjieGsECxCt/JctTWWMBPeOz3Hkm
	ufHHhcPEJwvyxndcV5fHFhngs728xt1F9YGta2/TUMt+MTHs6yFb+uNSbzC79Hbb5znkw9EHbWX
	UcFsI0qXyvFhxZ9r8bl/vKU1CKcBKfN2QwYTRHInzP/LtcX3rWozl1M3WqQOr02iPfWnkpt8CFN
	jIWp4r0fh+vr/Ul03PNbP6WfGSvhPvjqkhhTyyStoFuPM86Wzp76B6AIKCR+EGozQeHvgYV//
X-Google-Smtp-Source: AGHT+IE/tUJ9vfI6aUgaIW4xBiaNLSkbKStwg2MrLA4uw1dqu7ZuCFfGQy7h0tzdCA+NyxZBtJEgdg==
X-Received: by 2002:a05:6214:1945:b0:721:812a:e6f0 with SMTP id 6a1803df08f44-721812ae721mr104620036d6.38.1756952121976;
        Wed, 03 Sep 2025 19:15:21 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720ad2cb78csm37714076d6.19.2025.09.03.19.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 19:15:21 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Subject: [PATCH v2 16/16] staging: rtl8723bs: merge nested if conditions for clarity and tab problems
Date: Thu,  4 Sep 2025 02:14:48 +0000
Message-Id: <20250904021448.216461-17-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250904021448.216461-1-vivek.balachandhar@gmail.com>
References: <20250904021448.216461-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Combine nested if conditions for clarity and fix tab indentation in one
place to match kernel coding style.

No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 80b4dd1e8353..4fbb180398b0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1253,8 +1253,8 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 						rtw_free_stainfo(adapter,  pcur_sta);
 
 					ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, pnetwork->network.mac_address);
-					if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true) {
-					    if (ptarget_wlan)
+					if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true &&
+					    ptarget_wlan) {
 						ptarget_wlan->fixed = true;
 					}
 				}
-- 
2.39.5

