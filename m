Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79FC3101B6
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 21:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779397572; cv=none; b=gNl4OxYzbRx0rwF8bAmxYlUJD8SQ0j5KEe+WlJjtaMiXOqmB2tRESbeOTcvz5U5AKVNN1qsK3cTnR2RaUHc+slyqP/zpSuykkP7TqipNvapPNmHYvRspIjk2HCSXyDPG5b8smtU0pLMTq55lgnlHaXH+UX6LfGSi/QNGn9GgjpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779397572; c=relaxed/simple;
	bh=kFk4yzYuZMJ/VVoSAgSJDV67BITGgxjbQdADzjlIVqc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gBUsLJ3FpkxtR8NeZdBQaXPTHkmMhzS9a63R0Pt6OGpMm/DyLej+hsW2OrtI9ix7h944y/EO+Njt8Aw2KeTYvGRowsu17FEZxN25os5/r2zCWjmlJSHFKFlh5GLc4fDqK8JkPL1OtGYriI/xxSDauql8ujgBrgQdOySVP6IIpFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FKSW0Xvq; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FKSW0Xvq"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-479ef2b78f3so6271472b6e.2
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 14:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779397569; x=1780002369; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PpZ73MXxwxu3QQflOKYEf04M1irbWGMH8H5yz6KHaVY=;
        b=FKSW0Xvq14gE4Yb+CB4Jf6TEd9s7gL+v57mVqQgYVKz5owttHwsVeSR5Pn6AS1/z1y
         Ak47gkB+040nGhiAvaLogQ6pap5IWpqleccf7XVp0yOE9dkGHE3AoYGNMbXoJortuePb
         IwmEI8wOXfcwXSrdKJf2MmCQLd8O7/+3LaVaq+cZEeVuP/pj38C5oZa2o+eFHnLCwotX
         As0BWO/a99/EW8RjBJ1ZP6iR6Td7v7J4h+3pAzlt39Lf51iCqpxUZuNcoQPcs9nIwNrW
         LJXAAHW/v+Q73sCWwcu8c+2C2k3MsWanCfKH3CR7AwAwVc0bUyg+mRwEn1/wfWjc7qV8
         Yd9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779397569; x=1780002369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PpZ73MXxwxu3QQflOKYEf04M1irbWGMH8H5yz6KHaVY=;
        b=nW4NPPmLYHtCd3OsUDFyMJN2xy7MkMCbloOaNmbQUkWzkR+bBjkm9p3CoRP5YdxIa7
         G4JOT3vZJVE4/fGmJqVWvqlIHXkzeeZ36sU/HV3/0dgXmOSAN88i31rdcoPbUawyem1A
         vtyeIfWZJrYRF5o9ElwuNgHXWn1pXkcP/zmIvr/0qQ6MM38LMTpzW4mZRc7TCpvGjqpD
         LzJ+h03Ph4wfZ8Z5up/BIsxOG/cu0dSEPUqOb22GnEkB/riQWjZigbp6u50nrAptwLZh
         Sty7AkFdA9Rj5bQA/b77iU9BRoQPitKeUHZ1zqAH5WZ9+SXatJK6vdJh2Jca+wbRzk6i
         kqLg==
X-Forwarded-Encrypted: i=1; AFNElJ9cfsNQEywy4I9fZYF/GqEdG0gjroThlUclLWKcA7suUOkI7MjnOgcm+a/1G8V2/MvVBYn8SeXjwvGk4mH7@lists.linux.dev
X-Gm-Message-State: AOJu0YxeDTrIyQPx9Nha9jHwNnKfvLDE+ca055OZcHEqjw2BlXguZ6cL
	/moImO5LvsXjBMDDicKhay3E748aLPDTPkIeosJ9pqnkIWTbDt/pYCLj
X-Gm-Gg: Acq92OE08cE9OgUqoQq3+WGQkLtdApqmBLi8L/9RUoeaPpthsX52zUKCfj7gX0nIttX
	AE4xAIHJPy687JM5gbXBWZCVVHYHTPRThA5DNGCJacNd7tkPhJjg8olw2d2KGXB8lGvYF9tqEYk
	lt1ukZM8XhOMGJ6OI43W8X/V4i6e+lvR/uW+fVFniLMzFGGmJGFqUzYdWrMxr/iAYSnn6SQszCH
	Sjos6eLCvSERjkdPK6oxyuEDjhoOF28KU39oxK6TP8sBJrIha9qL528PNyqCvw4HRYH+X244oTZ
	f8aw0v4tsliks/YfLUJaoub7I+O8i8ItagZ1IZ2KAl+UEXfB5M8wP4aYfdt8LtxiGpzGeyJoctW
	N9AE+FuPJOfdGfwgdOWsDCDDP2QWqPsjlo5cTS8fsPB4Jy2x/wD/LqXEeCVLNRz22gDdpT4qWWh
	yC4aiiqk+nQq9/lQHxFzIPJBVvRxZls7Q=
X-Received: by 2002:a05:6808:f8f:b0:46a:7c00:5cd8 with SMTP id 5614622812f47-4854a243fc5mr437367b6e.22.1779397568748;
        Thu, 21 May 2026 14:06:08 -0700 (PDT)
Received: from pop-os.. ([2806:264:548c:885a:fb25:8a80:d99d:260b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-485431776acsm954022b6e.13.2026.05.21.14.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 14:06:07 -0700 (PDT)
From: =?UTF-8?q?Diego=20Fernando=20Mancera=20G=C3=B3mez?= <diegomancera.dev@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: m.steinmoetzger@gmail.com,
	guojy.bj@gmail.com,
	straube.linux@gmail.com,
	error27@gmail.com,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Diego=20Fernando=20Mancera=20G=C3=B3mez?= <diegomancera.dev@gmail.com>
Subject: [PATCH] staging: rtl8723bs: clean up if-else logic in odm_HWConfig.c
Date: Thu, 21 May 2026 15:05:21 -0600
Message-ID: <20260521210523.133725-1-diegomancera.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
index c88d669cb086..2e47734a0ae9 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
@@ -228,18 +228,11 @@ static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
 		odm_parsing_cfo(dm_odm, pkt_info, phy_sta_rpt->path_cfotail);
 	}
 
-	/*
-	 * UI BSS List signal strength(in percentage), make it good
-	 * looking, from 0~100.
-	 * It is assigned to the BSS List in GetValueFromBeaconOrProbeRsp().
-	 */
-	if (is_cck_rate) {
+	if (is_cck_rate)
 		phy_info->signal_strength = (u8)(odm_signal_scale_mapping(dm_odm, pwdb_all));
-	} else {
-		if (rf_rx_num != 0) {
-			phy_info->signal_strength = (u8)(odm_signal_scale_mapping(dm_odm, total_rssi /= rf_rx_num));
-		}
-	}
+	else if (rf_rx_num != 0)
+		phy_info->signal_strength = (u8)(odm_signal_scale_mapping(dm_odm, total_rssi /= rf_rx_num));
+
 }
 
 static void odm_Process_RSSIForDM(
@@ -437,4 +430,3 @@ enum hal_status ODM_ConfigBBWithHeaderFile(
 
 	return HAL_STATUS_SUCCESS;
 }
-
-- 
2.43.0

