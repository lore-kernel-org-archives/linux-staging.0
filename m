Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBEE13C836
	for <linux-staging@lists.linux.dev>; Sat,  7 Dec 2024 12:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733575064; cv=none; b=EI+E4yst0mBGXKr69+t0gRdT7NS/Go/tr4Miq2tq1zMNHG0XCbpspXi7x+AFf+OQ5aBIYGxVk8wI3QJRh2M13L4wBklirleEBE5rjHPv03To0Tg+IYASgyFw/gyXii+zCaq6X6IZ+rLD9q114wLURfiQp/2PpneNMIo8rO637HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733575064; c=relaxed/simple;
	bh=gAx2GsIKUg/y/jNLoObi1Q9vAfzx51AqCld5wFLpLaA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dPvqEl3ekCQBczgrj3PVLM587lnSFWxkrmKnnAvgmYLh0UuH2nvh144OhGr2x1XHQaZcyEBwXVEkQf83ki0M5SqkTpSMDqLqWiCxHOAS1M76td3ooJgDF0VVLu3oe/nG1blLenTrcdEYNsjA0lfVgS18UGGAwvE8foLOSadKr+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FaNoXx4T; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FaNoXx4T"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38634c35129so413851f8f.3
        for <linux-staging@lists.linux.dev>; Sat, 07 Dec 2024 04:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733575061; x=1734179861; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jmtD4L1/SX4Fv/KBhC5LSYN3L3RfR4TRHNghsMrCU4w=;
        b=FaNoXx4T5FKHCLFDiOIfwF57a0f4XsWL24AtAJF3hCNZ41HfCkebgHq/lJ9PXDYHHo
         +VxmLoL4B1vT23O1Fws8Ob4ARKLJwGitogHdBzLOX7aCWKnW0Fw5y6Jvn81+ljyQLTag
         6IVre6JLxmUmf52KVUM2BgWOyPNbhoZ0eMkPyAo103hR4O2kC4pn+vQCMOep80ja6bUY
         F8+J0G0vVLTJRHCP3FEH9z8LYLaszweBLXH/QThSRDO/FDMFcj01C2itPNEW8fisoG5I
         EismVrsnHPqY93bOLN00uCUPXbqZoGRZSvOmEP5DVnJCiu1TkWol25gmxBBu0tkjbWcG
         1F1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733575061; x=1734179861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jmtD4L1/SX4Fv/KBhC5LSYN3L3RfR4TRHNghsMrCU4w=;
        b=pxoH4F5h6dSO7e8aAiMRCIB3Fpa46KijoXyljCf1YKZ4fZtA0LwYCtXp/oLps//Z6/
         5DaN49SYwMIlGTlOJr/XJtV2vSAIYqckW0ap5vWny0J29DL0ftTQZJZK7zOkhOsxs+xx
         4NrT30IM4BxosRY4kcrhZd276pU64QidklVpUiCGR33fDlsiFE4qUriuYW4kiD6lADIX
         hlvuojxj+pkimCYwRS37To7ORXsFDTCnMNzSq5gwZhMt+hVtZGznzmHu2K2EhM26rupi
         RiWyFHonW9q6Yw4MdDZK09UOJ2HvyoLZCHRKo49cUANA9MOlq1mynLK4GOULGmUwlPBs
         kDRw==
X-Forwarded-Encrypted: i=1; AJvYcCW55xtKiJ42u6BoRE8MEzEx7hKGZfDLLL1nuew4fM1YWv7V/5dEmOBKevqhR1jTFPK3gRv12dXu5T/NuuCz@lists.linux.dev
X-Gm-Message-State: AOJu0YzZ7Vv3umT5DsWCcc+LfyVDfZDMmTjvgMy9lmf05cugZm6qY2jj
	dcldWpCG7cruNxknVtYB25lyXhU2L7f1NMifSCNN5HJQy76qQaFd
X-Gm-Gg: ASbGnct6RFB2HdoMmgs19loz4Zsddq8iJBLyb9sCi42rEwCBsNnqTNASjoh/6bVQ1wB
	4WwG/J91e5k7vZPa2NEao7J1RHnMNs3tT7I18DCsGk+5Q13buGZg43ypOCTYcl8LlBT2vvzeG1b
	n1rTFNo8dAXCih4H2OwSX93BHaPf+aNsYN73AjRuJqkHvhGOAPvxceLa2j+6xtOwh1xJCPudUK/
	Ezj1h1ZoePpY6JkC2Q+q9jV67wqkQpO+ak/A/xM31s1SIBQX6na383FQYuFGT7Y0i5qYjvC4ZiH
	MwPJUBnFTQ==
X-Google-Smtp-Source: AGHT+IF4kmrsXWCslu/q1LRta0lEfN+z67D6i2YlSKQPoUjkULf74sFamCgkUBJV+DRNNtozWYE/6A==
X-Received: by 2002:a05:6000:1787:b0:385:f7d2:7e55 with SMTP id ffacd0b85a97d-3862b355a26mr5148854f8f.19.1733575061246;
        Sat, 07 Dec 2024 04:37:41 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d526b14csm124615875e9.2.2024.12.07.04.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 04:37:39 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] staging: gpib: Add lower bound check for secondary address
Date: Sat,  7 Dec 2024 13:34:10 +0100
Message-ID: <20241207123410.28759-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 9dde4559e939 ("staging: gpib: Add GPIB common core driver")
from Sep 18, 2024 (linux-next), leads to the following Smatch static
checker warning:

	drivers/staging/gpib/common/gpib_os.c:541 dvrsp()
	warn: no lower bound on 'sad' rl='s32min-30'

The value -1 was introduced in user land to signify No secondary address
to the driver so that a lower bound check could be added.

This patch adds that check.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-staging/4efd91f3-4259-4e95-a4e0-925853b98858@stanley.mountain/

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/common/gpib_os.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 405237d8cb47..f25e7c458581 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -536,7 +536,7 @@ int dvrsp(gpib_board_t *board, unsigned int pad, int sad,
 		return -1;
 	}
 
-	if (pad > MAX_GPIB_PRIMARY_ADDRESS || sad > MAX_GPIB_SECONDARY_ADDRESS) {
+	if (pad > MAX_GPIB_PRIMARY_ADDRESS || sad > MAX_GPIB_SECONDARY_ADDRESS || sad < -1) {
 		pr_err("gpib: bad address for serial poll");
 		return -1;
 	}
-- 
2.47.1

