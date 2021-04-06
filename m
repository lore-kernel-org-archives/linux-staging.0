Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812E26D18
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 08:45:28 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id b4so21462164lfi.6
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 01:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oqsIECjR7Ea8Zvb1gn9dei6ns9KBsh89VuPOEF2Htfk=;
        b=kC5KDXAWMnGTpruDL2bI7l2Kc2wia09EUEYgLnw5E/RCmU0LvAhKlP4kbxT9dkNlBW
         pTjnU3hGnc4IhN45ac7l51uhgMeANhKjE4Axb0qjs9USIuJfk8rAXVLp8wFtV4NUJrPB
         V5XMSulyBtD+v9YjDMyllvWNAAKGhspnF2sP8F0M88ZQ5JpcRRV7C+2lUOMRveE0Fsz0
         rfr7IfiweqLIaeZb1ZdK7OPB9boy2ZN+maMakS1VA+EuRFrXIf/5OxLs4CZ2KeDxpI62
         IiLtsyRu5Cov6BGLT4EZhNzWITMsoKrrkL1gwOqfHpLEKsEeH7+d6k2P5o0IzKWihXzz
         PO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oqsIECjR7Ea8Zvb1gn9dei6ns9KBsh89VuPOEF2Htfk=;
        b=MlPDc5D23hsAwbfxL8gJHhLgvTBcAzcdEkdL1N5Ns7/WcLCAKlQD2SEC+KnUspG1OB
         XmOU6D+C0+8oJoZRkM1OFqgfcT0wlgrXgo8154NjEZuldaXyRtyx/IozJ3U10nnlPyNo
         APiFAXqr+DnZFuHVrSJ4bmG2Ft14I2YKV1y69/FPM+8Y6j3otBE6pNM1ze6A8QuosMBm
         xrxFx5dgpuD0vJk2aGmbzfLz/k8sS3Lh7M2UOrTE01Fb5rHvmspbn4+wNPg3E/5Wj3Du
         1Ac0X7mjjSaeT7MzyXdTaaoI4tO6FEop7qac95XVOpI/JGcWrApEv8vOVVAZv/CzBGPO
         QKoA==
X-Gm-Message-State: AOAM530zoqqLQzna/LSv3C/7zB1o6uA3Hkv/TsRb2VAMR2WElo+/B/Le
	G7kGepzYVtK5qaB6F/Q6JVw=
X-Google-Smtp-Source: ABdhPJz3OtP4eMqx0bHjtByQRRNLdXvN2tBV5u4mot91+r5xZxuk2Dbb0+rl9lVAQ/gWpZEzHykPJg==
X-Received: by 2002:a05:6512:10d4:: with SMTP id k20mr19470727lfg.488.1617698726836;
        Tue, 06 Apr 2021 01:45:26 -0700 (PDT)
Received: from zhans ([37.151.32.231])
        by smtp.gmail.com with ESMTPSA id y8sm2200412ljk.9.2021.04.06.01.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 01:45:26 -0700 (PDT)
Date: Tue, 6 Apr 2021 14:45:25 +0600
From: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com
Subject: [PATCH 3/4] staging: rtl8712: remove extra blank lines
Message-ID: <0bf3df788ca46a59ebb990bf2e3effca7080fd1e.1617697237.git.zhansayabagdaulet@gmail.com>
References: <cover.1617697237.git.zhansayabagdaulet@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617697237.git.zhansayabagdaulet@gmail.com>

Remove extra blank lines to conform with Linux kernel coding style.
Reported by checkpatch.

Signed-off-by: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
---
 drivers/staging/rtl8712/rtl871x_ioctl_linux.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl871x_ioctl_linux.c b/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
index 6b3c5914efb4..d432f99e16b2 100644
--- a/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
+++ b/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
@@ -36,14 +36,12 @@
 #include <linux/if_arp.h>
 #include <linux/etherdevice.h>
 
-
 #define RTL_IOCTL_WPA_SUPPLICANT	(SIOCIWFIRSTPRIV + 0x1E)
 
 #define SCAN_ITEM_SIZE 768
 #define MAX_CUSTOM_LEN 64
 #define RATE_COUNT 4
 
-
 static const u32 rtl8180_rates[] = {1000000, 2000000, 5500000, 11000000,
 		       6000000, 9000000, 12000000, 18000000,
 		       24000000, 36000000, 48000000, 54000000};
-- 
2.25.1

