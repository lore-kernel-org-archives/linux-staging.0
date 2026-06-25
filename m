Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A6138238C
	for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 09:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782379652; cv=none; b=lv0Ru7kDlmqFBB03p1BPtZb12p7tW70+XjPQpF1Bv6/ZwpG7Ul4O0p2bVuI4JpSgr8PJNAB66GQ7pE1iTzDwfrLFneD34wWPZKp4/rfjBTIdrOMn2mi/6ADtZPhtnlif5ndBl8bP4lkknbub7eNM1pGArZITlWAThrUhFGE4fPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782379652; c=relaxed/simple;
	bh=/72cscm/GhIUlsC0TbwUIq4c9GFNo7DiROPBFIBmMLw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mBdWesnudm4/v9PSvRFArn+nwlGqaXqSJEdGjpBHEl8JFU67iwfDzhHrYnEDU4ac5GN9di7+t2SWjVWwGomBW/M1jlb8bBn95M8cvnsBZzruzddp9EYUqUGqG4sgwWmXu/Rcc+jEOWsEx/1jk5XBDfs4REvH7LVLOxug54nVVnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q9xqybWe; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9xqybWe"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-13810b63a1aso1642077c88.1
        for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 02:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782379649; x=1782984449; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+GgAGfvLU/sWq0xn5C6mnyJo2AmSG/YZOnlB2KZb/PA=;
        b=Q9xqybWe1L6cBaTBfcs2R+ViEUcia7EMvoz9WJT/6udEFRAmNYzmlY79vF4hQlMQEe
         vcLYNwuL921dw/tPu5VxA+DdLKbqPOxF8BQCi7nozA/nFVMXXHmy0ux5UpmAsBTt1Yq+
         o75W6cPFVW+1nzNnkmAkLsmUZBNFsoSLfTM/Z2IeIBMrFJD0CGE3WlrRMvNjjLW+ACYV
         ZAP0X5aJLihqr6JtnhEzJFdQiEUSeVdhlvCH7Cw3TJo1nW/Lh3VxPzk1tFWtoBQ54d9x
         RabtgWygg9irO5UV2qEAu0oP6HOymhZWDdKTPW0mRtlL8NBCtnOuZixzCg6UfieUwLxe
         MaGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782379649; x=1782984449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+GgAGfvLU/sWq0xn5C6mnyJo2AmSG/YZOnlB2KZb/PA=;
        b=bYpNT1teazkwIl0qYkWVVId18gXOGSn6iY6mmzOD07tm/SH2UXAhTv+IaaBdNO0TUG
         2oOVeAF24NtFLeafyS2Jc8Jk1T3HdZ50weG5S3vmFoZiYsD6Zt9CGd8JTOItz9E9TYhy
         QyWLWlIB0Hm79ePNJ8//vHCHFAVIeN49PZTZFsIAAG45oB/hbeihJMATP2ruv9StjfNr
         aFtDt82tjeV/w38Hbz9keT4Fh2X121RCleF23c808jyMW7PhPTKTBgj/GlM+nsk8IP/o
         kInbeJG5dWqmmrP0mJsxTK12IOzR/IBK659pRzfhbaDfGqNDaRNuhz7WkxAiGUyO9rS3
         WRgg==
X-Forwarded-Encrypted: i=1; AFNElJ8hG/+4wKOuiLRjK+DC5FGkzvqOkuOKL1DrPpn4sGhYTe1ryLr4wouPoTQXtZEiKJL3oldRxzq7YUkvuNTm@lists.linux.dev
X-Gm-Message-State: AOJu0YzFBIOkIRHCX9rIKaj8tWXzcIVXNqG/OUl4cDnB7zl4IE0r5MP+
	e7JqlGX1cfyZFF6dxkjiW9ZTdM94Tlps2QFlC2JZWO5JP5VQqkTfalff
X-Gm-Gg: AfdE7cma59Mjg/3oUSkdbVL49J1PJLYvNpNZO7g9Vmq9SfZWuWtGWEGxig59OtMuCNe
	fKLv76FF8VF0kW02WYTtaFxTeBqygm6rH5kRqTBByBTtwHi1idKuA45yRzRODOf+Ax4hzMewGHr
	npRL7MDGL3bxcr9JdHlMMbd0tUOz4P7wOSCddjm01+hdGOB9mtWWkcjfxlbJlyzM/LjuvnjRSPe
	Vsudzya0qJbPSgQ53MTAxbJ18JtMz8bpCkJTf7T/cRjL4mGJ5JMyTf73Q8gV1MlefnIXkPXcPEr
	FxcNJaflLvZu3SIp0X/naWqq6vjQ4n9Vt4bF6oCHamWhNQMtckOs6rAXEuBLbRl81F/AtLASvm5
	LmTx9UK2lK1qNibgkP7YHjXMbl2MHyKaB19h0XV9GkJPcHMcS3kWss5wZ/1wAF00AoGst9uf0Yp
	HoFccPcNaQSSLFXyD1lRom8AcVObgtgDU00IYVRUT2rQeU
X-Received: by 2002:a05:7022:e12:b0:128:d4be:7438 with SMTP id a92af1059eb24-139dbb548fbmr1587576c88.30.1782379649197;
        Thu, 25 Jun 2026 02:27:29 -0700 (PDT)
Received: from 10-86-27-11.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d90e971dsm9709547c88.10.2026.06.25.02.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:27:28 -0700 (PDT)
From: suryasaimadhu <suryasaimadhu369@gmail.com>
To: andy@kernel.org
Cc: gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	suryasaimadhu <suryasaimadhu369@gmail.com>
Subject: [PATCH] staging: fbtft: replace empty modifier argument with no-op macro
Date: Thu, 25 Jun 2026 17:27:21 +0800
Message-ID: <20260625092721.238366-1-suryasaimadhu369@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define fbtft_write_reg_no_modifier() as an identity function and
use it in place of empty modifier arguments in define_fbtft_write_reg()
calls to fix checkpatch errors.

Signed-off-by: suryasaimadhu <suryasaimadhu369@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 30e436ff1..2169f8d1d 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -11,6 +11,7 @@
  *
  *****************************************************************************/
 
+#define fbtft_write_reg_no_modifier(x) (x)
 #define define_fbtft_write_reg(func, buffer_type, data_type, modifier)        \
 void func(struct fbtft_par *par, int len, ...)                                \
 {                                                                             \
@@ -62,9 +63,9 @@ out:									      \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, fbtft_write_reg_no_modifier)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, fbtft_write_reg_no_modifier)
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.47.3

