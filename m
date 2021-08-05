Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6BE70
	for <linux-staging@lists.linux.dev>; Thu,  5 Aug 2021 14:10:47 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id p5so6772149wro.7
        for <linux-staging@lists.linux.dev>; Thu, 05 Aug 2021 07:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NpYEEmebE1fM+RY82LCVN07dqLDtpFtPH1UGzt+rFWI=;
        b=ujvzu/O1UZC6bAJ5as3xw1NKNWNBU18ZzJk/7RFqgYVbmv+8/vFqA1Opvpj/h7HB15
         /HKvI/9dosCTr2ZCyRZ9c5i6hLc3BAkjYDxyxgK+5tIq9spTuvN6qn0HTEEUTjJtkvA4
         CrG8sSGZQ44Ad0GUuBf+13pS1Ur6yCNx3g2J0u9DTHXC7s5RN9l9UYyN8LrJEIjEYQqJ
         SNAWPIvrEfHZYhGcZZgaQkNU8uRmEEMsa8HUF/CyM6l6nJUGHV8ovYNOQfloQa/fGkC6
         wZf59gdsP8jzZ8BXDW7JPacpN7Tkzt+zvPfb8RzBshs0tmIJOGCsJwkq8AJ8j9nvC52m
         kqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NpYEEmebE1fM+RY82LCVN07dqLDtpFtPH1UGzt+rFWI=;
        b=tfCefdMgX/bUtvEBvEldngNzQi1Z0d3jezRsnr36eg11RMuwW2puGQmTBvlARmM1w5
         akSmhNwcx90SBdxNJ4siNlA+OxIer/W3gR1TnPLp0Doj1KKVceQQqk+oECDg9QoEJqms
         S59WcQRJlLf8L03FoMSFOsXgvqMSxPgWHV9CIkvaGjHa5rV00T111TDXlkcjmuO8735b
         oKAMsTkfbLh7HsLR9j6pGxkCQQZioSyDTETbZ/wTyWqMypnariVlLSqPnOWyHf4FEbep
         vXMrV7V5r11DBgVoRxDxbKVabFpTnmoIzuzl7ygX4hiRscZMKOSIKYVnIvcKFvi5vTvf
         79yA==
X-Gm-Message-State: AOAM532eXVubYcmp+eZ/9TYPqTslqzdcVkbR5+bM1zq5kxK70M8+TEvF
	XDHRWsBdA5r90t3XuRaVcrI=
X-Google-Smtp-Source: ABdhPJyrwF4DJ04n3fohJbZTYjK3r5jsm9ITPhzQvH2fBiVzxN0xfbDx3XKq0kbVuX09uYzHvcLK+g==
X-Received: by 2002:a5d:53cf:: with SMTP id a15mr5456874wrw.410.1628172646066;
        Thu, 05 Aug 2021 07:10:46 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::996b])
        by smtp.gmail.com with ESMTPSA id 104sm6223950wrc.4.2021.08.05.07.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 07:10:45 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] staging: r8188eu: fix build error
Date: Thu,  5 Aug 2021 16:09:41 +0200
Message-Id: <20210805140941.9130-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary label to fix build error introduced with
commit b398ff88aa36 ("staging: r8188eu: remove return from void functions")

drivers/staging/r8188eu/hal/rtl8188e_dm.c:182:1: error: label at end of compound statement

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_dm.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_dm.c b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
index b5f42127a751..7ac4257d7ebe 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_dm.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
@@ -145,7 +145,7 @@ void rtl8188e_HalDmWatchDog(struct adapter *Adapter)
 	hw_init_completed = Adapter->hw_init_completed;
 
 	if (!hw_init_completed)
-		goto skip_dm;
+		return;
 
 	fw_cur_in_ps = Adapter->pwrctrlpriv.bFwCurrentInPSMode;
 	rtw_hal_get_hwreg(Adapter, HW_VAR_FWLPS_RF_ON, (u8 *)(&fw_ps_awake));
@@ -179,9 +179,6 @@ void rtl8188e_HalDmWatchDog(struct adapter *Adapter)
 		ODM_CmnInfoUpdate(&hal_data->odmpriv, ODM_CMNINFO_LINK, bLinked);
 		ODM_DMWatchdog(&hal_data->odmpriv);
 	}
-skip_dm:
-	/*  Check GPIO to determine current RF on/off and Pbc status. */
-	/*  Check Hardware Radio ON/OFF or not */
 }
 
 void rtl8188e_init_dm_priv(struct adapter *Adapter)
-- 
2.32.0

