Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB92371875
	for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 12:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773748924; cv=none; b=Xmq1e3TgiWqebjHTv45SbUmCHqxkh/sGseOMSgB0xs4IrUwHEg9tQmCN8P8tvsCJfGuO6klEp0/uITbBtEcxUR/dQXGA0OwYH36VB0otX9/RJSTPeBcp72BWGIHLNbusv/OEDrTRPArEkOBaoIn7Kpz49qHiL62MYAwwL4JP5/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773748924; c=relaxed/simple;
	bh=11DAw/kCHF17HiipkU5IJW6HjqTUMPDE8q8+zAIblH4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l3QsRywqKMAVD7dxoVQ87wpoRkciSwDYsfrH50Gd+gvId10hGpi/nKrGqUQmHSToZp0FUKujPc849hpJFiqQWoRMCZCeVz+viMTQQvUllV22WEkGyZ2kf7NBsEdNZ8BiHZKTiLus6hf66+3DNFlAAq1LAoqVMUk+h/VmGhYyac8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dnThQxPA; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dnThQxPA"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7d74dbfe84cso3865342a34.1
        for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 05:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773748922; x=1774353722; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i4U3swru7TEkDA3qT2+EBKpTQ2Rmhos3NsgOvV3Hu4Q=;
        b=dnThQxPA4DJxb9OCXParOAtmVnIPI0d4HB+jYeze1BKeorqKeU/TG+o/t+7Xf1beqU
         ye85eArB2poBtCbHr42luigDn2ct8TfxO0tAhjbhqAvcumkluWncRpunthxdv2BSCdB1
         VLkalbAjdsZfHvhqpnwabHC5ecrAN+1uYketNs2zlCbpqPZ1M6pItuNIgbF2u1SIxDoz
         lxsqxsDnZIfgPtk4wLnpB4otRCIHv8mJLnn7QGtvkpS5+WYcOnf9/oT5YrcaLoQ5WqMy
         HYa2TP9JD+jpUfVN6id8KlzNMGORtH3X1pnIdVhxC133ECVHeKhusppv2Hk3Nmyi/LD1
         ecmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773748922; x=1774353722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4U3swru7TEkDA3qT2+EBKpTQ2Rmhos3NsgOvV3Hu4Q=;
        b=Ghf6F6OWTf+uOUTAeyGOdnODK00X0rjUiUeaSfKu61dSrBcRiiitTyO9V5c3y/ORDv
         yFcB9oDnBmaNiQSUu5WksSCPpMAk9onELxhbZGDeohtZz2aa7UT2Pz/WuaVWkjMg2Njw
         gfEoeMY/G9gi8+7Wdfw4uw5m/N6OLal/zAGT41VBZLXtLnjcUhq9HRIhvCAaS4Cp5Z89
         GrH7pZ2U5dJSYqbl4n+7M1xjcQGlaBOWXoj3eL0RY+JG3b/kWOjF99S2JvRwzozoLW90
         fidBzkBiOVNORpKOl310SRYSb6BhpIE+E9ZUTZdYlo166JaHfC/ly9N9MskBAWNj39q8
         0MYA==
X-Forwarded-Encrypted: i=1; AJvYcCXkTIedEc9oHMA/5iJSPj0EBaQJMBDeMRUyT63Z0KJxUGIsst7ZYjxQbIPX2rRGlE1auLYTDz5d/heL4wCB@lists.linux.dev
X-Gm-Message-State: AOJu0YwEil9CufC+FhRJs4rCqlSZ3vOSNppXZDOCFSX4U0wWcPtbvF0u
	y8pioyh10hzmijbO+N7e1wAVZvTuIv1UUgB5Zx8QEqsX1Jxr3bhYxMwC
X-Gm-Gg: ATEYQzwScOBigwVv9mRzmfkuSF9tgjmjHAEX80H+026woj9nex+Y7EHgsITe3zYG4qK
	AweHVMnyaqVfaFET0iQu0bwdj4k+7/hHAQlezyG5lLKy0+yADk57nt+yYptUwQUPF488KftknpU
	0B3Ttfua2lkgM+griHZllMihX+/cNtaoYa8MCbF++Zj1e4yCvqTg2eSwT7CokOxJ5/Evwvi5prj
	1qmwV4i+fOtnIgQ899cK5ZwQRxxJn5rY1xpG3hAH9EA+d/zWjq+kpenVyiMN8E5DRHM0EM6Nvgv
	aL1hacVt1PKduPjPHFiJ6YZFK0eV3Urykj3socYnnnM4eqTrG1iDoXGl0T9R07nWtiUvBG7YHRY
	/NcGgijXnEXu0QOkRRQZRpRjhVJ6x3UjXWc0bArv4jgyqEWAbqFgJ6TFaVn0DfPafW5URBgRqHl
	uU4pb/zn8m4v7NkCCt7g==
X-Received: by 2002:a05:6820:220a:b0:67b:f19f:892a with SMTP id 006d021491bc7-67bf19f8b46mr7437748eaf.37.1773748922494;
        Tue, 17 Mar 2026 05:02:02 -0700 (PDT)
Received: from fedora ([187.137.224.200])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67bc8db5156sm11602743eaf.0.2026.03.17.05.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:02:01 -0700 (PDT)
From: Martin Bojorquez <dihed1973@gmail.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org
Cc: ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Bojorquez <dihed1973@gmail.com>
Subject: [PATCH] staging: nvec: fix block comment style in nvec.c
Date: Tue, 17 Mar 2026 05:01:14 -0700
Message-ID: <20260317120114.39057-1-dihed1973@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Block comments should use * on subsequent lines and a trailing */
on a separate line, as required by the kernel coding style.

Signed-off-by: Martin Bojorquez <dihed1973@gmail.com>
---
 drivers/staging/nvec/nvec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e9af66a08448..0e655f79ea4a 100644
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
2.53.0

