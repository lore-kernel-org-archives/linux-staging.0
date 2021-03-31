Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F706F
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 09:41:25 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id y6so21561312eds.1
        for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 02:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZP4wKbMRMwqEeI/UoxGUOokmbbP4VYk3spjExIgzybg=;
        b=l1bzxHwwJnzka9akVrlKhaHYgMplPypRD7IacQjOm5Z/EEepraymXszXE05bDnKHUx
         e4G9oWHpr1BUOumvSXAFlK/N71vYTWsNLBTUxEMyA/X54QqD2lgETSkkebborceaGKlp
         U08IKFKKT8xXzudulCXYCOhHBnhLUXNxtfGPUPT5npX/nQtlig0FqVrtP1BRMXR4jERN
         qsrAIZ64oJ4HuoODz+AlupyFUUWjUPw/Ks7cv7Hgw9lH39hyVWu0qyK5m8uP1zsoAK5E
         iLMtFljk5t489wu4x9ja62Lb6lgdJq8MPrKnO5JsqCJWPp4S4/y/HMQr9sTSxEOqMfzv
         q+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZP4wKbMRMwqEeI/UoxGUOokmbbP4VYk3spjExIgzybg=;
        b=IYhN5naYWbwp0cNTH/HdioLRV91zSHDzngbvtJWc74dQR9CQmGzdvNfHW5pkC+wzuj
         CUpftkMuJQjWjLGhQQ+V2QsH7AIdWTbBpIWWcNdbYcK7CfoSzArF9ho42P+Z0x5b+ji1
         oONBrck9eBWBUh4gGzfSZGaH7BjSbEDjd3z/uWNe1WwbaV4/PSn3iIlJMUaq7TBKzSTl
         SiHHJsc4TCw4bKTIA6joIkcKVVoQTgUq5wmBWXu8mCqpWdPfpJVS7eOViGh++7+envqH
         dPIlBo9Q0YzqOkOp5YHm3iwbyEnLw+uqdtNS+HS6b+lk8ZTCWWWNfUqM5z7kKXTiiDGS
         zHVA==
X-Gm-Message-State: AOAM5315jN8fRPgI5pdUtnvaD39u2Ns37AsPWybNhZeZot/ty0jLIH94
	G5jJfDx9wt4L0T/Xp/mRSEGiU21lZ47H9A==
X-Google-Smtp-Source: ABdhPJzEKiS21NiHDfR3O3pGswNk9U99uTj9g3bbAAqC+X5cuy5KzsfcImZxu6dUHDWbORBP4WlamQ==
X-Received: by 2002:a05:6402:3487:: with SMTP id v7mr2597732edc.302.1617183684332;
        Wed, 31 Mar 2021 02:41:24 -0700 (PDT)
Received: from agape ([5.171.73.44])
        by smtp.gmail.com with ESMTPSA id ak20sm814955ejc.72.2021.03.31.02.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 02:41:24 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 39/40] staging: rtl8723bs: replace RT_TRACE with public printk wrappers in os_dep/osdep_service.c
Date: Wed, 31 Mar 2021 11:40:07 +0200
Message-Id: <de95a0740d468cb8e3f9a646c91ef79dccc93ec2.1617183374.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617183374.git.fabioaiuto83@gmail.com>
References: <cover.1617183374.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

replace private macro RT_TRACE for tracing with in-kernel
pr_* printk wrappers

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index 843003b91ea2..db979403e16a 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -161,7 +161,7 @@ int rtw_change_ifname(struct adapter *padapter, const char *ifname)
 		ret = register_netdevice(pnetdev);
 
 	if (ret != 0) {
-		RT_TRACE(_module_hci_intfs_c_, _drv_err_, ("register_netdev() failed\n"));
+		pr_err("%s register_netdev() failed\n", DRIVER_PREFIX);
 		goto error;
 	}
 
-- 
2.20.1

