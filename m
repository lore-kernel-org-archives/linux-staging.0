Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8459470
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 16:30:02 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id u21so9570550ejo.13
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 09:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O3vu4JiCvawgkzQRTM733t0EmK6dXnhEuYP8MQmV/cQ=;
        b=XYaZinIjzm7bKXCZvWWYr4et4NaJwkj9zBf+7IkCaB+ak+bZUgBTWbU1CSkb8mX15s
         4+uczQ4jcSv3bXbFKUV4hbS+NQV4KiFQouIwJztvQ/FI6434CmaiQQ2v+CbsoewMm02x
         lyJPTnD8tDgygvzS/6eq3A9TTyxjL8j3wMYb8+XqZ3htIyjrOol+/mp/z8NuF2xK8TNA
         VUZskotMeznEZvvs82pDZHXzrPQ7YNkhcLtvRLQyYd5t5La8qwKF57V1bfjaX1c6A6mi
         HG5dIRYa6GNJiaILTS0FxGnu8mvbs9SHbwH5sTweGCPQlLMeerESEpkhoQfgwGLt4VKS
         PlrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O3vu4JiCvawgkzQRTM733t0EmK6dXnhEuYP8MQmV/cQ=;
        b=dbaAT0ctWzj2+WP8T5ag4sd3dJxXDa7NWTZCrrneau9HAsof5uq5EkaWJkbZeIfErr
         6OSXA6yQEhDgJZN0eUl37a5xWnm+h3hUzRZ6tQwbXITgoWZkPFp5J7kvZ+/VkqflXWlD
         QzOx81L4Sa2CLlISWhhUFJpCDmoevbSE897RUjsFNxyV0doCHMHnVdlJtUf9ClJEDsZg
         ZbH6rBqEF9g1tKtRgzjnaFw33q/5xxcHM5X+kjlVhVvLAEa3q012ZgXQ+z8gLtsfMlya
         jaqsFaUu3KIK/+5669YnoXc4cMREB6rXRBL7tkV3Fx7vc/kqCCJnmgfU4taGHRZ6AVnZ
         S5Zg==
X-Gm-Message-State: AOAM531yXFS72MmLH3yeIuxwuSyv11hZAQue3IC+tsgZfSN80+cPXqN2
	cmjSQvjWQmZp5sCIpdOQMfQ=
X-Google-Smtp-Source: ABdhPJxdZNxps2WOHBx4rLR7Gnoyvp1Go36M8pkbSwXXyld8P7FgvhWbVQgY9Mg9GZ5kqvaWqVG1fg==
X-Received: by 2002:a17:907:213a:: with SMTP id qo26mr16615247ejb.547.1617985801079;
        Fri, 09 Apr 2021 09:30:01 -0700 (PDT)
Received: from localhost.localdomain (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id mp36sm1415095ejc.48.2021.04.09.09.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 09:30:00 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>, outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [Outreachy kernel] [Patch 0/3]
Date: Fri, 09 Apr 2021 18:29:59 +0200
Message-ID: <6552860.D8CPca6BT0@localhost.localdomain>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

This patch series removes camelcases, changes the type and use of a 
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



