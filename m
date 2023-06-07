Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F0A6139
	for <linux-staging@lists.linux.dev>; Wed,  7 Jun 2023 15:01:25 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-52cb8e5e9f5so523866a12.0
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 08:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686150084; x=1688742084;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8JScWWC74+BsV0fJcjz9vzitBceUwIm3AIsd9TVMHHw=;
        b=U6E3/1M8l5g0rXH+m2pQJSyRDyBkwriKf2tZoQqW15ghveXyC/SJYouKOWYJnro7Jy
         YH9TXxyKnPA5QDvxF19Xg+nEWiOo5reX5dzSF1jT3A49/0Tm2gKpfc8jh/mDqc8zvzhT
         kErXjXmX/NdqHXdOk5EWKL/Sm/Ki5KU6WSkdkzHrtNDu6BUxZz6+wqDj/J5B3O2TD1BH
         EVaPnqM/jK03Hxrlomw7aJnP4RYed1r9JcjcTBgDg6N/dAJvlDDoNnUKOmbDBDhQUq4g
         9qaljs0lhDQitF/jGmH4wJTN9YXO3w+Gnv6OoadQ+GPP5yyzI5S/nb9L6EvNbDuch25a
         Kymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686150084; x=1688742084;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8JScWWC74+BsV0fJcjz9vzitBceUwIm3AIsd9TVMHHw=;
        b=d5MzlNhVEIzldTcPWKIIHUuxhxGbvIWdokqp60DeucVFfV4t4FOJIXtNyZXT0yL6LZ
         JkwH9GmuSzfxh5zJUfl8o1hoINgKAfpSdCMOqHt9rMGadzzdbM5UKLYziwMNXsPC0wgg
         yvTKH9wLqJZLJu3pJZjvQJQbOXh8ydNxMLC6YCrahYwwAKJEIsDqmdMWf2nfQAFOvD+0
         2h66f7aERveQ7R1igaF7pV7XoRTNZllJg+osBt6Qo7Q8lT/24bOLZXzWQTfR6Sgrx0VE
         g23mHCCslscEtExZi2PDGk9F4ko+bnkr5JuXaJHPyjDAFv9thItvxgy2A3m+jdIUB/zE
         xYUw==
X-Gm-Message-State: AC+VfDyAllv9GavmPj7NLenb996B296t2yuLw2Bg4u0CJZM9y95dLFKH
	Rqtqh9bAUKfKDmBWSPIJB5k=
X-Google-Smtp-Source: ACHHUZ4f62IWDGnTIlEDm2TbAF3TDmsh0zSXUt/EIJwKm6wuPNLpb07mrX0Jm91x/4R2/0T9SNTdWw==
X-Received: by 2002:a17:90a:199:b0:253:2816:2a12 with SMTP id 25-20020a17090a019900b0025328162a12mr6682116pjc.14.1686150084136;
        Wed, 07 Jun 2023 08:01:24 -0700 (PDT)
Received: from yogi-Zephyrus ([103.251.210.211])
        by smtp.gmail.com with ESMTPSA id 27-20020a17090a19db00b002568f2f8102sm1574901pjj.30.2023.06.07.08.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 08:01:23 -0700 (PDT)
Date: Wed, 7 Jun 2023 20:31:19 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] Trivial code cleanup patches
Message-ID: <cover.1686149467.git.yogi.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

These patches remove variables in the struct rtllib_device that were 
set only once throughout the driver. Instead of using these variables, 
the patches modify the relevant code to directly call the corresponding 
functions, eliminating unnecessary indirection and removing CamelCase.
The patches are required to be applied in sequence.

Yogesh Hegde (5):
  staging: rtl8192e: Remove variable SetWirelessMode
  staging: rtl8192e: Remove variable SetBWModeHandler
  staging: rtl8192e: Remove variable LeisurePSLeave
  staging: rtl8192e: Remove variable InitialGainHandler
  staging: rtl8192e: Remove DRV_NAME definition in rtllib_debug.h

 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c |  4 ++--
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c   |  4 ----
 drivers/staging/rtl8192e/rtl819x_HTProc.c      |  8 ++++----
 drivers/staging/rtl8192e/rtllib.h              |  6 ------
 drivers/staging/rtl8192e/rtllib_debug.h        |  5 -----
 drivers/staging/rtl8192e/rtllib_rx.c           |  3 ++-
 drivers/staging/rtl8192e/rtllib_softmac.c      | 16 +++++++---------
 drivers/staging/rtl8192e/rtllib_softmac_wx.c   |  9 +++++----
 8 files changed, 20 insertions(+), 35 deletions(-)

-- 
2.25.1

