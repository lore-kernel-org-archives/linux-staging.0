Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC032C82
	for <linux-staging@lists.linux.dev>; Fri, 29 Oct 2021 21:42:46 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id g17so10426296qtk.8
        for <linux-staging@lists.linux.dev>; Fri, 29 Oct 2021 14:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yf6d4tFUMz+8SkZEpTdu+gxrEQvTmfREX/srqZ/vu/0=;
        b=GkcQfGnIqf26srXIX9vcdl6z1nhqOZMDJiR24QW5WWc+m3GzKjkVxNl9PJxo1lelxZ
         NnjMbgOh1rkdXz3X1wSBsSJYnEpdTsjS75XE26qCu/WN1aPRK3HjWUI3841eKqh4nTBq
         vJcPmDWn8kjNmXeEivXqS4SxwgOCbywnlRnGgg6YjiGdiSviFz5KbpgzNVtwSkViNs66
         BIJUV5pTsR7l5qgmrq03t8waK62M3nendgEpze1OQd8cenq26NFmR4KCxTwWeKrvTaZe
         bsanw8QyI5tveWECRIk8x6+qBBGzAvC8Wfg7fdOQo/4f5EbPJo0c7lACqtPoMcop7PAa
         nx2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=Yf6d4tFUMz+8SkZEpTdu+gxrEQvTmfREX/srqZ/vu/0=;
        b=T48+ASfx3czp1hmVz1v5HDXmPlDYbTC0PAF+jV5XvddLwwVeJateFS/l7sLmHMER3K
         HNz88lWdjAGhPqskhqL5eqKr59iepf77EsE+NU42Wat/c1Eb/eA1GEs4+DIt9SyuqoOW
         eZviq67KCFTvyYeekq8RvUanw15x0WgMOiG1SFeuNKU06wTYphVc5PT1GnugifR/lMke
         G114566X0D9xhNN4QqKeH07XsqILJLbdv33AjMLQTZzE2gm8/HtLZJejWhRGg4PLeSVe
         x+nYxVnus3XAUrkUNWFp+SNp5l3F4+vatTB4Cl+zeNwgQ2vS6EmqwFJPMI8VA3RnEIed
         +yMA==
X-Gm-Message-State: AOAM530J3ot+w7cSJeoWGjAklD8JM8kQljW1FGYnI+3xJVeS+dr9x5sl
	gDyiav5EoN+rDwOdn6tnlBU=
X-Google-Smtp-Source: ABdhPJz4CusR5kP4o08FRFyFWwgEIzwehzVtdZx/ajcMJGCs+E01cLEY/n04jG7cPXGSf+sbhLcieQ==
X-Received: by 2002:a05:622a:1441:: with SMTP id v1mr14827659qtx.45.1635543765601;
        Fri, 29 Oct 2021 14:42:45 -0700 (PDT)
Received: from ubuntu-mate-laptop.eecs.ucf.edu ([132.170.15.255])
        by smtp.gmail.com with ESMTPSA id q4sm5212760qtw.19.2021.10.29.14.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 14:42:45 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: gregkh@linuxfoundation.org,
	arnd@arndb.de,
	fabioaiuto83@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	fazilyildiran@gmail.com
Subject: [PATCH] staging: rtl8723bs: fix unmet dependency on CRYPTO for CRYPTO_LIB_ARC4
Date: Fri, 29 Oct 2021 17:42:44 -0400
Message-Id: <20211029214244.17341-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When RTL8723BS is selected, and CRYPTO is not selected,
Kbuild gives the following warning:

WARNING: unmet direct dependencies detected for CRYPTO_LIB_ARC4
  Depends on [n]: CRYPTO [=n]
  Selected by [m]:
  - RTL8723BS [=m] && STAGING [=y] && WLAN [=y] && MMC [=y] && CFG80211 [=y] && m && MODULES [=y]
  - RTLLIB_CRYPTO_WEP [=m] && STAGING [=y] && RTLLIB [=m]

This is because RTL8723BS selects CRYPTO_LIB_ARC4
without selecting CRYPTO, despite CRYPTO_LIB_ARC4
depending on CRYPTO.

This unmet dependency bug was detected by Kismet,
a static analysis tool for Kconfig. Please advise
if this is not the appropriate solution.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/staging/rtl8723bs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/Kconfig b/drivers/staging/rtl8723bs/Kconfig
index f40b3021fe8a..f23e29b679fb 100644
--- a/drivers/staging/rtl8723bs/Kconfig
+++ b/drivers/staging/rtl8723bs/Kconfig
@@ -4,6 +4,7 @@ config RTL8723BS
 	depends on WLAN && MMC && CFG80211
 	depends on m
 	select CFG80211_WEXT
+	select CRYPTO
 	select CRYPTO_LIB_ARC4
 	help
 	This option enables support for RTL8723BS SDIO drivers, such as
-- 
2.30.2

