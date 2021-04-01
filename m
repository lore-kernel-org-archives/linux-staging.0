Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DF45F
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:22:41 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id w18so1202905edc.0
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 02:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DAFBVnxf7LYJNJ2cEtCwdZzp2LZTVZ57HRGj4i0Yfv0=;
        b=H4MRrnzDqU3fQV2tI+vF6k16CJHD8FF0/74qbrP6zydfMR1/PUG07IFbkQUo8xNfDB
         2l+d2KexSMPNKVypK3STC8YyP+SdEZPQKTV5ZTS1AdHhq3AY4gSM6KBAayLStAklVtYF
         yH5BS+msk9ixefkqZ3jcBsTqURYKDl3KSuKQxMoLTgHoSVsHDpZ+TsLkVEMZdmj498qq
         CSDVWuCv2gvzsI35aS+B8z5xsbgWpsRfGshF+q/pujNT36XzWSxqW4MzxxkNYVMzwtGg
         0vTRcM03Z29Y6ovvGm2ATFdbMQnBktfBLmW5SwYci+CQbiDOQ/6oXg9jGeNQtvoSD/GB
         dfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DAFBVnxf7LYJNJ2cEtCwdZzp2LZTVZ57HRGj4i0Yfv0=;
        b=IdTFXrLSmUl4fC9gAXVrQewYucw2Iw5vYJtyklXN967QnqJQ8qb1CUFesjrDsDNfBR
         vRpFQhSsusBAC+l7gOUQVEY1nON/2y5JwMHdBTajj/7znbGSRyNHziMc4klXaokaBGe7
         9gO9dfMiOq2CPCGWJDORzI6h0oYkAE3tHJyt0FfD3NO/CFUdwA66Wv8ZBtF/4MWLDyRp
         W6wjxrVAJvNYRKtm+6yO5KZoboig0wLBAbBZwsAh7uw+3I0l6VypcYc7cZiJmIBPkvG1
         JFmLBv2/7+B8tyVn+O6RZA6Ki32vdGFXHo3TSytu4BAcLuMjBT8sIaHpQw6oloXi6QdI
         bjfQ==
X-Gm-Message-State: AOAM533cVFQaBUq6iJwpUZQnsYpT0KXEc+TTxbF6SLZBliItuTG1aMHT
	L3j9xDqYVVNMBP7Pg1rBcsU=
X-Google-Smtp-Source: ABdhPJxmdTbecwBRCCzKhbZq3vVCYrS5ds2xB6I2Vbqdn0cJrvOLKGhg3EcvpenWujwrzXcjA7DJiw==
X-Received: by 2002:a05:6402:350f:: with SMTP id b15mr8706183edd.6.1617268959655;
        Thu, 01 Apr 2021 02:22:39 -0700 (PDT)
Received: from agape ([5.171.80.247])
        by smtp.gmail.com with ESMTPSA id n6sm2498169eji.37.2021.04.01.02.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:22:39 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 47/49] staging: rtl8723bs: remove RT_TRACE logs in os_dep/osdep_service.c
Date: Thu,  1 Apr 2021 11:21:17 +0200
Message-Id: <44f37521ea6486b4d95b86fc7acf7391bcf13e51.1617268327.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617268327.git.fabioaiuto83@gmail.com>
References: <cover.1617268327.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove all RT_TRACE logs

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index 843003b91ea2..7b2aad346d20 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -161,7 +161,6 @@ int rtw_change_ifname(struct adapter *padapter, const char *ifname)
 		ret = register_netdevice(pnetdev);
 
 	if (ret != 0) {
-		RT_TRACE(_module_hci_intfs_c_, _drv_err_, ("register_netdev() failed\n"));
 		goto error;
 	}
 
-- 
2.20.1

