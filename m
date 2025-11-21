Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E35A296BA5
	for <linux-staging@lists.linux.dev>; Fri, 21 Nov 2025 22:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763764918; cv=none; b=HPFH9VKtJoa0VgXJWpFAzf1gdysP92I3ClAYSq8h7dS8jLl4YLM5j0bM1fNl1cSWt8DFhgpmv7qL4fBZLbRnkL9OX0cNm/bjT5rvs8xckRTzETDEVPS2dFXJWOq1ucq9Ab8PwHqxL7ROQd8efS+SesAUWLk+znU3bP7BgMm1Axg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763764918; c=relaxed/simple;
	bh=pcE6mmyFXnMUTZEc4oiU2FswNHsbLHek/ZATWsMSC1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V/tjbKaF2U6IrsDKg7Cp+ile+TNLtrF80b/NdX39XMjUgqSLY68tFqpR/jjZa08X64z7JdwZPoiESNGwVFlVIr35eoAy/I76Wox0Couay02N5wQqydHWwPxDv2j+8sAw3hbJppjmVVgZdGRfP8jECY7UrcSPcIBWRj1Dycy/Zl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mnagcQgq; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mnagcQgq"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7bb3092e4d7so2792481b3a.0
        for <linux-staging@lists.linux.dev>; Fri, 21 Nov 2025 14:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763764911; x=1764369711; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UAvuckC8n2WrIREtrpXYicyoqmQjichIay9iGYaCnI=;
        b=mnagcQgqfmzDyBpR4d1328jUp4QXA6I+AFauzN3SI7sV5LVQ65dSA/hcbvmF3qUOKz
         uMWP4HVmWBcikLvK3PrN/928IKcb9ktmBPyAYIJvq3/JVue5tTh+jrIaR8Scg8qOGaaR
         lPP8uUMU/9w3FOH/po9QNH2gN4O6vmf80iLTYx3dFOpNgWzM2IBzp+C/UeqhfrhDucJk
         MFPfg/1109rJaYOofrHkyV6xd5g3gvhLV5dqAhKbz5I5ogb+rEXuTiezo8iKS2Rqooa5
         ZIexoXPkL27BMDCFW9bJgaZ60RHcGHiocdzc5iRtcUVbUds9hIWNjDE01GXaxQaeJgYI
         pWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763764911; x=1764369711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+UAvuckC8n2WrIREtrpXYicyoqmQjichIay9iGYaCnI=;
        b=P+F80yiBt+mTdUl++gQQHmqWmO8AtJoXEBgOnA50F5rS3mVds61fQOPtiykCHgaCNn
         WxVD6TBjN0ROt27estMXYlWegQzwF6pCUOaZYHzPvGbhIufYMaXe3NdV4R5hf7LiEhOX
         /5nv8IbyRPQwaepNR7iT+7yCLHHuRtx/cGD/i9QSkkCv3PzKD3ewlQqG/SqyVqujPbl0
         RHVjVOQo6KEM93fekrtQDvs/+mqIlj2glyZfUxEESCuRmgj+jnEwN+cvs5FuGz7St6DH
         VtcBrcSIhkDQUNSiMeV8KFuY13oLhvlSNqrB8ZfvXPTDVSij9PV7/kPSmTtYLxjZH9VQ
         YzNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlt+e9SI42ejaXQ0N2teM2vBWN+ky3fb0EdLbtxlozgRRaLmVIuKJ50tzPCOwDMTxt3Afif94r44VkygGd@lists.linux.dev
X-Gm-Message-State: AOJu0YyTj44oIFPoy7CRy6Yzy/z1SyyAe2NELmb9LGDXZUsNna6LtMJd
	X7j6F7BBXS27DXuZugYLYyRP+fcdR6/yLBwJsEhQaLwymxyXXJ+HvNLQ
