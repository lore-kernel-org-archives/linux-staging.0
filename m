Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCEA34FF71
	for <linux-staging@lists.linux.dev>; Thu, 20 Nov 2025 20:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763670736; cv=none; b=MofOHC8oiG5l5V4SDnTzacnl5Uh+882U1rfcu+/IjKeIrAFn42cTuVVhFR4gDUmq8g+4RV1ISa6b1fNV40K7S4A0wkgGeEHM+/Gy+z5IkGI6U8TmqOamZnwzg+g+Dz5b4ywupujJdv79DhXKosgLT0RE7Pvd7BBciGSv2e6pcAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763670736; c=relaxed/simple;
	bh=myqDzPcnnPM57blNfohRrlo74Q2WsNb5rQgqfW6mXmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CBCMY8lxylTqYy3v07EeeLcudwUl/EQ/DK7Wp80kNgPnbAJFYA1pUd15p95gT1D14Q9xxuB3uYBsuFWLjsb7GInmN1ozF8dlcj6sW8zK1kGiWX5kmcwIVml7/Mx9/AJ2i4399r0yzt44spqLU1FWZvq+5EijlqdpVVGMmPEf4ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JKMDDdKC; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JKMDDdKC"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so1122511b3a.1
        for <linux-staging@lists.linux.dev>; Thu, 20 Nov 2025 12:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763670732; x=1764275532; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9XbWv0o6BI9/riB38gVaaQWNxK2gU/QfOvrSOWy5hZA=;
        b=JKMDDdKCWX+pLN7oEkU2sXNjY/1D6h58864nQc/7J24OjIOLYtt2f5sNfFd2LrzJ/W
         GRGr/Nf2NyrV1gY6i0IP7iEuNEhD8NJvaTb7ahGIGVP/nxzVyKwRJppm7xjEN07rSsYS
         lSpulCSxDro8YEZqstpfJWWf25rEVQUucdU9AuVAvc5y/MboSyDq0BsqaNhKzQgETL6V
         fey7C6qFy/DPVfAim0GDHaMR1GWoIK+qG0LpnzSNQ57aNRaPMRT6TEBP5wDsAtZkEQYp
         caAEo9LYYCg2xIQNuzMICV/qlxYJnDPG6nceUumbLezqNvhB+49ws9whsGSK1rIwIvIi
         EySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763670732; x=1764275532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9XbWv0o6BI9/riB38gVaaQWNxK2gU/QfOvrSOWy5hZA=;
        b=DXT0dj7IcAkPhgecDNGoGTywOVM+wQ6Vkv7H3wiAHlvYxj9ilFaFFWdNrGwSc0HXAd
         tNzTzuLZ6ohSSbqYw9iSjIoT8z7OFuDPtFeTWsHWRt8yQwrP/ulZUtlFEh6v11XfMAd2
         Crl6A58YK6GOqd3qigtGZRSCvZt9GEw44g5Hqwp+qHrv6uGQR5VoVIm+g1BYH8FM23/z
         nhrpGru+iQ+AMFGVcIz1tzgpYXPDsYgzAbSKNkIYRivemLc13mX/FWKOMN7tTbNpizof
         T3oREZUTdo7k4BSrF98kizgSWrtIDgli2UFKMjZ9BP1cJho/2gzoP/pbfhnScmv8UZ2k
         kFPQ==
X-Gm-Message-State: AOJu0YyubG4Nosrrf05OFr171mCgBUQxJpSCadx6JqewohwKrrm6LLJ2
	L0ZnJhfJARqUz+ENj1HAKoS/GtbmuGQvX6jFA0V8KSiJkjNU0q5pn1+d
X-Gm-Gg: ASbGnctLGlDJL5qeqPySR9lUjeh5ffAhKRMtBr0vpqQkijB1AWSmOiC/RuUfhHuHxPv
	OpRLeoe76likHcrBWgeSI/HM6cTqJAtbMcKvZs9o1hv+Lodvp9ZoPLahBS4NFGDzgZKZG6nNjZS
	jlihbXiJ6qNfxg1RbAzu48HMzv+mXTXiLzefG+6yudxrVXeDy+Qu7BtTSNoF7I83+rTlVq0MP1u
	pzerki/LpoP6fDt1BzyNX7J2h01cp57xU4WhoZ4OBess/Sx9KwkiSSwedBeDKqT+R++oOP/caB3
	konJ67z6/DRDedZ/F5sYQalYKilSZ5rK9XvPy7wqWKH0ud9ft9NJSGejNna8E35jkZ4mNKA0Dfe
	HsPnlBr7NV8IxwJkGrGnmHZMII5z0kAQf8FgP8nusC68OuAUq29a8QrThHDeA+TJYJ5LmJW3uzr
	U9VRU5liWD4SbD2CmK0rQC9JMKWGWjO1rrQFB1eL99L+UYWMHSEOBkOeFZE01pqwrbehSjGIvER
	dAOz8qEsBfuorLW5qqGrZHDzF/crZk=
X-Google-Smtp-Source: AGHT+IFMsz28bWUXOFV2r2P1fAgph5ohmc60nKXxE8KG8WSAKzjWXn/lmiHedfsocmiaju1YatUWPg==
X-Received: by 2002:a05:6a00:12c1:b0:7b8:87e1:a648 with SMTP id d2e1a72fcca58-7c3ee1975damr4243309b3a.3.1763670732581;
        Thu, 20 Nov 2025 12:32:12 -0800 (PST)
Received: from main.. (c-76-146-85-33.hsd1.wa.comcast.net. [76.146.85.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f0243b19sm3670623b3a.37.2025.11.20.12.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 12:32:12 -0800 (PST)
From: Artur Stupa <arthur.stupa@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	arthur.stupa@gmail.com
Subject: [PATCH v3 2/2] staging: rtl8723bs: core: delete commented-out code
Date: Thu, 20 Nov 2025 12:30:44 -0800
Message-ID: <20251120203056.15314-2-arthur.stupa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251120203056.15314-1-arthur.stupa@gmail.com>
References: <20251120002948.23153-1-arthur.stupa@gmail.com>
 <20251120203056.15314-1-arthur.stupa@gmail.com>
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

