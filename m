Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3F45A1F
	for <linux-staging@lists.linux.dev>; Thu, 10 Mar 2022 18:54:08 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id c25so6046043edj.13
        for <linux-staging@lists.linux.dev>; Thu, 10 Mar 2022 10:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=+JFJPMX7Uwm4Dfyx3KvGq89D/Z2lFa+BIel917v3Dr0=;
        b=VSMYRlT5qdW/04vy+bC1Ddc8L24Hafh/20WrmAxP5WKQUdsFYvhA1m0IBpysR0Y/20
         qwWhHHFWZWONxFU5+ee/WmbWBQmM+p/31L9mXtPDWCEeqkP87G7lPFEHVXdhvVUFohVf
         BxiHa3EVc1I/lA5aN+pJv/br2tp6+Ntx8+nPueyzyduS0tuHmsx1oRgs2mdM0HZqsXwa
         AbVoJHSiS6iT/RA2xWSruaNywCrOHLl6nekOYCEt1ohTpVwckUJvR8m1GTb+1hCy/E9z
         sEmegPZ6UMu1aPX/DX95l9PfHxIYOR9r44HiycSMo0c8RzGhcYV1Vg0Eh1YvxG1pWzG4
         6Fsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=+JFJPMX7Uwm4Dfyx3KvGq89D/Z2lFa+BIel917v3Dr0=;
        b=WIjlvJtrGUpX4mnB1Fqyu8DkfbonQR5Y2Q4JAw1JKhtw78AdqI8xrUilM8oeBlqRcW
         MV+LKUlsLv/nwrFSGtOKsMupeJBfBkqztIz1w46QoAWrbWsVmy9ha2bd0ltt1egtS0Bj
         gcaou/IzN7/Q8OQQcUjfSBE/r55MJ4MCn2UYpMc72yvIW91V2vuVr6Utrt2EggIu7fOQ
         gXvu/uHPV54fDQ05tV/HGXgaUE5LFSRVCzdjQFLJHkD0f2XpZOFb1D0K2CvrO2SakUf0
         evvb36ZBdRLhSOIUVhZiQmLoDGvzAqju99DNNNOOFEvNB9Foo8F1NealVUsH4AOJ57lX
         nDQg==
X-Gm-Message-State: AOAM530+kZp5tDIJAp7YiUHdW0bT8lKUsN78Ta1w3W7duu/L437/4XQ5
	fBPPjI/1vtPZwxVtmrMP7RU=
X-Google-Smtp-Source: ABdhPJx9TOmMFujFnGVl8b6xHN1ndgoe2DniOY4IItI5ZmI4A+NR+uZ9Da7nqpkBConZUtEfqH+rIg==
X-Received: by 2002:a05:6402:11c6:b0:416:3751:d700 with SMTP id j6-20020a05640211c600b004163751d700mr5866245edw.97.1646938446827;
        Thu, 10 Mar 2022 10:54:06 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935aa6.dip0.t-ipconnect.de. [87.147.90.166])
        by smtp.gmail.com with ESMTPSA id q2-20020a170906144200b006ceb8723de9sm2047740ejc.120.2022.03.10.10.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 10:54:06 -0800 (PST)
Date: Thu, 10 Mar 2022 19:54:02 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] staging: vt6656: Remove unused 5GHz support
Message-ID: <cover.1646935331.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

vt6655 (PCI) and vt6656 (USB) do only support 2.4GHz band and not 5GHz band.
Both drivers do allow only one vendor id and device id.
So no other devices are covered by those drivers.
Because of this the following priv->rf_type cannot occure:
RF_AIROHA7230
RF_VT3342A0

---
Tested with vt6656 on mini PCIe card (connected over USB)
which is using rf_type: RF_VT3226D0 (2.4GHz only)
Tested with vt6656 as USB Plugin Module
which is using rf_type: RF_AL2230S (2.4GHz only)
In order to combine vt665x infrastructure it is important
that vt6655 is also not using this code. (Patch already provided)
vt6655 on mini PCI Module is using
rf_type: RF_AIROHA (2.4GHz only)

Philipp Hortmann (5):
  staging: vt6656: Remove unused rf_type in channel.c
  staging: vt6656: Remove unused rf_type in baseband.c
  staging: vt6656: Remove unused rf_type in rf.c; top level
  staging: vt6656: Remove unused rf_type in rf.c; unused variables
  staging: vt6656: Remove unused rf_type in card.c

 drivers/staging/vt6656/baseband.c |  16 +-
 drivers/staging/vt6656/card.c     |  16 --
 drivers/staging/vt6656/channel.c  |  96 +------
 drivers/staging/vt6656/rf.c       | 413 +-----------------------------
 4 files changed, 10 insertions(+), 531 deletions(-)

-- 
2.25.1

