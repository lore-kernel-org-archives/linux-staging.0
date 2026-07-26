Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D6413B7A3
	for <linux-staging@lists.linux.dev>; Sun, 26 Jul 2026 05:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785043003; cv=none; b=DGpErNfkrtNc0okdiLDAMfJGTUor0icxhcGJuCaFED0RA0fAVQegymmP4/OybID2l0RYzgVYr9fn4BvRYq9PtMdS3c4/EvQnSuzlyVZ+T/nmkexaK1Y1ZbBJP1J6mVf+Wjbdn2SYZSVWzV3kUCU7hJHH45qwiCxRfSNiR9BmUQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785043003; c=relaxed/simple;
	bh=PTKTLlIFZ5EUExBChvBEh/ZWxBSwK75LiBXSuv5IHRM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pUIJ7SmUjwvExn66TKMX7kh0ZblXpTHpR0k+D/g0KNYv/0pEKjjXmR0wEr6SGLDTu/e/QLVx3RTHDTtkPW9IpJHMqxAWyqj+UuGYRXl1E6MxadUH9KySk6xwM/7u6wIepu9oscDUASay3zuVFSC6tflx4UHTY5yGXckX/jEqujs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M974aw3x; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M974aw3x"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c9e0b89e228so1164105a12.1
        for <linux-staging@lists.linux.dev>; Sat, 25 Jul 2026 22:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785043002; x=1785647802; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8VRLVQ/LyTiuPYf0JYJOE9rN7kDkweXujsX9L75VbjY=;
        b=M974aw3xv4o20ChiKGGFkB2vmPG7lmvUvPMFNDx9Ux1TkLYElS1A/GLs2O3YMplXbh
         UO38Vng9/2ObHdgUR+fW2Zgg+09iuoARQBQ+9RBe+IVAZlV7HK30sARFGfyq9jR6oabY
         IQ9USVfAtFT8rG6VPGcYoCvWibgsbRo8H/n574tNaX9ZkWhsv02rzdCGPzSeTrgdzdVM
         AzA3SfW0dGZbOEqZnSpvCeNC73FSf/qObNZQUjcbrK+UDCkJLQMK+BCm/UlZHx2kjKJP
         lTKTRDyJrq2bAwwRz1yiRVf86aBzwjMYTtGxbcajVNiSq/lANNmMhxP38lhq9ARX/FHC
         P41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785043002; x=1785647802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8VRLVQ/LyTiuPYf0JYJOE9rN7kDkweXujsX9L75VbjY=;
        b=K3lxIQtkzvzh3IYJAIIfctHlvNs16CIWTcMReng7ghodLiFG+d/JGOi9Sd96+WourG
         gCbUsmeDbF60tu4u1APt5enI1UJdY91MQTAdo3O3rL5e9EY/KpZ4xDsgtcSbrJ1RLjnh
         wO9nNJ/rCRHfSCnJQBLHKUVoTUbEr/w8wm2Djh3QCA6RGusirx56Wik/Uy9i9U+h/aXn
         yikNxznHaXGMbtUiJcKmE9kPqWapzHiG4vhV9lSbabYUTSGBn29P23OYxLGEIBqr9gBO
         JV/+RFz6SwmM9je//u29ApGSxKZs8kHTAhT6JTRcNwkjORAl8sgM6JLALd/kS3KPTONH
         VEdg==
X-Gm-Message-State: AOJu0YyA+0icoO/eocZYIdl5k0ugFZW5BnCB4eJ9bSVT3W7W0nSLFdDu
	xjcw5eH/61e1PjJDHgV6dGLqjbDJ6ebtege6pPr4NDGJ/jKbDzC8Mr47
X-Gm-Gg: AR+sD11K7JBcEGxiIPxMIdxFn/HHupgqULplny1WJq3mzDy+NCbqlJRlitCZ9YKhoyl
	977TBgWpBH63y52Dd3D8lDo/KwCeMXy4j6lS85owqHc8j2BizYaUcM6WKNfrulRRGv1Sca2s17u
	W3a9PfSnQ+EWR9wzWwat/nnsvyeQuwbPNq5Jd/KYxWYSO3zDh3fyd2nbhGCpGPGR2xTPqkbbFkX
	hk89Zu8zWG5V1Xqv7G2Zr4gR5TdgGx0fU6pP2Qc98tA4H2y0AnCCDHnzVS0sObTCXhDIsY7RV3z
	QqI7SuOJ2UKY85b9LqlUnnCCKWZ2mTdpaBvdc1ioqLt+anzM70aVFRgz0DGwQUhJysl4CBEj4Fx
	c3X4y4XtqeQfZ4AFUFNhETtnnDejC5qEO+Bd4OkM9IWP0PuzvVdNlMBhKr1M8hCa0nmTUiFyTS1
	juSEW5jjSAIcFqWb77qGLKaseCanJA8LdBy3+dVO+gLbyL
X-Received: by 2002:a05:6a20:c90b:b0:3bf:6237:4d46 with SMTP id adf61e73a8af0-3c67da812bbmr4199772637.28.1785043001778;
        Sat, 25 Jul 2026 22:16:41 -0700 (PDT)
Received: from fedora ([2405:201:a412:78a0:40cb:342e:9c1b:a9a3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d2d1d0d1esm18699530c88.0.2026.07.25.22.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 22:16:41 -0700 (PDT)
From: Shivank Sharma <shivanksharma2376543@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shivank Sharma <shivanksharma2376543@gmail.com>
Subject: [PATCH] staging: axis-fifo: Remove unused includes
Date: Sun, 26 Jul 2026 10:45:29 +0530
Message-ID: <20260726051529.172905-1-shivanksharma2376543@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'linux/cdev.h' and 'linux/jiffies.h' are not used anywhere in this driver
it registers via miscdevices, not cdev, and there is no use of jiffies.

Signed-off-by: Shivank Sharma <shivanksharma2376543@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 3aa2aa870..ceda6c755 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -15,7 +15,6 @@
 #include <linux/wait.h>
 #include <linux/mutex.h>
 #include <linux/device.h>
-#include <linux/cdev.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -24,7 +23,6 @@
 #include <linux/fs.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
-#include <linux/jiffies.h>
 #include <linux/miscdevice.h>
 #include <linux/debugfs.h>
 #include <linux/poll.h>
-- 
2.55.0

