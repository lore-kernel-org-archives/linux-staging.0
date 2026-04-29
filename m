Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE113FE357
	for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 18:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777485776; cv=none; b=a9dNIYzPQAZ9t28FNhxXI+A9fHEc2OOMB+kxEdlLRVELK62zGx4CQmALlKJY8sJkiTeOXsivNf13AbUxzLChshMHMT88NXmBN7uXXIQYDyLNmqxHRXcsPigwD7xXJb4tc/bqI3pF1AL8HinyPhTPrzqaCygf2b4oFRh0bFXblC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777485776; c=relaxed/simple;
	bh=uLVEIPwqWzxjK4dmir2rj8E7ndD1cjUKSSZ8yXCQuiw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kbZ+8txGgRt5bLA536B4a/BG1WynKa8GBE7+RIxNuAxhf3XP8uMzDjEIjSnA3frfrprdXo6NKIYjEBIbWLCbhqfWuPh1sXBymA/ruDnioQu6TaFMy+LGAhCnZMrThMdNZ6sj2PQ7NGG8koHeBJAXx0JqEKG4vxTBTeMXP0D0moA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nZuV+moE; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nZuV+moE"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12db7bf1541so49845c88.0
        for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 11:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777485774; x=1778090574; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EwC21Ix9lFUTGf8usPBb6lkawYvA9xdVs2jYHSayj4g=;
        b=nZuV+moE7YSdEz6WnxmHsYBkczxn07+2GCJ5y/ApkV7E2j7rHgKHLI6Yb3TkuQW1nm
         c/3lPLMoZ2dMLo1Z1pq8hncnZFCQ1L4kX9YV0m5wlLWCYfRykVeLReeC+B4hqLRmSu0t
         unZww7KNNe4PkscDh/6Bjds8TCqb55+9A24Aiyq1VY+nVWWXkZADxotG71lcB6034nLv
         +P2YqLJx/7Zq6RqcCb5Xg3Zhzilr/PCqV+5byw/xSSVXhnjIT+mV8cP98R1L6eVLdlC7
         RjktGhTYxnDhLLmiaGEy6OqDEFrlcYQtpAMmYY4VB9IuYhPOaf84TSX0zQsOSrN/vN02
         tgxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777485774; x=1778090574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwC21Ix9lFUTGf8usPBb6lkawYvA9xdVs2jYHSayj4g=;
        b=SsQZ2zxvipI2eS/7DMBYPXVC/K+aF6l9yKGxWrGK5XR7Pa/9oF2bpj0y9vy0/k0UBZ
         43RTc/4T4Z9gZwtimhW1AfLLMcpAR6+G3kSfj4ULcy/C0SejGqB0AE+PU4O+RZ0la4OG
         Do9MkFhVu7aCNF1bAmd5EfBr+CdGJ2vJL6GY63ChYK5U+/1iS8MC97PKJwf2DHpyx59f
         Ao2gXYG5pspQLCnLmJlPToOIgh3vH2+n4zZKFkJYy4ozWYpdmgcLRgZT824SpOrUe6K5
         DCgcGxDcdcHdZ5QfmvVbcI7oxGJF0BBWBBC/bhvfJ/5rsxOw3viC6wVtsQUxSDEY9pV+
         MXPQ==
X-Forwarded-Encrypted: i=1; AFNElJ9do/d0VHmmHmr+ngYeqZJkBA9W5XCO+aUevpV1nNWsVn8WfmVrfynCpKljc1hCBtM/rxun1+hGk5eY4K8J@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0xwCz++R2BHeRCt8vW+Fbx9PqtS/ZQOpey3P5MWrW7+lcVjqv
	DfcsNeBuk9ridoQsJiqBnvpHYyHnMQBDaoG0jF/bY62qFefVJ6yPmF4N
X-Gm-Gg: AeBDieutv/XRkos1iD6a1jcx28L0+Bi7+NQ5FpuRKOQAZr2CekxmncBu1FIFXJrCMKr
	fFe8H2WH30BDO99zO8DVPx+IWEzFm6IH3FI1qcJMbD5Tlzt0h8lv5Ec93bEfYlt8c/IxUKLdsQG
	IifqW5JGBgH7wbQHGPRHEa5FdAcp9qz7pwalqO8PQHCwgVji+pmwIZO3jXaR3dp3E9HYznPGPDe
	p0roEldZJnHt0XXLro6CUMFjCQrgb/lA1AqmVCUV+TmSMqucc/M9k8idHtV+Y2mw0NSGt4VqVT/
	65u7LWb1jgmjwKNtgSy1K3Osio8q3DId4IMmnjEEshbG320V9eCqEoactEOqMLU93VWVdMwWuAU
	PA2KFj0jS5CosyG7dyARdKtQB9PwddGLpSDuuk7Xs/7/6Erg72CkKKRlA8ybOq/9bybIRf6Mueg
	VxGjSBhLXrcHthwCtcJF04TWGS0rmIODCdoDklz8ym2KZX+bqqAC460BuYwYScmEKcz6gX
X-Received: by 2002:a05:7022:128d:b0:11a:4016:44a5 with SMTP id a92af1059eb24-12ddd9d9d75mr4129744c88.24.1777485774105;
        Wed, 29 Apr 2026 11:02:54 -0700 (PDT)
Received: from House.mynetworksettings.com ([2600:4040:2afb:6400:cdc9:3f29:858c:a856])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ef842f12sm23199806d6.44.2026.04.29.11.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 11:02:53 -0700 (PDT)
From: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
Subject: [PATCH] staging: media: ia_css_isp_states: fix typo in ia_css_isp_states.c
Date: Wed, 29 Apr 2026 14:01:48 -0400
Message-Id: <20260429180148.6581-1-mahamaryamjavaid@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling mistake: commmit -> commit

Signed-off-by: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
---
 drivers/staging/media/atomisp/pci/ia_css_isp_states.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_states.c b/drivers/staging/media/atomisp/pci/ia_css_isp_states.c
index af1765040464..cb3c2af91c51 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_isp_states.c
+++ b/drivers/staging/media/atomisp/pci/ia_css_isp_states.c
@@ -3,7 +3,7 @@
  * Support for Intel Camera Imaging ISP subsystem.
  * Copyright (c) 2015, Intel Corporation.
  */
-/* Generated code: do not edit or commmit. */
+/* Generated code: do not edit or commit. */
 
 #include "ia_css_pipeline.h"
 #include "ia_css_isp_states.h"
-- 
2.34.1

