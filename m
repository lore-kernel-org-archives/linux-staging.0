Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D8971
	for <linux-staging@lists.linux.dev>; Tue, 11 May 2021 20:53:46 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id v8so2261406qkv.1
        for <linux-staging@lists.linux.dev>; Tue, 11 May 2021 13:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=r8GpdZWOTFpi9O+rI32Nwxa8bsE6E39ijBiAWv0y/n0=;
        b=eHLBb8VtEYa9FAPtg1iUGl/yOgPHSTXs50Dipi0itrbcf7EgwYaB5a56rZgCuT1QCo
         cQXwI7USV/IaMSHamV8oJwr+fy/KwCxq7m7wrVR4Gg+QHpkMFMCI7/VoAzYWDZOEaxCf
         216zz+p8ncAryTRcvRWFtbvMdr33LVjhZdmMzQsAhGVh1P2TsHDSumnXRk/cxSzfgUFS
         Cfwf07Rx5eksiwqaDl1b6HAsaw1sT9nbWuGv9lGCL+1I23c/MF60ABjpc+HJxi4RODi/
         JDHPQSkh2UvJSWoc9kX7Q4VTAFPjBRa90vxVsFb96Wt7BZpcLyFv7KvpMFdBca+44w9R
         Y10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=r8GpdZWOTFpi9O+rI32Nwxa8bsE6E39ijBiAWv0y/n0=;
        b=E2IQO6fLkxF3Mfzpr2UzRlM3acaoF8DhaCXPLHbJVX4+78mB71mC+yw/n6A0btiweL
         /6zDVZwWMju15f8V3bKq8uOSI76xxZg50pZ2hMqYWLkGV6dy/KkkJSTU3jzZeW2qUXja
         7S32zNsFvLjfS1PP7yogWQ/esyoDJCp7NxIToWnsYdOLhzvaWAgGk7J2Mp+WKjNgTcx/
         ZWZQkiygfWdByRI0zcm2GOL253QMPhcGAujimBkYjvI7/6vjXwZ62RpOo/K16054tYSM
         oPL6mgrYB378BqEYwOdlHKf8BIf/XRcx7X0yASBZCzWWy5vZtGVEvJTxAOB0G2OYk3A6
         cjfQ==
X-Gm-Message-State: AOAM5300oV2LjRp7bo3qM/dGexN4ffwhPIt2gW/F3AoNG/0GUX5QLNrt
	l1Y0zO5/OS3ACUyFyWniWlM=
X-Google-Smtp-Source: ABdhPJyaHVyOgPTYNozxyXu0MHMgueYWTMAaKhF7eXCeAFh2xiWQ6PAZKqh90LDMOYdRWgBuK+Z6DQ==
X-Received: by 2002:a37:648e:: with SMTP id y136mr30027346qkb.391.1620766425619;
        Tue, 11 May 2021 13:53:45 -0700 (PDT)
Received: from smtp.gmail.com ([2804:14c:73:9a01::1002])
        by smtp.gmail.com with ESMTPSA id j6sm15303621qti.4.2021.05.11.13.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 13:53:45 -0700 (PDT)
Date: Tue, 11 May 2021 17:53:41 -0300
From: Lucas Stankus <lucas.p.stankus@gmail.com>
To: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] staging: iio: cdc: ad7746: initial effort to move out of
 staging
Message-ID: <cover.1620766020.git.lucas.p.stankus@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Cleans up the driver by removing vague comments, fixing code alignment and
refactoring the probe function return. This patch set also contains a small
bug fix when setting the amount of iio channels in AD7745 devices.

These small patches are a starting point for improving the ad7746 driver,
hopefully to a point where it's possible to get it out of staging. I'm
looking up to feedback on what could be improved to accomplish that.

Lucas Stankus (2):
  staging: iio: cdc: clean up driver comments and probe return
  staging: iio: cdc: avoid overwrite of num_channels

 drivers/staging/iio/cdc/ad7746.c | 32 ++++++++++----------------------
 1 file changed, 10 insertions(+), 22 deletions(-)

-- 
2.31.1

