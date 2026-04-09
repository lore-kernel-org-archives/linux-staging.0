Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CA2387351
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 22:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775772379; cv=none; b=a17udNrbGsrJsC9qqLkejc9YhfXniTMp0MYq/WNeFE7gxgndnZiLaiepuy2WNnZ40catXMorl49etvsN1kU9ZBu97CBUtp1JkFVTJ627iwrjCYwnHtc1rFeokLykNmzvj3a8NZ2TjF3qGj9B1JNMEWLe/7d6bVSOVhR8u4Dvlw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775772379; c=relaxed/simple;
	bh=deN67ZBoe3d37xUx1Z8MV6scHUX+yCgHDH8LXtT6clo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q1ECbOZFR+OIS+Y8Kqe6T9jXRnRS2xnXw+kmJsCp4pOveI/8Omm0Jd29n07+blL4tg+lTCyXMPlIj1bt6befwx2+RcGjEcHIA2ypbowrUbDIUecz8hUqCjgVs9jarwig5g9kzFLSiOsjzDye48vJByiAFuhemi1OuhKqbK1kQvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maestretorreblanca.com; spf=pass smtp.mailfrom=maestretorreblanca.com; dkim=pass (2048-bit key) header.d=maestretorreblanca.com header.i=@maestretorreblanca.com header.b=HgurmUGL; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maestretorreblanca.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maestretorreblanca.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maestretorreblanca.com header.i=@maestretorreblanca.com header.b="HgurmUGL"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56d924c7183so1184932e0c.0
        for <linux-staging@lists.linux.dev>; Thu, 09 Apr 2026 15:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=maestretorreblanca.com; s=google; t=1775772377; x=1776377177; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yn/MszK/sJEXRbPpypeTB/sGwmJ6bNDycW4BqPUHfVI=;
        b=HgurmUGL5Xy03ZszwhkFkgVW7tSaKomymum8TQxPkR7fCadgJ7Gneefvc0MuFxPLao
         Ks+PyfzD9qbflaco9hbRhefWq8bVc7abxA5RWLq8tf6ME32tmlE7iPCM750jTmgaxMpf
         DtuVi6KxyTQtFaSyAkPvM8PhKhZevLw79nh7em9emYJObdl6+7AwA2/ecQootXVzPcpT
         vVwZAHxNWjlTU1UnRb6Q20Hm2ijtQOZmi+jj075t3WDTZkL6YwElu8DC7bIXJtGRIf3U
         JWDz6q1zmQCW9HLRfhRLl1tZwo7QsMJRlsFAcEPK0CL52akhxDfJ/ivRh5ksOy7ksYOR
         q9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775772377; x=1776377177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yn/MszK/sJEXRbPpypeTB/sGwmJ6bNDycW4BqPUHfVI=;
        b=Z3KlVpgYFJpV4OK1pF6mPttFgctA5+6SmJr3oVUYbm0AeXCeS2/DU8O1Yd615VGEw5
         dpygIMR8mLPoguv88DEOIYVmm9zTTuXVRtAYWI0h1LucKcf2BufETijfpHAGOnWpQT8l
         6a/1NN0GgopwLA0avv4LW8J9c4CnEyreW1knxuhi41KfRlybTGosnlVQ5sxVX7+/NldQ
         Zd7MDQEKPB4zLO8xO2yBSLosv6xJqXnZLXq6FF11VevcwE/NE8r74OQ//pYScOpIEcea
         qz6nWPzWJLmUedE2xRGDyFBF7ohBClIm1E2nDjf/pa9c4OLH6GHeQKIFAm1smH3pKIek
         HOQg==
X-Gm-Message-State: AOJu0YxqOLXRMthwsnaWZdsXacANHPdfTYAUkKiMm8MYww/778N1s5Sl
	NYAZRxb9WS4lzCDDeP3q17TNQCeRuymjb+JPzWeLuQqwf2zpJHcSvZWLrfKxnLogXoA=
X-Gm-Gg: AeBDieu1JQbohHVw8Igh72bo800Me5tAYc0JeEUTFj3Kj8sKHriM2Bp38cWp8pbIWlP
	CX8tn8RB+KQhR+T5/sSLq75rBMdA7/rEetrCAo51kIfQiRd7CRmOnPx6gpRhYzjrIeuWMegNRRR
	9lVHuH9XFO8EqNBI3tKdMEQ/s5ajrhEWtryslArDO6Q6ZW1j6+ubRfQZDe7AQW97sS5O6DO2FB3
	nSGOZ1+SKZO8xBH5dWS/XzX7EilVOl3DqBdsfhZUTUYPXX/425ii/yac4PH8vWCKgdxSG8jyhv1
	LbS2BFoPmtjI3pkE0c7/ixkVMHkEP940L2oZ1lLXOaBHoFJoY7Mvp0hDMVnNevg2bIeXl6CsLbv
	6+VGzYRz8IIF9v08NrirnKYuX2NYDflNYWGV0ALBscQm1JZO23yPJCFIPfJRBfCumWh3BoIjLpl
	MSsUl/XqG+pn83N1ik37HDgtECtc+QBvwc71P9leIqDMWYso3J1KVsgkZdKSpBysyMTco6prG/x
	4kAQgUt+3t1
X-Received: by 2002:a05:6122:3110:b0:56f:3b3b:eea with SMTP id 71dfb90a1353d-56f3c93b95fmr239536e0c.2.1775772376760;
        Thu, 09 Apr 2026 15:06:16 -0700 (PDT)
Received: from localhost.localdomain ([181.199.46.166])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56f3b7fa22dsm549224e0c.4.2026.04.09.15.06.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 09 Apr 2026 15:06:15 -0700 (PDT)
From: Francisco Maestre <francisco@maestretorreblanca.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Francisco Maestre <francisco@maestretorreblanca.com>
Subject: [PATCH 4/4] staging: nvec: fix block comment formatting
Date: Thu,  9 Apr 2026 17:06:08 -0500
Message-ID: <20260409220608.98566-1-francisco@maestretorreblanca.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a multi-line block comment that was not following the kernel
coding style. The continuation lines should start with ' * ' and
the closing '*/' should be on its own line.

Assisted-by: Claude:claude-opus-4-5
Signed-off-by: Francisco Maestre <francisco@maestretorreblanca.com>
---
 drivers/staging/nvec/nvec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e9af66a08..0e655f79e 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -660,7 +660,8 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 			to_send = nvec->tx->data[0];
 			nvec->tx->pos = 1;
 			/* delay ACK due to AP20 HW Bug
-			   do not replace by usleep_range */
+			 * do not replace by usleep_range
+			 */
 			udelay(33);
 		} else if (status == (I2C_SL_IRQ)) {
 			nvec->rx->data[1] = received;
-- 
2.50.1 (Apple Git-155)

