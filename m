Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15C270
	for <linux-staging@lists.linux.dev>; Sun, 23 May 2021 17:11:40 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id a7so8717326qvf.11
        for <linux-staging@lists.linux.dev>; Sun, 23 May 2021 10:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=iwxLYsfnHOmvUnEFzHOLUjQtowCkQzZpZ02r9YeM+9E=;
        b=UTiwRr5o5hHzc6dxrDpEuYbJUd/Wxb7c3vNSqseoDKZkAprP0EsinNkPcvEqH/MtRf
         VZ0W4kk/h95ARtaM2DQ+f5Octj0jMZpOh4tfXdbCYNr0AfuCdBMW4eQMPUaGaoJaTVdx
         wuc4TfMTa+CaK82dcKDNctlqL6rCCQfSCCd7HI+sbgr8XvwooRBlEohWrf4OirSDYcgF
         PAs+hGT4LWyX390+W97wSGKcOCEJXJjGu6sbrPLdcUPv/1E2nSAgSle3Q1QFhIplWDd/
         e3E2t2LOUyDauctz8X1umaVVUMo+uaUq3FCM9omM+A1oKlECyu9nRVbvWia/epgJ9t1C
         tpxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=iwxLYsfnHOmvUnEFzHOLUjQtowCkQzZpZ02r9YeM+9E=;
        b=VrLSztVwi29bFudgO23X5vccFgD2Ymx3DOJwWihpGpeTMSoWStQSDFzSR+y84zaPfE
         eoMCQ6Kv+DDMnuEkyN3iFyRxNdVRrsSJLD5CeRJ/Ffbv6Pze6IlTNRCjHClVDxOYjrcw
         V73dU4MSQHqSdzW+F+w0/FDB/e5LCFUhKQkMRfInynlblwzItvmzAAWIvongn/bbGhy8
         zt8tR58rofNf9uBH/L0Y3rh1QR6bDdCPSfer6cJT1HBhyzN5MVPet+9BW7BbvGbUzmj7
         1q/y/6mIAurNjTXVN3hP9VQGIFPTZsf1DbYrV9pQ0DzVXRevG+lYjdBA2E25ZSZLO7Qb
         ZACA==
X-Gm-Message-State: AOAM532gjj9z5YggaN3a2JZDIOyRTP/LzrlpvmTJmBGfcRUplysJsYZZ
	6z2VDNjg8haQHn9PioG9HOw=
X-Google-Smtp-Source: ABdhPJwAFPIdD87GUgQWCYNEK3Jp1a2Sl2yqNg4wK/kFXmXytCbX+euuNO7ZGj2PbhUYMaW4DrUCiw==
X-Received: by 2002:ad4:57c4:: with SMTP id y4mr25740110qvx.33.1621789900059;
        Sun, 23 May 2021 10:11:40 -0700 (PDT)
Received: from smtp.gmail.com ([2804:14c:73:9a01::1003])
        by smtp.gmail.com with ESMTPSA id k125sm9221718qkf.53.2021.05.23.10.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 May 2021 10:11:39 -0700 (PDT)
Date: Sun, 23 May 2021 14:11:35 -0300
From: Lucas Stankus <lucas.p.stankus@gmail.com>
To: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] staging: iio: cdc: ad7746: initial effort to move out
 of staging
Message-ID: <cover.1621786036.git.lucas.p.stankus@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Tidy up driver code by removing vague comments, simplifying probe
return, and extracting capdac register write to a separate function.

These small patches are a starting point for improving the ad7746 driver,
hopefully to a point where it's possible to get it out of staging. I'm
looking up to feedback on what could be improved to accomplish that.

changelog v1 -> v2:
- Dropped num_channels fixup patch (applied from previous series).
- Split general code style patch into several atomic ones.
- New patch to catch capdac write boilerplate into a single function.

Lucas Stankus (3):
  staging: iio: cdc: ad7746: remove ordinary comments
  staging: iio: cdc: ad7746: clean up probe return
  staging: iio: cdc: ad7746: extract capac setup to own function

 drivers/staging/iio/cdc/ad7746.c | 58 +++++++++++++-------------------
 1 file changed, 23 insertions(+), 35 deletions(-)

-- 
2.31.1

