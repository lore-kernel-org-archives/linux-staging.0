Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5F82FD1B2
	for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 18:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763403604; cv=none; b=Kn666eyDQDwDOuVotpwcjWCG0yBnRhSY0/1eAjYtwNfAqCbJScqAUXSHaDSi1fh+tOdfDF21njOYXbIiN+URspE6zYPElFm710Y1e6eP5rarLXpfIvpY4KpSdZjs5krgJllxovA7iZ5SkXQHq1vIRn7/LP4ZwH9XaYDDjsjpzHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763403604; c=relaxed/simple;
	bh=Mr/TtRMmuPt2LjYvqLTs2vUsbOZSCnX63uX6riIMyf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CHKsNl1xOSDipIeuTiclQdTCaUiUR5WDHQFwDcjtBZjBvKVGQG6FMWxEiJPFGqdlJX1WVeJy/zbuznOG9flAw+hqxzmV3kmhnunYtICYBHHcWNe/HUz3zZE6QXh/QwlSx72OAj8AzG5XMEpPfcekg+rtCd7/sUd0x4Qx9scwuM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PGzK1qN0; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PGzK1qN0"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2953e415b27so48487375ad.2
        for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 10:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763403601; x=1764008401; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IhOKXGHNf34PNvs7qGjtpjvt2eZ2RAjiiLCFyoTk/VI=;
        b=PGzK1qN0W3M9TLVZDj77XlI9fCEaz35IHyDiJuMWeHjN3UIjIBAdwYCXNzx8e5uBAN
         8gc9Uc5tIkvhfXzmsfOFH4iUAsGcufDvEwEtM3NtZAGrZhqSTrzbt0Y2X5/JIhC2oGmU
         ABghdRlhMd2BNL7xAVIfMSK8QcuvARDlRs6v7eNCSZyMCYpDFj5ktHWsmBb7sYE5McSN
         SXarh6dVQQVJ1ZKvgMbOqi0aHIEjiy6qHP32Ka9JuqYadoQddGmv11pbZQOZ9JZ8P2D+
         9yHfLa9M1bX8g9gOtw8UM9dj5mlVo6LB7s50Co8TnFrilgrJ1HhOUDc280GAdmgvcWGq
         /UCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403601; x=1764008401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IhOKXGHNf34PNvs7qGjtpjvt2eZ2RAjiiLCFyoTk/VI=;
        b=A+2/4PO6PCj+ExxrmdpZi5/BQUrLc88V/n3ZQ1QnBb0n7bk7ic5ZzbwsAUKgUtMmp1
         gN20TLYhvMvJm2iXW5Ue75cLuRwezfOtYXWtG0xzOaTrRjTnoKC9RW9QFDjS9O6/nkPF
         haHPvtRsn4CpBE7hTLHlMq/zKQpojfX1rggPRakshCrO0POrGVTLb9BfXmoRolAcr4Nj
         SHZbzQPMNkx/Cz/e38zCzwaPTynpMYr8ie2PAfZFmG8Kwoqgtkx0tBUmi/CvTuSb820F
         aNWAVBkk3WNZEaaF7IkDbiOGvhSqNqbaN28HaA2spZeZgbwmn5bD3c3UnvHxu+W7UNY3
         QNDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUq8YK2LRQ2PC9Ks6YBltonbCHh2RW70QHWiROSG6vhFc/NUbDy4WtpvskYazUMCqL35gKB8nlHiNol3qF8@lists.linux.dev
X-Gm-Message-State: AOJu0YyUjV0eXWeeQuLXg3ntELRmSaRVL9agytxoxp1j5HSA3Pv+K/Vs
	iYiCnL8q5q6AqIjZ0sPPsl8htP1qOiRt0rYurHT5VJtKHeXi9iuOuLl4xGeoSA==
