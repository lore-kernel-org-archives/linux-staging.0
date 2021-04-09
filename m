Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADBB6D13
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 12:40:14 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id r12so8439724ejr.5
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 05:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o2hUyBNJx1Jb8VgZ6GiR+mEMvZYh2PnrFc9dZsVatss=;
        b=o97L5+nXsRkEGqo/gschV+ZNhsHbj613yxVG0O7vPFD8m44gdvr+SrDg7Cm6dWPWdL
         QDiJbhb0Vuxcvv1zXc1zp5dKji5NzqnUzHODogk8gZrnuu1tos+pQ7Nd04Ag6ZMByFeY
         GWFXJZrwwGgvq9jfADV9CAxKOSzUYiWFG+ghzrxS5gCA7wxzpJvt/AV/bigmy8iFv9nH
         ZLNOrmqTc/gsTvoSZFed1kq4OISMoZJQZDB0/Aamk0jZ4bxMpHPzXj/xTfvGhWZqX64u
         +CTUXEQrDcsseQLRUC/LctDc9DXcJxT1b+Km6RJtcMiheSLDQ5fuBGLA2zsMAUAjoZzr
         KFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o2hUyBNJx1Jb8VgZ6GiR+mEMvZYh2PnrFc9dZsVatss=;
        b=lWvcu6/PaVJOI43agyXKMCXYK04/g272nryK+kQRIQYaFtsH5YhQzK5V+WuzeY6Mg/
         m/ywsEFedNS5io+JIblJwswGHddwMMqB8P+pvezSycO5oD5DF37bv6Kd9wWJGIk+9p2x
         X0a3+pMqTXXjV6l/Zm7Yq0m0VrOOJapTM/bIebSHeQTQZcU68iN7XP19FCHMJHJqYxjW
         pmmuEduJTCWNt3DwkWd1Jghnr3hQW6IKC0QK6TXwQxDBeBxJJa7OL7alfKKkcq2Lwjcn
         EurJRE82Xy1nRbLJHvR7ALIRFSCtLNcMBqo7WW5UJzSYMX9u0QyciR5r2fs3boIS8U7W
         2CHA==
X-Gm-Message-State: AOAM531kdpglLBpgYVWqrgTFMyu/pjtEHlG5duHBhp/yACdm0mGkLSeT
	Q06u5s+cz8KXKo/MowZAE1Y=
X-Google-Smtp-Source: ABdhPJySvH9U/9b1caQCa4KS+OHt8wFa30UCV2Q//AIy+i7A5VcqT0/PNz+HzLMlO7JuejUzyw01SQ==
X-Received: by 2002:a17:906:eb49:: with SMTP id mc9mr6583329ejb.67.1617972013081;
        Fri, 09 Apr 2021 05:40:13 -0700 (PDT)
Received: from agape ([151.43.204.41])
        by smtp.gmail.com with ESMTPSA id jo12sm1169167ejb.52.2021.04.09.05.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 05:40:12 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 3/3] staging: rtl8723bs: remove MSG_8192C macro definitions
Date: Fri,  9 Apr 2021 14:40:03 +0200
Message-Id: <97f38f269e8dabb3dd7464d49022a62cd9773657.1617971593.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617971592.git.fabioaiuto83@gmail.com>
References: <cover.1617971592.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove obsolete MSG_8192C macro definitions.

MSG_8192C is a private trace mechanism macro and is deactivated.
(i.e. the default behaviour is _do nothing_)
The only way to activate it is to manually define a debug
symbol.

So just remove it.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 4c159c1a0747..65e1d9bd7099 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -131,7 +131,6 @@
 	#define	_MODULE_DEFINE_	_module_efuse_
 #endif
 
-#define MSG_8192C(x, ...) do {} while (0)
 #define DBG_8192C(x, ...) do {} while (0)
 #define DBG_871X_LEVEL(x, ...) do {} while (0)
 
@@ -196,11 +195,6 @@
 
 #ifdef DEBUG
 #if	defined(_dbgdump)
-	#undef MSG_8192C
-	#define MSG_8192C(...)     do {\
-		_dbgdump(DRIVER_PREFIX __VA_ARGS__);\
-	} while (0)
-
 	#undef DBG_8192C
 	#define DBG_8192C(...)     do {\
 		_dbgdump(DRIVER_PREFIX __VA_ARGS__);\
-- 
2.20.1

