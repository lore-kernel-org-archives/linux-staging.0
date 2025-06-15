Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F708EEB1
	for <linux-staging@lists.linux.dev>; Sun, 15 Jun 2025 12:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749991119; cv=none; b=Ww5ja6zcQjWxwAJJgRTIBKE1jgsFF59dKpnGSeHAwJ+KC/n7TLscnxX01nlT7zYEEBbQNVfRR1Uaij57EGSqbZaxaJ+7mD/aQEHgC1s+HgCeOVkQAKrAxeJ2NaMHJdQMchVALHijyp8HK5JlCAMbCi9JeWZtwnQ7jUwM4Ex6BgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749991119; c=relaxed/simple;
	bh=zCpM8u32JjhOs6PMJ9xZWAk2We8vLNbjqa3BjVGQbNg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ECRGvbR/OdUnnAhIuwkmd3m62DPHReJiW2AoJyJP2ajg5LxD72QQhDKnTHxKm3IhJfHpNgyOdstz/8d7PuYKqcPC4N27wxcVW8jxk09JhiPE4rg7La7pLMZPeAY/nerHNCxY6LYixXaNBC1Tkk5PwuHVco2QQdorwVvywKLBq5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IQiwVnba; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQiwVnba"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-607c2b96b29so7264967a12.1
        for <linux-staging@lists.linux.dev>; Sun, 15 Jun 2025 05:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749991116; x=1750595916; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A1lyYH5dgz4O9nxSSDkMzO4nLPBm8AKyF96f85wOh8w=;
        b=IQiwVnbazypvutAK7so9u74TQEynVsN/KNGKYEcNyj+LgaynaQO/ITTJe+GPVv1D6M
         Zmu8sjV/XoDmgp4XQgQKxOaA4iQKFRzE2QVL4/VhwqeJxdQWS76APq3+VjCbOCLG4maJ
         SSXEaERkwt10OzXs4Ga/BQtoGjIMjrYcGV3tCClvHIpqLpAWhyZCV0Fetybkhy+VapSr
         8s3jRXe9ZEGDMHDsXnvfwEHt81JY6xLFtmwCJlM4Krjf62sUj6EMImPxtx2cTknrxZJN
         FDMoHwBn+iF7QLWH4ls866Yi5PJwBsRtyGrH633acEkMhjv7SZNkhtP1K0j4gYlLyJAS
         LRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749991116; x=1750595916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A1lyYH5dgz4O9nxSSDkMzO4nLPBm8AKyF96f85wOh8w=;
        b=Pomg2/ABHATJfmlfPy7s1Sv+/RI3v8xIMA2aplz4LwvFuxXXUsUINUNoGYQzL7oqSe
         QvzvY/1ojOm2F1H5nvTRxAaMF0fa5HEW9wTiZdR8VvWA1h5Tw5Nty9OnCvaZmpePUJIn
         S5aoPeqA1kndW80o0buqV40OS0R29EZXv4nwuVU7GhFoXe8uB5HFARG84QOq5aXZO5Tu
         1KosJCdxMooNKTm7pcfmPQJaABjeEnlql2Bcdu3yaBZHZxa03BpQEdwgPHHK58311n4Y
         NZXKi/9TGw5EUdtXLY1Z5sZXcwqB/Uf/WmzNXcNZv+7R2nn5kQv0/reESQxttWoCCuJO
         st2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUkhUSucqJHqVx4dT4NUYUzQZlLwvMn4h0GrdUgA5zpEIvBPNcpxj5NHqurVqE/YHaEfjyuuOutqLJ9sVm5@lists.linux.dev
X-Gm-Message-State: AOJu0YzW+yjnw3dmBPYdTiKqmBo6bGmgAfDM1g34OEV2tk+07K1ossJR
	fDYtwgAc5ci1uuJIhwpdtR4rfA9pqYngya3W+8DC1ZEX0+BKy0BGoNcj
X-Gm-Gg: ASbGnctrq4JqhZ8IG8PfnYYY1FTN6X42gt8LLsxOW10geNI5BM3/kXFbdA0vdVZdPa5
	b5OueXBawqMTdQ6RbBO5qKJv8iSTQCIbw7IChulRNe8v5Wsimyl/U5h0o29c4SLMhR/QkFiW7Xr
	Usc0x9LtyGwRvhH2zQGBr3FtoAsN53DvIVdJzrK5Xn1SXObDwUEMsPido1vCRgvQgFAYE10Kl3d
	e42uvEY/PFHwNJKgbdNQxZUxgDuRlljllGekOhVSlQjKLTP3kzVmxqFIOMN4EnqZ0Etemzjd08/
	zT623lmsBX9qEC8+Fw8VgFkIB8eKiE8AhUkyWOHwlV5DhoRxG6zv9C+1LQJWBWIcrIc6ztzEUq0
	uplE=
X-Google-Smtp-Source: AGHT+IGWiIs6KS4FG0Jk7Jef925QLqUG8UW94EXbeHSg0NO748ouelzY1GlkJxSwF5z99yEJnTzHxw==
X-Received: by 2002:a05:6402:d0b:b0:608:a7a0:48 with SMTP id 4fb4d7f45d1cf-608d097b3d4mr5018070a12.28.1749991115480;
        Sun, 15 Jun 2025 05:38:35 -0700 (PDT)
Received: from localhost.localdomain ([95.90.184.233])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec892e523sm479239466b.146.2025.06.15.05.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 05:38:35 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove return from void function
Date: Sun, 15 Jun 2025 14:37:58 +0200
Message-ID: <20250615123758.41869-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove exit label and return statement from a void function.
After the exit label no cleanup is done, so it is safe to remove it
and return early in the only place where the label is used.
This simplifies the code and clears a checkpatch warning.

WARNING: void function return statements are not generally useful

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 0248dff8f2aa..3cbfc305ede3 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -1112,7 +1112,7 @@ void rtw_suspend_common(struct adapter *padapter)
 
 	if ((!padapter->bup) || (padapter->bDriverStopped) || (padapter->bSurpriseRemoved)) {
 		pdbgpriv->dbg_suspend_error_cnt++;
-		goto exit;
+		return;
 	}
 	rtw_ps_deny(padapter, PS_DENY_SUSPEND);
 
@@ -1134,10 +1134,6 @@ void rtw_suspend_common(struct adapter *padapter)
 
 	netdev_dbg(padapter->pnetdev, "rtw suspend success in %d ms\n",
 		   jiffies_to_msecs(jiffies - start_time));
-
-exit:
-
-	return;
 }
 
 static int rtw_resume_process_normal(struct adapter *padapter)
-- 
2.49.0

