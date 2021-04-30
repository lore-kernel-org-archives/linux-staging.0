Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC802F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:30 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id n25so9410722edr.5
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 00:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y6sZe3osaLDDSPNYI5JYp+0cY5GbbYZW8NCqEYTYFpk=;
        b=BONAVKhuvsiBzo1U1aG0am/ap2s1ljf2D+UpwoEyYvtskQSzCTZIMofkJj4BhBcmy2
         5EOD4HyQHgHhH9qAEWZmsBAA7T3eBecuCRkCczlx45HcF5kHKZZHGDuKyR5UyknCW2J7
         HdELqgsn38jgfkC9SUNksO0MXEhB+WPAp+zLcHkmG7IBN86gbRBIXr6CVEOePAb5R5qD
         B+J/zknZxdry8S/l9wgpE1GjSr9X7NREXRvtpZ10wn4z+6WiRlTAHzmoMxb9FjgBjhdo
         KZ1AUTraKByDjbrZyMkStaEhYt7p/vE9exLj8pGdNTMjyOiJjicJlkbzxnKj8MjLZb3M
         dIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y6sZe3osaLDDSPNYI5JYp+0cY5GbbYZW8NCqEYTYFpk=;
        b=kR+LCaT9wtyF+Q7hFmOJVBa3Dkm0mng7IKE4fqg6Qz9j77zE7jrMfxzxZVWYFgDpCp
         f+WgTf9kRF1sqn+zdxaQWTT4+n7/QSH8DJchpRUwtZA/CbR9q5sr+jf8EuYMpX5robb9
         eDYUsbLMIxgJX5kVJPMP5Tm9xqwMA3DN1WhNRz/JCRqfEUSErGWt3aR1aQuwqhtIRwyY
         UKrOjS40PhxArJTqYWlPcc8/jho9URR4UGfuwp8DHDYvmyVokG7ncmvmdM400CPAmF3B
         VJPgvqmRQHpwF0y/0KZzMzdZopEy3Xj4Z1xNqJXoCA5JTnmnt1ihITNoL0T/dachuZ6N
         WcKA==
X-Gm-Message-State: AOAM532uiChvvLIoR0q6D0YdVaaeMyZdQ4zYFVnxehS1tc6+e2CIccrH
	1rPXn9whIb77Oub62D+zbas=
X-Google-Smtp-Source: ABdhPJz2IvIATmKxe3qWO1+dIup+hKj1AYfuRyCy70ca3SxU0s+mtQa12nmAOlqe4ZVPQHYnsh5UYQ==
X-Received: by 2002:aa7:d5c7:: with SMTP id d7mr4199146eds.114.1619768669368;
        Fri, 30 Apr 2021 00:44:29 -0700 (PDT)
Received: from agape ([5.171.81.86])
        by smtp.gmail.com with ESMTPSA id rv15sm1426820ejb.83.2021.04.30.00.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 00:44:29 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 15/43] staging: rtl8723bs: remove empty ifdef block
Date: Fri, 30 Apr 2021 09:43:33 +0200
Message-Id: <edeea4e312d7efe459d89f8e6674962470db3f98.1619768150.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619768150.git.fabioaiuto83@gmail.com>
References: <cover.1619768150.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove empty ifdef block

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_debug.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_debug.h b/drivers/staging/rtl8723bs/hal/odm_debug.h
index c359eabebb67..8ae9948fb0c6 100644
--- a/drivers/staging/rtl8723bs/hal/odm_debug.h
+++ b/drivers/staging/rtl8723bs/hal/odm_debug.h
@@ -95,10 +95,6 @@
 	#define ASSERT(expr)
 #endif
 
-#if DBG
-#else
-#endif
-
 void ODM_InitDebugSetting(struct dm_odm_t *pDM_Odm);
 
 #endif	/*  __ODM_DBG_H__ */
-- 
2.20.1

