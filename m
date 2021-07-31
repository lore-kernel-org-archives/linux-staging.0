Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AA53481
	for <linux-staging@lists.linux.dev>; Sat, 31 Jul 2021 00:23:57 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id n12so13364186wrr.2
        for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 17:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qOH69DvPtbrG4aMNPj+aM7ClxD5APY7n7/6ogqEJBeE=;
        b=mqlnaPv6VgAQaGmmXabUraOPyUgteLJ9ahyrS1EIy/at+APSsHiHN6Lu8O8k3+zBte
         Hz4LIPxYX5992GTKuYmqRJ/C+TTAt1wELPvTYQTDBPFGmj59rx5nMIXZDTAIyntRQnms
         4ZDuDR9xqI7JBkasH36XSD3tqL67KWnzUWH4U1WkMwn2XJ3P9grfJSdDzlDylYPZRhhs
         GwBvOX5rBQsMQBAOP2qnYneQw486wyi+e8SxtSL2jc7NCgEP+QEeuegFmh4ByxUzkKDd
         dvhvQl8sQ3qSdPtanf4Phc/TelIRLe/OXz0xpFOzhgX6eBeFcqOXh7/QZGam+lDbn1V9
         GW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qOH69DvPtbrG4aMNPj+aM7ClxD5APY7n7/6ogqEJBeE=;
        b=p9pXby6GS14mQN7Fy2TsHZaG+CRbZjNvcl1CvWo8TJ2WZJoOk7hksADQt1l6YQ9QHb
         OD2+jhHVAv8X1IuRjPyYwwHyb6UdgUa+Bs1Y30ddJP0fg+qT68UfSugdNkEKgkzYCcGO
         HkH8UrOntvYDkeJQGey+LX3lxPbB/WguK43n7jIfAp024FvqBjQ3G38Q68sNWkyvslXR
         6npV4yMQtlZ7WByiSdBKqv706pLhr8PehgYveU44YpYtyBZbBrgG8I9wWrVL7z84z3c2
         Udo/0dSSbCTHhU9lVnb+SxCDDUcRP1yGiQPn49HTUtUyyn1qRZZ2I+5wX66xAsMBbRu/
         TwxQ==
X-Gm-Message-State: AOAM533hzXo0U8SB2jnmMFn8FyTdrW4IBnyln53/6Scj6yjNPqAmdscE
	ceVzLCMcJkuY04goVsf7ul+KNA==
X-Google-Smtp-Source: ABdhPJxpSIghPIO64MtHpAgcYJUNv2knFlki2Q+Nigcq+p9Rugj+/hBh3WCSxHkugZU74sH82eVfxA==
X-Received: by 2002:adf:f282:: with SMTP id k2mr5730940wro.183.1627691035418;
        Fri, 30 Jul 2021 17:23:55 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id x9sm3236011wmj.41.2021.07.30.17.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 17:23:54 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/14] remove include/odm_debug.h
Date: Sat, 31 Jul 2021 01:23:39 +0100
Message-Id: <20210731002353.68479-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series removes include/odm_debug.h, after first going through
and removing all uses of various macros within it and chipping away
until it is no longer used. Removing all of this code significantly
reduces the size of the driver by many hundreds of lines of code, and
is a good idea due to the fact that none of the code follows best
practice and none of it uses proper kernel internals for debugging.

Phillip Potter (14):
  staging: r8188eu: remove ODM_PRINT_ADDR macro definition
  staging: r8188eu: remove ODM_dbg_* macro definitions
  staging: r8188eu: remove ODM_RT_ASSERT macro definition and caller
  staging: r8188eu: remove ODM_RT_TRACE_F macro definition
  staging: r8188eu: remove ASSERT ifndef and macro definition
  staging: r8188eu: remove ODM_RT_TRACE calls from
    hal/Hal8188ERateAdaptive.c
  staging: r8188eu: remove ODM_RT_TRACE calls from hal/HalPhyRf_8188e.c
  staging: r8188eu: remove ODM_RT_TRACE calls from hal/odm_HWConfig.c
  staging: r8188eu: remove ODM_RT_TRACE calls from hal/odm_RTL8188E.c
  staging: r8188eu: remove ODM_RT_TRACE calls from
    hal/odm_RegConfig8188E.c
  staging: r8188eu: remove ODM_RT_TRACE calls from hal/odm.c
  staging: r8188eu: remove ODM_RT_TRACE macro definition
  staging: r8188eu: remove DbgPrint and RT_PRINTK macro definitions
  staging: r8188eu: remove include/odm_debug.h

 drivers/staging/r8188eu/core/rtw_xmit.c       |   1 -
 .../r8188eu/hal/Hal8188ERateAdaptive.c        |  99 +-------
 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c  | 228 +-----------------
 drivers/staging/r8188eu/hal/odm.c             | 199 ++-------------
 drivers/staging/r8188eu/hal/odm_HWConfig.c    |   6 -
 drivers/staging/r8188eu/hal/odm_RTL8188E.c    |  38 +--
 .../staging/r8188eu/hal/odm_RegConfig8188E.c  |  29 +--
 drivers/staging/r8188eu/hal/odm_debug.c       |   7 -
 drivers/staging/r8188eu/hal/rtl8188e_dm.c     |   1 -
 drivers/staging/r8188eu/hal/usb_halinit.c     |  23 --
 drivers/staging/r8188eu/include/hal_intf.h    |   2 -
 drivers/staging/r8188eu/include/odm.h         |   4 -
 drivers/staging/r8188eu/include/odm_debug.h   | 126 ----------
 drivers/staging/r8188eu/include/odm_precomp.h |   4 -
 drivers/staging/r8188eu/os_dep/ioctl_linux.c  |  27 ---
 15 files changed, 35 insertions(+), 759 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/include/odm_debug.h

-- 
2.31.1