X-Gm-Gg: ASbGncub/AWfkE/39L7GA3oPwG1RxaLx+FvHSpR9lXv9tflM09rmeJmnQqq71yVu081
	Yb/nWnOTwLFdL7XjgwdrhxsabkZ73O4ZLPWeaAi2unrFrsLTBvh/6POt+rUzMQfc50M1IudS2WQ
	eNzLdOGAxBYVyAn/eY8QhC2/9zPHeHiLPWgujQKRg91VSRn3iTdBVNeww5La9UPkMmuG8DMfanA
	hCcw+QioEmxSyWwosfsQirFpOId4GUzavW/CoNX71ZurAIKbyPCqig8aLqshaSn4/dy+SXI98MO
	WP900a7agqso0sWL3fJGvlx2GGNRMGr6xPh0t5O463ilqmyUxCILXZ3a7L5eQRTSxZQ+O/VqcwM
	S3oGH+O5FnS7k6tT3Xj3gzyKTm1BDlHZ4b4TjT8PyejbrUHwpACSeTJqr6aMzWNy7a0czMzlAT0
	EoIvfngO7KfAf3ZVz3o2BKBlJdfxd4Tjf5VwX3v34v8MDxxweeFFzlswzfbiwqkP5XDzwP73QU2
	U56SWnQHvu6Iqwc7oC6SWre8gm1TCM=
X-Google-Smtp-Source: AGHT+IFe334uREJNQp0lJZuswjt5iXL4+XhZLbfv87eyuZRJrgEWuj35mjh0u8HnWi68P+Ak7F0kNw==
X-Received: by 2002:a05:6a00:2e0f:b0:7ab:3454:6f2b with SMTP id d2e1a72fcca58-7c58e113fc4mr3903701b3a.19.1763764910938;
        Fri, 21 Nov 2025 14:41:50 -0800 (PST)
Received: from main.. (c-76-146-85-33.hsd1.wa.comcast.net. [76.146.85.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed076eb3sm7092813b3a.1.2025.11.21.14.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 14:41:50 -0800 (PST)
From: Artur Stupa <arthur.stupa@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artur Stupa <arthur.stupa@gmail.com>
Subject: [PATCH v4 2/2] staging: rtl8723bs: core: delete commented-out code
Date: Fri, 21 Nov 2025 14:41:35 -0800
Message-ID: <20251121224143.33701-2-arthur.stupa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121224143.33701-1-arthur.stupa@gmail.com>
References: <20251120203056.15314-1-arthur.stupa@gmail.com>
 <20251121224143.33701-1-arthur.stupa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Delete dead commented-out code.

No functional changes.

Signed-off-by: Artur Stupa <arthur.stupa@gmail.com>
---
Changes in v4:
* Documented changes between patch versions.

Changes in v3:
* Deleted dead commented-out code in rtw_sta_mgt.c.
* Moved dead commented-out code deletion here from patch 1/2.
---
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c   | 6 ------
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 9 ---------
 2 files changed, 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index d1f6030799cb..3e80d03c4ec9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -383,12 +383,6 @@ u32 rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta)
 
 	/* release mac id for non-bc/mc station, */
 	rtw_release_macid(pstapriv->padapter, psta);
-
-/*
-	spin_lock_bh(&pstapriv->asoc_list_lock);
-	list_del_init(&psta->asoc_list);
-	spin_unlock_bh(&pstapriv->asoc_list_lock);
-*/
 	spin_lock_bh(&pstapriv->auth_list_lock);
 	if (!list_empty(&psta->auth_list)) {
 		list_del_init(&psta->auth_list);
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index c8909ffe0248..5ffefa50699e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1689,15 +1689,6 @@ void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len)
 	else
 		pmlmeext->bcn_delay_cnt[delay_ms]++;
 		/* pmlmeext->bcn_delay_ratio[delay_ms] = (pmlmeext->bcn_delay_cnt[delay_ms] * 100) /pmlmeext->bcn_cnt; */
-
-/*
-
-	for (i = 0; i<9; i++)
-	{
-			pmlmeext->bcn_delay_cnt[i] , i, pmlmeext->bcn_delay_ratio[i]);
-	}
-*/
-
 	/* dump for  adaptive_early_32k */
 	if (pmlmeext->bcn_cnt > 100 && (pmlmeext->adaptive_tsf_done == true)) {
 		u8 ratio_20_delay, ratio_80_delay;
-- 
2.43.0

