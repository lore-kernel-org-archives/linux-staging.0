Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B1D2D592D
	for <linux-staging@lists.linux.dev>; Sun,  6 Sep 2026 23:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788736246; cv=none; b=CTKGfMFdF/bxDOXQON3iBABcQQhaThmW/SbBvk96cVXZKWAGpnt3ZQHbnMkXCXh/MWdClhSi541dJr2/PFbtwuFdVF2wdonyBv1SGs9bqjd6CrUdxi8P+OxGSQy/mIbK5xd9YY+RDErjutuZoJOFUZ4rFcrG9Kants+S6PO7hJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788736246; c=relaxed/simple;
	bh=E8CGbHSbxQU/mf/lTyLnFrYGNMP3sFNRv8Cj0jTPYUk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rsbBRR8X4cLS4NzmwvPAwQF+ztU8PMKFycT/avN2JGNxR8urJ4P7uZ4+30ajFI/TCP8cB8lTZZ6HUu16qMYpEQQ1axOwCzLZa/IXlqrloTJSI6qRPzP6p6vgAUg2aRBxgoJfb7/JQQTlu6PQcRHYw1gcjPS/RW9Y8h+yLj75nZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTZDtN/6; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTZDtN/6"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-482dd6ee390so3295398f8f.3
        for <linux-staging@lists.linux.dev>; Sun, 06 Sep 2026 16:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788736243; x=1789341043; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HmLppH/k9rc9BfUk1RX4KWoc5bDoKtg//l8Tl2J592g=;
        b=NTZDtN/6nbkQt+EV7fuQojHR6X1cMQR3UjnU3l3nm1+a5C9Srk8OoM13R2N3TOwlhd
         6xV1Un6CXNVbn5LtED7gcyPWZ4Sv90DhsyhjrbvoP/V/vwU8jKgqaW7SIyuLz5Cab16d
         a0TfeQfGDEcwvZOqxuXDE3AA0Vw+zupSeo48bxqoNgBxJpG2TAjtBOCC2+16Dp38T6H5
         L3dXsuIasgb2OgmPrNPML0+h+B54WZEhPdSKhDUQCuD4SE9ya/q3vJECNe2IMXllouQr
         JdFZXCyw/qmYg3jwri2bnOLNqbi9M1JbzII1MhmvV6745MY+x7jGA0gKtYyx+48U9h7j
         70TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788736243; x=1789341043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HmLppH/k9rc9BfUk1RX4KWoc5bDoKtg//l8Tl2J592g=;
        b=BkGWxbTrjQDjW+UDAJ6d8rw5LjZhvem9fN6xcaY/Q2vUvkHDHUU5ikyIMfT/No4IYz
         sRqF+NvJMNKJDfFqIpMJNriOHlx/Hych4yAC3P9OOVgbt6xtl1XPvOMFZ7bDY4vH1e+9
         yI6xzj5BlAps+bt+JGPBOtrR5DutsIYp6aIpxfJX+EIOVYw7b93bDjiF2dPNVdyM2MKv
         hdJl8maF68GT2uikReHUzRbAJsUpiOtAhc5ZVkiTOHNgwLwBl9An2QsfbClYd8iyTSib
         7xmGoLhLwoVlLIAgQeTwH/5cVXzDmJ0OIqH5eMlFzrcGMwZgSlPB+hhrtYPIxnWafRL0
         n4Hw==
X-Forwarded-Encrypted: i=1; AKwUvBwSmBTt5d9WKAy+IXhHurZD/l7O8/E5dIZMDRXKlaqaGG6NMgloGC2OZu4TZZg8Sa8xNvLD0XQMCVy36oDJ@lists.linux.dev
X-Gm-Message-State: AFuF++kGC/T/ZoBWqLU4uCAbJ+7OXWBzqe862kePHTRAZn48N79yoI5J
	r+i25djAUzb5Lp6V9lsc4KrSKXswzHbuH2FLwX+1H1on4xyFR0MnVp2i
X-Gm-Gg: AYBFou3DEoqhqFHl+OkqXKCs+c9u+oLHQv0E7AL3EUD7saKOVMhd2iIzhF73AlCJH0F
	KRXTTORM6HDVwdZO6h8UYfwplII5KmsFm/7xQSMV9Ask9FkO1BgeNZt4td5/RIke34/KXe/zsJh
	D5kPIKtuR0e3WgwWt5NbvEH9Bf3NPdPZgdpDgeZfNs92KUzsLexlOLKn/RaUJEdoXq+9NYGrSSc
	BGvJnTrXGwOJJnpU56ATRrd3AjWAoPPvSe0C5bVSOvCoU6EAH7gasUn65tCpV4+B8IVfq0Cwity
	l5e6xBeCNCZzwQOoejAKHwgVu6RKV5IyXVJsaiKFEgAE39alQEyER8ZIopHr3pTavsWOiPIIe4z
	lFmo6WkYU3Pu08rBqOLkWvX7xHpSORjcoC50fgNHm6mnUTdkHZ4bHW17k/m7Gf1RIAwD0VzkZ6/
	bKafb7S2EB/UVYFHMh6a9QwCS5yerFMu3XAWgZB7NL0z6+J1jTR9+1HKYubcoQS4QoS0rHQt6zh
	zJQZ9uBZCAiTkzhFTuuF/7KrTReFDThqMhemiNTH0/n
X-Received: by 2002:a5d:64c8:0:b0:485:8c16:a342 with SMTP id ffacd0b85a97d-4858c16a84cmr17398660f8f.55.1788736243123;
        Sun, 06 Sep 2026 16:10:43 -0700 (PDT)
Received: from arch.home ([2a02:1210:2e28:2800:36a5:7f85:ccb8:1176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm28065057f8f.25.2026.09.06.16.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 16:10:42 -0700 (PDT)
From: Gabriel Windlin <gawindlin@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mashiro Chen <mashiro.chen@mailbox.org>,
	Luka Gejak <luka.gejak@linux.dev>,
	Navaneeth K <knavaneeth786@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Gabriel Windlin <gawindlin@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unused SSIZE_PTR definition
Date: Mon,  7 Sep 2026 01:10:29 +0200
Message-ID: <20260906231037.915883-1-gawindlin@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SSIZE_PTR macro is defined as __kernel_ssize_t in basic_types.h
but is never referenced anywhere in this driver or the rest of the
kernel tree. Remove this unused definition to clean up dead code as
noted in the driver's TODO file.

Signed-off-by: Gabriel Windlin <gawindlin@gmail.com>
---
 drivers/staging/rtl8723bs/include/basic_types.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/basic_types.h b/drivers/staging/rtl8723bs/include/basic_types.h
index b6b1afaa9ab8..dd376072d1c7 100644
--- a/drivers/staging/rtl8723bs/include/basic_types.h
+++ b/drivers/staging/rtl8723bs/include/basic_types.h
@@ -14,7 +14,6 @@
 #include <linux/stddef.h>
 
 #define SIZE_PTR __kernel_size_t
-#define SSIZE_PTR __kernel_ssize_t
 
 /* port from fw by thomas */
 /*  TODO: Belows are Sync from SD7-Driver. It is necessary to check correctness */

base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.55.0

