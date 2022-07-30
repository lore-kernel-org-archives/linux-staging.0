Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B137A3C1E
	for <linux-staging@lists.linux.dev>; Sat, 30 Jul 2022 23:59:15 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id 8-20020a05600c024800b003a2fe343db1so4030420wmj.1
        for <linux-staging@lists.linux.dev>; Sat, 30 Jul 2022 16:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XFfl3fvUkStQAla+HkThz8i6u3worW0NuOmmJQ7dxFw=;
        b=37z3F1S/xY9NRMXx+Dae4aV7GMpjcO73t8Jtw9OERy1UwzIbR9Hrqq8tmFBxWk+IeE
         GYcaTxDNGpJYcDKe54QZ9R+kSzm/RZLQzYkx30/wDuQptp9ebg78bj1HpAPWVnZF0CSG
         mvFmCNLwYkAaA2Q1RlV3cCdKbzoDV/ubv1+ZPcADJ0ACm95/Ds62H8pcNdh/vkySpy9T
         igIUBVVl0APo31QgqYAMbrhxf4tJEWoZtTcC+H8ZWr6NpAXGXy8HG/0rOTWn0SqXumPu
         RCJAtYngXCRY0jmhSybrqAMkQSbRI+S0LA14SKN0TkoTGTJWKQw8x94FnHGjSKy5yxyA
         B04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XFfl3fvUkStQAla+HkThz8i6u3worW0NuOmmJQ7dxFw=;
        b=0dd9xhNTlgRSqLOBtnBV5SsTho7+dF8EIYfQlFvz6EJAytJ2ngPM+RE4IjJU9AZNcp
         m90WBy3YQJW95dAtcsyE2sB2L3YD0Zc33GlyseYLdNA7GEiWtmyPalWeVCdjh+xFncCX
         kF520dlXtNb8p8jI7oy2EjPssIystmF5q+anpN6MMKF6eDyBtfCdxgZU5d3CVbzMNq59
         A7J1fx13pF7OYx56H5Sc0hlx39f7WqALCZNqzNnO59RI7uFeoPvraBISzbWdHSiDnQM4
         8H9JiDQvX+BbrYrEGgLxWJNQzwGl0din25vwkacilosMhkZ02jtSKzoCTQpzOWasj9xG
         XqdA==
X-Gm-Message-State: AJIora/W4IoFc8EsLzKUXwgGNi94DGePYi5V+acvTB+SsO1HFZ60TkBB
	jvcUv7/K0U8qyFlGNBtqOPv+PQ==
X-Google-Smtp-Source: AGRyM1vu7o/4YD4IwTcmD332Wl18Bit+6ay104U1SqYA3waYlygWwSrENiujo9W60UoBexOgnttAgA==
X-Received: by 2002:a05:600c:3549:b0:3a3:16af:d280 with SMTP id i9-20020a05600c354900b003a316afd280mr6665993wmq.142.1659225553964;
        Sat, 30 Jul 2022 16:59:13 -0700 (PDT)
Received: from localhost.localdomain (d.f.5.e.6.6.b.1.e.6.2.7.e.5.c.8.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:8c5e:726e:1b66:e5fd])
        by smtp.gmail.com with ESMTPSA id g9-20020adff3c9000000b0021eed2414c9sm7453595wrp.40.2022.07.30.16.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jul 2022 16:59:13 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	paskripkin@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: r8188eu: fix potential uninitialised variable use in rtw_pwrctrl.c
Date: Sun, 31 Jul 2022 00:59:10 +0100
Message-Id: <20220730235910.1145-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set ret to 0 (success) before entering first if statement, thereby
assuring that even if the device is not associated and further checks
pass, we do not then end up returning the uninitialized value of ret.
This assignment is deliberately now directly before the if statement, in
order to keep it clear what is happening as opposed to having it as an
initialization at the start of the function like it was originally.

Also add a comment to make it clear this first if block is currently a
success path. As a side note, smatch does not trigger warnings for this
change, for me at least.

Within core/rtw_pwrctrl.c in the rtw_pwr_wakeup function, I previously
dropped the initialization of 'ret' (int ret = 0;) in favour of its
assignment which happens inside the first if block directly before its
corresponding goto. This was the cause of this bug, and was introduced
by: commit f3a76018dd55 ("staging: r8188eu: remove initializer from ret
in rtw_pwr_wakeup").

Fixes: f3a76018dd55 ("staging: r8188eu: remove initializer from ret in rtw_pwr_wakeup")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/core/rtw_pwrctrl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_pwrctrl.c b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
index 75e655bae16a..10550bd2c16d 100644
--- a/drivers/staging/r8188eu/core/rtw_pwrctrl.c
+++ b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
@@ -387,10 +387,10 @@ int rtw_pwr_wakeup(struct adapter *padapter)
 		msleep(10);
 
 	/* I think this should be check in IPS, LPS, autosuspend functions... */
-	if (check_fwstate(pmlmepriv, _FW_LINKED)) {
-		ret = 0;
+	/* Below goto is a success path taken for already linked devices */
+	ret = 0;
+	if (check_fwstate(pmlmepriv, _FW_LINKED))
 		goto exit;
-	}
 
 	if (pwrpriv->rf_pwrstate == rf_off && ips_leave(padapter) == _FAIL) {
 		ret = -ENOMEM;
-- 
2.36.1

