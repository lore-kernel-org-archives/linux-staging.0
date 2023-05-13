Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A416B6FA3
	for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 18:08:37 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-50d897af77bso2055142a12.1
        for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 11:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684001316; x=1686593316;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0/Ioy8XlRnjB8ru+h/B/Hj91TYAz5qdB/2jxU9JJT48=;
        b=S/ki23hiafepWJHtrUUN1PiZ/5CBuliXK5EwGjgpfkjpcFectnHMxX1k6ZEdmwd+lD
         YvsI5FoTatP69I3wWzpTGgPZVbBwnsjftnVsHVUFjMJMy4wTxY50os8GJJ+WkmdFg8em
         /iud1Yk2QVko9FVA3RRB1AyW3JcIx3TFo+Sutr3PW9rM0AaZMNynHGUxRIpXYZKDc1UP
         Lj7aFAgiLTL+pzmjIKnshWQPYxO4NNPZO8DkdDqxg0taxELjYvs9cphfBnS3P1NWNjbJ
         hNF/HuBCgPY6ZFijhvqgjyzsnp1cVOS9EWPHNysFuQBIXpWudOVZf9HTk8oEzCoVueKm
         9e8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684001316; x=1686593316;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0/Ioy8XlRnjB8ru+h/B/Hj91TYAz5qdB/2jxU9JJT48=;
        b=DicbQbXq6kSVwHurNj32ak3Q46e8XIZpyvZj1i1dpoP5rRRi7T+oFfARpS4DNZ09mZ
         UvqvlpJSbhvT/bWTFbrOGqPsSTUYnA4BmP6tlKQdhOA25G9hACu0e5TockeoGEVQsEa0
         kmAlpjZA8mMJkS64iv1TGu6pPMBYQeeiperyNMxECQGQEFeSHopti9uuzY1xcO4B73RJ
         4fdEp/ZdChYNe71Ijtw6nbdRADwuYvFXwNjIAcACTRjz02A3Z0UeKgJRQbkUvYE+HYpG
         KXUU8+qriJONGtscyXmV0uek6jSEm/AJf5vdhYWY/G73LtodLU3V1DGAmZnodlh7ByfA
         pooA==
X-Gm-Message-State: AC+VfDyQWnf9CDduN3nn/UfGxF7jJrWcHgPiEs4ienq2oxzesWz8vUMK
	Lg0r+xhuWfwxukOd+PyOxsc=
X-Google-Smtp-Source: ACHHUZ7wiMuttM7PWHLFpY+5haQzYJEPOFF/cVLbyQn1A/6kh6P80JhMvIHYk17ZD0LVpQ7vysJ9KA==
X-Received: by 2002:a05:6402:510c:b0:50d:a9bb:356c with SMTP id m12-20020a056402510c00b0050da9bb356cmr18787278edd.0.1684001315602;
        Sat, 13 May 2023 11:08:35 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935e01.dip0.t-ipconnect.de. [87.147.94.1])
        by smtp.gmail.com with ESMTPSA id hg14-20020a1709072cce00b009662de1937dsm7006316ejc.131.2023.05.13.11.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 11:08:35 -0700 (PDT)
Date: Sat, 13 May 2023 20:08:33 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] staging: rtl8192e: Remove undefined functions like
 data_hard_stop
Message-ID: <cover.1683960684.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove functions that are declared but not defined.

Tested with rtl8192e (WLL6130-D99)
Transferred this patch over wlan connection of rtl8192e

Philipp Hortmann (9):
  staging: rtl8192e: Remove undefined function data_hard_stop
  staging: rtl8192e: Remove undefined function data_hard_resume
  staging: rtl8192e: Remove functions rtllib_start_hw_scan and stop
  staging: rtl8192e: Remove undefined function reset_port
  staging: rtl8192e: Remove undefined function hard_start_xmit
  staging: rtl8192e: Remove undefined function set_security
  staging: rtl8192e: Remove undefined function SetFwCmdHandler
  staging: rtl8192e: Remove undefined function
    UpdateBeaconInterruptHandler
  staging: rtl8192e: Remove undefined function LedControlHandler

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |  4 --
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  | 29 ---------
 drivers/staging/rtl8192e/rtl8192e/rtl_ps.c    | 13 +---
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c    |  4 --
 drivers/staging/rtl8192e/rtllib.h             | 29 ---------
 drivers/staging/rtl8192e/rtllib_softmac.c     | 60 ++-----------------
 drivers/staging/rtl8192e/rtllib_softmac_wx.c  | 13 +---
 drivers/staging/rtl8192e/rtllib_tx.c          |  8 +--
 drivers/staging/rtl8192e/rtllib_wx.c          | 25 --------
 9 files changed, 9 insertions(+), 176 deletions(-)

-- 
2.40.1

