Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3958028AAEE
	for <linux-staging@lists.linux.dev>; Sun,  5 Oct 2025 16:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759680026; cv=none; b=jMXZ3eShtSPLIBmvWffqqmQuKpZk0aI35GNE+iz2174yFbuRAfFB/baUEZjc/XQMw+1ZZ0pBOlqcwYgj7AXkcg/fI0JiBqXG7KYkfDeR+xPX/xBTMbHxw0K4pzi/jOlp18cq3Ozlmo8nPSwYNoQagAqqRl7jQp/4sRtnRQZKI/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759680026; c=relaxed/simple;
	bh=TrDcUfuHZ7TJREmIthB+j55m+yVeaMzeFTZqozHwAPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tm+FJznGW5SeBz3+0wT81jcCz4TSah1/1l3jpXAhzngFXH/FU3mwFtBv4nQkxXWYrMKngNkKztngRJuzRV3WCJythmPvp045ePaewyWgtFj9lrT35YCq1p2vTRsCQhKw0Wz139u+h+FqZ5BY3mcR1IsXqDbU67IMJbFB/Do6rYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=garAdIM1; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="garAdIM1"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-781206cce18so3314093b3a.0
        for <linux-staging@lists.linux.dev>; Sun, 05 Oct 2025 09:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759680024; x=1760284824; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5CWusk2svzGl3MUuAZ2TzWoJhJSyuzuzfCNyygDsyss=;
        b=garAdIM1F9f74pWqe5cToq85cBE+9Dp2v2qvRPFDM85UxLS/42+TyOdz3j/OMb6IPk
         ie9hAfJnRi/9YahED+WdV9PI+4ujRzUuAFcHN5m8tlQsIBPw3Y5Xta5mGRE74MgqiG2x
         I0lcG1gI9S/bMPwFO4+heWBmh3idr4rzxG9gYuRQ5FluTQM/h2W+phGwfmkcdaUD2GXw
         dI+hfb0376EvPlrWW0hjNZxaQNzJgdV48+Yjfcc3tJpT+7YuErwy6f57yUv9ofFHmQGG
         +xLQssCK8qdowwiq8xFhtBkm0PUkQyVoueZ+pPbiDV+QNDTnPFF9UP0IWWCM3jrQc7RB
         208g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759680024; x=1760284824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5CWusk2svzGl3MUuAZ2TzWoJhJSyuzuzfCNyygDsyss=;
        b=KjEUQORphEgdwoulWBfd47pV7ul5T905T/kCCp8Cfo3XQZS/PROzJjG8ugSUygYOix
         5wdNWwYxwDo/S2p9exW/9iaY4h4B2dAnMADkgYh/UALDwwoR+ByELVztB41AcUqz1Y/+
         JjRQWfoWROjcA6tMQQlrU3pfUxOMeQESeovk3Dogew0QWKWsGGs2q68/Ov0J7tLGorhz
         /0JzT3mYj/h9yUhaBZCBxYwwE0bhg6WqCqpRFNYk2CNBXgSa2GpgDajLiL1LwVadKGL/
         vIIKNirxNeXn4VsTRkNJruuy0qjr711V1Rpw+om+M7L64dn2T8Ul7NQsdXK0FlwgqBzH
         A/Tw==
X-Gm-Message-State: AOJu0YxoFJliF5VsrEAds5mzvu1Bv6AaJz8qQIbX8CPvdTP6qcjMceEf
	J0Fn0z+Wxe/B5BEWCDNpzLfAfNB6bxrG2VvWVdUkV798OIXCMO5gmiOx
X-Gm-Gg: ASbGncvd2A0Jfpt9rpA9buAqbsyRyawrj7hiRzrpuYs/E2tLYAZbnWZAVgHh1CueH0B
	K9KGHihS1Sf7egFpJVHbxHaX7f1ILQoUpBWC5sFXlyMmlLcMxOPcgGC7Jm436KMDMnEmTUcWd6n
	xWrgkpKquNDGymXcHOreneBBboBlxOxhDhwutSd6yoO8hRzoo/q8ZxrQWsTfoSquHpXOoA+Ij9z
	AQjp+hHulnjTSU1Ey3lfYOESvcrbrdMO7Y94WSYMJSsnI0+HPgFtd7NeOwidM7awEqiMMbrmIuB
	lF+gIAEyz85zSBYood6VvgT7GYzn19nsJeM2duz1fZDaxCjNoPqVsWhIkuO9glA+lo2zYN1lbUA
	U2EtT2S5SqSCcH50heBE9jk28OghlZVQntrYhl1sJz0TrM7+E9J5arjpM8/XR2K/rYTjWYVo=
X-Google-Smtp-Source: AGHT+IGti/fd7mYfrNkxUVPAt+tdSYP7b25JCGnGraje9G92rstBWJc6SnI6rUiJFqb45UzxbxRacw==
X-Received: by 2002:a05:6a00:3c8c:b0:77e:d2f7:f307 with SMTP id d2e1a72fcca58-78c992116c7mr11208147b3a.9.1759680024483;
        Sun, 05 Oct 2025 09:00:24 -0700 (PDT)
Received: from Deathstar.anonymous ([172.56.42.228])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01fb3d95sm10145241b3a.32.2025.10.05.09.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 09:00:23 -0700 (PDT)
From: Rohan Tripathi <trohan2000@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rohan Tripathi <trohan2000@gmail.com>
Subject: [PATCH 3/4] staging: rtl8723bs: remove unnecessary blank lines in rtw_ap.c
Date: Sun,  5 Oct 2025 11:59:19 -0400
Message-ID: <20251005155920.381334-4-trohan2000@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251005155920.381334-1-trohan2000@gmail.com>
References: <20251005155920.381334-1-trohan2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch removes superfluous blank lines and adds missing ones where
appropriate to improve readability and match kernel coding style.

This is a coding style cleanup only. No functional changes.

Signed-off-by: Rohan Tripathi <trohan2000@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 2c906c1137bf..dddb02c0f683 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -438,7 +438,6 @@ void update_bmc_sta(struct adapter *padapter)
 		spin_lock_bh(&psta->lock);
 		psta->state = _FW_LINKED;
 		spin_unlock_bh(&psta->lock);
-
 	}
 }
 
@@ -1240,7 +1239,6 @@ void rtw_acl_remove_sta(struct adapter *padapter, u8 *addr)
 	}
 
 	spin_unlock_bh(&pacl_node_q->lock);
-
 }
 
 u8 rtw_ap_set_pairwise_key(struct adapter *padapter, struct sta_info *psta)
@@ -1974,6 +1972,7 @@ void ap_sta_info_defer_update(struct adapter *padapter, struct sta_info *psta)
 		add_RATid(padapter, psta, 0);/* DM_RATR_STA_INIT */
 	}
 }
+
 /* restore hw setting from sw data structures */
 void rtw_ap_restore_network(struct adapter *padapter)
 {
-- 
2.50.1

