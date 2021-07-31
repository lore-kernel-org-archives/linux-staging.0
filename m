Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A4A3486
	for <linux-staging@lists.linux.dev>; Sat, 31 Jul 2021 00:24:00 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id k4so2523474wrc.0
        for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 17:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2g9UxZdEMaE3vJpbZr7oUx7+ltJAKf8EpUn9f9NHS/M=;
        b=tDUzHE9F5VKYFHLG+JqcR6W1Tk3jroM48O/zhCTNz0hL0PtS3/vd4oZ0e1iotWbk+o
         +4Kucc4SdoJBtnDODJyIBJcsCMM4jbl5rMiW+tOYNR50LJceSMe/0/cawq6tqEIMtBBA
         X95D/7sH3ow79EYXbr6qtZTeAU6e+D0ciM6bY+iWYH6wEVE9p/RTQhvjmqIh8V+dIffs
         gSZ9aIlnsvnLJR0xJwflCDj/al4Ql7T5GGgpLyVm0x9AtSEnkyvESU+EPcOmfpCygUgj
         Gkx1fuwiyM/oizJENQ5VzVlgmfsrQWp0Cs8uZfhKm8I3sMKUWnGi8b+FB3BsbFqpDnWj
         kWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2g9UxZdEMaE3vJpbZr7oUx7+ltJAKf8EpUn9f9NHS/M=;
        b=X0KQe7OKWcjaBB0FH8dy4XvY47bXU+naLJd98eHE8pZFAKICXCoRSUCb1wudbwwhaB
         CIjczcBMHaUvT3jQCBldxprS9JBRbFW1onvkPhHIVd7hUrFQYnWfuTF7Nay4W86g26wS
         3a6KF4lKjCjX2LajRHQp/vq7YPwqi/S7Lc+JxXD2qtY6HoL3KP56usZDo9mbXPbBpVPO
         AIpZHVoBXd6qkiyDr4luis6ZXTsMDbWeUmM7pFLYeC/wNSk8Hbc353zBC07wJnixp59m
         cSu/xVBFYMaktXYWokYYHnNa5UUMJg8r2io9AzZWgjQYqg4FKJ7AX3/iT+toBJR8rRpe
         63LA==
X-Gm-Message-State: AOAM531E5j/Pnf5AqVBVFEx5886GIveXcNQeZHDJiXQyQdJjSXqkt+NR
	EYV7KaE9GkIDXdi7mpDo3yR7cQ==
X-Google-Smtp-Source: ABdhPJxJrdq3cu9ogGW8zQYmGUxG+Z4jjERVvTy24sNbxGKObEVYOe62SR5fNvOVe8unRX8i8l+hbQ==
X-Received: by 2002:adf:e10c:: with SMTP id t12mr5695730wrz.36.1627691039097;
        Fri, 30 Jul 2021 17:23:59 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id x9sm3236011wmj.41.2021.07.30.17.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 17:23:58 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/14] staging: r8188eu: remove ASSERT ifndef and macro definition
Date: Sat, 31 Jul 2021 01:23:44 +0100
Message-Id: <20210731002353.68479-6-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210731002353.68479-1-phil@philpotter.co.uk>
References: <20210731002353.68479-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove ASSERT ifndef and macro definition from include/odm_debug.h, as
these are unused and therefore superfluous.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/include/odm_debug.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/r8188eu/include/odm_debug.h b/drivers/staging/r8188eu/include/odm_debug.h
index ef0d6b84b2d5..c70fe73e3339 100644
--- a/drivers/staging/r8188eu/include/odm_debug.h
+++ b/drivers/staging/r8188eu/include/odm_debug.h
@@ -68,10 +68,6 @@
 #define RT_PRINTK(fmt, args...)				\
 	DbgPrint( "%s(): " fmt, __func__, ## args);
 
-#ifndef ASSERT
-	#define ASSERT(expr)
-#endif
-
 #define ODM_RT_TRACE(pDM_Odm, comp, level, fmt)				\
 	if (((comp) & pDM_Odm->DebugComponents) &&			\
 	    (level <= pDM_Odm->DebugLevel)) {				\
-- 
2.31.1

