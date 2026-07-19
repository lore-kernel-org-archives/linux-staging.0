Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B81317B505
	for <linux-staging@lists.linux.dev>; Sun, 19 Jul 2026 03:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784430413; cv=none; b=FWImhtrT00VMHDQAc1KForhgko/+y89fqCGqkEjfG+6IfmV5AnI+BLYTSV1ts3GrU8MPLihp5TkWI0gQ41vqJrGxOVuepX9Qjlzf5v/MP3ASFPFWQyGrlf/saTjwMyYhYVCMHkbzDlpnZ1OQ4VSQuhytTZxK9pla2r9X6dDUvjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784430413; c=relaxed/simple;
	bh=+s33b2r3lHpGsYdd7mU8JRWxBLo9UKuVJeuzWshsSy0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R0py+1xpEcQlSFfm2PiTQilJQUKBMB4hIbz6tJfJe5O8b3V+kEf3m/xzgvaBqavTdJYBgq1fP2aC+AN0md48mIaFeUIXbhjNb7Qiu1K4qXM68f53izyG8AnE069CsNDGd738BItWYOXy5Kvv9odt3idr7007nelC5KLzgWGkHcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YMCL4j9e; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YMCL4j9e"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-69e54d9c8c6so569542a12.0
        for <linux-staging@lists.linux.dev>; Sat, 18 Jul 2026 20:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784430408; x=1785035208; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fs8E0jLUar5HdcayoGlzBPDcKNFGyvNAfQjWNK0wZRw=;
        b=YMCL4j9etXxECAWrns2MLMJrZEEzP8h1ptfqFzb1axPWKe1Sod0A74uxQpkQ2uDgJT
         o1F4o2bMaunpulveHHhxq77p7oBRpb07Cz42Wi2Pqk0XlVRsyFUErfuk/XzfBvilfQjI
         lL4oL9CQN6hGyB/KH73OujbgKDFYtXgd7lSAyKs7EBbu5m1Mwt9TDv45UXIuFojd4ACx
         G5RLRbFhZK9Pr2hKvfZjsERRbHOl1hiWUQ/X8c4bN0NdWpiAptjlbtILQMFL5GAisEKq
         6eLAKIkXfs74CtEQRvCWyI2MEJl3OtVTZvmfeGyQvuXtHhgxiJh9Um3ki7gH15VIBsGi
         AitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784430408; x=1785035208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fs8E0jLUar5HdcayoGlzBPDcKNFGyvNAfQjWNK0wZRw=;
        b=fCrx/mCtr4JyR+UNVeRcKdwHhmk3ZE5DfWb4/mkYoTGf9lMVKSFT5CZ7nSg/YdxVvZ
         lOOUB9KsAzQ1fvCn4k2q1JXvQijjNx79tFkCFnR4QudkzcKCLsbPqaORKighCYo/ERMv
         poeYE1ArLRYAOUblE0c/aY0v8ZGub7nSS435X8sgOQuz7VasrqfzEosglr5EdlwHC/FZ
         GUL+6PHKIinaDot3VBufYP+9IaVrj9bUaBuSLiOf0M8eraisQaFeayIITXnkERXeEzD9
         MlNhzaZOt5QXlbcIXjv+7bVOPvvJ8AxxxaMiY3+UlWfOLV0PZWHxzZyB614RAhrUuF6d
         hKPQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr+aG4SkKOZYe55ZQi+tI2ZgHyDR3zth11pDchgdTBRLVb6ku9Hmwxjva02MxKqgV/PSslXI9BMKSh0QMsr@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2znS2Oa/mp7PDRxWPA5Ot+TgSKElsFOlWeyv/zGhqHH/TFFdG
	KEo4wCLTHFSBblg/tXd1QPfkts0951fFA2cHTnhUP/BEMwU0gS2BGZvt
X-Gm-Gg: AfdE7cnVBW+p5beU75UwqwjLBntmZVWWc9uCJmhznUP/dHliN8gjOCtF84OfDtcF1gl
	2kMbWAhunpx5Gs+cfETvMRD/Saxw71qHvjod9UlMb/AqJmEvitN1hfsf1/ZD7dCnjt0DWjeXy1P
	Cird8zEuBrZqxFPYxDDUMqVhW/q2aOr/JIacgcLCcU+U0p7Pt6g1nnrTE5nCMqv9jTVewqu3eGD
	k4JP2M19u/srHj583nmH6icJy2BKFNqz+znNKn4F2thsRtsA+rKznRNHf+u5sp+j09ZFtEQ/TZI
	rtdSjhO6gu8RV/uAgxPOXTXSOGFHOoV4Bp/Ez/1zV+v9fn8JivfIkFh7Na6GPBVsarR9bHxliJb
	strqRe9lUDRomVkHhmTyzWM9+PLmGcRD/BX9ZTYMsZ9mgQ9LkdC+hCgBsnkQ7ypX7NsKeuDDbvU
	ESUbHVXtc6KxZ1Rln5FYkZJFr3NME4qihdC7VWwWt+aMrnYgfK2TibdiMGeQRHrhgCxg==
X-Received: by 2002:a17:907:3e97:b0:c16:55de:60e4 with SMTP id a640c23a62f3a-c16b476f1f7mr402142366b.50.1784430408224;
        Sat, 18 Jul 2026 20:06:48 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffd0eeesm2856192a12.20.2026.07.18.20.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 20:06:47 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix OOB read in rtw_get_wpa_ie()
Date: Sun, 19 Jul 2026 08:06:31 +0500
Message-ID: <20260719030631.88254-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_get_wpa_ie() reads bytes at fixed offsets into a vendor-specific
information element without checking that the element is long enough,
causing an out-of-bounds read for a short trailing IE.

The function locates a vendor-specific IE (EID 221) with rtw_get_ie()
and then compares a 4-byte OUI+type at pbuf + 2 and reads a 2-byte
version word at pbuf + 6. Those accesses require the IE body to be at
least 6 bytes, but rtw_get_ie() only guarantees that the element fits
within the buffer; it does not enforce a minimum body length. A
vendor-specific IE whose length byte is 0 to 5, placed at the end of
the buffer, therefore makes these reads run past the end of the IE and
past the end of the buffer itself.

The buffer holds information elements taken from received management
frames and from the IE blob passed to rtw_cfg80211_set_wpa_ie(), which
is kmemdup'd to its exact length, so the read can run off the end of
the allocation.

The sibling helpers rtw_get_sec_ie(), rtw_get_wapi_ie() and
rtw_get_wps_ie() in this file already reject too-short vendor-specific
IEs before their OUI memcmp(); rtw_get_wpa_ie() was never brought in
line with them, and needs a minimum of 6 rather than 4 bytes because
of the version word. Add the missing length check.

Fixes: 554c0a3abf216 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index e02b54131633..781dfe63c239 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -371,6 +371,9 @@ unsigned char *rtw_get_wpa_ie(unsigned char *pie, int *wpa_ie_len, int limit)
 		pbuf = rtw_get_ie(pbuf, WLAN_EID_VENDOR_SPECIFIC, &len, limit_new);
 
 		if (pbuf) {
+			if (len < 6)
+				goto check_next_ie;
+
 			/* check if oui matches... */
 			if (memcmp((pbuf + 2), wpa_oui_type, sizeof(wpa_oui_type)))
 				goto check_next_ie;
-- 
2.55.0

