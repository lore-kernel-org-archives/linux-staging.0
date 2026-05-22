Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F55925B097
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 12:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779454242; cv=none; b=RP1nYJ8fxwX7qEtfQlCH7YtNfZU+lJP0OlneTOvs4YP4f9Y6B2zVeOFZncgB8KuPAY9e8e5HPZO7K7A667weDE/+rpDIsoPdYaJ4tKoNt/6nkJ0wVlWtbJX/QUCNHFk08MhfQfaUqLMDmcoSPZTu/SBan7fZXYw2CQs5XrD5RO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779454242; c=relaxed/simple;
	bh=PTLDN6KsJt9gUajQHPrLEUghCwUQ9lGIfMj23nlPInw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kByHePu5GZLZKGGlELdIhDGZXiCa1148+rn7DKakBBej/UPIZEbGMBZtVXGz7mO8YKAUb1TcacuAvPbXurGIlkQMInkwzEg/YUuSCkxFLAr3xnl8Hcyo3HdHk5p9gQp70/bUsB5bK2a27tEATkUOV00Njh71/g7PDhrJNDIDDWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+NhgjRp; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+NhgjRp"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-834f1075805so5622637b3a.2
        for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 05:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779454240; x=1780059040; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yv+/w7ltMUfdInC6EyBCtUQz4KpriEjQKz0iE6w4ogM=;
        b=R+NhgjRpd4uuFaRg7Tejm2xcigpQo1N+jEc9xAfgkCrdGGeAutWml4KpUSCWVAUuin
         lHgzDc8dFA0C5lahxchaAA003aToOI9YWgbqC55nifr1fiGPVff5tOZ/BRXRNMQYcAVt
         3YuAhK+zUlU9EANp628Jq4c1oj4DgntCAMoV5yuTsDZwkdAx5YvDHtMIBHUWNZWAo9kS
         +1zMXp1Xt3GwSH3Mex51tLEfI3LuNyXRnpsClimXLXB+fy7IqEZnOZsVygNprh1zoaqj
         X6EndEvDIFkw1w0+98aQiLC9SdIs5vwijBAooMtKf7OkpVeTDERaWseFLYcJSLod32rq
         O7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779454240; x=1780059040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yv+/w7ltMUfdInC6EyBCtUQz4KpriEjQKz0iE6w4ogM=;
        b=e1xu2JjP9QC+SRXcCgNBMrECrYg39l5B7C6idzZZzk9kbuBSALP1rtnqNDlqVifkBn
         +3UOkhXLJVwIaqO/evY2fM31NQU2adrzrV0eCFq92YkdVSrQv/cNPywEGJayzn/gjMN4
         I+GLVJKfIf+eeGPTWd5qgqRc6Jpgfj22xSG5NFlKdrqAn73tQ/fzzLFlZpf4eCiLm3xW
         shLJJgI/jYLVVxuysbwgPE23po6GXRqK5Yjq/dFiAYmy7lLp6+3CFkb3nF80K4v89L3R
         2M5AYFB8hx/G8JQBD8JRhdSPmZYIh9BmeKCxQxArbnzAXe+oBK5o8mKIktFewhXxa9a+
         fLwg==
X-Gm-Message-State: AOJu0YyZHDkLumSlZJetjYaj8zOC8c3F5ysj2aASr0KIpX5nRuVpQ0uM
	G29yMtHWXhKvmg7V8gItb5XB9TTprvyxWp321ljSBLTtDW0aF94kakERNsuAWknE
X-Gm-Gg: Acq92OFw7+70rYzi9mG+2hfpobpdeFhzRBerIc2+iwHHg80kX5tmr1XRNaVEVm9TI/n
	jsuOy6UhNvtSUUWak62TulLz+/QCk9POS6Z1Ue2TiRCxctMY8znETmMy/36iu6rJpDtOtsGqDmS
	jvE82ZHaBU5CKOg4VRzTZDSvwbMqs8fUH6wT6kILXgpRSw7SO33ywbRLdXRIPNalGdcbb6zVaew
	T9a378LpYu1NKR/7lCNIA5vWo3qyAvq9XBPdY8G1yonEu9dM11HA9ac05iTY6T1b9DYL/xPOe8K
	d0IR3r+R2joB/2mkQFfhI6Z+Py8mGwogOnzb6Ll2BeSlszgv5riTnTJpvcoFBlNyKTaCa6q3Ta8
	57jN/VHa3R2Ky8P/X5wS5HikjQ9CI7IO0OpyfqNALZkYG/n0FLBsaCueHBeLfjPO0d9LBxPCTjP
	xxHne70f6M7WOY9bsmwCtUjCi81vXO6kBCU9cygSOGlqhUt8SqbpYvXk0/mDy4egn4yF8208LGU
	1CY9A==
X-Received: by 2002:a05:6a00:2a09:b0:83e:c8f8:cec7 with SMTP id d2e1a72fcca58-8415f352254mr3818884b3a.35.1779454240635;
        Fri, 22 May 2026 05:50:40 -0700 (PDT)
Received: from localhost.localdomain ([2407:4840:a002:5ef4:89f5:dcc3:dc82:bba5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ea14d0sm1772121b3a.37.2026.05.22.05.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 05:50:40 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org,
	mokshpanicker.7@gmail.com
Subject: [PATCH v6 2/2] staging: rtl8723bs: reformat rtw_efuse_one_byte_read() signature
Date: Fri, 22 May 2026 12:50:22 +0000
Message-Id: <20260522125022.29700-3-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260522125022.29700-1-mokshpanicker.7@gmail.com>
References: <20260522125022.29700-1-mokshpanicker.7@gmail.com>
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

