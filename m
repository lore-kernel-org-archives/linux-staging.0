Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF25E70
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 15:00:03 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id h4so39666688wrt.12
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 08:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rd5Skrnm1vG8IFRdylWE6XpRaE/YvS+Wl0BTfIy1QHc=;
        b=EBk4guBPLEelq5ApCOjqajr+6ws6JUKGAI23EF8XEsT4fajlacff5S28eiw91h91xc
         M9HQDRUGaT8vbq2HsLrCtlLQ9zLYJU0FuiMW4pGcm4hSDsh9qGv7UHD4VL13b7qco8kB
         oxdg822+NOCHyFWKP8XKQe3mZExRRZJUuB77uvkBhjI8DdTuClj8kR0a26YWyl4xMcMz
         d1CoNLE2fHRfGlUa7BX4Btu6SBXCQOd25MzOLrUDC21ZUzRhnpLLiKz4oLesQ5wYHq1p
         S1fnPajZQTqxa/VY0jN4/4Ln+4R4Ikbmanasrp8X7lJt7d/j8PxgPVxcd5xEjINDkXcg
         VKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rd5Skrnm1vG8IFRdylWE6XpRaE/YvS+Wl0BTfIy1QHc=;
        b=CTm6hwjFXasYWobqrh4w5wwbBWngU3ie4Y9NM/QFGWRbB0Av3GKOWJ8Q84bKegcvKG
         6HE80O0Lp+fhnO551qqwwNqfBd7Fn0ZCBoe7W4sKHvHkU2OhD28qtbMrkqnOI+ukTEvH
         zAtnJD1+FQmDsZ3XkCv4D3/Bd0yQjdpxlr87E4ZF+6EefPkXMaNVyo8uJFLKnLDUbEN4
         /c9UrR751oWPCpqrTrq0zyKNO6uCJ30XvqiD2SapcQmWHKngsmuGR8QiHQokm6zi58oT
         tWhyUo/yB4CSrbLWAK8Cl91G0oFa/9hHoD8N3dqRvOvVJuiuEVWLTu5rOcN9/B7bHmOR
         ywgA==
X-Gm-Message-State: AOAM532I6F7UItnvilJ/JqKbLFjdNQhKouwTQPz9qSX6o5HWU3BUzEyR
	tihHlgiegjz17Q+q4KmbygkU9w0O7Hg=
X-Google-Smtp-Source: ABdhPJx6ECOX5tnYJNQpCLNqoN+yy4S5mIiDF5s/7wu7P0iVWlEDuBAeMJCfpL/hN89Wcxb2QvS4og==
X-Received: by 2002:adf:dd50:: with SMTP id u16mr5360504wrm.380.1619190002618;
        Fri, 23 Apr 2021 08:00:02 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id h17sm9553127wru.67.2021.04.23.08.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 08:00:02 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 48/49] staging: rtl8723bs: remove last unused debug macros
Date: Fri, 23 Apr 2021 16:58:39 +0200
Message-Id: <90fdb9b1c98052f5121491b18ed5782a83c1e848.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove last unused debug macros.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index c9f53c08efbb..189f02a8300a 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,18 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_rtl8712_recv_c_		BIT(30)
-
-#undef _MODULE_DEFINE_
-
-#if defined _RTL8712_RECV_C_
-	#define	_MODULE_DEFINE_	_module_rtl8712_recv_c_
-#elif defined _RTL8192CU_RECV_C_
-	#define	_MODULE_DEFINE_	_module_rtl8712_recv_c_
-#elif defined _RTL871X_MLME_EXT_C_
-	#define _MODULE_DEFINE_	_module_mlme_osdep_c_
-#endif
-
 #define DRIVER_PREFIX "RTL8723BS: "
 
 void mac_reg_dump(struct adapter *adapter);
-- 
2.20.1

