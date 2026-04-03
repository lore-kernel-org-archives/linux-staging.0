Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64F223FC41
	for <linux-staging@lists.linux.dev>; Fri,  3 Apr 2026 22:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775253799; cv=none; b=q3Sc5ZHtqm3GvRy56nbaTcZhcb+NNQZrkTK10seleX25nY9pHrXys3ANTzEnQVPpc8AtkbtUqDs52swvP6MFKCrTWSxZoYh+cPWwOSrt1DbC6k9Jwvpp3/MSJfXV+wEkp3N4DRwRQaxavCaG2pLUu5vks2CeKpH2D1X6gxRQPsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775253799; c=relaxed/simple;
	bh=HqEGbsyoS6LLHbdI7n7F+t4lTD98cv7S+f+eD5j60Bs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ticJtSe7vRxYUNi+qKIlGgRBm1Mqo7Y1pw5BzOjDxnGaRzzHFMKmIKME4RcCYRkywBh9fZPXFU4ENnJOkiecdz8XIPcOxn2nt5VM2grKJz38neIp7XeDTp8VeISCK850acuOQhKLQYZTyZFM3l1qhvDEuebhUZt3U0+stKaqM/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GtHVKhWE; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GtHVKhWE"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a3af1b7549so1129985e87.1
        for <linux-staging@lists.linux.dev>; Fri, 03 Apr 2026 15:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775253796; x=1775858596; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AiCJ3jLYFI9bDGyuy90SS/6aNmAqXqRcGUdS9GJepOM=;
        b=GtHVKhWEp2f9dNXRXCXnNRmYtRAsQk32fIS3qqhmVzGbCIqr/iGZMqozVfd852m942
         l0qrhM5Yqx98lIoBgVfyyhWPvdEyHQNB1uEUNddvLfagkumZSBevyLiN2vQarTPda7Cz
         cLK8ArC/p75bEe7JdPe0p89Jv+By6bIo7tMUSnjXYvONJG0tbAKcwqcvuQQIN7vvDUXD
         zeN/8nPg8zpPv9Utn8aUrT2FG2uQ2oVk056/jYg+IeYaX4g/b5GnqqMREkDf78LU4RyV
         ZKjbevjf6fwBEM+XbSHvWrCBKpD/hCimCGnax1+xHxoxPgL2X6Fd4BM13kRh1VehXABO
         Sg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775253796; x=1775858596;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AiCJ3jLYFI9bDGyuy90SS/6aNmAqXqRcGUdS9GJepOM=;
        b=FtwuiFgO/IQnH1oSFvxRIImFBNSuR+q/9qvPrZrxAIhGyAJ9HwOH4eXzNYDQd1iqkN
         Ne+4mcytFUHg9hc4lFt/YQK6UJdWKsszY+GByxDLlSdjjU4YnEqyD3SDsnHhhwEVcsiR
         QO0tlgRdI9R/HRFWFEyqz3TgkjOB+25/zV4TqdRzW/Q37PGJ1eCXCASyiCUnWh0rL5j1
         HsMdRNq7euJkQ9jzZHtOsWg1znwiuLEMHzfEr4K9u4FP311SC7sU8VOgYYdVGu/CMdOS
         q0M9Rcju3lbkWeUMnPHjth92WfNftDw0q/9hC0i6u6BFBQ9KwvHnm1meEdZbSqmWH14i
         otpA==
X-Gm-Message-State: AOJu0YyX5LxIgjwFPksLi3/TpCzW0B8SiZF99n+1gTH/HRi8i/kV/RoK
	28BBqJFxk816JMz0GfsNf6zGx2tlJPikw6NWcDVEntIIaIl0DOXgw7gp
X-Gm-Gg: AeBDiev0nHHiZvb+kd86ozTwROAYxb3GfmSqXafuRFEJNKzbW7kqhMsN9uP0mlEy25s
	QCeukL248GmhS6fLUjJXX+V9iOOMVFh+xvChCUVUpuDV4HPj43H6C1A8ipJVpa6+3vvC98IfO+b
	zVoAn0cB6PHTF93LQEAoNMBmoRORWfgqdkfe9I3IVjE51FszTSvgIPIiChf5lhVgp/a+V80/AkG
	csyQZM1G0oPlc4mhk4x//486/PyKDN/D5dYvXFmMZRx+X+ONmpj1zwMhRGwiukfa/G/OWBCjC7p
	34/3qsgCPhKWKLq0UnQgGz+7V2Ad9LL6wRlpI0sDAgOZDQED+lMPRqyoj/PAm/U2dYd15nNAPsX
	t6Xf/cihuR7n/xO6S/4IgYzO3XpDDiALSBh91gbDMPzB914Dg+M9xsMqMsIKoGfnM9JupYKpjRy
	c/CCdum2VApV1GCPN05z4nAkrUEw1rXpmtkOzIV1gJ1Xld0PMhNRTrZhQf3sDssdM=
X-Received: by 2002:a05:6512:3b0d:b0:5a2:c766:13ae with SMTP id 2adb3069b0e04-5a33755053dmr1247760e87.5.1775253795566;
        Fri, 03 Apr 2026 15:03:15 -0700 (PDT)
Received: from localhost (94.191.136.33.mobile.tre.se. [94.191.136.33])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c95288sm1744250e87.14.2026.04.03.15.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 15:03:15 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH 0/2] staging: rtl8723bs: checkpatch cleanup rtw_btcoex.c
Date: Sat,  4 Apr 2026 00:03:08 +0200
Message-ID: <20260403220310.1824969-1-linus.probert@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cleans up all remaining checkpatch checks in rtw_btcoex.c excluding
"Avoid CamelCase" checks since the remaining ones are defined in
separate headers.

Linus Probert (2):
  staging: rtl8723bs: correct logical continuation check in rtw_btcoex.c
  staging: rtl8723bs: remove multiple blank lines in rtw_btcoex.c

 drivers/staging/rtl8723bs/core/rtw_btcoex.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

-- 
2.53.0

