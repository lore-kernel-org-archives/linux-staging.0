Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91FF6D0E
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 10:01:58 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id w23so5853917edx.7
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 03:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d8spghv9XGm/pmlCRiIePpg5j5meLsrNa3sxir/pbN4=;
        b=pT7z258TR3HYgU4wzw5AtbklWCfXpE6CpefLtTuK9H1NUkSWTHlcFVJujEKagn/q+K
         SF4HPUCRTTSgpJwyEzIHSwwgGX4y2r6fxBamRHvfKohyYQjAIK26TWUMfI9qIZ+/QfkJ
         iT1YBzblllBSs8UJwNOMY458hLXlh8lx5wUn4iai5llJjkAyS24zEdNsZHav6r2HZxYX
         VfIYjce6LntLPRe1a2D7fVE7uBkYBSHXa5g4NfChNoKrBz7VYZZ4wAHhlbb4mCf85rNZ
         Nsqr/9M6RpSyhpTaS21dNqeu4HDa7zSgHDbVP44qlAR4jZ34ZHoNJ5AEt/3L7R9iEmIF
         h6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d8spghv9XGm/pmlCRiIePpg5j5meLsrNa3sxir/pbN4=;
        b=NcB/iMVC6vNP9dR2+W5BlRZmsfa5qh0BZGNinIeX4IrJMAE2SQjJd8J4qgK65+MZ+/
         ytkj92pHc+y4eM4/HTXobel8M+pKFMWm43U6ozalq28deZwnvZXUI20Um8t2HcdHOJ0o
         14wcrUwi9BMHntv9ZtkHZ/X2hGRXhFozzNsALOy2mWMYVdUKAzSt73/6ld5pEElRlA1W
         2QeqDpsU4ZVWLwWSbiPmORpBGBUeTLk3m+48eNQplyzaodTrqwKr4m8zOdaRs00ZVu1q
         IoyvINouCudCDFvOz+qI4bGYPEuul8cYGWLpN750j2UJ9xS4ZhZbP1LcF9IX+BKhLVBu
         GqKw==
X-Gm-Message-State: AOAM531VxnRCQ4N97wWS0trrv8kj1U99ZjMpNiD9f7da6KlS5Zv6rUHc
	A74dfyTzI7U9/fahwV5P5/4=
X-Google-Smtp-Source: ABdhPJzEIlnBZqUdbbcpjpEbu4u8Ya+xR9jTJzYftj/W694IfeKfVRbBCss6VIfm/i3yypxPUdXkIA==
X-Received: by 2002:a50:f29a:: with SMTP id f26mr16694896edm.13.1617962517363;
        Fri, 09 Apr 2021 03:01:57 -0700 (PDT)
Received: from agape ([5.171.72.173])
        by smtp.gmail.com with ESMTPSA id n5sm970240ejj.73.2021.04.09.03.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 03:01:57 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 06/11] staging: rtl8723bs: remove unused variable pstapriv in rtw_dbg_port() in os_dep/ioctl_linux.c
Date: Fri,  9 Apr 2021 12:01:34 +0200
Message-Id: <d433ffa5b52d6510811c882a80c1146c7d7be536.1617962215.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617962215.git.fabioaiuto83@gmail.com>
References: <cover.1617962215.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

remove unused variable. W=1 compiler issue:

drivers/staging/rtl8723bs/os_dep/ioctl_linux.c:
In function ‘rtw_dbg_port’:
drivers/staging/rtl8723bs/os_dep/ioctl_linux.c:2448:19:
warning: unused variable ‘pstapriv’ [-Wunused-variable]
  struct sta_priv *pstapriv = &padapter->stapriv;

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index d4392459082d..ae74623bf1a1 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -2445,8 +2445,6 @@ static int rtw_dbg_port(struct net_device *dev,
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
 	struct wlan_network *cur_network = &(pmlmepriv->cur_network);
-	struct sta_priv *pstapriv = &padapter->stapriv;
-
 
 	pdata = (u32 *)&wrqu->data;
 
-- 
2.20.1

