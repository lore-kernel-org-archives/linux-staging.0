Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBD63FEE
	for <linux-staging@lists.linux.dev>; Thu,  9 Sep 2021 21:20:03 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id d6so4483736wrc.11
        for <linux-staging@lists.linux.dev>; Thu, 09 Sep 2021 14:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IjVEcRwSUp15VhRofJDWnHv3EIrC+ItI8VvG9mNn4Is=;
        b=bxU+T2wvN6781GavtovvUr9Lj3oaqHmLstpWaGelZ9C25kkLW5gF/2WhvtOGEfVgJ+
         F6CXVpk9+36JHYHbhIjYyn0pOy2sRanBnmWL5XjHm6ULMawIrkh1Esd4r5mLPek3d1lI
         3kUhNYPdlCBB46cMt/ddzvcOY392dMlES4hlx2u468MWKqRKATZl4gvuGg8Mc/CwonDC
         6CK7nXuOCRt6uR8aQnqMIRoKIX1vSASAuZd+UMzjDkiBWmDzEYTrKS/936urn3Nllhba
         F+W8XD2DDnYRxMEY2TaWkRNoh9cQehyRBhSqd8sbjZe3PzOcT5abmtEIY1+dk4PlYKSy
         BPlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IjVEcRwSUp15VhRofJDWnHv3EIrC+ItI8VvG9mNn4Is=;
        b=XrL4B1h4B/kTHIXC1D4rI5PhFf+xSnE5j5OndndqOPr4tX/JPINGUF1yp6hPoAyUn6
         Ny8Ly8twrInUeUXg1bRvwCTtYOTGFTDC9iGZ6EPooJkrKTofwwxLtqag6LnZvQJeieqZ
         YkQwJ4Bpbnqkor4ugcmqCaWgsAvsk6ekK3JPYvfxcRfaGlJA8U0OA0QJyCIfNeW+MC1E
         I54vqAUFPvLmVO7DqcycbXcDAUintPbGXADBfHn8+4iXDp231JMkg4NhFU4BI1MBqmo8
         jGXPYYjdek+yi1CReOgE6ye1Lm/RJq8pk988MFB0sEEjQ8Y04mIs2A2nJZ67Aps7AcJC
         HPRg==
X-Gm-Message-State: AOAM533Ul7wbyxh1Vj85gDof/bzPP9/Z/uGyj/xcTwZRVQgx90BsN187
	ZkZ7jmH07RBw8zvLYlQ8TKY=
X-Google-Smtp-Source: ABdhPJwxXGWNK1YLaOUsud7PSKcuxnzCNFBthMoYkcjNXjtHTvKKPE+Kp8EDuBRlQ8dkKOMhSifyyg==
X-Received: by 2002:adf:f48e:: with SMTP id l14mr6166207wro.109.1631222401550;
        Thu, 09 Sep 2021 14:20:01 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id n5sm2511973wmd.29.2021.09.09.14.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 14:20:00 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unused macros from ioctl_linux.c
Date: Thu,  9 Sep 2021 23:19:22 +0200
Message-Id: <20210909211922.24872-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These macros are not used in the driver, remove them.
Found with GCC -Wunused-macros.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index 908022a17b3f..27fb1be036b8 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -15,20 +15,6 @@
 
 #define RTL_IOCTL_WPA_SUPPLICANT	(SIOCIWFIRSTPRIV+30)
 
-#define SCAN_ITEM_SIZE 768
-#define MAX_CUSTOM_LEN 64
-#define RATE_COUNT 4
-
-/*  combo scan */
-#define WEXT_CSCAN_HEADER		"CSCAN S\x01\x00\x00S\x00"
-#define WEXT_CSCAN_HEADER_SIZE		12
-#define WEXT_CSCAN_SSID_SECTION		'S'
-#define WEXT_CSCAN_CHANNEL_SECTION	'C'
-#define WEXT_CSCAN_ACTV_DWELL_SECTION	'A'
-#define WEXT_CSCAN_PASV_DWELL_SECTION	'P'
-#define WEXT_CSCAN_HOME_DWELL_SECTION	'H'
-#define WEXT_CSCAN_TYPE_SECTION		'T'
-
 static int wpa_set_auth_algs(struct net_device *dev, u32 value)
 {
 	struct adapter *padapter = rtw_netdev_priv(dev);
-- 
2.33.0

