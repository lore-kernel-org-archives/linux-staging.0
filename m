Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B9620EB
	for <linux-staging@lists.linux.dev>; Wed,  7 Sep 2022 18:58:24 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id c11so17740277wrp.11
        for <linux-staging@lists.linux.dev>; Wed, 07 Sep 2022 11:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date;
        bh=EpN9nAZHe4FLWbynC4qV4oeheBucWaI+6n2jtxrb1Wc=;
        b=phTeBa+YMyITgcpCTzaX4gotcvsgWoiwGFWRxH9w+kiTpAiLVk2O2nCWLGlo6GIsi7
         Mf5l1RuKeD+sBFOobIt676ru1x1ishFduUOqx3zemptBmFgTSXpzhUj7yJ4Q0maSpIDC
         f83SBjHUt/CJv5WrCSHVh1aQ65OCrvOMeh+f+vbe2TG/QdhQq9bdOsahKVFUtWFNJ8gj
         iMdh/HQdmKahl1TmhFM1u1pf+VxdoxPq/s7goX+/9btTOQlWALuGGd/mJwbWSxgbrvnH
         y/Iy9f6YE40KyW6aN0aGe9FsmRZhEXxoXqLtyTuF7YAmdI2YGKYQiC8Lvl4mzOHjTo9o
         1f+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date;
        bh=EpN9nAZHe4FLWbynC4qV4oeheBucWaI+6n2jtxrb1Wc=;
        b=M+qwQHCSXK9JqjVgsHjPK+hMteT7ho1F125M16eo5L25ZwWZoYu12O85p46GdeVcjm
         UO8iA+l06p/qzWZyHRrgTOfmoUhC3YvBinR44PmWqTqMYvvI3hFijBhv1rSeNyfvT6bT
         +uPJpKx9RKEeGNiiTMDAeabMG6JbS4AKsFuwlxBhlgBG8MvsdE6q1FOmulOci7ITf5wM
         p5UMD3SRtE/5Z2JFkll9A3qDaPxDueoG41ZvNdh5UYtNGaKPYsXQl/7wC7H1L4M3Nqj8
         SCgz4sn2qzoXjWY8x7JY6OHjqj1zPtczxdiLWiTKmdTAyDZJu5g/a4tGEIY2EgSuDtft
         j0WQ==
X-Gm-Message-State: ACgBeo0En8Ujn4TGG4EZRWQmMPgR/FnH85OFf2WeCocmXsld+G6jlJVs
	c3ELpBpbwhEui6kPJpPD5Yg=
X-Google-Smtp-Source: AA6agR7FR5bsFjw0IJwsT+2eJi+MEDhwyHAwEghokJTD0mBtYl+Ec+PaF3A5Ajuc3R/j9+s64+cxIg==
X-Received: by 2002:adf:d22f:0:b0:228:75b0:90c9 with SMTP id k15-20020adfd22f000000b0022875b090c9mr2933780wrh.490.1662577102890;
        Wed, 07 Sep 2022 11:58:22 -0700 (PDT)
Received: from root ([41.80.98.223])
        by smtp.gmail.com with ESMTPSA id s8-20020a1cf208000000b003a83fda1dc5sm19534721wmc.44.2022.09.07.11.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 11:58:22 -0700 (PDT)
Date: Wed, 7 Sep 2022 21:58:15 +0300
From: Robert Mindo <mindo.robert1@gmail.com>
To: forest@alittletooquiet.net
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	inux-kernel@vger.kernel.org
Subject: [PATCH]  Adding description for device.h and Kconfig
Message-ID: <YxjpxztBvDdUM4dA@root>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Signed-off-by: Robert Mindo <mindo.robert1@gmail.com>
---
 drivers/staging/vt6655/Kconfig  | 2 ++
 drivers/staging/vt6655/device.h | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vt6655/Kconfig b/drivers/staging/vt6655/Kconfig
index d1cd5de46dcf..57d34f05888c 100644
--- a/drivers/staging/vt6655/Kconfig
+++ b/drivers/staging/vt6655/Kconfig
@@ -4,3 +4,5 @@ config VT6655
    depends on PCI && MAC80211 && m
    help
      This is a vendor-written driver for VIA VT6655.
+#WLAN Open Source ndiswrapper driver.  VT6655 WLAN Open Source ndiswrapper driver. For Fedora Linux Core 7/­Mandriva 2007.1/­Debian 4.0r0/­Ubuntu 7.04 (x86/­x86_­64).
+#WIFI Wireless WLAN Card Drivers
diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index c272a4ab2fa0..a48021f134e0 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -129,7 +129,7 @@ struct vnt_private {
 	u32                         ioaddr;
 
 	spinlock_t                  lock;
-
+	//spinlock_t -  variable which can be in two states
 	volatile int                iTDUsed[TYPE_MAXTD];
 
 	struct vnt_tx_desc *apCurrTD[TYPE_MAXTD];
-- 
2.34.1

