Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C202417B4FE
	for <linux-staging@lists.linux.dev>; Sat, 31 Aug 2024 10:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725098925; cv=none; b=GlNb10yH7IJOqZDTkxDOEw5xqYUJvTz9hf5aaRwWYrIEA2ZIllvj9rjOxHPqosqKK6uzJaiwlVQKWBXfw9LY81ijc8wKkYHNtisYtPDyuFssbrmWmixYTZogxSOGq3t9qOkRLyDHnAjfeGVDz9lxaAEjiDz/j42R0CosgbITh2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725098925; c=relaxed/simple;
	bh=afvgwD9TDf32Gw3SlmaMTnwOeQpet4+7Q2yjBfU71rA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ifnNlBLoh0FZNf39SVS8U1L9UU6u2I/no2uzGUzXuqYsWH9arI2ewq+vlZ+JJV9TUiWhab+eWX2W+cr9Px2+pa4UnOhZgOvqXoHwyuFZOBo4qxPzAZAPLn8i4izkz9/1cloMUzF2bsxnSxzZB+iyAYSnneOZJi5czW6rT3EVHN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kx6DL/c0; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kx6DL/c0"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a8696e9bd24so310223966b.0
        for <linux-staging@lists.linux.dev>; Sat, 31 Aug 2024 03:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725098922; x=1725703722; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3o7LRK+qA1Rp3EETX2MMU4qubCapxq/bZEDMNP9rdI=;
        b=Kx6DL/c0GXl+kf2kjf2eAEiS7oBKcFa0eWsk/hzI3+vBhIuQK3NnRbIbtCBh66jY3D
         PjN8YrPHMEP6EnGuafsfBeDk4MjXNLPQQxLV823UwztU9Bt4kiAQZ1h3ykYNK68OCWXm
         2ZhYd+tzvoK6g7FtpzBhymGgF+rf+bZL6Ap3GpwDok2qAE7jB2eKmjjUUDb2AH2cj7I8
         XgEr/q/eNX3h/+APhCf00FgjGDJNPjHwKQ+UBhzGTj9vV2MAUMGXLVIYLMl4GRPPfuYC
         nQNa4nlo9ViCaLJkZhyCNXRq6/tb+aw4mfHy4xekGRbCpMwYobkJ4P2TOM+cd7WFQo1g
         Rf0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725098922; x=1725703722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p3o7LRK+qA1Rp3EETX2MMU4qubCapxq/bZEDMNP9rdI=;
        b=e2XMaODZLUKkLGX7xi2ig27bIqRaTyxAycsFhy5Nsdh25H59HDxiyUe8uc3+J8YqUk
         g2P350rfNM6+HcvMP95r53/IXfPA+bRFxIpSsWePKAMmp1R6HOMgMcv+q0FpTTIXtonH
         OiGxbVtCuz+y/lEHk8Q+SPut45lOfn3hNAGRz3PG8OrSXcgQarWjFVE09/d8iuhNp4Qo
         gW0Ni8EEdhnIG45bzi/iUP4cUfliSaBbv2vEcmWFRAETtZaNoNE3ZbsKLnLwYMxtgozA
         xv0r1KKOV6D5RjKyoCL29s74qjkmqK2KwnNp0Yn6B5q+2p7d5iODf+W2n0fxn59Bp9TR
         f52A==
X-Forwarded-Encrypted: i=1; AJvYcCXryjlGh2bWq6D9+fsowSOMiim7X2mzlpyMFIaFVCxWmJOthfhERVbXGW5cMX0HIzbi73/QnV1DarVCOFIL@lists.linux.dev
X-Gm-Message-State: AOJu0YwhSur23EamS5QNtDZIsuPAMxKiy9Je0x3Xz7BuxirROGPWwVED
	7v2/G/mjf3Cc9YDHsB9JcHodDYOBMlh2zh7SLWjNXGtX25hY+FHd
X-Google-Smtp-Source: AGHT+IGwZ7KLfT/QNzkcxGy6HWmXFg98Q0DBkWJNKwbafcC3uk8+tSBR3nd/IrW6uVulfgLLx3aO4Q==
X-Received: by 2002:a17:907:6d2a:b0:a86:8191:b81c with SMTP id a640c23a62f3a-a897f91ff8fmr560356566b.31.1725098921622;
        Sat, 31 Aug 2024 03:08:41 -0700 (PDT)
Received: from localhost.localdomain (ip5f5aba11.dynamic.kabel-deutschland.de. [95.90.186.17])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989021973sm307444966b.82.2024.08.31.03.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Aug 2024 03:08:41 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/5] staging: rtl8192e: adjust size of trsw_gain_X for new RF90_PATH_MAX
Date: Sat, 31 Aug 2024 12:08:07 +0200
Message-ID: <20240831100809.29173-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240831100809.29173-1-straube.linux@gmail.com>
References: <20240831100809.29173-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The array trsw_gain_X in struct phy_sts_ofdm_819xpci is always accessed by
indices in the range i = 0; i < RF90_PATH_MAX. A previous patch changed the
value of RF90_PATH_MAX from 4 to 2, so we can reduce the size of
trsw_gain_X to 2. Use RF90_PATH_MAX instead of a hard-coded size.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8190P_def.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h b/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
index d87bace0a19b..de0cd40df25f 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
@@ -8,6 +8,7 @@
 #define R8190P_DEF_H
 
 #include <linux/types.h>
+#include "r8192E_phy.h"
 
 #define		MAX_SILENT_RESET_RX_SLOT_NUM	10
 
@@ -137,7 +138,7 @@ struct tx_fwinfo_8190pci {
 };
 
 struct phy_sts_ofdm_819xpci {
-	u8	trsw_gain_X[4];
+	u8	trsw_gain_X[RF90_PATH_MAX];
 	u8	pwdb_all;
 	u8	cfosho_X[4];
 	u8	cfotail_X[4];
-- 
2.46.0

