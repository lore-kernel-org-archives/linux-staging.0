Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A7D70
	for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 14:24:59 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id b9so8356719wrt.8
        for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 07:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M8DYc5vjzbQ3/FwnNagLMFyG5+xEylbz7fLiJFoVp/8=;
        b=CvHGsD6u58wUGsz1l7aV67caJfTmD/F9EJptANRN91v9gma21viOSpKWxtY8Q1M5Ix
         cKxhi35V/toCfU6AqmR7RnLCqyCJQX+5H/49xZqx9veJPV6iNCDgH6XhJfgf19bOkNJR
         NtTZJ0tSOS9nbr6brW0ucbHA2YR2u0NkOX7upOs32BhxjP9p+4oIKw2SC5Jg9GBnpRC1
         DImMVxfZuhS4acGPIxzx7svHi0CS5aVbzLKL2eCIH0SSryQZcJBR76vmdQOk832O2FhV
         NWbAAjVzz7ZApGlSIo2uE/AIawAniBwG/7EFQSrC0ufLWVJ62cf7tHjNUy6j1+CDcM0z
         4R2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M8DYc5vjzbQ3/FwnNagLMFyG5+xEylbz7fLiJFoVp/8=;
        b=n3HRbW3FhY5oQuocaAvSGE7bL2qBTbbA1pI6DjyiWPFMbWFqhXb9jbG5dfgTaICH3E
         /ckk53UVbG/8KYY1xJ/+/Ke4ATiT/Zw1HlbdzPyMB2G7vaGcJiajc2pvt5T5XXBwjbO/
         m+VFDm1AefyTUno7GveuRwUVcqja/4Bmqvyz/f02cbGKff2DiQaWw8T6gJ7fpFAC6PiH
         mJUVx+TXx4UFE5r9YJiOlIx10NbYWo/qBFFJKg7NKyKXpmc1FV5Wr0EYE/kbM4FT3gp1
         3W24ugtpPn/2kltIhSUFm6QNVEe6Z+RPlHluub/blNypGMeQBxsZj8VKihUSZa+4Xbvv
         tRWg==
X-Gm-Message-State: AOAM53132eB1mRQe2wdHyiycBiyzdz3pwcq46Sg5nGQ6VTo6gqoTA+9X
	RCjD8G5CDDA5oE2gNj3BTR8=
X-Google-Smtp-Source: ABdhPJxP8sVz3IP9Mv5G2OnrkCSfuYtfZ/Gpp/PNFbPTKswC6aZbeMAEyfc70O/JvyozBvE5TVauYQ==
X-Received: by 2002:a05:6000:1b0f:: with SMTP id f15mr20050306wrz.171.1616855098084;
        Sat, 27 Mar 2021 07:24:58 -0700 (PDT)
Received: from agape ([151.46.211.242])
        by smtp.gmail.com with ESMTPSA id i10sm19237353wrs.11.2021.03.27.07.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 07:24:57 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	david.laight@aculab.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 08/20] staging: rtl8723bs: remove unused macros in include/hal_phy.h
Date: Sat, 27 Mar 2021 15:24:07 +0100
Message-Id: <a001f2b2b8fb0ffa73ffe2e79f45a4a8e92cdf2a.1616854134.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1616854134.git.fabioaiuto83@gmail.com>
References: <cover.1616854134.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove declarations of unused macros in include/hal_phy.h

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_phy.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_phy.h b/drivers/staging/rtl8723bs/include/hal_phy.h
index bf17a85b5959..521eb1c2efad 100644
--- a/drivers/staging/rtl8723bs/include/hal_phy.h
+++ b/drivers/staging/rtl8723bs/include/hal_phy.h
@@ -20,17 +20,6 @@
 #define	HAL_RF_ENABLE				1
 #endif
 
-#define	RF6052_MAX_TX_PWR			0x3F
-#define	RF6052_MAX_REG_88E			0xFF
-#define	RF6052_MAX_REG_92C			0x7F
-
-#define	RF6052_MAX_REG	\
-		(RF6052_MAX_REG_88E > RF6052_MAX_REG_92C) ? RF6052_MAX_REG_88E : RF6052_MAX_REG_92C
-
-#define GET_RF6052_REAL_MAX_REG(_Adapter)	RF6052_MAX_REG_92C
-
-#define	RF6052_MAX_PATH				2
-
 /*  */
 /*  Antenna detection method, i.e., using single tone detection or RSSI reported from each antenna detected. */
 /*  Added by Roger, 2013.05.22. */
-- 
2.20.1

