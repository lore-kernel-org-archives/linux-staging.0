Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F1C3C0A
	for <linux-staging@lists.linux.dev>; Wed, 29 Mar 2023 21:21:42 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-17aaa51a911so17695723fac.5
        for <linux-staging@lists.linux.dev>; Wed, 29 Mar 2023 14:21:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680124901;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c5JObOnJhn7Qa3BJtOdllaC7YuPWVzUh4uR8zZIj5qw=;
        b=TrW6eh9TLUZ7la+trVtlR3BsE/kwzTH7OtU/CIxXo39HnkNzlX+vBM2SbwE1DeDqHj
         5FiII18wNaW2C+HawsrphZjPnIRg6rbzwTI85mUqh3Tjgpr52C4mT3D/v94fuKlCVoKl
         R7rw2WcwDNafYUXG/RqoCw+D313cEiOGjnXJh9+Ojunu46dd04MjMSDgflTxnsPPfp5t
         4aIXavY5snda/nFLK7q7vsLNzMlxTNWlXOjJXfbBjdZphushkz24HCcgWhkQ9BUj4gj7
         x3kzkaVX9xRqhrqWitLyDtn96JO8O9bZiBWNr4j7h+HsC9jvfx/ewgj8Dj68vz9LsqRq
         GI+A==
X-Gm-Message-State: AAQBX9fRgreslIU76D7U00ScS+40gMSy6QAZth44TXcTe4mxRdjlsj7E
	FgkR4FEokETTjQchmh7/mQ==
X-Google-Smtp-Source: AK7set/kayRJ98J+4lkqmTCrvYqUbSg+NPKMc5ZxUa6OI9imoPRJExO5faQF3fCKQ5rShmnmkvcw7Q==
X-Received: by 2002:a05:6870:899c:b0:17b:1a4f:adfe with SMTP id f28-20020a056870899c00b0017b1a4fadfemr11592033oaq.10.1680124901366;
        Wed, 29 Mar 2023 14:21:41 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id tk6-20020a05687189c600b0017703cd8ff6sm12167748oab.7.2023.03.29.14.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 14:21:40 -0700 (PDT)
Received: (nullmailer pid 86888 invoked by uid 1000);
	Wed, 29 Mar 2023 21:21:39 -0000
From: Rob Herring <robh@kernel.org>
Subject: [PATCH 0/5] Remove acpi.h implicit include of of.h
Date: Wed, 29 Mar 2023 16:20:41 -0500
Message-Id: <20230329-acpi-header-cleanup-v1-0-8dc5cd3c610e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKmrJGQC/x2N0QrCMAwAf2Xk2cDWaJn+iviQddEGSi0pE2Hs3
 w0+3sFxO3QxlQ63YQeTj3Z9V4fpNEDKXF+CujpDGAONFK7IqSlm4VUMUxGuW8MYL0TTHOYzRfB
 y4S64GNeUva1bKS6byVO//9X9cRw/n6ivRnoAAAA=
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Marcelo Schmitt <marcelo.schmitt1@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johannes Berg <johannes@sipsolutions.net>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jiri Slaby <jirislaby@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Marc Zyngier <maz@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.13-dev

In the process of cleaning up DT includes, I found that some drivers 
using DT functions could build without any explicit DT include. I traced 
the include to be coming from acpi.h via irqdomain.h.

I was pleasantly surprised that there were not 100s or even 10s of 
warnings when breaking the include chain. So here's the resulting 
series.

I'd suggest Rafael take the whole series. Alternatively,the fixes can be 
applied in 6.4 and then the last patch either after rc1 or the 
following cycle.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Rob Herring (5):
      iio: adc: ad7292: Add explicit include for of.h
      staging: iio: resolver: ad2s1210: Add explicit include for of.h
      net: rfkill-gpio: Add explicit include for of.h
      serial: 8250_tegra: Add explicit include for of.h
      ACPI: Replace irqdomain.h include with struct declarations

 drivers/iio/adc/ad7292.c                | 1 +
 drivers/staging/iio/resolver/ad2s1210.c | 1 +
 drivers/tty/serial/8250/8250_tegra.c    | 1 +
 include/linux/acpi.h                    | 4 +++-
 net/rfkill/rfkill-gpio.c                | 1 +
 5 files changed, 7 insertions(+), 1 deletion(-)
---
base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
change-id: 20230329-acpi-header-cleanup-665331828436

Best regards,
-- 
Rob Herring <robh@kernel.org>

