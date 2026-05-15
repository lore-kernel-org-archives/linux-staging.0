Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F13B1B808
	for <linux-staging@lists.linux.dev>; Fri, 15 May 2026 01:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778808842; cv=none; b=JsvV5scraEokNwM64D3M7m92amlpTWiQxqbH/2lCNoJYbejIu669HvWyVUZs4PIH/VwdY5llIhaAIg+PJYQ4krH+GjO7kbVBXxOdx4NnWVQX/3gPK8Wp6Yj6TzXhC7bx9qoX+YOiWHp2SeY71uxLcBA0RDW1lspbii7eHBgbgb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778808842; c=relaxed/simple;
	bh=glthZY+TeF3WuDE6JLbfWI0WRcyhTMVu3WnPkFcL84Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tfIO9vvmHi7EH57H/olwzga5Q9J3MGHE3qWdoxbdw2NUO5f4mj6hsrZY9IbNziFO25pJvEBLnJy7IW445uXz5GQhoSSL0qA7hRiNZPzv+Ax50cJV+iuLKZZWHwUbZH1lkfhlC0R9/98rLdvTCEOS50uios1ssrAcpx9OEKGBxSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gNSGckf8; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gNSGckf8"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2baca4df358so52370545ad.2
        for <linux-staging@lists.linux.dev>; Thu, 14 May 2026 18:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778808840; x=1779413640; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WvQX8UThyFEgL4GFs7G4uznBl9OAkQJ/lHz8YrXfXY0=;
        b=gNSGckf86oF7/ssyKtYtpi6iY3Hw9YP70fobXtkqKG896SsrIlG6nE42rjIqC8EoCw
         Tzo8Pxy1lAEtiKnQVnG4K9ITX/+WtNHID6rg1cwwmSbyYMcAEnVV8BA7jyQ/55nXjXif
         b8D3Ky6UUVtcI6sv8AEHDP7WKItyZZKpTrhIV6vmERjWtGBu5jXb2uEbDmTzhH9xWVUm
         Kn7tDDawZqWdaNNbWoJHboxymSsHbe0q00kcchmpcqFlC95oBl3tyWp58HruMXIBfbMm
         E0/mPvHYayDmOvppdJCebkSfNcGbuMPEwmMRYrRBI87vK004xWgNrP1ITdiMUDXnj3cf
         tpmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778808840; x=1779413640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvQX8UThyFEgL4GFs7G4uznBl9OAkQJ/lHz8YrXfXY0=;
        b=sQvwoJxnNp0By9dBbfMDwvsxdmlGlXrI9rTtDBrGDpiTfiexgvc1OEoCFegpWU+B5n
         gXu72sfN5Lq4q2E9OfQ/TAM5YPQyydrt1jDEg85nLvkPFxMzknMZ4U47DJDGVQT8ohUx
         WkUyvLmCQJ9J2MH/fQfjcb/k5HolBINsw6QPXkhPaeH9P7Y+TX7Z+5/TtWLFxQZzucys
         Q4X4pD9geP4wmMFUEYZ4/+MxwRZVrDCcXwhKthns4QBbe38/f3PuaRhIxovtakZ5Az5o
         8T7mmRfTGOvfcJxwYp6agIPDc4WdcKjrj4gWDCUWHqihe7djyJrcYdfH6JZCuSt0kdWO
         Pgtg==
X-Gm-Message-State: AOJu0YxID9pX62772sUwE1k25nep2ZAuq24ryFDsMr2O4XKNZilJh4yv
	PBSe+a83cM+OT3vtENPjO1JIjjnI9UbICGPOHHEBsXsbASR0doMRrbKAR4P0uRixll0=
X-Gm-Gg: Acq92OHpyapqSG/CYZXurf8x1rTzCIdmBapZIrtXt3N9ckolYMvViy0/cVAwBqaVSnv
	XiUn+8jzH/JvUGziFsFjmdguAPQJSNIAJQYeKfGDkfJZ+VE8Vx5NsCZ3KNKORK8LT8Hk7jiYiLx
	ZPuf0oRfS4JoWtoqQMnpPdHVVo96PN3ONo+n5Uh35vocwDskq1lsolQQvBRqdAvSZGeNNCn+6Dz
	83eNbhiQmbjo1kDw/6SHe0XVKGSPlTrcxx34xkmDM1iVQdusOrTnr8eTWpPjKiwnkOgSXtMYV5B
	ZiB+lIuVCf4W4/8X8PbgPRYwehzUcnKraOptnWTonofu4ZDxErxjeY1fx7fq7I3tyzL8wJUvigg
	yh9ALJIyZ2YUJu/YMWVRFS8DSTnCsPjcL6g0SKxfw2KlxImee0VhKLcIHjZKvG1n+PisXzE3kDf
	VmpPGCPIcXsjnZgAF4YztgrNj4KwvhHBt+rBv9PNXYy48Kg2EHYipttdGqz8IGG/rPKkkiv+21C
	w==
X-Received: by 2002:a17:903:2a8f:b0:2b2:57f3:8d07 with SMTP id d9443c01a7336-2bd7e8ae696mr19490325ad.7.1778808840085;
        Thu, 14 May 2026 18:34:00 -0700 (PDT)
Received: from moksh-Nitro-ANV15-51.. ([36.255.89.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd7e8e5904sm10395355ad.64.2026.05.14.18.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 18:33:59 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH 1/4] staging: rtl8723bs: reformat rtw_efuse_read_1_byte() signature
Date: Fri, 15 May 2026 01:33:51 +0000
Message-Id: <20260515013353.61614-1-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reformat multi-line function signature to a single line to fix
line length and coding style warnings from checkpatch.pl.

Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 803a608b74fa..987d05816c5c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -41,10 +41,7 @@ rtw_efuse_calculate_word_counts(u8 word_en)
  * 09/23/2008	MHC		Copy from WMAC.
  *
  */
-u8
-rtw_efuse_read_1_byte(
-struct adapter *Adapter,
-u16		Address)
+u8 rtw_efuse_read_1_byte(struct adapter *Adapter, u16 Address)
 {
 	u8 Bytetemp = {0x00};
 	u8 temp = {0x00};
-- 
2.34.1

