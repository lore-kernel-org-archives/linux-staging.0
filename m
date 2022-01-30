Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5F83FE1
	for <linux-staging@lists.linux.dev>; Sun, 30 Jan 2022 19:03:41 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id p15so36012775ejc.7
        for <linux-staging@lists.linux.dev>; Sun, 30 Jan 2022 11:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SjrS4w62Uxe/qB4XuyiE0X5ZGBxg6belQDWbZp4WXro=;
        b=VcHipuRlcMhw51ycNd0cS+uaV562SgbCeZh1l4+E/UGQ8bh3r9hMFdqJekO/Ov+rdr
         P9ulOSxmhyICgmnAkLAG1i6fXRDd6QLnUuGwKpPlQd1+s5pVMoGwZDi7DyV03oUxjHJq
         i31AZmt7mW6KOpxouuSlCDE2RDY27kyqM/kK557oUXyoLOfHTLJUSvI2in8pttK/XBKw
         ArlBkdRv3D89ZR0pgECjjSo1+22KTYF7emg1Lskp6aOE9cHIWf9zn5KwEc+8Gf1MrgA7
         9AxpIvMR/eigvaKCo9foAC4gktLV0VhoTh7QixAx0AuTW3A4vYr4tMARrySZOY8cQVr3
         jbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SjrS4w62Uxe/qB4XuyiE0X5ZGBxg6belQDWbZp4WXro=;
        b=eFf0yoQfbNDvz4GtN814v3mkIERPjoBvgr29IIFifLvmRAKFTKggQstyKJGPHmk7Gv
         tWFY1BnTEDTOCTn9aAazY3j21Mu/FnVEguSFScH6sRITKM5G9R0dgkB9kUy+09AHK20V
         FnvCmTu/L/KMGza1aGA28ZDcOo6dyhAsNW+FyTKVzcAjX9DxIPqHIPt10x9ay62zbj5n
         dHE2HSrpL1qgYtRvQKWslN+Qpdny+jDDE/Z6OXx8DajMLjzYMp6GaeHTz2pBQXCmTOfn
         96VU8X3Y0sGHHAWr/qf8PbGbHB0j9JO7WSKLxfKTCUGk0AJ3S6Iiqig42wVhJQMnYIg/
         J+gg==
X-Gm-Message-State: AOAM5326oLt2BJpyh3Q2DW34fFs4E3KT7na9hWetF/hPI4s48V1zIHY2
	M04DOZmNPi7Ha+Que6R2xzDsY7c0Sx4=
X-Google-Smtp-Source: ABdhPJzExYBx1f9ZUGVkoQI/n11wz7ig67rmXJmFtWZKZnguPW3vGcxjvZG1LyT1dI5V+pnYOKpaBQ==
X-Received: by 2002:a17:907:9812:: with SMTP id ji18mr10471754ejc.200.1643569420373;
        Sun, 30 Jan 2022 11:03:40 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb5a.dynamic.kabel-deutschland.de. [95.90.187.90])
        by smtp.gmail.com with ESMTPSA id n3sm921124ejr.6.2022.01.30.11.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 11:03:40 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 08/12] staging: r8188eu: merge Set_NETYPE0_MSR() and Set_MSR()
Date: Sun, 30 Jan 2022 20:03:17 +0100
Message-Id: <20220130190321.7172-9-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130190321.7172-1-straube.linux@gmail.com>
References: <20220130190321.7172-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set_MSR() just calls Set_NETYPE0_MSR(). Merge the two functions.
Keep Set_MSR() and remove Set_NETYPE0_MSR().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_wlan_util.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index d28929a95108..a8acec776b79 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -284,7 +284,7 @@ void Switch_DM_Func(struct adapter *padapter, u32 mode, u8 enable)
 		SetHwReg8188EU(padapter, HW_VAR_DM_FUNC_CLR, (u8 *)(&mode));
 }
 
-static void Set_NETYPE0_MSR(struct adapter *padapter, u8 type)
+void Set_MSR(struct adapter *padapter, u8 type)
 {
 	u8 val8;
 
@@ -293,11 +293,6 @@ static void Set_NETYPE0_MSR(struct adapter *padapter, u8 type)
 	rtw_write8(padapter, MSR, val8);
 }
 
-void Set_MSR(struct adapter *padapter, u8 type)
-{
-	Set_NETYPE0_MSR(padapter, type);
-}
-
 inline u8 rtw_get_oper_ch(struct adapter *adapter)
 {
 	return adapter->mlmeextpriv.oper_channel;
-- 
2.34.1

