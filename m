Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4ACEEA3
	for <linux-staging@lists.linux.dev>; Thu,  8 Jun 2023 06:52:13 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-510f866ce78so46208a12.1
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 23:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686207132; x=1688799132;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AApGBls8JQyZYvibg1v9QuUQ1wNmSNLlZC0v6OInY7s=;
        b=mx+QD9xiYnSO+K49SLPU1xOnSvH7+vYqTO6sPwiMbeYcJ1r8yW+vF4HkBGw6jODTDx
         UDn1nAuFZnxPa/6PHmMbzVdrojbA03MwvLyP84PlYKEEHTWOZHi6GpxXW15lUeCdowgS
         RL25wMc1jdGD7kmqYODx4zRZHuTlvQvVQDot/am0g3XbIavpy8ndF9dOfrBbnGU56jg1
         PzdoUVBMmvf/EnFUVjlUvVQIGU64rHJD6i3XugMQGpa+B09xxDqTe6xgLvm25hMqad/k
         UVOEcL4oun7GeOiL5Bq7oI0KlmNrQIYtvXb6EUN05aI/yjPo+RMqAYFpll4fPmHjCsWI
         CeOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686207132; x=1688799132;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AApGBls8JQyZYvibg1v9QuUQ1wNmSNLlZC0v6OInY7s=;
        b=iPIv+o03rUQymyISgWDLOCeJxwFAYc3cjBJg/6n1zC0pQIPHQAFJursCWr3/AKd31k
         V116Gzp1Ef+/r/N1YDaAQwYUyC4KI2ZUjzpnUY2x6sIlCe4Hzv1Fi5Rg3u1NxRkhvPiT
         2R+zyfYaQKJDphkbdoWNvdSAk3TMCIJ2z69BH2Og+MAV+jWrCn6+qHSq9x9SX8ldeQYx
         LG2DOU8sBkwlIGmz9DQH0P+nQXcODzgJdFP4hFDLXahtkkcQIlnsk8FZmHzap4F6zs84
         5KcfPkYuQS8MmRHIBnPikmAxayVt9Pkw9C4J40Ccc7zt94BWd5oUGVUqyoIohKx7E6yt
         EG0A==
X-Gm-Message-State: AC+VfDw6nrSVeZ0sPHb2nYd8Z2tQe8KjOMHHac4k6lPPYGx27B4XJKUR
	UoFkaY8GXvAkvEmwYVJP2q6XL8mcoOM=
X-Google-Smtp-Source: ACHHUZ7PYSyOdvHHRlEizjcsqjs886tH/M4fmlSAty4EUnDcSjIU2PAjola7RqiGuk+D6ZDBKg7aUQ==
X-Received: by 2002:a05:6402:4303:b0:514:7874:ca64 with SMTP id m3-20020a056402430300b005147874ca64mr4351214edc.0.1686207131851;
        Wed, 07 Jun 2023 23:52:11 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id g25-20020a50ee19000000b0050bfeb15049sm179474eds.60.2023.06.07.23.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 23:52:11 -0700 (PDT)
Date: Thu, 8 Jun 2023 08:52:09 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] staging: rtl8192e: Use standard api to calculate
 frequency <-> channel
Message-ID: <cover.1686166624.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use standard api to calculate frequency to channel and channel to
frequency. Usage of cfg80211 is required to merge driver into wireless
subsystem.

---
Tested with rtl8192e (WLL6130-D99)
Transferred this patch over wlan connection of rtl8192e

Philipp Hortmann (2):
  staging: rtl8192e: Use standard api to calculate frequency to channel
  staging: rtl8192e: Use standard api to calculate channel to frequency

 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c   |  6 ++++--
 drivers/staging/rtl8192e/rtllib.h            |  2 --
 drivers/staging/rtl8192e/rtllib_softmac_wx.c | 22 +++-----------------
 3 files changed, 7 insertions(+), 23 deletions(-)

-- 
2.40.1

