Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8CB39988A
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 12:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778590727; cv=none; b=aGycKIW2XZmS98F+j7VLqrdIIYaVGD6xoXKuXMXBHJHaTzsFM1vQIXtJC02TPRSG6PYcKo7376ifLZFJ04NMXuwBkdMQc56+0mMKwkuGPlDeGxxIGFsCd19pvTnGH1Fv4jeVfS22u2YNnAm0BgCq/Mg7W4oqt8Q2b4fTPRtHeJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778590727; c=relaxed/simple;
	bh=GmUBRhlkc0nTjINXRNOjC6n0V/AtJ50IbcQoATDtEU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j0ggsWkbRPMp/krnenZYQJMvJzdrfSjlSNWGHGehnH+gGnKsUx31sp0LiobxoL73uvtOk/hAOTrO1W6TS25rPpomfiRr1Em3tnhqeRaNObim4k3LxbZCRz8VN7O8VX/xjGR1F/fN5S3HbzI7T9rsYj6eOgusrqXrEFMbpKFT3Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LvUd5Cv9; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LvUd5Cv9"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39389398838so46951161fa.3
        for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 05:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778590724; x=1779195524; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKwtIoQVbAvqhBVywGFeIkXyGCfSay1k5IguqW/RS6Y=;
        b=LvUd5Cv9JP9Q51dpPpQ9zS0QACIEa60o97iERB/FEcmFjBDKumAQP68zLoM428p9jr
         qXmuNNB41FOZmg99ihsNllHGuY80kryOh5eXipLNCuAgyzcjOEk3YkXmjHtsthX2TRUt
         cg2eowDUvskg0Fyi//M5+vMJrqO6Y2VB/dSYVygpHFWBvXh2iw347LNVzqhJz/Qa6UzQ
         95rOlXgImOQoZsO6dNCXngOmaBi4XTX1cUb9qyxE11XgTIVXDavRRJbV2aGpuo6z29b5
         BQR6AkEqiVRNDJZuU9MAVQdqo9NS3R/ZO0cfBoEAdLv9e6i6j5mQV5mbs/uSCcxGxUti
         vxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778590724; x=1779195524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qKwtIoQVbAvqhBVywGFeIkXyGCfSay1k5IguqW/RS6Y=;
        b=hUvRAcJLwRFISzzPmnKtxPPPMWQcNUjqZbmQddmRxY3JbJemHnB1CEbvw0O79vttMA
         1AYwmQru3VlfDUHqizhqO83ltvuVtAl4YmLsIJEariAYylQpLqowBt2D93SF4sn2z0pV
         6MB7oTmWYttzRe5VSwnC1vEWX6/UOnaxXQtJ7tVN3XUemPYxfoJOui+olxgciHbv7Jrx
         gO2zMJ3xKbv0kIHbJOoARoB1JqNKGL2zpjDvO75sF8vQe0V/oZzS+yHnV16FRxNhICus
         wNy4cf74VvHAvw7721Stv9fvt1fzu6oXytIO1rju7rXlorg/CRFe3FfbdGf91bPCmX71
         ry0Q==
X-Forwarded-Encrypted: i=1; AFNElJ8g5qNBq9XkFws9X5UcwvAxnKzvgkWD4hXrGCCsbsg8UqyRztq4RBV7RaWz+bCOod2RpNWBikJI9jtBNTwX@lists.linux.dev
X-Gm-Message-State: AOJu0YzVX1Xl1Oj+bwMbrKNxJwZWkwowljPXaDK3nkPH2N1+4H2vuimp
	6cuS8x9mEe8nAt3OTHcBMwu5DZwrIYTXrGeklDIbuvrw/ih1SMZnV79nI6/NxQ==
X-Gm-Gg: Acq92OGen7H+oBKuR+Fl1MhToRuveDjrof+TztO0lPGAp3pRpkpRv+HoaOkdRXqtOXO
	SEer07qwKaIHOIB6UCoG54FmvTMJrghRV/T02GbrRCs7ENaqBJhkAGd9r6RH5BVE9MVwUJ9d6PJ
	iu5XcV/KVGHOUKMR2rcSiM2IdMbsEhHr9NkPd1Ab+T4Ig43OTlFHIzGObu9OUWewPSDhH+BBMSY
	/kHU5uYzjGC/aHsNUxcSb4hYS9+FvFNjZCPi5kwvMaM4B/GGl7AjtR33OVVfuV0V8i2KUfy4G9m
	cN9muN0eSZqvKkuICYr7PjA8Uu6fZioRqV24vumL6kJUl7bjvCJ9PZ9QHZPp5UFG6eQa64XFK/U
	IevdlcYNz0tozPgINivIt3uL0/Lh1s6L/GiQRfJ9fhT5aScHycE0Xn34cGU+qUNfZRd5Jvl6Iqp
	S3iSyQxM2XZvl2voxdpFFELsfj
X-Received: by 2002:a2e:bc82:0:b0:393:e571:276c with SMTP id 38308e7fff4ca-393e5712b6dmr90131861fa.5.1778590723868;
        Tue, 12 May 2026 05:58:43 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f6131c08sm34949831fa.30.2026.05.12.05.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 05:58:43 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v2 3/4] staging: rtl8723bs: remove overwriting of current IMR settings
Date: Tue, 12 May 2026 15:55:33 +0300
Message-ID: <20260512125703.6878-4-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260512125703.6878-1-nikolayof23@gmail.com>
References: <20260512125703.6878-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Originally, this code use to
	Step 1: Read a value from register
	Step 2: Add some bits to the value
	Step 3: Write the result back to the same register

The problem was that the bits in Step 2 were always zero and didn't
change the value, so I have removed that code. Now this function
just reads a value and writes the same value back. It is unnecessary
and can be removed.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---

Changes in v2:
	- Make the commit message clearer, as suggested by Dan Carpenter

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

