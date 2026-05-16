Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004C1405C31
	for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 09:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778925104; cv=none; b=fric9ZD/J7DFPd7kS9Edw+umXEOtf9NM/nIQ1l152oA65/DjpAcU90tzzEoBtiXugiFLoQOvHFXmTE50n+WnKA8CM1I6TCbV5sCKuR+vKG+07Vb7NQ+78r1ANAaUkk11rCKMw0Yh+0K6NOUrJNMkqtsTrxrBOGLVQsIwNNvCvwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778925104; c=relaxed/simple;
	bh=QMWv5kTR3Z8orXG1d69hSRQEQKzRadhtj3GlQuXI5zA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HBapPZoYxhXTgCocq61J3JcwhS7/iswAd1ZW1rIyzUSZAt3Fa05PsDt/MYbFBzpwecYGQv8a+0OxaOoQAklWtYeozBGZJy6aAu7TaYIJBDA2w8b39ZwqY/D3CsqESbbOa/R28q9bKGCWNNdJQs+bo8G3xLNU+jgCBU+cDJYdLBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lu2gJhSm; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lu2gJhSm"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8383fb7143aso279244b3a.3
        for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 02:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778925100; x=1779529900; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B88evz4AfPX++SW1Roueh1KZYYJZf38uXj4ng+JFhXM=;
        b=lu2gJhSmKgTiIFpYXhyJJFHtl2UQcQexlpEbhH/mvzwbHJaBL3G/Ox6awxW9yfn1ak
         2cRc5T2SS4dXTQStIs4GW1M946gMIt2BdCC8Dlzi+ZCvuYOt0uXah0Lqw4YdvHdBbgip
         cHRlVyzWPxE1SQ1d+TmMNpHF6KzLPojR0nQ6xShSCA7ff7rQQawAhEvnr0040Wcc//Gw
         UlmLpvrHjFX93IOTr+Q9bdsoN2kT7J8wzuuEOekcv93r0CuqzPwOBic62TvKpzbw/qD6
         7G7GZ12/hA1/Uml9+W0Znsc6qov2alIkVmFC3bLLW1kVgk40T/oihRznCsSUq1l5Ja6j
         REnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778925100; x=1779529900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B88evz4AfPX++SW1Roueh1KZYYJZf38uXj4ng+JFhXM=;
        b=OHPMOoF/xiGzfWFV5TRsK65oDl23YILI0SHfus8nlK4KLMI0PlldJcnDsx1vj5MBM/
         y+B2EG352ZldGnVgnAEtQbr9wuFKRzSWGY5oEiMhPb31MpKRNf+SzXUkqZtJHRVyL2yB
         R6aqxJSsQlVtcnPZetPCFztnKCoXw38/OfKwDMU/ADhbZT5ewgapRkQe0rXCIUlvbQ/n
         MJFwmFg5QRthjxrcat7jxYMAcmxsPYsZFCIen8BdaXu//BuXZMfVYQQWPAZQ81YYAODo
         Gub/rHglZZQ9feDRHq0ZF1amq2Bhp6fyBW3v84e0/nE+Xcx4xA5frM7WzpZndKfEmD5T
         PszQ==
X-Gm-Message-State: AOJu0YxlYAKpDcHMifTGgbHyYPK4qzl+meeJ/1MyPD5hQ2HIxxuAaSs+
	rJNswOD05ZbNDd9T9vwA1jUmFnf113xaL65u7Wy4ggWyXzL167q6NxIPY9o1wb/N
X-Gm-Gg: Acq92OHJrwamf3jRb3azQrWgWZsv0pxHtYkPg6/9YCm7dNahblGJ4XM0Ml+DFWWi7Q0
	75Ncuf2Ssh5KSie9UVVVKsZOWaGkUuIhIsIPCcMyOVg22wYsxwhL7rNkAKz5p60iF7erBlgnKQe
	/JFtcKkQzUtWY1l5k2KyP4Yqj/WqUyd1OAplC31jev7t3Pj7oZXRRgZ/Q/iwW22jh/Z5HN6Mvzg
	vjkEKXt2C3GXmjBTEcRNNkhfksXyvubVj9vUjhMbETlEu7fGM1cZkW1z7+h9I78a8mgkD7GJTLC
	O+DItzZO/NRUTOJTKYjF1hGSy04uNMh4YauheNXNpK1cZOilMn6wYBqv4B1kI+oXU+C1LdCwnEz
	0eoo7k7OgkcxZVMDuFWSJx2wXOctUyToJRSPzNkaBYuFvhGwvCkF2zLcUMgYCJBNMGXuLgn52Km
	KVPMjIKGOQsH2/7adI88QQ1z1iD4HgUCPlCeZdzbgbHpylh1bbh41NfDv4nplzVQPRtDPvTEZZ/
	MXssQ==
X-Received: by 2002:a05:6a00:a28:b0:82d:30f:b197 with SMTP id d2e1a72fcca58-83f33c7e20cmr7764261b3a.22.1778925100222;
        Sat, 16 May 2026 02:51:40 -0700 (PDT)
Received: from localhost.localdomain ([2407:4840:a002:5ef4:d022:240f:d06b:67d5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19f8b8b3sm8111593b3a.59.2026.05.16.02.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 02:51:39 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 3/4] staging: rtl8723bs: reformat rtw_efuse_one_byte_read() signature
Date: Sat, 16 May 2026 09:51:03 +0000
Message-Id: <20260516095103.12727-3-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260516095103.12727-1-mokshpanicker.7@gmail.com>
References: <20260516095103.12727-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reformat multi-line function signature to a single line to fix
line length and coding style warnings from checkpatch.pl.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202605150301.7FuEahpv-lkp@intel.com/
Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 2be74f2d4ac8..ef0cec40d388 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -79,11 +79,7 @@ u8 rtw_efuse_read_1_byte(struct adapter *Adapter, u16 Address)
 } /* rtw_efuse_read_1_byte */
 
 /*  11/16/2008 MH Read one byte from real Efuse. */
-u8
-rtw_efuse_one_byte_read(
-struct adapter *padapter,
-u16	addr,
-u8	*data)
+u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *data)
 {
 	u32 tmpidx = 0;
 	u8 bResult;
-- 
2.34.1

