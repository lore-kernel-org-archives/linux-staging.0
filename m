Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C077A2D97B4
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 03:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770692853; cv=none; b=WepKunc9uIGhRrjvfN3gWwv11lpaGa7+UHhhSJVZN7ztAFycsgVRV0l1NOMWvTYIBZ11agIkrujjit5TcAlNIKWZIpKsBTa0W8E6xKAgV+zigLfGQPCyXiYxDrAYBJ2VjNN/JoF6+2xVu1INvNoMhNo4bLpN80dsaCi2LdZ7o2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770692853; c=relaxed/simple;
	bh=6AR1PTp0t3xQtvOavM3d3Vj5lyoufUhRecKBjXETc4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UTAezTQgZCcm7JTzd0B/S7217LDTh7PSzEy0iMQCrZASQlMyrNsmet7/OMDFpgtenj+KB5XkVgs5kjj0IiO8ETvWWwbc9pa7yckohXQj4I6uaNcflh9BYzEOfHLitrFn318rENVlWiwvYRxyLzefO4A2eP4oIYY+gI6cU42tIpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f/+IqbuB; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/+IqbuB"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2a79998d35aso37204045ad.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 19:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770692851; x=1771297651; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4jDyyX1DrZiAZNPGF5erj+3gAfvstEQrpExy5Nzi+oY=;
        b=f/+IqbuBIEEkoyTYsh1bbNKicLhISJqzP9PXJLYvaJcya+kXJmXUe1AnCewTbAcMDK
         6OaJTa581b9bhOx/bZwezv90/KzUV0UUPrWVmm+JLWaMHjlIqoNuZV/g39oXK7EdWKNn
         a5MbFQnp1rjM0UGFV+mGovmjKcLSlkbyZI4RdnCJ1XP22GnVkpUUJYmj2uhfKJ5gmqeR
         SfHpC7X0W7/ZowJb14Kek/iHjHa/gSleXt1xfCxV7rFgKRrPl7O8dDqz3mmEcdpPdJF7
         jK7cDm8ps8kXQFsC/yPMmHia9mJpWBfC9irIq1EhuOftRAfDCyGBvNAa/p/JH0mo2/in
         O5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770692851; x=1771297651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4jDyyX1DrZiAZNPGF5erj+3gAfvstEQrpExy5Nzi+oY=;
        b=MVEL2uBSAm3ArOXJRl8WxbKRjMEUZv553BmoIvGJX2nAW9mWqU+VY9vG3q/f8JI1c0
         CHDOFbidL8uV4piYphlXsJQYC8FrWxl9eG2ngZsrI7QJqUNyYFuoJpRWVVFJyB8hF2uM
         /w5SrdxKA3BFmWErCL81RGLXeqH8s1X7DyXJax18V/X19k1ucqt4Doy5ZQwj4u2aLcX6
         FMV7Qbaa217ppCf9zqNaGYMPD+ChiM6z2uaBT7v7tKxCArxgBqPtEosroyw+qOgvxyse
         wDwoUFDlkAmp/DfoIHqNt/oiihyNOd7hsuzWfqKpSkXEwmVhfdqkVbuhqqi9tCvo1VSG
         sgpw==
X-Gm-Message-State: AOJu0Yxy39TkKHKObcQCfdBPQg/vpN5rIqCkd6Wqw7wO+HhZ43oO5cxz
	Rwd1g+GEKvMGtTkiKcpZSVfwWctFahRn7Es6Hump/I7aAX5IZgA/empspJoMl4eA
X-Gm-Gg: AZuq6aJfrZlsOfwTDr955P4eq14F2rJHgsC98aqSeBq9xNmY198tlomEoPa4ddX75rY
	ujwaVddIg6rb+yKTTJ1npAW5ZiLgSumqpRNrFAh7wfMu30qXXo04JhFLaPnnESgH98mVd32mM1z
	ShD2ULeIxCzzjQb2hsBAkCuG+G6AOWn+VGXpctARxGWkvy0mZEwr6+XhZ7xULwHDKCTy8BARfq/
	MTwCi+ByOKNG11bJI7bqjWJMxCP3M7BFEpBVX63KkRq403WiYPYQwg8GCaUPonecuhGXUgxCtre
	nW5vZ7tDrkpuIIa4/qQnGsfClwbCJDuTUWgAdoR/xgt03J93R+0VE2U4/GwGsEtKR5JcFp+Fuvi
	Xyncrq/mCoJH1QfG5TBkM3ygF5ClNNKUl+eM1fVCT3TegdWBB4Rg9pM/YiOMOJEiNVMDqZt2TeR
	Q5eH9k+YOibdmHxUB9J1dRudB0Iq8JSA==
X-Received: by 2002:a17:902:e748:b0:2aa:f5b4:9a3d with SMTP id d9443c01a7336-2aaf5b49d43mr48547115ad.58.1770692850971;
        Mon, 09 Feb 2026 19:07:30 -0800 (PST)
Received: from Horstaufmental ([1.47.25.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c809desm116248265ad.30.2026.02.09.19.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 19:07:30 -0800 (PST)
From: Siwanan Bungtong <horstaufmental@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Siwanan Bungtong <horstaufmental@gmail.com>
Subject: [PATCH v2 6/7] staging: rtl8723bs: remove unnecessary void * casts in rtl8723b_hal_init.c
Date: Tue, 10 Feb 2026 10:06:06 +0700
Message-ID: <20260210030607.1430567-7-horstaufmental@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260210030607.1430567-1-horstaufmental@gmail.com>
References: <20260210030607.1430567-1-horstaufmental@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant (void *) casts when calling memcpy/memset and
other helpers. These casts are unnecessary since C implicitly
converts to void * and they only add noise.

No functional change.

Signed-off-by: Siwanan Bungtong <horstaufmental@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 57c83f332e74..7955f1ff209c 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1187,12 +1187,12 @@ void Hal_InitPGData(struct adapter *padapter, u8 *PROMContent)
 		if (!pEEPROM->EepromOrEfuse) {
 			/*  Read EFUSE real map to shadow. */
 			EFUSE_ShadowMapUpdate(padapter, EFUSE_WIFI);
-			memcpy((void *)PROMContent, (void *)pEEPROM->efuse_eeprom_data, HWSET_MAX_SIZE_8723B);
+			memcpy(PROMContent, pEEPROM->efuse_eeprom_data, HWSET_MAX_SIZE_8723B);
 		}
 	} else {/* autoload fail */
 		if (!pEEPROM->EepromOrEfuse)
 			EFUSE_ShadowMapUpdate(padapter, EFUSE_WIFI);
-		memcpy((void *)PROMContent, (void *)pEEPROM->efuse_eeprom_data, HWSET_MAX_SIZE_8723B);
+		memcpy(PROMContent, pEEPROM->efuse_eeprom_data, HWSET_MAX_SIZE_8723B);
 	}
 }
 
-- 
2.52.0

