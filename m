Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8001360
	for <linux-staging@lists.linux.dev>; Mon,  8 Aug 2022 06:50:35 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id qn6so3019442ejc.11
        for <linux-staging@lists.linux.dev>; Sun, 07 Aug 2022 23:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NXFy/L+O5xnM71JLbyMm2nhzjOenjYylX2CI7hWvxRI=;
        b=NbqL7OPKRd8KSSwMCPHh3EbqOgxTtixjGuNh3aKKF7E9MkRb6PUgJM/lZltuuUs4Xn
         uQ6fi3rOV9BvFkReA42ejpaFumQ1JSjdqaQKE23upHD1unO1s6R7FMjRLi60wgz/ZCxq
         sOy/fVx3MYIvr/riimQIR2ZWTnVDUloBmDiQDXQ8srfAS6h54iMyT9rlawn/aQ4fYEOd
         yhspgHZ+nogX5AqUhljotXgPojLsOxbVcc8/Laig0x28eRJqnTjsPJE9Ri1q7sp9+kTp
         sN2v8yeXy/0SYlRilzjZP8Gu9g4aDZ3QZACTKJUsyiV4eL/luZBJAC8heD2S1pY5xGfV
         o5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NXFy/L+O5xnM71JLbyMm2nhzjOenjYylX2CI7hWvxRI=;
        b=1lKJypXaDtsrP5CRqDAIY8A6VryS92NJVGwKwTnlBPeyqsNgkAHGuqU6O2jaBCNJup
         /LryQueZsOoVcDRwfhX0DxPmWs5H10KOGCDIFQXYJNHOa+dyJB2IT0nWTaiZaLPQJ248
         kRAzknaeUJHhi8LiWl97keDuhLM3TrFWGMxB53iCSxqF2C1G+c4K7s0l4G47tpFFFily
         SiM7dpr9Ru5MADc4Vlx5TYvPH79XCAY7fhCLARgV8sPGrqkNyjWwjx+Vclvpijbfcc/+
         wnzJVF5v7dhDGA2wu4YXYG+Au3HcvHjKxQMjm3LW451GkgOvzueoo8fQz/UVjjNxOj27
         fMJw==
X-Gm-Message-State: ACgBeo0A+6Rgkrm0HG6prUSYX0CgNDsEITuXfFw8gHMvnXxvMzVbm5aH
	pxL/fE+Q5eB9qZGuSKIpCCA=
X-Google-Smtp-Source: AA6agR6+XdvuEaZal6me3MXp+qYOJmuitsFaydsUOBpYKUxIuPELn8Q/tHVmSQz6Zer7vsout9mFig==
X-Received: by 2002:a17:906:c781:b0:726:c967:8d1b with SMTP id cw1-20020a170906c78100b00726c9678d1bmr12907535ejb.54.1659941433407;
        Sun, 07 Aug 2022 23:50:33 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb84.dynamic.kabel-deutschland.de. [95.90.187.132])
        by smtp.gmail.com with ESMTPSA id 16-20020a170906329000b007313a2575d2sm2259844ejw.104.2022.08.07.23.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:50:33 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: do not spam the kernel log
Date: Mon,  8 Aug 2022 08:50:23 +0200
Message-Id: <20220808065023.3175-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drivers should not spam the kernel log if they work properly. Convert
the functions Hal_EfuseParseIDCode88E() and _netdev_open() to use
netdev_dbg() instead of pr_info() so that developers can still enable
it if they want to see this information.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 3 ++-
 drivers/staging/r8188eu/os_dep/os_intfs.c       | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 5b8f1a912bbb..58a193334b91 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -688,6 +688,7 @@ Hal_EfuseParseIDCode88E(
 	)
 {
 	struct eeprom_priv *pEEPROM = &padapter->eeprompriv;
+	struct net_device *netdev = padapter->pnetdev;
 	u16			EEPROMId;
 
 	/*  Check 0x8129 again for making sure autoload status!! */
@@ -699,7 +700,7 @@ Hal_EfuseParseIDCode88E(
 		pEEPROM->bautoload_fail_flag = false;
 	}
 
-	pr_info("EEPROM ID = 0x%04x\n", EEPROMId);
+	netdev_dbg(netdev, "EEPROM ID = 0x%04x\n", EEPROMId);
 }
 
 static void Hal_ReadPowerValueFromPROM_8188E(struct txpowerinfo24g *pwrInfo24G, u8 *PROMContent, bool AutoLoadFail)
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index cac9553666e6..22e91657f3fb 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -635,7 +635,7 @@ int _netdev_open(struct net_device *pnetdev)
 		if (status == _FAIL)
 			goto netdev_open_error;
 
-		pr_info("MAC Address = %pM\n", pnetdev->dev_addr);
+		netdev_dbg(pnetdev, "MAC Address = %pM\n", pnetdev->dev_addr);
 
 		status = rtw_start_drv_threads(padapter);
 		if (status == _FAIL) {
-- 
2.37.1

