Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEE82EF653
	for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 16:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776357244; cv=none; b=bW5O8usX4vXVy7SECLAsO1SZKgZm6lkPouWyNFmPvtgK7Wp+rWvdaC6/FvicMKy9L8Rrv720EISfI/lgS0hFWxn/5JKUROPKE1MbeRUGva2cc3gf2YCztbIS9jtkzdaTQcm0h93PxBRixcXA+2omlDRKC1ksoD78oYbtNq1ymZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776357244; c=relaxed/simple;
	bh=iOHgLBjGBG8/L1J9/LEWCIms8zOb4aTUViXXlGyIwbs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ibY/GlCtZsNPcbKPpkwffl7F8cGpYKbXtmZ3ENGzekVwbflmnuMmwI4LX65nJ3O3DTFaDVj0A/0ZZB2auYjV2UGoa0JzM2Jt8QE7vnrhN4rGNsEvaloGyo1GHHoSefdgggZsnnVjMuoq2wNKHyeHkQdFG7vNnYN5lcm9t5EMEK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fykv/A3b; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fykv/A3b"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ab077e3f32so39634675ad.3
        for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 09:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776357243; x=1776962043; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N3169mZIk8RorZVUOvI3bWe2SqAjpNH7g375pxr0zAU=;
        b=Fykv/A3b48/4wo4C1SKSbQOloAOxewfOmNhEKRM8LQf0uQbkmPj+tKd7xxqt3AZ7fB
         AXPDd98gR46w5dHhYKUBhYXeUBNuCHR4QgvfzJdbxwtKA6/J6TOV64pBwmYgFHNmFRJh
         dRAMa7wrIN4O6BOD8YCq12EBJNCDmuwyDMJJMcmJikN/R3OWSpgtBdgzgUvTUEbDMLY5
         dZKYgonRdR+cwD6qjpQfmDEJ/jGlkVlt7p3a6kOrO6Z2WwIKE4nniB13fZ1J9xaTteLG
         zgIi8arT/JP17XdO7ahy9186NWEoESXI8ZuDtg7D98LsCK/AdkDyzJIjYm1hdq7BGS7T
         gprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776357243; x=1776962043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N3169mZIk8RorZVUOvI3bWe2SqAjpNH7g375pxr0zAU=;
        b=jbVAcUnDge23lekWig+mbw83MoRDrtPK6sYZZQinfbMDCGNDAyf2XLSmSsafU84kWf
         GDP8wDpnXpgtstg51MzaH/h9fnwjEOmJeDDWMegi9s9upExgFvEVhhYg2WvFT3YHdDj+
         bRpHzf2mysAYZqKq7ibKH+Ia8v5LtMcAoHbj7l2KvR7BJDMmJjDD+PWnKVxXX4O7lKVU
         8HPOzdFA5MQnrhyFsK7w+c5VxKTPKQyTfOLc+q9aWunR9s3GLFgqxKqaJXYPsaP4SChn
         pQOQyohTFAszZToAzLBq9vxYAN4Fa1Dr4QVbSv+uT/p6bfJvUFasOASooVm20TySKYtw
         M7NQ==
X-Gm-Message-State: AOJu0YxAXTd9cjf2wwMEeTViHHeEOjs2XMFnErbbTWTmnxFb2S9pTHsK
	0eOAF1oZBN1JTcjSxMhDxCiIFxf4LQe58RJ/YWbvlTRFJd4ruDVKyoFN
X-Gm-Gg: AeBDieth0Q6on3iFQrYHu64dJwhNMHQ109Awd/H6EO62fyqPWTGy9wTL5ANtmvI0SSs
	vsX2Gg7aehUjo6q8m8kqE1OHL4yNPRLNPrhfBob+taCudPz6pzHER5QT5nJ+p1w9KUORkRYQu9x
	Dnn3zWAWQ6sjSwpslCl494FXGVAizxqBqzdlE0S2RIrhd/R9cVqRB0FYG4L+aoNANoeATVe+Rgl
	/LihuNT87xJAQ9ZFM5M04strBK6aaKuTVZ/F/DSSyIbABWyhADI72iDJRVF6mW2WuIPkBPyaOH1
	HaClqKvkwei4gFZWZ9AS3+6sBz883DRhNQ4cEsjdWNMzxOzzGxZtW9P/wq01VY83jddjycCcZcz
	pF6cFrCR+EujSBESCXnEE/ZF4TuCueGJSc1SWCfVu6Gv1XqUUv7KEgx7A10m4ZfD8DWoB27ZBCo
	qHJrF6xFmW18s+D4k92Q38jXBLLHjERUA2VWZfExlyXLGJ07CI
X-Received: by 2002:a17:903:3c25:b0:2b2:5704:5715 with SMTP id d9443c01a7336-2b2d596af25mr270626605ad.15.1776357242968;
        Thu, 16 Apr 2026 09:34:02 -0700 (PDT)
Received: from ubuntu.. ([49.205.37.103])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b47826e2f9sm59633285ad.42.2026.04.16.09.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 09:34:02 -0700 (PDT)
From: Ajith P V <ajithpv.linux@gmail.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ajithpv.linux@gmail.com
Subject: [PATCH] staging: most: video: replace BUG_ON() in comp_exit
Date: Thu, 16 Apr 2026 16:33:34 +0000
Message-ID: <20260416163334.80699-1-ajithpv.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace BUG_ON() with WARN_ON() and pr_err inside comp_exit().

BUG_ON() is risky and not recommended to use in kernel.
It should replace with proper handlers such as WARN()-family
(see Documentation/process/deprecated.rst).

Signed-off-by: Ajith P V <ajithpv.linux@gmail.com>
---
 drivers/staging/most/video/video.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 04351f8ccccf..78cbf367c308 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -577,7 +577,8 @@ static void __exit comp_exit(void)
 
 	most_deregister_configfs_subsys(&comp);
 	most_deregister_component(&comp);
-	BUG_ON(!list_empty(&video_devices));
+	if (WARN_ON(!list_empty(&video_devices)))
+		pr_err("video_devices list not empty during module exit\n");
 }
 
 module_init(comp_init);
-- 
2.43.0

