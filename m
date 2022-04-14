Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075B428F5
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 14:12:28 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id c12so4738919plr.6
        for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 07:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=7EpAfNCEgcjmMHpykH3TTrAGaZYl2tMEUW4c00yTRbk=;
        b=h4T2hdpkgg4QKMBMoMcADynwg/A6DzzCrtjGmEgj2Fi82w9eUKnEFLAYzEziAbFt0i
         B7E3lW5t9uDWrEEkQUJHsD+lv0SaRayBvAQTLxIn6Uhx+mhQV6F2ZSlVHp6OU4hNVU8R
         nfD/yqbhibiEMO8Nqlw7mWaRGuFtL3Ox+XPcIsrf3YI2uhW2RUV2PwqBcSjvL3dAOgOM
         eJ6Z+7QZQayQ93Gynm5wF4G7bMV2R4ZSSud0Hu0wriFWWx48MyUwrBw75x5ZjMcwEEui
         7NLq0pAtGiyp/7i8fFh531UY4+fec9AUsXoIdIzEo71L+9kpyS3am+V80rPp0oe0DS9f
         aTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=7EpAfNCEgcjmMHpykH3TTrAGaZYl2tMEUW4c00yTRbk=;
        b=I2PI5WXi3qUZEXQ8xiy6KiBWlazCMMx5H1o6qaLk0R0vvs4J+Yt2gbRbFLdRMU4owU
         mD43rgoweszvEuWlwxMCz74Cz4RCxQdSzrN3Utd1MA5ikQrHWFQTcbpMyqmq4ZdYe/Qt
         9ay7c7+tg6lgmpvZDjNyiWPVD1YEKLVwzaeeVxx/1VYMNYyprlv/EKgAuWRSrvSb5fZk
         bTo+SCj4V5LhxdFzoXpeOooE/PrtTOvyWx1HKVJftodite80XFsHxjURQE/HclXwXFYg
         hJQfMKQHa0qf1DkGoLWje+riUwauC0bjG3GkWFaw72oKCMix1Ar1OGoE0Ux6GPd92U0u
         1DcA==
X-Gm-Message-State: AOAM530hDGKpVfV3ESVW5giponR4gDazCXCFxfOvmNBe3oPcbsATtf6t
	v2VRiqvA8cnaTBJbuCD3X2BmN4wM2Z4OE/dN
X-Google-Smtp-Source: ABdhPJylqSJGou81MV7kgJts2um3oarMvR48TsZvT5mqcQRgN2bKORRcwc8oFX4yUTHCWE3aj8lLGg==
X-Received: by 2002:a17:902:ef47:b0:156:646b:58e7 with SMTP id e7-20020a170902ef4700b00156646b58e7mr46865578plx.57.1649945548405;
        Thu, 14 Apr 2022 07:12:28 -0700 (PDT)
Received: from localhost ([152.70.90.187])
        by smtp.gmail.com with ESMTPSA id a38-20020a056a001d2600b004fae885424dsm137106pfx.72.2022.04.14.07.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 07:12:27 -0700 (PDT)
Date: Thu, 14 Apr 2022 22:12:23 +0800
From: Wang Cheng <wanngchenng@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8712: fix uninit-value "data" and "mac"
Message-ID: <20220414141223.qwiznrwgjyywngfg@ppc.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Due to the case that "requesttype == 0x01 && status <= 0"
isn't handled in r8712_usbctrl_vendorreq(),
"data" (drivers/staging/rtl8712/usb_ops.c:32)
will be returned without initialization.

When "tmpU1b" (drivers/staging/rtl8712/usb_intf.c:395)
is 0, mac[6] (usb_intf.c:394) won't be initialized,
which leads to accessing uninit-value on usb_intf.c:541.

Reported-and-tested-by: syzbot+6f5ecd144854c0d8580b@syzkaller.appspotmail.com
Signed-off-by: Wang Cheng <wanngchenng@gmail.com>
---
 drivers/staging/rtl8712/usb_intf.c      |  6 +++---
 drivers/staging/rtl8712/usb_ops_linux.c | 14 ++++++++------
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8712/usb_intf.c b/drivers/staging/rtl8712/usb_intf.c
index ee4c61f85a07..50dcd3ecb685 100644
--- a/drivers/staging/rtl8712/usb_intf.c
+++ b/drivers/staging/rtl8712/usb_intf.c
@@ -538,13 +538,13 @@ static int r871xu_drv_init(struct usb_interface *pusb_intf,
 		} else {
 			AutoloadFail = false;
 		}
-		if (((mac[0] == 0xff) && (mac[1] == 0xff) &&
+		if ((!AutoloadFail) ||
+		    ((mac[0] == 0xff) && (mac[1] == 0xff) &&
 		     (mac[2] == 0xff) && (mac[3] == 0xff) &&
 		     (mac[4] == 0xff) && (mac[5] == 0xff)) ||
 		    ((mac[0] == 0x00) && (mac[1] == 0x00) &&
 		     (mac[2] == 0x00) && (mac[3] == 0x00) &&
-		     (mac[4] == 0x00) && (mac[5] == 0x00)) ||
-		     (!AutoloadFail)) {
+		     (mac[4] == 0x00) && (mac[5] == 0x00))) {
 			mac[0] = 0x00;
 			mac[1] = 0xe0;
 			mac[2] = 0x4c;
diff --git a/drivers/staging/rtl8712/usb_ops_linux.c b/drivers/staging/rtl8712/usb_ops_linux.c
index f984a5ab2c6f..e321ca4453ca 100644
--- a/drivers/staging/rtl8712/usb_ops_linux.c
+++ b/drivers/staging/rtl8712/usb_ops_linux.c
@@ -495,12 +495,14 @@ int r8712_usbctrl_vendorreq(struct intf_priv *pintfpriv, u8 request, u16 value,
 	}
 	status = usb_control_msg(udev, pipe, request, reqtype, value, index,
 				 pIo_buf, len, 500);
-	if (status > 0) {  /* Success this control transfer. */
-		if (requesttype == 0x01) {
-			/* For Control read transfer, we have to copy the read
-			 * data from pIo_buf to pdata.
-			 */
-			memcpy(pdata, pIo_buf,  status);
+	/* For Control read transfer, copy the read data from pIo_buf to pdata
+	 * when control transfer success; otherwise init *pdata with 0.
+	 */
+	if (requesttype == 0x01) {
+		if (status > 0)
+			memcpy(pdata, pIo_buf, status);
+		else
+			*(u32 *)pdata = 0;
 		}
 	}
 	kfree(palloc_buf);
-- 
2.33.1

