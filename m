Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6568828312D
	for <linux-staging@lists.linux.dev>; Thu,  2 Oct 2025 17:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759425858; cv=none; b=INavzAY4+B6jpY2ziShTtMGFq1FVy2vN2+eXJczJ4T/tFmbyyt6XzJs4DRBI3hGjOdjkOHLWTokDUJ9kv3eJj63gu2sdIXMHxDM7qdCICS7/r/J6SzTQaEqXuZpsnHuX91NzZ4a74JjH4fquW6NQ48tiHWyrodPvgVH9qX8dHQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759425858; c=relaxed/simple;
	bh=TnKLTRJJ6lErK4Ayj/2b3UMGvx3XBSAiFViCHcE3muY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EjVYWy3jdycOQtrnFJZ/vfWqyQ7RXeMCqxG3GB18t+2lwIvORJRcx52l8L2nZvGkXLhjDYEJsav0z85dxsXm1gg5OVaRLmtKVdiRmCxeUbN+T1PU+NGyshyXU94DtybynXY1iu973jjizBvnxZE4ZrbS9gvi98B9NJUydWO4ql0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BrvmBygG; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BrvmBygG"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4da72b541f8so14893561cf.1
        for <linux-staging@lists.linux.dev>; Thu, 02 Oct 2025 10:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759425856; x=1760030656; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/YZZsnVhuRhLrG1wV8qp8NzWiX9JVa/qmSszT0l1J7A=;
        b=BrvmBygGpahge2jy5VwfpszmDZHdrC1Ou5XLyII/IL1rLFyn+iijWGLT0MjGvdmiwr
         U/BWZ9nJrPCgRiQlMfQSThaR18rOg+RisVUDz/ANIhsB4w86g4QyhJwqu32WdX/tkYhv
         s+UB3SWuvQKZL1NIud/hNSgORbdFrtSj4a+S00kVntRQ1FJiCC3eGg68nZyHGJTRuDzS
         m22IgRcQejxhj6cV/6nqMyQU7LUA1tzIDJvrKyexHmJfpvBH4ke/Ns75yb679dueGwSr
         ff5L/J3z9yb7DV4T6/zXNq1iUxqUIxNv0+1FxDO4Q6gtfQsEDkQGOWyEP8ZARaaPLiBl
         nMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759425856; x=1760030656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/YZZsnVhuRhLrG1wV8qp8NzWiX9JVa/qmSszT0l1J7A=;
        b=UMIzYxPbqtNN9b97W+1V1vxmrS0Iwi1YMna59kLgt55KvmBJg+xFGuLOABJgGYa4jq
         B6FuDVtsMKIdqKfSQvFM6LNbKCB5YoSXkLRs1LJjsaYc/AqAVhxrWj/p5C5A0heehJVG
         GPHEfHP8v30UNH0KpW/sezAQsBXVc1URD8YP5vd/1kUlLDRupcEa1zJma+MO0qtqw1SQ
         jMqiX63csZHQ9YiTwWZDRWt8Hr4ShvvBlHPSfSxNqLxeeZKlQqaI4O/3OInULWn4Rjdg
         fbvgZBzEP3GiH+KEWug7KPmEblxtZdBb0WxtDsg/uElEQtNu0FiTPyYB5AFT+Ttm4L/W
         GXbA==
X-Gm-Message-State: AOJu0Yy7b5qDUlbg4cc+wL3oXAJH52mnWcfmQ0Fq1EsMBjrOAGPnzDNs
	xz+L58cGGoZv5eFVzyoiinN4frVAenq63B8xNsjama2RrsL1ZpLFMM8x
X-Gm-Gg: ASbGnctl+QVjnfDybCoCXNHZMRR77A3sNwEl0zbxQ7ZN20bIMaYpqCRuwtlyeA0DPoq
	GVwQVTmJOEqnqx77t8+SrdGmoOAlEMCoytJ0ZWnZRsCE4H8ayRFwPHeep0b240Uab/izbBLiFmR
	UYczBdAPTeJON4w2/2sFFrhnY/RrExuXmdczPaTmTVQABtn0F50Tn1PKhKmM3T/Tc92rx1Y3NMM
	pf60Hb+aMCpbOUdkbvYZE2xCPML1J+HkGldbA48Ih6RnWOiDQBQorCOnBJQ2sGi9Ap/bYn3hr0y
	lPunNjtfSwUwdSvly+MfFHniaUsU15Cc0dKruXMbMandRgvjwS88Q4ddd4fcJxkZp5PEI5e+nu+
	Xdef4FHhctgoW9ganrY9Flz41XuDVG9sCgQcUgjOg0FVRF3GnYBrCzIKxAz+2Eb3LKsOPO3BJpP
	8=
X-Google-Smtp-Source: AGHT+IHq/nu6xvYLrVY5dOYgmICAlKGmpDqj/EFzgjuYKt3fMSL5t0Ss5zZJjr2Z3fnSAa2wSTIJgQ==
X-Received: by 2002:ac8:5744:0:b0:4b6:373c:f81c with SMTP id d75a77b69052e-4e576a7bbadmr1431871cf.30.1759425856102;
        Thu, 02 Oct 2025 10:24:16 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e55cbd3d9fsm24504971cf.32.2025.10.02.10.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 10:24:15 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH v4 15/16] staging: rtl8723bs: merge nested if conditions for clarity and tab problems
Date: Thu,  2 Oct 2025 17:23:03 +0000
Message-Id: <20251002172304.1083601-16-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251002172304.1083601-1-vivek.balachandhar@gmail.com>
References: <20251002172304.1083601-1-vivek.balachandhar@gmail.com>
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
index aa842905a467..f17b16fe8819 100644
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

