Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F1434F483
	for <linux-staging@lists.linux.dev>; Wed, 22 Apr 2026 11:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776858179; cv=none; b=g552YgRlO8m0G5mKZFigzad9u0cbsL96YUmkVuZj6R7O7cNQTqgytI1OaDhFUH1rw+Wdc0S5kBpWZCJQ6rYVUL6v2SYLpt1EZC+dApKcjIcTDCxdtcwAifzRSN7fE/Mf+DixjqMSr5ZHMujLAhW/swDBS7vsAeHjDgygpgWtn8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776858179; c=relaxed/simple;
	bh=wJ5rkobRhpnWegDUuMc9ffhXdVreRsP/Jle+NWG32To=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KVQd+uJfLp8h3V0KQN6F+Xxq1CFHxVpHKbseFzU1zEw0te4YbP4sLtc6D0TyWIpHkjpl8Te+a3PGbT0Xy65S5v40UYeSpCWhr677ox9tXgCRDGkl/ptEh57g1rj6IxthEHtgK8/Fuw0XIOJleBgIjkY/b+/QlpeGPxJJIEkW2+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AcOc0k3M; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AcOc0k3M"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43fe5574cb9so415121f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 22 Apr 2026 04:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776858176; x=1777462976; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kx0sRLRm1H5Sd9PXklVrxTCUeGioFQX7T85Vyg8tbNE=;
        b=AcOc0k3MLPFvtaRTQhxqmvkspvuH4sxazk92EZEfv7gkxo0A6qdoqlmtARekqwRcU0
         vonhGRnbSZA6kLyDnV1Ps6ImVsKz/EidjlfhoR1tvvQ8hZJWFGUi1NLJqi7hOZ37U/7h
         yQ0RW5Gx5l4uL0qZBnkO+Yko2X9dG3NJudA2HOUhoYOZLewOFuCUsKYibBw2IeGKBljX
         /qbbJX8p39tv+6QEvfgNq2rkLuimtOJtDueyBP1SUaWZVfCM39L39l4R9tKd89hDI2Ph
         XHjMBh8CAlJaoaCc6fBat6vAVFSNxOEDEZRqaGUMItCrtntrYrcw1rrU2kgMjcBSIhYt
         p8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776858176; x=1777462976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kx0sRLRm1H5Sd9PXklVrxTCUeGioFQX7T85Vyg8tbNE=;
        b=nESJHchcNUTN8o2qrF19SsGyNrYJxI3rJeue2dFLxIi3oZ3L2fgSi0e+H5L3C5PhhU
         TxscM9fC/SAMJijRh3SrgDPLKVd2aBIqcwqx+dGD/WW5LhfOJLoIcW8V4onZM00FqNGK
         503ugvPe92osiopQHPX4lQwT59mztJUm6cYJqgJ2AFndqDV/hnl3C5Tg5Z2J50xouZpS
         E+DNmois6fyj4j99ER8Q+gTZlrdFSO0QNAkCDouRPlAFetO6d7edgfTrq15/R9Ng5MSu
         DPgLysyBzBTjg/th5q/+SU0ya65u97QRU8cyRDbmd2MBOVmXhyrxwk76lGVD9zcv5Cdu
         JHXA==
X-Gm-Message-State: AOJu0YyhCCVNkmd7wvMBg5S+C1RukHbeglFgcNAvQJqwqur238kAm6ID
	lFW10d2fCwHFLynZT0sWin7YTyUq7OZwPoebJ5VAc21OLh/ZB9il1j2UOHtT0WL+
X-Gm-Gg: AeBDiet+RWP0FgIRl/loAbB8X9znZGrpLdqVB7UakHwwnedPITVSIGUSX4BZmJS114n
	Yb72lP7BAbfSIreDyDzTOmczt7yFl6IGDQ4kqHkYW78aci4e/dFt9N5wiYZQLx21ZKCF+1y+ZUN
	Ad8FhP4nviloY2/TA66SDADVVAdmh0P3mefQOCMwZgf9Gl9U9tRjloeRUkSz29aSDhOrSc8u1A+
	yg4X5SwQx//lCz8POB/yga3xIcv9S5qASIsMF2oAcNKuYo1MoM5DQK6JO1ODDmuydQuC/uDY63e
	VTFcGVe2aKOhHv0QcK9rGQL2O0XwFJeQoAN6LJ33nWmTzP7cAjoHPBVZwFhXzwpVUEuLkQB9GNw
	0QfZT0p198/AOWPRpJSfU+/L7JXun/QQ3kDKNiRjqnJdHHBhuSeozFHmGf5YaiCwxauR2MTv3SG
	4D8YCwT7Vj+iHQuAet1ZIwrORGnImxR0XLIbtFVeXeXpTTQRWf8L2++eZZhCDcXbrM/YmcnY4By
	fMgEAnHwUHcCDjlg7d/tdvV45kHySIIYRYGZdmB2R8VoQ2bieVMIXaCtcGvSzc=
X-Received: by 2002:a05:6000:25e1:b0:43d:3b74:b659 with SMTP id ffacd0b85a97d-43fe3e29bf5mr14399443f8f.8.1776858176129;
        Wed, 22 Apr 2026 04:42:56 -0700 (PDT)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a79esm47358738f8f.17.2026.04.22.04.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 04:42:55 -0700 (PDT)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH] staging: media: atomisp: bh: Fix indentation
Date: Wed, 22 Apr 2026 15:40:56 +0400
Message-ID: <20260422114055.67687-2-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace spaces with tabs in function parameter indentation to follow
kernel coding style.

No functional change.

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 .../pci/isp/kernels/bh/bh_2/ia_css_bh.host.c       | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c
index 69c87e53f3c2..b87eb1a21b21 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c
@@ -12,10 +12,8 @@
 
 #include "ia_css_bh.host.h"
 
-void
-ia_css_bh_hmem_decode(
-    struct ia_css_3a_rgby_output *out_ptr,
-    const struct ia_css_bh_table *hmem_buf)
+void ia_css_bh_hmem_decode(struct ia_css_3a_rgby_output *out_ptr,
+			   const struct ia_css_bh_table *hmem_buf)
 {
 	int i;
 
@@ -37,11 +35,9 @@ ia_css_bh_hmem_decode(
 	}
 }
 
-void
-ia_css_bh_encode(
-    struct sh_css_isp_bh_params *to,
-    const struct ia_css_3a_config *from,
-    unsigned int size)
+void ia_css_bh_encode(struct sh_css_isp_bh_params *to,
+		      const struct ia_css_3a_config *from,
+		      unsigned int size)
 {
 	(void)size;
 	/* coefficients to calculate Y */
-- 
2.52.0

