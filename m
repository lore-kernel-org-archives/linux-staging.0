Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F881A682E
	for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 02:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773540601; cv=none; b=rwnWiMUiyvRC79c44zfAfNoyJfTL940hGOumXo1K6dFIgGIIlQKl5LwaH/CnRUL8m15RJRqj9U+jzHR10zvv5R3jGPpACE2OImvTkrcYTIMrlyTJj/g4zttisaHgGDx9jjKBRkMwMmsMEM7SP/Ows1UFQJwxFhoJIWBAfrhf+Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773540601; c=relaxed/simple;
	bh=JX17FSgSzkSUPOJsv1PEoGqDf3V3TdqyTBt/4H6jkVk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C/N7exy0Pxs0ARtOARsbOQ+oGDzWdTAHLeY3ynQN7w41e+c9j/8ZoHMoOT/ZqX9/x223zssKv/dR86UIY9F1bC8sDO1BUN0tuTP8fE7G5Hh0uibDeI3nimt3u2B2yUNNTNw2Yv+tqBCfvtsA9aW8OjvZ/2gpg9gIBxLeedz8uPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jKnEEJLV; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jKnEEJLV"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso2014259eec.0
        for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 19:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773540600; x=1774145400; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HrPPIZ/iaIOTNwxZclcqlOhcYOPkTpHFarAR9QoSZHo=;
        b=jKnEEJLVfy+GhUm9MkhjtA5wpMXzK0TZm20fEDbDQwamHIbVxxkyJ8XgoEzWBkblz3
         +TsPPYV+fpRrWSAOUv0Oc809kJLis+lxl1t8gh98LRN1Q4UIXouVPi/oQ0D0A58p05BJ
         NUTAXtFIDBZtXLed63Yo65uR8ASMotEMLbe6dRJU75N6YFQy7ATIiUtS2VUEjXlE0ZmR
         oN+M9p//wf7Ce7U2PZxDRPtgGrT5+EKh/pDVKgq2ra5v/q6SYZhzmcMLzhGX9lBoBPL9
         u4pa4jArnjZZqziLkxYOA28P2/UAC64HRGKkPXTDCEB9DFrx9EGCDYRwGimuCxDXLwp+
         VbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773540600; x=1774145400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrPPIZ/iaIOTNwxZclcqlOhcYOPkTpHFarAR9QoSZHo=;
        b=E7TxtDeO7ikvwmgdbKcfdt9cZn1yL6vKU8qkHxHcz2V3RqVu8fKprwjMOi0AWTX5ox
         ACn3j6h8L7LmxKB1Xv+CqRS83DAbYUggOTuZkDGXby/vWzMituWkqNgr+2sFmgKkUzey
         jKdsWiioJ0hFROJdy7GbDv38y7UygksVgYKhe90BESB8aetJjursZLIpj/dcnyiaeuZR
         iy2nwwcsiDhhn9dVEJOaf2sH0xrrDuDW5D1OZ/MZYnwLMGq2QDnnwefzsnMU+OvYiWNf
         6s+Ol/0iJyW8MGscccv1xxSMaBbkyIGpsboqvQIt4ANAEJ1DdvoeXlsowfaTRME5wODv
         niHQ==
X-Gm-Message-State: AOJu0YywwBhEU/M6DEZmkx1ktszCcP0J0wwDreUTNJYbgpP55EJTfAnF
	H+ASA9uGlOfOkBZ6nZbJQwG/exp7ZqpWZCVwK7JpwsY1Zr4vI2ctNsYUC/yf1w==
X-Gm-Gg: ATEYQzz3e49E0kkkTKSpw2k4RB/n+bjUD2sZ8pVK+L8nxESKbMUN75WTAPCSxBY6vbg
	OW6LVu560L88JwV6gFN6s6KyKbqg1wTRbpUGZ1Smcqz6iJ2mX8b1DUp0goBcv43J2bf74YdraVk
	+mUf6PQ9eHPDjKPYwLedGZArjjt04lN1EgJebnNR3F14CrAhP2YG70J6yhVUu9b/U/is5oqyA6Y
	zBy0H28A6zYDuuXODSnyGuxmD0UdOHIWfMOKfljnN2F0cLF3SSTOjSZFgJ9dK4ZMPxYwB4LOw+9
	Si7lWpgNTC7ZiEXkv2zd+ONJ9bsGM7DTwt2HNX0sLigS2GYMy5nRJQm/E6RgHEcz4Uq+RXQOtEf
	XtQug2z4Cvsel/0wD7o5zqXG40Gofk+zoPGc3gHvJGRB0KSlZmjhOtosQT0DVyWEQ++anWlPL+s
	7vtO/yGGtbat2Lol7/C9RK8at9hlyS/Peismbb8rxcmCVwTDA=
X-Received: by 2002:a05:7301:3f0a:b0:2be:1a8e:10bb with SMTP id 5a478bee46e88-2bea54e71bcmr3541090eec.12.1773540599570;
        Sat, 14 Mar 2026 19:09:59 -0700 (PDT)
Received: from mjmachine.localdomain ([131.255.96.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab526f9asm11012192eec.19.2026.03.14.19.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 19:09:59 -0700 (PDT)
From: Marcos Andrade <marcosandrade95963@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ethantidmore06@gmail.com,
	Marcos Andrade <marcosandrade95963@gmail.com>
Subject: [PATCH v3 0/2] staging: rtl8723bs: Cleanups for rtw_xmit.c
Date: Sat, 14 Mar 2026 23:09:47 -0300
Message-ID: <20260315020949.50149-1-marcosandrade95963@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series cleans up rtw_xmit.c by replacing magic numbers with
proper macros and updating the sleep API, as suggested by reviewers.

Patch 1 replaces network magic numbers with EtherType macros.
Patch 2 updates an msleep() call to the new fsleep() API.

Changes in v3:
 - Grouped the patches into a series because patch 2 depends on the 
   include context of patch 1.

Marcos Andrade (2):
  staging: rtl8723bs: Replace network magic numbers with EtherType
    macros
  staging: rtl8723bs: Replace msleep() with fsleep()

 drivers/staging/rtl8723bs/core/rtw_xmit.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
2.53.0

