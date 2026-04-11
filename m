Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEF72417D1
	for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 09:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775901213; cv=none; b=IRbWnuIWF9SkIi6CtCeULW3YO0AuCeXaJM6c8IhA8Eg2j358VXz3KvFnv49AlH25lw3HXACbbFc9BcnPYNWJLxhT8Je6KoHibrqhrVJMbBSax/c4liZjUvsdk8NHGfuWtPDGFTyps0HotAT1Qi0tSTW3FpsKCAL+8Yy04mlZQqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775901213; c=relaxed/simple;
	bh=Yp/ySccqD5dH1XZRb7SG+E6wSiElMfGrGREDtrrQlDA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ncu2NtDYQIz+v5slN1z4isJJCqt0NzIVSvKSJB3Ot2BDyl+7BGsCNatEv4cqflF654vynsLlr892VIDvR4OiYDkkXrKyLcDBnZDTIr9Wt3kZnUAsa1hKy+ewM9Hthi17Wcw2Plg0uXg6FJJlm854t8fxxtD88WxZAkEnVS/8YRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGTTl5R2; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGTTl5R2"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82c70e4654eso1294730b3a.2
        for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 02:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775901212; x=1776506012; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yi1BUoLv+4sUvbroYzF2KyzB9EsuOYTg/j5Xtpxbj+A=;
        b=mGTTl5R2zko+UVu3teGOtMNkMWWZ+yQhy8jNylMgkC48nISHBycBqRrdgtvMO/HMDQ
         AbpyCKhTvu8eMpBEglqYnLDM0nE2iYA4uG6txnRxPh18TW8BnvIx2YXZxLNcOLhsLTH5
         Ua0k3ZvNM2q8drNkxG/DIJJNl2vginxRpZu9SLZ8ADvqFaVrOllL+Is9T++zGvykc2Zv
         4JqI73p0BbVfVyVAY9CDjJCdkfGnuPOv/K6wLoMnsusTL83nJFmp1HX4MeUk+GNU8HNV
         Kg0UdiRUZv/oft9n9LbCMb2pWMwef9W+bLslgIfxduF6toaJvSTGe2G5+dRLxUn+In8p
         7jsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775901212; x=1776506012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yi1BUoLv+4sUvbroYzF2KyzB9EsuOYTg/j5Xtpxbj+A=;
        b=AwApbl9D4uJvilFjOdwkXzVqa9TREQQy1GkdVcGaUMUdCGr2HWNTLW7s/pG6F5o2uV
         gWBL/So2in8bUyV8M73I7E/p+wsXLBNy7IkunOSBopk2fKcJ9fI0MyO+oA1eX0ITwzD1
         EMD2lgFrrUBiaLUQLtiovOS1QohdleoCUW/jlqiZhZpRUneE0c+xDIH9n30plPmZzT4t
         q/2OFsjAjcRTe6dwXHtTFxkwZXgdvoY7cSWTQtrFqeIVR/9Y8uXOlQIhNmvfMKrrQhIp
         Bry94dowhAkrvnSJ5fqyuEe+iyytnjJSwuWIcQW9L6rjCMl10825PqpOjsMJvvt0vymI
         2Kjw==
X-Forwarded-Encrypted: i=1; AJvYcCXfDP2LjPF77Xo9EL0qShwkkUUjQ/OrpkzjEf9yDSXAmGAxRNSrShoFn6Y9/pbKOSjG8oTTnvoqfXmvsgZT@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4wkgqBhC5jEC1H40RkTlbFI6SEp2iX1Ot4Gjjm4/nV4Kg731k
	ykrC7J465bQOEFokonMYrgJbj5QfWcsClkCrqiveXbvam7k3ztqkWE0l
X-Gm-Gg: AeBDieu+Nfb5X7pey225cW7Tll9ezu6olMHRwTSlZeCLZ+8bOqJJptUeLvrymXGWW6q
	lecVTFOIhiW24czRINoq/s7moF0qS6drfxeKUCxLUC6lWh9om3EspVIwqLpltq16C+oWfpbV9Mo
	mpqPPsEbOjTZKMwiTtnF4J9+k9wSOQOFFL0mctPAFlxevF/SahKMdl5PK+EMCfPvLUeKlk36fzK
	JJebkOYjoLbczbQplBl+rnJvSr3IwtjdJyDKcr4fSBL3VEWqMygynvg8qxe+08LuqfI82/7XJt8
	ynxEieWIiCHMKxa3heYto2tzxMZAGQoLlmS7L3kr0sfBzZyr+XPEBWjORwotgNGMzinh1NqWNf+
	h/dGiXWkP5p2tTDYLf4v9S5oPltS+xozcl4pYNfcHZvXgutOB02WZ0u++g5TslSRhtywsBuz0jQ
	HNTYqWJ1+C+jnP7/rkjgRiaBMEsXAE9ykaS+ZFK1RS6hhLczrsgP/wLEP0bynenEylCAQlHzhQG
	Wu8fLw0Jzh0O2P4JHN0/6rT2VGIwgFs7A==
X-Received: by 2002:a05:6a00:ab85:b0:827:3ff6:fb72 with SMTP id d2e1a72fcca58-82f0c35e51dmr7418503b3a.51.1775901211781;
        Sat, 11 Apr 2026 02:53:31 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.113.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c506150sm5227277b3a.52.2026.04.11.02.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 02:53:31 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: [PATCH] staging: most: net: remove filename from top-of-file comment
Date: Sat, 11 Apr 2026 15:21:36 +0530
Message-ID: <20260411095255.4890-1-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the filename reference from the
top-of-file comment block, to resolve a
checkpatch.pl warning. The filename comment is
not useful and can become outdated if the file is
renamed.

No functional changes.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
 drivers/staging/most/net/net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/most/net/net.c b/drivers/staging/most/net/net.c
index 1d1fe8bff7ee..f557b140ae1a 100644
--- a/drivers/staging/most/net/net.c
+++ b/drivers/staging/most/net/net.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * net.c - Networking component for Mostcore
+ * Networking component for Mostcore
  *
  * Copyright (C) 2015, Microchip Technology Germany II GmbH & Co. KG
  */
-- 
2.43.0

