Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F3FEA9
	for <linux-staging@lists.linux.dev>; Mon, 16 May 2022 09:22:27 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id d25so13480563pfo.10
        for <linux-staging@lists.linux.dev>; Mon, 16 May 2022 02:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=f7Ye7S9bF0+J3zXCAL4bE/3o+UHQCQ8xFzsFLyWk6do=;
        b=cd+0eLpWLw4RctfIkaCyLs2ruXXEaKFiqenjRZIaJwJE4v4T1eDaB8E20QPPGwuPvm
         6Cbxq0e/CNIrCbDGfhGlwUXzvoK6tNle73S/abdr/nIKw6Fv3k8ndDSX28HZzrAaWkfM
         OSe2uSqSQIqV+7iuz3HKYNpcvwEsRhkWPmxA/2n9+Ca0tbtp4UNjD4GZgSr2Ay3K24gL
         +1ZnwF+0VoSj0JBYkun+ChnsUbVS/2PUB9sGBH39Tpql+F6FEvG4VH2tP+uZeXKAYWGs
         bCUDi2QNm5QNVvdCA8cWUGCinKrk6lFIydvg8coPYHaEnY9BNZ6Zv3KCRrDeJctAfoEs
         ynwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=f7Ye7S9bF0+J3zXCAL4bE/3o+UHQCQ8xFzsFLyWk6do=;
        b=rXmQ0mh7cwSPFmDWAoClasYG9zHEujcY7SSItLHme25W3q0Sqcf0R5kinVz5irSS92
         bGXoZyK6nkanYV0sQbkvnYFzoiVLskIUQHOJaZ2UEAAozZB9xnBmTeye0Tzedgmv33Pw
         URtf3bwtV4QVLGa4d1UTOd3zoLthaSSqRtOXFfxlHpqSgyyyvhbdf/GmyPpCXP9mHFlE
         gPJk9f+noDoe+8ArNAOoY/v+KVVIApBQcX1hUVUHG7zaSvoRXanuxlZYomW30xzZ+ZZB
         CFrnruG5ba5mHZwPvNEgrTNNFaOIKbLp8sjSg8OEj/nMViiv4edOHN+6ZETiu168T/Xq
         s3ag==
X-Gm-Message-State: AOAM530Sz6Z05XFHUP/zwC6aCWDGzfhUAoVXYh0LeryiAkYAchQxeetu
	UNAPAkqC/AcPy2Provnrqxu2HuwXC/+nbQ==
X-Google-Smtp-Source: ABdhPJyCzPDCTIwn1E4tRc1y+GDCXo1j7b1BxFw/z44+k6sRgPjRtjiWzdPqU42v1HfP25l5JZZAuA==
X-Received: by 2002:a63:8848:0:b0:3ab:2967:df83 with SMTP id l69-20020a638848000000b003ab2967df83mr14476120pgd.77.1652692947178;
        Mon, 16 May 2022 02:22:27 -0700 (PDT)
Received: from localhost ([152.70.90.187])
        by smtp.gmail.com with ESMTPSA id j17-20020a170902da9100b0015e8d4eb25asm6512410plx.164.2022.05.16.02.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 02:22:26 -0700 (PDT)
Date: Mon, 16 May 2022 17:22:23 +0800
From: Wang Cheng <wanngchenng@gmail.com>
To: dan.carpenter@oracle.com, paskripkin@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] staging: rtl8712: fix uninit-value in usb_read8() and
 friends
Message-ID: <b9b7a6ee02c02aa28054f5cf16129977775f3cd9.1652618244.git.wanngchenng@gmail.com>
References: <cover.1652618244.git.wanngchenng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1652618244.git.wanngchenng@gmail.com>

When r8712_usbctrl_vendorreq() returns negative, 'data' in
usb_read{8,16,32} will not be initialized.

BUG: KMSAN: uninit-value in string_nocheck lib/vsprintf.c:643 [inline]
BUG: KMSAN: uninit-value in string+0x4ec/0x6f0 lib/vsprintf.c:725
 string_nocheck lib/vsprintf.c:643 [inline]
 string+0x4ec/0x6f0 lib/vsprintf.c:725
 vsnprintf+0x2222/0x3650 lib/vsprintf.c:2806
 va_format lib/vsprintf.c:1704 [inline]
 pointer+0x18e6/0x1f70 lib/vsprintf.c:2443
 vsnprintf+0x1a9b/0x3650 lib/vsprintf.c:2810
 vprintk_store+0x537/0x2150 kernel/printk/printk.c:2158
 vprintk_emit+0x28b/0xab0 kernel/printk/printk.c:2256
 dev_vprintk_emit+0x5ef/0x6d0 drivers/base/core.c:4604
 dev_printk_emit+0x1dd/0x21f drivers/base/core.c:4615
 __dev_printk+0x3be/0x440 drivers/base/core.c:4627
 _dev_info+0x1ea/0x22f drivers/base/core.c:4673
 r871xu_drv_init+0x1929/0x3070 drivers/staging/rtl8712/usb_intf.c:401
 usb_probe_interface+0xf19/0x1600 drivers/usb/core/driver.c:396
 really_probe+0x6c7/0x1350 drivers/base/dd.c:621
 __driver_probe_device+0x3e9/0x530 drivers/base/dd.c:752
 driver_probe_device drivers/base/dd.c:782 [inline]
 __device_attach_driver+0x79f/0x1120 drivers/base/dd.c:899
 bus_for_each_drv+0x2d6/0x3f0 drivers/base/bus.c:427
 __device_attach+0x593/0x8e0 drivers/base/dd.c:970
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:1017
 bus_probe_device+0x17b/0x3e0 drivers/base/bus.c:487
 device_add+0x1fff/0x26e0 drivers/base/core.c:3405
 usb_set_configuration+0x37e9/0x3ed0 drivers/usb/core/message.c:2170
 usb_generic_driver_probe+0x13c/0x300 drivers/usb/core/generic.c:238
 usb_probe_device+0x309/0x570 drivers/usb/core/driver.c:293
 really_probe+0x6c7/0x1350 drivers/base/dd.c:621
 __driver_probe_device+0x3e9/0x530 drivers/base/dd.c:752
 driver_probe_device drivers/base/dd.c:782 [inline]
 __device_attach_driver+0x79f/0x1120 drivers/base/dd.c:899
 bus_for_each_drv+0x2d6/0x3f0 drivers/base/bus.c:427
 __device_attach+0x593/0x8e0 drivers/base/dd.c:970
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:1017
 bus_probe_device+0x17b/0x3e0 drivers/base/bus.c:487
 device_add+0x1fff/0x26e0 drivers/base/core.c:3405
 usb_new_device+0x1b91/0x2950 drivers/usb/core/hub.c:2566
 hub_port_connect drivers/usb/core/hub.c:5363 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5507 [inline]
 port_event drivers/usb/core/hub.c:5665 [inline]
 hub_event+0x58e3/0x89e0 drivers/usb/core/hub.c:5747
 process_one_work+0xdb6/0x1820 kernel/workqueue.c:2289
 worker_thread+0x10d0/0x2240 kernel/workqueue.c:2436
 kthread+0x3c7/0x500 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30

