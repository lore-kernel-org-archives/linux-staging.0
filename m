Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DE42773FE
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 10:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768214872; cv=none; b=BkWF6GjlEBH5Uc30XfV1XotMT0s8kMJ3PQblMKH8hyuRBoShWv6r81aYL4evedfENlFcoMVvCLvIp8hOztkur82Z8ONQQgdwrLoRk3Xy5jdzM3OPHUEuxE0hYazZHeSagI2hBgNHf5s37j74ACgBm34Kd/eS1MJ5GO7Nam+NRSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768214872; c=relaxed/simple;
	bh=v2m5kZGHUflH17jjZfDWj+jrwp269qkHpnHgmsS7CNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eRDs1hTpqoVLVV5M/GHxjCSFXndulvtSu6dhzplzKfv22yvzwBlP/cv0b8tGyaQGWSdMpRYXJchF2hkSaJq77IiJzWB+CHglYQNwLltTvGah5Ua1RVgCBAXekL1xRhKD4PiEwxD0TfT0txDyzZZjdVahEeXuz9KFeDs/stgx0zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L/IfbE7v; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/IfbE7v"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-34c565c3673so2507747a91.0
        for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 02:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768214864; x=1768819664; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/cih87YfYy6tvq3Y+kOsrQ5TDCFdc0ZAAgUKbf33hNw=;
        b=L/IfbE7v3inCf66D8svag2E3Cl5ufQplZKg7xjrkwHhlqd2+XSs+olk2itqmoZ7PaP
         7WA6x5Co3s2n5FU3tlW5+K/JDW3iYtAPB6wECfWFlRmkXBiztZsQC1gO4SqplXlDqfe2
         JRPORFoW66vJH0Te6VqQr6zH2UC6aLGqv5M8EiEqtmZBrqenn0ON0OXs45C7zJhTFpsw
         ZYWQnWGVbAOgN891hiVkILVBFhglMunwyJvGr0UZKGfKWulVmuL9dZ2dt3ajYr65aund
         sEPwlRMh+KoEoDUCh2zaOY/mplwV2X3mx2U+4qo6NFTAzdBi7orCTzh2BbDIUPOEd9oN
         +JAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214864; x=1768819664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/cih87YfYy6tvq3Y+kOsrQ5TDCFdc0ZAAgUKbf33hNw=;
        b=WP5PyW1LHzFNoakikkbWLpeiIQN+qzw16BZj6AW+kD2I2KwJS4zE+OgdHusLcJwJlx
         SPogVAMiHp6ttwNj0ueSiXaOr50+Cq3sLC69FfbOB4DnwD7m5kmIBwLs3aj2eKYYeXp0
         QwAphq9TWjEB9aNwEix4CfOzqYCMQaXqwNS36lvrVoTv5qLKFW891J97bgi4SH8QxEmp
         DghjYk0qN/8Ui4fyLIslmar9QRGJn8R8c3oKfdDT2vZcyXEvS+NWqM0nZS27kXnWN7nC
         CjEH1yY5ODxj3S2h090ioZHX1pmLYW9/b7+SwxlNwV53LXz792PCVTvW96cVm4O5f9Q7
         8vXA==
X-Forwarded-Encrypted: i=1; AJvYcCWsidN6QU3o6g1ACIUCaZNEI6kn1ButomE1vwb6D77uV8qNdy8bSGOzCnkOp5WCU474194uzbvUjDGuHKXN@lists.linux.dev
X-Gm-Message-State: AOJu0YylGSxeZXH9gLrQ4FrdY3/REDenHjBcqbxZ33M6Mt187DxzbGLi
	kpYvuRFbkk6Fegi1JQEtMWG+9G5i7c2Bc17L7+oR33cS0vVxiayLDKCo
X-Gm-Gg: AY/fxX4AUhdvLSPznR1sNEAiTuvGJkf2NARv02+J5E5YyRxZ5ysKRNokZrIuH9WA9M7
	/nGgiYllaKgERxJktGRSSJnwADp/rv+JshumTjqvCwLbOlLgqHk9UCftR8T/czs4Dlf0XMec91U
	d0Q6xaWMmQz0S2ptqr8E8jx7ntfRjV0rZIKatPTpim/C4G6O86zj79amF7rBI484MVbG6vN9zdy
	7hqSk5Bf/TCVecDE38QSfwUM0/IPk/+asJbgemgUpU/WfrfJNbmbBVUHxFsCMtV3BLiHyo+/y9E
	2eZSJzrSRwZuMAdPfFlX6jhOqdsfrEUx/diN27Ueh/WqsTdAgnQmVtkNR5jByiW3PEzSyWPXvpc
	56yrigOXLLZXUAEVUGb+cIWd5UrqZ/PCz3Wp+g0HSuL6wl6xCylw7yAuCOUAaHdUR248Y+eh+t5
	3Ua766xVBPRbIGd7auN7Em
X-Google-Smtp-Source: AGHT+IFlYliAVx5A3K96nYAgjQ4p3TUfaHJzHUu+pdqMB2unYncTd95IoTuni4nBfxFnjCdkhrfKmg==
X-Received: by 2002:a17:90b:49:b0:340:8d99:49d4 with SMTP id 98e67ed59e1d1-34f5f831cabmr17885621a91.1.1768214864268;
        Mon, 12 Jan 2026 02:47:44 -0800 (PST)
Received: from UbuntuDevVM.. ([103.171.99.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f6b10a44asm5686116a91.5.2026.01.12.02.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:47:44 -0800 (PST)
From: Nayana Mariyappa <nayana.mariyappa@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Nayana Mariyappa <nayana.mariyappa@gmail.com>
Subject: [PATCH v4 4/4] staging: rtl8723bs: expand multiple assignment into separate statements
Date: Mon, 12 Jan 2026 10:46:54 +0000
Message-ID: <20260112104654.45175-5-nayana.mariyappa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112104654.45175-1-nayana.mariyappa@gmail.com>
References: <20260112104654.45175-1-nayana.mariyappa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split multiple assignments in a single line into separate statements in
osdep_service.c to follow kernel coding style.
No functional change.

Signed-off-by: Nayana Mariyappa <nayana.mariyappa@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index 163129e1d44e..95b1d4e8e0f3 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -226,7 +226,8 @@ struct rtw_cbuf *rtw_cbuf_alloc(u32 size)
 	cbuf = rtw_malloc(struct_size(cbuf, bufs, size));
 
 	if (cbuf) {
-		cbuf->write = cbuf->read = 0;
+		cbuf->write = 0;
+		cbuf->read = 0;
 		cbuf->size = size;
 	}
 
-- 
2.43.0

