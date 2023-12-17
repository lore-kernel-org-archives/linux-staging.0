Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBC646B82
	for <linux-staging@lists.linux.dev>; Sun, 17 Dec 2023 16:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gb0L7J+v"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6d7750e2265so43605b3a.3
        for <linux-staging@lists.linux.dev>; Sun, 17 Dec 2023 08:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702832118; x=1703436918; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eKsWRncfuCPQDnZgbnpk1pj6VXWzGGiRXpku/betyaY=;
        b=Gb0L7J+v21NUOeoTEub3gaGuAK5e2ESMjR7Lq0lIIpwtuoeh5lM5bLayJzpFlGhk0q
         mcLm2QfM+dGggIJxfM/1gA+4wXt9MBzpTmca3xSAebnIub6D+3kw6Bf3OwEoMmfSMS+b
         9X/kSkCOx8ykdYb87sTiM/Ct7ERiFsHX3L8VlaVEvu7k6okJDN6AOn1TYBeC5q6a30r+
         4mkUXMne45IPLlSnjGFtKwIzgz2vcACUpvgo3HS19/RRrifCZYJgt+u2fZrEDONaene6
         X/rQG68NVQ4iSvev7PsCp8NV2KuecldvHVTgGmu9jGl9an7FR94013rEohu1AK7uH3xT
         199Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702832118; x=1703436918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eKsWRncfuCPQDnZgbnpk1pj6VXWzGGiRXpku/betyaY=;
        b=OUkm6I9vT3rWXuv0C19jqZjKsUA6OcbNkv86q+WGhfyDTFaj58YEISFlUUv7KSAFJE
         8PLG+PGDAcQHsgtsIJRPVk2/ngOcb+eIbMKSyM/s4AUZJlEKHjxRIJUCTwhohTbxyjwD
         THieUwRF/6v+wgevO1Dhqgavthc/3Y2ycCI8XONsUJQRqEfjO2SHlIZ3fqX4LUQCaWjP
         HKXz6LYw/VFiClrVvM3VqZfnWJrrh6IZL67UaiyuBV0gppJFE5Vbfw8Hb1bGwPiUteCu
         bUwbm8ucSc+2CHUtL5khWxYH7lOVPA5icMrm2UA93kZ7pt7IQWqjc1+88yGnPqeLlvte
         SzAQ==
X-Gm-Message-State: AOJu0Yyq4cUq9ozo+Gq29M2GfJCzJ3O2GEi4wM/c6hlTPUHWAIjFmyiQ
	XxgEkGFpp2fr+T3JIJlRoCc=
X-Google-Smtp-Source: AGHT+IElv+rw7sIJijJRD+OdyZtfVrQkm1+LOYAXSc4i+0RHL3+E7jluDilGz3cyuXwh9uqgyEvdkQ==
X-Received: by 2002:a17:90a:1c09:b0:28b:2219:e78f with SMTP id s9-20020a17090a1c0900b0028b2219e78fmr1758461pjs.78.1702832118124;
        Sun, 17 Dec 2023 08:55:18 -0800 (PST)
Received: from ubuntu.. ([110.44.116.44])
        by smtp.gmail.com with ESMTPSA id pb7-20020a17090b3c0700b0028aea6c24bcsm4705292pjb.53.2023.12.17.08.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 08:55:17 -0800 (PST)
From: Dipendra Khadka <kdipendra88@gmail.com>
To: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: Dipendra Khadka <kdipendra88@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] drivers: staging: rtl8712: Fixes spelling mistake in rtl871x_mp_phy_regdef.h
Date: Sun, 17 Dec 2023 16:54:43 +0000
Message-Id: <20231217165444.448133-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The script checkpatch.pl reported spelling error 
in rtl871x_mp_phy_regdef.h as below:

'''
WARNING: 'Tranceiver' may be misspelled - perhaps 'Transceiver'?
#129:
#define rFPGA0_XA_LSSIReadBack          0x8a0   /* Tranceiver LSSI Readback */
                                                   ^^^^^^^^^^
'''

This patch corrects a spelling error,
changing "Tranceiver" to "Transceiver."

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 drivers/staging/rtl8712/rtl871x_mp_phy_regdef.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/rtl871x_mp_phy_regdef.h b/drivers/staging/rtl8712/rtl871x_mp_phy_regdef.h
index a08c5d2f59e3..bb9f83d58225 100644
--- a/drivers/staging/rtl8712/rtl871x_mp_phy_regdef.h
+++ b/drivers/staging/rtl8712/rtl871x_mp_phy_regdef.h
@@ -126,7 +126,7 @@
 #define	rFPGA0_AnalogParameter3		0x888	/* Useless now */
 #define	rFPGA0_AnalogParameter4		0x88c
 
-#define	rFPGA0_XA_LSSIReadBack		0x8a0	/* Tranceiver LSSI Readback */
+#define	rFPGA0_XA_LSSIReadBack		0x8a0	/* Transceiver LSSI Readback */
 #define	rFPGA0_XB_LSSIReadBack		0x8a4
 #define	rFPGA0_XC_LSSIReadBack		0x8a8
 #define	rFPGA0_XD_LSSIReadBack		0x8ac
-- 
2.34.1

