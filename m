Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFAE27F18F
	for <linux-staging@lists.linux.dev>; Thu,  2 Oct 2025 17:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759425856; cv=none; b=jK9p/kpUaY3svkgCktUfHqKZvCqVCOoZXmmJ9QeYZcMHZp24V7As0RmxqxluHw91uDgjT6UNrwbEsco6VSDrDxeYDzq8QakmIcnYE9XmVZ8SyaecObAID3F+4No1UotyrkNfVS8ArXlgOBISZivBzNGvsCC0vr5NLCNgMJDVtJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759425856; c=relaxed/simple;
	bh=dwZfLXH8d37v/B3FJKGsonwulSm1Vgyq6CvOcjfbAQs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DVfNCrrhwp5Z5tbYnmTmugPzf5FZu8t+zeESaaspkHeiaOeLeINdQK4XZhAH9JmYPBM8R9YW4xCCjAEakeltgA4bQLsCUCTR7TmGAlrFpuPOI2cb9j4f85UYdnfL0PDV/QdPgk8v7JQptwKPQ5uM1aQU/DZIkwSIgJa5edm8wuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R7F6Qn82; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7F6Qn82"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4d7b4b3c06dso8904331cf.1
        for <linux-staging@lists.linux.dev>; Thu, 02 Oct 2025 10:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759425852; x=1760030652; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=313mVP8VdjBWl1khwEYBeX0tVgZSweYr09fkKuFWGbY=;
        b=R7F6Qn8251D5wnvp/K+xKU9kAfnAy6t2S2NXiZKSI1w61f407mEjkO0q0eaxJAZM+D
         BcDAxkY6/jQJXKVhRQg7KLjSXEiSgJKr6wZJD7rwHCt4a80qwATtA2tmmRrzjU88crEe
         O7g3MJ6troBEXapL00F0aHIu8p2hCLCkbH/wDfCWErskXAq5ndvWt7smKbEVolOBHFhM
         b1LzY7psjAyMp6A48q0s/JmCfpj5b+ahZ44kevMq7v+oAjGWc89wkz1r5q7iJfui1s8V
         DuzvjSRAFX6QSM2JPLQPYoW6QEUyI65x4hJjl8UaKESDmBXuGU7r2QE1XoCNHO0jOa8h
         21zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759425852; x=1760030652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=313mVP8VdjBWl1khwEYBeX0tVgZSweYr09fkKuFWGbY=;
        b=jFQXW/oSa5PibbFd6TvjgzJVmdKgO7reKQ3Uh+eZAUOKorC176NYVPOzjDNk3+I9yl
         l+F6euJ9Wd7uzmMADvEHgVS5sTAHBtgb9EHvu15J9hV9/GnkZjAJytCpKGU9gx+T2SOi
         qkdAP67evx68NDCB9247pJWVvEW0zLQxX0s3Ynwaieti5HLSIj6qJTr/74lcHHugZgkg
         eF16rz7fOgwdx3/WHY/chDJIl5QTtLmLBysELXU+Q3TX5iUs/ePBpR/nw0FTIszvK22H
         ICyVFGxnwYz6napnXP7/W3ty27mNwosSgJU/IcJR+GMjkvhY4gSlSMJ4RRt881U4Qw+8
         obEQ==
X-Gm-Message-State: AOJu0YycVjbxv3KPl0vFZGk02eFsmJg47iJwHjMTs/VwX/4Xe+EPRkW6
	xlPNi8fiEGRPgC0WTHaWJNq5ZUm4hGGUOf3ZzL2yYs+0gyscSKUWK8bt
X-Gm-Gg: ASbGncuHsaOyqh8O39cfszOzBoJYc0B7O0zb2aFcvHR+QWJA1J7Y5IbLq6V/plM6sIg
	fGTitipHb+ISJJXzJhvHWPvnRoWWznRvfUYka2aYYW4DXnixiCoBFNi01MYPJxHlVF4R3gwnWvr
	+m+X43PDlh3HBlXzMeqKl6SPzByaC/T8PgLkxW50dlcQjANfQMWUTL0la1iEnWk/dH5uBFKS+Ro
	zkQEIl8O2ey7nKtFDIS2sOyOgRr8deyE9+7gikRA7X3NRLkVFgLlxEyDkTPLkKuHWXWiqVZbyox
	PS+f+RTDXZPkm7696g4UH3chXwTQb/2wW323lX6d3ETPiHNlyG6ob0imUkj0ZSIB6VqqQsckkwY
	0SWAuIz1VicVc1W9ukyqLmKXnWUWZHJoljEKaLsZNc+2eER+ZGgTN6e0cYq9gDIJmEeBMVwjjnu
	CBSJOl8l7DZKRMpa9XwpFJ
X-Google-Smtp-Source: AGHT+IGPfzE0xKnoRrTLWYWeXzJuK1HWfT56pdpm1DttOO+jl3oRV5rhmilRrGeiE9NZtGpToaDZ9Q==
X-Received: by 2002:a05:622a:4017:b0:4cc:1ef6:9c07 with SMTP id d75a77b69052e-4e576b12bacmr1052321cf.60.1759425852312;
        Thu, 02 Oct 2025 10:24:12 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e55cbd3d9fsm24504971cf.32.2025.10.02.10.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 10:24:11 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH v4 13/16] staging: rtl8723bs: fix line ending with '('
Date: Thu,  2 Oct 2025 17:23:01 +0000
Message-Id: <20251002172304.1083601-14-vivek.balachandhar@gmail.com>
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

Adjust formatting to avoid a line ending with an opening parenthesis,
in compliance with kernel coding style.

No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index ac225bb9dc80..c4d203c824f0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1113,8 +1113,7 @@ static void rtw_joinbss_update_network(struct adapter *padapter,
 	 * ptarget_wlan->network.phy_info.signal_strength instead (has scaled)
 	 */
 	padapter->recvpriv.rssi =
-	translate_percentage_to_dbm(
-		ptarget_wlan->network.phy_info.signal_strength);
+	translate_percentage_to_dbm(ptarget_wlan->network.phy_info.signal_strength);
 
 	rtw_set_signal_stat_timer(&padapter->recvpriv);
 
-- 
2.39.5

