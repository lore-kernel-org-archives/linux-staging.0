Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9427C7487
	for <linux-staging@lists.linux.dev>; Tue, 25 Oct 2022 17:06:39 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id f9so7679515pgj.2
        for <linux-staging@lists.linux.dev>; Tue, 25 Oct 2022 10:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XRzwwEYr1S7EW5RlrN/bWb7MyYz9P2Ts/CC2UmzcrOs=;
        b=FSs99EDGOuesHAY4a9DEC5iuDnsa85TuPZA0tg6DDGLPwDCp8IAlVQt4tvwcC2+Rqu
         mI11UcquR62mNNgsWXRyFAyeNIe2iCLN6W7fvBg1Ea5OAGk+hWi+z5/CNoF+eT4sH8MO
         doQvigf1cjE/NpwcuffvE3uiHHLYtbPpUhmuOm4ilkSfGaLlOKBB+45kle+5G4+cUc2k
         8fSVTBfBxzYvw26NzBat6w6sBpGVFN6dD8rqkARWXIOurxJMXFYEw1HFGFzAO9pWK5kE
         XvJK/ejxQpO5XV0qyr4M9P1ZzhdFlgf1zw6OC77snPnyiTjz+3D9pvaREl2wYJ4DGuPI
         5gLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XRzwwEYr1S7EW5RlrN/bWb7MyYz9P2Ts/CC2UmzcrOs=;
        b=A3qPnbLSv4vyScP3IM/skzeubPpoy29rLtcVD2kYKtE0MHR0XvdOC7vXN65SwGceh9
         IIbS0ywp+ATNkGE7igK+aD8wySZRnnXPLNWni4nalbCRM/+kQ3uoX93toj1sOYvtha6d
         t4N4/D0UgUkvwO2IWX1C036Ig9Dhf2brnTH3id4bbWUoAujL673vNIRv9RVY6mhCFUq/
         j8zAi9DmlzAuOdH5KFokE96P8nxdFxk3LS8MvBqV9sehMnKA+OzuXGTe/rAh8FNcD9iu
         XvC5TTMriuddw6PgAPq+1zsOISJEn/atwwXEafe6Fu7DkF0Wu5heiP91p1HQNctD2I5/
         3JEA==
X-Gm-Message-State: ACrzQf0qfkNPnM3JpBynrjiHK2OI8V+xDAxgPWMevxJb6BMj7IHlqXhi
	0cwZc3mR0PunmGvm+knrYw7Xe/DJsOD/6mF+
X-Google-Smtp-Source: AMsMyM60iUi46jpRYtCN4RT6IdXEcQW+8/RTkXUZDMud+qf+ZECZVoDWRaunNxSig7SaDzbkqejSQw==
X-Received: by 2002:a17:903:40d1:b0:17f:4e94:b747 with SMTP id t17-20020a17090340d100b0017f4e94b747mr38191278pld.44.1666717588190;
        Tue, 25 Oct 2022 10:06:28 -0700 (PDT)
Received: from uftrace.. ([14.5.161.231])
        by smtp.gmail.com with ESMTPSA id a1-20020aa794a1000000b0056bcf0dd175sm1592373pfl.215.2022.10.25.10.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 10:06:27 -0700 (PDT)
From: Kang Minchul <tegongkang@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kang Minchul <tegongkang@gmail.com>
Subject: [PATCH v3 0/4] staging: r8188eu: cleaning up unused variables
Date: Wed, 26 Oct 2022 02:06:17 +0900
Message-Id: <20221025170621.271903-1-tegongkang@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series cleans up unused variables in r8188eu
causing coccicheck warnings. 

Difference between this patch and previous patch is that this patch series
include making function rtw_sta_flush in r8188eu/core/rtw_ap.c
into void function.

Kang Minchul (4):
  staging: r8188eu: remove unnecessary variable in ioctl_linux
  staging: r8188eu: remove unnecessary vaiable in rtw_recv
  staging: r8188eu: remove unnecessary variable in rtl8188eu_xmit
  staging: r8188eu: make rtw_sta_flush to void

 drivers/staging/r8188eu/core/rtw_ap.c        | 7 ++-----
 drivers/staging/r8188eu/core/rtw_recv.c      | 3 +--
 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c | 3 +--
 drivers/staging/r8188eu/include/rtw_ap.h     | 2 +-
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 4 +---
 5 files changed, 6 insertions(+), 13 deletions(-)

-- 
2.34.1

