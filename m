Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CF51A6826
	for <linux-staging@lists.linux.dev>; Thu,  5 Mar 2026 01:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772672971; cv=none; b=D2dS1lUjkag7mKx+fTXp7H5asvoaE0zlKvD8HycdneZRRd17rMcnJTIOAt5YsmAvCRxp6sd8zrE5azckPTDGK+BDz+a5kZm5L2HjnOwTQ/amYIX1/RphBRE2tW2dNoR17rDIo09ab0lUi9vsR3me9h3yZIGStE3Gi6CAa0u0om4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772672971; c=relaxed/simple;
	bh=LbtcQ/Ss8yqEo8OcFf87cZm2O+0qnQL71Oa9ALTRLFo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xr7MjfKldP1Y62u05QngshJZ8vtd+l+Xwq/UIo1mkXt96fe1f1GJ9AVvbDoYIH6Ad+ZWD75nmpyzKHj2jbhrfRAdnhSpQV/F8EOQBeu+IJ0wnOYclrCaKbaQve2okf4CzHU2/0IcskKeJ29E/P01LMD90Nx5ox+RKdu6Hx8+CqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O0dfmyF8; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O0dfmyF8"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b936331786dso807420266b.3
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 17:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772672969; x=1773277769; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2MWUrsUXFcwGOAac+qp/yjy4va2ZunaLxL5VCfPRVvY=;
        b=O0dfmyF8wGnvuk4SXKNQlUgkQfXa8nwrXvluBaR6aF7+YlbYrLI1Lhmf7z1fNmHD0A
         PbrvWnGZ+KNzqDbWBWO1LImYUjNA/+qfnnczHhAnwpUEb0oStamE5CZARlnk69SJGcnE
         /po1c0oq6lyyGOk3mlq2RONjWw6A3o5aHFnDL121n3D4zM32r34tfJI3brwa9e70yoEU
         FECWbR1HFLn5Y1Rmg9l2uyI3DOCan0AEZRfoMfN06FW44vHGyZHE80XLyguWNCicD1kG
         YH+FiSSj+ShyOsx0RumyzlTvoE9RJRJX1zk7Ek62rFOCc8TCVwbgaKXEIXYoy9jbCCNx
         +1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772672969; x=1773277769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MWUrsUXFcwGOAac+qp/yjy4va2ZunaLxL5VCfPRVvY=;
        b=KwSIRO8qfrQg05ZwmJ0GJoK36bYvAbk96hMYR+4fqxCXtWE4FAtlWowjb5cHs8Gc0s
         zHc4hxAQl0CnToeQEu2lQg0/G3ivoShGsrHVaB8OTJqACHCugkWIiG8ZOZrJSkNlfE/6
         kRucjkZbCB787IfMXQmD0DTGJrl0q5TW1A8EfGliN1Owl6Qd/1ypd3/NNDJ4MFKH/jAW
         UmAULGNPq9lBHHATt0IAFga0me4Vhfwzs6f8lnoWEcYzn1OFRdVsVzLj5CVRD31yGkXp
         F2I/qYkw+sX4lTI+mczrwhllHbH837HJn2NM3d+LoBmZVzp90o9aeIudC8nrH7Tl/leg
         snmw==
X-Forwarded-Encrypted: i=1; AJvYcCU14uEhhvn1dNTkJtvN9XMe6j5dT75I/6OTHys4u+B9eDPWlY9oVqUYBsKiaBYfhRXJTQnD+BFfGKPhuzcc@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2ymRZaXsp7kEghD6QnIyOMneR+bILBA2/ArDAuS8k0gykiWK3
	A+IovtbZXkXj7iEkty64mZT0Ow4+QV3Fvxw9QmP7euI17WGikr+zO0RU
X-Gm-Gg: ATEYQzyopfSvYdpGHsOjrNNXKzFSknys6793wtm9hW9WTeuasumREjipdTBp/z6E0OH
	JQ2misLtQLUi7VVlBbsYdb43OZ5bWsy+doKMaaBYAnkrcOrUYJazmW2Fh/WOUv5CVzXiY2DvXD0
	6MoKdGr6hpFKSpCw2vm4bQAcS7AgNUuKQAE9kluosBdqHu8fnoT+ATEHCho5WjApZoZUkcqFxPb
	UnqMqVB1ACOZ0Q1ch5WuLymP+D8V2hfkVEyy7Zs6v2mJ+7jYfS9GeDG6toNf7AOKLIVS+q9xdlH
	v1+BnrHdaGnpEmnR6errOz3nRzuVslgw6tUwqBBWhTtsXLB5SUVawDuJMpDWxQKDj/HxIYAL0oP
	bvmRsPnpaE3m68DipChJ4BEIP7DWIqKTKznIKXySsiOyqLUhFgc09arxvvE5+H45MxR25LLtfus
	bWuzX3geuNKqBhY+461lbbtZJjHijMaIGNIz7YSm+Rt9WBsg485vHuR7ncLF1ZqMEv3iUSX28NU
	s3QNUDeFystzAIw5s6HzPw8+pRN12rqmBeZBNx1m4lkALafy3Kwe1VbAuEbdcBNBriuacF0IjxN
	A5PN4BOVaxzF0VXy
X-Received: by 2002:a17:906:4792:b0:b7f:f862:df26 with SMTP id a640c23a62f3a-b93f116dcafmr247166866b.14.1772672968574;
        Wed, 04 Mar 2026 17:09:28 -0800 (PST)
Received: from DESKTOP-JNMGKT5.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ab135bfsm841560566b.1.2026.03.04.17.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 17:09:26 -0800 (PST)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: marvin24@gmx.de
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH v2] staging: nvec: fix block comment style in nvec.c
Date: Thu,  5 Mar 2026 02:09:24 +0100
Message-ID: <20260305010924.40335-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a multi-line block comment to follow kernel coding style.

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
v2:
  - Add missing commit description.

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
2.43.0

