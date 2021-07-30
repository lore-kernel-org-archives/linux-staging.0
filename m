Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081CF3481
	for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 13:39:16 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id hw6so2979813ejc.10
        for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 06:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A0btF4f/Zvh8ltVtQYn7h5KQSDQ3I8KDE+5fPKu995k=;
        b=hPiUBRyGda0IX/B4j3VjgPyJnQFYM02UALv5krx+Kre10dP4TC5N3wtXmpk8iGuSNh
         k40fqHNR9LvU0b3umAKFhJkKKPAPgam7hWUy/noT5QgD9D2jslVizzGEx3w71oZ/j11s
         +GHI28AxrqsLk/dMPtyX8WAn+EwUjQ5Rc7nPWoo1bjJUSlKYaY5FDiknJJxogcJ5MMEW
         TWLH4pWFDgszr/dF8XeGZFgRMKtid/pDu8LEOMC4AMlDcRzKsSYMXdNz/b54oWyEbzvl
         YeRNZ64jXpxc9FJ4NiqkPtmmUL3Vq8HrAX6qc0KQf1iIpCdeN1YsY7BcZqoO5roDDiYr
         Iz9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A0btF4f/Zvh8ltVtQYn7h5KQSDQ3I8KDE+5fPKu995k=;
        b=GiKEz0kxndEQmxk3HD3teve2MWGGZcxs+YP6JNXgLPL+T5kaaAaIyNMxi7Qt5UKcix
         qi097zVxuHM31gIy9XOFTKnjhU+SBXcjjAR+VcFz2r0XLS3oi8w/llVr6Jx6r7ILw29X
         +e5E3jROcBor+IDiLGCMLQVgNxMxgmqUJ4cHdHtBMDRNCwDm9qIsVTsaPCbpxG2KmeKm
         vYnpiRb/m3GTiNFAnGljYsZ4Bu/PIew0S5ULj9i7X+5J/xkb6D1wY0b1SgyJMMuWsgBI
         Knu8zRVGld/Kwa73l3y/62JXy2Ub9AbnScsq7g+Ya31DpMoCh0Qe4z9HfCFqurFIG1EE
         4WWw==
X-Gm-Message-State: AOAM5324j0/IDUMfVzbfoM7DP6vsPS3uKwbA2ama4NQiIduYwG1oeROM
	0MVLyzzeyO7Y7d3mGXlOHbk=
X-Google-Smtp-Source: ABdhPJzkonuszswUXBNiYdEveClGgPkKuD+AySlZU3GjiykkX1D6Mz0yP9Jk1MIbgvTHB45UMFK/lA==
X-Received: by 2002:a17:906:7393:: with SMTP id f19mr2750212ejl.79.1627652355408;
        Fri, 30 Jul 2021 06:39:15 -0700 (PDT)
Received: from agape ([5.171.81.215])
        by smtp.gmail.com with ESMTPSA id p23sm727983edw.94.2021.07.30.06.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 06:39:15 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: fabioaiuto83@gmail.com
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Sterba <dsterba@suse.cz>
Subject: [PATCH v2] staging: rtl8723bs: remove unused BIT macros definitions
Date: Fri, 30 Jul 2021 15:39:13 +0200
Message-Id: <20210730133914.8625-1-fabioaiuto83@gmail.com>
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
	- edited changelog

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

