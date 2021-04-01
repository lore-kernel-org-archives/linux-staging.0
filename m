Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DA171
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:22:29 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id o19so1168208edc.3
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 02:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LNq63xydxKvI5xFGmqp0pc9swVuTSAsAgkYAFaeO+Es=;
        b=E1Qlvzd46mThXn+mHJ0VsO/znj5EtohPFjO41c93KebQv+gcVEAQtjT5w+qlCSRSNd
         EtYtJCRzRnHAGAgIwLQu4JcPGYwPhCzsBPAnR7xpXocpIBJ3h2+tkwxjo/NI/OJxj0Pk
         aT7B92/u4xYWN3d7n71XWQnT0Y8GlGD6xUab5WlsFDuuYMQlVLDy6359eQeZ3AkoIC1q
         2OQT6KBx5wEshWjczcz+xr7hvWE95dS6OhiUYSl3JhpQOrCoMCc2jm/4uJt4hu2hp3DN
         XKzzFwwb6i0nGjni68xMWecti9mURmT6/bbti0vXsKvAOtMQw8+dGa2AYO0IAMsg1vsc
         dhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LNq63xydxKvI5xFGmqp0pc9swVuTSAsAgkYAFaeO+Es=;
        b=VQz4aHEpt6VX6IS3DkoQQuzDQVZXkek+KrdkEIzN8LhuuIpaLiGgGrojLuDG+lOFPX
         qi5eE4/6tbeALetUcfLCkxDzHx4FfEZ38FpTryO4IAMNuOcTFpI4J32H74GTFeAXMNfa
         DXh1y2CydkIWnbxpKnDUZZzl7jPP7TMJmkhJqCSTvEGRLMG9oQo5PW1y7OH2rkdPrYJp
         flBDitYnZtKUuYZBavXPUAp91hHiTw6tgxt9BNVfax8+ca5mjbotSXtGvC4jwK6WlWEw
         SIaaQmD4LqWz1ykn5fpc9/c7PjwkSCRBxWb/Q8dJ6Sjhtxe9Ox3xZ7nxsZVs/lx9NPRk
         Ylhw==
X-Gm-Message-State: AOAM5336BrdDhoKHJogISMu36kEfesKRdlwX0ZUyk1msFmH1a0W5zQvg
	y3aaMYB2acsdc/6Gocdk+uzm6RiwxNX+6g==
X-Google-Smtp-Source: ABdhPJzrWz1Xre+cSypflkZKQR71tJRBtW6379ZWj/ukcoe/0Q27xDIf3NBzrQUfJ10AcwU7cAO/mg==
X-Received: by 2002:a05:6402:51cd:: with SMTP id r13mr8843519edd.116.1617268948653;
        Thu, 01 Apr 2021 02:22:28 -0700 (PDT)
Received: from agape ([5.171.80.247])
        by smtp.gmail.com with ESMTPSA id 90sm3728589edr.69.2021.04.01.02.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:22:28 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 40/49] staging: rtl8723bs: remove commented RT_TRACE calls in os_dep/ioctl_linux.c
Date: Thu,  1 Apr 2021 11:21:10 +0200
Message-Id: <7d7e9429b53cf011ce39804057cbca6bdc89c97b.1617268327.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617268327.git.fabioaiuto83@gmail.com>
References: <cover.1617268327.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove commented RT_TRACE calls in os_dep/ioctl_linux.c

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index 354441e6a667..aee4932162a9 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -4231,7 +4231,6 @@ static int rtw_wx_set_priv(struct net_device *dev,
 	struct adapter *padapter = rtw_netdev_priv(dev);
 	struct iw_point *dwrq = (struct iw_point *)awrq;
 
-	/* RT_TRACE(_module_rtl871x_ioctl_os_c, _drv_notice_, ("+rtw_wx_set_priv\n")); */
 	if (dwrq->length == 0)
 		return -EFAULT;
 
@@ -4245,11 +4244,6 @@ static int rtw_wx_set_priv(struct net_device *dev,
 		return -EFAULT;
 	}
 
-
-	/* RT_TRACE(_module_rtl871x_ioctl_os_c, _drv_notice_, */
-	/* 	 ("rtw_wx_set_priv: %s req =%s\n", */
-	/* 	  dev->name, ext)); */
-
 	#ifdef DEBUG_RTW_WX_SET_PRIV
 	ext_dbg = vmalloc(len);
 	if (!ext_dbg) {
-- 
2.20.1

