Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF8D360EF0
	for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 08:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781858271; cv=none; b=uz2gP6c5M5qYBPwXZmvTb+pqw+sJisPlY7/GY8VKq4hTN5s5WwXM3za7feqqis+592wFcdL2wo9oaOU09QZkGkKLZ7EKUvbTuUcwx1riSfSEfmxQJKv/9G4obIRELQOFvxN7G+j7XQSyTtJ0/ClJXDi51Xzp6qyDW4WTN4TzPtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781858271; c=relaxed/simple;
	bh=UF0UUi6bX9yG+dL+5LrCbMVCOhhqm15+7e3vf/HlrlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=juWd9UGoLPSW6CE+78Zi+IzD3bRK3pitu0Hn6bev7oXy0mdmIzG1PRqJAWaI6y+i3ZVgntrdnlMlFWGhono3zcZ7SFz/c7d6AV1Q8InG09kzl5tsZvoFxod4vN0Hlg6D8dBkisUyxDDHCqtr0gIv3eicg7wuPmwXTMZMPEZ8Ors=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BbIGYjn/; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BbIGYjn/"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4924593f45dso901985e9.1
        for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 01:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781858268; x=1782463068; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pV1ubaQhlKFZAUPIy/gHdFIU/T6vaGBE5/BfBWRfhdM=;
        b=BbIGYjn/PvjBb0+Qwimp16qCTO7/aNhfEo23zJVzn/cFaMcO9TG0Gn8Eb3YYSQTPqh
         rT2FhNvvc2eWHiR4kHmBAyIb0HDk290V+HHAgpG9lH1BLttcsUqCC+v3wBTPZ5w9604s
         Pg4tE640wbzSIAz/HfZ8LYwny+Hk4ruhWzeOEz6PSfisMgYhJwaoWpALrXlXM+fv9N7U
         owanOavRrhdvppKmAssgF+YBJf3gqs/DoCqm8AjXlD3QqROStj6d0jgDyfrUKIKsJXz8
         P0CHs/InBpEDFUN5UiQj6Qgl0ir1jgiBt7kxjPstAWaNVGPtGxKT52Oimpg3JMJTl2JQ
         ourg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781858268; x=1782463068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pV1ubaQhlKFZAUPIy/gHdFIU/T6vaGBE5/BfBWRfhdM=;
        b=BVTk0mAPL4FRBy99ysVh7ymuAgvwHfenCmdsUxL0aNo4lG7SMG8AWeejUAsATR/IPQ
         upLRDcQU7H7WQTSyD4/0tKMl9AF2EVXJYmVBKVnqRIDqqif6I7/qTKasehiDzsLg5DKZ
         7QICP80A/yeD1noo/w83/gkNlHQxYX13LeaNdesy0LbHpoYL1Bo/flTyUuhaSquZ4vw3
         IdPBV4MufruSPq0mcLU/YJqmXxN+I3QmPWdkb8sEVFqWb95pJ577ee5QtDvpL2OT77Mz
         JvEA5tEBMULBehPyTblZWGPAJ5OHdq04LQwO2J10t1YAZQUlq9CswzQ43uvUKx4ekjDl
         nqHg==
X-Gm-Message-State: AOJu0YzRC3dQJy6RFkeHTpD3jDkST399iDSwcZSL86jZqcmca+W4feYZ
	PjxV2vPVXoMd7KBXEPLhVM3V6SHe5SiDvCSFPQXego44tm5qU8iJEbYn
X-Gm-Gg: AfdE7clu15fNEqt23YIvb653NAoTFM8FZFTLII0calZHV8/AOCsndTomWdYxVNNkSzH
	3o1g4ZcFdn4E1fPE31jqPMM510y3UZFj/S1cT9JQmYMNmCRfX3uRMOZUf3lGbf4xfytQNNeySsb
	3t9xIycipoJAYmhIjTsfssBsTZDwu5SIPuoU5H9MRu1ZnjqrCTgNGxSC/a7rwW7js6hzjBjAEYM
	N6/7d/XMwHmXPXBD6N/YFNurdPx8TTR+DOOcjeufkPzBg3AIh3HDETwNH8eVzXhX5xRVDyIcWK/
	ilOTxmmZQDKHdnvjHcVlVkAsYXUFun/q5sA2CADnTlLsz18C2/hs2DAx7pMYJoqYeO2haEmodTT
	WlPRDxIFoWrpB3dlNzLfSRVg3tDWMm6qYIQ4wyTj5uRmRcUMKBQmPQaYCH1aYP+j+4YEvLX3bxl
	7g79Zo/gayNpLFj+G7xvHMFb+P6J+hctdCRdBFl47dqVtsKQCgNSeHUqik5NbwX9pORxY=
X-Received: by 2002:a05:600c:1da1:b0:492:3c49:88ac with SMTP id 5b1f17b1804b1-4923f15047bmr55237795e9.10.1781858268437;
        Fri, 19 Jun 2026 01:37:48 -0700 (PDT)
Received: from fedora ([196.112.134.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650c115fd8sm6062477f8f.35.2026.06.19.01.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 01:37:48 -0700 (PDT)
From: Jad Keskes <inasj268@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jad Keskes <inasj268@gmail.com>
Subject: [PATCH 2/3] staging: rtl8723bs: remove unused AMPDU burst mode values
Date: Fri, 19 Jun 2026 09:37:35 +0100
Message-ID: <20260619083736.577096-2-inasj268@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260619083736.577096-1-inasj268@gmail.com>
References: <20260619083736.577096-1-inasj268@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove enum values from rt_ampdu_burst that correspond to chips not
supported by this driver:

  - RT_AMPDU_BURST_92D
  - RT_AMPDU_BURST_88E
  - RT_AMPDU_BURST_8812_4/8/12/15

These are leftovers from the original Realtek multi-chip codebase.
Only RT_AMPDU_BURST_NONE and RT_AMPDU_BURST_8723B are kept.

While here, remove the stale comment referencing 92C.

Signed-off-by: Jad Keskes <inasj268@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_data.h | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index 3a93ac312ded..6389e616c951 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -37,13 +37,7 @@ enum rt_regulator_mode {
 
 enum rt_ampdu_burst {
 	RT_AMPDU_BURST_NONE	= 0,
-	RT_AMPDU_BURST_92D	= 1,
-	RT_AMPDU_BURST_88E	= 2,
-	RT_AMPDU_BURST_8812_4	= 3,
-	RT_AMPDU_BURST_8812_8	= 4,
-	RT_AMPDU_BURST_8812_12	= 5,
-	RT_AMPDU_BURST_8812_15	= 6,
-	RT_AMPDU_BURST_8723B	= 7,
+	RT_AMPDU_BURST_8723B	= 1,
 };
 
 #define CHANNEL_MAX_NUMBER		(14)	/*  14 is the max channel number */
@@ -362,7 +356,7 @@ struct hal_com_data {
 	u8 RegIQKFWOffload;
 	struct submit_ctx	iqk_sctx;
 
-	enum rt_ampdu_burst	AMPDUBurstMode; /* 92C maybe not use, but for compile successfully */
+	enum rt_ampdu_burst	AMPDUBurstMode;
 
 	u32 		sdio_himr;
 	u32 		sdio_hisr;
-- 
2.54.0

