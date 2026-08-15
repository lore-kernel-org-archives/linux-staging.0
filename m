Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D5945000
	for <linux-staging@lists.linux.dev>; Sat, 15 Aug 2026 19:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786821055; cv=none; b=JAzGJktU11sHLIzvXnauIhdTRd+E5Kmn+AqhtTqy7GV+VNElzRzc26FX6ol/iCnvjNas/kgPeeGllRVgi7r0fyTP7/XdWWKm6SiRBqLFvatO+m3x8BVpS8qrhU55ITM0RznymCs+AiewYg2+WgCM+fFqF/7ZTHv6F+fXHupubxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786821055; c=relaxed/simple;
	bh=QE32OR0oQXdgtMaLWm4cpyPJcvVdIS2aGpfxMpDhJ3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mGPTXSVBbVpdAD8f9YAin2g4X0rm2rbSi9mg/uPtaUAe/1O7f1Fu+VQ4Nbi8HO4XcuEwL16Y1dESCWAFbeZLLpV2nAaw4hp95OxZ57gnl8tJZYq5ORTjxRV7RUejLevCstSgPi0OM6IJbZz8UD0Ekxt5vRaSoG8bsMSxd/Dy67I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nBCepeXf; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nBCepeXf"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ce98cb8165so19941805ad.1
        for <linux-staging@lists.linux.dev>; Sat, 15 Aug 2026 12:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786821053; x=1787425853; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dHmrTvziEMKVC+8ZKVEtuspT+lYTSpcVmcl9KWItzjw=;
        b=nBCepeXf6/kkppFTXPNFbOiXmnNznIausFXb13SZEsSPJmO2+GW5AJNuhRxDIb4Mpk
         XHtLJ6qvwCUHmOJvH/RGUoMCXPLonA6YDW6DKt5ktiVOjKy3uptsyV/536ek3n+ufbqy
         bCUU5KWyz32vhAbRjm2O9UgG1kfXra2zvSMmRRME/YbLs8lgst7qF1mktsLqVa+dQkOh
         BWHtDbKQZgzgMH3+IF6iUlcsa0QLAisy31fv+6lLSYRe5iKruAp4qNlB/y4nNmIR5IoL
         zmX6/ZQwcyTbHdMqdb6S/eLPL//N1cjWIOyq+VefIvX9nZ8fYPuemcAZ1n6U/PjGJJ4q
         CEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786821053; x=1787425853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dHmrTvziEMKVC+8ZKVEtuspT+lYTSpcVmcl9KWItzjw=;
        b=d1Ji+SWRqlADH7qIByPwms+BGouWYYZB9CeZXN8FwYyJBy33g/RUZdozi8ZUOfkd8g
         MXTVHA1h3gs1A1ovuBArg+mbNPXDmdE+9HIO/FtEtLRa7gQTkb4KVtuMm4coH3T6HANx
         2u/6DwD3ckow9tgyNu1EcmjQlPiYd+CMwhTcD50Cy+IDBbGIJGAc1ah+0GZin2IvB6Yl
         ALye0fguz5RGjNV96g67hOS8WXUJaAW2TxpWe4aZ89Oqrwt0MAlDUhwZvzLvX6kLiog3
         W0bF0EneOEZLlzEkSu2omRpQV5RpHH2ShkBoVh5izbJsAbAVGtac+XMNHKZY7yaPt/9z
         2Rjw==
X-Gm-Message-State: AOJu0Yy8+eAUTYjxR3w/oZE4+gVq5Cl4Gx+BOTX3P+BO4E8/gr+e0bCM
	qRn8xIEOYvqtZodQxBqZZqhsTAGeFikdBgovsgos04yacEWPcoAIhdYN
X-Gm-Gg: AR+sD12l/dVdQ3zU6OtyfczOHZWQpzS41w8AznSZEnTQvN0IYtHeSUM/ZBgAQsRwcP7
	Z34qauENEa5v0VQ1kvYKOltG9jIzCvtdh/kfww/PmW7t4xnn662489oH6mc8Bm6tnTSYoJ+iS54
	GtYYd0zjgoHgZTk8DRctCM5UIhxSQehWzETNarERdCs/vYgaLriqcVKr7hCoQcvBWVwiSENQ/IK
	UfSwbMHICqYHGxvQ5PLwdHw61zxk530mX05g5gOiHdT6lpaTE5oOYe2cjHavPQhbhVQsUSB0qm1
	aMFf3UJDbslsAshKPKU2N4X2+hlNVrhztwhEu6jwKEnHOELLsxazEqQ866S1x+aVB1sjLILCl+k
	13Q1KxZdkHQVrht7c9BHyBgYVHd1lGzPA60V/j6qU0YIB5U6eAL14XEcub8Cl4i1z5BbBX2Bedf
	7DH2xJLrWbidaebZGsoahTEiXEbTMzhdMMW3SXIcNwq60yJaK7dagi+w==
X-Received: by 2002:a17:903:1aa3:b0:2cc:89ce:2f07 with SMTP id d9443c01a7336-2d3afdacd25mr133307965ad.1.1786821052989;
        Sat, 15 Aug 2026 12:10:52 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::6868])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3aeb880a9sm20403305ad.64.2026.08.15.12.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 12:10:51 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ivy Lopez <skunkolee@gmail.com>
Subject: [PATCH] staging: rtl8723bs: cast EEPROM_DEFAULT_DIFF to s8
Date: Sat, 15 Aug 2026 13:10:30 -0600
Message-ID: <20260815191030.24989-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

EEPROM_DEFAULT_DIFF is defined as the bare integer literal 0xFE
(254) but is only ever assigned into s8 (signed char) fields used
to store signed TX power calibration offsets. The implicit
truncation to -2 is intentional. BW20/BW40/CCK/OFDM_Diff fields
elsewhere in the same file already sign-extend 4-bit values into
8-bit signed offsets by hand, so -2 is consistent with that
existing pattern but the untyped macro doesn't communicate this,
and triggers -Wconversion at every one of its 8 use sites in
rtl8723b_hal_init.c.

Cast the macro to s8 at its definition so the sign truncation is
explicit and documented in one place instead of relying on implicit
conversion at each call site.

No functional change.

Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_pg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_pg.h b/drivers/staging/rtl8723bs/include/hal_pg.h
index 7cb9c441fc01..7f1f004ab817 100644
--- a/drivers/staging/rtl8723bs/include/hal_pg.h
+++ b/drivers/staging/rtl8723bs/include/hal_pg.h
@@ -40,7 +40,7 @@
 #define	EEPROM_RF_BT_SETTING_8723B		0xC3
 #define	EEPROM_VERSION_8723B			0xC4
 #define	EEPROM_CustomID_8723B			0xC5
-#define EEPROM_DEFAULT_DIFF			0XFE
+#define EEPROM_DEFAULT_DIFF			((s8)0XFE)
 
 /* RTL8723BS */
 #define	EEPROM_MAC_ADDR_8723BS			0x11A
-- 
2.55.0

