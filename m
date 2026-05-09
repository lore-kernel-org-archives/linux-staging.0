Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B802D77E5
	for <linux-staging@lists.linux.dev>; Sat,  9 May 2026 16:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778344904; cv=none; b=nT7aT+kgmg7HnqeG0KzlXtbZRuI4eoF6T7Grw4n0COLaLuxDs3eHIgQmxHAmSlDQMnVJOa4bmPwek3GU3h5WdNipaEwBCxpgWLw9CG4k+4mBLE6CV+IHmmE63GJg/NaJy6q9FWjKwnWEtCpV9DuaBNgeIJo1yJMYWZTcUMrDSOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778344904; c=relaxed/simple;
	bh=VRiwiTz8XNaEWhGT75/QXzn+AVRkunNE+SP20l/5r3k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NipUMm7ayKHC5ehJMeDtZpegsmIgdyFPTdQ3LBSeQHyO4tkKbVFbHY03+73fNybreFx3SM7l4PIS2COuXsY08+m/zEwts5EvSk1GfI+NV6zbdqJ1G3F0Xw4F/lA7QqUtXteKfLyT/TWqtx1pjfDLY0QechH2etAn29Savb8Y/gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AGzZ8MgF; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AGzZ8MgF"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c8095d7d75bso1243795a12.1
        for <linux-staging@lists.linux.dev>; Sat, 09 May 2026 09:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778344902; x=1778949702; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qgvIJWE+YLkGRHO2Knnp95ExlejblRDIiVbXUYy3bQ4=;
        b=AGzZ8MgFiX8Dr8O3BM3ygdmP7r4BVLez1ttrJJ8AyWW7ntu617dmRh/ICCbsxdVw3e
         28sg5mQf0HxXcCgbIOtDlkFEamEUMd5k2+N3MefC49VGvULOou5Kumv8UTDSWlH5kq/y
         rN9ppnE44VXEtpYaanl509Netv9BU23PCugzeD+n+xzuzlvP3flCc1NobMuPO13+WRKx
         2BXttqbW5wbwO6TM1wqB6Cmc0TOtB/Bhr0yUBslm2wqPz1oyHvcmJedTWKoC3u2R8T/6
         AdnlTR/iESfzTZ2heyBJvUnK65WejDntDgGMZJUbDuL4mrqTC83r7E7BI0FJk6tK3oMO
         gkuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778344902; x=1778949702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgvIJWE+YLkGRHO2Knnp95ExlejblRDIiVbXUYy3bQ4=;
        b=ssNfPTWoLqX1iGbJsER7xz2atSEpIq0BEznEMLb7ICsLViuRFX3/i0tD82oD2lx2kb
         VcS+0u8bi4Yku5PX3g5xQmnXM7gqSRyKNTlaiAkur23OG8i45BEAp2JRcMt1x2nbcNOg
         5RU6wGo0HFjyfSVc9/b5hVI2Uqr9JJF8i84mW9i1JU3QCQmoVjjBOJNOp+hjckxIZtIj
         iafcgVIG9bcVBhniOnZLUsk+LgVoESGbiN8Dpm4+KL+QnfRg7gYMksMpwJENkeJzW0zz
         ybzasEejezIypsAXxRZdE7C7KNvSKTgb/iJ+EyZbMpdnMgGLjZwt5iJU23Ysid28Bot7
         MwBA==
X-Forwarded-Encrypted: i=1; AFNElJ/yvHUN6N9R/1qT6Ep7w1aQUn0QH/MQBySwQahJffQKqqm2F79/B+mzTdFg/LG7wr1w49vdM3tSXPQgyQ5T@lists.linux.dev
X-Gm-Message-State: AOJu0YwaZxZ24513YkhyNSYCEWckTmRlNkLQDfoGYT2LB1i/B7t3HBxw
	CicpG6/cVm/EH2XxAq9t/Uwhxx8a+CyRsDUTq6+eyAGQRWpGK+JhhH27
X-Gm-Gg: Acq92OFDNyTCdxGqMA2H3m2qRV9nBvGeykbsp2YtLkPpk/M/2AifI/vgNw/Lt958COi
	UHdYTGaHe4BbrR3ZKZorEuTWzG+87uYJO5X1vZpVV587CtVkZOoI5uPHbWXF9sAUTvIzuNXDHlc
	RJ5k2mm1FN+yIn+eTVyTNjPXKzszNHcznKPSQoS9sVFek0GVmdNQudXzqUsueTfdIFqVXS01u6t
	TbE6j6GylcWP5xFzRSifO8FhXOFdRbi/eKpOibiu4NkVufSfI3D/1NclpRThtObiI+jmXMfpzeM
	1wV/wkniPsvxJDAoh6LIxZKb+deKZhgvzuCpTEzgQnA66aI1/srStQqP69gBi3dSDnOz4mSnIM9
	sMHnOsqJqL9NAAdG10tnYioFfZtm2LndTAJIRO1Pij2gmnEtFZADUM9QPddqN1IlK6D4Jm6Z2ch
	q+R1UevEreeuZbaED/ksBImOu2SDelzxrm7FqB8ow2NQ2p
X-Received: by 2002:a17:903:32ca:b0:2ba:1756:aea7 with SMTP id d9443c01a7336-2bc7a990937mr30488865ad.2.1778344902446;
        Sat, 09 May 2026 09:41:42 -0700 (PDT)
Received: from localhost.localdomain ([2404:7c00:52:5f25:aae2:91ff:fe57:5e15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d27330sm54722285ad.17.2026.05.09.09.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 09:41:42 -0700 (PDT)
From: Alone <yogeshdangal66@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chhabilal Dangal <yogeshdangal66@gmail.com>
Subject: [PATCH] staging: sm750fb: Add const to g_fbmode array
Date: Sat,  9 May 2026 22:25:57 +0545
Message-ID: <20260509164057.71722-1-yogeshdangal66@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chhabilal Dangal <yogeshdangal66@gmail.com>

Add const qualifier to g_fbmode array since the array
itself is not modified after initialization.

Signed-off-by: Chhabilal Dangal <yogeshdangal66@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 9f3e3d37e..19c3da654 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -33,7 +33,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel;
 static int g_nomtrr;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char * const g_fbmode[] = {NULL, NULL};
 static const char *g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview;
-- 
2.54.0

