Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B95173
	for <linux-staging@lists.linux.dev>; Fri, 11 Jun 2021 00:25:09 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id t4-20020a1c77040000b029019d22d84ebdso7608607wmi.3
        for <linux-staging@lists.linux.dev>; Thu, 10 Jun 2021 17:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=So2CEc+kXxpo6KPwbMFXBnm0as5qiNVoGbdgocDkXrs=;
        b=FVPVsj6H8jiwFTvqCBV6Q7azEEvVoXka3BIxnLZsswgLcFkxf1wdRkQQW5W1YqHts9
         hg9q/IDpDm9ErFTZP+u7kSEO7ZaLQtQo9KWQ2SKOOp3E2WaVpEI4iVEVnnBTsXf5QCnt
         4Ik3BdDr2IRfxpJWcil/gGoMpHWnsNNavDlbYIJDRXm7elbtajKg49YAPcgs5yR2y/71
         PwvIUcQv3z87K7d1HKQLe8edC54mw86l1b7pZEDSeiWbhtNiLtuNeT09jHIYj3Mwz9Re
         ihqZci0IJRi1ZwrExNiBc33Myl43TA/T5anW1B186oS0aly2PSzx+gGwVF+gFeLpqplb
         CeZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=So2CEc+kXxpo6KPwbMFXBnm0as5qiNVoGbdgocDkXrs=;
        b=jqxzzgFu7ThdsgOhPgRFGgLSuB+LSVMbtvFY2CVjDTIFaQnpHwsTCrIh46HiGw4EZs
         mgbFfT2CLDqGsuIizL3vS9vfH7/ThYIUDYdjGSpZ81bJ1iV2biWfMdJ0bRMjhgj6HAUP
         1RZK92WasLj3MRuB7c4ENGb5OD6gUmOc6WtdSLxGFSrZklzA1jv2CG9XjtdOPD69xtwV
         ClkFbJNZvByJkGC+OlBg1YQYp0Tw1KihZFSPNmQ4JcnXRwQGoDmsCaukZWg7WMvwfJtj
         PHXNAvJbIU683h4+be8W6yGTuAx9g7igJEm7M3bqhkkCcKX53lqcSe1hzrz/FyJ7YJ77
         BZOA==
X-Gm-Message-State: AOAM532guYbcQJqgl1F16OtbFgfnMgKD1c7PHYSjZq61cp3+vEMNVCpu
	56XqufTYX1nhflNR4LuY5mJwcg==
X-Google-Smtp-Source: ABdhPJxqzx4BA9U06ZQKnPocb5L3yHpRROlsOCY4ByVFQFoHRdcQL5+tNIfcPiLJMk2NAg346XrDKQ==
X-Received: by 2002:a1c:4c04:: with SMTP id z4mr1215695wmf.47.1623371108280;
        Thu, 10 Jun 2021 17:25:08 -0700 (PDT)
Received: from localhost.localdomain (2.0.5.1.1.6.3.8.5.c.c.3.f.b.d.3.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16:0:3dbf:3cc5:8361:1502])
        by smtp.gmail.com with ESMTPSA id c2sm11386189wmf.24.2021.06.10.17.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 17:25:07 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	kaixuxia@tencent.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	liushixin2@huawei.com,
	unixbhaskar@gmail.com,
	gustavoars@kernel.org,
	martin@kaiser.cx,
	bkkarthik@pesu.pes.edu,
	dan.carpenter@oracle.com
Subject: [PATCH 0/6] staging: rtl8188eu: remove hal/odm_debug.h
Date: Fri, 11 Jun 2021 01:24:58 +0100
Message-Id: <20210611002504.166405-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.30.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes hal/odm_debug.h, which contains various preprocessor
definitions, as well as an unwieldy ODM_RT_TRACE macro which is not best
practice. It also removes all uses of this macro, and the associated
fields in struct odm_dm_struct which are only used by this macro.

This makes the code cleaner, thus moving it closer to getting out of
staging.

Phillip Potter (6):
  staging: rtl8188eu: remove ODM_RT_TRACE calls from hal/phy.c
  staging: rtl8188eu: remove ODM_RT_TRACE calls from
    hal/hal8188e_rate_adaptive.c
  staging: rtl8188eu: remove ODM_RT_TRACE calls from hal/odm_rtl8188e.c
  staging: rtl8188eu: remove ODM_RT_TRACE calls from hal/odm.c
  staging: rtl8188eu: remove DebugComponents/DebugLevel from
    odm_dm_struct
  staging: rtl8188eu: remove include/odm_debug.h

 .../rtl8188eu/hal/hal8188e_rate_adaptive.c    | 123 +-------------
 drivers/staging/rtl8188eu/hal/odm.c           | 150 ++----------------
 drivers/staging/rtl8188eu/hal/odm_rtl8188e.c  |   6 -
 drivers/staging/rtl8188eu/hal/phy.c           |  38 +----
 drivers/staging/rtl8188eu/hal/rtl8188e_dm.c   |   2 -
 drivers/staging/rtl8188eu/hal/usb_halinit.c   |   5 -
 drivers/staging/rtl8188eu/include/odm.h       |   2 -
 drivers/staging/rtl8188eu/include/odm_debug.h |  83 ----------
 .../staging/rtl8188eu/include/odm_precomp.h   |   4 -
 9 files changed, 14 insertions(+), 399 deletions(-)
 delete mode 100644 drivers/staging/rtl8188eu/include/odm_debug.h

-- 
2.30.2

