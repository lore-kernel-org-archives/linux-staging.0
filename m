Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F0617D3
	for <linux-staging@lists.linux.dev>; Tue,  5 Apr 2022 10:49:26 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id p15so25809835ejc.7
        for <linux-staging@lists.linux.dev>; Tue, 05 Apr 2022 03:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7577hiEEV60XWnU+gm9ig1vjqa65ibu1AZU+K7+N5IQ=;
        b=E+cn+nYJ0eiXQPg7n4oHQaZOzpWn0DzsXu6Eyo8UPMxYDv6mVqQAQ7PPnro/TdPijA
         FB1YZYILpwko9Q603p48/DJrOPcBcCeYTQ1UrV8uvnGf8Qucx/2jh63VT2P/ouJudb3I
         I8mXgcTc9T0+Cm5E8ug6Kwn5INkDW2q1bP93Qvigi9QClBrc7nDrxhKPVKQtZVUZWEiB
         P4yLWkpWOfLcwXk+dj6s8iIJf+D/mY31Y7nQaFBefs/LxtcstHiq13dkfdiaEo8NAIeL
         9P87QqFuF8mH9xpKuQ0yql9arUlaCMOPWvOKgYhpyVaooeRb8dp5W0Sw6RKNYr655mz6
         DfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7577hiEEV60XWnU+gm9ig1vjqa65ibu1AZU+K7+N5IQ=;
        b=tsOjtBmmOli1bA7TSuaD6nrBt+8sUgeflEW+6rXl4SD6gY/EdqHOtes0hbNkYc6Yja
         TEzyogItWzdbwnO8ZpW0gmjzdLJFKmijmog4gFvAZeizjzevJNCyayEuF1QSqLnzkHME
         Xlk4VLHQ9ah8Eo9f85sAy757LRQUVtqB40GVf0vTCuZRChMlVfhIMVpOYCjj3v9ljlY9
         +6+6wc2omO7WDKBEE44Zcc7ToZQhjyDA4UTu8URBFtM2qJJDT3ZGSUvKlWLJLK08/LRr
         920UbO1C+Eh2X4YV0/vgYwKUrRCshGwCTx9Ro8oZEQR2RpOaLZHTgzOoCGxyuIHEDbnJ
         S6RA==
X-Gm-Message-State: AOAM532kqEjQmxUr8v9y0Tv0IwSVyGRCcpM9kh+7v24r711ZPqFpUst5
	gDgvyp6W1ExY0S5JqZw2/c0=
X-Google-Smtp-Source: ABdhPJzlWvczrjaKZjKGrm8PwiUl7ri7bCRqBl55s3ADRN2o7JLvUjYq6wkv+QrsdJTIEZtmGbh2Qw==
X-Received: by 2002:a17:906:9b8f:b0:6db:ab62:4713 with SMTP id dd15-20020a1709069b8f00b006dbab624713mr2905921ejc.738.1649155765362;
        Tue, 05 Apr 2022 03:49:25 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id j12-20020a50e0cc000000b0041cd813ac01sm2436702edl.28.2022.04.05.03.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 03:49:24 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 0/4] staging: r8188eu: remove GetHalDefVar8188EUsb()
Date: Tue,  5 Apr 2022 12:49:06 +0200
Message-Id: <20220405104910.9769-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes the function GetHalDefVar8188EUsb(). This is part
of the ongoing effort to get rid of the unwanted hal layer.

Tested on x86_64 with Inter-Tech DMG-02.

v2:
- remove dead code first
- use better function names
- make one function static

Michael Straube (4):
  staging: r8188eu: cur_ant is set but never used
  staging: r8188eu: remove HAL_DEF_IS_SUPPORT_ANT_DIV
  staging: r8188eu: remove HAL_DEF_CURRENT_ANTENNA
  staging: r8188eu: remove GetHalDefVar8188EUsb()

 drivers/staging/r8188eu/core/rtw_cmd.c       | 11 ++++++++---
 drivers/staging/r8188eu/core/rtw_mlme.c      | 19 ++++++++++---------
 drivers/staging/r8188eu/core/rtw_mlme_ext.c  |  2 +-
 drivers/staging/r8188eu/hal/usb_halinit.c    | 20 --------------------
 drivers/staging/r8188eu/include/hal_intf.h   |  3 ---
 drivers/staging/r8188eu/include/rtw_mlme.h   |  2 ++
 drivers/staging/r8188eu/os_dep/ioctl_linux.c |  8 +-------
 7 files changed, 22 insertions(+), 43 deletions(-)

-- 
2.35.1

