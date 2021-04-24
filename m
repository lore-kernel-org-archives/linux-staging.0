Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E767171
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:02:51 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id e5so22022668wrg.7
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sc8HgTLbiRFbrMbWcYG4U/VQmwhqHIp2KM2VpwNB9S4=;
        b=DINlL7cgdm6ofNHkSC+4Uz4h7mlrgtA9skOb0zJolT9S7+z7+59WrgE52rybuJC6qg
         IGk8k+sbvY6VgYIUs6Q1aI5ns/vZEsKnsBS7jmdsjUmfCr3tqEjM9MVHlHYXEHZKJC1r
         i36YXZqV7nevohk7jW2B/QmGH8PPu25+mokKw+0K98volwtbG27KiA5bHAbe4rDE7clX
         Ik4qzA7kYbVL86AR48Pti11c/9kIP/K0dQHlsGt++IChQ2en//+EWb0A6vzz1UmSOBWK
         0ReKusZ8dMDMYMiohFQl6TyEWgvvDOq8eVyM8HIh+XsIU1AUBTMV9gfsSfhjkAOjdZJ6
         7tMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sc8HgTLbiRFbrMbWcYG4U/VQmwhqHIp2KM2VpwNB9S4=;
        b=XT+R0UKZ+KyAhEpOW6ct/zHJtjwnnSIcw+nOFmcl2DeJ4dnTx6Nbvjp7D6vgYlXCqW
         YDhGtIVfmzV96Meai/sugkZKkbbv/+bVprG/HSSFwjbbs+mUD7DBLFs/qp75JMHRsK3O
         vdXLoOqf22HXNQidhs5sHDtbpzP3tN1jOaCzI98b150Vf+KtN5Mc7zaek23i3Uas1Ggt
         dysB3qyAMITJVjH9L/9RisowGU39ddg8CZU3Aod1iAi5YzxL8BJ18zAW4+b7MY+ozxm1
         6/GI6Y1m6c7UQta3aDb62boDUaLn6dqsVY4hnbNz0+llbezHmXnfRakzlqpmUMzcfAa6
         YUxQ==
X-Gm-Message-State: AOAM533e/x2XaK1yMZqE096VzShhKo0ROlI+I7yvdNmOauBL28AdY8aH
	ZhXnAMd4ZnHWP49RB4DZ6YA=
X-Google-Smtp-Source: ABdhPJw15ct2KKVN9ZgqIw9JvwQbRPxI7aUDyOQ4TUjHh74IcqT4CixUw8LfsOMKQK7SYBP4UKCZKw==
X-Received: by 2002:adf:e741:: with SMTP id c1mr9698000wrn.49.1619254970548;
        Sat, 24 Apr 2021 02:02:50 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id l12sm1130404wrm.76.2021.04.24.02.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:02:50 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/50] staging: rtl8723bs: remove unused RTW_DBGDUMP macro definition
Date: Sat, 24 Apr 2021 11:01:52 +0200
Message-Id: <5efe991636b899936f39a7efceaac9edce9da91e.1619254603.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused RTW_DBGDUMP macro definition.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index fc187a4ed2c3..c7e8187ca7f5 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -144,8 +144,6 @@
 
 #if defined(_dbgdump)
 
-#define RTW_DBGDUMP NULL /* 'stream' for _dbgdump */
-
 #endif /* defined(_dbgdump) */
 
 void mac_reg_dump(struct adapter *adapter);
-- 
2.20.1

