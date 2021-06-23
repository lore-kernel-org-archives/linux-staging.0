Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23AF2FB2
	for <linux-staging@lists.linux.dev>; Wed, 23 Jun 2021 23:49:15 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id j6so1779212qvp.3
        for <linux-staging@lists.linux.dev>; Wed, 23 Jun 2021 16:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h9afo+4mJE2XyS+iGuDebe+DFgAEacVkP6XxTR+UnoE=;
        b=vVfnXZpNBxOJEiPYEQwjxcu0/VHE6nkVPkzCpWgjL7sv66Lw6b3O13540tS06GnpaH
         iru9piJ01VDYbJ8CbrIicH04Jh/n3iy0nd/1qRFZVqHJ/LDlHOI6E5slRSlSEr7w5Ci6
         T9/HOhB/iSFvG/WWT9oqU5BlJ50IUIw3Ec1FQVfSYtpbki6CXMUsyHkVOSHvtGUYt7XP
         Vahc3QMiyHPjZb45luz7hsIyagcAz0I2reTQOVC7HO3M3lwUDC4AQzbw3JlXWUmRiUFS
         zVfvNYLlOMuLsYrvmDjzxYTL69InFrzKZaYfcd306HmqhzpNgPf9gSrm3624sUj+5cp4
         Abag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h9afo+4mJE2XyS+iGuDebe+DFgAEacVkP6XxTR+UnoE=;
        b=qBAoMjG85Cleu4EqQToFezRLCZky6JMxi/8f2oYpz2kCNH9SJfCkqKl4K4jm88fUjC
         SvVqHnmkqdBHvh5MGcU15iap9hoDiZT4tmTnnNSKAtGuhYlf3S04BtLlh8/Oc0ab3S5L
         r+1HrHO83p7QBtRWwPSxONey8i1Kv/TmeAdObP0q5HAj+jQNgqQhlHSQukBKFYgHGImk
         +cQbJaSmOHSI9XGxDi5G3St2Ie26q699irIb35Te0mJo5goDY98qlEeLAUCbmBfiUlSE
         FnZQwkAUhSaeyHMDRIFpwtlLW8B5yQV0QCulQ13AxA6e5tEAPDLowtNsA04XVfA0BVsh
         GJ3w==
X-Gm-Message-State: AOAM530FgPltyqfBWzIIpJohtMIkp3sp9kBDRENH6/h2CAhE8qcsYRZs
	+5kFxvLmJcb6yaTBrRB5AQdToQ==
X-Google-Smtp-Source: ABdhPJwYy9ZX56NcudFTMjbp5h1K1udUYMazzW1WiQPbt7dbpoXKxQaIUh2SMnGWrZN3npJs0DueTA==
X-Received: by 2002:a05:6214:b08:: with SMTP id u8mr2578429qvj.52.1624492155165;
        Wed, 23 Jun 2021 16:49:15 -0700 (PDT)
Received: from kerneldevvm.. (5.6.a.8.a.a.b.f.c.9.4.c.a.9.a.a.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:aa9a:c49c:fbaa:8a65])
        by smtp.gmail.com with ESMTPSA id w2sm992387qto.50.2021.06.23.16.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 16:49:14 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 6/9] staging: rtl8188eu: remove DBG_88E_LEVEL macro from include/rtw_debug.h
Date: Thu, 24 Jun 2021 00:48:59 +0100
Message-Id: <20210623234902.7411-7-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210623234902.7411-1-phil@philpotter.co.uk>
References: <20210623234902.7411-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove definition of DBG_88E_LEVEL macro from include/rtw_debug.h, as it
no longer has any callers and does not follow kernel coding conventions.
Removing all such macros will ultimately allow the removal of this file.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/include/rtw_debug.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8188eu/include/rtw_debug.h b/drivers/staging/rtl8188eu/include/rtw_debug.h
index a1b25ca16d28..ac123ddb8acb 100644
--- a/drivers/staging/rtl8188eu/include/rtw_debug.h
+++ b/drivers/staging/rtl8188eu/include/rtw_debug.h
@@ -58,12 +58,6 @@
 
 extern u32 GlobalDebugLevel;
 
-#define DBG_88E_LEVEL(_level, fmt, arg...)				\
-	do {								\
-		if (_level <= GlobalDebugLevel)				\
-			pr_info(DRIVER_PREFIX fmt, ##arg);	\
-	} while (0)
-
 #define MSG_88E(...)							\
 	do {								\
 		if (_drv_err_ <= GlobalDebugLevel)			\
-- 
2.31.1

