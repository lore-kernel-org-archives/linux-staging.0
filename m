Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CB5A50
	for <linux-staging@lists.linux.dev>; Tue, 25 Oct 2022 09:12:44 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id t25so5336971ejb.8
        for <linux-staging@lists.linux.dev>; Tue, 25 Oct 2022 02:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NQGDjtnhvoIMjGlIIUPotnqzX5/+w+VwLHCabOPt+h8=;
        b=EzbDPXnXK+fRRH4bvsRuiyseGP+b7xX1aDuyWi8OlTpBv32jAiLDS0is9eE/zXawOK
         bIquBaSQdNVvot913dxq7RV6IQrvsKiWSVFoie10QkksEUvBRej1YClwTLd03VazDBrh
         8IP/pa7qIrdCrUfKLT8D9EsB0DD0oTVO4eE3T/FOqnlUBy8Dmt2E5pmcInRd49AIZ9w7
         9ZoHmVSBr+90etxEvyz9TjGryVNMGVjtNJU//Ev2JLShMXLf7iCE/4u90f+CjnjxXdwM
         0qb1d33OkfPnyZpgOjvjXQNx1R/jouHoD0X5PS5N52AI3JnhicRHHC+mFopw/4aPOxvu
         yXGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NQGDjtnhvoIMjGlIIUPotnqzX5/+w+VwLHCabOPt+h8=;
        b=lKZdcinHl8yyZNvkc5Xw4Ca14ZrWP5xkRtbBUw0lz9bPdkZCjI74jTtnsCrQsP++UF
         m5hLJ3EvMZVQi1dVYeNrduNUYILtM50SCFNVgKaTBldn4RAyC4ZjxRcQA7tg/AGB7Avh
         M3ntaO0cIbjH7DEz+UuaTe1p5yjxyhqfGP3g8ABiSqQGgSZ0dHx+1Zv+tU6dpPvIF8f1
         MnRJCl/B53TjBeYbQF6kTJP6GvA68mA6xY/r8N+7maEcy5bmu1IBpq3vI2sql/W/qpar
         drb/KdvE4SI/YivGhfYArdc1aj4gFlVMSjhLmZGGRzfiOOxu40D7/4MGxfYLmT2sTL9U
         ni1w==
X-Gm-Message-State: ACrzQf3oPSlGMGYfbT6S6/o+Vy1E25Lf76IP+7coeWHp0GGyoUqVPBnL
	P+IJuugMfaglacaijK4t/4bFhlawIXQ=
X-Google-Smtp-Source: AMsMyM5HqZVdcFc6lJMbR+B8ftG+TpzsZZov4wzeYEgMYSHw2FPPCUqDAU/ksJgFlOWRh6bgwDXYgA==
X-Received: by 2002:a17:907:a40d:b0:78d:9f66:e51f with SMTP id sg13-20020a170907a40d00b0078d9f66e51fmr32425502ejc.654.1666689162453;
        Tue, 25 Oct 2022 02:12:42 -0700 (PDT)
Received: from localhost.localdomain (ip-217-105-46-178.ip.prioritytelecom.net. [217.105.46.178])
        by smtp.gmail.com with ESMTPSA id bo12-20020a170906d04c00b00780f24b797dsm1061953ejb.108.2022.10.25.02.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 02:12:41 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: namcaov@gmail.com,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] staging: rtl8712: clean up dynamic memory management
Date: Tue, 25 Oct 2022 11:12:22 +0200
Message-Id: <cover.1666688642.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver is fine if memory allocation never fails. However it does not
handle allocation failure well. This can either lead to memory leak, or
unallocated buffers being used.

v2: Add a missing if statement, as noticed by Dan Carpenter

Nam Cao (4):
  Revert "staging: r8712u: Tracking kmemleak false positives."
  staging: rtl8712: check for alloc fail in _r8712_init_recv_priv()
  staging: rtl8712: check for return value of _r8712_init_xmit_priv()
  staging: rtl8712: fix potential memory leak

 drivers/staging/rtl8712/os_intfs.c     | 27 +++++++++++++++++++++-----
 drivers/staging/rtl8712/recv_osdep.h   |  8 ++++----
 drivers/staging/rtl8712/rtl8712_recv.c |  7 ++++---
 drivers/staging/rtl8712/rtl871x_recv.c | 16 ++++++++-------
 4 files changed, 39 insertions(+), 19 deletions(-)

-- 
2.25.1

