Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0B771
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:21:54 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id ap14so1904423ejc.0
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 02:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+JF/B2DTWQj/w/voWt1Q8G3VMWTtinDgQ1FwmaBkjzU=;
        b=fqKPBTA4YqLvHiSqr0e/3V5WUlX09ghCtNP2BEZVo4yg1MYHYXSXCpyPy3wpjsz1US
         zlMl6TDiTEnmXN6s1/BLHBa/CEySzUeoF/03a2l+BzxtwTii0uzBZHkTySL3RvvLsyM1
         Y3LYnu4FWUbFwovnLiWlJzdB4J7lmAVrTWtWGm9DKQ1Wg/12yfeAGNU04cPGFHX4szZY
         Ny1qpYp4nMatqDYNh/vtqjjDTNijVD3KvClQeAd+H+3357JvtvkVci0+JFjnRBx4wfOJ
         vS7R2jK1K6sdL6DyFw7ALGMpdOo7yc2fKguP8z6tDIWcVweVW7pgkQoL6qNkNSlcy04O
         6XXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+JF/B2DTWQj/w/voWt1Q8G3VMWTtinDgQ1FwmaBkjzU=;
        b=GvY9GjC8TyrORwxHjVpTeBq1BvQblqb3PH1ueDWRmZiCfBRgtJqqrjrpeEa1VcWAg+
         GFEBY80PVA16ow8iW/ccyHvhe6K9mxjgdXWQOYV+3bfnfn29SRfBLdLbhmXp17BPCV9Y
         bMTV4u3EFS7O9zfpBMyorGGMJQcsr4D8xrzVR/cCmQj3ONiayGkeASdGypoYneewsK6K
         7N+Kvgy4QGH7npE52zpELdz+VfK0u5YoGe75WtxkjpsgH59jysCGqvQ0HgBnI8/jVa1U
         9Bo6C2YP/gjpqay4rEelTC5L705W/TZtkjclutmSTJJRRwkDqyIaJJyNJkuAYORX5nzB
         68fg==
X-Gm-Message-State: AOAM533ic38IvDpDstj4Qa6dhjIM4Mg8eIpoC0dLFoh+LRFfYR01Z968
	9Mk8xSJrKUeJTqlnDPe2kqU=
X-Google-Smtp-Source: ABdhPJyowsWjq10HPM6L2qVdOerWWnxHTpPIRI+5Ii0QcEp4tm0KBdy6VnG9TNQoVAUiqmPL4JUfyQ==
X-Received: by 2002:a17:906:4705:: with SMTP id y5mr8189186ejq.119.1617268912668;
        Thu, 01 Apr 2021 02:21:52 -0700 (PDT)
Received: from agape ([5.171.80.247])
        by smtp.gmail.com with ESMTPSA id g11sm3237786edw.37.2021.04.01.02.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:21:52 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 18/49] staging: rtl8723bs: remove commented RT_TRACE call in core/rtw_ioctl_set.c
Date: Thu,  1 Apr 2021 11:20:48 +0200
Message-Id: <b89831a6ad12c895c6d78c3bac721ef28da747d1.1617268327.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617268327.git.fabioaiuto83@gmail.com>
References: <cover.1617268327.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove commented RT_TRACE call in core/rtw_ioctl_set.c

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 7d858cae2395..14eb01df69b0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -451,9 +451,6 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
 
 		/* SecClearAllKeys(adapter); */
 
-		/* RT_TRACE(COMP_OID_SET, DBG_LOUD, ("set_infrastructure: fw_state:%x after changing mode\n", */
-		/* 									get_fwstate(pmlmepriv))); */
-
 		spin_unlock_bh(&pmlmepriv->lock);
 	}
 	return true;
-- 
2.20.1

