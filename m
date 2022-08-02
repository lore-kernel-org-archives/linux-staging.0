Received: from mx01.ayax.eu (mx01.ayax.eu [188.137.98.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9BF7F
	for <linux-staging@lists.linux.dev>; Tue,  2 Aug 2022 17:19:01 +0000 (UTC)
Received: from [192.168.192.146] (port=52064 helo=nx64de-df6d00)
	by mx01.ayax.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <gszymaszek@short.pl>)
	id 1oIvXZ-0003VR-Qw; Tue, 02 Aug 2022 19:18:46 +0200
Date: Tue, 2 Aug 2022 19:18:44 +0200
From: Grzegorz Szymaszek <gszymaszek@short.pl>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Greg KH <greg@kroah.com>, Phillip Potter <phil@philpotter.co.uk>,
	Grzegorz Szymaszek <gszymaszek@short.pl>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH] staging: r8188eu: add firmware dependency
Message-ID: <YulcdKfhA8dPQ78s@nx64de-df6d00>
Mail-Followup-To: Grzegorz Szymaszek <gszymaszek@short.pl>,
	Larry Finger <Larry.Finger@lwfinger.net>, Greg KH <greg@kroah.com>,
	Phillip Potter <phil@philpotter.co.uk>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <YukkBu3TNODO3or9@nx64de-df6d00>
 <YukvnVWuhUeOgRyZ@kroah.com>
 <Yukx8KEEOhKTJ7HQ@nx64de-df6d00>
 <c82114b6-1003-bfb5-0550-98dcbf1a3761@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The old rtl8188eu module, removed in commit 55dfa29b43d2 ("staging:
rtl8188eu: remove rtl8188eu driver from staging dir") (Linux kernel
v5.15-rc1), required (through a MODULE_FIRMWARE call()) the
rtlwifi/rtl8188eufw.bin firmware file, which the new r8188eu driver no
longer requires.

I have tested a few RTL8188EUS-based Wi-Fi cards and, while supported by
both drivers, they do not work when using the new one and the firmware
wasn't manually loaded. According to Larry Finger, the module
maintainer, all such cards need the firmware and the driver should
depend on it (see the linked mails).

Add a proper MODULE_FIRMWARE() call, like it was done in the old driver.

Thanks to Greg Kroah-Hartman and Larry Finger for quick responses to my
questions.

Link: https://answers.launchpad.net/ubuntu/+source/linux-meta-hwe-5.15/+question/702611
Link: https://lore.kernel.org/lkml/YukkBu3TNODO3or9@nx64de-df6d00/
Signed-off-by: Grzegorz Szymaszek <gszymaszek@short.pl>
---
 drivers/staging/r8188eu/os_dep/os_intfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index 891c85b088ca..5bd3022e4b40 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -18,6 +18,7 @@ MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Realtek Wireless Lan Driver");
 MODULE_AUTHOR("Realtek Semiconductor Corp.");
 MODULE_VERSION(DRIVERVERSION);
+MODULE_FIRMWARE("rtlwifi/rtl8188eufw.bin");
 
 #define CONFIG_BR_EXT_BRNAME "br0"
 #define RTW_NOTCH_FILTER 0 /* 0:Disable, 1:Enable, */
-- 
2.35.1
