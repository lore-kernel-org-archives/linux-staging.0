Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164291100
	for <linux-staging@lists.linux.dev>; Sat,  6 Aug 2022 06:09:47 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id t5so5631591edc.11
        for <linux-staging@lists.linux.dev>; Fri, 05 Aug 2022 23:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G8+xp6CTSirrV4c005hxKlVzfV8/Z9ZKPx/4fznm5Fs=;
        b=qm/O7bVoyDkHehE0iPMgiaTuAFSxuvL8uWOMPJnTJvkXUlfi59RTM9UjN7MZ4/z/Ok
         0Xizcy4D44lj2whvjpgcoAdRIU0u0pawZW6Klw4N4V7KBgbsfFCIPEbPPw4JnCSJCRRN
         9K4S12vDtXj2a0jAB6zsjy9ie178iPgtV0VCzon9zEAwJ2JPI4rjDN4T9rc/6sLCsgZH
         movlXm7q4BvZxLVAMVMwKMRwfZI+a0sMS6vBCDijnH/YxBzMJHKsx4seOqZWHmNFTOlu
         /z6NF/S/6X07uA378LIMjSHcmh5R8EetkVqyA+tOcwhjLEqJOzbXhT57s9GzHTa9mHss
         SG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G8+xp6CTSirrV4c005hxKlVzfV8/Z9ZKPx/4fznm5Fs=;
        b=ceYYRXXFPELAD5nP0QEBWqR2MPYuA2rciu25kw9EZGEI/4sg43tmssIif4qaYc5TYV
         STZINHCRWDeMUt6uVH7EMU/a1gd328LmjqSrjweuVyvouERnwDHB+Jw9AM89Ywjb/yVs
         y27uqemEs6PBm8LzezMZVo3ryqWuoZdnqQlKr+2sSloObCg8WO6Gt/ha250rEVvxXTFd
         UYyTaY4Y0DEHPI3zKSyj+PxcfXMLZJLaeu5aD5+XDcVXNT4OsVzuEhgk7XBbiq+e8vxA
         2QWXZwgCsv674LUCGk+HZtHrP7lDMhkfqiJput3e7fc5g0BYIdh/3eIJCbqj9aZ5U7Do
         P4/g==
X-Gm-Message-State: ACgBeo2ShTk8tSVuHNLOrkQHGT0FWUPkMQB0hQq5yoLUZIS9seIcXMSZ
	qn+efzAwPB0XVL7h67/tmpI=
X-Google-Smtp-Source: AA6agR6kHVI5r9LkxD3Z/MhoIZc89eS6Hr3svWarqPsCS9gOi+bQEi0QxT8flVyhGJOjRuJNnAXU9A==
X-Received: by 2002:a05:6402:348f:b0:43d:e568:97bd with SMTP id v15-20020a056402348f00b0043de56897bdmr9278639edc.279.1659766186404;
        Fri, 05 Aug 2022 23:09:46 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abba5.dynamic.kabel-deutschland.de. [95.90.187.165])
        by smtp.gmail.com with ESMTPSA id p10-20020a05640243ca00b0043a7293a03dsm1002357edc.7.2022.08.05.23.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 23:09:46 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/3] staging: r8188eu: use ffs() in phy_CalculateBitShift()
Date: Sat,  6 Aug 2022 08:09:27 +0200
Message-Id: <20220806060929.11022-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220806060929.11022-1-straube.linux@gmail.com>
References: <20220806060929.11022-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use ffs() in phy_CalculateBitShift() to simplify the function and
improve readability.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
index dea6d915a1f4..3d8fcc1f0b6a 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
@@ -25,13 +25,9 @@
 */
 static	u32 phy_CalculateBitShift(u32 BitMask)
 {
-	u32 i;
+	u32 i = ffs(BitMask);
 
-	for (i = 0; i <= 31; i++) {
-		if (((BitMask >> i) & 0x1) == 1)
-			break;
-	}
-	return i;
+	return i ? i - 1 : 32;
 }
 
 /**
-- 
2.37.1

