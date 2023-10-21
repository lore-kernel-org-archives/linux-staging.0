Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449F14429
	for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 10:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MeQv5SiJ"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-507962561adso2334368e87.0
        for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 03:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697883286; x=1698488086; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gbhtOmOMlrSXq3cWZFLEsrn0khhJxxkh0d58gwvHYGQ=;
        b=MeQv5SiJN5Hc/Cpy9TFFQUKZIIpajSzkSRmL6NyV4Q/h5ZOGHMXGih+dU8Mi8nNBGx
         SrgJhXt7uQJTnBfG1MsOPnBoozp2xKXxF+PEKY967Qopq9d8MrCocu31KUwdI5FMXaRa
         7Ji+ggWoWZZOGrSF3eZfAlAYYBlnrBTym35jhrxg8+YTz+Y/9A5w4bKt4kcfe/UkWSxk
         Fsw3e4TnKzf1yxzMd4GV9Xk3z0mUDRIm4tKl7GeIFfFLzv1O51EfwGC9Rt8jvKXSbeGT
         KBUuZaUpUQ3kvZRYIPkbe1ONzuNfgppcxhDWiyopEtRZupyBGB0DfjdXQvTq6vLyP9Fd
         /9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697883286; x=1698488086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gbhtOmOMlrSXq3cWZFLEsrn0khhJxxkh0d58gwvHYGQ=;
        b=TgaBkEp1pANOazqOGb4uLL51fPcG6aeMbRpdZFobZOcQW5rKJeK/p2t0FJxZE4wpNu
         kS5R/q2iZHWip41JQfUmg3Xfkfyuhc/zjSVdlg9pdW5EvLl83ujWZMLBX4Rd4phZXiBu
         DqkkrxLLkwcl1IZZ/1hTkcJEqx24dGWpt263q6yd6ywhBqic+lLCLSp2yxwtf0o6UNhr
         wsXvlSaggZZ37xX4qw+xUtm/si/Rx6imLoF+MMSNUdCLBYWJkfPc2Ozg9i+qcNO9+d1b
         /GXILAmdI/pqYi8M3JDhcGfH9tEYV/E0xPf0YJRj6BcKmBPlsIQ1wsvwXU5goAknYvmM
         /low==
X-Gm-Message-State: AOJu0Yzg6518hbtbgP77SN+BdwkPqn8/Ls3ZEjM8/JXfupZ97ofl07Ff
	Le2jxjnCQDu4MmPwVjMHXXA=
X-Google-Smtp-Source: AGHT+IHghhP35vQyNpTtkbKNnZXkQheAufQxt+fcQr2cKWcyv2UbeppweocwijFkfDJQUqZdRM0qzQ==
X-Received: by 2002:a19:644d:0:b0:507:9618:dc1f with SMTP id b13-20020a19644d000000b005079618dc1fmr2763831lfj.69.1697883285675;
        Sat, 21 Oct 2023 03:14:45 -0700 (PDT)
Received: from HP-ENVY-Notebook.lan (81-229-94-10-no68.tbcn.telia.com. [81.229.94.10])
        by smtp.googlemail.com with ESMTPSA id d18-20020a056512369200b005007e7211f7sm803114lfs.21.2023.10.21.03.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 03:14:44 -0700 (PDT)
From: Jonathan Bergh <bergh.jonathan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jonathan Bergh <bergh.jonathan@gmail.com>
Subject: [PATCH v3 0/7] staging: octeon: Fix warnings due to introduction of new typedefs
Date: Sat, 21 Oct 2023 12:12:31 +0200
Message-Id: <20231021101238.81466-1-bergh.jonathan@gmail.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series fixes (removes) the introduction of several new typedefs
for enums and structs in the octeon driver. First the declarations are
fixed and then implementations are updated to remove references to the 
old typedefs.

Changelog:
 * v1 -> v2: Fix breaking change spread across multiple patches
 * v2 -> v3: Break changes up into individual patches for each removed
   typedef

Jonathan Bergh (7):
  staging: octeon: Fix introduction of new enum typedef cvmx_spi_mode_t
    in octeon
  staging: octeon: Fix up introduction of new typedef
    cvmx_helper_interface_mode_t  in octeon
  staging: octeon: Fix introduction of following new typedef
    cvmx_pow_wait_t in octeon
  staging: octeon: Fix up introduction of new typedef cvmx_pko_lock_t in
    octeon
  staging: octeon: Fix introduction of new typedef cvmx_pko_status_t in
    octeon
  staging: octeon: Fix introduction of new typedef
    cvmx_pip_port_status_t in octeon
  staging: octeon: Fix introduction of new typedef
    cvmx_pko_port_status_t in octeon driver

 drivers/staging/octeon/ethernet.c     |  6 ++--
 drivers/staging/octeon/octeon-stubs.h | 48 +++++++++++++--------------
 2 files changed, 27 insertions(+), 27 deletions(-)

-- 
2.40.1

