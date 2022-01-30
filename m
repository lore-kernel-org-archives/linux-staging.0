Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0DF2C80
	for <linux-staging@lists.linux.dev>; Sun, 30 Jan 2022 19:03:35 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id d10so36046288eje.10
        for <linux-staging@lists.linux.dev>; Sun, 30 Jan 2022 11:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sY7P/t1AUJsEIOGpEH9jaDzmKFiJT+OmhoPSXZS+aIU=;
        b=KVgyFQYvaCRMG8doNu5bpdNayOmMOVW9c5lDnOPnN+8l5VCOJ5iGipAdwjLMmkrjcc
         JowLuzdEuCzMedpD58bdrhcczDKcZqi2FKpjxaXjjQ+gpFifMvxRof39272dM63rRDpC
         Sep+T/f57kqrf9n00LULD6w6Pafd4U7OlJxSDXDCd2JSWjnUTF2lpHe80eOKt1sbiELQ
         G2GifrF/8LpNYkgUccs2tVwR3AkxRxdbHXSn5wW99y8jMhLlotWplzHpZIMrldH5hJcW
         YWjHeUvfcFGFhSvFs29+/3YUydmS8bv9gNPeReSb6IC9QcbiqiJnt0hv2Tyj7Y5tmBy8
         yaFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sY7P/t1AUJsEIOGpEH9jaDzmKFiJT+OmhoPSXZS+aIU=;
        b=UcIUCCsr30pKpEpnCJb8tv1i5W92CjvEkFfnOGx38WSQcLJRSwGErofWqiuKKfbn1E
         h2lBUSLfdQrb8eGi+zQO2nPbKoPhb1kMr5HBsbF4X+sxxpNAJkGGJ4ISE8PmDZcLfZw+
         BbZWACfTWskqXPThxVryYqNmbr5L/KI7ArMzkXXVCFaayrGUDmVwmYLx5QvGGieN6hDF
         m0+SNIIO61Y0KYTEZxmbcnhblPHrs62cUQ5tKh/GHJxpb2Ouf3nA39NuJLWEgmV//J2x
         MUMeDfxciSQ9lNL5lQaBxJX9Ntn/n+tXb4L48Oq61wefhWxhDQPQ6MEu3Xj3CZyg/b3A
         PMbg==
X-Gm-Message-State: AOAM532M9VSOibrtN0azbLlNzXT1Py1HT3VjWqVPeD39cJIdXQpwlWLw
	XgMw4ULBaEdqhqp94+hVaCY=
X-Google-Smtp-Source: ABdhPJy80yJCavGANxQUw1B/AB5X3t8dzuJoZKNdwdH6uhYKbCE/WBKO1flQ8Fn3z3MgtvB16bgPRQ==
X-Received: by 2002:a17:907:7d8e:: with SMTP id oz14mr6463555ejc.764.1643569414130;
        Sun, 30 Jan 2022 11:03:34 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb5a.dynamic.kabel-deutschland.de. [95.90.187.90])
        by smtp.gmail.com with ESMTPSA id n3sm921124ejr.6.2022.01.30.11.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 11:03:33 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 00/12] staging: r8188eu: remove some HW variables
Date: Sun, 30 Jan 2022 20:03:09 +0100
Message-Id: <20220130190321.7172-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes some cases from SetHwReg8188EU() and replaces
the usages with calling the according code directly. In most cases
calls to rtw_write/rtw_read.

Tested on x86_64 with Inter-Tech DMG-02.

Please apply this series on top of the series
"staging: r8188eu: remove two wrappers"

Thanks,
Michael

Michael Straube (12):
  staging: r8188eu: remove HW_VAR_BEACON_INTERVAL
  staging: r8188eu: remove HW_VAR_SEC_CFG
  staging: r8188eu: remove HW_VAR_CAM_INVALID_ALL
  staging: r8188eu: remove HW_VAR_AC_PARAM_VO
  staging: r8188eu: remove HW_VAR_AC_PARAM_VI
  staging: r8188eu: remove HW_VAR_AC_PARAM_BK
  staging: r8188eu: remove HW_VAR_MEDIA_STATUS
  staging: r8188eu: merge Set_NETYPE0_MSR() and Set_MSR()
  staging: r8188eu: remove HW_VAR_CAM_WRITE
  staging: r8188eu: remove HW_VAR_BCN_FUNC
  staging: r8188eu: remove HW_VAR_CHECK_BSSID
  staging: r8188eu: remove HW_VAR_CAM_EMPTY_ENTRY

 drivers/staging/r8188eu/core/rtw_mlme_ext.c  | 15 ++--
 drivers/staging/r8188eu/core/rtw_wlan_util.c | 24 +++---
 drivers/staging/r8188eu/hal/usb_halinit.c    | 88 --------------------
 drivers/staging/r8188eu/include/hal_intf.h   | 11 ---
 4 files changed, 18 insertions(+), 120 deletions(-)

-- 
2.34.1

