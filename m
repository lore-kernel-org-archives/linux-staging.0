Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4D718C2E
	for <linux-staging@lists.linux.dev>; Fri, 24 Nov 2023 10:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G0/2j0GN"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a00a9c6f1e9so248254266b.3
        for <linux-staging@lists.linux.dev>; Fri, 24 Nov 2023 02:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700820984; x=1701425784; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcMLBYSAsdprviXMYBJT1guiAaPHdo15Q++eqKUBcSs=;
        b=G0/2j0GNtXmYdNVEY7m0bHF0lS8Q7TZMU7h5rY2J5eO5RHkcMDyGiNJEeHnTS9GXik
         zjmPBJLKeA0Be6Ju5s8lUcO0C2JWHHJxssqwDdRUZHqHZ74w47pI2pkyS1aG+zKqmSkv
         lG6uK2Cv+sHlABObrWRztAHRM7zUcPZglhWLXQVSkR9KNMFW0Mgvy9XsChhUD6ylqGfa
         6KT48GthoX4xoM8wH3jeHT1SZIZwsl3ocO37w22dV4pvJYOfxE/xuDK4e5cZlgewNFuM
         O4gWy4eHyiLLuJnP5uq1nY3SeevUS2I8tF79BJhz6Rs5AH3aspLLMMyT9FL9I/oKRtca
         PxGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700820984; x=1701425784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZcMLBYSAsdprviXMYBJT1guiAaPHdo15Q++eqKUBcSs=;
        b=XAuLMfNqr85c2s/l8h5nDEZH7soTJo8VgwPVgcsOr4zrfglr3s351i7ZFTZwDJhTls
         C7YgZse7seC1IZl9y9kUbfnc310wqqA2GjWQlQ3xiCDrYmgzXXVX0f1yJ9GgbudKovBP
         OFfutRsN1ckfKEkWV2gfUTXyjgtgPWiMRHI5JVGBz1xp2lDTldzRKdSYN6vyhT8X2aua
         2qSudMSRPSXUGrD8+mFueKvSwMHCXrRpe792DpcscDfe5DB3sdF7Dae0cjm9hCAUN9ta
         03sxzaUtRsTAKOflqlB9kFREVRZ8iTlVNNLaRkr3n7AEr8iRQa369ENYg9vWr8+if+O5
         GalA==
X-Gm-Message-State: AOJu0YyKcNdwkLZCeqg0FVdbCpEoOx/L7psCf2CTPwsKfZx5mL3bXDfm
	AvdLFTtk6UR+HmKoVfWNEKY=
X-Google-Smtp-Source: AGHT+IHMyVQ9DHJdncIOviYJm5Op4owrfc9bHRGqIAVNz9Kh2xDLtmkrUG13pmyHarsniEeVN07dLw==
X-Received: by 2002:a17:906:2bd1:b0:a04:3571:e165 with SMTP id n17-20020a1709062bd100b00a043571e165mr1192100ejg.52.1700820983400;
        Fri, 24 Nov 2023 02:16:23 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-72cf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:72cf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id oq12-20020a170906cc8c00b009fbf15cee7fsm1887801ejb.69.2023.11.24.02.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 02:16:22 -0800 (PST)
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
Subject: [PATCH v2 00/10] Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
Date: Fri, 24 Nov 2023 11:16:09 +0100
Message-ID: <20231124101619.6470-1-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.43.0
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

v2:
- fix style issue in patch 4
- add ack in patch 2
- set proper subject prefix for all patches

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
 drivers/i2c/busses/i2c-kempld.c                   |    3 +--
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
 27 files changed, 28 insertions(+), 29 deletions(-)
