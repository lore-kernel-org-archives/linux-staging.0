Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCBF3ABD95
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 14:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779374521; cv=none; b=Ky1OPYw4uTsSTl4lh+riWEl5uU6JMB65btWVYWsQ6G2zn87IH1C91tnWxPqlLehfrgBxwkQfQAGpiR6c/G6bVGKsfSf9CRXQwgn88+Dzc0SqkfgNZc6asOegPnSgpxfxyPNIycORPSYwPWy2qlmj7QsOoziK5ARcivo7G00mcDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779374521; c=relaxed/simple;
	bh=zG/c4HzkYSRbUyH2YM/WwDn1QY4tREXrHq7hz9jCybs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TyX/hb90j98+wOH+2jFIkUMoN78SaPJK3ffLnCJI5tLhib5l3qtlEbWiYjd4ubGe1giq3lG/ozTkbgOeHU3BQ5qKUMGXngzNDHXE9UsDAWkwowGnmK/tMWlKQ5CBJ8ELoGOhfz1AkRoizsyy51yqj3LMJRYLkmb8mPVylfPj3SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BaTB5bk/; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BaTB5bk/"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2be1dd4af34so46308285ad.1
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 07:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779374520; x=1779979320; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K+dFGn//E1YiYMvxbON0Rqvrd0yb0YTLfTiQcSGi7qQ=;
        b=BaTB5bk/Wo4YTFVlP9k6ctjaenuLCNu7t8WOOCNnfQadwutMfu9tEpIAeITmvCe0y9
         eAGPQShdiJEPfIzw4bU5afGWdEwFe50K1pwQNh1DAd+lsPIpnV4OEUHQop6fgwd4CUF7
         vkI+haqx/blkhPSt/m0gka+eEH68y50g4avWayBAsKAaDIM695niVqRuHJJuytYCiaMj
         IgYYGo6vw0xdCX/oN0aHq4AXlUzQx4tlgHqX1+KNQ6TT9XvJOKRbINBApjlGx0Z3mAE7
         2vbGY/NaICutrsd4N/zuJPoIVg3QlQVNc5PpAAN8aX1PXPV4hgfhreDzm70uWIbi+kpw
         JxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779374520; x=1779979320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+dFGn//E1YiYMvxbON0Rqvrd0yb0YTLfTiQcSGi7qQ=;
        b=G2ECdZOy2iRw643hAbn/RToiMpq5217FhQT8cip1Vfllv/SxQTNuGX0izasbpARkzz
         IIKkMaFqQ9a2YLvC+8Cgi0REDhgYo3B8DCJTWW3rMZQ07Ma1c1BLWNzWdzXZ2lEAwu+M
         ZvbuZSCKHmAKg3GZ2z4lPL3lCTrA4AeiC5zblVHl7WAmgW08CPIOgQZPc6mpQIue09xp
         M2MlkoJaTTz4QP74hmZtp2D8h5F+vYkQXddvOZX2hbbW/69qQTL0Z1cSmsjVZgLZ8Fqt
         L5qmoseLLNL1ZUnRSwcuKPRUfq4f8kwJ1qftbVAX+1NbhdRV6vsZm4EgYz5HPwergFYn
         DSnQ==
X-Gm-Message-State: AOJu0YwtPtZdID5WTckvO3jzHVst9/WuFpEKEy9i8c65uuzgJGx3io2K
	/oofjgPIJR/o+dLm7CWpyoIvjOa3t1J6KQ3yPhBMeWVbdAF7k8VHf9Nt
X-Gm-Gg: Acq92OFFEgXBO1YYUG5CI/PWBGN0TenSKpR158tMnjveUMAsaGRka6/1dVA4B7hrGt2
	Hv2x8N8gSMkPM1cf0ho+LsqDuonwEq1pnFPWFFFguPDhWDu8GYMK2twbKiyKl8U+Y6wZeWA54eX
	Dy4J6pwN7q+sYsPwB9u+AVxz7GyK5Nh2BBZWHqUZTh4mm8WNq0q2mIfV9KU7ESYR2rNU2BhbjEb
	CLuMRPf6b0++TsWXwma5bmHlU4/Ye6wvdkJ6941n+HcRbjFJ4th/DmVE+6nenVobtTAJ4gfvPHo
	GDX2IxSGSIlNnTA+zixyTAQ0ms5/FFsLHgS4nRU1PMxKPDc1lBA7EvDI616HRsZAQa429UpVOWq
	zfNV4MoOTyZX0/TSIWGsHyCcHRd+JbUrhXoul6y0Iig+M4f2trnB6ycLU4vKb0Yx6fFzuXTMz0P
	W4iu3BNezM3DDxY5VXh8hDZDKdinXwVwOXy4mRTQ9CYHnT/Ycrmfkv+D2GpnfDYbBCZnI1UA==
X-Received: by 2002:a17:903:240c:b0:2bd:907:2cf0 with SMTP id d9443c01a7336-2bea33a548dmr35923735ad.32.1779374519634;
        Thu, 21 May 2026 07:41:59 -0700 (PDT)
Received: from thinkpad (36-230-164-124.dynamic-ip.hinet.net. [36.230.164.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea98ed8e1sm12851715ad.47.2026.05.21.07.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:41:59 -0700 (PDT)
From: Pang-Chun Liu <kevin95120@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pang-Chun Liu <kevin95120@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unused rtl8192c function declarations
Date: Thu, 21 May 2026 22:41:12 +0800
Message-ID: <20260521144113.28869-1-kevin95120@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtl8192c_translate_rx_signal_stuff() and rtl8192c_query_rx_desc_status()
are declared in rtl8192c_recv.h but neither has a definition anywhere
in the driver, and there are no callers. Remove the dead declarations.

Signed-off-by: Pang-Chun Liu <kevin95120@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtl8192c_recv.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
index 1f86654f0403..b63625ab4e45 100644
--- a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
@@ -30,7 +30,4 @@ struct phy_stat {
 /*  Rx smooth factor */
 #define	Rx_Smooth_Factor (20)
 
-void rtl8192c_translate_rx_signal_stuff(union recv_frame *precvframe, struct phy_stat *pphy_status);
-void rtl8192c_query_rx_desc_status(union recv_frame *precvframe, struct recv_stat *pdesc);
-
 #endif
-- 
2.53.0

