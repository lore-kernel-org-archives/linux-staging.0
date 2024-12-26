Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02748335C7
	for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 19:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735242548; cv=none; b=MuiKoI8ZSAOYp3Jv4DXt0VbdM2u55dU9Wz20A7UUWR8/Wh3LQ2ymEHbsvZEOJv2Z7Xj93W+vYnrvNJqyhbmnipmOroVPr5woDFEMqKCDwl26nbz1xd5I2mGGJDIsEQJyasL2cgp55onUErcE7QRb3xwOlsxSzw/0hb8Mg17KPIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735242548; c=relaxed/simple;
	bh=osJG9U2LQpiESdIt0DhLcfy7YYH6SOXFc5r2mJR+wwg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Kn5LBUlr8PQrKvVrg5jU2akSx+8xfF3e22DK4CyWu48+S6NFfKJAeqMdG2Ev0ejg7geazR+h4arHyCsjp/HewCZ7mOFOh8VbsmDD3yB/YrTdpsZHp8cem5qKu8/HNIzC0nFQCnZm4OOnn3uyCIUd6ei4Or1GSVAmBEde7AmX7CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ivjINoW9; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ivjINoW9"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ee534d6800so1302993a91.2
        for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 11:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735242546; x=1735847346; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9AjawiFN0l2lNjZO5eJu0bWfeIcoDpaJaDJT1q6R/Qs=;
        b=ivjINoW9Qj0VCd1ieRG6LsPLec/klNsHmMza9jJHws+LY+ReA/Au5Zt1SdUPlZpBoC
         iOCuvzwX/fDJIIyyphBWfOcAcESzrEG4w9oHPJzLQ4icfwK1CU0hj29o04ajuG6IplMg
         mRKAizhqA+uRpCtas3MlgHIMajEzrVWzPeE9AIG87AJ/NHvMlk6sMjshokQwr+b3NzLq
         70U6Ovim0wP9GK+Ee/Y7FRmxTZLvO/yYE8DyU75ndILhqRFcb4P1IfKGLKm9HEeCZ+dK
         Ysm6qNUZiFC17E2BNgt1eJ10QxzJQ7xPql418LiZk3gm8JsTh4f+2JlmuD66sc7VLe+7
         6QUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735242546; x=1735847346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9AjawiFN0l2lNjZO5eJu0bWfeIcoDpaJaDJT1q6R/Qs=;
        b=JEkEEiBqfG/NsjgeoJnp3BLTKfWAU/79K8kNd33uer/mmpOMECfBTQMbLmPeSa43ze
         90aYKb/+O0+iVHeL+8rDmty7GyDF69WYg/ifc13qu1L0olz29QVB8QmZcPkAhHJ6Y8Yu
         OiF9o0okRYtls8Hr1ITYVXTnqRoQFqTBw3ST53y3lu62v2IWZCFK/4JT03FbAVFzasB7
         rU16cpPOPLM6Nj9/tlvktNvkdauTksd1hZVspiXPkwm0d7M97tkCk1qENKuVcsnAC0Fr
         GG3GkujzK90ty9qLSmF0ceMc/keRrEtgG3kOnQMSGTXXZxnKnWWbDq82qmQpsMgoEuTZ
         WnaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPi1JqYQnRpa7msTCMyLCbne+IXmBkNfg+PcSE5nuRc159UY37xLU34Vt0rFBN1xvuVIKJKNS+lTG1/hqG@lists.linux.dev
X-Gm-Message-State: AOJu0Yz85ewBBmlIDHwRHeVsHfscSRM1jz9Jt7URaWRqLQd+IzDbNt9f
	jE/GXEDeqQh4UEtYK5NSIzgTUBW1jwGHRN6zrED6FWCuiP6fg30Q
X-Gm-Gg: ASbGnctEl6MgZw79WsBk5uCNZnjBJlgzeUce9wEB1bOWxf9rgh42vIRMq87YrQsRI9k
	08E5CB52tV4FZjqhz8lW9z0HxYDSycKKn+lM3VJ+46xORMv3KkWTJTyZNyXdSw/a5atulKgMHcQ
	OGJwzYBt0PICYI1aCqjFtWYZcaVYkG1lJCv9uO4zUIty/E31CzbaPF1A5RKfOWrI2gNzOLt4lAx
	sdS+t2MXiT4lFq+yuKW03IyUujgZn9u37WwKH+C7Jvs4SgMLewNPqU=
