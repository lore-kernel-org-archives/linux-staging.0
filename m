Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C7438229B
	for <linux-staging@lists.linux.dev>; Mon, 18 May 2026 18:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779127622; cv=none; b=t9UeMaj4byjwCMbrJgJgBKeapzbeT3XpYay4u75rIN1CadN4B8Td70bynseM2zKb/qBgAEgmq2/FLTI37a32435ON/GpQYU7p/hYEqTf1jWSxMKM/mVfcO8M2iNXW2twiMkGOjvcRujhKCewz+yG0JaKIOLqz0vOR9qeMgHF05Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779127622; c=relaxed/simple;
	bh=PTLDN6KsJt9gUajQHPrLEUghCwUQ9lGIfMj23nlPInw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TQL7m1+WtDwv8bsPh/Rbpsa27BcMF8bHezF+MqIy5RRdSLZ7Qjr22Opb4vd3E9FPMuuZrI+laABso6A+1r1LPrH2o0uqqRusww6doDE5vlJ7210Iiclmmt2IUrVwnU2swbJnWxMq5hb6dwft/l+MG67TNclMY+KhZO9P1M7Q6Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mD/8bCnD; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mD/8bCnD"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c8027e876fcso1075848a12.1
        for <linux-staging@lists.linux.dev>; Mon, 18 May 2026 11:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779127621; x=1779732421; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yv+/w7ltMUfdInC6EyBCtUQz4KpriEjQKz0iE6w4ogM=;
        b=mD/8bCnDH/NjLxil6pdkj2zf8qnHhkBQYZL+Hr6lkwQK3v9LiCtyMoPRxQRqouPj+Y
         OL8KhUMRNeLwZ6ameBRRi8o8F0YxBnZco/dhUEey+lM0BW5gM+SeHVGWdQIIixoc3VU7
         eKyaWTnaNuQY9Y4R1LyhnNGXphcRcz2iZsjCE97p6Z/pt5XKLaf/yr3tUzpc2E3Qd5Em
         zCovDsIfyLt6mC6xOEK4v9D7rvT8VSC+nBm4LWKivfhgPbqRL7tqwA4HbXSWHzx6q7d7
         8EBuZahnLGl/7a3sfMf5H+lSY4cZBls/JkeVacNYrUNaurI2G0qaZJghhs7A1HfUyDm1
         6KAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779127621; x=1779732421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yv+/w7ltMUfdInC6EyBCtUQz4KpriEjQKz0iE6w4ogM=;
        b=LX2+nKRUdd+C7ePLEiBHlUp58qchyuQnr2IdMHX/1SHXQuknPgfisQlPlJaRfO/IHY
         op7khgQFtsbRFMTUwcUZTSc+VJ02SfI778uAZt505jUqtUmpX39pH6KV/LZocek4SQ+q
         hizsXvUz1RzbzO2qfYnJKWnU2eIb9YobRiiqiYol6zAPVbehl/PYcZvSeVdmoXwu7xmj
         kcf9MzFPJprTXzUuU28OrDp+uAZCw3Kl7GKDQAa3795xj/oj1GDjGg9AMJtFRtg9zLAl
         ZPbWAdMYwE1OyOUJR1JkPc73jhsDLTmAdTqrOnBXbaeWfzxkt7nxKLnbOvgc2UidpuYz
         Wn2Q==
X-Gm-Message-State: AOJu0YzxhA/iIMNzh3LdBFvNDGNyiSo7JTVaKx61kDvwX7FLiofm9qb1
	sXP0Kzsp2v3HvHJL3SLpTL5GLSwh67sba2YI1ItfD8Pv5t8BrIhNvoJ/3z5/yfk/
X-Gm-Gg: Acq92OHDn+A+pb0NfyNg6PkQ2LHUK4B6fMAV3366313QEamqGv/bcMQgcoUSuClVZ7w
	SN0bRwPQgW2DutK8HjyTNpCN6WwScJcxdOe7zhnpp0zQP4q10wcyYPbhpgRmIKUW0L16vqjGhAd
	8/IhDzZqMcroQ8ZFSAHJqpaGWKNcL2R3g336+RpJIsWKkON7QYNnHp7hp/JDQjsiXbQV5Lrm6Om
	ZUfE/PNbSvrYCPQXILoqPhgU4m+pLrHuRcvVRJCKGT0xBAnq2MCfxTwsKRhvSJd8Z5aJqcoVMsa
	V5OX/6GADvt8Te0BQqs1sWgLw2aaHiAcp73dn4MENJRHIcdO4KGW9LJa2FW//qmmTzLNflgpWcO
	7Saad1Rs7pDhOPDJyFDfIXTVaCz2bLJ0D6uQXCmMrEXxrJj3mE1qWHQXVRh9qcm9tO/GWT2yiGT
	FS2hGUqW+3lZxd26rQjgdQYK6Yf/HQVr4nciHJXFCCgwfNOqkNhEZ7i9qQVluJD+cjDUPS9H9HQ
	WNulg==
X-Received: by 2002:a05:6a20:560c:b0:3a8:2af3:ce8b with SMTP id adf61e73a8af0-3b22e72fb16mr12716905637.14.1779127621009;
        Mon, 18 May 2026 11:07:01 -0700 (PDT)
Received: from localhost.localdomain ([2407:4840:a002:5ef4:41ce:f2b7:a7ca:2637])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb0ff0edsm14642773a12.20.2026.05.18.11.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 11:07:00 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org,
	mokshpanicker.7@gmail.com
Subject: [PATCH v5 3/3] staging: rtl8723bs: reformat rtw_efuse_one_byte_read() signature
Date: Mon, 18 May 2026 18:06:41 +0000
Message-Id: <20260518180641.44421-4-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518180641.44421-1-mokshpanicker.7@gmail.com>
References: <20260518180641.44421-1-mokshpanicker.7@gmail.com>
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
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index ab7486020b3f..168ecb7a998f 100644
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