Local variable data created at:
 usb_read8+0x5d/0x130 drivers/staging/rtl8712/usb_ops.c:33
 r8712_read8+0xa5/0xd0 drivers/staging/rtl8712/rtl8712_io.c:29

KMSAN: uninit-value in r871xu_drv_init
https://syzkaller.appspot.com/bug?id=3cd92b1d85428b128503bfa7a250294c9ae00bd8

Signed-off-by: Wang Cheng <wanngchenng@gmail.com>
Reported-by: <syzbot+6f5ecd144854c0d8580b@syzkaller.appspotmail.com>
Tested-by: <syzbot+6f5ecd144854c0d8580b@syzkaller.appspotmail.com>
---
 drivers/staging/rtl8712/usb_ops.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8712/usb_ops.c b/drivers/staging/rtl8712/usb_ops.c
index e64845e6adf3..af9966d03979 100644
--- a/drivers/staging/rtl8712/usb_ops.c
+++ b/drivers/staging/rtl8712/usb_ops.c
@@ -29,7 +29,8 @@ static u8 usb_read8(struct intf_hdl *intfhdl, u32 addr)
 	u16 wvalue;
 	u16 index;
 	u16 len;
-	__le32 data;
+	int status;
+	__le32 data = 0;
 	struct intf_priv *intfpriv = intfhdl->pintfpriv;
 
 	request = 0x05;
@@ -37,8 +38,10 @@ static u8 usb_read8(struct intf_hdl *intfhdl, u32 addr)
 	index = 0;
 	wvalue = (u16)(addr & 0x0000ffff);
 	len = 1;
-	r8712_usbctrl_vendorreq(intfpriv, request, wvalue, index, &data, len,
-				requesttype);
+	status = r8712_usbctrl_vendorreq(intfpriv, request, wvalue, index,
+					 &data, len, requesttype);
+	if (status < 0)
+		return 0;
 	return (u8)(le32_to_cpu(data) & 0x0ff);
 }
 
@@ -49,7 +52,8 @@ static u16 usb_read16(struct intf_hdl *intfhdl, u32 addr)
 	u16 wvalue;
 	u16 index;
 	u16 len;
-	__le32 data;
+	int status;
+	__le32 data = 0;
 	struct intf_priv *intfpriv = intfhdl->pintfpriv;
 
 	request = 0x05;
@@ -57,8 +61,10 @@ static u16 usb_read16(struct intf_hdl *intfhdl, u32 addr)
 	index = 0;
 	wvalue = (u16)(addr & 0x0000ffff);
 	len = 2;
-	r8712_usbctrl_vendorreq(intfpriv, request, wvalue, index, &data, len,
-				requesttype);
+	status = r8712_usbctrl_vendorreq(intfpriv, request, wvalue, index,
+					 &data, len, requesttype);
+	if (status < 0)
+		return 0;
 	return (u16)(le32_to_cpu(data) & 0xffff);
 }
 
@@ -69,7 +75,8 @@ static u32 usb_read32(struct intf_hdl *intfhdl, u32 addr)
 	u16 wvalue;
 	u16 index;
 	u16 len;
-	__le32 data;
+	int status;
+	__le32 data = 0;
 	struct intf_priv *intfpriv = intfhdl->pintfpriv;
 
 	request = 0x05;
@@ -77,8 +84,10 @@ static u32 usb_read32(struct intf_hdl *intfhdl, u32 addr)
 	index = 0;
 	wvalue = (u16)(addr & 0x0000ffff);
 	len = 4;
-	r8712_usbctrl_vendorreq(intfpriv, request, wvalue, index, &data, len,
-				requesttype);
+	status = r8712_usbctrl_vendorreq(intfpriv, request, wvalue, index,
+					 &data, len, requesttype);
+	if (status < 0)
+		return 0;
 	return le32_to_cpu(data);
 }
 
-- 
2.33.1

