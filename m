Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECA03AE713
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 07:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778486237; cv=none; b=kHH/L8jzfTpQwcqzC5N3a+Ws05onCBjv+sYWHapqNx1FYANn4DgHFu0uCbALmWLmig/6cVtaWBlZiRhobOE9kt8XHnKc7oo/UWlO2X8/rm5OI2HrVh+TsXl0LQArTVo+v6rCkc7aBPhNIkTijUXn6ASKG6xh2TMdu4cUWhOkIgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778486237; c=relaxed/simple;
	bh=Al6dJMwyEGsMrBo1UbpijER8sw0ND4kQ9lwGnsgxY7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D7sD1Zzwqc/BvZMuuTssVBu23qd/K5KNrbTgk5Ghpe9K55/a4Tl4cSbpaxA77LWJuandZlF5OOp5HjCvOXTZxlRoCPGggHe+UbMXduc3PsdSEUCq8rwh41HjzclLDZfwajclRPQreT5TiTdkewOGxzlEff2PVWNQCNId7i9h+W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kbR4dbSL; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kbR4dbSL"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a88db610ccso4591644e87.2
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 00:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778486226; x=1779091026; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6hwfnul5ngVXJa3pN8rT2xRjbwKoWPwUd7/O7doG28=;
        b=kbR4dbSLMUzyCpW9CnEsXk+rK4lUjacKS3z9C7hdmDPEssI/L+hkv50CpsoMDNiXdr
         +7MSBiihH5EbiBsZgFZlukd06rszJQ/xF8eCroJGpE6njkNvgO+igVzwagMX79r43jWg
         6u9JAKeDvtOhEydixhWOArY6IzSZtLtNTXzZkvZJLNaQMiOdOvczEaTVi827KwjD35Z6
         BwBsEfZ3Hv5YdWt/bCFAcq2PEybNNyYAnfvuE4X57WZuZGj0BDQoqKbUjWgbRqCcXJqS
         4u19k5/bNaoLSQj6wdvoAtJ0VPVgEiF4bNloZuMvAABbCvN6MHdFR4IcC1TYkljIddaJ
         MFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778486226; x=1779091026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T6hwfnul5ngVXJa3pN8rT2xRjbwKoWPwUd7/O7doG28=;
        b=cIvCGh1H+ZxcxJbO/7eUy19q4PMxc71CLUiD1wd+2wvrwxu6+EiuAEvIdLlKJlrmMc
         U2hfG2QRGYyzhx8SBTVBGrFAJaD4pbiIhEDiDWoM975tM4WYvH5hdMZXEjuMBnIygWzn
         YUh9bFlza/LBlFlGe5gOclVBETkseSURgDiuicxkdtC3ycEFAXRTv11NP7Z5UnPoph9V
         9aMNWiGvuBJdTj/d8rFxtQ9v2x1l6M6/G6252L68zEnydLALhbq36xfGjzc2qfjHqHAw
         rOaQbXqyqYnUxc2I7k/pN8kLwIzS3sGmnmENXzfiKig15cs9tGUoOiDP62OcDzbj1UwJ
         3F8Q==
X-Gm-Message-State: AOJu0YzLqKdx1HMKFqswJIiKpnf/hy4sjYSG1OGE+PhapbUuTI43gaN7
	HOD0HKMcPcD1CMYgHIPPm4ifSqMf+xx+fY5Qn8zAMpJNEy124D5i5YBh
X-Gm-Gg: Acq92OHPPckQq0E8SxC7aNzCOONPiMhv4MP3DKv1AApU31xT6RKMqPbUe0rX47Vnxo+
	8DN9YEYy4btYK0togUBEzwuuoaQ1hgpsc89i5X0A6cGv+4fGLiOo1fQzGVsxdhw18wJDwc2eB+Q
	Q+WkDrjKjxV2c9CJhezNxcTkyDHpqfpFJ0lTrMPlodNu42AWxMuG95hBeTu87Nm6uBIl8Ia3IsH
	ZCmM7YtLjehQDvf7oVDfZmfAnDMUJTVB/4p9olkPdJnfpgq6WrUDeorOF8BZLOK2MsADXADgOO8
	9g3NYsBTRPOIoiznBRmY2UlIqIvYEkSKSjc4yWb5qgkJZqpXU96DU+lgbouVtay880kotKdhE1U
	XMy+IghkRl3/LTbma7jwSN/LbSTJp32SJ1t9zPSsbmM6mJ881qvqN2M4XB0GPIyv0q66Qd8tK1r
	FctqlcMPdXqWcZ5aieIPLMXsfJ
X-Received: by 2002:a05:6512:3ba4:b0:5a8:63e0:cd92 with SMTP id 2adb3069b0e04-5a8b709be01mr2333062e87.33.1778486225814;
        Mon, 11 May 2026 00:57:05 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d487sm2433861e87.24.2026.05.11.00.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:57:05 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 3/4] staging: rtl8723bs: remove overwriting of current IMR settings
Date: Mon, 11 May 2026 10:55:30 +0300
Message-ID: <20260511075651.11637-4-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511075651.11637-1-nikolayof23@gmail.com>
References: <20260511075651.11637-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code reads a 32-bit value from REG_HSIMR and writes the result back
to the same address. This operation does not change the register's
value.

This code does nothing and simply performs unnecessary SDIO operations.
Furthermore, if rtw_read32() returns an error or returns an
uninitialized value, writing it back will have unknown consequences.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_ops.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index f7f6e273c868..91580f6ba52e 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -592,17 +592,12 @@ void rtw_sdio_enable_interrupt(struct adapter *adapter)
 {
 	struct hal_com_data *haldata;
 	__le32 himr;
-	u32 tmp;
 
 	haldata = GET_HAL_DATA(adapter);
 
 	himr = cpu_to_le32(haldata->sdio_himr);
 	sdio_local_write(adapter, SDIO_REG_HIMR, 4, (u8 *)&himr);
 
-	/*  Update current system IMR settings */
-	tmp = rtw_read32(adapter, REG_HSIMR);
-	rtw_write32(adapter, REG_HSIMR, tmp);
-
 	/*  */
 	/*  <Roger_Notes> There are some C2H CMDs have been sent before system interrupt is enabled, e.g., C2H, CPWM. */
 	/*  So we need to clear all C2H events that FW has notified, otherwise FW won't schedule any commands anymore. */
-- 
2.54.0

