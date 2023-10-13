Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14900568E;
	Fri, 13 Oct 2023 06:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+06DFDd"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1c888b3a25aso13892515ad.0;
        Thu, 12 Oct 2023 23:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697176896; x=1697781696; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UZXQ64zI4dZ66y0C+/+YXtcZqO4ReFctnoAjwEvrK3I=;
        b=C+06DFDdZJDb4Hj+GPaDMGTvNbPkQzgE3KZkmtAgPLJapolKf0avjGv59wKZBtFeKG
         RtP9kH+N3ExqReGrCxyLrS1hEkwCP5yimvowi/nOqQAnzH7cM1oZqbi776oztcXUsVCz
         +PP0IJdYYXVU11E/hw0sAaSTroJbgSTIsccYPZfUsD+DFbsmWbRN4zcOY8/GT3zACmhe
         Y3a6TRc2AB1UShGa43KiWYkSm1HvfHZgQRwz0ATfaCWTpmCmf+ESzy66Q05UVQzW4ZaN
         crPGDZOttVNu9uyPd+EiPraC2Gb1yJIrxYmxAREQEYkQdChisO00yJkMUJ2sM102IHoS
         qInw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697176896; x=1697781696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UZXQ64zI4dZ66y0C+/+YXtcZqO4ReFctnoAjwEvrK3I=;
        b=d6V+k+EkolkEhQDDSD9leIdj7NtrGh73ZnUefP48efYnxu4xKSd6aWwG3+J+kZta/+
         hqTjKSFsaiY04J/bcqP9jhSy2VVGAN4/T14qyNU8NbT2/P6lpgzUqaNudgeuMJuLK+A1
         OyPdGawLSE8MduklHVIb9YgL239jPKygzrXeToZnZPVyuzVIuukzWOx7IrTOTI0Ym9in
         71lZ0ioMuIalvhJ5ixPSpdt2xAlBYogY7v2n3t9+2h5w3N3dRc00mf/JNxAyORKIF6SX
         UXmkVFpL/3gavf2kcAn2B9gMA/bXr/VX1Wl7u8LtP56HctfOcFiK6PsdOuy0mVa5CCFp
         my8w==
X-Gm-Message-State: AOJu0YxvJ78ifz1K+jTi6ZIbE1JEsmt8rp6oFh3Rrku8Am5CSS5OcbHz
	HZO+nReDHJkdxfI5bwpo6AY=
X-Google-Smtp-Source: AGHT+IHS6YGo5NwZbO65+2K46BEg+PTDhOqHDaZAZ8yhhMqsRxssyTPek2pN7/qMpUu7+I6Nl6f93g==
X-Received: by 2002:a17:902:8c85:b0:1c8:7489:56e2 with SMTP id t5-20020a1709028c8500b001c8748956e2mr19887877plo.35.1697176895931;
        Thu, 12 Oct 2023 23:01:35 -0700 (PDT)
Received: from Negi ([68.181.16.134])
        by smtp.gmail.com with ESMTPSA id kg14-20020a170903060e00b001bbb7af4963sm2997772plb.68.2023.10.12.23.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 23:01:35 -0700 (PDT)
From: Soumya Negi <soumya.negi97@gmail.com>
To: Jonathan Kim <jonathankim@gctsemi.com>,
	Dean ahn <deanahn@gctsemi.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Soumya Negi <soumya.negi97@gmail.com>,
	outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] tty: gdm724x: Match alignment with open parenthesis
Date: Thu, 12 Oct 2023 23:01:21 -0700
Message-ID: <20231013060123.13400-1-soumya.negi97@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix CHECK: Alignment should match open parenthesis
Issue found by checkpatch.pl

Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
---
 drivers/staging/gdm724x/gdm_tty.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gdm724x/gdm_tty.c b/drivers/staging/gdm724x/gdm_tty.c
index 32b2e817ff04..4e5cac76db58 100644
--- a/drivers/staging/gdm724x/gdm_tty.c
+++ b/drivers/staging/gdm724x/gdm_tty.c
@@ -271,8 +271,8 @@ int register_lte_tty_driver(void)
 	int ret;
 
 	for (i = 0; i < TTY_MAX_COUNT; i++) {
-		tty_driver = tty_alloc_driver(GDM_TTY_MINOR,
-				TTY_DRIVER_REAL_RAW | TTY_DRIVER_DYNAMIC_DEV);
+		tty_driver = tty_alloc_driver(GDM_TTY_MINOR, TTY_DRIVER_REAL_RAW |
+					      TTY_DRIVER_DYNAMIC_DEV);
 		if (IS_ERR(tty_driver))
 			return PTR_ERR(tty_driver);
 
-- 
2.42.0

