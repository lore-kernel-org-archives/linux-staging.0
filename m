Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC4010F1
	for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 14:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779028723; cv=none; b=EcjzpPpsI0jtwrQA9TOxkpFwAE9Lm+kvASqahntvSEVFv5EDoN6GYAy5OaOAqyCzQxprGfwUnJTmb2UuSx2S86yldsMx0mW71u1x7DuIamF5/l01B1QS9t5UjN9vOjCI6WB6PcAeysXclfDzVl2F9bxem5AiPJl95bvM5x5TdZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779028723; c=relaxed/simple;
	bh=PtN1yxZJNuk9FbDa8oqZvmfsFtOajHmRV9COlbSt9/0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CWP/D5VSa6On3TIfXGVoLW9TIIa2fs9QILO4cWGhHwWO+pjwNytF0GVm3Zq3CoHRvIacwIrA++o++fDNlhJT8RftW72Nh4XYqOFDcxeZZ1yNeJbBu8HjVKrwznVpvZOPvwaGQJF9SVIB7RjhpJ5ayVRPg9PhZ0GsDRJ9ImssNgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ff1+Ggwl; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ff1+Ggwl"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8379e010b01so494764b3a.1
        for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 07:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779028721; x=1779633521; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eqdUgecQ3jiOMHnholwlJn1vS+WfeiAgNuOsvyARsDE=;
        b=Ff1+GgwlxgzZV+0PJFMMKAUCWigR5GiBl5tTTmB7ZU9+QAEd9o41PbMBrZArDx17Tz
         5YptfcA253Ou34wJ1hXg/IKdHhkW1f1bh4Rz0NvkRO5U8+r9YG0Gmx4STDIv+glBX+4Z
         cBnd+UcH9kiscIESG4NwarI+smSgsY5uWGBT0lzxsxxkVAaspUl755N9OCeRWo4Z82k1
         8SBnuCil1UR2CeuQzbtwfZwB/Y7IvSwsORdse76YHmDG6DGgkRRQy8/Co8IKhUBFn+nL
         UbW/Kdl1UD21XzLTA2NBmdcAIeeKCSirvsyliLUGmVv8zT7YGM87lMGCz242pX0PNUh+
         khRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779028721; x=1779633521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eqdUgecQ3jiOMHnholwlJn1vS+WfeiAgNuOsvyARsDE=;
        b=j8VVf5ukEPnc56gZ6AYR06Sxn0ZpRD07IzLAxQ/MIKCCsL+A6aG0R3jBNCeTHZBiMu
         0D12aNpxlHORZMbFQ7gu8S1Yblv6x+X5HskjRviIeQgaXJ/Momss0Hh+l1IT9JyE/7RZ
         V4VrWOsk+b7Cm4vAyvFrO+iVhOUmp/7H6suqbi7r02Eky40z3nIZ7R6Jw/aMGmSdSl6b
         8L/i0hUjNvy0Rho+aFkWm4KWJo/f6bOxzI4B/iHfwtFXBMkTLPN0M/vUBPEmFWKGWvYZ
         23LIbmEZhJtkvmzZMkWhUnBMlHM2HG96bPUMQjJtPSRgeF3XqZGdav8KN7PN9gDDpL6J
         usWg==
X-Gm-Message-State: AOJu0Yx8rfHijjxlJSdvymY8Eu6NGHA2Maqi815S5bvTvVhZoBdWgQLV
	ogLZuI/5pDUtivOpv1K88hW81efbQ3C4jFwYtMJG1Ib6+SVupxm8TkZ7SYXy33lw
X-Gm-Gg: Acq92OH/N+IxIvVzBrMxPeTkou/F90QcANVMCEsLn6IubHcSh7farZYmnT0yqCRHH2u
	Rkg0dmnbb1kRhRt0tDf7u15EXp2uIlz7TzzmQKLssp8g53SDK8r8yMHitoAFOx4hqE6uAhDvTND
	BE+vGrBzNJLg2TZ813K5WfE3oSBnSjfazf8CJJ6bvGJkTZ/oDkLe921HmVurHHeXBHuYsCbY8ls
	HDZTGTpWWDFu/F3XVwnbYjYE2Mx1F0/3qreN0L6iTjxcQwu9k0p7EWFuMH/Llqe57n2BSPXldRt
	QipUgEbM26YJvgE7fc9ITNE4knXALfVSrGV5r7H0tRJUVL7CT97frj75o5suj2wSczyR6FZFWBN
	QgyZKAZnZo34aT1dbKlYP21+E7qMig5isM7UdIPeoxPrvh356piGxqI0bc9UZeMyu3hR8w3uuzi
	CjIAVIgMe7K7GvBxZ7ayP1Wf9gAX9JUUO19FPFeaC8mHrfk4TP8bnkrOLdYOBjEeVY+vI6L+dC1
	WA=
X-Received: by 2002:a05:6a00:4fc8:b0:82f:84c6:6510 with SMTP id d2e1a72fcca58-83f33c961c7mr11882320b3a.11.1779028721454;
        Sun, 17 May 2026 07:38:41 -0700 (PDT)
Received: from localhost.localdomain ([115.242.226.50])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f196647aasm11036887b3a.5.2026.05.17.07.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 07:38:40 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH 4/4] staging: rtl8723bs: fix missing brace in rtw_efuse_read_1_byte
Date: Sun, 17 May 2026 14:37:23 +0000
Message-Id: <20260517143723.13281-5-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260517143723.13281-1-mokshpanicker.7@gmail.com>
References: <20260517143723.13281-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix missing brace and add space before inline comment in
rtw_efuse_read_1_byte() to comply with kernel coding style.

Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
 rtw_efuse_read_1_byte

---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index ef0cec40d388..a9bbfe2d6fb2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -75,8 +75,8 @@ u8 rtw_efuse_read_1_byte(struct adapter *Adapter, u16 Address)
 		return rtw_read8(Adapter, EFUSE_CTRL);
 	} else {
 		return 0xFF;
-
-} /* rtw_efuse_read_1_byte */
+	}
+} /* rtw_efuse_read_1_byte */
 
 /*  11/16/2008 MH Read one byte from real Efuse. */
 u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *data)
-- 
2.34.1

