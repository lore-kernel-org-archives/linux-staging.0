Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115496D0E
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 18:49:58 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id m16so4329559qtx.9
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 11:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=W/Yva+lieaknSkZKEFwejE4Ku137WP0mlyV8FGttUOY=;
        b=V8VsrF+tjFecTf7SCocG9mdOFPnpVBNz3AWTy3oKFRA50BeHWhgFA1imI0SuNy/x6D
         trlvwlm9mMKWUj+KeRMTaW5zXdRTKjAvIMRi9igkSJd5ZS4R02axxwRu/dHe8BLyXAhq
         eHTgYdYI15/9K59Lc/LbTvNCCBFEiOCAkCb61Of0cYGRPQYNmvqJ3hahBw4ryI4oiotU
         mbntiwg3j9FcoVl7faoLC3PylQ7uIBVWKHvU4gYHC7XhMITKLoYPc04vB7CrYH8EdJ3X
         HlSoHe6yk0yFE2E/8DeJRMKJQqs8fBI7En0OisjrhIBHT5UDg2coKXz8afTnHU4XP2AZ
         W7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=W/Yva+lieaknSkZKEFwejE4Ku137WP0mlyV8FGttUOY=;
        b=niBGifnXq3Yuf8vATBjujv2SpbMmPvFz4CgH2h50GPi3qE4OXj5wT4zJgotydgItXM
         U+OAPcG+SHEbVC/rN2YxDV30StiR7oER8B85ZWrYvis0tSX6+GVFqCuuTy9e+oQ3Pam4
         q1Fv16vgcRCAsiOgB8apOOAvkf0KuDaQ/V8NNP7zSGajdRR6SLZvZsnMChK9SSRALpWj
         QmjGAiYu3EFNwtOA6jNVPPLOOR7wWLqpxRbn+h5PmQCmkd4D/0rDZOhDs6tL4/OHmzTQ
         iSE7/gbyOa1BLE+4HNzOeoVsJEt3iPcdov6I9YnvNOI3ReM38qIu0faubOThXLDPJyfC
         ejfw==
X-Gm-Message-State: AOAM532UCHuyeOmWO6PQqBYSQoMFRlnYPGhICwDEMbtprOMDZ3ODn1xj
	PPHVqYWvs36Kx/1hakkjdE0=
X-Google-Smtp-Source: ABdhPJyDbvD1+yHwXYLDhGXsuLgzJ1AgAyyUze5eUvFTOpfhHLZnJF4pvLfgegVH+5vQM3oeiFb5HA==
X-Received: by 2002:ac8:7fcd:: with SMTP id b13mr13785148qtk.68.1617994197206;
        Fri, 09 Apr 2021 11:49:57 -0700 (PDT)
Received: from smtp.gmail.com ([2804:14c:73:9a01:86f3:17eb:e23c:86fd])
        by smtp.gmail.com with ESMTPSA id 8sm2390329qkb.32.2021.04.09.11.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 11:49:56 -0700 (PDT)
Date: Fri, 9 Apr 2021 15:49:52 -0300
From: Lucas Stankus <lucas.p.stankus@gmail.com>
To: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 0/3] staging: iio: cdc: ad7746: remove platform_data in favor
 of device tree bindings
Message-ID: <cover.1617993776.git.lucas.p.stankus@gmail.com>
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

Lucas Stankus (3):
  dt-bindings: staging: iio: cdc: ad7746: add binding documentation for
    AD7746
  staging: iio: cdc: ad7746: use dt bindings to set the EXCx pins output
  staging: iio: cdc: ad7746: use dt binding to set the excitation level

 .../bindings/iio/cdc/adi,ad7746.yaml          | 79 +++++++++++++++++++
 drivers/staging/iio/cdc/ad7746.c              | 43 +++++-----
 drivers/staging/iio/cdc/ad7746.h              | 28 -------
 3 files changed, 100 insertions(+), 50 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/cdc/adi,ad7746.yaml
 delete mode 100644 drivers/staging/iio/cdc/ad7746.h

-- 
2.31.1

