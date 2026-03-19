Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738322DEA8C
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 20:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773950483; cv=none; b=AoKqgs7QF7gHazonFVlf7QE9I6K77x2tMHtledtG3D37bIolmnBYKd8WhlQylzib0Iruy493Mf7D/5uzJgZpV6ObgJbNyJ9D8comYfs+Dr9PSmCRa18LZtw62E1Sd/p2WZsxF2ZL+jh7smoidSRDvoE+tpESr0INRJGMYnh8s5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773950483; c=relaxed/simple;
	bh=ipThiwza+Z3LnHEP8LFTLar8wY2eIkrQO0mjkoFkOZg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DeObTiAFtQKTVo0RGSyxPoM3/4NlHU87rt7tQwOAaS+wXjFh5DipXVcJ2JdFiYvMiBoh/4AHH1y/FRJsmTFLVArVPZ2JrPSC6V3a2YhHLDwUC3f1drqDVDYAu1f2FweHIYr6rL628WFbL4Yrvv/9lKrviHaTTCjK8IIGVARzems=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RNfgunt7; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RNfgunt7"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35a034ca40cso195051a91.1
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 13:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773950482; x=1774555282; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=miQLufr0hycUsZl38jmRdARCCGpzLP12XzoY0XxxRQY=;
        b=RNfgunt7ogyZnSUb+GA9dxVHkdHgjU9A7fr9bM6qtH/9bi9g4HZ7mMq9LlAj2XV9f9
         zg4zIx6IZCSHQ61M9QcNVgtvbOsRVIrpChwt5ou4cVJI5pFJMWsFCf0RAwstdHvPIMIF
         +w4FZA2kkvw3WcGzf5eaffvfzDDtwWAj388kszBOLkZ2R2AydLztFKetcbEWHE4ZG+Lm
         lR4Qq7dym/KAXG9Cxj9q5Ip8rxdNihkmey7Yi38VNT1AaXxR8tksJO9G8Pkyo/TIFtSS
         LNsBemecxVNUGAILZeuUROSQz2GTDeFSO8hbmDWcfLI+tJMyga+4nTVtJ0lHixcDZA4v
         jmrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773950482; x=1774555282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miQLufr0hycUsZl38jmRdARCCGpzLP12XzoY0XxxRQY=;
        b=W77tvnWUHfK4RMDDwVFVogCkWBeTeSNth/6WofFhvwBW9Aim58xhN81z4ZIsg0u50O
         rMy7vJBgSkdthsXULPbX1jiD8Nd1NAp0qYFIJ8Qo/WCBedcgIqCzDPfZ1BHdi07LICcF
         NGJM7UEgp4jKmYGvbjP89OFxpraaNTG+Xv1WIe2O+vcwbGu6S94uSM+MBXLiPAUeWOxh
         Q5GMPhJJ35X6+Pn1pDgOuIgQsDbIOn93JDDQ0U4E1FWqnCfzBIe92cyMClK/vupq9IdS
         FWSBW7an/a98JaRbU9QzI3VDfPq0pdl5Hh2jp3VKFcd7fOykvvFXput8n7vtobmdephD
         ch2A==
X-Forwarded-Encrypted: i=1; AJvYcCUvB3cIQWqSF/tz+d7Ax57nufg2hjlW8mNsMhK3iaUZo7TRKhTtBjbFCIe71Gf+qgZdHWPkEtk5RzETAwFz@lists.linux.dev
X-Gm-Message-State: AOJu0YxwKPbgzpFYLvN0r0UREKL/4CeRVYclx3pwhepLoBGFX6/0ipj1
	bSlXHZOpp6Sp742SM3pEFytDepNHcJTaTRMk3OI9R+FxvFFvxWj3cfuf
X-Gm-Gg: ATEYQzw1oMlL0iDR0pPt4+aw5kRgVzHeafi1bgGmF5PvzxPaEXFBUgbkGXDdAkBhyB2
	b1IdOmc+cmFUvZdT6wFaK9LdVFJKQySwYaVPojVk5Y2eNx/DEwnKuFbj91ui9ZHqGG5QTZ0ulLR
	rsCe/+iWdTiYsoPYKs3AcIRYg1yMP7C65hJPGBvxfHAdR+ii/46j1cGMAlV2RaPRlFim7UKTqaj
	X5JY/PSRM1XmCmJNcqdFat9egbq5+MoMJAJPQv0h2KRu+7WXEdofElFMOyRvu+bGQoenIzO6zSI
	NrktKjNP2VwWicgCYfYju5TyfC4zV9RWvGbfhwNjjmGNYyIC6/n957pmOpIIWtFX/gheX9xFMNt
	uo9zzm8VhKVAGPkcONqVcw/loEnlSjON4ArmFVLGggK3SeZ7BeQSfjnMv7LCCjtGhhqi16iYIsT
	V/yy7nj/pxnIKOxL6RLLCfoivHg5we6V3YO7VMCtg=
X-Received: by 2002:a17:90b:3c0d:b0:359:8812:7c00 with SMTP id 98e67ed59e1d1-35bd2d6b769mr201964a91.7.1773950481664;
        Thu, 19 Mar 2026 13:01:21 -0700 (PDT)
Received: from fedora ([2401:4900:a4b7:57e3:7cd6:8a47:3f05:6595])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc62e4506sm3653078a91.6.2026.03.19.13.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 13:01:21 -0700 (PDT)
From: AyushMukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: s9430939@naver.com,
	architanant5@gmail.com,
	andriy.shevchenko@intel.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	AyushMukkanwar <ayushmukkanwar@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Replace msleep with usleep_range
Date: Fri, 20 Mar 2026 01:24:37 +0530
Message-ID: <20260319195437.53068-1-ayushmukkanwar@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The checkpatch.pl script flagged a warning regarding the use of
msleep() for less than 20ms. msleep() relies on jiffies and can
be inaccurate for short durations, leading to inefficient delays.

Replace msleep(10) with usleep_range(10000, 12000) to allow for
timer coalescing. This gives the kernel scheduler a 2ms window
to group wakeups, improving overall system power efficiency
while maintaining the required 10ms minimum delay.

Signed-off-by: AyushMukkanwar <ayushmukkanwar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index abb84f8aecbe..bab48392f296 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -214,7 +214,7 @@ void _rtw_free_evt_priv(struct	evt_priv *pevtpriv)
 {
 	_cancel_workitem_sync(&pevtpriv->c2h_wk);
 	while (pevtpriv->c2h_wk_alive)
-		msleep(10);
+		usleep_range(10000, 12000);
 
 	while (!rtw_cbuf_empty(pevtpriv->c2h_queue)) {
 		void *c2h = rtw_cbuf_pop(pevtpriv->c2h_queue);
-- 
2.53.0

