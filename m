Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3CC3C26
	for <linux-staging@lists.linux.dev>; Sat, 30 Jul 2022 15:06:50 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id va17so13203496ejb.0
        for <linux-staging@lists.linux.dev>; Sat, 30 Jul 2022 08:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sejWbLeM9dLSZeXoLlKAxwvz+W4OQgS27PLKjp2WElc=;
        b=Dg8eYtEP8xa36wVC0j7UO8wpulsxqYYjhCozlz0ZsIZRpnEQB59p5V2gLz8TbIOBEK
         IdVl0CQLoRcc/u4WbgrqyOkUpcf2nG11Vw9eXSSd+EU3vWH01HLdXbX4D8GFZHYLcXew
         zz9KPHDs6JNoe6/rpK3QgcH4DzNSwU5wj4pyMePQ1NHB0/J5OjjVtnGLKukImTPxp9/n
         aSdG7PCgDvTE0z9WGoi0i185T1zV8otqjCCRniGkbhgxKEl0TY8ayRqwFW9sK1Whb3cz
         /Mnf4Hno2SN/ZMHSXJsQIEES+YhARe5FdJLqZkYLTNBwgHYnraesjyOG061AuJrMe5sM
         MAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sejWbLeM9dLSZeXoLlKAxwvz+W4OQgS27PLKjp2WElc=;
        b=ctTp6grT2fFOjDEFuSC3s8psLg9GRZIHRtnTtYD0JFXtn4SSof3g3UJKwCw5ZVSIKf
         k/w19QaWUguLcRLBzOwyjPkGfQNI/md4Tb+oJvHSve4rLRd23fTKfFJPhjSAegiJ5Osi
         jfCnrfuPXXeoFI+mudKESLhwq8MAgMBxxapNfbkVr6hL7cIhgv1jseT0X7j+aK7DeF00
         U69Moy1ZiYe/B3x8VdiEtQXRDa5wZn7sZMy3GwvcJUhTr7DTm3V+JXZ/P5LNGwVrH4BN
         pH1fOhWdOVsJC7JMIkCbhx/Bf01CQ1IUIw53qDRvDosMnS8cW+3xrDX4t0k776mINpck
         y/AA==
X-Gm-Message-State: AJIora9qac5BndAU5F3StETMyISbmc5BIu4j1xW6M9GOrFo8DgXYEieB
	FKtMUSlSG0xaAxjF1S8UM3w=
X-Google-Smtp-Source: AGRyM1s6//hRZj4v+5sYEEZF7BnuYxuJXMFMGRqLogTNRRpsK61Oul/eOQEHnfTRRzAsWzzOOM6jYA==
X-Received: by 2002:a17:907:6d04:b0:72e:e204:a70b with SMTP id sa4-20020a1709076d0400b0072ee204a70bmr6366453ejc.432.1659193608830;
        Sat, 30 Jul 2022 08:06:48 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb9e.dynamic.kabel-deutschland.de. [95.90.187.158])
        by smtp.gmail.com with ESMTPSA id sy13-20020a1709076f0d00b00722d5b26ecesm3013989ejc.205.2022.07.30.08.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jul 2022 08:06:48 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/2] staging: r8188eu: convert dump_chip_info() to use netdev_dbg()
Date: Sat, 30 Jul 2022 17:06:36 +0200
Message-Id: <20220730150637.3550-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220730150637.3550-1-straube.linux@gmail.com>
References: <20220730150637.3550-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drivers should not spam the kernel log if they work properly. Convert
the dump_chip_info() function to use netdev_dbg() instead of pr_info()
so that developers can still enable it if they want to see this
information.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 5b8f1a912bbb..012828a05e6c 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -526,8 +526,9 @@ void rtl8188e_ReadEFuse(struct adapter *Adapter, u16 _size_byte, u8 *pbuf)
 	Hal_EfuseReadEFuse88E(Adapter, 0, _size_byte, pbuf);
 }
 
-static void dump_chip_info(struct HAL_VERSION chip_vers)
+static void dump_chip_info(struct adapter *adapter, struct HAL_VERSION chip_vers)
 {
+	struct net_device *netdev = adapter->pnetdev;
 	uint cnt = 0;
 	char buf[128];
 
@@ -560,9 +561,9 @@ static void dump_chip_info(struct HAL_VERSION chip_vers)
 
 	cnt += sprintf((buf + cnt), "1T1R_");
 
-	cnt += sprintf((buf + cnt), "RomVer(%d)\n", 0);
+	cnt += sprintf((buf + cnt), "RomVer(%d)", 0);
 
-	pr_info("%s", buf);
+	netdev_dbg(netdev, "%s\n", buf);
 }
 
 void rtl8188e_read_chip_version(struct adapter *padapter)
@@ -581,7 +582,7 @@ void rtl8188e_read_chip_version(struct adapter *padapter)
 	ChipVersion.VendorType = ((value32 & VENDOR_ID) ? CHIP_VENDOR_UMC : CHIP_VENDOR_TSMC);
 	ChipVersion.CUTVersion = (value32 & CHIP_VER_RTL_MASK) >> CHIP_VER_RTL_SHIFT; /*  IC version (CUT) */
 
-	dump_chip_info(ChipVersion);
+	dump_chip_info(padapter, ChipVersion);
 
 	pHalData->VersionID = ChipVersion;
 }
-- 
2.37.1

