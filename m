Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570D52FA1
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:59:44 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id s7so48628230wru.6
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AedyWXn8rMwjV4hec6YOWAkym+19jwGe7xRprf/SrlY=;
        b=VR2/iVh+OKq5WiGouAt5aXvKhf5vcMLxXKHFMo9pfEiVt3aMXHbNgtZY3AytegT6m1
         gkEWfZHR0epxqkTPSOg3NS6D/P5OlzJe1QqOSXhU6vAldKw0qUpnvbXXL0Ro126tfuOu
         H6YUSryQo51LErS44nTQbgypr8JpnuOivY2+v+aouhJoSU9ND/CX7Rvmcu+LKVJhRXzC
         ttBXrFcJOA+9w4bZiMWUB2gbTZ8db97j3GuJnqHVks0BGxajcZ/kGpEgh4r4JnlmsxZa
         eGn7BJaH5gd7ZmjgogVyGTvE9SksTb3FKQnknehVNKm8Q8DOPYlZM0LNxbaVHpUBSPdE
         OH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AedyWXn8rMwjV4hec6YOWAkym+19jwGe7xRprf/SrlY=;
        b=iXzl/zO8D6cGdFsw4k7z8sB1PDrkJ7MLUB2LxKGfFxH+JbjdHNkbJdwuQCg/K+phC/
         jnewXBSq3/yZiutBalV49cTyGIAjWu748uZhCA+hAzK92TFgnATv6elr4NhnlkuiHQfK
         ew9dB3u4ASitHWMvwUKw76LvrZSYwhGvicycTMyrtC1qlDnAkSr31SP5roHIrGuX3wMV
         9DCtkK5J9mBtO9uNqdPD30bLczAd0+F6NQnpBcbXzWjFWgtLbXuEncUhkSHmtrh0QYoO
         eK5d9AarxJvTWm+noHI/wt3jvNmvldr9jKHHCve9Fy8cZ7XlGu1aynQrKlzgePMbV3hH
         vi+w==
X-Gm-Message-State: AOAM531HU4ts33NWkzSIwhHK5no7XJ0AAm2G/9+MLeIzQ0bGdJPHYmbq
	T/3t5JfglTqMkbS0Y9gGS/o=
X-Google-Smtp-Source: ABdhPJxh5AACHSLvbosz1i/MgdiUIrD9Ja44VesSJQeHn8ZB3FHg/wRDX84/E5ikZ50v/IQERVBH2g==
X-Received: by 2002:adf:d1ce:: with SMTP id b14mr5404617wrd.159.1619189982965;
        Fri, 23 Apr 2021 07:59:42 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id c77sm8014287wme.37.2021.04.23.07.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:59:42 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 37/49] staging: rtl8723bs: remove unused debug macros tied to _HCI_OPS_C_ definition
Date: Fri, 23 Apr 2021 16:58:28 +0200
Message-Id: <67c04ee5a9f5b0651369abe7284aa188c4e05301.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused debug macros tied to
_HCI_OPS_C_ definition.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 130cfe3d2032..3becb1b8d15e 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_hci_ops_c_			BIT(21)
 #define _module_osdep_service_c_			BIT(22)
 #define _module_mp_			BIT(23)
 #define _module_hci_ops_os_c_			BIT(24)
@@ -22,9 +21,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _HCI_OPS_C_
-	#define	_MODULE_DEFINE_	_module_hci_ops_c_
-#elif defined _SDIO_OPS_C_
+#if defined _SDIO_OPS_C_
 	#define	_MODULE_DEFINE_ 1
 #elif defined _OSDEP_SERVICE_C_
 	#define	_MODULE_DEFINE_	_module_osdep_service_c_
-- 
2.20.1