X-Gm-Gg: ASbGnctXBhGMa6RQ9mJ7A8UYdlRQy5EnkcAMBtSVi+muwJoURFVVE3a0fDJ8y3z0vr3
	zVFOs38rw8Lovc8F7pQHI4X36xlSApFH2+8P+4TCuRPiMufWNX3BISlQn4FVxfO2Lw9/54O2aNu
	GCcpxXLB+9etlIkJJx7rx1H2a3pldkW68IaVbvo2JIU0h0IFmCQMngG9ilPM+mwnVdKZFbDv922
	9ONjNAvZ9QXXFrse34dEeWlDxEIRXtzkg/lve+2ofDqbGdWlSk403HOQ5/B6VdEKHfxxFCkvVQU
	RiAu9LWo8q+UnqtTL1YNgEXrgg0z1KJW63jAmhnEF8e04Z6Bv4HJtBTHWo+NwONg4PZzTMF1vyu
	4HVWGtifJQ1V+/iy9l28WlHf16jEglLcX8SrhQeKy8kWK4E1b7jH6yBYT//2wH4ceHTzoW6Yzle
	xYoJmHOn272Rq37nt90DQuuDPiZE9050yWixnze6gDZcUEUWo=
X-Google-Smtp-Source: AGHT+IEDbiTgEooYG2BI5Ra1BCVVCVJXcqcqw8wIlUiCWyslCqLIu5etKp2KhxPcE57smjMqIj08kw==
X-Received: by 2002:a17:902:f602:b0:298:5736:de9b with SMTP id d9443c01a7336-2986a7668f6mr146137035ad.50.1763403600711;
        Mon, 17 Nov 2025 10:20:00 -0800 (PST)
Received: from ideapad.tail50fddd.ts.net ([139.5.199.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245fa1sm148446705ad.36.2025.11.17.10.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 10:20:00 -0800 (PST)
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: gregkh@linuxfoundation.org
Cc: johan@kernel.org,
	elder@kernel.org,
	linux-staging@lists.linux.dev,
	greybus-dev@lists.linaro.org,
	Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Subject: [PATCH 02/13] staging: greybus: pwm: move activation into pwm apply and remove request()
Date: Mon, 17 Nov 2025 23:48:07 +0530
Message-ID: <20251117181818.118139-3-ayaanmirzabaig85@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
References: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move PWM activation from the legacy request() callback into
the pwm_ops apply() path. Activation is now performed when
the PWM transitions from disabled to enabled (state.enabled = true),
so request() is no longer required. This aligns the driver
with modern PWM core expectations: activation happens when
the channel is actually enabled, and the device free path
still performs deactivation.

Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
---
 drivers/staging/greybus/pwm.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pwm.c
index 1cb7b9089ead..c80f42100e3b 100644
--- a/drivers/staging/greybus/pwm.c
+++ b/drivers/staging/greybus/pwm.c
@@ -174,10 +174,6 @@ static int gb_pwm_disable_operation(struct pwm_chip *chip, u8 which)
 	return ret;
 }
 
-static int gb_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
-{
-	return gb_pwm_activate_operation(chip, pwm->hwpwm);
-};
 
 static void gb_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)
 {
@@ -206,6 +202,7 @@ static int gb_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 			return err;
 	}
 
+	/* Disable if requested */
 	if (!state->enabled) {
 		if (enabled)
 			gb_pwm_disable_operation(chip, pwm->hwpwm);
@@ -228,15 +225,21 @@ static int gb_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	if (err)
 		return err;
 
-	/* enable/disable */
-	if (!enabled)
-		return gb_pwm_enable_operation(chip, pwm->hwpwm);
+	/* Activate and enable on transition from disabled to enabled */
+	if (state->enabled && !enabled) {
+		err = gb_pwm_activate_operation(chip, pwm->hwpwm);
+		if (err)
+			return err;
+
+		/* Activate hardware channel before enabling input */
+		err = gb_pwm_enable_operation(chip, pwm->hwpwm);
+		return err;
+	}
 
 	return 0;
 }
 
 static const struct pwm_ops gb_pwm_ops = {
-	.request = gb_pwm_request,
 	.free = gb_pwm_free,
 	.apply = gb_pwm_apply,
 };
-- 
2.51.0

