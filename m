Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4B42564
	for <linux-staging@lists.linux.dev>; Thu,  7 Apr 2022 12:57:49 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id p23so6284904edi.8
        for <linux-staging@lists.linux.dev>; Thu, 07 Apr 2022 05:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hcoCrifVh3jGcgC0QHKBTVRExy/JJ4Or1ScZya4YOn8=;
        b=kWtO1BI99Fv7NjLqkGRW5l4rJTmet9h0vqKsFtk1q/jY10kDxbMHO0oa+mY6oBknIg
         P+yUhK5IiUrxPTHu2cTmEUNZK5h1vKusvNDoylIl8AJ8MpjklAOGwW0YKb2oKeCdNZ7U
         6kzmgkWn3HIs9X1VLheGJ+Hu2flmD1vWuDYVCb1pZOdWI42/Df4TRaLapYGWJ/jMtChv
         bxu/mVAg9rOMsDzmPN5dh3cN1SatPZxO1FtfFJTGRo2bjgkF3vz3i/GM7rzJF6DBSXl5
         fY73Y5YigZrC/Nile9exusXUgpEHyOei7cbsLOHmd1Iyv5Mr8clNtvq8LL/8+0JXWHTX
         k2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hcoCrifVh3jGcgC0QHKBTVRExy/JJ4Or1ScZya4YOn8=;
        b=OW50JTttMHGMkKc/CeLZJ0JQhtAHCAU67/70bEVMAo+qsjuf/ANGqQRb0cbZQKHgxm
         tMJ9tL+0QqdRAsRfSygAEu9kF3VKAN5XNVjY48II4sZReIXuAjKBm471gsFyAgEJI5hy
         70RR/ZsjZiFpGp/ljLYbIPMibVrvht2CJUmhcPxsgQbzbD6qUyE+pSnoU9JGjTYcms1c
         dUJbw0jObra0EqJLGjYZ6uZQ2AODXc6Nhd1wKXL927gWyZfrbI33ZgJMT2jgHfU0AH1C
         OXa1xduXRNY6ye3IimEg8xFl5neApdGdxRcqEDRXakgS7rM2Fo8T35mTYZpBbv2rJ68R
         o5sQ==
X-Gm-Message-State: AOAM530UpBLdrrwgLlmJcsON/Mubb4pI+zOsN47Ar903ZyZKy/JfLNc+
	S2kJsgiQ+goPiGoDYP2vlvU=
X-Google-Smtp-Source: ABdhPJwrM3Jn6ZZx/kiPxaG6xqSXaPGp88T+W/Y+xl2nga11i+VTsOxQJF1VX9yj1LafADPzb+Zxaw==
X-Received: by 2002:a05:6402:1a33:b0:41c:bfc1:957c with SMTP id be19-20020a0564021a3300b0041cbfc1957cmr14007296edb.354.1649336267756;
        Thu, 07 Apr 2022 05:57:47 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id n13-20020a170906724d00b006cedd6d7e24sm7676764ejk.119.2022.04.07.05.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 05:57:47 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 0/5] staging: r8188eu: use round_up()
Date: Thu,  7 Apr 2022 14:57:37 +0200
Message-Id: <20220407125742.7814-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series converts the driver to use the in-kernel round_up()
and PTR_ALIGN() instead of custom _RND* implementations.

Tested on x86_64 with Inter-Tech DMG-02.

v3:
just remove _RND8 in one case

v2:
use PTR_ALIGN in patch 1/5

Michael Straube (5):
  staging: r8188eu: use PTR_ALIGN() instead of RND4()
  staging: r8188eu: use round_up() instead of _RND4()
  staging: r8188eu: use round_up() instead of _RND8()
  staging: r8188eu: use round_up() instead of _RND128()
  staging: r8188eu: remove unused _RND* from osdep_service.h

 drivers/staging/r8188eu/core/rtw_cmd.c        |  2 +-
 drivers/staging/r8188eu/core/rtw_security.c   |  6 +--
 drivers/staging/r8188eu/core/rtw_xmit.c       |  7 +--
 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c  |  8 ++--
 drivers/staging/r8188eu/hal/usb_ops_linux.c   |  2 +-
 .../staging/r8188eu/include/osdep_service.h   | 43 -------------------
 6 files changed, 11 insertions(+), 57 deletions(-)

-- 
2.35.1

