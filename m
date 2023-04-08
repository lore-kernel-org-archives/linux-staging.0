Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BB01FB8
	for <linux-staging@lists.linux.dev>; Sat,  8 Apr 2023 17:18:11 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id e13so1050312plc.12
        for <linux-staging@lists.linux.dev>; Sat, 08 Apr 2023 10:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680974290;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EP0xHsBJuGQ8+LLXtPS0+w3ttj9z4w16bhu80ACSGOk=;
        b=O+SylsnpuMNH6HnC5Jme0ln//6knJgePalkuF79wOu/ALcbq6z40JvVyUy05RNVO8G
         mxtPOt/qBujPn/wFHAMKBtlldwivvRzs0EI2yVqP8ogciBMUtdofB1MogM0AFXoOYxsB
         16rNpvSEH8oUGjQ9MFmYocgdOH8C7kK0mzHm4KUdNPdIbMuliWYRKIGVN5nEubVLYa75
         GYSLG+xDsW+lahjzo+ibEjIMDY2CrEm7N+PeqAZwDQJmaKDibCQBS+XmDb6T1w/ghsaK
         7SIuVWdTGb+yZ8HHzDmV/r7orD29mwB8Mc9FWafhMLv8d9gOMneAUOB7Y/lYf+f4ZAQx
         5EHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680974290;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EP0xHsBJuGQ8+LLXtPS0+w3ttj9z4w16bhu80ACSGOk=;
        b=cP8Ytm6MZfFNoK3C9Znww14i26d/dctaMpcJLhIJl5F98J7AODDKSUNdX/vPpU4OAn
         HB75KOndBihoCi8z6dUekSSHVWWXOjgrIcX+OiwJpJO/F3cYsAPqEhN5546iEXWBtOPU
         Ay3UhevQmKwUvPGGM4GNMnybCimrhw1rBDf73ZfVhtQwf1+rOjKBPqmzqItT76q+Li2r
         Ro0waobXzJZ3FvzW8PCu7qQ1q0FwXCdW3kHnOmqiumNcIWp2t9EbF6SDM813oG4UGKjj
         Y7GJEdipaZMXnfdPeBYOJv+5FqmWNkMvCH5AtkuFtzqwFhP9fxFbhjXI86pE7uY2C+gN
         XqnQ==
X-Gm-Message-State: AAQBX9dkL9Euwmpy5XAFeLwrD4C6ePywtLcT28uzu8pvyJcs/ELuriS3
	Jwt1aJJIGyWRot1NI5GTP+I=
X-Google-Smtp-Source: AKy350b0iFKnWt9b+S7PUE1tvOtQQDFxnoSrY2EuGsYnKtN3Twh/DDfSRGWG1W4158J1SdY9f9KXyA==
X-Received: by 2002:a17:902:ea03:b0:19d:1a8e:836f with SMTP id s3-20020a170902ea0300b0019d1a8e836fmr3215037plg.27.1680974290532;
        Sat, 08 Apr 2023 10:18:10 -0700 (PDT)
Received: from sumitra.com ([117.207.136.97])
        by smtp.gmail.com with ESMTPSA id y3-20020a170902864300b001960706141fsm4766560plt.149.2023.04.08.10.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Apr 2023 10:18:09 -0700 (PDT)
Date: Sat, 8 Apr 2023 10:18:03 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8192e: Fix logical operator continuations
Message-ID: <20230408171803.GA262580@sumitra.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix logical operator continuation as suggested by Linux kernel
coding-style. Check reported by checkpatch:

CHECK: Logical continuations should be on the previous line

Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_ps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c b/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
index 5a1cd22f5e25..58ed394202ae 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
@@ -209,8 +209,8 @@ void rtl92e_leisure_ps_enter(struct net_device *dev)
 					&priv->rtllib->pwr_save_ctrl;
 
 	if (!((priv->rtllib->iw_mode == IW_MODE_INFRA) &&
-	    (priv->rtllib->state == RTLLIB_LINKED))
-	    || (priv->rtllib->iw_mode == IW_MODE_ADHOC) ||
+	    (priv->rtllib->state == RTLLIB_LINKED)) ||
+	    (priv->rtllib->iw_mode == IW_MODE_ADHOC) ||
 	    (priv->rtllib->iw_mode == IW_MODE_MASTER))
 		return;
 
-- 
2.25.1

