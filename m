Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CF933FE
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 19:20:56 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id l14so6237663eja.7
        for <linux-staging@lists.linux.dev>; Fri, 09 Sep 2022 12:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date;
        bh=MHmrF1Sw/U7VUEwFmT3i0RB0l9J+zANvjLRv3Fr0HmQ=;
        b=TaBxdkdsge+lH++jWC+CNikaw11zC2EYHR1HdF0WX3x7fF0LGK26spK6RBs8Bxyu4m
         AdA0BKPT9flLl4uhac5RzVZoCNTUDWiXle9ByEIt5ZmZtcm5eRD8vLG6Xf2vwUWSXpEO
         Flx4ZpBDgGj3tdHiCwMu/Wey3PrT6afahoJRqxP0VaSUfL+JfZgSvRkN/lRnmt1pd+gz
         X0FCLoOWvZo+mmCLN7haj7LEnYN5QXTXcW/p0BAwDByPUSbeu+Y2lqQc99+tXhgjlimD
         7ArLOlUPx279pfeEpXmqSQg03miOznIghJ1jHvMtxQJnxOrfA4SJPz+11R0zlHxUp7b+
         FYCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=MHmrF1Sw/U7VUEwFmT3i0RB0l9J+zANvjLRv3Fr0HmQ=;
        b=Lwiv4t6wLs8WbjNfDBlprsKbA6u81gppCGIX0pz1dfLlARVot3nM1Bn5W6psw5jlwQ
         r8gvrsHnDHY6Io3yfiC91OPOil3Egi5G6OB7D4SuAk6VKhp2YX8fgTQevfznvPMkvABB
         pAzan14dpRBANQ88mEf3NxqbAlGPs6noROVgxxF4K1wsSk5GOFnSQu6o9+WQwlVdg+ln
         TvLDzR9MGrtmBWKSDFPdPted/1ZMb+xDh0ieyMG8L0e/cft6EPHvfZUKXmOYi4q2qWLs
         QKOG6Z/NrCQ8wI9FW1Z09txZnpfF88YUBcMzT5T3IKgMIhlg56lNJgnV/AnDhYl2UQ8F
         PkfA==
X-Gm-Message-State: ACgBeo3oemWeoPZ8+Iwf9iJijbBCKnOhum+rNnuXW6HOmuI17Xvsq3VK
	MZLBljhd5KeOfRhUkG6Uc6I=
X-Google-Smtp-Source: AA6agR5VqJvuVqPtbdaaE3HZTSmO8tOo02U06O7SOaTjXytv97qivUE29EplyEWXTGtuqckHnXx2gw==
X-Received: by 2002:a17:906:9b8f:b0:773:dc00:d4a7 with SMTP id dd15-20020a1709069b8f00b00773dc00d4a7mr7266689ejc.118.1662751254953;
        Fri, 09 Sep 2022 12:20:54 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id u9-20020a17090626c900b00775f6081a87sm621425ejc.121.2022.09.09.12.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 12:20:54 -0700 (PDT)
Date: Fri, 9 Sep 2022 21:20:52 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] staging: rtl8192e: Rename CamelCase variables in rtl_core
Message-ID: <cover.1662402870.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Rename CamelCase variables in rtl_core.c and friends to avoid CamelCase which
is not accepted by checkpatch.pl.

Tested with rtl8192e
Transferred this patch over wlan connection of rtl8192e

Philipp Hortmann (8):
  staging: rtl8192e: Rename ChangeSource
  staging: rtl8192e: Rename bActionAllowed
  staging: rtl8192e: Rename bConnectBySSID
  staging: rtl8192e: Rename rtState
  staging: rtl8192e: Rename RFWaitCounter
  staging: rtl8192e: Rename RFChangeInProgress
  staging: rtl8192e: Rename bHwRadioOff
  staging: rtl8192e: Rename CurSlotTime

 drivers/staging/rtl8192e/rtl8192e/rtl_cam.c  |  6 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 84 ++++++++++----------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h |  6 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c   | 10 +--
 drivers/staging/rtl8192e/rtl8192e/rtl_ps.c   | 22 ++---
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c   | 52 ++++++------
 6 files changed, 90 insertions(+), 90 deletions(-)

-- 
2.37.2

