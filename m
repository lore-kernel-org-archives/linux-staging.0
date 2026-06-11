Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEBF4A2E0C
	for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 16:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781194962; cv=none; b=NwMB7R2+p5l5K9N3BhezGQh8lnIyCazc1D5soYXrm18FKGH0h5impw1Q9ZYs2l5+r2f0xT5LEVbdZUjYA2WAfY18NNHW78embsAG7NR2EfDu37fqh5Z6cTItePRHTMOheAoxY1UYgcbWYwP8WaIHJLXc6cXSrd1BIonMjxzFj+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781194962; c=relaxed/simple;
	bh=4NBLEoV6e4rsDE+k7fOKno411+mW/x5unpfNcsTXt8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BE5yYsnqMvF1EGruiKk6wvPcQS3BhMWa2x1BT7tgHES+hKKpSy/Gi0bd6kNrbSbP16VOmeUjWuCaiUbxd7Vg9MMP0hIOc1OAkBpi4R9KJNPnd0o74cTgjhCEYklzpF51sroNRa2KNCTHu5HHlUN7H6e1rmyQaxQ6z36/frWbDE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=roUrBbyk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="roUrBbyk"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490be03d47bso74094675e9.0
        for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 09:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781194960; x=1781799760; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RA39hF3q2AsnJtGBSHAn4uCE6JJZVkBD68s6j643rP4=;
        b=roUrBbykzArhHzLvPmMDtvYmJbJqSm8a5KKQ89z13JJDgfasA8ehipWxLO1hFbu9Yk
         qAr3xv+xtK/dM98X2W+PedhUfN5/RMdEtTnXcRhYXG3SRqZ7GaHzfR1qmUJa0B92gUt+
         juvYwo+W437e9ykEGaPIe0NuaM+upPrYnEEzsmrgheNqCbj+e1oymmttMpvMmu3WBXK8
         ZHuxVdVg6ofoK8yrCvRh+A3MSqRiDoN+YSw1Oz9pITtYwuAvCb9YAeo54kdc5gOja0Ef
         4YBKYlwejq8i6Ki2AlltpKiVj8uUNOXlXJWluo2c8gR3JFoViV8jmiBjRoVGQxkZTOn9
         b4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781194960; x=1781799760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RA39hF3q2AsnJtGBSHAn4uCE6JJZVkBD68s6j643rP4=;
        b=rpDJpTJdgEo7ve/T/9CSUmKQSVRh4RK5yXNdTkrRDz21rH2RfmUouGpwT/93uoxBrQ
         /cXjzeEQCoHIiDHXaH+RoSRCpdy2bmzlUPFoIsmoBQdVgxD85LBgarEmHDcA7OqdIU+c
         CXWnAcwUzuPRaItHDAZjxfQM40GhsEpKv1oTfPeckiNTC4D3d0OIfPEnPy7sCJuleiJd
         L/4barqlvYljOSxIwdky6EgK5OEIErnJIeX1d1N9QqJBT9ryBKMk1XzOsLzMfIt8q2ho
         1rCsLvcQDj4CUp6V2/sMz2j0Hf7aCbAZGRkhB35y/flvtATjrxkOfe+X91WgIQL+hu/f
         pu1g==
X-Gm-Message-State: AOJu0Yw2PuetFz7/Oy+AKGJtlyrFKVw/Hv5EgGoQjsBVMNrGsvTUznUQ
	K5pVNofGswVeiyh+OiG9Eh4351Vjy5ZbrG8YtqvAwcBJuWYgEr0/RIW6UnEXor1q
X-Gm-Gg: Acq92OFIy+2BQk8fUph6FoNZgQ24f+lIovY81mxCO20gpSZpkn3jNqyxmIa4zfUKW3M
	MOYLJ9Fg25CkEU3gTRmVC6a2FHBmSJWm0uY8p+29O81FSarv/gT4PMYWybd1oaDxt/G41K6oY97
	/kAou2XppiHM2RjvKXbO89kydkeMh9b++aMwdsjvkYgBTPqFjeAULEdMlyE7RYRD0C8biwVe+Ln
	B+u3chvKH7/8oGbYZe6Ygdb34ESVBQ/KDS0Ou9cA0g5MeSEzSEmzMeb2tgImsTkJXdcdZcr4BYW
	5xFhNv0kgqCTxUaULKRTLFAvNBzmsBdjUPDi5MlGVveMV8GvToiYRF8j6Z6ee52tX0S8gH5ysh2
	/IwoF3mmUpJ92FaDhhKfpIbvJkT/a7/bvWKsirfJm+6+3I7ph1zlAAwt0cYrJSsUWIt4kGG66kD
	GhZq0GvgLZFjUDkw0bmK3jHme5JQ==
X-Received: by 2002:a05:600c:8a1a:10b0:490:bd66:db49 with SMTP id 5b1f17b1804b1-490e55e22e0mr38001815e9.12.1781194960007;
        Thu, 11 Jun 2026 09:22:40 -0700 (PDT)
Received: from home.powerhub ([2a0a:ef40:30:7801:ac27:e02b:2f26:8695])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e46a75c8sm70344585e9.2.2026.06.11.09.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 09:22:39 -0700 (PDT)
From: Quentin Strydom <qstrydom0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	qstrydom0@gmail.com
Subject: [PATCH 6/9] staging: rtl8723bs: hal: fix whitespace in rtl8723b_cmd.c
Date: Thu, 11 Jun 2026 17:21:25 +0100
Message-ID: <20260611162128.57870-6-qstrydom0@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611162128.57870-1-qstrydom0@gmail.com>
References: <20260611162128.57870-1-qstrydom0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove spaces before tabs in comments to match kernel coding style.

Signed-off-by: Quentin Strydom <qstrydom0@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index 12416e499ac3..459af131a9b2 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -79,7 +79,7 @@ s32 FillH2CCmd8723B(struct adapter *padapter, u8 ElementID, u32 CmdLen, u8 *pCmd
 		else {
 			memcpy((u8 *)(&h2c_cmd)+1, pCmdBuffer, 3);
 			memcpy((u8 *)(&h2c_cmd_ex), pCmdBuffer+3, CmdLen-3);
-/* 			*(u8 *)(&h2c_cmd) |= BIT(7); */
+/*			*(u8 *)(&h2c_cmd) |= BIT(7); */
 		}
 
 		*(u8 *)(&h2c_cmd) |= ElementID;
@@ -927,7 +927,7 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
 		DLBcnCount++;
 		do {
 			yield();
-/* 			mdelay(10); */
+/*			mdelay(10); */
 			/*  check rsvd page download OK. */
 			rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, &bcn_valid);
 			poll++;
-- 
2.43.0

