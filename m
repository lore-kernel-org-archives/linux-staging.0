Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AE31944B
	for <linux-staging@lists.linux.dev>; Sat, 18 Nov 2023 18:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mb2hNrC7"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2c87acba73bso1553421fa.1
        for <linux-staging@lists.linux.dev>; Sat, 18 Nov 2023 10:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700330709; x=1700935509; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mu6uKqetedFX6br/8gaH2MKtwUbnJweRqllZD/aw3RQ=;
        b=Mb2hNrC7LEqblvodf5vJCvuFJv7QX++pGy6V0UWHeXDyyI9rDLmmDmLtzmT1mwAhkW
         M6IaITP5Vms4/QFWHgUazJIrjsRYPatFz+BzMM4k0qqDLnuUP8Oc4VRH4lRFoLcmcx9+
         cX+kSxCCqrceKT+Ao1g9Y2UK6nvTcB3Lyg5PX1gL3fqqjo8L20n8ddJTZYhXKx3BX66p
         G6Dx/tumdAtWsAAQbJUgfU4TbDJDTXum8n7eI5646EqPA7m8Se6Na+jAAi58LVOqZ/9T
         VSVQ3D32SeLkMoBxzLxWCldhl8r2Zf3n0QsSgIRhW3lHMInvHlt5rEFtPhO4gq1cqCqd
         szqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700330709; x=1700935509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mu6uKqetedFX6br/8gaH2MKtwUbnJweRqllZD/aw3RQ=;
        b=Kq7XK9pkxHRMjsREuhN6O/3DEWqKQKpFXtdefFh00iffLMS6hSdfs+FphGHnPro4OV
         iohyVR4YQHoJlDWnvxjqxiUBjvMVMGphegR9rdrmMTIZNHfvPuj9o+V5onTO/iX2YLJj
         RsEvBN7OoPMfNL1bkNUwRwj7yL+EYVm8IUlH7vP0kIiK2QLme29s7Sfk1IiPSljyPTHS
         MJDHhBt92kqe7WH1xPTZ5OMCiIm36rtYZvTddgT+crWnWMIy+ub/2+bYSEwQKy8zNaGN
         5X+jFCR1Cs5S0WL7sox2HzTCXK62WORb1rkKXeLFkVkuDPpHd/ohl0gtsLIVsnu+zm9J
         yoQg==
X-Gm-Message-State: AOJu0YyRxxk4Gg99Mscom+iShbEzsfpHxsWu/4pU8EbAX3aHnZFaqAkJ
	he3YHMtss1q4flfkJgJ8d6Q=
X-Google-Smtp-Source: AGHT+IHyeiAuLwBQ6RhMnfmUjm6ZpWN6lhi+Qcl6w/VI4MWj6Kf1RrN8easfjONwVJiPd/NUafO3dQ==
X-Received: by 2002:a2e:9c84:0:b0:2c5:1ea4:4e99 with SMTP id x4-20020a2e9c84000000b002c51ea44e99mr2049253lji.48.1700330708944;
        Sat, 18 Nov 2023 10:05:08 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:77bf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id m20-20020a1709062b9400b009f2c769b4ebsm2079456ejg.151.2023.11.18.10.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 10:05:08 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>,
	linux-kernel@vger.kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [PATCH 00/10] Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
Date: Sat, 18 Nov 2023 19:04:54 +0100
Message-ID: <20231118180504.1785-1-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After removal of the legacy eeprom driver the only remaining I2C
client device driver supporting I2C_CLASS_SPD is jc42. Because this
driver also supports I2C_CLASS_HWMON, adapters don't have to
declare support for I2C_CLASS_SPD if they support I2C_CLASS_HWMON.
It's one step towards getting rid of I2C_CLASS_SPD mid-term.

Series was created supported by Coccinelle and its splitpatch.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---

 drivers/i2c/busses/i2c-ali1535.c                  |    2 +-
 drivers/i2c/busses/i2c-ali1563.c                  |    2 +-
 drivers/i2c/busses/i2c-ali15x3.c                  |    2 +-
 drivers/i2c/busses/i2c-amd756.c                   |    2 +-
 drivers/i2c/busses/i2c-amd8111.c                  |    2 +-
 drivers/i2c/busses/i2c-elektor.c                  |    2 +-
 drivers/i2c/busses/i2c-gpio.c                     |    2 +-
 drivers/i2c/busses/i2c-ibm_iic.c                  |    2 +-
 drivers/i2c/busses/i2c-iop3xx.c                   |    2 +-
 drivers/i2c/busses/i2c-isch.c                     |    2 +-
 drivers/i2c/busses/i2c-kempld.c                   |    4 ++--
 drivers/i2c/busses/i2c-mlxcpld.c                  |    2 +-
 drivers/i2c/busses/i2c-nforce2.c                  |    2 +-
 drivers/i2c/busses/i2c-pasemi-pci.c               |    2 +-
 drivers/i2c/busses/i2c-piix4.c                    |    2 +-
 drivers/i2c/busses/i2c-scmi.c                     |    2 +-
 drivers/i2c/busses/i2c-sh7760.c                   |    2 +-
 drivers/i2c/busses/i2c-sibyte.c                   |    4 ++--
 drivers/i2c/busses/i2c-sis5595.c                  |    2 +-
 drivers/i2c/busses/i2c-sis630.c                   |    2 +-
 drivers/i2c/busses/i2c-sis96x.c                   |    2 +-
 drivers/i2c/busses/i2c-via.c                      |    2 +-
 drivers/i2c/busses/i2c-viapro.c                   |    2 +-
 drivers/i2c/busses/scx200_acb.c                   |    2 +-
 drivers/i2c/i2c-stub.c                            |    2 +-
 drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c |    2 +-
 drivers/staging/greybus/i2c.c                     |    2 +-
 27 files changed, 29 insertions(+), 29 deletions(-)
