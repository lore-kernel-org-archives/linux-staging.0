Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF536F
	for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 13:37:20 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id k8so16815450wrc.3
        for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 06:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N8GHNkBaplZHc+XPZ1huoIe6xcPMhbkacG9Rq+iNXAE=;
        b=JH6mh0m1/Esoy3QLjydg56iwT+gLEuKAI55hcPA3LLv3IrJy0jsgGE/KyXiMDb2z7j
         y/8w6Fiu+MA0JGqPneShu3moyzCGw+fZHOY89zajMPq5Tz+sbI+fqv1i0L0IMUhp/0kX
         0yC9O9tVoZ8ZUKJup7x4PrTjneF70nFw2DHp2se6O2ofJ0OMJ2uSuIwXKXDc0hxa6oc9
         phu8MTGXA+B1ATtk2J1AzUtJtyChNldW0YHVC9z7hq3NmjvIhOlx0LsDC0gINDozztlE
         rpl917gg1fEF8cJGK97WfbLepGr0ow573LzHGlredS5Iv0PA0Gau+g5HPMdlfq39NEZJ
         kjZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N8GHNkBaplZHc+XPZ1huoIe6xcPMhbkacG9Rq+iNXAE=;
        b=OogEjXRDuGbJ82+hO8qiUpleYebCy5w3/HcVEJQ8RtpntUH0AQI4jJBIOq4qSasL/c
         GeKHRWIqp3DFKFWk+vVV0X8Gu2xd7iOivvLEUJ/scxkcYZAO6Z2QIUAEWsgi9r3+sMDO
         SHPFB39NQcOLt/DGjtbJ01PWGbGuvwpqpNRa/A1Op3aW05L9DeZUGEjZ46cJKEVo1eGk
         5+PYmEpv8EsH5k2fVHuWCyEu5gjhQ7Y9736uR1PjfQOKXcq1E/p/j0aPyXBdML/rSqmX
         gVhtWZJ+kR4O6aUmUX+9Luo1HvgXyJnHGSJgnpyJkF2u4zod8z8Tw0/zxcVxNuE5Oirx
         r07g==
X-Gm-Message-State: AOAM533VIRqZRsQYsgiR+JU0gqorcR1evTt2AAPqRzJCcs6FyyS+BYxk
	iLjhxNjJJprShMBwHG5TV04=
X-Google-Smtp-Source: ABdhPJykpTLzwBRCmTPOURfc38ASZcuGeRadMR/rb7xbcd+jlC/5Cq+Q6pmXw9+On8LkPTJ0882Vig==
X-Received: by 2002:a7b:c7c6:: with SMTP id z6mr15962561wmk.156.1616420238886;
        Mon, 22 Mar 2021 06:37:18 -0700 (PDT)
Received: from gimli.cesven (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id d204sm17091770wmc.17.2021.03.22.06.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 06:37:18 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 10/19] Staging: rtl8723bs: remove useless structs in rtl8723b_recv.h
Date: Mon, 22 Mar 2021 14:37:08 +0100
Message-Id: <20210322133717.17797-11-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210322133717.17797-1-marcocesati@gmail.com>
References: <20210322133717.17797-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unreferenced struct in include/rtl8723b_recv.h:

	struct phystatus_8723b

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 .../staging/rtl8723bs/include/rtl8723b_recv.h | 44 -------------------
 1 file changed, 44 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_recv.h b/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
index 60a1df703c8e..a108ce89bce4 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
@@ -81,50 +81,6 @@ struct rxreport_8723b {
 	u32 tsfl;
 };
 
-struct phystatus_8723b {
-	u32 rxgain_a:7;
-	u32 trsw_a:1;
-	u32 rxgain_b:7;
-	u32 trsw_b:1;
-	u32 chcorr_l:16;
-
-	u32 sigqualcck:8;
-	u32 cfo_a:8;
-	u32 cfo_b:8;
-	u32 chcorr_h:8;
-
-	u32 noisepwrdb_h:8;
-	u32 cfo_tail_a:8;
-	u32 cfo_tail_b:8;
-	u32 rsvd0824:8;
-
-	u32 rsvd1200:8;
-	u32 rxevm_a:8;
-	u32 rxevm_b:8;
-	u32 rxsnr_a:8;
-
-	u32 rxsnr_b:8;
-	u32 noisepwrdb_l:8;
-	u32 rsvd1616:8;
-	u32 postsnr_a:8;
-
-	u32 postsnr_b:8;
-	u32 csi_a:8;
-	u32 csi_b:8;
-	u32 targetcsi_a:8;
-
-	u32 targetcsi_b:8;
-	u32 sigevm:8;
-	u32 maxexpwr:8;
-	u32 exintflag:1;
-	u32 sgien:1;
-	u32 rxsc:2;
-	u32 idlelong:1;
-	u32 anttrainen:1;
-	u32 antselb:1;
-	u32 antsel:1;
-};
-
 s32 rtl8723bs_init_recv_priv(struct adapter *padapter);
 void rtl8723bs_free_recv_priv(struct adapter *padapter);
 
-- 
2.30.2

