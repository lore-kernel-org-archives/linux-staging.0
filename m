Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B893481
	for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 13:21:06 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id d6so5516062edt.7
        for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 06:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1MF64PGrmt62Tg3j2Q8W8RIILeBRNoYtBq41HoRE+f8=;
        b=Wk4r4UmWMdTkahOuUTgKY3b/kkLo4kOnU9ruGThHRLnmCjrbxGhF5ByAcM9knzRGB/
         ydVnqqok/wpUfdE8PN5Sfu57qiGKeRsx17qopPatENupqKtN0eh3J6qdyCCuEGvX3Iq1
         N6FVjC0wQJYzfC9oHKSQf6pvatKt+mc9An6GlaEGuYm5BYs1OfoXsgp+VbTMzPRTAx8T
         fvp1tOlZbMmC0NNQAYDDNfQp5qHgwQD3ElL5nuOqmxRNBBW/ANjnFPLrpsW7Nh2RmD9U
         V1h8PGNaiabQvlDPZaBCTYC2hmF12jU0ZmJyLvO3nKuCcsh8ztKFdkvUEZIkv6VYCYyW
         YUaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1MF64PGrmt62Tg3j2Q8W8RIILeBRNoYtBq41HoRE+f8=;
        b=KFF+0ItUCQeTXE0nyGOYT/5Iyd8R/iUNnT/PuAROGfnDyOyo9v11qqEuaBx6UWxbg5
         aPA7hMCiKK18Qn+nCOMikBqCnmc+sCDhJIaJ1h8xPR7zjKD5UH3zeKMxfCWID+g2BJ6a
         tL9maChZNd82mUMMOszmBDHFIAF7iPNl9scVqhQjfE7+6gthiifTZzCkEpd6cp7bexhz
         COvya4FTXmQSJKjTawGB7/98AoYA1kaf5d/qv/0fg0ZtgmnBGqFgXTM02SvQHHTrWw+f
         xyMHw2seI8cDaYno+WjLHdqsuKOLD3hn6IwcODRA8SED9JyGQ1da8sSu5Pmp9MsuMPAN
         4WYw==
X-Gm-Message-State: AOAM533xfHGUh15GSGcYtt52fmCoAY0ugKslxoOJPbUSTyB7ybKdcKiW
	aZ0bskBgWtWs8rOAQwTsKyY=
X-Google-Smtp-Source: ABdhPJzKMddgf17FtXkd9arNIjU06NhHc9zNsFPHVoNUFbMZgzmVc9mSKSbA9gAUjnq01M62vz7LEA==
X-Received: by 2002:a05:6402:1c83:: with SMTP id cy3mr3000977edb.231.1627651265147;
        Fri, 30 Jul 2021 06:21:05 -0700 (PDT)
Received: from agape ([5.171.81.215])
        by smtp.gmail.com with ESMTPSA id lw22sm560218ejb.74.2021.07.30.06.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 06:21:04 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Sterba <dsterba@suse.cz>
Subject: [PATCH] staging: rtl8723bs: remove unused BIT macros definitions
Date: Fri, 30 Jul 2021 15:21:03 +0200
Message-Id: <20210730132103.4996-1-fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

BIT(x) macro used all over the driver is defined in
include/vsdo/bit.h as

- #define BIT(nr)	(UL(1) << (nr))

which is safer than the local BIT macros declared.
Local macros shift a signed integer which brings
unespected results. For example:

(unsigned long)(1 << 31) => 0xffffffff80000000

shift.c:

int main() {
        printf("%lx\n", (unsigned long)(1 << 31));
        printf("%lx\n", (unsigned long)(1U << 31));
        return 0;
}
---

$ ./shift
ffffffff80000000
80000000
---

So just remove redundant, less safe macro declarations.

Suggested-by: David Sterba <dsterba@suse.cz>
Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/osdep_service.h | 4 ----
 drivers/staging/rtl8723bs/include/wifi.h          | 8 --------
 2 files changed, 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index b49838c7e457..bde415db4114 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -14,10 +14,6 @@
 
 #include <osdep_service_linux.h>
 
-#ifndef BIT
-	#define BIT(x)	(1 << (x))
-#endif
-
 #define BIT0	0x00000001
 #define BIT1	0x00000002
 #define BIT2	0x00000004
diff --git a/drivers/staging/rtl8723bs/include/wifi.h b/drivers/staging/rtl8723bs/include/wifi.h
index 0bd7b662b972..f03e26818d45 100644
--- a/drivers/staging/rtl8723bs/include/wifi.h
+++ b/drivers/staging/rtl8723bs/include/wifi.h
@@ -7,14 +7,6 @@
 #ifndef _WIFI_H_
 #define _WIFI_H_
 
-
-#ifdef BIT
-/* error	"BIT define occurred earlier elsewhere!\n" */
-#undef BIT
-#endif
-#define BIT(x)	(1 << (x))
-
-
 #define WLAN_ETHHDR_LEN		14
 #define WLAN_ETHADDR_LEN	6
 #define WLAN_IEEE_OUI_LEN	3
-- 
2.20.1

