Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929E87A
	for <linux-staging@lists.linux.dev>; Mon,  4 Apr 2022 08:21:49 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id c42so2648451edf.3
        for <linux-staging@lists.linux.dev>; Mon, 04 Apr 2022 01:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rPYO2pNz1/bQYKjtDRXcH0Ioe3wPwK7iSBX0zehzbLA=;
        b=bW+zOzhElyJjyfZ1pCtxqO+5Rxzf71rGe6k+bvGlQw/+vog2QsXeE0jO71lEN2ZPD9
         NXMw0+4wwcl1726YfkVv/yAyLNHhG6SmZlbej41yuAP4QSuktnxwZyiahDXTXfDJKnpN
         3/8a8Lu1SYTahPOSi788Pw8lmFh04Nzd+IsdlQ0FzCiBW2VKSSJd6B9M/qsU3+BLzGVN
         BVlHSlAx5BDrd9kMN69qUdvFCNJQtWr89o05UsNrMIk6mqJvPp8sJm6E9Oaq6ThONREc
         kVOFnYn23Ct2nhHqqSBPQ7vUUq8OrtiGrx79Tk1iIqCV6Yu1aIEZD4kTcIR1jjemLHRn
         P1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rPYO2pNz1/bQYKjtDRXcH0Ioe3wPwK7iSBX0zehzbLA=;
        b=4j1Seh6bRDRDo/XzPA7SnLVztC10Aty0XO50g1IZ/qB9/2Bq4YOKA79DqQ7D9FFocX
         iGFZzFt/VRiROSLOPsOfzB4z4moMEaKU4gXbiHz2nhlGOyLQzO/S4x4MBeYH2db7jiWc
         i8HudgvVMM4Qb6HRlnuqYElXkXK0oGBJxooeZHo6p/iv/04Zs4R0ukP9U0vLvmed82eC
         oiXTSe2jJ7P4sfReJaMa+P17jHqWCix7JLclrqxhvu/UIe0aq9YT0jP6o2XqPo90Pw7G
         wfkcRMlpICvwkRdCLM7vgKro9Z4vVo4wqf27AI5aZI1XVn5WUBoHmVQDhMygqvcacjIS
         cnaA==
X-Gm-Message-State: AOAM532kCiSp7P9FB+fKlhUTYnx1eOJBcPDmyUP9ooL/VJZiVExMtX//
	/8Ej/vJNAeMP3S3gClr19/4=
X-Google-Smtp-Source: ABdhPJxjBWCVSr/nrkBPG4q1VP7TIbF432eF+5z2b2SNwo8uaHyxyRcy8peP+Wp4Nz3NPMF2YbhVRw==
X-Received: by 2002:aa7:d495:0:b0:41c:c46a:550f with SMTP id b21-20020aa7d495000000b0041cc46a550fmr4713672edr.305.1649060507963;
        Mon, 04 Apr 2022 01:21:47 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id n3-20020a1709061d0300b006da94efcc7esm4047336ejh.204.2022.04.04.01.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 01:21:47 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/5] staging: r8188eu: reg_rfoff is never set
Date: Mon,  4 Apr 2022 10:21:39 +0200
Message-Id: <20220404082142.4639-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220404082142.4639-1-straube.linux@gmail.com>
References: <20220404082142.4639-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The field reg_rfoff in struct pwrctrl_priv is never set. It stays at
its default value 0. Remove it and remove related dead code.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_halinit.c     | 4 ----
 drivers/staging/r8188eu/include/rtw_pwrctrl.h | 2 --
 2 files changed, 6 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 4bc6b08fb282..21ab6881796e 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -539,10 +539,6 @@ u32 rtl8188eu_hal_init(struct adapter *Adapter)
 	/*  Save target channel */
 	haldata->CurrentChannel = 6;/* default set to 6 */
 
-	if (pwrctrlpriv->reg_rfoff) {
-		pwrctrlpriv->rf_pwrstate = rf_off;
-	}
-
 	/*  2010/08/09 MH We need to check if we need to turnon or off RF after detecting */
 	/*  HW GPIO pin. Before PHY_RFConfig8192C. */
 	/*  2010/08/26 MH If Efuse does not support sective suspend then disable the function. */
diff --git a/drivers/staging/r8188eu/include/rtw_pwrctrl.h b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
index b0d48106fe56..3efcc65b2f6e 100644
--- a/drivers/staging/r8188eu/include/rtw_pwrctrl.h
+++ b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
@@ -49,8 +49,6 @@ struct pwrctrl_priv {
 
 	bool	bpower_saving;
 
-	u8	reg_rfoff;
-
 	uint	ips_enter_cnts;
 	uint	ips_leave_cnts;
 
-- 
2.35.1

