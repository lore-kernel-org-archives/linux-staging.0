Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD323DA5C4
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 14:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844229; cv=none; b=MZSCgQOom3AiIUbNU8wAQMP8JsTwE+yPrxrtIeTOzusL/TBiIGT7/bNeDYtNSWnOhNNsrHCCVbsUJEfMyrIs9F4N14gGom3li7bga9Z3YFgnHh520UuPy+i/BQBrLNYIM7608DnpFTNkQXzNcK76s8RKm3vLfpVW0E4aFk97AZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844229; c=relaxed/simple;
	bh=DKhXXdpFfOd+l0qHOwIBBAoO+he1+wUov3qBcA2PycU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qTGDy52W7MvJXOhso2ZSBA0OjYdRlx7mF/01sHeltxGPlPKcQ7YvKdb0ds+Ts8CphV1EUjOD2T/EdCPge4lFWYrbeaWrw1tgDKRynm45uWrVRJKuqGSRVgbYZ5u3/cfdVe7BTmyCqPXjdqoLFmakWUKQICyjinvhF2JFy9cSp5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=elcSSwME; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="elcSSwME"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439b94a19fdso6361030f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 07:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773844226; x=1774449026; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WPgDky+p6m4DjYKRjX7ZPVaJ7LhWaswviEmSPnyBoWY=;
        b=elcSSwME+llyGzj8g9oQeVZbGOGZnuX1ZM1V0rbDxSrsSzpueXAE1K9B52zYPH6B8H
         eitjNo7Av5cHUqe5R4ZisLfwctKmyLJfyPKVYFtgmOAtCRqVx0QYmJ+xk5brxdZtvykW
         98ZdIBKZUPdE6fUGbzOtjqutAr1DKvoqWIKCAtJx+N7vGJa1s51KA3IsBI9XNw7PfaKD
         HBWe8LOuw9q5Q3tdpOCmalLI6IbTDBpoAYGcB1AxVjx9/yHZKGVx0ZI9UloDA/FG7bwt
         yauk5H5gHnU0mcfd9SC66X1K9n3aoE9LGoWGM1IdTJprXGScl7RcTLzIbEMVNcG14FOr
         wjMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773844226; x=1774449026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPgDky+p6m4DjYKRjX7ZPVaJ7LhWaswviEmSPnyBoWY=;
        b=Pi1kDo03KbOd5lkQBkocwZzUZ/2lzUT3bMn4JpN5v+D0/PI7CcUl2FbDCeehu8ndZl
         dlNPD2rihrgq/1VHXXlxWTUj51bsIh7FzEtlc5vJ8tHReWmE1RrlberKza4/oDILfE/K
         umLlPrFFUgknJHG6V29qJQ3HGZr2q0J4fXzLghRcwpuT4N+LnidHnR7+wkkNo7CsYQBN
         ZKpmzAelQ2UjQJHS1GyzMkiU4/0L0GqoUhkrk6tLmvEZ7WW5zoRGMawfb/FLNTHBpbDW
         WNQWgj4XUCEVseadIyKHKmK4uY/Et0UIRO3SWYmzmwKncaIzCuwjx30wI8qF+Ynm0LXh
         A/aw==
X-Gm-Message-State: AOJu0YwyfSBzHsdEuSf+Trd1MUeF5kMRpY8SUjztiMB6iXGkuv8i6Kjo
	SpX4ipBGxjh0DDnI0RKb2BzWgj+CrdNEAT0z90vmTkWArd7sv1Zi7uvbrJsvKj4jQmg=
X-Gm-Gg: ATEYQzw+Ls4AGubrPqMJAo0m4gC0emBHdCS30Kjizvig4vTkC/H0TEAodHc3CQBgW30
	wJHU+CsNZoNZ12QTV47uvMhWeQUMIWYKaB8WukkbLcOzKWAKYDJc82AFA7em1fKbw5ncI32NOFX
	XjJKr83nLW3h/uViJ3kq5TDm33rbWSnPmJ+fI9AR6kAIP2GO3fNL9oN4Z4HeAujvvBfcMwfKhd8
	UH9nIVbALpJJ5GOHl9o5eS+vlw1E473+QJmloBra9uHvsAm8mGVUCYBb4rg8crT+iIt1S3aunn3
	MCs03qdrz+bkaDFDve9i6JYbB0nyYRGzETrDFYBadvASt5BmFIVvCGqVrgi1s3gm642qHxLDqkI
	t7KftAZ6xBhqJDc0okVcWPsvX3lxcgvfJLr10iXnb8Bho36tEDaX4s1TCasuBaYhT0RgGSbdcx/
	8dPyT0VFSUcL0DI+1fYvhhI6l6vdqtAELzg2RTEkAU5kDPd7rb0IEBng==
X-Received: by 2002:a05:6000:400f:b0:43b:4489:d44f with SMTP id ffacd0b85a97d-43b527c4e20mr6072954f8f.32.1773844226223;
        Wed, 18 Mar 2026 07:30:26 -0700 (PDT)
Received: from localhost.localdomain ([176.216.150.55])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5189970fsm8949494f8f.27.2026.03.18.07.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 07:30:24 -0700 (PDT)
From: =?UTF-8?q?H=C3=BCseyin=20Can=20Erdem?= <erdemhuseyincan09@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?H=C3=BCseyin=20Can=20Erdem?= <erdemhuseyincan09@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: fix code style issues in rtl8723b_hal.h
Date: Wed, 18 Mar 2026 17:29:57 +0300
Message-ID: <20260318142957.6157-1-erdemhuseyincan09@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Hüseyin Can Erdem <erdemhuseyincan09@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtl8723b_hal.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
index 7ec84304a..cd3b49338 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
@@ -28,7 +28,7 @@
 #define FW_8723B_END_ADDRESS   0x1FFF /* 0x5FFF */
 
 #define IS_FW_HEADER_EXIST_8723B(fw_hdr) \
-	((le16_to_cpu(fw_hdr->signature) & 0xFFF0) == 0x5300)
+	((le16_to_cpu((fw_hdr)->signature) & 0xFFF0) == 0x5300)
 
 struct rt_firmware {
 	u32 fw_length;
@@ -133,7 +133,7 @@ struct rt_firmware_hdr {
 #define EFUSE_IC_ID_OFFSET 506 /* For some inferiority IC purpose.
 				* Added by Roger, 2009.09.02.
 				*/
-#define AVAILABLE_EFUSE_ADDR(addr) (addr < EFUSE_REAL_CONTENT_LEN_8723B)
+#define AVAILABLE_EFUSE_ADDR(addr) ((addr) < EFUSE_REAL_CONTENT_LEN_8723B)
 
 #define EFUSE_ACCESS_ON  0x69 /* For RTL8723 only. */
 #define EFUSE_ACCESS_OFF 0x00 /* For RTL8723 only. */
@@ -171,7 +171,7 @@ struct c2h_evt_hdr_t {
 	u8 CmdID;
 	u8 CmdLen;
 	u8 CmdSeq;
-} __attribute__((__packed__));
+} __packed;
 
 enum { /* tag_Package_Definition */
 	PACKAGE_DEFAULT,
-- 
2.47.3

