Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B632C3266
	for <linux-staging@lists.linux.dev>; Mon, 29 Sep 2025 06:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759128663; cv=none; b=rQ4PQg4dOv+8xkww/Rg1B4dcRtUQUHXBUTQanRfhnOKGXHBc7M8UsVuY62fR+io9lizMqNizOuP4+BCTJuWCjJdrNqmlHmWhrQcP3yEvj0FwUgFyBrbmhqZVXp2+L/EBi5rgXgTHCEltlfmFK6zMkyMdDZgqOLHvSTWb7YQHix0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759128663; c=relaxed/simple;
	bh=j41yExCsKaaUjcSIHJe6r3UBHZsX2oLK1/XLveL5/Uc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EPa1ETEoOLB57J5GGuL9C/1mDkf0wxVtONIlYm+IYGThBTFXR74i1Q5BCRwRx4O+j9c1OEuL1ArCBwPLIKQgYjo57IuNDwRWO3cQKPMSnRITDchsb1QhPHEjciVupmNA+gLjk9I6ZMBXwux00i7PZjO61Mdy5Fib+YqZ6MnjF8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bVcXMKMP; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bVcXMKMP"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-856328df6e1so424104885a.0
        for <linux-staging@lists.linux.dev>; Sun, 28 Sep 2025 23:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759128661; x=1759733461; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5PyA5YFgx0PLE3LSarm56xsDTtWVM1hBOP7X/Svx67I=;
        b=bVcXMKMPLrg9/LHnXfUexJOaR2Ll5Ypr4pZRoSkX8rRl/VofgGxfIHYUEh9rDy4Lat
         ZfgVNL+LlmgXGCZu5Xyj++ONUjtkvGBMrwp+Uwz4ZPTCUS537vSFJQ7xI9tLO7H5j+p+
         QmTxnRF3aUbyTDV77XQtI6cL2lP4gDJRFsqn1iT4ef+WTTTFaTGg9SLlt9r+qLGIBuPh
         a/VnzYuefHUn6Y5M3Fy5v92y3mOy521rNJgtqWGgVPTjcA5EuE40uSImYStWoOL5fkWt
         Y6xUxnw0niFCt2Jlhh/+8Yj8hmixV8IVe2SlhyWE8+p9CmC8LOqJzUyLEGFeiorbscF2
         Y5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759128661; x=1759733461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5PyA5YFgx0PLE3LSarm56xsDTtWVM1hBOP7X/Svx67I=;
        b=GpeHBqbJwPmq0suFvxQ9lUNw+9pWopir9NnkNihF7Y6DRB4BSQObgIYFHjOV5Sr+Eu
         rjt9r2wVgds2A3FSVKF3te5Dc0QVR5rdjip6E4FS3PbUnmIErfTeTbCFz6cYN591/0bd
         Bd4hNfxIGTG7DSHjVjnmDK+jUPO0UwBzJ6f+PAI2qiazw1t0VGctSHlIiiXgJiUnanMX
         xF7gtEKhB6irWdDoV3u3EeUNC5KNGTVeRkuWGNBGpFWBuDT4QHC5/bexvOlRdmS0ypV+
         VWEfO6kNvXHplhO8wVznlOz8lJ6gn1kTqZ2a4Ev1pUgV25YpkXtRX48tDLvb8lWRs4+e
         VduA==
X-Gm-Message-State: AOJu0YylgJLNMs+PVzmmb5qPB4mL5WlJnjJFLSBfQhJERyxQrSjBSbcJ
	yyFyqdvPKJIr59fN3VhXw3eLKE1jkN4yeyr5LzocOWjesIXuxTX7/PSh
X-Gm-Gg: ASbGnctMPdQI+AzB3zW6qwUi9lLIMCdJVcIMftv17NqqdHsgJyfC1hu2TGtCw4YNK5L
	/THtgW/sUZ0fzkiAso1i9PomM4oPvQSGtzklYLMqFnsC7MDHi4arQSIKTVwGRnfxtkGQw62LPgt
	Y42fye/Y2T+8vwtcrJO8tokwfEBeDXpzAvDaQJiVU/7Wx1XO4PZBNs/aQsUuzHtfOCkV8sandQx
	caI7HM/0Xgwwe/s1PgQvn+w8CNXMY0fz+GinfC+KeyF9/I4vu7d0XFkWLXsC6Q2cBczYuz/AajV
	TyuVSgAfidoYvwgYpgzC4YEl5TdXYTtKZD1/faYhpPynbFGWtGyEnpCTrGsN5/2PwStyzJ0wjKQ
	uJrbKiDrlfWhpyBQ8b1sBlTOwW2g8pLml5b7w6hhk6O5Un7OoKLM=
X-Google-Smtp-Source: AGHT+IGVZ+6+uYWljd9/v1KclebPlFys/+ZUCb3LCNXleY/oBGrohXf0aFyBGBAY1P3g3+Pj/SY/3A==
X-Received: by 2002:a05:620a:a498:b0:85d:aabb:47cf with SMTP id af79cd13be357-85daabb5028mr1185750585a.9.1759128661026;
        Sun, 28 Sep 2025 23:51:01 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4db10874bb9sm69517671cf.24.2025.09.28.23.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 23:51:00 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH v3 15/15] staging: rtl8723bs: merge nested if conditions for clarity and tab problems
Date: Mon, 29 Sep 2025 06:50:00 +0000
Message-Id: <20250929065000.1010848-16-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250929065000.1010848-1-vivek.balachandhar@gmail.com>
References: <20250929065000.1010848-1-vivek.balachandhar@gmail.com>
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
index d9483594afdd..56fa51a7774b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1254,8 +1254,8 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
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

