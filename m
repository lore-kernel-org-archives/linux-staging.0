Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66A925B0A4
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 06:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778567720; cv=none; b=Pa9uC+nKtdfSeXlzv0r8YuwT76wgCVOqtktMEdbaWQzn8yM3cUBFeC680G7XD1rRPM84exIBTJUppB+1f9eXUTeUKj4KqU/gwJKzlNm+tbuCcWAHc3XPlXMp8eNhHCzBdgFbQq5B1PHeARqZ2a+SA8k7d03XlbeL94go96q8RD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778567720; c=relaxed/simple;
	bh=2doWczqNtnCVGsUAUmmyk0SfDHaoSrWEhkfH1ShARKw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DdcyTlDKrg+gIhqsA8viGxdvETmIeIT2SHCz1+qVaddCPRfolrur8HPhEqZIpufJalebE3MxAtMlNSBSlsi6koCHtz6Y/i9k+WLfftd6Ohke9i3HMZDKVp4dNzzcLf3nrjVfDebRPBWvtG3IjaBmPBjtjJY9+kJxIRyRWrHlxME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gl5LBkKN; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gl5LBkKN"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-834f1075805so3603360b3a.2
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 23:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778567703; x=1779172503; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hdBRmXm0EN9CDrqJgubz6nI5ID1Ljz0DfpQ5I23ebu4=;
        b=gl5LBkKNyjB3Dz0H8xwVXfdEq2U0oG7Fp3CtAmA8NU5sgzmDjV3zuoffYf7slEn/qH
         lLpi2sBFcy9/faUbwDm/hPlWr/LALvJwZHm2tQa/or/ZDsnUZBRDYxcl/mLuZivoYIME
         OLfjthOeui2V6ng0K4xeA9AgiI2WW5rFr/vtgl/7/iRHxuMQpLN4239NuvDF91MuSFeH
         J5m9lb4CbpCiKBPoen/zrp/u31LeRAjPMm82l+OshLzR6ogQYSfPlloHnhALrvmF3IFs
         VKhJQXx31GTdhYuUZi3cIgsK0FYMR80sig9fV5cr3UQDBU7wauH2JMENkbmbRwwm9DRP
         QVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778567703; x=1779172503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hdBRmXm0EN9CDrqJgubz6nI5ID1Ljz0DfpQ5I23ebu4=;
        b=JFnjwkRpIcafT9m6GWFjW4MeBXEcEYqEM9Uz7wG1mC6AlgUk4T8LcJjGORJDfDypsj
         WIFqUCqw6Dy5cHdFcKyf4E7Vsnz304M79GxVIKmcJJMPQPO7RsadBefXqMBtqcMw0JDY
         wZEBYS8/qlUhNB6CS53Ge64hJ33JD/PCrRbuMx/RrlM+6n111IqFLomjOwWZ6uJnXaBL
         XVOOnp06fRp6rXvPn9lmQNMLX6MvBLSXhSqZzMf949AOLixF3RktebWUMsaEu9AdNwbz
         aMZSJkIDSw9wywekEiOYAn9ecMMKrG6v/rBjEeQeQIDLSbrkYp0jG1rxCKhgn9RG14zn
         aSCw==
X-Forwarded-Encrypted: i=1; AFNElJ8mP7VBDMvFU6NKPrOY9L0moW5n0BdsGmfxtYANqYwh03gOnJsxvVCwxBExyENt47HgJTy1nwv4AnPj3863@lists.linux.dev
X-Gm-Message-State: AOJu0YyagRgNu6pkYK4drAXNlK4RCvRHkGtNbfV3I3ceTRycmrk1Ngnm
	ygi0sCU+ftSdgvKkHg/eH3/Jeji21Yj7P6Cfibkd8ZXa/duLluscfZ/k
X-Gm-Gg: Acq92OH57Z+SRIHzj/zdRr6RNkw/yFgKSDqgt/48hGc6xcZWfO0jCUBuiJcfNB2/Brq
	RKkfOQ1RTr26EhR4RBzxj8SzAwOdXs/mOpcZMrzVKmzrqoLWmpM8j0STDHQwvOZf6HwDVfq+Ata
	Jm9V+DOwrvShRNDkCAg3CTU6KhWR7X6JJT3+ODU3xdvumKCuBAzyFuUWYtaWwrIYBilMn8I+BFb
	CaASqC9T4jeTa84R3pBSRDnxNDDbOR39MBcvWdZxu8nu6SYa0d2foaPk/SN/VSlTb6aIum7IMSl
	NGg89uJ1yP95zlZjC1Ki7gIbKcxydKf5XKEUHqB13+S03vw6RESIVuDMDoz1qbpFf5vXi/0CYCq
	j84iS4pa4LMAEmaY0QgdZR5zYSvsg+Zsa6S/Qo7NRajlP02UBGp2pmWRq0iG6IhnszmdpGU95Jh
	o0sQSMkeOYBkQ/xzKUzg5Y0/BBAvN5OF2eW9xycVjuQV80LiPPi2JhfiThqhdcrVz666/V7ng=
X-Received: by 2002:a05:6a00:2e87:b0:82f:5034:77a4 with SMTP id d2e1a72fcca58-83a5c4be2eemr27641558b3a.21.1778567703220;
        Mon, 11 May 2026 23:35:03 -0700 (PDT)
Received: from localhost ([2404:7c00:52:d485:aae2:91ff:fe57:5e15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965d36c10sm27475783b3a.25.2026.05.11.23.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 23:35:02 -0700 (PDT)
From: Chhabilal Dangal <yogeshdangal66@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chhabilal Dangal <yogeshdangal66@gmail.com>
Subject: [PATCH v3 1/3] staging: sm750fb: remove unused <asm/mtrr.h> include
Date: Tue, 12 May 2026 12:19:55 +0545
Message-ID: <20260512063457.80882-1-yogeshdangal66@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sm750_hw.c includes <asm/mtrr.h> under CONFIG_MTRR, but no
mtrr_add/mtrr_del calls exist in the file; the driver uses
arch_phys_wc_add/arch_phys_wc_del in sm750.c instead.

Remove the dead include.

Signed-off-by: Chhabilal Dangal <yogeshdangal66@gmail.com>
---
 drivers/staging/sm750fb/sm750_hw.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index a2798d428663..f491d3aca468 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -13,10 +13,6 @@
 #include <linux/vmalloc.h>
 #include <linux/pagemap.h>
 #include <linux/console.h>
-#ifdef CONFIG_MTRR
-#include <asm/mtrr.h>
-#endif
-#include <linux/platform_device.h>
 #include <linux/sizes.h>
 
 #include "sm750.h"
-- 
2.54.0

