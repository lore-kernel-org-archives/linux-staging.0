Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB5A6F
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 09:40:59 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id e14so29036859ejz.11
        for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 02:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QNFxids6U9D/dKDx/610dkY//hXLOEttQc5qObgmL9k=;
        b=qldOFHSwo2wnWqwGUxHuHPtBREDpcQXw3e3RclqtaT+Jkgl3/u8e4VyftzPP4nHrIm
         TLzegsn8Qrmso7KrpHEKaLH/6dHeFq+G/pf/8dQTy6Mtf1KO7WfOzO8rD98LwZxzqcEA
         36qpSYORPESCtG7G45CTzZe4qqtk+cLtwLCN4QXHiwIkUGwT98B+sedEvcGS3yfkLG+P
         s81Np4hhfVX3v5mAenDlcedS+FX8bMHGICZc4cukh2Ag4rIh3mWVzvDbu0ryuOfSy0AD
         ri/Hq2o7r4mIPJLbbOWlx39q0iO5wSjfsUcph7hTomqHVfml+Wg733T+3pRXv92JVMLk
         4nYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QNFxids6U9D/dKDx/610dkY//hXLOEttQc5qObgmL9k=;
        b=bYBRlsS/PoatQm/nloFpobt1Kjs7BIL3HUgRX6tx24nozJCl53NtnnFwneAEVI/i44
         OnkgXi/46tENRreF0ngnCjdodDdnY5Q+pVILuPAVEdgLTeDtpiokPIJi1vHkXjIACAvY
         ZPaU8hBJ/8mM+22EW6ck6pkwPIW+njPl5JIV/qUTDEcrVuzKlc85Xttq1zkL+/HBvkP2
         fBLWiSESVJhUYcaFHji3CFA8AHrtFMEI7s7uT//5B2zkC4xWFOpnmsb+5F5xDbe5SnNd
         ZbhD408mRlguLZr1UR7meDdpphcjNn5Nin/xkwKB2mr5ZOhtwh0+zgtRKjaD5mocTo6D
         qDIA==
X-Gm-Message-State: AOAM533djX2zW65dhrg8Y3uUQSIyN8bpdb8tH44/9mO0BtDtaxz5ifdr
	0Cav8+NQb1B+TtEYVhC8Qf4=
X-Google-Smtp-Source: ABdhPJzmk/XkWmzwLzBJuaghbHwqq5ZSAWbkn2zAWyT31ZZNkw1NYjaoAo5dsbJdMWud6R9fxJBjlw==
X-Received: by 2002:a17:906:cb18:: with SMTP id lk24mr2517434ejb.70.1617183657903;
        Wed, 31 Mar 2021 02:40:57 -0700 (PDT)
Received: from agape ([5.171.73.44])
        by smtp.gmail.com with ESMTPSA id e8sm1144891edq.77.2021.03.31.02.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 02:40:57 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 24/40] staging: rtl8723bs: replace RT_TRACE with public printk wrappers in hal/hal_intf.c
Date: Wed, 31 Mar 2021 11:39:52 +0200
Message-Id: <820be3e002c4f50f4f8d265c2ca05448db667bbd.1617183374.git.fabioaiuto83@gmail.com>
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
 drivers/staging/rtl8723bs/hal/hal_intf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index aa4356327636..87de2a3bda4e 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -108,7 +108,7 @@ uint rtw_hal_init(struct adapter *padapter)
 		DBG_871X("rtw_hal_init: hal__init fail\n");
 	}
 
-	RT_TRACE(_module_hal_init_c_, _drv_err_, ("-rtl871x_hal_init:status = 0x%x\n", status));
+	pr_err("%s -%s:status = 0x%x\n", DRIVER_PREFIX, __func__, status);
 
 	return status;
 }
-- 
2.20.1

