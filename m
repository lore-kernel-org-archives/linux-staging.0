Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A893FC8
	for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 21:00:29 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id x7so26136575edd.6
        for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 14:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+RhLarViYwGGbP25CxUD/jDy/s2t/4w9AZqg5EOT7Hw=;
        b=NagVNupFxjAvxPWCK33utYcdQ0e3WD1NklqnaifczqAPmuXMZ6QTLA2kNFnDRQwjZA
         jh84b+iNxTu/1UQ3xoeUVOtWIrs8cOrT+f/BSJDjgvffbyaOIp4zrAbaCkHd+nCiF4Q2
         5i/DCKk4vRPH7WAny2dwIOZNPURQHm4cNelzOceVqjWfnAUnL5vzvTYkZQ/aRDH8Ny5t
         lJQo3moA8T4fV2m2+a2Mv6yak9t/9Am8/+MdSBV1o6aKMtDAJCfgcAswHVV3JESHA3Da
         87bdpluMScl6wIiffbME7ubd6vlv2wyQdUxL981CqyxCZZSjIvc52onhnCfsC7Kwfnuz
         8WcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+RhLarViYwGGbP25CxUD/jDy/s2t/4w9AZqg5EOT7Hw=;
        b=DaxW3DUbtuGyawh+fQC7Py5MSqkHinHMtZTvUjTnA1SYq6ZnxJqgQeE6iq0MVycVNs
         2yjBQIiHrxJeuS097Y6jIposqOqc+JJDWoNIvRK79xKfX23A8FBbGznef7VtIj5O4ynm
         3RWyg8rWiFk/zaz27f/zXopm06w25UBziz+iDiVw5x9o4MwC2d+AKVOOQ8v6MvMgZ7ax
         +KxooACwaUkbpiFVAbkq/vdFOMIBoxy38uoDX9y51a+bQvCJ5jOKG6nUiIxW9MmL7v0Z
         6t3Zp9F/V7NghYbSbmpRH1Upi0bH5pV9JSxGcphmFGnkVFOzNXUVdHDgguURT8ttOrDC
         XsNA==
X-Gm-Message-State: AOAM533xxbZ7zJTSNHg0nua9Wm8agPlje2cfCVuHdyNJDeZfYy7uIwyA
	qPlqzjT4SqtGwZi3TiJ1Dig=
X-Google-Smtp-Source: ABdhPJx+cFJl5Z33gdtZEAKeibcSlrJqDnX3STossivb/eeRq5b7EAJVrjCST1fDkS7LxenJ2oYcQQ==
X-Received: by 2002:a05:6402:c8b:: with SMTP id cm11mr7484866edb.368.1632517227567;
        Fri, 24 Sep 2021 14:00:27 -0700 (PDT)
Received: from tom-desktop.station (net-93-71-218-228.cust.vodafonedsl.it. [93.71.218.228])
        by smtp.gmail.com with ESMTPSA id 11sm5456109ejw.50.2021.09.24.14.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 14:00:26 -0700 (PDT)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: tomm.merciai@gmail.com,
	Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Madhumitha Prabakaran <madhumithabiw@gmail.com>,
	Yujia Qiao <rapiz@foxmail.com>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	=?UTF-8?q?Aldas=20Tara=C5=A1kevi=C4=8Dius?= <aldas60@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Deepak R Varma <mh12gx2825@gmail.com>,
	Marcos Antonio de Jesus Filho <mdejesusfilho@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] staging: vt6655: replace camel case variables
Date: Fri, 24 Sep 2021 22:59:59 +0200
Message-Id: <20210924210008.106355-1-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bShortSlotTime -> b_short_slot_time
ldBmThreshold -> ld_bm_threshold
PortOffset -> port_offset

Tommaso Merciai (3):
  staging: vt6655: replace camel case b_short_slot_time instead of
    bShortSlotTime.
  staging: vt6655: replace camel case ld_bm_threshold instead of
    ldBmThreshold.
  staging: vt6655: replace camel case port_offset instead of PortOffset.

 drivers/staging/vt6655/baseband.c    |  58 +++++------
 drivers/staging/vt6655/card.c        |  90 ++++++++--------
 drivers/staging/vt6655/channel.c     |  10 +-
 drivers/staging/vt6655/device.h      |   6 +-
 drivers/staging/vt6655/device_main.c | 150 +++++++++++++--------------
 drivers/staging/vt6655/mac.c         |  46 ++++----
 drivers/staging/vt6655/power.c       |  24 ++---
 drivers/staging/vt6655/rf.c          |  12 +--
 drivers/staging/vt6655/rxtx.c        |  12 +--
 9 files changed, 204 insertions(+), 204 deletions(-)

-- 
2.25.1

