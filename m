Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BE829A1
	for <linux-staging@lists.linux.dev>; Mon, 16 May 2022 22:46:43 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id f2so15332329wrc.0
        for <linux-staging@lists.linux.dev>; Mon, 16 May 2022 15:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lh2NE58HUp3+dx2zo/APxmvSgiWw0DhpDrtBDl4weqo=;
        b=og5ptlwnfLZjthK1xxE6OxhJo/p8z71qQPUppM7tBZ9x/bQouRP+H57IR+c0+WOuhi
         zM+iD3VbwPIbfQwv1yA834gO6QMrPPqVy9pxiNuwdFyGBIWa0964AHKagmliKtyy/hv/
         xRPZbkfm+op4cDNEBBrjIfNXvIK5nJgyr59As0C5Sa6zAiD2Nu8H744Vs6tzNA1A4e2H
         84LrepSvO8Apv+43F2KEyI5FhiZVnIlw5Hy6jkgDMbuJ3IOZmDe5fK2fblgOEDnFCtBg
         SGAstorLJxDQhRofOwGA3MIgADUA+Wk3r4fcPxY97udkKLzCUJoy49H8jq8mGueHLCBW
         3BmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lh2NE58HUp3+dx2zo/APxmvSgiWw0DhpDrtBDl4weqo=;
        b=CO9fuLircwsZaty+hQvah5cQ5j5oYo1NlyiimyZ01QrBzQZ7ybLACu11Xyjt3nFV1C
         3pK3+Alch8cwvBmjHJGoFHj09rd9pTqaQhUQQ6yD6zsYk0TVpUYmdhX/6AHiD8K+dNuT
         2qg7nVjufBuB7vNV/Z/8j/RO77bG17ZcdXL2fKqs0HIzXnyQ1SOKrVaag6M2WKwnKeJL
         IWVCwGkFCPyTWepxVxCfX/03S+rfiAX6VjrsJvnmL2GvxvRuVS0LzCJhswsYrkLBDlpr
         4YO/xcqmHQQFmWvJ7sl6cG8yzR3NQGlsNTidU9+XX7Mvan6q5fR4TMjXTMDGAZ/Jitn3
         J95A==
X-Gm-Message-State: AOAM530q7upG+3UxZs66j5V0isrmNiYr4ip09IfU3dsq+O1Q851sQnG5
	h6nDuEbVObzrxuoBVllql4CCFg==
X-Google-Smtp-Source: ABdhPJwFUVZ7umGIeVSc9HIFSGGuVIErhKoX55pyukPHyt9eB44vFmeAD96iOfnDjrxMM1WEf4N5lQ==
X-Received: by 2002:adf:ed07:0:b0:20d:e591:4ae8 with SMTP id a7-20020adfed07000000b0020de5914ae8mr530189wro.357.1652741202239;
        Mon, 16 May 2022 15:46:42 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id l27-20020adfa39b000000b0020dcea1be26sm345588wrb.97.2022.05.16.15.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 15:46:41 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	saurav.girepunje@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: r8188eu: remove _drv_ defines from include/rtw_debug.h
Date: Mon, 16 May 2022 23:46:40 +0100
Message-Id: <20220516224640.90973-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following defines:
_drv_always_
_drv_emerg_
_drv_alert_
_drv_crit_
_drv_err_
_drv_warning_
_drv_notice_
_drv_info_
_drv_debug_

from include/rtw_debug.h, as they are no longer used anywhere in the
driver, and are unlikely to be ever again with the removal of the old
debugging/logging code.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/include/rtw_debug.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_debug.h b/drivers/staging/r8188eu/include/rtw_debug.h
index 01a7d987d6cc..84ec068596e7 100644
--- a/drivers/staging/r8188eu/include/rtw_debug.h
+++ b/drivers/staging/r8188eu/include/rtw_debug.h
@@ -7,16 +7,6 @@
 #include "osdep_service.h"
 #include "drv_types.h"
 
-#define _drv_always_			1
-#define _drv_emerg_			2
-#define _drv_alert_			3
-#define _drv_crit_			4
-#define _drv_err_			5
-#define	_drv_warning_			6
-#define _drv_notice_			7
-#define _drv_info_			8
-#define	_drv_debug_			9
-
 #define _module_rtl871x_xmit_c_		BIT(0)
 #define _module_xmit_osdep_c_		BIT(1)
 #define _module_rtl871x_recv_c_		BIT(2)
-- 
2.35.3

