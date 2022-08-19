Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AAB290C
	for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 12:54:40 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id qn6so8601008ejc.11
        for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 05:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=KfYI7x2n+dPKcoeo3/p/jfkeVeouaOocnFlGHnujIGM=;
        b=nT+J9Cm3+lhdZyTLLhnF7i0ChpfUMDU0Vj00UzYd/cu7MAysd6CbxuwWV/jvxXWFI7
         HDnwi08l5SeKOx+XfAHNnm4R3IcsXIKOSgEYQ2xMNxve2ss6RoxwjrqQhRmthEmhS5VN
         i6tV2sVxzWiXbDTOcJjoF2vqWHvwEFW+pkt3RLk3courf6FHbx6oEI9y3deb7sNRZ+c4
         heN8ck+artU7oEGC/2Eduxf0pen/2nz+qno6vUBYM0CL8u+o2sC/JZSTL74KQ26WVeMP
         W16baG7roQJZ6lkOQ1AciQwtMKR1vgPkcXFiwPwZ77tiPt81p8P+KqQKw3tpl5gpcSOa
         afzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=KfYI7x2n+dPKcoeo3/p/jfkeVeouaOocnFlGHnujIGM=;
        b=5GU5lgXPYMvTUvIb2XKQoa9mS6Niux+ofYVZ32Lo83ogBYgZypmel652WKJlHRzFIF
         ru4D3pjFIvKo+A7HKsQ/f3TAuTWucwjCzHlEfH0NOiQhw9oTNGntM/kNEqyu/MHYcozu
         4lk8o919hdY0NsKB3Rn8DshMOTsqS0t8rgkBGCXYgKIcO0uL4RTaptUEyoXIHxC8KV/H
         I+90tA4RihmZpY0uKH+eLGEWXaUHRkcGKf5N3+RzXN/7EAFRR6hsOjb5hOsXBPr85NcX
         Oa+3/1lXHL64p0f8m8T5GpH+RUjIWJbq9YgkxZgQ3Ow3Cg11R0BIc+Zu+wnYidQhw5KC
         0srQ==
X-Gm-Message-State: ACgBeo0vCpa0Rd8Nq3NdFZL+quH7dUoW0kaiE7e23vdoWyruN/wNyAoq
	K5V69vpij+VS476tUtik1a/9QQVRLjM=
X-Google-Smtp-Source: AA6agR5C2Q0KBcn5O4IPpfiZF6PU4jcqfp3pKwnZJV2CMTwJf9pk+4iflwiOsNPZCXrgNpSlUV8qWg==
X-Received: by 2002:a17:907:6092:b0:731:59f0:49ac with SMTP id ht18-20020a170907609200b0073159f049acmr4763632ejc.383.1660913679217;
        Fri, 19 Aug 2022 05:54:39 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb77.dynamic.kabel-deutschland.de. [95.90.187.119])
        by smtp.gmail.com with ESMTPSA id b12-20020a056402138c00b0043d6ece495asm3000955edv.55.2022.08.19.05.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 05:54:38 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 00/11] staging: r8188eu: start migrating mlme_linux.c
Date: Fri, 19 Aug 2022 14:54:17 +0200
Message-Id: <20220819125428.8412-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series starts to migrate the functions, or their functionalitiy,
from os_dep/mlme_linux.c to the core/* part of the driver. The goal is
to remove os_dep/mlme_linux.c at some point.

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (11):
  staging: r8188eu: make init_mlme_ext_timer() static
  staging: r8188eu: make init_addba_retry_timer() static
  staging: r8188eu: make rtw_indicate_sta_disassoc_event() static
  staging: r8188eu: move rtw_indicate_sta_assoc_event() to rtw_ap.c
  staging: r8188eu: make rtw_report_sec_ie() static
  staging: r8188eu: remove unneeded initializations
  staging: r8188eu: make rtw_reset_securitypriv() static
  staging: r8188eu: merge rtw_{os,}_indicate_disconnect()
  staging: r8188eu: merge rtw_{os,}_indicate_connect()
  staging: r8188eu: merge rtw_{os,}_indicate_scan_done()
  staging: r8188eu: remove unused function parameter

 drivers/staging/r8188eu/core/rtw_ap.c         |  42 +++++
 drivers/staging/r8188eu/core/rtw_mlme.c       |  86 ++++++++-
 drivers/staging/r8188eu/core/rtw_mlme_ext.c   |  22 +++
 drivers/staging/r8188eu/core/rtw_sta_mgt.c    |  12 ++
 drivers/staging/r8188eu/include/mlme_osdep.h  |   5 -
 drivers/staging/r8188eu/include/rtw_ap.h      |   2 -
 drivers/staging/r8188eu/include/rtw_mlme.h    |   2 +-
 .../staging/r8188eu/include/rtw_mlme_ext.h    |   2 -
 drivers/staging/r8188eu/os_dep/mlme_linux.c   | 166 ------------------
 drivers/staging/r8188eu/os_dep/usb_intf.c     |   2 +-
 10 files changed, 159 insertions(+), 182 deletions(-)

-- 
2.37.1

