Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631B73FC4
	for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 12:15:43 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id o39-20020a05600c512700b002e74638b567so9305900wms.2
        for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 05:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AAHgeCZ2aQN7mfS6aEnntPuA7ia/SDZIlFdYCZ9jF4o=;
        b=kiOUuvFAE0zvKJUtpB1jRnJhlpN8+Mx117LfzLHszz8bVF0ElSLgSAJIykgWJsYEO/
         eNxDxkIpL7HkxFZyp+pzNwUzaEJ7s735RQdi68Xh6FoiV+cMenaE1mWn/FAk7QTR/qTT
         rENofRCCsavYJR0j4UCjsTTcHYI54Pj+m+ME74kbFXDEu9pHP1wKkb9oe6zh1JtwWahQ
         JKzJZC9gw2eqGHuH8AeOGBE/6YJDKf/pbB+DByuBvNQNYklFvo8BOTxgXFtiAeexoBmH
         ikc8a1WdLlnNVdGudQs4H7aNTLc+zYvCrN7Unh5dROYv0Bz9meMG/ZLYHeHTwTbOGeq/
         dnew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AAHgeCZ2aQN7mfS6aEnntPuA7ia/SDZIlFdYCZ9jF4o=;
        b=HQg1kQ3OBxW+z1ByPEIW+rXC2++YrASC+FzQLaH+su7nF0IZnNGD0JGdWs+GBaJjFo
         sG6J3dlLrHyNR6YBrEPQNWS1BUik92gipJcQABxI43qM21qlFWDiTDL4hnE8Z1EMVEN3
         pD0h/lyFsd6iDB4LJN+i4ENChS0FcnvTN9PipwVVpwlIiJ8DAi9wIXTXjJaRmZIOJovI
         5FcF5UMCJM2tMhZ3ZFhfLsP3ZTpDBOa590bxu2SpnE4AbLHBa3X9P0C0e2xrLjJx/Kg+
         bU6IpUlwAqgeMVcEVZxac4qmx+apDK/gv8cSLxRtHxsbUQZWGiijBshQy941RqtrDwYW
         pJoQ==
X-Gm-Message-State: AOAM533bX1XKA7zkmnNB4B6X+AQq47XZ/7KX9X+RKbod2ZO6H3mFf7HF
	syZ29RitLueMFOipIYUKnvA=
X-Google-Smtp-Source: ABdhPJzunjo29uR0UqAwHv1j3hhBU+S59KbcNnj9PklJ/MCcBUGRianH1LT+J4ZOtdakyjDAhLMElA==
X-Received: by 2002:a05:600c:acd:: with SMTP id c13mr26850417wmr.28.1630325741867;
        Mon, 30 Aug 2021 05:15:41 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::16fa])
        by smtp.gmail.com with ESMTPSA id x11sm15492116wro.83.2021.08.30.05.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 05:15:41 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 1/8] staging: r8188eu: use mac_pton() in rtw_macaddr_cfg()
Date: Mon, 30 Aug 2021 14:15:01 +0200
Message-Id: <20210830121508.6411-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210830121508.6411-1-straube.linux@gmail.com>
References: <20210830121508.6411-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of a custom approach use mac_pton() to convert the mac
address string. With mac_pton() the driver also validates the
input now.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ieee80211.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
index b3a74198596a..205798b76cf9 100644
--- a/drivers/staging/r8188eu/core/rtw_ieee80211.c
+++ b/drivers/staging/r8188eu/core/rtw_ieee80211.c
@@ -1024,13 +1024,11 @@ void rtw_macaddr_cfg(u8 *mac_addr)
 	if (!mac_addr)
 		return;
 
-	if (rtw_initmac) {	/* Users specify the mac address */
-		int jj, kk;
-
-		for (jj = 0, kk = 0; jj < ETH_ALEN; jj++, kk += 3)
-			mac[jj] = key_2char2num(rtw_initmac[kk], rtw_initmac[kk + 1]);
+	if (rtw_initmac && mac_pton(rtw_initmac, mac)) {
+		/* Users specify the mac address */
 		memcpy(mac_addr, mac, ETH_ALEN);
-	} else {	/* Use the mac address stored in the Efuse */
+	} else {
+		/* Use the mac address stored in the Efuse */
 		memcpy(mac, mac_addr, ETH_ALEN);
 	}
 
-- 
2.33.0

