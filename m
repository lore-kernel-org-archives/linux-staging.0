Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9A12C9C
	for <linux-staging@lists.linux.dev>; Wed,  9 Feb 2022 07:36:27 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id m4so4676879ejb.9
        for <linux-staging@lists.linux.dev>; Tue, 08 Feb 2022 23:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y3bEk3Ka9vuptIFAps3HWkZM4gzLyBfOMR/Q71qvDpw=;
        b=etrOHlXUrACkEBWxtFjoha0JTVlXmxF1mPXOFAzRQEZzhjqAi3TtbaUYAdUbCSjDEt
         tP8kenKI8c+IYdecNiGy3GgJvhlUQuqMYGjWrFXlH+s6OaWQHXjaEqpKCvwDusCCFrZH
         HERUuOlDsnmH4TKfScjb7PSSlyHh2f7fZDqbP5w3ySM+ORNNZXny/YhpuVnpj3PCVwpP
         yUt4AZrO7icJDaF1Ij9T7lDbzCR3IYzSYmahY8imINEfhK1achGkJaVkjI7+YffewXPR
         xu3KcEwtCX4Lv7Cz7/0sIzzAcwWLpMq+ShRAzdu0YnN6CY6hlzx9Tj/mHYtprh5bAJ1w
         lqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y3bEk3Ka9vuptIFAps3HWkZM4gzLyBfOMR/Q71qvDpw=;
        b=mX2ifwj3qmEav3vp0IoLXiRHzKkymn+lp2ZeWWvmJ5hLtdWsckNQn4MbUwJYVZeN90
         7Syr9iXCgm11U7Ri1kmSslhq2S8FmShk98TbQYEPRJS9oKg3ALSeDnsFLPocIJBWAGig
         gFhgWDMzMU4XNWvVmIY9NneBgwninxiGxrsmImv1vANlgtTaR3T60zpdE0heUWAXBQWV
         yP6uUXRdYz08+kkR12LHM5l+wngAJ4285d9axovMgQFmmwX4aAtdNnq1yjLcARZ6xp5w
         w0WGY2oD5Cil2l+TXQUqE2aiklamowp7Gk2ay6qF5fMmr4CQoHQM3QKc5/o8h+xLxc+/
         4nSA==
X-Gm-Message-State: AOAM532kR42Rq5k+A0w8tN8HMy2APGpD8e6z2WN/gXMy+iMo8utqb5Ht
	kmNnKVv8kd9wAVvsM7haeWc=
X-Google-Smtp-Source: ABdhPJw4kZ1WgbXO2tRZgL4OmSgZOHwdah7cApDCpPd2V+FH98Gn8oOHnr1qDXTIl/Ju7JhsgMAjsQ==
X-Received: by 2002:a17:906:5d10:: with SMTP id g16mr798914ejt.642.1644392185877;
        Tue, 08 Feb 2022 23:36:25 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb5a.dynamic.kabel-deutschland.de. [95.90.187.90])
        by smtp.gmail.com with ESMTPSA id y27sm3731813ejd.19.2022.02.08.23.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 23:36:25 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/2] staging: r8188eu: remove unused enum
Date: Wed,  9 Feb 2022 08:36:17 +0100
Message-Id: <20220209073618.29725-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220209073618.29725-1-straube.linux@gmail.com>
References: <20220209073618.29725-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove an unused enum from rtl8188e_hal_init.c.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index b3ae358d1143..8fe74e21992e 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -336,14 +336,6 @@ int rtl8188e_IOL_exec_cmds_sync(struct adapter *adapter, struct xmit_frame *xmit
 	return ret;
 }
 
-/*  */
-/*			Efuse related code */
-/*  */
-enum{
-		VOLTAGE_V25						= 0x03,
-		LDOE25_SHIFT						= 28,
-	};
-
 void rtl8188e_EfusePowerSwitch(struct adapter *pAdapter, u8 PwrState)
 {
 	u16	tmpV16;
-- 
2.35.1

