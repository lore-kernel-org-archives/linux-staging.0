Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CDF11182
	for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 14:17:18 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5440e98616cso3058220a12.0
        for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 07:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687184237; x=1689776237;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m462Io47RlCWBfDJCQFiCJnqNvxTLHRYWMF6j3UT8B0=;
        b=Ju6rdffIi4s6qEqyNIzu8niM8oNTnG/uxGon9J9yJLsdAboFnyUvOLZkm2VAGkd28j
         jpYhtbv4LmDpVqyiq+wq5Dep01gGsEkXNUBW93U/r2Ia7470KRRo1VwBogPKZxcuOsxC
         fN328Z2kg4U7T/G+1Jh7WkTrhwILEtmegjMJFaFR2assviRqYauOm9TrKLYWGIIF3Kcs
         aQOf+Q6a2zTlu3jGGvdXh4TUBois9K9qwxeAJkwiLoYDKUISG+UFdQOqJF8rZOAPJ+eG
         ReCPqBrGnU1e+tLqGjLEi2VIjc899vxQRmK2vbKZbodgv4yamLJYUQtVYJO1xMTicEkQ
         qSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687184237; x=1689776237;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m462Io47RlCWBfDJCQFiCJnqNvxTLHRYWMF6j3UT8B0=;
        b=jNWzfkFv3V/rZYSr70oWMJIPBJRsM/074GcnUEGkL3vOarBjqOszzaNtv+QYOdX7hX
         tgSsFYDAxAaSgdgoW+N+BnVsm0L461NGdivEwcSkky/9D3jENYLxLOwBmaE7odkn2Pbk
         32yPg1p49ycYEf3hc9b7lOx9lXk9ergiIcRamDO3spQEu2NAxdGyFZFE9v5EsEZSVcPX
         uFrCtdsEDNEs0xaBFMkIaadI2X1UNGvsbc2QJnPo3kv2DeHg9uEl9Qmf4h4XjuRlfPEI
         9Cya/klIRw6tgkJ+lQ+/+/UwZjayWidJOQag6DFEySAQYNcpoJ3GNkP+ETNZ5B7GQ6tq
         BnFA==
X-Gm-Message-State: AC+VfDybyMIwBLSWiG0sQG8LSdu3Vak3mQv9OED2swE5DmH62EeksGlE
	00uro34McBn34ks2x8v3DU0=
X-Google-Smtp-Source: ACHHUZ65D/W4si0E5ycCXfvGbSLyoUtFQJnN9DnqBS592C87gg9tWtlIWCnWgouDRpUYEDW9bNc8vQ==
X-Received: by 2002:a17:90a:6f43:b0:25e:fb6d:ce68 with SMTP id d61-20020a17090a6f4300b0025efb6dce68mr5438247pjk.6.1687184237181;
        Mon, 19 Jun 2023 07:17:17 -0700 (PDT)
Received: from zephyrusG14 ([103.251.210.211])
        by smtp.gmail.com with ESMTPSA id bo24-20020a17090b091800b0025edb720cc1sm3731946pjb.22.2023.06.19.07.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 07:17:16 -0700 (PDT)
Date: Mon, 19 Jun 2023 19:47:11 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, philipp.g.hortmann@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, ivan.orlov0322@gmail.com
Subject: [PATCH v4 0/4] Trivial code cleanup patches
Message-ID: <cover.1687183827.git.yogi.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Rename variables in struct rtllib_device to avoid CamelCase which is not
accepted by checkpatch.

---

v4: Rebase to latest staging-testing branch as suggested by Greg Kroah-Hartman  
    <gregkh@linuxfoundation.org>.

v3: The driver is split into 2 modules, calling the functions directly which 
    the v2 of the patchset does breaks compile. So reverting back to v1 of 
    the patch as suggested by Greg Kroah-Hartman <gregkh@linuxfoundation.org>.

v2: Removed the variable and called the function directly instead of
    just renaming the variable as suggested by Greg Kroah-Hartman
    <gregkh@linuxfoundation.org>.


Yogesh Hegde (4):
  staging: rtl8192e: Rename variable SetWirelessMode
  staging: rtl8192e: Rename variable SetBWModeHandler
  staging: rtl8192e: Rename variable LeisurePSLeave
  staging: rtl8192e: Rename variable InitialGainHandler

 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c |  4 ++--
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c   |  8 ++++----
 drivers/staging/rtl8192e/rtl819x_HTProc.c      |  4 ++--
 drivers/staging/rtl8192e/rtllib.h              | 12 ++++++------
 drivers/staging/rtl8192e/rtllib_rx.c           |  2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c      | 12 ++++++------
 drivers/staging/rtl8192e/rtllib_softmac_wx.c   |  6 +++---
 7 files changed, 24 insertions(+), 24 deletions(-)

-- 
2.34.1