X-Google-Smtp-Source: AGHT+IEyGVlo+v8M2T4yajYtuwJKSJsqDkxQg5dD0OadC7+8c8QjHGBP3iAleAFGyxcZdwILt8RQTw==
X-Received: by 2002:a05:6a00:ad2:b0:725:d9b6:3938 with SMTP id d2e1a72fcca58-72abdf0ec05mr13413058b3a.3.1735242546182;
        Thu, 26 Dec 2024 11:49:06 -0800 (PST)
Received: from ice.. ([171.76.83.141])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842e35d4becsm10304580a12.79.2024.12.26.11.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 11:49:05 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v4 00/15] staging: gpib: Handle gpib_register_driver() errors
Date: Fri, 27 Dec 2024 01:06:24 +0530
Message-Id: <20241226193637.241049-1-niharchaithanya@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While reviewing the patch for fixing Coverity scan issue from 
gpib: cb7210 [1], Greg pointed out that the gpib_register_driver()
function can fail and must return an error value if it fails.

This patch series fixes the above issue by changing the return type
of gpib_register_driver() function and returning the error value if
it fails.

This fix also makes sure that wherever the gpib_register_driver()
is called and if it fails - the previous driver register functions
are unregistered(if they exist) and the error value is returned.

Thanks,
Nihar

v3 --> v4 : Made the v3 patch into series and also fixed an error in 
	    v3 [2]. Each patch in this series is a fix for particular 
	    driver handling the gpib_register_driver() error.

v2 --> v3 : Modified the gpib_register_driver() to return error code,
            added error handling to all the places that the
            gpib_register_driver() is called.

v1 --> v2 : Replaced the redundant cb_pcmcia_init_module() with
            pcmcia_register_driver().

Link to v3 : https://lore.kernel.org/all/20241221214822.163667-1-niharchaithanya@gmail.com/
Link to v1 : https://lore.kernel.org/all/20241221022632.20931-1-niharchaithanya@gmail.com/
Link to v2 : https://lore.kernel.org/all/20241221091121.35476-1-niharchaithanya@gmail.com/

[1] https://lore.kernel.org/all/2024122133-outskirts-causing-099a@gregkh/
[2] https://lore.kernel.org/all/202412221424.WIjKFIPf-lkp@intel.com/

Nihar Chaithanya (15):
  staging: gpib: Modify gpib_register_driver() to return error if it
    fails
  staging: gpib: agilent_82350b: Handle gpib_register_driver() errors
  staging: gpib: agilent_82357a: Handle gpib_register_driver() errors
  staging: gpib: cb7210: Handle gpib_register_driver() errors
  staging: gpib: cec: Handle gpib_register_driver() errors
  staging: gpib: fluke: Handle gpib_register_driver() errors
  staging: gpib: fmh: Handle gpib_register_driver() errors
  staging: gpib: gpio: Return error value from gpib_register_driver()
  staging: gpib: hp_82335: Return error value from
    gpib_register_driver()
  staging: gpib: hp82341: Handle gpib_register_driver() errors
  staging: gpib: ines: Handle gpib_register_driver() errors
  staging: gpib: lpvo_usb: Return error value from
    gpib_register_driver()
  staging: gpib: ni_usb: Handle gpib_register_driver() errors
  staging: gpib: pc2: Handle gpib_register_driver() errors
  staging: gpib: tnt4882: Handle gpib_register_driver() errors

 .../gpib/agilent_82350b/agilent_82350b.c      | 21 +++-
 .../gpib/agilent_82357a/agilent_82357a.c      | 13 ++-
 drivers/staging/gpib/cb7210/cb7210.c          | 96 +++++++++++++------
 drivers/staging/gpib/cec/cec_gpib.c           | 12 +--
 drivers/staging/gpib/common/gpib_os.c         |  7 +-
 drivers/staging/gpib/eastwood/fluke_gpib.c    | 28 ++++--
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c      | 43 ++++++---
 drivers/staging/gpib/gpio/gpib_bitbang.c      |  5 +-
 drivers/staging/gpib/hp_82335/hp82335.c       |  6 +-
 drivers/staging/gpib/hp_82341/hp_82341.c      | 14 ++-
 drivers/staging/gpib/include/gpibP.h          |  2 +-
 drivers/staging/gpib/ines/ines_gpib.c         | 78 ++++++++++-----
 .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        |  4 +-
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c     | 13 ++-
 drivers/staging/gpib/pc2/pc2_gpib.c           | 30 +++++-
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c   | 87 +++++++++++++----
 16 files changed, 344 insertions(+), 115 deletions(-)

-- 
2.34.1

