Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0335A6D38
	for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 10:07:31 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id g9so6700140wrx.0
        for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 03:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pFAMp/tJSwgmo4xDcL/XkCGjvOXExZ4h5M6fYiNEoIA=;
        b=rKBbOPEk2Cgpo0nAqQl9TlarieMnK/GgzcTlp7qoG7udCobGRlqDFc/oRxGZNBU4cC
         qXpvAh6r5ILVpYlwKcdKSwrbaiFabeezATu006KfEj8dnb3IYsamEJfpMzG9pNkMnaT8
         yWmGTVPZwyldudotvCI5Fkc4mc3Gh60rO/ZCDsdP/N97zb7EtOVgN0G2kOKgdpXfHlVm
         FU4EtY/7UNDTe7+7xbDHrtQbUdhHjkIkrcd6k6Lb5PwUOweaZR3SFBCGhyg1pogdr4vK
         PQcwDUF83eSCKjIQ50DH8s1pe74vZ17TlU/ZOITyDxDqdJn85UAu+iwzXeHDHkw7vp+b
         z8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pFAMp/tJSwgmo4xDcL/XkCGjvOXExZ4h5M6fYiNEoIA=;
        b=SV3kwhDFfZk9WCfjPNOzL64sP63DunSp6sZUiTDkrIKK23U9UJV1dZLCiark79ogzX
         +D/HHpxgGnoxwtPSs357dRGL3ZdwBQJ5W3RnyEFBr0EumoAEScbOr2RRAALFLJx7rZOL
         x2YANmuJIrqh/DPD3la+zL8yHauStgHg/j2CvjGQaSbMY7iMLTODs5HzqDcrKEBWm40l
         pEQceXUJHWb9q7DD3LzpZr7zvlz2LQ3KI7OZlVs08cgcZjGL/FuGe4hFe0U7JYT1F2iQ
         gJSakj0jKnpBwJE3NYd39yjKvyeSfPmfhGkSPPEzHS8pzVMDJVwi10AnrR2TAC+IpiQ4
         t0hw==
X-Gm-Message-State: AOAM532d065f8S+BsmhemENaiEi92MoqjRsenyNGXs8TLomEHL28vuoz
	ipI+Qag5+YXYm9/rIdCfwZg=
X-Google-Smtp-Source: ABdhPJz935YMigtl2i4TUgElWqksJSsOO2OoN1IYcW9qxbUcHOaoqiZb6F4bpSZzyPvB4qUHqVbetg==
X-Received: by 2002:adf:b650:: with SMTP id i16mr2671795wre.189.1618481250630;
        Thu, 15 Apr 2021 03:07:30 -0700 (PDT)
Received: from agape ([5.171.72.223])
        by smtp.gmail.com with ESMTPSA id l9sm1827460wmq.2.2021.04.15.03.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 03:07:30 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] staging: rtl8723bs: fix code indent issue
Date: Thu, 15 Apr 2021 12:07:20 +0200
Message-Id: <2e0ba5214df41de7e46b8df4e62d2f38acea92ec.1618480688.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1618480688.git.fabioaiuto83@gmail.com>
References: <cover.1618480688.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix following post-commit hook checkpatch issues:

ERROR: code indent should use tabs where possible
887: FILE: drivers/staging/rtl8723bs/os_dep/os_intfs.c:1145:
+^I^I           "%s: ### ERROR #### driver in IPS
+		####ERROR###!!!\n",$

ERROR: code indent should use tabs where possible
888: FILE: drivers/staging/rtl8723bs/os_dep/os_intfs.c:1146:
+^I^I           __func__);$

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 2c04a9e37bc5..160f624612c7 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -1142,8 +1142,8 @@ static void rtw_suspend_normal(struct adapter *padapter)
 
 	if ((rtw_hal_check_ips_status(padapter)) || (adapter_to_pwrctl(padapter)->rf_pwrstate == rf_off))
 		netdev_dbg(padapter->pnetdev,
-		           "%s: ### ERROR #### driver in IPS ####ERROR###!!!\n",
-		           __func__);
+			   "%s: ### ERROR #### driver in IPS ####ERROR###!!!\n",
+			   __func__);
 
 	rtw_dev_unload(padapter);
 
-- 
2.20.1

