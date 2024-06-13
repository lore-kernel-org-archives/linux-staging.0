Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249EC14A4CF
	for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 15:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718291869; cv=none; b=JnoizuXLWMS+R7Z9qIndc0kxu5m6QE5oW82xNutpRYg1rxv1ZdcG2YAcwgfIfa4Kd4G1RsJNCx3Qqi79wQu7GlvHkKuwcCWROBpAWAVTJusVGvZ1GstHQW1ijp6wkDyKJgLJh/XuaLPiwEKmbYgtWAYv/XN5DWolCrFz/pohb0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718291869; c=relaxed/simple;
	bh=A7Z2pNuahnQTHPxYxgbC81iuG8UWkVYNqmAEGoD+kuA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AURdP1Gm0B0QhpTff1uMix+Pc4Y+m6LQzmuWEnPQtOhiAXu+WSEiQj5DDoRxH4DlC6x2luwWfu2PqhJtBuGaDqL2yciyoTYnP4NMHppHXjESm2oI+QFd2fDSXrjTAXcSccwQC7Q77ZISRnBkGLK3Nj6HBSQW6tEH9n5NN9rWW9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aa2IGGb4; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aa2IGGb4"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4210aa00c94so10882915e9.1
        for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 08:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718291866; x=1718896666; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPaCGuMACw1TWMHFIb28HSglVp7CXEoBq/vp9txrrWI=;
        b=aa2IGGb4t/tB6NyO+IySTJlUXrA2x26oHjTw79VmyIPgPQh/3TFwXyXncQhiI9HJ3Z
         2iV1RRTd29WfIUejgyY9IkzrILElJCtppDLDQcCtEM/ZzszdxNLov2PGPcsTZnoagRnG
         WG4tRENBg90ObOP0pylGK6XeoOwFHAeNV6l3LxLvKSJ4xf6Okx/XdUXjBz6BuIcsXc+f
         ZuLPfhKa3nMrw6gMIhVkvehWtZ4e+qj6E7pomQMuFr6FyJBX2IbayAp23Cr2JMIflg8O
         VhJxp6UKD8UE/KZm0axGskY9gX70qLrsctiAtLGJ3GDYUi1Arx7/bD4NJz6w1fN/9m57
         UiSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718291866; x=1718896666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xPaCGuMACw1TWMHFIb28HSglVp7CXEoBq/vp9txrrWI=;
        b=OU67RxBH04PencaKqhnqJZhSCKdswozRaC5YekrHLdWa68Zp/ICvoSjKIZuPlFvQTo
         jbKGkdJeVe7Ds+sFf/r04VuUfwWBQ+9QWQZ0ryYQHZORjKrusxzjKbYf7ZlC1FnQYLm8
         Oe3d5gBV+lwBb9DekY6rmytQ7PmCPy8XXo8rucj7xTVfOxYsEAJUufnXLn+OAMxnMj88
         ds0gB5kVMamnqaSJX6r8Jhf4m0sxaL29VnmEtby52U+kxbUvGCJFE3fdnGgGkAPsVz8i
         f38H34ftth/STOW9hEEV98busrrYNLV1lpWjisYsH8l9fNvgpD9bObRm+Zo/AZs75O2j
         BuwA==
X-Forwarded-Encrypted: i=1; AJvYcCVR/jR8y0PLDaYn4N4qoJUDWkUnJry44+JPFojuTYoCxpBvCu1IFxQRS4FZCTG9W4s0ZEENAkmfn3YL+m+uOzNhCCVutvuHWv8FbOm4Vw==
X-Gm-Message-State: AOJu0YxfE0x9mjiRfPRd6LmWZWlh+wPJnUZSIEzcMNVgruKcH+2W6pDg
	iXZhgXZsy18j4Um2Y0eLoMuPVFWHWYxmUWqe78ikZ1VR4qLTymO6
X-Google-Smtp-Source: AGHT+IGGAq1T0qklGDhjiu70NrGM6D4AW7xx5q3tlIKfPGCaY0I4BD1ue5u9m+TKfrrNKPRQfT77uA==
X-Received: by 2002:a5d:400a:0:b0:35f:25aa:1b1c with SMTP id ffacd0b85a97d-35fdf79a22fmr4180254f8f.7.1718291866212;
        Thu, 13 Jun 2024 08:17:46 -0700 (PDT)
Received: from localhost.localdomain ([31.120.167.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36076515a80sm1856978f8f.76.2024.06.13.08.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 08:17:45 -0700 (PDT)
From: Teddy Engel <engel.teddy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Teddy Engel <engel.teddy@gmail.com>
Subject: [PATCH 6/6] staging: rtl8192e: Remove unnecessary pre-declaration of struct net_device
Date: Thu, 13 Jun 2024 16:16:37 +0100
Message-Id: <5669c01c390e31b1014f96c5b1ddd0272a6f1f8c.1718291024.git.engel.teddy@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1718291024.git.engel.teddy@gmail.com>
References: <cover.1718291024.git.engel.teddy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove pre-declaration of struct.

Signed-off-by: Teddy Engel <engel.teddy@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_cam.h | 1 -
 drivers/staging/rtl8192e/rtl8192e/rtl_pci.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.h b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.h
index 615b84bca9b8..3a5635494385 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.h
@@ -11,7 +11,6 @@
 #define _RTL_CAM_H
 
 #include <linux/types.h>
-struct net_device;
 
 void rtl92e_cam_reset(struct net_device *dev);
 void rtl92e_enable_hw_security_config(struct net_device *dev);
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_pci.h b/drivers/staging/rtl8192e/rtl8192e/rtl_pci.h
index 866e0efbc4fd..c645775b2150 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_pci.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_pci.h
@@ -13,7 +13,6 @@
 #include <linux/types.h>
 #include <linux/pci.h>
 
-struct net_device;
 bool rtl92e_check_adapter(struct pci_dev *pdev, struct net_device *dev);
 
 #endif
-- 
2.39.2

