Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61BA258A
	for <linux-staging@lists.linux.dev>; Fri,  8 Apr 2022 16:38:35 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id l26so18455980ejx.1
        for <linux-staging@lists.linux.dev>; Fri, 08 Apr 2022 09:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vI6Hm9RSMRrV2TmLm8c0QGf/x0XfSnUFVHwkf1u/cYU=;
        b=BxrkPd3dEBKjVdg/dsd4TZyXGu4bqaDpOKVzfI804SgulnHfXNYBY6K7NbAEHMb0vQ
         1eqvWhPYQEPkX/bFkGuaNE49kkZDnrOWGXmXI97ojj33RS8N/kExB8+g0/atQNppiZin
         mRI1I6cvMxghA7Xfoe3KmNfvu+owZEXF1QIpuLhndsSiCmNtD+F8jvBeISSOHUO8w0m/
         cF27mqHuey7vl0Us7cXKvLxwlPi8nZZV59beh6e8vtzFch9t/h8bpoBa7OmqvyP9nVy6
         x6W+KlH4rIQewx5c7h4xTWgWqSkGXeIGeOqOKsTnvj1gKsIGyPfQN5sNge6d1LX426VH
         Kfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vI6Hm9RSMRrV2TmLm8c0QGf/x0XfSnUFVHwkf1u/cYU=;
        b=i9YGyRgbYAJrNEGKrJCDiCNk7F7kaI6XUtpjhXibLOyATaPTJaPokVT72bbvCVeoh6
         ETDvpm5qRxPRTcdeWmxnDbfVPfruPp//4DyX5ybGVBvPND5ek0CTAK1ObejxChKllLjN
         AskvcnrZ7XB5D3p7UBzz9k0O/Hjh/mpeURDGSxO8n9BFJF4jYdDWYZmRw3CzAUQ675kv
         qHf4e7HJ4O3R24zLa6OBTqtxVCztRHR7yNV2BCK37687cXPv31AYeRVqn7mDQB5YIGer
         15zZfd7/PRMCvf5Vl8fa7T1uIpLjFCazmJ/7s4QELpiPehnEz9p401kBWpZFCP6HBJJn
         haSQ==
X-Gm-Message-State: AOAM5311qxAC9WHYuUe6l0q18X4wJUrrh5qFGtHxiBqW/AC/n35r2U1M
	NdbddUuhMdg4ZHfn/AE3IEg=
X-Google-Smtp-Source: ABdhPJx6WFUNQdUb7zVq2jmr/Es7R3OD4JX6GnIevR9IaUsVo4aUGIiBTqGxDIDDQVgLJrCuLucckg==
X-Received: by 2002:a17:906:c149:b0:6df:f047:1698 with SMTP id dp9-20020a170906c14900b006dff0471698mr19247907ejc.16.1649435914282;
        Fri, 08 Apr 2022 09:38:34 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id 22-20020a17090600d600b006dfbc46efabsm8899314eji.126.2022.04.08.09.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 09:38:33 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: convert else if to else in rtw_led.c
Date: Fri,  8 Apr 2022 18:38:25 +0200
Message-Id: <20220408163825.29069-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The else if in this block is redundant, it can be a simple else.

if (x) {
  ...
} else if (!x) {
  ...
}

Convert two such else if statements to simple else in rw_led.c.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_led.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index 4b047c438389..2f3000428af7 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -110,7 +110,7 @@ static void blink_work(struct work_struct *work)
 				pLed->bLedLinkBlinkInProgress = true;
 				pLed->CurrLedState = LED_BLINK_NORMAL;
 				schedule_delayed_work(&pLed->blink_work, LED_BLINK_LINK_INTVL);
-			} else if (!check_fwstate(pmlmepriv, _FW_LINKED)) {
+			} else {
 				pLed->bLedNoLinkBlinkInProgress = true;
 				pLed->CurrLedState = LED_BLINK_SLOWLY;
 				schedule_delayed_work(&pLed->blink_work, LED_BLINK_NO_LINK_INTVL);
@@ -131,7 +131,7 @@ static void blink_work(struct work_struct *work)
 				pLed->bLedLinkBlinkInProgress = true;
 				pLed->CurrLedState = LED_BLINK_NORMAL;
 				schedule_delayed_work(&pLed->blink_work, LED_BLINK_LINK_INTVL);
-			} else if (!check_fwstate(pmlmepriv, _FW_LINKED)) {
+			} else {
 				pLed->bLedNoLinkBlinkInProgress = true;
 				pLed->CurrLedState = LED_BLINK_SLOWLY;
 				schedule_delayed_work(&pLed->blink_work, LED_BLINK_NO_LINK_INTVL);
-- 
2.35.1

