Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F036F
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 09:41:04 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id l4so29070376ejc.10
        for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 02:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l1/mtMaWyruUy5GsP0u8+X/MRIyBkOmtJzzZNj7uzOQ=;
        b=P2q09m1bbRygwmcdpWCGAfNBVrNQ4aB/i7eJWqL1mcWI6UyE2cfNGPv5lu9iaV/6Ed
         mP68ZteDqVUPUJydTNuU+ZLVXngo8LXtVTUSWcTK0kqP/rGBn28RrUC8ceaz1qCcxxFF
         pggBC1aOG3j/42N0EsITeaJQDGrwlaPiY9tAKyiaLK5fAYw51qMYd2jI9lRe4O+07ug1
         w8sdWN4kcjj+rYJ2FBM1Dv2aLRqL0S1JPwbidjmB66VCcC5BJ2q2Z0X6t8YdhuKu9749
         QbdY5kBR09hOhDdZX46oYR+IwyGgJ9b6friF4oRdktewE/KW/oXCcZkepCQo5qBmdtcm
         a0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l1/mtMaWyruUy5GsP0u8+X/MRIyBkOmtJzzZNj7uzOQ=;
        b=rE+FZt+14Li6rfnywKe6acxVRRGfAlcQuiG2BCFEJPn76W9pC7L4owrLo9bWfNUpAp
         zuugWoOb7M9r/arDXjCohwBnE4KzhD3ChWvg/WTGENU1+sF8qqEMrXTp9gRhwLdKrkVr
         qA1XD13Ofd0Ae2F2kr0RVqbtLqShwy1LVQmZMfI5pG0R834iD/B8OxTs5j8xJfHjyNxM
         amddQvImniRf9KPSA4z5l2Iu/zDFOeJB0vnyjDGFqWun/56RnGHEK2Cq2Tx8LYOyHnF9
         f5OUisHAhFJ9n1cHdECYIY3qRLd6WHKW7mvP6Kb6fWjtU6/Kdbq+vvkOptw4l+cCQ5Kf
         BAcA==
X-Gm-Message-State: AOAM5307Rui0+oqvhJIyy/RQ9iX0aT/WAwuf+jXQootgz2mDLEIRrsTt
	zH6xNWIwos5JY+y5L8HMqnc=
X-Google-Smtp-Source: ABdhPJwL/fj54OHKdIWjy5cQ4hvVijERO/J1SdNPvl8TjhlRKVoh4AYMluoRGF4aH1sJIanw4SVcHA==
X-Received: by 2002:a17:906:4f10:: with SMTP id t16mr2521117eju.531.1617183663313;
        Wed, 31 Mar 2021 02:41:03 -0700 (PDT)
Received: from agape ([5.171.73.44])
        by smtp.gmail.com with ESMTPSA id n6sm841200eji.37.2021.03.31.02.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 02:41:03 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 27/40] staging: rtl8723bs: replace RT_TRACE with public printk wrappers in hal/rtl8723bs_recv.c
Date: Wed, 31 Mar 2021 11:39:55 +0200
Message-Id: <41f84e20efd2fbef44271c383be9cfe3dc610427.1617183374.git.fabioaiuto83@gmail.com>
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
 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index 17a3e7bf66ef..7c8e0402f150 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -346,7 +346,8 @@ static void rtl8723bs_recv_tasklet(struct tasklet_struct *t)
 						update_recvframe_phyinfo(precvframe, (struct phy_stat *)ptr);
 
 					if (rtw_recv_entry(precvframe) != _SUCCESS) {
-						RT_TRACE(_module_rtl871x_recv_c_, _drv_dump_, ("%s: rtw_recv_entry(precvframe) != _SUCCESS\n", __func__));
+						pr_devel("%s %s: rtw_recv_entry(precvframe) != _SUCCESS\n",
+							 DRIVER_PREFIX, __func__);
 					}
 				} else if (pattrib->pkt_rpt_type == C2H_PACKET) {
 					struct c2h_evt_hdr_t	C2hEvent;
@@ -404,7 +405,7 @@ s32 rtl8723bs_init_recv_priv(struct adapter *padapter)
 	precvpriv->pallocated_recv_buf = rtw_zmalloc(n);
 	if (!precvpriv->pallocated_recv_buf) {
 		res = _FAIL;
-		RT_TRACE(_module_rtl871x_recv_c_, _drv_err_, ("alloc recv_buf fail!\n"));
+		pr_err("%s alloc recv_buf fail!\n", DRIVER_PREFIX);
 		goto exit;
 	}
 
-- 
2.20.1

