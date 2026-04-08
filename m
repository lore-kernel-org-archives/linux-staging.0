Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4EC378D98
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 13:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775653337; cv=none; b=Mbmm5qA+A3nkllGh4Lew8/UE9qUZqMdZfmDYlR3iuFFXrskHEiHEXzyopXkTutSS2fnBQZS5Q/qRFe7GQeLPTPDuAyUQXAY5y3LI4Y33SiVvDmPtyo4bx00P+p348Sy9jwf3egbW7ZGCpNPFbIQ2ZYZfU8k69gybwkeS6jVoTPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775653337; c=relaxed/simple;
	bh=kOA0eGgBklcPVInZf2ecvb15785xFxDFB69VvU+13Ko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZUwVBMSc00rEN54VHV+dSfcNP89DQyFrZ05OyLXmVJOHSR/4c8UQ+BOZXUO5V1WQQUDPtzHqpjenQ9d2vPpBd70CQzD7bSnwwjMUMB7JvMEgJyjto/pYWXyPD5r9IXXwgtryZmOEkFEQEQZ0pD/ND3onQlq0NVgx8ET73XTvm08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b9gOzybj; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b9gOzybj"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-488a29e6110so43789435e9.3
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 06:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775653334; x=1776258134; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQT8PI6H8AE6deseAtkFnygurvu7a39xLD5O9DVqQ2M=;
        b=b9gOzybjePVLfL2ySY8DT0+sha7KQW1y/S5Xll2+C+vCMDzturvq6o1+NtdHMR6IKV
         b6OkZ2n7jeoHl4VpHZ5cZoMMuUjW30llWzd3awRW0pgQ2mrlD64DW3GxS/wxoZukZxhZ
         UxtKX08sORugwI4sCQCAaPGkWw2KCExvIiwMytrGVB7hQL4KNiNOUkxRiT3BCwCnN10e
         vkM44dCUn6MT1gH35o/6MeI3epBjslGvyzqnUTyzYkleql43VPo9qT2SyUV2CzUvVgA4
         hBMxUA9euZ8XpqVd8rgmpUoESU1i/F74FlwNyrPw90y8g8v7C0QLtzloqLnvjnoOJ6Cv
         uAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775653334; x=1776258134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OQT8PI6H8AE6deseAtkFnygurvu7a39xLD5O9DVqQ2M=;
        b=ArCfTlJ8hJM+/mNE7mVeXdYQy6HludMr7zX8aLh/krKQYU3p12O2rr6T7jUO8JxIzu
         wMlgtbRzYORM1htMZbcbaoRZIQCKQmc8t6JszlR4Shs8wNqiTKMV5NRgUlCiLpjkMpsy
         IDte/vnw70/dvHlpff/hF+lXWx65Ty1uNMxsCfsmeM6TQVeEzptfiLZsV/82yqYIC5hy
         mgL6PIQoi6CC2MBYRGVOBymfgjWX2usbePQtCIMgYcH0W2N8EdNfe2Ei05dEO0jnMVMC
         kNyNI6QFnednkVXIplwKY6LT6uh+SPCXSBytdrryR92GWNhiNq0RyzPEft4htEMYZ4i0
         oKyg==
X-Forwarded-Encrypted: i=1; AJvYcCX+z/eDLNb4latuAK4Nio4Pdedp8xIktrIny8iri36pFevxqw5ePr9BPmD4X9/llY0ReW5AjNTmm66/qrjl@lists.linux.dev
X-Gm-Message-State: AOJu0YwarOSuEhjXrnqWJlS38OORkiSfUQNdQ7Z82/X9tjoUQCgUEc4V
	OTI8ZC0SCp3dWWRf/1FbUABYfbggkXGZ/uj5ER6lTVfcAHfxkY2DOtmg
X-Gm-Gg: AeBDievTbrA+SFcbIbMetULAXHih8j33A0hXIMddRcVU5n70563piGRFJRB/TiQtxkQ
	qtnsELFZOyo995Ra0llf/FqrGyGr5NJDhOIITwMwyprytiEg0ED+Ue416HZAE0rnZkup9L70pc4
	2N2GcG52+wRJFOaaExlx3y514WH1qvZdLjjcYyG2TCGxWNGsvE37PwM94DbKGuYfUvkB5ygPzxY
	zApZs0uADbNfrErguaB1ET9bA2LYTGwYww1ZiC5OkvjnFbCXz5ICJ8KgEW1i1goUiTqO4ChOg6U
	L5Sy69ueGfc1gbVrZ0zbBgVEjLME7FvxCaJHnCvpJguVamOsZxFKh3trRXHkKiKMb7TyOzCIZx2
	WRBj5+ydyil+8YYt+zaWwVHMoLEK3+j1JIHmTDq4JSrfXPIFR96vWErokD89fcFNfXzFpJilkJ6
	wY+yFp2q9ThfwRNmM/uEnrHTevkscgO2zCiKtszR8bVlZIfXipuGU=
X-Received: by 2002:a05:600c:3549:b0:471:700:f281 with SMTP id 5b1f17b1804b1-488997d5e5bmr277491565e9.25.1775653334180;
        Wed, 08 Apr 2026 06:02:14 -0700 (PDT)
Received: from DESKTOP-BTQF5RC.localdomain ([85.110.79.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e952b0bsm623045815e9.12.2026.04.08.06.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 06:02:09 -0700 (PDT)
From: =?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
To: contact.pranavdesai@gmail.com
Cc: b9788213@gmail.com,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	straube.linux@gmail.com
Subject: Re: [PATCH] staging: rtl8723bs: style cleanups in HalPhyRf_8723B.c
Date: Wed,  8 Apr 2026 16:00:27 +0300
Message-ID: <20260408130026.1847-2-b9788213@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408064557.40928-1-contact.pranavdesai@gmail.com>
References: <20260408064557.40928-1-contact.pranavdesai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed,  8 Apr 2026 12:15:57 +0530, PranavDesai-Git wrote:
> This patch cleans up several checkpatch.pl warnings in the
> rtl8723bs driver. It removes unnecessary braces from
> single-statement blocks, fixes space-before-tab formatting,
> and removes commented-out dead code blocks.

Don't do unrelated changes at once.

> Signed-off-by: PranavDesai-Git <contact.pranavdesai@gmail.com>

Use 'Pranav Desai'.

-	/*	enable path A PA in TXIQK mode */
+	/*	enable path A PA in TXIQK mode */

You should remove the tab here.

-	/*	disable path B PA in TXIQK mode */
-/*	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, bRFRegOffsetMask, 0x00020); */
-/*	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x40ec1); */
+	/*	disable path B PA in TXIQK mode */
+/*	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, bRFRegOffsetMask, 0x00020); */
+/*	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x40ec1); */

For comments like this just delete them all.

Make sure you are using staging-next branch.

Thanks,
Bera
