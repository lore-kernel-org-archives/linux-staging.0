Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB523481
	for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 13:19:06 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id go31so16737556ejc.6
        for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 06:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1MF64PGrmt62Tg3j2Q8W8RIILeBRNoYtBq41HoRE+f8=;
        b=Tc9lEn7j6y/aCKAXrNMnvd+Q8kTkrCT6KqRNBpFm0jHiIsUEmqec2Bv0d6GycFf/uo
         B7dEGqczLg7gw/8SW1D214ApumxbhzQBLBLFvNDMs5XmaP2c/d83S7QenrvdUse+fEXn
         bFoJe9fTQl6b+u49HM2skCyEY/Bq4LZgtn8ruy8DtNvKh5IxzDFckUyxuSz8MfuJ1pv2
         BoeHP/qruhjRfcjjVToZWo48OqDxQABM4tBpeueDXD2TxjzaAgd+vSLx5HwFvgwC3Lpz
         B+H6kgFePYhf+LLOAlEqm3jK1SWa0ovlwvBOnlcdvTkDJ58w0NPrZ+3ncTm8yYzZZsdU
         meXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1MF64PGrmt62Tg3j2Q8W8RIILeBRNoYtBq41HoRE+f8=;
        b=mC2dmTve5AvCwVEvdEA6ZZ9WRhwQbzuOJ8vjGnHruWfE8hIptqPPWRKaPd6EQvPc2f
         eCXNALgN/yNUhyCRa0Ok9C1JXDtz9N5dN7iWb0nlI7ZvAgG9TrrZBGotFeY3b7hkXuQy
         TqX2IHc2DV7U7+15uUMi90T1+JMWHko8FMTH3jT6yPw4dDJaDXgrLWxjL5XSJBdfW/19
         I6zcibvPi86I1MM2b3zI5b2NcKQO+g4iHoZ3ji7F8Lm/DZGK0d1Utoyybm8E2p95lu4Q
         pbjnsT8u4jaxor4fazm9V4YxHiCp2MzsMnOi5VmEWCfp6vEVMdVkmb3+r/aXM9tDJ3E6
         2e1w==
X-Gm-Message-State: AOAM532X+zXrs0jmCQbqJlJ/CHIGLR+xfga7i/VbQ6j4scE27E0T0W+C
	k2C3I0BVtxOIwatFgxB5GCA=
X-Google-Smtp-Source: ABdhPJyS2LLUlLpQY+tL1leyrtNyXICYy68OFAYSNK1qlpPmhkS/M65NC7DnNNzPYsJ8Rs+j5awIgg==
X-Received: by 2002:a17:907:1b06:: with SMTP id mp6mr2612186ejc.188.1627651145081;
        Fri, 30 Jul 2021 06:19:05 -0700 (PDT)
Received: from agape ([5.171.81.215])
        by smtp.gmail.com with ESMTPSA id g8sm699706eds.25.2021.07.30.06.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 06:19:04 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: 
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Sterba <dsterba@suse.cz>
Subject: [PATCH] staging: rtl8723bs: remove unused BIT macros definitions
Date: Fri, 30 Jul 2021 15:19:03 +0200
Message-Id: <20210730131903.4846-1-fabioaiuto83@gmail.com>
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

