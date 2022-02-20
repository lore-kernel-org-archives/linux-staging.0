Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77035EA4
	for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 23:16:13 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id l73so12730976pge.11
        for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 15:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v+5D+f5AfXBOIxZqw3DuNGRZ2y8wgJVOd1esBx4G8SU=;
        b=L2f5+v1ifU3oarN26hOPJsm1Z2PpZlfWx9qdGUlh7o2u97XDcRAJXok2D5loBIB6oH
         GEgNgK3QaA5Ujst0njEzerhPqydz4ZMG8fGUAOiIdKsBPIvrUNg0+hX09d/uHePLBt9w
         1sx335FK3IyUsNYEH6dbNZ8VidQyFZea7X13qty8OA4z2fJ5ggXwO9vifBEXtyC5BL7u
         +Nh6jSt8xzGrHdDqMPQm/07Hyw5fKFcn/yVZNZ7+WrJx2toA/2uOLfj+uDKCKBtQiODL
         xKUlau8UGS4wEOq6WiqHzLB+3IPuQf/Aj7zC354c1QAAL1nIj98NVT1NazV9d/88V3FI
         y4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v+5D+f5AfXBOIxZqw3DuNGRZ2y8wgJVOd1esBx4G8SU=;
        b=TVxatlcL5FY9mx6cJLdpznSIn1WU8XqSRI6s/DrY6azIN/cwQChZDtyqXG/siZCBQw
         F0EotkdIHPFtT+U2ZWglk2KlnUGUUhrtmDR7Tw6l72H0CU7lQnvqpfmi22HUbdcYDFAO
         shxKU+/ecQFTifgytozABFPsj0g0QnIp5oyIovHU38GdbsPc+9SCKjKG4uqX3A2aCEva
         PXW6jhs6qEIKGmK0Jky35BbJpR8JNBkUHXAtzbhn3o1YyEVFsqKBTtf8Cs+fPY40QjLO
         orQ6vVfOMqwz7gMv79rsFfx/1Ur+os3NRB9KjYcwnpd56AclvG8Yqu+goehzm9KDgYUg
         1H+w==
X-Gm-Message-State: AOAM531zEa0q6lsh4RL5Dszw//LJT5/eGotneTK0lk8hMjupK7zP0bgb
	wfg7EdIPJ60nEqlXErpIXb0=
X-Google-Smtp-Source: ABdhPJzXK6lO+JuFiE+zOSXtibF/o69FEKgc7NC+abAX4mpznSrgITRs+qeSwdvviBiO6qX7se/MCg==
X-Received: by 2002:a05:6a00:1354:b0:4c9:1e96:d15c with SMTP id k20-20020a056a00135400b004c91e96d15cmr17446602pfu.30.1645398972881;
        Sun, 20 Feb 2022 15:16:12 -0800 (PST)
Received: from tong-desktop.local ([2600:1700:3ec7:421f:4bcb:4067:79cf:393f])
        by smtp.googlemail.com with ESMTPSA id j4sm3092087pfj.218.2022.02.20.15.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 15:16:12 -0800 (PST)
From: Tong Zhang <ztong0001@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Lee Jones <lee.jones@linaro.org>,
	Colin Ian King <colin.i.king@googlemail.com>,
	Saurav Girepunje <saurav.girepunje@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Tong Zhang <ztong0001@gmail.com>,
	=?UTF-8?q?Cl=C3=A1udio=20Maia?= <clrrm@isep.ipp.pt>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8192u: cleanup proc fs entries upon exit
Date: Sun, 20 Feb 2022 15:15:53 -0800
Message-Id: <20220220231554.2510567-1-ztong0001@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

proc fs entries need to be removed when module is removed, otherwise
when we try to insert the module again, kernel will complain

[  493.068012] proc_dir_entry 'net/ieee80211' already registered
[  493.271973]  proc_mkdir+0x18/0x20
[  493.272136]  ieee80211_debug_init+0x28/0xde8 [r8192u_usb]
[  493.272404]  rtl8192_usb_module_init+0x10/0x161 [r8192u_usb]

[   13.910616] proc_dir_entry 'net/rtl819xU' already registered
[   13.918931]  proc_mkdir+0x18/0x20
[   13.919098]  rtl8192_usb_module_init+0x142/0x16d [r8192u_usb]

Signed-off-by: Tong Zhang <ztong0001@gmail.com>
---
 drivers/staging/rtl8192u/r8192U_core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
index 364e1ca94f70..683afdc667bc 100644
--- a/drivers/staging/rtl8192u/r8192U_core.c
+++ b/drivers/staging/rtl8192u/r8192U_core.c
@@ -4825,6 +4825,11 @@ static int __init rtl8192_usb_module_init(void)
 static void __exit rtl8192_usb_module_exit(void)
 {
 	usb_deregister(&rtl8192_usb_driver);
+	remove_proc_entry(RTL819XU_MODULE_NAME, init_net.proc_net);
+
+#ifdef CONFIG_IEEE80211_DEBUG
+	ieee80211_debug_exit();
+#endif
 
 	RT_TRACE(COMP_DOWN, "Exiting");
 }
-- 
2.25.1

