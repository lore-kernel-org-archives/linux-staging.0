Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B8D2D7DC4
	for <linux-staging@lists.linux.dev>; Fri, 27 Mar 2026 18:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774634664; cv=none; b=pQFPQy5A9g7DAM7My8JNOc/ysbwClsOKPgXH68HghMuG4akiQ9JhCeHGt01PUnr8+CACAyv4cv3LvivIPxWmn0QbJIw799wtLBd5abHfUL2oH5+6qQjAdY8dulpW0eXSQznbcqe0uIixF78q37cr8FXu2fztfF015kPIXHqeaQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774634664; c=relaxed/simple;
	bh=/FDySlnFh0AuQl7QAZEi6pb+0sSJTqx6/m/a9PhaaUI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ge7nk0XP/lgkO23CjD9xw9t5EWFj+3VwHnioTklp0krrl6VAjkmzkgSgPBT1QMvwyk6yTscx8oB1wS3tKqlXnxm3tAtkCQmKbdpBgimfFtkke+0gNXv0yo9In31fBib3TNIpdMZybo51E2WGvYdnHSvBg86ABDPRFFf8OMFl5Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VPCuDG3U; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VPCuDG3U"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56ce07a54e8so1739913e0c.2
        for <linux-staging@lists.linux.dev>; Fri, 27 Mar 2026 11:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774634662; x=1775239462; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LLjzDNQ2SJg0ZYbR6dM+tmBzvYNsiuIC36uQP6VrXyo=;
        b=VPCuDG3Ux0vntCQ0JLoJkJ3vhgl2vhr7W7//ddiI1MLQDyWA++P0DlSfFSXortCg5o
         fBvweBqjvzgZk53MN+XLxSp8A1m2ku8z8d0P5Uc+0Fc5bwbc1t3S6fYLMIxH2QlOqJTT
         7C/zHcTA292kzIQCLoYOXP3AoeFzLUoZGeAHjyGB5ykK4fcS07qbGLc84lKl9+yIAurc
         eBlyKf4u/DWsQO/6mmhUW9Ca+KhEjzmytlLE4fcLZ7EfSS/RiLsINHo9VOKJe3rzR9do
         wgAWNsG6gPJDS3z/kDkCxH8/Q7pb1B0UrPBVyNKmjFUazMLM7y38g3/QhhwVnvaYKY6Y
         k+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774634662; x=1775239462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LLjzDNQ2SJg0ZYbR6dM+tmBzvYNsiuIC36uQP6VrXyo=;
        b=lkxRJ4QlK1P6JnkI+9vNcq0B3VLNQ+MeWpsx6GWxd7neiH0i4Rr7w9sEijhcXGfaDI
         RS7FGeX0Cmdkm2xjZ1GkEn9rhwRREvTTF/djMMEY9sjP1p9jG2pD9NeESH8Cc3LwPuHK
         tPXbIfI6DmPHOEA0r4aGSMywupPE1mv/S/Je7G4frto0VMewzxgKTuWkzYW8rMru9NLX
         OXjlmneVEoGbG+hDyb+cJ13wU0jAa1NvHNWT+Dp06O/e87TqU5SofuUv6/6ri3UGyrly
         4ZFOgkjgt/b96HuklsquIv4rxFwUr2OyDQczmhP8jAL5WGXgBKRBATnZXCAXMiT+XXJT
         ZkYg==
X-Gm-Message-State: AOJu0YzXdy7GKvUF2jPiVOYeuvENnEE7OlqjWE1gdbz60pstH/4Ae2Gb
	79P1bbx2SavHiA90TzHlrMlIOGTu7rnZTg2UgJOkY/YSGDeLbcSX11++
X-Gm-Gg: ATEYQzx3NwSYgRx6GXAMlyYjKkdcY8iIJMqsu7q1puUCWaq/gl7nj8ELuKodNgqKG1A
	wicuo/WF+Iwru/kN8WHTVjpjtrPgWW1ASNFX2XyfBIidDFitTrJwYJdD+2aRTcpA5gf/t7kK7Py
	iINoWCF4os5/JbGjCljZu678W4esTjNAukx86TNsGoMGiM1OAOEHDrFgtxLSXSlhmfk5WO+AdEj
	Hkr7prR59k8iC8biv9yg/bKdpjD/BdueEzYLBZfE6ipVq3TUQd+rHBJi5u0mfRiOI39GxPkzS2Y
	H0DQVJ5o+61OA7o4HSIRH+6zf/4V+ofEIh7CajbK9z+96IRvtUy6DpBONzBA3057B/QsOmDTKJ+
	oBTjGc568/fPvGwY8aJ8/W2u6jvt3ErPaM+QfzQ5z54a1dwFA764Cm3V8r6OymlexeG+/3Zn5Od
	8lKjICEt61UWKN0vF8BUeqh8e98LpVu6n8z1TmlsIXojjW/rNS0heOMU95UPwE71pkRPP3SHhzh
	2VSSL1H
X-Received: by 2002:a05:6122:8b14:b0:563:7062:2a75 with SMTP id 71dfb90a1353d-56d4a549339mr1794211e0c.8.1774634662285;
        Fri, 27 Mar 2026 11:04:22 -0700 (PDT)
Received: from localhost.localdomain ([131.255.96.187])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31bf7190sm10188183e0c.3.2026.03.27.11.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 11:04:21 -0700 (PDT)
From: Marcos Andrade <marcosandrade95963@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marcos Andrade <marcosandrade95963@gmail.com>
Subject: [PATCH] staging: nvec: Fix comment style code
Date: Fri, 27 Mar 2026 18:04:03 +0000
Message-ID: <20260327180403.27685-1-marcosandrade95963@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a comment line wrap to improve readability and adhere to the
kernel coding style. This change is purely cosmetic.

No functional changes intended.

Signed-off-by: Marcos Andrade <marcosandrade95963@gmail.com>
---
 drivers/staging/nvec/nvec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e9af66a08448..62013019a25b 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -659,8 +659,10 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 			nvec_tx_set(nvec);
 			to_send = nvec->tx->data[0];
 			nvec->tx->pos = 1;
-			/* delay ACK due to AP20 HW Bug
-			   do not replace by usleep_range */
+			/*
+			 * delay ACK due to AP20 HW Bug
+			 * do not replace by usleep_range
+			 */
 			udelay(33);
 		} else if (status == (I2C_SL_IRQ)) {
 			nvec->rx->data[1] = received;
-- 
2.53.0

