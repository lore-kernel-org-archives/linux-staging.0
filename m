Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324153905E6
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 12:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779454234; cv=none; b=tkXMsoVwD4W+Pk3EmfYHZphnTndrNfnLosfmG5H30au2ZHcbxFjGHSCA3ApCjjMukU6U1K1+QboD25ov6eccH3w7gy0/40u8hgQQdnGHxJHOjoz6dW7ZVyop1LUPu3KVC7EGA6kocYMH1UNDvnq+r+44e6RxM+wEwMKx7+eUNMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779454234; c=relaxed/simple;
	bh=XFVxarLssg7gB0aeR68PJNrAwIOebpz+6fE8/gA7usM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QsdDI/Ld4c9SEwNbUqHQ7X+bGAYrM6W2R0eiXlaRdPlaj+DPRa+BpXQoWvfz7RBXMHxPw0eSCIwpYL/n/++ZU2BCMJvKNbitS1kxiDtARkACNi+ekgZZVPLkcMpf11YNKYb+sSr8bjKa7LszenM9lp8NM4wjViBMM/Li6q1UML4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qVl6uc2k; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qVl6uc2k"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-841513664bbso1006426b3a.1
        for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 05:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779454232; x=1780059032; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hALteHEQ1mtxIfW6fcRpSgjicgYLLB6R+yFvwu1PG0k=;
        b=qVl6uc2kuN/djcmVEp0V3/S4vS61HXlUp5SFLTujQHo1fJQsA7Wzkautk/nQixdbzJ
         ECPYFnIDJubODzqBJwmwVrQctYtHt9TsK0X/9C8LSwGRgzUTS203ripPTxGt2TKs+KlA
         KR+vh3df38a8LxVM44JT6lVZGHhESDZ1wn4KavCShhoTfkhvWh9Emgllnm0XucBFIQaC
         LrfWcRNjC+RvG4VcVNDXhE9UgXaM8tz8brlSLwtLMXFjggdakAxADev7pB862Yw0TpJb
         Rk4Fz1qF5sUGy0srrEbGHUEyTJdJXfj5W2cDrTafz3weKzQ5TRmtiqdKAMgMcXqMzuwh
         lLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779454232; x=1780059032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hALteHEQ1mtxIfW6fcRpSgjicgYLLB6R+yFvwu1PG0k=;
        b=pdDOEZ+2t0Ic69gImYj4xeWtVse7F/VUj1XyVddnz94ppO6bG9D9n1Tnaw1js0IBZi
         3fKsC649EHYWOsOPg3PN4+GllDrUydVoqE7sSPHXYwjefMYjob0DKMpsHvWshmTCyV5C
         jrdfRACV4IGbjSdzkj/8WIiTI96CKqF4sG6eshVLqu34/kKo/BPQFyOqjAP4umOjX0sI
         MFeaqB6a7jd+3h5bFk97AsteXETkQza/IpliBNROriGyENrPDfvKaXzE2bM6wnlY/ize
         Tcp4/aa4B+Z+A8Z/xNrUpS7r0fPipoGxwsFYYZouU5i2OboCKLuxry7t5/8JLUXroSw7
         u8WA==
X-Gm-Message-State: AOJu0YxxB4OwIeD//JmyD3+DtXvTLsKrcBp1H5nC0dt2L0LNuOkI8GV8
	06R1r3oT+taPwIzVrUcI49i5vYU4Jx9BPE7bgK+bRAqYUcGwlCh3dDgicEUVdYL1
X-Gm-Gg: Acq92OF6EURcqAkfXi8oSeKX2LlRVcadopzkOrM5H6RQ4OhPyCOvHV8GqMNT90/u+f5
	4Y8osdu8hd0K8tl/PznLDx+o9IjtG69Ml2PGnZaH0OEe9YelNAzp2VbVejhYdmRvdb2afrZct2f
	/R7CWagpFvJiYqdBk8qcctxQlf//xZ4/5VzjeqO/RlCOXA24Pe+JP0NN+n4tTefA2npZ3KEBfWO
	nLGThhAPZgorfSKtWBZQ7hzBRcwCTZqJtgd+jsMTJ1mQsC/KOcSszW8ZB7GNy7AhB2K1iimHgLL
	r3JgntuSQFfrciGUWqblMw2BXCgRFaakxtsMAE1nw3LipB5rJBxkikd74cNwpRIhbPY4IWvS6Hw
	CguuE7ytfvMNFS3//3KyrtrlrEZNAfcSWAl8qqEydv9d0ivOXYOqknLx865dVBmGnwuQfjdTCmf
	1v0Q+zSPy5EnsyS6tmlDKmpJs3qFPiegjlL/Od8wVhUeFiLy4Dq7b7A7H+YBrJLk/rTCBiANOtN
	vSyoQ==
X-Received: by 2002:a05:6a00:2d20:b0:82f:49b5:cfc3 with SMTP id d2e1a72fcca58-8416116fed6mr2655201b3a.18.1779454232381;
        Fri, 22 May 2026 05:50:32 -0700 (PDT)
Received: from localhost.localdomain ([2407:4840:a002:5ef4:89f5:dcc3:dc82:bba5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ea14d0sm1772121b3a.37.2026.05.22.05.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 05:50:31 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org,
	mokshpanicker.7@gmail.com
Subject: [PATCH v6 1/2] staging: rtl8723bs: reformat rtw_efuse_read_1_byte() signature
Date: Fri, 22 May 2026 12:50:21 +0000
Message-Id: <20260522125022.29700-2-mokshpanicker.7@gmail.com>
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

Also fix the missing brace/comment spacing in rtw_efuse_read_1_byte().

Note: CamelCase identifiers (Adapter, Address) are pre-existing
in this function and not introduced by this patch.

Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 803a608b74fa..ab7486020b3f 100644
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
@@ -76,9 +73,9 @@ u16		Address)
 				break;
 		}
 		return rtw_read8(Adapter, EFUSE_CTRL);
-	} else
+	} else {
 		return 0xFF;
-
+	}
 } /* rtw_efuse_read_1_byte */
 
 /*  11/16/2008 MH Read one byte from real Efuse. */
-- 
2.34.1

