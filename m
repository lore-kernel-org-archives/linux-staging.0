Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E98B8F58
	for <linux-staging@lists.linux.dev>; Wed, 22 Mar 2023 17:14:45 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id eh3so75838199edb.11
        for <linux-staging@lists.linux.dev>; Wed, 22 Mar 2023 10:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679505284;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XcRrrM1o1UQq8TWISprUis5pEAHC0Y4qKGJ5WHoQsZ0=;
        b=KonY2/JIExqCSld+8K4woePb7VQDfSCVnpqTkC0VhwXw/6YqAlfOqAr5ZbvU3W7Nu0
         pjaxmNhJ38o+cAFURXJkkYlP8gz4vRIPMSLDzztnQ+9xqAjdxSG4itNLGYUSRNwTwSex
         //1cf8iP8PzovIC2JSIEDYYed1nkRCx3Cv8XTUAAHusNGPXIACxR0hQMQ3a2fr+PyV7x
         zWtbP0Ug6KdZ7eRJaSwI1wY0ic8mnZpETFp8p0A5s3C7uFj02eb5cT4fAk94BjX6+/DH
         GwnUqoZb5t32+ZJlTuenTo3qWyn2NeN5dYg89+xtGFHbPpQP7H7AQbIVDtXN7k4TNHNV
         uQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679505284;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XcRrrM1o1UQq8TWISprUis5pEAHC0Y4qKGJ5WHoQsZ0=;
        b=fkWk4NupzTAxjqnKNvJhDsNyFI8CnJx271M0VkRf25nqT8MhM5iLI0wI0EhU4SSyAe
         gqnJSuLqPc6rQ59ueda1KqYJ98W44scbLM5cbV7xE/mrkx6uzMxfMFtBarVXcZLfaN/o
         WOzWQpBMlCBc11Y6qU+rAJpEoZx5De02UqSbXNbk9pTxA3sjHw6xt8ETGgqWLGqygoVp
         9G768n9htPexU1q2wk2T/fqsQQfJM/Hz0aECErQFVXdtByUIqDhNBYoxhTbujJzgSOvE
         HaI8eFwtt2exYhROGEFWpYudh6iwL/kB+Es1Dro6mxD8bikMwWhfqqF16Uyi85QEmj3n
         w7MA==
X-Gm-Message-State: AO0yUKVZ/MefPZOEfg242yiZquJh0CEeUABIzYHNeA0/TDOLbjNA8uOA
	xpvSbcgOTa3ovV866QSY7l0=
X-Google-Smtp-Source: AK7set+cTsLf78XXHmmC57WantiM4qBchFDo5bjaTIxO2aVFOHTGZ4MG/+rROpcg2y01ea93YTCJEA==
X-Received: by 2002:a05:6402:524e:b0:4fd:298d:4f26 with SMTP id t14-20020a056402524e00b004fd298d4f26mr8402079edd.3.1679505283730;
        Wed, 22 Mar 2023 10:14:43 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id l6-20020a50d6c6000000b004af62273b66sm7990922edj.18.2023.03.22.10.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 10:14:43 -0700 (PDT)
Date: Wed, 22 Mar 2023 18:14:41 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/8] staging: rtl8192e: Replace macros in r8192E_phy.h
Message-ID: <cover.1679504314.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Remove unused variable or macro or replace custom macro with standard
kernel macro or function.

Tested with rtl8192e
Transferred this patch over wlan connection of rtl8192e

V2 has one patch less as it was already accepted.
---
V1->V2: Changed subject lines to be without “f.”, "m." or ".."
        Changed one description from standard function to standard macro

Philipp Hortmann (8):
  staging: rtl8192e: Remove double defined constants bMaskBytex and more
  staging: rtl8192e: Replace macro skb_tail_pointer_rsl with standard
    function
  staging: rtl8192e: Remove unused macro queue_delayed_work_rsl and more
  staging: rtl8192e: Replace macro INIT_DELAYED_WORK_RSL with standard
    macro
  staging: rtl8192e: Replace macro INIT_WORK_RSL with standard macro
  staging: rtl8192e: Replace macro container_of_work_rsl with standard
    macro
  staging: rtl8192e: Replace macro iwe_stream_add_event_rsl with
    standard function
  staging: rtl8192e: Replace macro iwe_stream_add_point_rsl with
    standard function

 .../staging/rtl8192e/rtl8192e/r8192E_phy.h    |  8 ----
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  | 38 +++++++----------
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    |  3 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_ps.c    |  3 +-
 drivers/staging/rtl8192e/rtllib.h             | 15 -------
 drivers/staging/rtl8192e/rtllib_softmac.c     | 23 ++++------
 drivers/staging/rtl8192e/rtllib_softmac_wx.c  |  3 +-
 drivers/staging/rtl8192e/rtllib_wx.c          | 42 +++++++------------
 8 files changed, 41 insertions(+), 94 deletions(-)

-- 
2.39.2

