Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6907F
	for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 16:20:01 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id l14so14968283eja.7
        for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 09:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=/TGKUFp4Rbs92WA6usXfMvWSPRyltn47twUf2C6Q1X8=;
        b=dFVmMNfXALglYwsdXIPXJ68QMJ+5jyaUzrAQjh/6vqEMm4zRioMty4Lo1Ognup+iN6
         Zr4XDH9A94lnq2XU1fPZ0NWHA8yx7ZBE2VsiGjoy5A2XYdSArtc7zdYg4LOofggNGKg2
         VwYNaXYZZD1xhZUd80lmS5rJWB4USHD47COJ6mm0pVNgaUDTy1GoL/iW92S36Ul9fMjM
         dsh7DlfPwnBexHuNnb7gmLGUuEEx8HvWk1sPOwE7x7/5BJ3HRmw8V8CHD73AuEk9Ga23
         Jwi+zgTbsYpTzm/mwibI1j4+dKm3b/cHoR33ErGubybdxZcrCrb6FamGjHvldTEGJNYv
         wB4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=/TGKUFp4Rbs92WA6usXfMvWSPRyltn47twUf2C6Q1X8=;
        b=e/d3EFgrBafFfj8y/aSz88MIbKFPKh0ez6mjmF3lC/lhz1UYMnE6EqL7TLbCrJe5qF
         eTyn7OXS263ipuYW5LrPCymReoGlyFYIHkPtAdLYLL7QjxPMugIEFvjQgGsyLALwR2Sb
         13n5+0nntb29nG5aJMhcu4JvDzoNuwxWYLT29jBBD5r6XuFINm2apZLDPgvl30yUJuwZ
         TXIW7LcN8OaJC9ystu+V2Axp58aMY0E8IPfVhloX6xEGnBjBIZoKz+N1zM9tRSdcbdX3
         9imTF6zDd5ADxFnZt6GaNzact5lX7zdWuWy1fTaCrmI5dWVI7iuOWc3pwXKsQNqEyCHb
         I/1w==
X-Gm-Message-State: ACgBeo0zClrQJL3MrL4j0my+kjK2ffNIaWhHfBNISoTuNHEcnAm1n5Kq
	TjVWUOHmLVIkbMtvW+3CSd4=
X-Google-Smtp-Source: AA6agR47JfPP+uvrRjdrr/oVnIhSpbAwANtcJA58FfLAKIwHgzOZMKtxFA+ojR5DelxbWeaQSW7cug==
X-Received: by 2002:a17:907:782:b0:740:7120:c6e7 with SMTP id xd2-20020a170907078200b007407120c6e7mr15968189ejb.313.1662913200091;
        Sun, 11 Sep 2022 09:20:00 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6b.dynamic.kabel-deutschland.de. [95.90.187.107])
        by smtp.gmail.com with ESMTPSA id bt6-20020a170906b14600b00779dc23be62sm3055346ejb.120.2022.09.11.09.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 09:19:59 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/6] staging: r8188eu: some coding style cleanups
Date: Sun, 11 Sep 2022 18:19:43 +0200
Message-Id: <20220911161949.11293-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series contains some coding style cleanups in the file
odm_HWConfig.c.

Michael Straube (6):
  staging: r8188eu: rename odm_SignalScaleMapping()
  staging: r8188eu: clean up camel case in odm_signal_scale_mapping()
  staging: r8188eu: remove unnecessary initialization
  staging: r8188eu: rename odm_QueryRxPwrPercentage()
  staging: r8188eu: clean up camel case in odm_query_rxpwrpercentage()
  staging: r8188eu: replace tabs with space in
    odm_query_rxpwrpercentage()

 drivers/staging/r8188eu/hal/odm_HWConfig.c | 60 +++++++++++-----------
 1 file changed, 30 insertions(+), 30 deletions(-)

-- 
2.37.3

