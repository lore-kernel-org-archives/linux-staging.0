Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE0C29D6
	for <linux-staging@lists.linux.dev>; Thu, 29 Jul 2021 17:09:47 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id t14so9425854oiw.0
        for <linux-staging@lists.linux.dev>; Thu, 29 Jul 2021 10:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GZZfenwbHTpHPV6TEv9dv9GdGiSYXFbeLBPUeGF0UsI=;
        b=svE27ZH7fxP2Nmw83E7TtL1IRAUSjhVtTcC0j5+zOWWtG4tyOqlzt1Mc36i0Exg5F/
         mQeNHqGgae7tEBTOjNhNJ/Mwv2YDca2CI55pmnWyuQU8vKZYv/cJ9qIxnkldYGPIPxAw
         /sHvD7q+u5YxgnmnkVrHUqdvR4ge4plJEjhGqd4VnhyyW1TiG4pUfj+kJetGdY5BMzs9
         7OBuFPSG5kVrP9bdjV1hyuu8GXvXUL0V95qiX9IbKcQ2jRt+0Y0/HDX5O92aX+OlOu3b
         fpYV4uaXMeLrpPoa/2zEpP+pmtWFt7X8kipwQ/eIBWXMXrot7CjR60IhbS7jTfMYLv1O
         VqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=GZZfenwbHTpHPV6TEv9dv9GdGiSYXFbeLBPUeGF0UsI=;
        b=nenk9pWp6nQXjl/WL5ytFEUytSyctoI/t9opTR32KcPlQByNUUtVhagWEeQZKPRuZM
         t4OZp1+pzBA8Nl8OmGuXf97uo2MaO1BVdrWfzH8dBrNujd7F/oI3f5MALWp4hoRY1yW8
         AcIMrb7T5bI8mvvis9z/bQDgEkcbiv4/PABC3y1JnYzERcuhtKJxFyQlt+/HtrtdzzwU
         bPAnZaBjWDW1WD625oDHPG++WWfVuyE41pAOMlS4nE/Wfokh9JVHk/GEbzV6x1J6ENRQ
         j5yNjnQYviHSPYjvGLtlTc7/NZNjDlVCVY3PF0m6EQnhGEl6upiSPec0qMatlzkUsZJ2
         f02Q==
X-Gm-Message-State: AOAM5330YnP62EtjGHNy8W67cwewCaqtgZGDy0RQaMYZuQGBzYUP257g
	l9gsmU/bw5rY4GBZ+ckLit4=
X-Google-Smtp-Source: ABdhPJw2i2osqm0dnONqwhjUSrFL+IV1Yyg1lS1LaIJuloHFq/3FvyZhCz25ci5oK2miUL1ki1o9Rw==
X-Received: by 2002:a05:6808:317:: with SMTP id i23mr10304027oie.69.1627578586750;
        Thu, 29 Jul 2021 10:09:46 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com.com (2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com. [2603:8090:2005:39b3::100a])
        by smtp.gmail.com with ESMTPSA id a23sm614358otv.79.2021.07.29.10.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 10:09:46 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
To: gregkh@linuxfoundation.org
Cc: phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>
Subject: [PATCH 3/6] staging: r8188eu: Remove include/rtw_qos.h
Date: Thu, 29 Jul 2021 12:09:27 -0500
Message-Id: <20210729170930.23171-4-Larry.Finger@lwfinger.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210729170930.23171-1-Larry.Finger@lwfinger.net>
References: <20210729170930.23171-1-Larry.Finger@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This header file merely defines a single struct. Move that definition
to the header file that uses it, and delete rtw_qos.h.

Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
---
 drivers/staging/r8188eu/include/drv_types.h |  1 -
 drivers/staging/r8188eu/include/rtw_mlme.h  |  6 ++++++
 drivers/staging/r8188eu/include/rtw_qos.h   | 14 --------------
 3 files changed, 6 insertions(+), 15 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/include/rtw_qos.h

diff --git a/drivers/staging/r8188eu/include/drv_types.h b/drivers/staging/r8188eu/include/drv_types.h
index eed807d5dbc2..0acc5847a602 100644
--- a/drivers/staging/r8188eu/include/drv_types.h
+++ b/drivers/staging/r8188eu/include/drv_types.h
@@ -22,7 +22,6 @@
 #include <rtw_recv.h>
 #include <hal_intf.h>
 #include <hal_com.h>
-#include <rtw_qos.h>
 #include <rtw_security.h>
 #include <rtw_pwrctrl.h>
 #include <rtw_io.h>
diff --git a/drivers/staging/r8188eu/include/rtw_mlme.h b/drivers/staging/r8188eu/include/rtw_mlme.h
index 3ef1a008c602..d5b479ae7799 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme.h
@@ -313,6 +313,12 @@ struct tdls_info {
 	u8 enable;
 };
 
+struct qos_priv {
+	/* bit mask option: u-apsd,
+	 * s-apsd, ts, block ack... */
+	unsigned int qos_option;
+};
+
 struct mlme_priv {
 	spinlock_t lock;
 	int fw_state;	/* shall we protect this variable? maybe not necessarily... */
diff --git a/drivers/staging/r8188eu/include/rtw_qos.h b/drivers/staging/r8188eu/include/rtw_qos.h
deleted file mode 100644
index 3150e00b8d3a..000000000000
--- a/drivers/staging/r8188eu/include/rtw_qos.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
-/* Copyright(c) 2007 - 2011 Realtek Corporation. */
-
-#ifndef _RTW_QOS_H_
-#define _RTW_QOS_H_
-
-#include <osdep_service.h>
-
-struct	qos_priv	{
-	unsigned int	  qos_option;	/* bit mask option: u-apsd,
-					 * s-apsd, ts, block ack... */
-};
-
-#endif	/* _RTL871X_QOS_H_ */
-- 
2.32.0

