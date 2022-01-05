Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC67173
	for <linux-staging@lists.linux.dev>; Wed,  5 Jan 2022 12:35:03 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id ie13so1164173pjb.1
        for <linux-staging@lists.linux.dev>; Wed, 05 Jan 2022 04:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=itfac-mrt-ac-lk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=iDo5rGiooZ54e0YvK6yFC83j7B4kNsMB4P6R7oVhpes=;
        b=YLYxnLBnAXng8FeUNtZ6JD6R8eNeo/NZHpxcxsKqocfbY0WGTC5BoFN0vVomu0l3Ri
         XrxPzQzdTysGLzN9XD56TbeZgWf+98uC0wSCd+ugGkQd+AFTkWta2fim1RP84P4OsVmu
         NMzmN4Ji4C0w7prkPHCibVQ+6a9XUG0JP1fnG1aJbZ9ejINWGDykIpFM28R+5fDGeulv
         oQ5JgdSvdNS4w6/RMXd3GdIk4YIV3ekCKTNhGXnHaS6fZI5JyEzDZNQv7bD1K5p/8UDO
         xSt0R/bQbhRHojiGYFyD8ezGJef+mqN8slJT2mo8Rsh2ovK9x22oNSn0pu4y/0Nr/zl9
         96Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=iDo5rGiooZ54e0YvK6yFC83j7B4kNsMB4P6R7oVhpes=;
        b=7SabN/D/RiSwV5s+2XuopOORJxBxj3Df5xfw3Mdy7Qj5eGKh8wy6oj+Fet1w4KFFa+
         2WXd7UKX5Uh9I5Sa27p5UupzbxF8eXwj9/NuAHfL2dN1ns3dM+FD8/kapwrjzJSORlbO
         qstN05c5/21AKADJhRYVLCAgfv3djE7CqrTqL6q2GTT5CZT3lgvsklmH1RHZhjGPwXyq
         6HlyfPAve5tttZy5y2YrrPY0VSuWzVaISdjnUiO3igwxBnV9xOIYzpvZh2HYS6V+2nSh
         b1U5LDwZqr1x3JVmJTp1cruFPHzB/sAobQQ+OMxLoANl1j7mActUbr1d0SmrTupkRR3m
         jeQg==
X-Gm-Message-State: AOAM533oHApyCAW94nH4157Eo9rOGyuRp7Fkae3BmKdlSrfBQb50JjHO
	zcYsUcWLWjYdeSKqCQbYDl7F
X-Google-Smtp-Source: ABdhPJzIp6LSUQWMzFLj9p88FP24McTlSAJvX0/+EXcWcO0WS+mA+GQzWVn4Rb+QxKvlPBnNe6w4Tg==
X-Received: by 2002:a17:90b:4c8c:: with SMTP id my12mr3952357pjb.50.1641386103420;
        Wed, 05 Jan 2022 04:35:03 -0800 (PST)
Received: from localhost.localdomain ([112.134.210.219])
        by smtp.gmail.com with ESMTPSA id l11sm12265291pfu.115.2022.01.05.04.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 04:35:03 -0800 (PST)
From: "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>
To: gregkh@linuxfoundation.org,
	fabioaiuto83@gmail.com,
	marcocesati@gmail.com,
	dan.carpenter@oracle.com,
	hdegoede@redhat.com
Cc: "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] rtl8723bs: fix memory leak error
Date: Wed,  5 Jan 2022 18:04:47 +0530
Message-Id: <20220105123447.24674-1-asha.16@itfac.mrt.ac.lk>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210830193355.11338-1-asha.16@itfac.mrt.ac.lk>
References: <20210830193355.11338-1-asha.16@itfac.mrt.ac.lk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Smatch reported memory leak bug in rtl8723b_FirmwareDownload function.
The problem is pFirmware memory is not released in 'release_fw1'.
Instead of redirecting to 'release_fw1', we can turn it into 'exit'
and free the memory.

Signed-off-by: F.A. SULAIMAN <asha.16@itfac.mrt.ac.lk>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index f1fc077ed29c..5f09b3ef9459 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -361,7 +361,7 @@ s32 rtl8723b_FirmwareDownload(struct adapter *padapter, bool  bUsedWoWLANFw)
 		netdev_emerg(padapter->pnetdev,
 			     "Firmware size:%u exceed %u\n",
 			     pFirmware->fw_length, FW_8723B_SIZE);
-		goto release_fw1;
+		goto exit;
 	}
 
 	pFirmwareBuf = pFirmware->fw_buffer_sz;
-- 
2.17.1

