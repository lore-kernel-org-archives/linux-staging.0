Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A222A33C182
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 17:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783962529; cv=none; b=KyuxZ3MkA53uuJaCqH2sJCqt4ZA1vgp1eT8AaqZaQFQrHX+BWk5Y9tJUofLnQX8gTIrK/xz6DxCbdzfqL9VDp8PE0zyLhXAo5HlA1wmk6rJPo3AMiMiJaX3Ppaaacj4InOUFDpDltYXZ3PYfK2T6pR9Ppv8pWxvgS8AEQmQvCWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783962529; c=relaxed/simple;
	bh=lo4+XCpPDh8c0k0gz8YEx1ohqw/wcd4J6whfyFX7xmU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cZE11J7QLbcZjUuIhL9dof0Gt2UHnHc/J4WkIBoaaNEx5BdV/Fglel5IbDGL2VKN5cXE7zk43PgJAA5YqGrODhvZaQ4u/9PHyokudR027FUwVWTVhFxr8FDHJ5WCyfrwMqgLNXRBANAo21XbsobQTb3ZfDJrSlDR8yJtFgBXuS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PU8hKM4l; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PU8hKM4l"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84a2c90e383so101093b3a.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 10:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783962528; x=1784567328; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qFgEIJe873D6LcL30QNtzeLHCAWHrsjuemBtpi5imkw=;
        b=PU8hKM4lYWMeTVB3dGdfzQNhR8AC32QJAeZyeBCEgqx+98qlfWfmWujcJdWSm5Le/o
         cDiiludBMHvNl/jUUP3lldZuOCBTwFhu22g67NpylKjcKBCOaLW2ocbRWpZoYtr7Vvqb
         lzh71OKDTAlT7N7KjTcWp5jOW7a6GEUHpLrQSLgcz5HM0aPfUUs21mtl7MdhFT+oDNZF
         lcbw1/aCxzVDHPNE2/lfVdv9zDhFg/vY8DbCOqQ2bYVa9HytWirtvKFnluG1vvMafeqc
         saWyYfcU2FsT9cTkSFqbWT9wjjNg6cSi6B8lf9lKrTiIhmZ3DkgkxBGxk0kKJNEuOfeJ
         4Ebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783962528; x=1784567328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qFgEIJe873D6LcL30QNtzeLHCAWHrsjuemBtpi5imkw=;
        b=Dj/9sn+O6awy3eyZyZeKSBNTYpJFeBJPcI4MgsiKTDFX4KkFBTXuWruk8qVUstODR2
         TqHf3b8yfWq/4iVM8wV6cYOp1+yRNMJoF54zDSoT1jvt3MlKb6BrXHYhHoJ0Bg5Qxk5T
         WTgGNITwY15sYp7+RPLday8KYRZhQIUuk3kFGGrRMjM19Hh2+IBzr8SRWLvu38iT+SGj
         1XCfDgDmAgdmPdSGJxmA8buXCaGL3mHj5QJQVJA/Nl1jFhI3qjhBdHdi85nMyHIqNGk4
         K5E1g6ImWnNSihnphRnNufYFG4I44ymoOENgi+flQtxCEB4TKnLB5NScEId9lhAFaiE2
         gb8w==
X-Forwarded-Encrypted: i=1; AHgh+Rr9Lb9WxOlCc78ujJ65jwysfYmAsinab36VsGwF/hpMXkB14WgY0/BzWFkw1qokAv5jDGTKX8mEIcHxD/Tt@lists.linux.dev
X-Gm-Message-State: AOJu0YyRCTIuB764Pp5nbaCFLkNe9i05qxxvFWTv3+7VWQwqQXe6KB68
	uI2Y6rPnLe30e2Lzc8hd0DIgcvVYeB+yTC0HMgdXmiDWRngpcunldwhA2bHrVgR8
X-Gm-Gg: AfdE7clc3niY6dR4PKdhPaZY3h80a0im8+1jqwnRHIYDr/uIpwt/T/YuNTPdJAQkH/L
	U7fMms3/gV5mVYmQdttou4xiI0uNUKvUMoOYbxqCo0Jj1qc1KR1Gb0/XgVzDksurCKacilEVqwk
	zhQcoPBphGpd8xRFyZLDLCFS9nwMwfEv2HjwfVs7E0tYcH50qtxtV3kxqFxmYuOkPlQLpLJhYYJ
	EqBJ0K/oFGZcSiGVyMwtJnmbM9MLXtJt80V/3BT7fZSlgJ/XvBo6ZcV/R4Zz0Pe37cSGK/eKTtG
	30wiRO4gzr1w890HXKLeZQS0WbrdXfcb6Sqo4uPbHYRgu//e6fDnExW53q0H4r5gi0eqV+IfnBD
	GO1vF2cCzyHgPHcsjGgisVDQyYJtNKz1HYk74BNy1eU1Uuf6dKHsNS507BQrAfg3ty58gCEA66p
	u3cfkcpuvslfXCOZi+YPU0nC2MiPz3QVFGmtO9R07/VRb6mpniPv72Vz6SyEBNwrZl97FXnFgH9
	XehNbmilDcqYhGgPl+DpMm/tg9MZovBQbdppyUbxYdSHONkU/iikEpXJkTj557Pbix9
X-Received: by 2002:a05:6a21:6e43:b0:3bf:b7e8:68ab with SMTP id adf61e73a8af0-3c0f08602bbmr16557584637.2.1783962527926;
        Mon, 13 Jul 2026 10:08:47 -0700 (PDT)
Received: from OMEN ([103.184.238.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm123126740c88.14.2026.07.13.10.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 10:08:47 -0700 (PDT)
From: Alfie Varghese <alfievarghese22@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alfie Varghese <alfievarghese22@gmail.com>
Subject: [PATCH] staging: greybus: uart: return tty_alloc_driver() errors
Date: Mon, 13 Jul 2026 22:38:45 +0530
Message-ID: <20260713170845.1518-1-alfievarghese22@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gb_tty_init() maps any tty_alloc_driver() failure to -ENOMEM. This
loses the real errno returned by the driver core and makes failures
harder to diagnose correctly.

Return PTR_ERR(gb_tty_driver) instead so callers receive the actual
failure reason while preserving the existing cleanup path.

Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
---
 drivers/staging/greybus/uart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 7d060b4cd33d..24b4dab069c3 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -951,7 +951,7 @@ static int gb_tty_init(void)
 					 TTY_DRIVER_DYNAMIC_DEV);
 	if (IS_ERR(gb_tty_driver)) {
 		pr_err("Can not allocate tty driver\n");
-		retval = -ENOMEM;
+		retval = PTR_ERR(gb_tty_driver);
 		goto fail_unregister_dev;
 	}
 
-- 
2.54.0.windows.1

