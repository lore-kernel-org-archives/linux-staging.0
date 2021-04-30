Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465BA2F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:44:31 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id f24so7080205ejc.6
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EkTXw+UrM2wYCxNZsOy4gcxyM1XqC056VTNVEgdSP/k=;
        b=lvkXXjVYtfZ+PtvyuU/0QoT4J4q556JpH9BCSFSKiljg7KR2559/elzxcOXGVwaSMx
         GlD9E/h1KkKVnGMRlJtTESqzJXlaRkymoLlxJ3LBk3FS54Y9sq8ZHWGGqc3cu7Zn6Vyx
         RZYoP0zdEVdpwg3OGHuCPwzLb5XHsH5U0kf/5LVX7T7IvJtZOXWhIiSufHXbi3XfGRcY
         1b/q6NDCsBUTAG1NsyTQm4FmlufFUPTNK0dsBfAqK5KTwc4m/gVtS5Z4f9ZZYMbFCAdX
         jEFKX8X+LohI3Q31wf0eO6zRRgsI0uJOSPSWIhqM07bYtmJoUdWGgbeyGAjKvd0SyPOj
         CkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EkTXw+UrM2wYCxNZsOy4gcxyM1XqC056VTNVEgdSP/k=;
        b=F3g6zCG79vwcPjS9pm7LU7laRj/ylq3AmFYgjqHaoKfrqq4JFHt1gpx6vVfCdu+gn2
         0l5wTHXU/5T8mBgHqUH0evjVodoxugXbb8ByoPhjW/ctXiiciL8oCt6Pw74oD8cTKeph
         oIZPPG4L5rNkKELYw3wATJ2voRBVf2icN1dVmi/CsWMKjZEBYrEG5eDuDo5T5PqWDZlo
         aWeZ5yLYUc/AqZzETFzvAIKjRbesETsDCpTfO+pY5qgsiNhEWIxblhcALaEj9DUsIA33
         f1oZd/6n5ZjW7CSugx5hr+UgnSsY2FIKxoJOmTQHnK1aUaifUMpeiCbLAHUmMBLlezAU
         Wp5w==
X-Gm-Message-State: AOAM532ov0SFY3eA2dLXSzvLLwjdfejjUAtu2jVL2gI2/RWXjv6MUAcR
	k4Z+ohstNjomch6RLV+cwZvPnmGvBSM=
X-Google-Smtp-Source: ABdhPJwqJKv5kPajBjtoMKuMpJse68jKy5z9XWTVF2oCRm1mYmN4rN4jGTweHZoMBnRMHC7dAUj6xw==
X-Received: by 2002:a17:906:3ec1:: with SMTP id d1mr4818766ejj.523.1619793869911;
        Fri, 30 Apr 2021 07:44:29 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id o13sm2084409ejx.86.2021.04.30.07.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:44:29 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/43] staging: rtl8723bs: remove unused ODM_RT_ASSERT macro
Date: Fri, 30 Apr 2021 16:43:40 +0200
Message-Id: <5e31ee70c4be243ccf92d92ad123d4f348acd5cc.1619793405.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619793405.git.fabioaiuto83@gmail.com>
References: <cover.1619793405.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused ODM_RT_ASSERT macro declarations.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_debug.h | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_debug.h b/drivers/staging/rtl8723bs/hal/odm_debug.h
index 09e8bfec7664..b4fc247242fe 100644
--- a/drivers/staging/rtl8723bs/hal/odm_debug.h
+++ b/drivers/staging/rtl8723bs/hal/odm_debug.h
@@ -96,20 +96,6 @@
 #endif
 
 #if DBG
-#define ODM_RT_ASSERT(pDM_Odm, expr, fmt)\
-	do {\
-		if (!expr) {\
-			DbgPrint("Assertion failed! %s at ......\n", #expr);\
-			DbgPrint(\
-				"      ......%s,%s, line =%d\n",\
-				__FILE__,\
-				__func__,\
-				__LINE__\
-			);\
-			RT_PRINTK fmt;\
-			ASSERT(false);\
-		} \
-	} while (0)
 #define ODM_dbg_trace(str) { DbgPrint("%s:%s\n", __func__, str); }
 
 #define ODM_PRINT_ADDR(pDM_Odm, comp, level, title_str, ptr)\
@@ -129,7 +115,6 @@
 		} \
 	} while (0)
 #else
-#define ODM_RT_ASSERT(pDM_Odm, expr, fmt)		no_printk fmt
 #define ODM_dbg_enter()					do {} while (0)
 #define ODM_dbg_exit()					do {} while (0)
 #define ODM_dbg_trace(str)				no_printk("%s", str)
-- 
2.20.1

