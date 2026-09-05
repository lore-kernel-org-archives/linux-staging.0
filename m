Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496C643FD2B
	for <linux-staging@lists.linux.dev>; Sat,  5 Sep 2026 07:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788592875; cv=none; b=RF3HfdjBvkKYq4oM+TmzKkEC76jSnv/yad6lx7ACBSWX0roKxpGRtU1cEJIKTyZGjP9BhG4xwJ7KSe+DGmvro9sY2tXIkJS5ZQ1J8EG+/TVuWCuBixxfo3t6EDAHZAtTC3iCcVKYSmxVXYooLgdjcNlNWAWbFTYCVWlXO8DMAt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788592875; c=relaxed/simple;
	bh=6ihfkR1QVUMxRUSxBsOWDmpMOFfSiBu48b2nNUha6SQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fSBLSGfz3c92cfCFeH7b9jpF+l49pCos1mlSd1E8G1AtBnewEoJcraVt6iV7IyQkzlvgMztCQUhcYASsLMW20Iei6sm7vnGp422Jp9co+pJxRdVIeK8rsjfWq2XBY/O2amM5z08tEBIAjJiryfwqv/q/xD4gsgdtOCS8zfIHjOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IYU5CTjM; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IYU5CTjM"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-66e63c2c9e1so2897172d50.0
        for <linux-staging@lists.linux.dev>; Sat, 05 Sep 2026 00:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788592871; x=1789197671; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0xCKWxfgEzWbLm+HaC7h/66gSjU3jgg6ww5T0m1lirw=;
        b=IYU5CTjM0GD8x7ihYYjTlPxM8dXjqorFJ8mTN4vo2cxz1MDGoEjx6x0n5EsDVokSu0
         Fptowqhtv0qCx1vKqVIX/eTU0uKGgjRZpyA9XfqExbpfgU1MpEiPEFK7Rb1goLAaY38P
         Mkc64IxoCwJJtiCO9SwbUNGN6ifreUVP2IdG3o1tRxXR4WZcHRulxaoowU4Haa1UzNk4
         X3vwhdzETuoh9tKF1vnYPMaiULcs/BRmGpeWEZj4VOTrl37XhrZn008N+4GUECUpxHK8
         s9xfJjXXhP9oRZ/80EVmWfB7/1QlMSaQYc0iQZFPMZFHYI1iUqfEFW6lVdQh9EA5YcJl
         rohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788592871; x=1789197671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0xCKWxfgEzWbLm+HaC7h/66gSjU3jgg6ww5T0m1lirw=;
        b=Kw2MXE0toiyKi0AERVm2FNT3kL2LrZOA4EzVAd1ORcg6trDjxDGDwq1jXy6AL/fEeA
         uzEwinCFDvDJU1FtDEZQJgDLw1oZypdegmNiaT3/kR2nsBmHM4VVQCVsR++8j4C0kx2m
         s8x8a+Zg0fOQVADviKAN2/wMQfHkxHehTngw0n53dDHpf+a7ctGjGI9aaebbHUGEpdov
         vQmaEB3ZS9Xj451jgPbj9dwkp77+A36GPmWcq0s8oSFuKMZYhcirDgb2PzE4CY1WuI6i
         YEx8hmrxJhuQ3gz8fej0imCk6+uIcM3V5FuoziNKK+uJnO5a0bRLJebYEcEmqB4suspg
         sJ5A==
X-Forwarded-Encrypted: i=1; AKwUvBzY7SHgXLNoIZLEzSmtefS15lICd6rsA9QSGfWHl9SM6ARRstYoRLSAWuHY59xFncGgGDts1MbZE4Xeda91@lists.linux.dev
X-Gm-Message-State: AFuF++kcl08dQpacZ+NiX3ubFPqMlp7+D5drCl9BzMGt6VfuentzwQnN
	9dZxK+WhzDJER2cJCwtLI2qXASgtMyihpa1PeAjOEotM0Z2VjFtHY9yr
X-Gm-Gg: AYBFou2zYahZDVubRnYyN0UTvNEsUAQTotX8TaDqtlvnZ+sSaG413QznhOLvpXLN3dW
	Tr4SyjG630r/kq4kdpP6SdP/vaYUeWRE647OiBGX0BWhyh6CXoR/Kf5AEcUK0Iqh8bICX8Ivm9N
	/3FSNVhDUjj8y0pOfd5ONxw/mxRsmfi8rGXcdypqbCErUAB8DVK0355gE4aHBAsW5NIKSAYIlkC
	KGleoeMmWzgt7RYYBGzbHB8JNgZwMgteMLQgTIqjJeEFJpKeqAbcmEJFXtkLadx5TSbgDchz8NR
	3WBaqDFf4oxrbBZEgZ5A+axMTppv42ff11ccIm0fOVHDJGzGWtXY+g1/VZqjtiCrquMuUVb5Mlf
	qUvsd8SD8IoCVdCk/+5mYTAluHhINPYPr2Dvlx7APpV0pfpO6vtyRgXmQ3M+k9dMv81UEtFiKg6
	r+xub7wRuouKE5eskWVORFNoAVtm6QcfH+rx6YYTMwJDVkispHHYk4M2C/3bx8QW9dwfMIMb7n2
	lHFCG6NRiz1d5WVG6xavW0IHUfGo21WoORiwwJF8KWvuQ==
X-Received: by 2002:a05:690e:1596:10b0:66e:5bd7:7dec with SMTP id 956f58d0204a3-66fae6679a5mr4094586d50.3.1788592871023;
        Sat, 05 Sep 2026 00:21:11 -0700 (PDT)
Received: from MIRSEO.tail0c440a.ts.net ([115.137.91.250])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714b720e57sm34453117b3.40.2026.09.05.00.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 00:21:10 -0700 (PDT)
From: JunHyeok Seo <starlights2283@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>,
	JunHyeok Seo <starlights2283@gmail.com>
Subject: [PATCH] staging: rtl8723bs: align AES function parameters with open parenthesis
Date: Sat,  5 Sep 2026 16:20:33 +0900
Message-ID: <20260905072033.54813-1-starlights2283@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align the continuation lines of the aes_cipher()
parameter lists with their opening parenthesis,
and replace the stray tab between the uint type
and the hdrlen argument with a single space.

This addresses the "Alignment should match open parenthesis" check
reported by checkpatch.pl --strict.

No functional change.

Signed-off-by: JunHyeok Seo <starlights2283@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 2217cffac5f2..3de102a27517 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -765,8 +765,8 @@ static void construct_ctr_preload(u8 *ctr_preload,
 	ctr_preload[15] = (unsigned char)(c % 256);
 }
 
-static signed int aes_cipher(u8 *key, uint	hdrlen,
-			u8 *pframe, uint plen)
+static signed int aes_cipher(u8 *key, uint hdrlen,
+			     u8 *pframe, uint plen)
 {
 	uint	qc_exists, a4_exists, i, j, payload_remainder,
 		num_blocks, payload_index;
-- 
2.43.0

