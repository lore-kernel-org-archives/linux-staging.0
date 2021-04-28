Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8902F80
	for <linux-staging@lists.linux.dev>; Wed, 28 Apr 2021 07:28:12 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id 26-20020a05600c22dab029013efd7879b8so6617634wmg.0
        for <linux-staging@lists.linux.dev>; Wed, 28 Apr 2021 00:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=inaZ11OshVUyUcdzLFDTaYvVRptIXVcvuczMgFqs544=;
        b=AAXaIywtb66F4KWBO70Z+UEAm60DjqqIOzhYSEdJGLLCQ1d852aL5f3kzf+TSFOAgL
         6MYs/4ZmDWlhHFhp23W90MudYErdst7mwA7+OnSwBp9ULeDcfpT410N7nH8/YDXPCk6j
         CeS/fBeKXzBB8CJenjGxup1Nrcwf+d33j4z+x6OHULrs8tfJXoBwJAV3Ux5kIce066rO
         HUcyz8Ma7m9Mp9LB3/dC1N2il7//zpCy72V/2/0VH8DzUO1deuoq07emLDoP0y49wcL7
         B7lBy4QuKPwhpApCMeq7y+MV6fx14VLStphAm7jl5LQV8li3O0Fq0R9ria8u790BgxES
         9pnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=inaZ11OshVUyUcdzLFDTaYvVRptIXVcvuczMgFqs544=;
        b=aKctl5s9bi2yYxA5ya8a//dJ8mvljdWBYhKNBtYkXmLz7rYZoz8+cOy8WvPTBkRdEb
         TMgOLJ6lJOOW9yywLWOohcLyH4OewczVFO5HJSynFCnGkrTcsZx693PlaQfWRKiqWT3C
         OSdSsVHRzRdmElh/JmK3HckYjN0Bi6OcC1eR4GjxPmfA14giKLKTMOHvdqW7+rzOdCqY
         hyyhkkCHZrw+rKz9JWrd1j4nver8VZJmSCb3js3aI53ozAANQ+QOahc9SIa13U8BAQE6
         uWvlrz9ZokSGiSRTx22hfuXUO7Vq7gM7JXSn1woTiyDgMr7runEjvRmwx3ftIY8tBFE5
         3fyQ==
X-Gm-Message-State: AOAM531dkHaYzCNKVslRWZ8rHK6nj726Ql1Q9xQfZhPCD+UoX8MBxlVB
	IE9iDsAzyjZIFB/mvWj0iJU=
X-Google-Smtp-Source: ABdhPJyPItVQLktV27LqfZnn2D+AHVpgGd//euZ4qsJYX6704Hm6HN17zQwChv89MIb2AuZRvz/1fA==
X-Received: by 2002:a1c:7707:: with SMTP id t7mr2689822wmi.76.1619594890782;
        Wed, 28 Apr 2021 00:28:10 -0700 (PDT)
Received: from agape ([5.171.72.119])
        by smtp.gmail.com with ESMTPSA id a2sm7315785wrt.82.2021.04.28.00.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 00:28:10 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] staging: rtl8723bs: remove unused macro DRIVER_PREFIX
Date: Wed, 28 Apr 2021 09:28:05 +0200
Message-Id: <2fac5d7f2334f0a9765f2ddfb31502323e49fce1.1619594707.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619594707.git.fabioaiuto83@gmail.com>
References: <cover.1619594707.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused macro DRIVER_PREFIX.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 3a5b083e95a1..7f96ff66915f 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,8 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define DRIVER_PREFIX "rtl8723bs: "
-
 void mac_reg_dump(struct adapter *adapter);
 void bb_reg_dump(struct adapter *adapter);
 void rf_reg_dump(struct adapter *adapter);
-- 
2.20.1

