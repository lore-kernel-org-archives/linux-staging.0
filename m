Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AF170
	for <linux-staging@lists.linux.dev>; Thu, 12 Aug 2021 00:25:25 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id g21so6650033edb.4
        for <linux-staging@lists.linux.dev>; Wed, 11 Aug 2021 17:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CGtwjMXEH5QqVf/PuaMPCPlbM6Xuiuly2nloQLXYWxU=;
        b=VDkCydvbt3qx0iDm6nh5tklcsyQUcuEJZQsS6x8YEhCpWNj4QsLNudxCJfiuJ4sKXh
         3SiwLAR+86gV11J/VNhJgOpDiHw9vhtJOArfLNZboxyy/fY9+tCKZf7OYjmrgJZ0cYvG
         QRgja/ZsfzPItTD/mm3Sj7fkuyDFfTKGPQjctgm+m6tBXJn3iYGdQGSNGykuxXrv8TC1
         BpDal6gYvhY65FAPSRm7gX++5vHJWyUVXw28rwh9GrZElFZQ6lVRRsAd/WDjEsRH54Om
         anB3CrhTBlxAWiZ2U7xlv4YAqaBYrKrWOfwcPBL5VL9aOniztGKrKsZ7S3SO14B8PcU3
         rs0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CGtwjMXEH5QqVf/PuaMPCPlbM6Xuiuly2nloQLXYWxU=;
        b=Xu2FhqZhlIsZcydqyhu4wH/ty8HIq914qMoR4leepZysNTdZdXNwi0zycdrHBIADJY
         wdAsr1OrrrxcSJ0EdMC8RSF02qUYDVuvU2ArdXk0eIUX7DpEd5mmZAa4TBB54OuP7E9N
         5+e7p61LoF6ikCLG/rC2yzb1/69cagwzqeuFcTgnV7QzZDSpqHXmTrW1MB0USkijFLoK
         uhmg+1g+rze0NZXpIQGaHZYU8OpwhHcShG1qw3fVdp5HT84wSKe4Oor7VYWepPvKSCfI
         qa+NZSj5xRjompigyUaLozlpvTGTvM+b6s6E+eVcCPzS+GoaaKmy0mQhI0iNB9GZmrKa
         Dtmg==
X-Gm-Message-State: AOAM530fkVfRvGXcY+bA95FbJDksMMxrY4r47QwJ7mcX0PYkCzwChReW
	CjfcilbeNaej6uszunq3s0A=
X-Google-Smtp-Source: ABdhPJwHk0TDrhlYSnm3cGo+D/URg1r46fSkj45jMILM/LeWXmQ0x8aUnKFbYY0WNySLYdm9YBZeZQ==
X-Received: by 2002:a50:afe4:: with SMTP id h91mr2022426edd.326.1628727923521;
        Wed, 11 Aug 2021 17:25:23 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-109-211.retail.telecomitalia.it. [79.22.109.211])
        by smtp.gmail.com with ESMTPSA id l20sm265048ejb.23.2021.08.11.17.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 17:25:23 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Martin Kaiser <martin@kaiser.cx>,
	Michael Straube <straube.linux@gmail.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH 0/3] staging: r8188eu: Remove 5GHz band related code
Date: Thu, 12 Aug 2021 02:25:16 +0200
Message-Id: <20210812002519.23678-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes code only needed for 5 GHz because the r8188eu
driver is meant to work with chips that are only capable to operate on
2.4 GHz band with 14 channels.

This driver has been (quickly) tested with an ASUS USB N10 Nano, however
I think it needs some more testing by more experienced users and
programmers.

Thanks to Fabio Aiuto <fabioaiuto83@gmail.com> who gave me the
inspiration to address this work, since he made a (more extended) 
removal of 5 GHz code from rtl8723bs:
https://lore.kernel.org/linux-staging/cover.1624367071.git.fabioaiuto83@gmail.com/.

Fabio M. De Francesco (3):
  staging: r8188eu: Remove all 5GHz network types
  staging: r8188eu: Remove code related to unsupported channel
    bandwidths
  staging: r8188eu: Remove no more necessary definitions and code

 drivers/staging/r8188eu/core/rtw_ap.c         | 13 ++--------
 drivers/staging/r8188eu/core/rtw_debug.c      | 25 +------------------
 drivers/staging/r8188eu/core/rtw_ieee80211.c  | 19 +++-----------
 drivers/staging/r8188eu/core/rtw_ioctl_set.c  |  4 +--
 drivers/staging/r8188eu/core/rtw_mlme.c       | 10 --------
 drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 13 +++-------
 drivers/staging/r8188eu/core/rtw_p2p.c        |  2 +-
 drivers/staging/r8188eu/core/rtw_wlan_util.c  | 15 ++---------
 drivers/staging/r8188eu/hal/odm.c             | 20 +++------------
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c |  3 ---
 .../staging/r8188eu/include/Hal8188EPhyCfg.h  |  4 ---
 drivers/staging/r8188eu/include/ieee80211.h   | 23 ++---------------
 drivers/staging/r8188eu/include/odm.h         |  8 ------
 .../staging/r8188eu/include/rtl8188e_spec.h   |  5 ----
 .../staging/r8188eu/include/rtw_mlme_ext.h    |  1 -
 drivers/staging/r8188eu/include/rtw_rf.h      |  3 ---
 drivers/staging/r8188eu/include/wifi.h        |  2 +-
 drivers/staging/r8188eu/include/wlan_bssdef.h |  2 +-
 18 files changed, 21 insertions(+), 151 deletions(-)

-- 
2.32.0

