Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FABD13540C
	for <linux-staging@lists.linux.dev>; Wed, 24 Jan 2024 22:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706136300; cv=none; b=PxSomzoNWJnHe5zcZGjXc5dm0jb3oOTvh3yzqUJ6P0XVJSkbw933FxMtudxj6MPT/YNXsLbBpxEXZoMVR30bIMN9ATGINupD+6WYpXAYO8F/BN4dv/kVPM79MS6R5pPxQiTNm1h4dztOznaPwYpB0OOxOVPOxKjUo6doDex0h1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706136300; c=relaxed/simple;
	bh=yjaeTV0WtXXorMCtYS00rvQnBP5KP664fSy4NR08CsE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J81zFkr3W6QhuPJsk7237hYlUDWC3GsoEv1Ao6p+B5VQ/gkMR0NfokZjtH3hcu7h8IX/s5mKGwQ28/I3J7ISUve+0XFvC//6tfS6uaup7MbfjnRW7O6ujjkLJ8uyc5eisB5tnskxlmUjx1n2ri8LDPOVEtudBKCQBKs2sZP/Y8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=bKXk/RZ6; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="bKXk/RZ6"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d73066880eso38173735ad.3
        for <linux-staging@lists.linux.dev>; Wed, 24 Jan 2024 14:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1706136299; x=1706741099; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PqmpICGnSbhZYBTw1NATugWFKeRYRTOpi7VeoU0Msb4=;
        b=bKXk/RZ6l1Ncxs5gkNVRLcC3eDQuVjSrwIQ7gtc83B5KfT896wedhGZE26iYZwbwfG
         4vJqBLOERrMIr3hGwwOkt0IrqhR2HK2/YKWjDlNZsHHRBO/ewTna+vZmR2hMpZGCo6Cy
         7k9A6k+cHnIzqBrXE+nal7mlpgxCU2KKF2qn3H8g+ZTxz6fGIfp0DlfZbPNoA1pPndqv
         LVAZzxK8D+EiVdoDAgDXJNojY1JqdvLle7Ia9qeStkkUoHYBESDhf9FX/0f3ifYwJcw9
         xDRpdeJ9gE1puBSi6dDpGvuEiwJPseEl4/ZdHkBcMaQveSKj/mhyauIOxjokkMcMIK5o
         +qRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706136299; x=1706741099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PqmpICGnSbhZYBTw1NATugWFKeRYRTOpi7VeoU0Msb4=;
        b=ruScg6lNE+m2Ia/UN8IoR5keaW5ukoOWY1Ko02kvUqU7zAS/rcmG6hX7D10Nkc7MTc
         l8bl5osK8sZQyH1dH+YHkIps4b62M8T8txqyYJFQEXq1RAU7S2NCCvAn4In0tRFm+3BC
         w8Dw6CIiSIg3hdgNF5fKb3J9LNDRwZt304vq1yuAtWdfCqnCIoRJoY9s/yEuBNmciIUh
         JPSLFXM2WAvOGjyu2TVT1+oDHayvmmx50FVo92Fwe2uVYOPcHw2r3iaqbbfZ/WQo6sZj
         WDlWoJO2HRXC23PrgUHhRNVuqRrmlb/zTHj2fEGj1LFlA5EMX0xlKDxij8bPybP9fYsG
         DQ0w==
X-Gm-Message-State: AOJu0YxsF40YSaCd7n+QeIyoR1AXb4emJEKq/LSa7YLenATil1fQbQSd
	tdmfIyvTCVfKQxJKl7Q4nY/MZPu+fMlgs4wdE/i5v0rRTpU/feb2xbWVLcxMTDo=
X-Google-Smtp-Source: AGHT+IE3fWRM/KGM1SfiKW4qgAG8rBmrk4GOXaAk4Ta1UovW6uz+vNGqJ9A9Au3Im49rulGW462V6g==
X-Received: by 2002:a17:902:e5c3:b0:1d6:f240:87df with SMTP id u3-20020a170902e5c300b001d6f24087dfmr114928plf.4.1706136298789;
        Wed, 24 Jan 2024 14:44:58 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id i5-20020a170902c28500b001d73a2acc0csm6743987pld.283.2024.01.24.14.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 14:44:58 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 03/18] Staging: rtl8192e: Rename variable LPSAwakeIntvl_tmp
Date: Wed, 24 Jan 2024 14:44:37 -0800
Message-Id: <20240124224452.968724-4-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240124224452.968724-1-tdavies@darkphysics.net>
References: <20240124224452.968724-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable LPSAwakeIntvl_tmp to lps_awake_intvl_tmp to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index cf855ba39c10..8a60bf3b7079 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1390,33 +1390,33 @@ static short rtllib_sta_ps_sleep(struct rtllib_device *ieee, u64 *time)
 					       (psc->LPSAwakeIntvl + 1);
 		}
 		{
-			u8 LPSAwakeIntvl_tmp = 0;
+			u8 lps_awake_intvl_tmp = 0;
 			u8 period = ieee->current_network.dtim_period;
 			u8 count = ieee->current_network.tim.tim_count;
 
 			if (count == 0) {
 				if (psc->LPSAwakeIntvl > period)
-					LPSAwakeIntvl_tmp = period +
+					lps_awake_intvl_tmp = period +
 						 (psc->LPSAwakeIntvl -
 						 period) -
 						 ((psc->LPSAwakeIntvl - period) %
 						 period);
 				else
-					LPSAwakeIntvl_tmp = psc->LPSAwakeIntvl;
+					lps_awake_intvl_tmp = psc->LPSAwakeIntvl;
 
 			} else {
 				if (psc->LPSAwakeIntvl >
 				    ieee->current_network.tim.tim_count)
-					LPSAwakeIntvl_tmp = count +
+					lps_awake_intvl_tmp = count +
 					(psc->LPSAwakeIntvl - count) -
 					((psc->LPSAwakeIntvl - count) % period);
 				else
-					LPSAwakeIntvl_tmp = psc->LPSAwakeIntvl;
+					lps_awake_intvl_tmp = psc->LPSAwakeIntvl;
 			}
 
 		*time = ieee->current_network.last_dtim_sta_time
 			+ msecs_to_jiffies(ieee->current_network.beacon_interval *
-			LPSAwakeIntvl_tmp);
+			lps_awake_intvl_tmp);
 	}
 	}
 
-- 
2.39.2

