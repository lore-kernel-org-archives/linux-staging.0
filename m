Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B03970
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 16:39:34 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id r22so7258654edq.9
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 09:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MeVCMSWpDbGHYzheWdu+Y717xanF98ksnqPfJAYkw1M=;
        b=XPDFVuIxP0211a+q0DgzOzr7FRJbb7qGyrMux5F9IVWsm0zBRIB5GsMhp0ef5ACmfl
         fbfLIDbngewfHiVw3tEUza5NDpDRw7XB/p5OO9ZrnO9I2M549MUxjWwI8wH+YFTbiXY5
         AIxtid5ZQeU7iFjI70/WiIoaQHIxzrgqu2oP9DdnErUXTSQN2i3hUWqqrx2RqFQST4rq
         hb83RLjbL4HYCiMVyWI1GJILnonyvuoAWMUAAJhDLQP+Ad5BsojszOZVZkhD6Mkf2IYv
         8r99CSm6BBv7msF1uj9zEP7SHgpg0msw5uot1f3erCf13OIlcIg6y3HgEpsBzS/GlRiZ
         32Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MeVCMSWpDbGHYzheWdu+Y717xanF98ksnqPfJAYkw1M=;
        b=gm1etw6RkKoZfY6n7X8cOqI/9FiDMDYVjFTzy6gXuLWUz2MgkB37RShTXXIF1QGDKv
         TGTf0KZ/4ZEff+735X/2LTCgCif9QZK2eBKAzKTHcdb/F3arFmb8T9E9vfmlqoIrFWQq
         RtFujJwVzupwRT1nrSqjczqXd9yTvqJ0qQGPHh2jyaXqkUPH/++teCLmlXs5g88QNzPX
         9fMt81oXWpdd0vRoRXkwkq45JUR9HhV0BOTRFgk4beilRfRsChPUr8uxd3Za/6wcdgGZ
         MHh6Ucx1Gs+7mUCadMsdHT23we0psVpGlw3/exMfNvq+/sMOV5hHIjSinbqxKD+9oE5Y
         5jyA==
X-Gm-Message-State: AOAM533pN6ruMjwwXnvOqLbZ74ncEAaxiaRtWCN5w8vaDJxaCbK/VNfn
	CpGtc9fNKXuee1nDQ7o06fE=
X-Google-Smtp-Source: ABdhPJynu8aTlMARiTomzAzpoFC+mZi83vqf+MR6nXNS7W4lkctKXtEKEa3ahsE960GUsvT76fGbGA==
X-Received: by 2002:aa7:ca04:: with SMTP id y4mr8266748eds.72.1617986373012;
        Fri, 09 Apr 2021 09:39:33 -0700 (PDT)
Received: from localhost.localdomain (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id q2sm1474051eje.24.2021.04.09.09.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 09:39:32 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>, outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [Outreachy kernel] [Resend Patch 0/3] staging: rtl8723bs: Patchset for rtl8723bs
Date: Fri, 09 Apr 2021 18:39:31 +0200
Message-ID: <3311077.CXPNp9SFPB@localhost.localdomain>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

This patch series removes camelcase, changes the type and use of a 
variable, and correct misspelled words.

Patch 1/3: staging: rtl8723bs: Remove camelcase in several files

drivers/staging/rtl8723bs/core/rtw_cmd.c       |  2 +-
drivers/staging/rtl8723bs/core/rtw_mlme.c      |  2 +-
drivers/staging/rtl8723bs/core/rtw_pwrctrl.c   | 18 +++++++++---------
drivers/staging/rtl8723bs/hal/hal_intf.c       |  2 +-
drivers/staging/rtl8723bs/hal/rtl8723b_dm.c    |  6 +++---
.../staging/rtl8723bs/hal/rtl8723b_hal_init.c  |  2 +-
drivers/staging/rtl8723bs/hal/sdio_ops.c       | 14 +++++++-------
.../staging/rtl8723bs/include/rtw_pwrctrl.h    |  2 +-
8 files changed, 24 insertions(+), 24 deletions(-)

Patch 2/3: staging: rtl8723bs: Change the type and use of a variable

drivers/staging/rtl8723bs/hal/hal_intf.c        | 2 +-
 drivers/staging/rtl8723bs/include/rtw_pwrctrl.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

Patch 3/3: staging: rtl8723bs: include: Fix misspelled words in comments

.../rtl8723bs/include/Hal8192CPhyReg.h        |  8 ++---
 .../staging/rtl8723bs/include/basic_types.h   |  2 +-
 drivers/staging/rtl8723bs/include/drv_types.h |  2 +-
 drivers/staging/rtl8723bs/include/hal_com.h   |  2 +-
 .../staging/rtl8723bs/include/hal_com_reg.h   | 34 +++++++++----------
 drivers/staging/rtl8723bs/include/hal_data.h  |  2 +-
 .../staging/rtl8723bs/include/hal_pwr_seq.h   |  2 +-
 drivers/staging/rtl8723bs/include/rtw_cmd.h   |  6 ++--
 drivers/staging/rtl8723bs/include/rtw_mlme.h  | 18 +++++-----
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |  2 +-
 drivers/staging/rtl8723bs/include/rtw_mp.h    |  2 +-
 .../staging/rtl8723bs/include/rtw_pwrctrl.h   |  2 +-
 drivers/staging/rtl8723bs/include/rtw_recv.h  |  4 +--
 drivers/staging/rtl8723bs/include/rtw_xmit.h  |  2 +-
 drivers/staging/rtl8723bs/include/sta_info.h  |  2 +-
 drivers/staging/rtl8723bs/include/wifi.h      |  2 +-
 16 files changed, 46 insertions(+), 46 deletions(-)

Fabio M. De Francesco






