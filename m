Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08526117
	for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 10:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2X0qG4J"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-507c8316abcso2087478e87.1
        for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 03:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697883296; x=1698488096; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54U+E9W9K0OaBdlR5lzHV/a+8QqdJ6fYDyraEx8zyqE=;
        b=h2X0qG4JFPV7mz/I4vr8Q7NAcjiBMBu07pUbSQBHQJSkyoL8g61JuIJoE9vOOmlyss
         fvLtOVt+ItGINyXZHzoKkoWjdpOvHcHXd8y/NUn+TRlloTVPx6FNRzSRgBqvEccmP1j0
         wmwgrQlIxrUJiYj+olz8nDV4SBBiVxK/ms+KDnaRZI+Ip+7ANQF28lUW5UXEipthCoKL
         n9npDSvt1NWlmgt+h0VcBCGiH5R9He0cxK7+O1XgB7SqZ7JtwJFKPGE9WvaEndtNNuR+
         qYO1vmkbNoy4bNGdNv8wgpDRl7tFJ/Cu5oc7CCEZSJEVmVptvzOdIDxGsDh+Jw638sE2
         z6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697883296; x=1698488096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=54U+E9W9K0OaBdlR5lzHV/a+8QqdJ6fYDyraEx8zyqE=;
        b=CUlI/4w46x4watg0m9DGVwI2DH5NfX/JbLw/GkRI6l/KrjIkG9UG2fKxIXLIz0lPVP
         a1/oXqsLphuTatFjtHiHuMH4ulRuUv6ON6U4CMUNL4ql0/PTGE0PF7JDGMcvIWLZXs2B
         vGhdiaiqvBVW4bSHrOcVOX7VpQpmEsBteqQeDmRt1nxS0WBJA1gBQYYcNV28vUQsR/Ci
         JTp0hp6visqcl8Wkwv7uFSEq2D57kmQJ66AW38P3L8677F7XYlz4tHv0vTib6tBocfwB
         Ht7touKinV7svtIyc1OHO/FfLcddezcBU0fH7fKUTOF7//l+PgGR8+TeKabtR/hnC+z0
         uxWw==
X-Gm-Message-State: AOJu0YyqC7T1dMLtbKd3mPX3swLadG4iGzDgab6K6yfqMbeF9P8P3Cok
	flGvkR1ddVHzhTu/coZfJZ0=
X-Google-Smtp-Source: AGHT+IF4HwHDY5OOqVDBCMW9b6O+w115b7KFZw6tu7WvakGEpq7rLPnhLcH6W5i3GsnyiXl6mUhQ/w==
X-Received: by 2002:ac2:4284:0:b0:506:899d:1989 with SMTP id m4-20020ac24284000000b00506899d1989mr3113028lfh.44.1697883295672;
        Sat, 21 Oct 2023 03:14:55 -0700 (PDT)
Received: from HP-ENVY-Notebook.lan (81-229-94-10-no68.tbcn.telia.com. [81.229.94.10])
        by smtp.googlemail.com with ESMTPSA id d18-20020a056512369200b005007e7211f7sm803114lfs.21.2023.10.21.03.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 03:14:55 -0700 (PDT)
From: Jonathan Bergh <bergh.jonathan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jonathan Bergh <bergh.jonathan@gmail.com>
Subject: [PATCH v3 1/7] staging: octeon: Fix introduction of new enum typedef cvmx_spi_mode_t in octeon
Date: Sat, 21 Oct 2023 12:12:32 +0200
Message-Id: <20231021101238.81466-2-bergh.jonathan@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231021101238.81466-1-bergh.jonathan@gmail.com>
References: <20231021101238.81466-1-bergh.jonathan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch removes the introduction of the following new enum typedef
cvmx_spi_mode_t and fixes up where implementations which used it.

Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>
---
Changelog:
v1 -> v2: Fix breaking change spread across multiple patches             
v2 -> v3: Break changes up into individual patches for each removed     
          typedef

 drivers/staging/octeon/octeon-stubs.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 3e7b92cd2e35..9f269626b862 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -213,12 +213,12 @@ enum cvmx_fau_op_size {
 	CVMX_FAU_OP_SIZE_64 = 3
 };
 
-typedef enum {
+enum cvmx_spi_mode {
 	CVMX_SPI_MODE_UNKNOWN = 0,
 	CVMX_SPI_MODE_TX_HALFPLEX = 1,
 	CVMX_SPI_MODE_RX_HALFPLEX = 2,
 	CVMX_SPI_MODE_DUPLEX = 3
-} cvmx_spi_mode_t;
+};
 
 typedef enum {
 	CVMX_HELPER_INTERFACE_MODE_DISABLED,
@@ -1362,7 +1362,7 @@ static inline struct cvmx_wqe *cvmx_pow_work_request_sync(cvmx_pow_wait_t wait)
 }
 
 static inline int cvmx_spi_restart_interface(int interface,
-					cvmx_spi_mode_t mode, int timeout)
+					enum cvmx_spi_mode mode, int timeout)
 {
 	return 0;
 }
-- 
2.40.1

