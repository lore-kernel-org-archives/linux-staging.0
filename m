Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4082FA4
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:59:02 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id i21-20020a05600c3555b029012eae2af5d4so1395967wmq.4
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AsQ6es43IHoyLDmIOwsDHm5ujGzK3kUKyhDSjmmPsb0=;
        b=TLZnCBa8FQOfcTzeLwaoom49TpkcDPn7oK71lFC+SCA4KnD2JmCyZT+wZOZCf4Zt0Y
         d6wnUPdmRxQ3WCMVpdWnjQR55bg68oDhGU3Yg+g2XIxfpjYEmrIBfcFA86KdblytD9zF
         pFwxEAysfzEdlAfmiKy5bj6+r8FwOdk5BBs0St4uihavO2HbxEjtrNflI6y93a9qxXAN
         jQDbu1qvMtzCUOrK6AAh9MW8L/r1yN6Ft0Aw5Di3bq32rQuBC/nKZ2UyDzUxiiLGD/4K
         JA+pIhfEekO26aUxftPSyu9ejcpHWkMqTpwkKqaFwpAUQAveXB1zrP8Vo7dC0+VAWBXL
         RSzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AsQ6es43IHoyLDmIOwsDHm5ujGzK3kUKyhDSjmmPsb0=;
        b=UJOLyRuQqh8J8dwdOlB2hibZ7z2+qapSvSbqS0IMkpoEoxtMzKAwpbtOvUXDqF9cD3
         wn4FNfNHBNvpx2je+PAUBVjzAFz6rB9H3ZruTtzKvOglhPkKuXEDCajlDImBKAlCa5Na
         P/b/msJD4qciUIAaBib/piF1D308OB+wuld5VX4SUPlmqvRfATa1994mA2ui+atXz8uX
         UsxXx7CME881wSDA3BXbBVHzwMrGrOY4y7EWXG4br7BcVqsor2tcU5wbLXz7QxR7eCaJ
         Jiy4GNnk25k/wz24/5GaBgvTGRLWIbl0JUKVrx3DVkpFriTZe61rsy4MO8arAwf1ybHi
         QrEg==
X-Gm-Message-State: AOAM530tJ1uCmiGDQjYnAEHRkiIYZnCqwhA8xPMAqHcRz4xAW9qXUgmt
	E+dPxEelmhA5aYgcV+A6Llz+U8KSvdM=
X-Google-Smtp-Source: ABdhPJyiqgBMZuaaFjw5zCnf4QP+Drn/gNWpul2inH8qy5oEYaElPQ9kJ6fHNnXqe5SxqXzpd2RJFg==
X-Received: by 2002:a1c:3983:: with SMTP id g125mr6027848wma.163.1619189941517;
        Fri, 23 Apr 2021 07:59:01 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id t63sm8084347wma.20.2021.04.23.07.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:59:01 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/49] staging: rtl8723bs: remove unused debug macro definitions
Date: Fri, 23 Apr 2021 16:58:03 +0200
Message-Id: <e69d637471148968af4fa17bb4f805961a0c513b.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused debug macro definitions related to
private log level tracing.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index acf4deacd3a7..8f56d1e7e644 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,18 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _drv_always_		1
-#define _drv_emerg_			2
-#define _drv_alert_			3
-#define _drv_crit_			4
-#define _drv_err_			5
-#define	_drv_warning_		6
-#define _drv_notice_		7
-#define _drv_info_			8
-#define _drv_dump_			9
-#define	_drv_debug_			10
-
-
 #define _module_rtl871x_xmit_c_		BIT(0)
 #define _module_xmit_osdep_c_		BIT(1)
 #define _module_rtl871x_recv_c_		BIT(2)
-- 
2.20.1

