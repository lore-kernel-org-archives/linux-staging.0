Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F6E17F3
	for <linux-staging@lists.linux.dev>; Fri, 15 Jul 2022 06:29:17 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id sz17so7245125ejc.9
        for <linux-staging@lists.linux.dev>; Thu, 14 Jul 2022 23:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gHgYQ57up5w2WHv1hYXHN8IBevAz2rN/LxpGnpqYmU4=;
        b=JI4Kgbgo0bQEvLMje6miGiraUoMac1F9ZoiQJ+JuxaDGse+xEfEKQC5DwcveHzTwnT
         oGcnGu9eUy687ISvDbxv5cB67LpDgH2Qg3LtelVfDEFIWMbkpfg40nVgPP+EjSHiqRpF
         fJH29ek18VNzPmjs2332lWP+IPY3UDd2C9DUpp0s02cy8rNhpVj59Gi7rg1T/l0Wmtl9
         hxb43UTFeSsOa+11pTOkzZ3VphowX6UvUEpKCJ+YvY07Df5Mvl2UpNUmH/DaeMFzJpAE
         GTE5pP7+FZAcIfTn/CYqOCuSr729sf9Evt9jHxdIy6D8DoSD8FI/IraOO7xKatADNHx9
         WDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gHgYQ57up5w2WHv1hYXHN8IBevAz2rN/LxpGnpqYmU4=;
        b=4BJGzSMUqKj3bvpYG7IhNXljF2OCCT2gNcSIFzmqVc3i8S0cHCLWVZeOZNF4E8BKDs
         3YVq36RCONeFMVJ6q0Itmr/uQ8XL860tbHUHek4VPHKEhpjlK+XlZ69V/lEtiOvq1Gxg
         jfNYCsRsgMbAjtZUwXqc6Z9qIqX+4WK5d2UpnW9ZMhAZaQPR69UHUwcjbGRtiQmM1AgU
         /4zvmuggnKC9HqBFr8e2HYBILnOIdBjrfyStLpwnDh+i2imn8qKGd9uA814OiEAgNPXD
         XW0HgYxVxIjSCDCmXHzcwMKskUffZk/vuMFJK+C+iQK1QoCaOqoZsmYlvjEtcYGReWOe
         XHjQ==
X-Gm-Message-State: AJIora81WTXe0AuiaxOh8KPEXFU+DxvTqYYFVHZrGu00Iex+Vo011p4b
	MG2eRe0xWEuzqqagHjt+Fcc=
X-Google-Smtp-Source: AGRyM1uVsVPDS5mdTshIbzATliAzNcoW6hnqrk/t1m2yBgyfDc8D7QsW90IY2yCwRuxcJbnwwSDqrQ==
X-Received: by 2002:a17:907:9810:b0:722:f204:b409 with SMTP id ji16-20020a170907981000b00722f204b409mr12069875ejc.457.1657866555422;
        Thu, 14 Jul 2022 23:29:15 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb91.dynamic.kabel-deutschland.de. [95.90.187.145])
        by smtp.gmail.com with ESMTPSA id ku5-20020a170907788500b007262a5e2204sm1614515ejc.153.2022.07.14.23.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 23:29:15 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/5] staging: r8188eu: remove SetHwReg8188EU()
Date: Fri, 15 Jul 2022 08:29:03 +0200
Message-Id: <20220715062908.8547-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series finally removes SetHwReg8188EU().

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (5):
  staging: r8188eu: remove HW_VAR_SET_OPMODE from SetHwReg8188EU()
  staging: r8188eu: remove unused parameter from correct_TSF()
  staging: r8188eu: remove unused parameter from update_TSF()
  staging: r8188eu: make update_TSF() and correct_TSF() static
  staging: r8188eu: remove SetHwReg8188EU()

 drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 163 +++++++++++++++++-
 drivers/staging/r8188eu/core/rtw_wlan_util.c  |  20 ---
 drivers/staging/r8188eu/hal/usb_halinit.c     | 152 +---------------
 drivers/staging/r8188eu/include/hal_intf.h    |   7 -
 .../staging/r8188eu/include/rtw_mlme_ext.h    |   5 +-
 5 files changed, 161 insertions(+), 186 deletions(-)

-- 
2.37.0

