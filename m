Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FFE2C82
	for <linux-staging@lists.linux.dev>; Thu, 18 Nov 2021 16:37:47 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id g1so5001338qvd.2
        for <linux-staging@lists.linux.dev>; Thu, 18 Nov 2021 08:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=pSDNg80493fut07zaTmn/GvN0K5Bc/EnOeDXSuboEJQ=;
        b=MEibWW5HaPyACfDuXx9a3DKFpHiik41nFWAJLeqrzTfDZ0ryUZWCAYfq4JAaVSBVui
         RDk3O59kNr1Mi7BJowgfqudRz89EHqwQDDJ3H7iouowPY7K2OVvu/7eNNiQnar/C1fGn
         XPb0nAq8X8a0WGdc3+C8/DhPnw4Sxn2E4Zs5bok6Oe2fmL6AnFHFS9p45H6vxDZ1AdBb
         pO8FkGDZPaw3bHMfa8SPwKX1wFE2aXvWAMwgzdZ2Ok+ugymGnSUr75etGlQZPGE8FMz1
         Ny3UTKSOOqDcl7CWIYHZtx39T3V2Z8/9G5+y5gKWMAhlAA1iBGo0xo6rOHQJyvB56lEZ
         CUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=pSDNg80493fut07zaTmn/GvN0K5Bc/EnOeDXSuboEJQ=;
        b=2OqN2SGhljtlPOXgxtyGBBjX1XaaYwGwQPE+5QinAr3sBMtjV7MCfTNj5f4zIBX106
         IskJPC9Pdv+fp9Qt3ppZ/FIs0A4a+2+LejNCt4J7CXCNfDn0LpIeqv1rWH6h6t0VgdUR
         7dfTibFX+6vEPvyHNH/HN+TsHOz5jCHYQ46GcZ+hyDwD83NuUYmM0tlXSXLKUYlBO3Uu
         1EpGMEkUtNpzvOKaGZB4bEzrZ8zCXadsNpWnsPeRgo0fmBKADdQDeRSI59mWYHUoFBQN
         LN2nTRy+ZNF5KFXqrKPfvCRU26PhnCcU4+EiPXFJ/bzbJwSED8GJFGC0RYQL47ZwSwvk
         eI1Q==
X-Gm-Message-State: AOAM532uso2PSbxjsodsNJaxUsuoR9VHxFFBo5wc2ud+jcKfa65VLRD8
	I1wl2yKUnthHgWtsuEx6sA==
X-Google-Smtp-Source: ABdhPJwrSKy0kT6Pbt0HOmFeiOlBEvNNzaXtiSXA0TU6zN2AjwCyzZq7uOL08b51DBvIKp2q9Fy6Qg==
X-Received: by 2002:ad4:5747:: with SMTP id q7mr65536897qvx.19.1637253466189;
        Thu, 18 Nov 2021 08:37:46 -0800 (PST)
Received: from mainframe.localdomain ([149.108.71.180])
        by smtp.gmail.com with ESMTPSA id n18sm115372qtk.9.2021.11.18.08.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 08:37:45 -0800 (PST)
Date: Thu, 18 Nov 2021 23:37:34 +0700
From: Candy Febriyanto <cfebriyanto@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Cc: Candy Febriyanto <cfebriyanto@gmail.com>
Subject: [PATCH] staging: r8188eu: Remove support for devices with 8188FU
 chipset (0bda:f179)
Message-ID: <YZaBTq9vlMaJDFz2@mainframe.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The new r8188eu driver doesn't actually support devices with vendor ID 0bda
and product ID f179[0][1][2], remove the ID so owners of these devices
don't have to blacklist the staging driver.

[0] https://github.com/lwfinger/rtl8188eu/issues/366#issuecomment-888511731
[1] https://github.com/lwfinger/rtl8188eu/issues/385
[2] https://github.com/lwfinger/rtl8188eu/issues/385#issuecomment-973013539

Cc: Larry Finger <Larry.Finger@lwfinger.net>
CC: Phillip Potter <phil@philpotter.co.uk>
Signed-off-by: Candy Febriyanto <cfebriyanto@gmail.com>
---
 drivers/staging/r8188eu/os_dep/usb_intf.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index eca1036a721f..ba74cfc9a523 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -29,7 +29,6 @@ static struct usb_device_id rtw_usb_id_tbl[] = {
 	/*=== Realtek demoboard ===*/
 	{USB_DEVICE(USB_VENDER_ID_REALTEK, 0x8179)}, /* 8188EUS */
 	{USB_DEVICE(USB_VENDER_ID_REALTEK, 0x0179)}, /* 8188ETV */
-	{USB_DEVICE(USB_VENDER_ID_REALTEK, 0xf179)}, /* 8188FU */
 	/*=== Customer ID ===*/
 	/****** 8188EUS ********/
 	{USB_DEVICE(0x07B8, 0x8179)}, /* Abocom - Abocom */
-- 
2.34.0

