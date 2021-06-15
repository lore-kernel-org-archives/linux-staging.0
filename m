Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5EF72
	for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 11:45:42 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id dj8so50661398edb.6
        for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 04:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5D/6RpZ0CBKmM6q27QzR8lVWMKF+tf59W0tNVEeHUkI=;
        b=RQuzMP4Y7ST0DiBwa2uoK897Wxi8exvgtS9yfYnhReV13YJgv9WoD75eGNmolwY66L
         wTrzUuX89sN/tOKGo3NK7EBS1XtoD7LjBK1BfyM9mCit/tRFj1zn7lCt2fZZ+AaYJs/Z
         eoyWGrU7zRPSRaI3/aoQUE3Q1Zyk96r5/gpyZBGHmXBAu8MV1vje7bhl3G/VEM/UH6VH
         u2Lz2GqDp8DHPTCumRU1D42gPlsshsqtjAWCy5lFOOi1J9qQMewukKomhPCMJPCIRgXq
         g+XY0pHUsF33Mw7ud57EuRYZrzWM4lpshJkJOjqvvY+nl4lYa55lpSgOYB0dUHXF/tRh
         9g6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5D/6RpZ0CBKmM6q27QzR8lVWMKF+tf59W0tNVEeHUkI=;
        b=TTg4ufpX21+rq5RqoTAgEPnvT/0OSToQ81Tt5wQPRNXLplHNmCJgBc8MUNTJ9hAjj2
         5EKV3SeAzNW31C83dZBMvlcz2Pg2kTWx0rcKWU+HFXlS13XSq8yIEzdaovbQDbDGTzDL
         Xd44Y++WZkaCFmZFLJpQTsSkNoJkjo1kL03O1k46LAUHTqhIDj3rnryEH5CyYyecaoZv
         iyvLc/NLmNCUK+iOVOylhVU+hD7KW9j97onQzQcCcGrclLDJRWGIKVBLn3Qac54glJOw
         0/6BR5apFkBNrW1WVoy7JH4H9N7uEYGXjW7Op/FSGk37FstDZm3yRfM2YiNjn2Dva1lC
         nVfQ==
X-Gm-Message-State: AOAM530Dr/73FVBQABK5xhhahwSzruO6Dqor2sfhy1YD6cB3UzCwh9hl
	33Yf2V7fOsOkkGkG1IByyQk=
X-Google-Smtp-Source: ABdhPJzBZYD2xGg1ZUBPx6MEf26TO8DAnTN2Zhzolm0qA3msILuY2E5mMOy1P96HM1QVd+Cw4ZNx4g==
X-Received: by 2002:a05:6402:896:: with SMTP id e22mr3640244edy.201.1623757541293;
        Tue, 15 Jun 2021 04:45:41 -0700 (PDT)
Received: from agape ([5.171.72.142])
        by smtp.gmail.com with ESMTPSA id g11sm7579533edz.12.2021.06.15.04.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 04:45:41 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] staging: rtl8723bs: remove unused debug macro
Date: Tue, 15 Jun 2021 13:45:31 +0200
Message-Id: <4d1e9ad759fc4b66fa3309637b3b4c8eb81d2ea9.1623756906.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1623756906.git.fabioaiuto83@gmail.com>
References: <cover.1623756906.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused debug macro definition in
include/autoconf.h

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/autoconf.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/autoconf.h b/drivers/staging/rtl8723bs/include/autoconf.h
index 944a7d2a1e53..aeb9479d1327 100644
--- a/drivers/staging/rtl8723bs/include/autoconf.h
+++ b/drivers/staging/rtl8723bs/include/autoconf.h
@@ -40,11 +40,5 @@
  */
 #define WAKEUP_GPIO_IDX	12	/* WIFI Chip Side */
 
-/*
- * Debug Related Config
- */
-
-#define DBG	0	/*  for ODM & BTCOEX debug */
-
 /* define DBG_XMIT_BUF */
 /* define DBG_XMIT_BUF_EXT */
-- 
2.20.1

