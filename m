Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D5C3481
	for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 13:40:52 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id qk33so16817635ejc.12
        for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 06:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7470Qthj2WoaNQVaHaNL2p6JSX91F+g/VNrFt77iGeI=;
        b=nvjUC4gNjw2JuQDVO6ggPrZDVysNA8E0HOXRenPw/LZLrKVY+Ao+hUmV4KemczMwmt
         zrmr32M65dBC3hNaqV7M5CaLsA/kSVQdubQMKQULsVI/mOTBDSowi1kNAh5IuriJxTSC
         dQd85zJOWN30aLDjqqBFDPjgNGgjc8axDWFVPFv4zGFkd0Ye/lLeO9pAjp9PY1wGACDi
         IYP4ZQ1yE//NP1ZCnMjJFvf69WJJiQoLvH6vy1AG6GMHOb6HZbeOOpDWI/RLbzQw5/T4
         xA9ZsJwtmd6Mesu41u73x7qU/nUWpBmNLfgqiSrGtF77g6bKSfVDLRGRFhb/x/he6HTO
         CJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7470Qthj2WoaNQVaHaNL2p6JSX91F+g/VNrFt77iGeI=;
        b=dQSZ4vgbYfVgiCOIgQjG7T5cut1tTvL2dUU5C20WaGUHkSJZy65qHFCULTnN6QI04e
         9T2VlRvOlMFPDE75kRIJ4TD+uzjimhpHu30sqDvrRwvze6krMHeWDiUIMgell+qQDVka
         e27Tlz695d0n7Dqgnfn/94XanHP0eVsa7ZV7fvSKCyyvUe8xqfwUCknV5kw2L+bplb3a
         Vc9tPZswMleQ0Afswjk6Jz014p1MnuB6kGiyB7lBPMzxgjj/Lr0477NCf9U3SOX9HcN8
         AHwhjxGZWWj2s4Np7/mgTyPKkuBuZjejmuBrXNfdHWZHDIrMvUKJoZBdMdZjP/mSdj/M
         AA1w==
X-Gm-Message-State: AOAM533HaNCfw5/544+oIz4ji4O+5XPTmlV4RViOp2ZcBc1lYgYP7yF+
	2y/7r9O7SD9AzZLuqfPfVPw=
X-Google-Smtp-Source: ABdhPJxvlPv3Eu6LxFIMgqRhcsgQGVn9JrLOqSdWTuC38Omx10DRbw0NlAt+TMzgozC61Rnnrc+e0Q==
X-Received: by 2002:a17:906:43c9:: with SMTP id j9mr2591713ejn.57.1627652450605;
        Fri, 30 Jul 2021 06:40:50 -0700 (PDT)
Received: from agape ([5.171.81.215])
        by smtp.gmail.com with ESMTPSA id n13sm574146ejk.97.2021.07.30.06.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 06:40:50 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Sterba <dsterba@suse.cz>
Subject: [PATCH v2] staging: rtl8723bs: remove unused BIT macros definitions
Date: Fri, 30 Jul 2021 15:40:48 +0200
Message-Id: <20210730134048.8736-1-fabioaiuto83@gmail.com>
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

...

$ ./shift
ffffffff80000000
80000000

...

So just remove redundant, less safe macro declarations.

Suggested-by: David Sterba <dsterba@suse.cz>
Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
Changes in v2:
	- Edited changelog

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

