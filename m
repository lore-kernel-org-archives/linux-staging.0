Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45732F84
	for <linux-staging@lists.linux.dev>; Sun, 18 Apr 2021 22:49:38 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id o2so11429323qtr.4
        for <linux-staging@lists.linux.dev>; Sun, 18 Apr 2021 15:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=8f8tA/n6xbmYlHiIyZ3SQubIwB89gaMFiVbKEmjFM88=;
        b=sBL5s/mzvSlS+7z5vmbFtQUGRmmVH/nmWOflKpp3Vbzp2CxBGHsgm2RFnuClq2dZTU
         LZPyLOzPbmhRtn6370n0HG0eoGMsdXTVTtFipOWw+M19sEP2pyys9Ws9AQ1TnjQhug6t
         CJQv9GZQmujb85an5Zem+BtztpSLBEKP1r8QGTUGJu2AgArHDuRulMkhWvjZzB/P3uOh
         bg0GjevkjPQAbQNdeFzZFnnkq6PkSppbtCk4IRLPJXASg0RmytGMckpKQkIJcUK5fOqE
         cK27YuriCP8UmMgxFKQNTEqK7X5NwmH0bbS8vHPrQ4Rq1TKlX9gA7h3fEYX5l/ObDAf0
         Cu+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=8f8tA/n6xbmYlHiIyZ3SQubIwB89gaMFiVbKEmjFM88=;
        b=KnN0xCgOyeP1PPr1TTylsr1VTNcqBs3cEMrGVHNf5+APmm8R+VwwED51JPNU5aydru
         TUQbtyUxBUuKh6SKQCBw8kHOxGrckLnTujhvqtJD8fmPxls4liyxJmEoFp1UVsc38gbg
         PuF/HTKG2hK8CfamGX03G+vjlx8BLtPmxOZOdFZhF8qR8el1RHx6UljngQMP0HM9HTZR
         H0MkNe2Rc4UbQB4JVVsiPJJRQFO0XYZ9UrBXhL4OjwSw151fpdLjYd7Btg3oIqpXwZMh
         padX7b1k1uLnqmikeDPhmiQbKVIg2G7gV05TmBpaUNQQgfPbOzoYycNJtVS3/ExgfJLx
         G5uA==
X-Gm-Message-State: AOAM532u0N0hT1k4fMnkncM56a3EnvGaCCtgaAMpNTGFu+6qpB3ePbnP
	aHyDP0kcc6jStOUWvKnKg+Q=
X-Google-Smtp-Source: ABdhPJwaK9jHA8GKdt3RJS12O4sPh2p6fWcn2DGjvdkYOLKGk5QjFrb5ITZQ1Uxu8KSaNE3mpm+xFA==
X-Received: by 2002:ac8:714c:: with SMTP id h12mr4131027qtp.221.1618786177904;
        Sun, 18 Apr 2021 15:49:37 -0700 (PDT)
Received: from smtp.gmail.com ([2804:14c:73:9a01::1003])
        by smtp.gmail.com with ESMTPSA id h23sm7936257qtr.21.2021.04.18.15.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 15:49:37 -0700 (PDT)
Date: Sun, 18 Apr 2021 19:49:33 -0300
From: Lucas Stankus <lucas.p.stankus@gmail.com>
To: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] staging: iio: cdc: ad7746: add dt properties for
 capacitive channel setup
Message-ID: <cover.1618785336.git.lucas.p.stankus@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch series aims to replace the platform_struct for the ad7746 driver
in favor of device tree bindings, creating the dt-bindings documentation in
the process.

Since the header file was only used to define the struct and the excitation
level values, it was possible to remove the file entirely.

Changelog v1 -> v2:
- Correctly set I2C device address on the device tree documentation.
- Change EXCA and EXCB dt properties from u32 enum to boolean.
- Update capacitive excitation dt property to enumerate possible per mille
  values instead of using indexed voltage levels.
- Merge last two patches to avoid special handling of remaining
  platform_data properties.

Lucas Stankus (2):
  dt-bindings: staging: iio: cdc: ad7746: add binding documentation for
    AD7746
  staging: iio: cdc: ad7746: use dt for capacitive channel setup.

 .../bindings/iio/cdc/adi,ad7746.yaml          | 73 +++++++++++++++++++
 drivers/staging/iio/cdc/ad7746.c              | 42 +++++------
 drivers/staging/iio/cdc/ad7746.h              | 28 -------
 3 files changed, 92 insertions(+), 51 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/cdc/adi,ad7746.yaml
 delete mode 100644 drivers/staging/iio/cdc/ad7746.h

-- 
2.31.1

