Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F358420E7
	for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 06:43:29 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id u15so3718316ejt.6
        for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 23:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Bgq9rqpIso9rl0vPsOVlAZuRxdq9H6kaSUSyTutuwoI=;
        b=kUVmY6J+CfKBrjhC8OhBlsh1CKsjgQBGzaB2ylkt3QWkOrnMuy+8H5XbmzAybkX80y
         VuHm1cLGQnJbNfcfaAu+buN8HiO7N1QLao4WNyFY7Htfp9nHD6G15VxgOwWg1cVYJ3Kx
         USsrsK3/HBjFmU/HLqlFjG9KQ3wBA4wA3zKG1xS8djtTofppNERzHGcyp2Hge3rjWNHf
         pAnkDug+NMHRtYrMh+53iQ8vcVV9/PE1dYPTE25Jwv6GK6floSNjsy97yAnYL4mk/+Aw
         HWL148ceSvb3Njmo7uSCE0CJIJOQTGmTQ1B9EDLGvz+JrHsaYyXASwZVguOPfeL3xjyn
         X4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Bgq9rqpIso9rl0vPsOVlAZuRxdq9H6kaSUSyTutuwoI=;
        b=M/SDwl1/zhmxRct9adhpUPsmduLnpxOH82H0yA6aHdqN4QOlZqNwWKuSz1clMd3OuH
         sQBcrHdHGYdh8FDXrfNVIHOeIHXz344rOkNU+am/LeaWIP5zKe1OLkUuCUB+0hJSp4fb
         s4YFAwQ0egg1bPfuciYfagPYAEZGYo5FPyVNQC16dfLAEBgfjEiYZs5pcmGFp71M5MFR
         AXxO8lu/Kj7+fmw2kiZyNCqGGw6RmuFNPdW7jDNJ/tOPez3BTBmj2UHPMj8cbY1czomT
         c+zSVWSxHSuhzgw8VLqZJLldG7NHjlnTWcD978HPKNbZ3pQ+JBNwYA0Yvn1Q0nfoLF8W
         JVyQ==
X-Gm-Message-State: ACgBeo32hkfh1JTg1IRp5pve+0uKcAoGkpEygOqzGX8j8JEbW8r1lFuC
	cMI/I0WzzPN2TlqutT2ncbY=
X-Google-Smtp-Source: AA6agR6of3iUp/w71+objZLy3fm6yFRF9fQbTA3mm9pBUgJhE+P88mBVswX+uzLscl75fxC9WRwAbA==
X-Received: by 2002:a17:907:a073:b0:730:a5a4:4b7d with SMTP id ia19-20020a170907a07300b00730a5a44b7dmr6756244ejc.533.1660977808187;
        Fri, 19 Aug 2022 23:43:28 -0700 (PDT)
Received: from nam-dell.vm.stuba.sk ([147.175.88.220])
        by smtp.gmail.com with ESMTPSA id 27-20020a170906329b00b0073c0b87ba34sm2935816ejw.198.2022.08.19.23.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 23:43:27 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: lkp@intel.com
Cc: Larry.Finger@lwfinger.net,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	namcaov@gmail.com
Subject: [PATCH v2 3/4] staging: rtl8723bs: remove odm_NoiseMonitor.o from Makefile
Date: Sat, 20 Aug 2022 08:42:45 +0200
Message-Id: <47513f97b4492e35e6bbe5aea331c60da6bca5a8.1660977536.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660977535.git.namcaov@gmail.com>
References: <cover.1660977535.git.namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is preparation to delete odm_NoiseMonitor.c and
odm_NoiseMonitor.h because these files are useless.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/linux-staging/202208200447.kdEhBy9a-lkp@intel.com/
Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/rtl8723bs/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/Makefile b/drivers/staging/rtl8723bs/Makefile
index 159ca1b9016b..bc7ff1dd14f9 100644
--- a/drivers/staging/rtl8723bs/Makefile
+++ b/drivers/staging/rtl8723bs/Makefile
@@ -33,7 +33,6 @@ r8723bs-y = \
 		hal/odm_DynamicTxPower.o \
 		hal/odm_EdcaTurboCheck.o \
 		hal/odm_HWConfig.o \
-		hal/odm_NoiseMonitor.o \
 		hal/odm_RegConfig8723B.o \
 		hal/rtl8723b_cmd.o \
 		hal/rtl8723b_dm.o \
-- 
2.25.1

