Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798056D38
	for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 10:07:35 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id o9-20020a1c41090000b029012c8dac9d47so4889543wma.1
        for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 03:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CYeDQWN22dNfUU8hmlX7IJ6l71kMbUkvgfCHONX5uus=;
        b=UAin33XQ/bLro+ZxmUd7EdVq7vVHR4XlW90mOHzrZ1voP8pXdJlesqnlMnh4ihyu2Y
         oRatm+kDWqwYpjlYWp2lkeAS+/Pl+eqnQlUe9abLdaOp5tqOfNb1hyLvGWbr9jk0NILS
         jhKkkGcS46WbWDD6SE6ARSbG6psi9Z6Xj2o7XU2/4wVFygoa+npObxSF9BjGNMsZtkS5
         lAAbS9TeBEwxoeLdw9wkicBFpKafisB3BE0emdFu7QGaz3F8yaW99LOWTclYSIBS4O/g
         uHVg1JJwfZeVaIMiiU0OMP42KOYjT4tG+MoS5XSunq8eZoCdRXcTpVk0uQO6OhQLU8QS
         3vhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CYeDQWN22dNfUU8hmlX7IJ6l71kMbUkvgfCHONX5uus=;
        b=fCzcyU6JTcIS2c6ib98nQRr+3PetV9w+fh+Jff1BhVxeAHKnb4XkL++2V4Z3//Oi2M
         c67CAr0VnKsfO3/YfuiTs1kU7r2xdkmvjzzVHRItpuBD/Uydpb+6mkTZEwTriAk496QJ
         A8fWAUQDx1o71Y+pfoRM9MOJC2AosnBc6/rkRdLWpqe/rY/uBYuGrP/CBXU8WCTl62u5
         tZT+WXn6zpuKegE5MGX9JLhC5TTSCLdVqiyloxRke/8QKWE/EyE+8hVRIN0140HpUe9W
         jTcnpeF5dx0mQsDIoBQDtCb4W9mWbOfqRc5vvqBsPoNycktLr+7NneZkaxp8OxDNK4KE
         33tw==
X-Gm-Message-State: AOAM531T5nrW/3bW/NxveWyT2Hc9wEfEe7xEKs4x553qxsjZkEVf2+ks
	wf6Z8okL6CSMxh/KJyH+uCo=
X-Google-Smtp-Source: ABdhPJyhn23M/tKQxFYBZ9Ux5+xWUMpttsXf//X5eHLTswbzMJiiQE8+OgNeTVXLowpJPhJBTkxWHA==
X-Received: by 2002:a7b:c1d2:: with SMTP id a18mr2264127wmj.108.1618481254105;
        Thu, 15 Apr 2021 03:07:34 -0700 (PDT)
Received: from agape ([5.171.72.223])
        by smtp.gmail.com with ESMTPSA id n14sm1851441wmk.5.2021.04.15.03.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 03:07:33 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] staging: rtl8723bs: split too long line
Date: Thu, 15 Apr 2021 12:07:22 +0200
Message-Id: <4e87fb741205b9f314aec739921405a7ebef908a.1618480688.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1618480688.git.fabioaiuto83@gmail.com>
References: <cover.1618480688.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix the following post-commit hook checkpatch issue.

WARNING: line length of 103 exceeds 100 columns
30: FILE: drivers/staging/rtl8723bs/core/rtw_mlme_ext.c:711:
+
receive_disconnect(padapter, pmlmeinfo->network.MacAddress, 0);

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 06544d0652b8..9031cf7657ae 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -708,7 +708,8 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 				if (!ret) {
 					netdev_dbg(padapter->pnetdev,
 						   "ap has changed, disconnect now\n ");
-					receive_disconnect(padapter, pmlmeinfo->network.MacAddress, 0);
+					receive_disconnect(padapter,
+							   pmlmeinfo->network.MacAddress, 0);
 					return _SUCCESS;
 				}
 				/* update WMM, ERP in the beacon */
-- 
2.20.1

