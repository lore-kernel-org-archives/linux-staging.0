Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05F115A8
	for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 00:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724286252; cv=none; b=i0x6EZtS3DJqshLTWmQC1hgOzwJqymJ6eZMSFdygzjJRFh+XtBc3LpQxWkT89q7FwvzBi+A6XYR+T3UdPs1CGI2NM+rurJfZmXIUoj3jNFvcJ1HikFBQeDm3w4Oi2lpBz0pgEksRczB1Hek725OleQkXalsH/HkGtuvqL7KV4V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724286252; c=relaxed/simple;
	bh=vm4AnZJlmNPDgFyh40AzDC0fxYGicrts8thHOMpNl90=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=KYxeLNepY3zTqILECS0t0QxhIWC2sp9nRwMcMSUNSGa7f/vvTHT1yOL9oYx6bhiRp1WNBAc5gnfbaSZ2TfKBz0aiLdZG4J5Vsh6I9ZV8c/l726qs3zUneqjaB0xFb1Wrzom6XyPEbRmC5H30wSiA5mragEzMVdspvvXYgOWhgZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1bt1864; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1bt1864"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7141b04e7b5so156230b3a.2
        for <linux-staging@lists.linux.dev>; Wed, 21 Aug 2024 17:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724286249; x=1724891049; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zO4Xc1tbpPD+VdbX4jQeqPTy7zhlzFf2fjtWR9GiAT8=;
        b=k1bt186490uJCvx9GPhVYsu4pKuLwPooZ2smGCl73Sborn4yzzhi/ccV2/X5j1jGM3
         k47NUW6AUGbbaEuYDt0J9ZV+1VjxK8yuYJAFwFLJcQp0B9HBStTZzpE9QuQqPAYtCJ+l
         qXV1P67/4Rbi8FW80+DrX5Q6oS5p+ztnaTc3huaFy0WQZvyOGNSTVaEQO6MpEa4M7boD
         W8qkbGzhP4SOI41V3xCKcbpvsp4An1iofDOPcNdN8iv//g7rfRPydVymA4zYNbygSaI6
         thmGeHhgIa7KpwZ+OuA9hhHnK5N2FB5VJ1Boib1iz3ISvvT5u/DWCaH6+UDtl10//7S0
         aNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724286249; x=1724891049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zO4Xc1tbpPD+VdbX4jQeqPTy7zhlzFf2fjtWR9GiAT8=;
        b=oejUZeVdl8G9Kx+hj4JSDrg91Z/3bM04dwzNlSCDuRlC1fhdVDeChvSZGDFHgsguGR
         NYp+T7OSadBlTV8a0m6xaRKZV5Wben4PNzvP/Y6OdD50Mb0LbMdwaMPKNGg1c1VdOIZi
         JxncLy2deq3vjx0fqyaAtASQbEJ++G2hDTJilt5vz1HDDdAGU2N+tOrN5pZyQKcWXAzk
         2vc0KUBxfSb1TpT6dvWHdRz3OYWt1tKqJBKSVFHpmwaFVbWOfK/T3Ys58FL0JrXJKKmM
         Cny7gV0aAwQtaAPCkyGcA1fFoL7/4GqjMMeoPGrYjREXTJvQLjcVJo/aenI5PNxaWcif
         y39Q==
X-Gm-Message-State: AOJu0Yzp/B+/Lg5iU7PxbMJeagLxysaKf75FQG8K9mnC5e8egVC1VDkd
	xmtXhAwP2O4sBV4dodj4h5+LXGgGPM4hk6fHJydyggLjnWKR6098CjkHp+lt
X-Google-Smtp-Source: AGHT+IEeRkHn4GXy9LH3kNxRqBPsAYUdX2kRNWhzY5AjSuNKPF/SMIesumvD0NUFFvsfIHIVYvPFNQ==
X-Received: by 2002:aa7:88c3:0:b0:70d:2c8d:bed0 with SMTP id d2e1a72fcca58-71423557c7amr5184589b3a.24.1724286248748;
        Wed, 21 Aug 2024 17:24:08 -0700 (PDT)
Received: from Thiago-Linux.unicamp.br ([2801:8a:c811:1:6eea:428d:6c73:1edc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434252726sm235892b3a.66.2024.08.21.17.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 17:24:08 -0700 (PDT)
From: thdecamargoj <thdecamargoj@gmail.com>
To: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH] staging: rtl8192e: change logical continuation to previous line on file r8192E_dev.c
Date: Wed, 21 Aug 2024 21:24:03 -0300
Message-Id: <20240822002403.268452-1-thdecamargoj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change logical continuation to previous line to silence checkpatch
warning:

CHECK: Logical continuations should be on the previous line

Signed-off-by: thdecamargoj <thdecamargoj@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index b3d4b3394284..05324682ab5b 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1837,8 +1837,8 @@ bool rtl92e_is_rx_stuck(struct net_device *dev)
 	rx_chk_cnt++;
 	if (priv->undecorated_smoothed_pwdb >= (RATE_ADAPTIVE_TH_HIGH + 5)) {
 		rx_chk_cnt = 0;
-	} else if ((priv->undecorated_smoothed_pwdb < (RATE_ADAPTIVE_TH_HIGH + 5))
-	  && (((priv->current_chnl_bw != HT_CHANNEL_WIDTH_20) &&
+	} else if ((priv->undecorated_smoothed_pwdb < (RATE_ADAPTIVE_TH_HIGH + 5)) &&
+	  (((priv->current_chnl_bw != HT_CHANNEL_WIDTH_20) &&
 	  (priv->undecorated_smoothed_pwdb >= RATE_ADAPTIVE_TH_LOW_40M))
 	  || ((priv->current_chnl_bw == HT_CHANNEL_WIDTH_20) &&
 	  (priv->undecorated_smoothed_pwdb >= RATE_ADAPTIVE_TH_LOW_20M)))) {
-- 
2.34.1

