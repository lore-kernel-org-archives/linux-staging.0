Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5D625392B
	for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 13:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752499466; cv=none; b=XksuahMw69sNPb+QWf3XiQFs4fqfsk/Zv1lw0jf4UAovRKDXSfkwNnXJW2lIlAXYYn5OxJGfFIjez4ePHujcvkMj9kg7wEk2FBHlNzszvnRETs5uG9zbJ7aAI4getLGi1q5imITt03rjSgqecIg2vxNYViE5p3X8prpxmv9/ocE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752499466; c=relaxed/simple;
	bh=J2ffDN6EUGZ8T6S1yTqAhB2qvyjg/RtWmUp9VgOF/fs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gshdvlgMVZTQcJu7F9kV3eXNtfGAEa/cKBOs0cxnVzW3cVXX12YL8uCOU2fL6Ov5/LbsYjZABagQB1LCnp09CYdKGsVv8b4/XflVG++tYADlfTUXYh458gyqdpl6leDlWyYqAgjwgD2wmcdMK7NhE8iaqzl54t8VAkeI68bjjDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tvn5VnWN; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tvn5VnWN"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-710e344bbf9so41225497b3.2
        for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 06:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752499464; x=1753104264; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FXTxy7Pkq1/nS+EI0CTjTLmkB2ARbkqsIO7hOa/3iDY=;
        b=Tvn5VnWNz+SxGhSw8xjEcTJ/AA84cUheqYfe/IP+Z2qvWSK+K2Y0vv+lV5W1KIppCh
         HhlDNDkBjaFbIBKw0exWEgaHATyG7bxdu1vTdUhYt5yRhsIVz3KH7YjFa8VV2M7N5Icw
         wYNtQQPGYswezqHEHC26TNTe4dN/ZbzN/8wOhceq/SKXAL/lY+rxNYiBosLfC84pk93n
         35aN5gnz1fb0T3U9lzToguK74p4Oysmt1lZX84gRXTJ02CzxPTb0ONRnJpFG/0BrXPPc
         SlXLRNgQ50Lc7F1xyd/79GDfzm+E5z8qXUA6drW8vacMWCzk1i/LNhQNCsS6jRNk82Bd
         /57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752499464; x=1753104264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FXTxy7Pkq1/nS+EI0CTjTLmkB2ARbkqsIO7hOa/3iDY=;
        b=RnPLBk7vVD3ItMUGPZCSn1TxIwxdpAGp9vxXZHCi24j4wwVSN3PGYfjf5bELAbfMHR
         jVHYikzGj5FdFTZv18Br4+Lm/yrE91ZZygsaCzV6fq+GgHg/PvN6md0k0auhZ71cIO3Z
         rx/kOLtyUsQQRl3Kh4bUs4octNQBlIc6RUuGfqLYGAZo5v2vmAWhsdhP1x4BiL1Gq7sw
         2b/lJjeZlGIVmSbTJGsjbO7b2MsQzg+C8NdaZ1Znq8c5h/pmScD7C9064VVBjzDC840z
         moaXgn5GWmk05IZ5X0T9J/INESC/eauXqxGuL3+I1xiP65IjGHnaPshhwl8posUXIjmf
         FgVw==
X-Forwarded-Encrypted: i=1; AJvYcCUXhCn6Zvq7bz9W8XsR0rkI2zxztaagBEc0TaVLqEmbyWP6UPlAA5+hvEeHITIMY7Yia4Wifi+8KD8eN9zv@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/ZCUM/wFyKiA/ezAHbrWjYnVxcXkyI23B2L8HHjoyhECB7lU5
	rOkwVHCDkFiKzGEmwRLJQZh3fc7PkcbYtl+0tWuoFpUd/a5zs43ZIi1E
X-Gm-Gg: ASbGncs8bpL6uZNEnR2GmtmRf/djMJxCYhTcPSP4WZ7ZPam9Ee0h4FqyKdn5VF8FMY5
	PXVnISvOhNPki4Pc8qUD0piXYrbmGGNUsxaFmRxKDdTAdcszO16qSUBZgs9Q3/ZFjHg49zDVhe/
	YX18DQdlNX9/6KDskXWbHHKdEAIsTEp4qHX+WkYytb7VjKhDFcuFthBKKVe+6wYYdrjXPyXpqoW
	WuDAXB6yTvKV5bG1PhyUCUnLi0z4NEE2hdAM8Y15K3uwsD3/wO1rWfLjBF6+jOu1VFKWmcqvz5A
	a3l8JK5m15ma+qJdBDg7MN/bmjwvKSqH/xe11fi8K8T4BhC7n8Dfndj+P+xXJOgG3WwgOMpMN3K
	XYccyivSrF30BMnmSZWb1sgq9j+rH2XmeExsuyZyYcQ==
X-Google-Smtp-Source: AGHT+IGWPWcafeo1jD9K/VD7+214i5teUcbTYJWlQbbSLztFO7e9t2BvNNOK4UlmivGPBYP1VbXidg==
X-Received: by 2002:a05:690c:6e93:b0:70e:7663:8bb4 with SMTP id 00721157ae682-717d7a5f9a0mr194358657b3.25.1752499463531;
        Mon, 14 Jul 2025 06:24:23 -0700 (PDT)
Received: from localhost.localdomain ([2a00:5881:3041:2700:a2ad:ca5c:a53f:4ed5])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-717c61e32casm19546117b3.83.2025.07.14.06.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 06:24:22 -0700 (PDT)
From: Nadzeya Hutsko <nadzya.info@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com,
	Nadzeya Hutsko <nadzya.info@gmail.com>
Subject: [PATCH] staging: vme_user: fixed alignment should match open parenthesis
Date: Mon, 14 Jul 2025 15:24:09 +0200
Message-Id: <20250714132409.26875-1-nadzya.info@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed the scripts/checkpatch.pl warning in
drivers/staging/vme_user/vme_fake.c:1064

Signed-off-by: Nadzeya Hutsko <nadzya.info@gmail.com>
---
Hey, this is my first patch, I appreciate any feedback, thanks!
I've done this as part of DebConf workshop
---
 drivers/staging/vme_user/vme_fake.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index 4a59c9069605..731fbba17dfd 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -1061,7 +1061,7 @@ static int __init fake_init(void)
 
 	if (geoid >= VME_MAX_SLOTS) {
 		pr_err("VME geographical address must be between 0 and %d (exclusive), but got %d\n",
-			VME_MAX_SLOTS, geoid);
+		       VME_MAX_SLOTS, geoid);
 		return -EINVAL;
 	}
 
-- 
2.39.5

