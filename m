Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBBF2F80
	for <linux-staging@lists.linux.dev>; Sat,  1 May 2021 12:32:08 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id q5so391851qvv.6
        for <linux-staging@lists.linux.dev>; Sat, 01 May 2021 05:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=treFpCv/v2Up3Fln8SQMygcym9zynmOgjODNUoZBh7Y=;
        b=EnUZ7riT4JWee6GBFwnxL60Eg3YS8vImImJbcAKTJZZOyX+J3q898X54RhMpQnvvER
         K9xEdHR+IoP+kcgIpn+1W5pxfnTheXNn43XvvnGlTmMd1mdWQwD7QtuFdpbjAlarzz58
         5KhJ3dCNpLpwRuP5hfVmEOIKZqGTVet0IHIoz+7JsgfSUHvSDNzcdzp0SRtS75nwGt3i
         4+neWC84viSooU5sznw/kqs1YOjDLvm63TMXzWi08H6chn+MLh2Dawl6OAwhoaOk04dk
         xJ+oN8+CNtGBCZ2F3pKj9YqvUQmGyFycaVGumsHBhGBE9I4pOrFtUt1RSUcJ0SEjZIRv
         Lsgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=treFpCv/v2Up3Fln8SQMygcym9zynmOgjODNUoZBh7Y=;
        b=ujtO02c1NeLJ5iK4BXp+94ZA/d7DNpBheD0MbmpKCpD5L9w4UeV7j+JpwzXw6WiNbj
         abBLgmqWNFedZfK7rLVguFKPIUoq95C4F0b3tYG8UrhREs4DAySyxbNFzhAZ217k35nJ
         qbdjr9D4kh4ye3RX4eWVrKrasxWM8LhDz4hVD6+ikgP9KIOKG7S7HuOBPe54ZwnINOeY
         nA9VxjCT5bblBaPTNDGMaw9k13whgS/dPiG2RetpC5WFxBcl6bFj2dfIdFRDsgDqfDXL
         P7FDIK2NbXhBzZoBd5dAbcDMokbfy/7IaWV83tHENQY00uEwQPEy+TypUEkc4+85i0xY
         ur5A==
X-Gm-Message-State: AOAM533iTu55Pr5s21G9n7n9oxjZm+aDGwoVXdxMlhnrYQYDQEo72HtK
	GocSDFoAK/qpEuexRKNdRos=
X-Google-Smtp-Source: ABdhPJzQGOi9neP1JQlUMpp5sFSrdNJjuKLCUypWdg2BTyr6Fd8L4ZOlmoq984GrtzjuuxmcIXcahA==
X-Received: by 2002:ad4:4109:: with SMTP id i9mr10536417qvp.30.1619872327611;
        Sat, 01 May 2021 05:32:07 -0700 (PDT)
Received: from smtp.gmail.com ([2804:14c:73:9a01::1001])
        by smtp.gmail.com with ESMTPSA id g185sm3898165qkf.62.2021.05.01.05.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 05:32:07 -0700 (PDT)
Date: Sat, 1 May 2021 09:32:03 -0300
From: Lucas Stankus <lucas.p.stankus@gmail.com>
To: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 0/2] staging: iio: cdc: ad7746: add dt properties for
 capacitive channel setup
Message-ID: <cover.1619841953.git.lucas.p.stankus@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch series aims to replace the platform_struct for the ad7746 driver
in favor of device tree bindings, creating the dt-binding documentation in
the process.

Since the header file was only used to define the struct and the excitation
level values, it was possible to remove the file entirely.

Changelog v2 -> v3:
- Add application reference note for the inverted EXCX dt bindings
- Replace macro with lookup table for setting the capacitive channel
  excitation voltage

Lucas Stankus (2):
  dt-bindings: staging: iio: cdc: ad7746: add binding documentation for
    AD7746
  staging: iio: cdc: ad7746: use dt for capacitive channel setup.

 .../bindings/iio/cdc/adi,ad7746.yaml          | 77 +++++++++++++++++++
 drivers/staging/iio/cdc/ad7746.c              | 54 ++++++++-----
 drivers/staging/iio/cdc/ad7746.h              | 28 -------
 3 files changed, 110 insertions(+), 49 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/cdc/adi,ad7746.yaml
 delete mode 100644 drivers/staging/iio/cdc/ad7746.h

-- 
2.31.1

