Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822207B;
	Wed, 13 Apr 2022 18:24:00 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id md4so2828391pjb.4;
        Wed, 13 Apr 2022 11:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HoQCJ8QfyDNfr7xB85pGI0zk8szibK2lUEfKdH7JyLw=;
        b=WZP+4GanzmAAhWiXSsTgQkG9uQNhDV2PsPqIyo8C7NAcePk+n9x9JtQYJ5NNvuoutt
         xp/4vqKdDYUsr+8GqlAG6Cv0Kj3MM1+bTjadT0e5Ooe9tvQdj2xASH6NNtKO1zLNzMfI
         zUdJ18exN2a6uSE/QD1qLYO2KxLLoyfcDmIhrw4TA5FxyQnquAwv7QuWSnuy1h8mpuq4
         +LSbFI8vkydUmGO7LYHRrBP7LKOyHUtxB/DVNo9CMuRKoh2hfEDi1ldrNqwNGC7tTN+5
         HHf2oZmlNY1fGIpl0MxF6mrQeEFwXXbyuwi3OovEmu9YbSYAUzL7PKsfdJZKBdwQxztl
         Pdsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HoQCJ8QfyDNfr7xB85pGI0zk8szibK2lUEfKdH7JyLw=;
        b=QHRXFY1WtfEBMaQI0sqYz7MiyBxwkFRymey3acSOayzZ28iKLZkN4GmRCPekU85T5q
         0jnZaTT/dbTK2pk/bwA+ZuTHFVNm/cG7vfzUGO64WP+dnn2T/jYVRdpo4SckYbG3uN/a
         GZG0bwAudp3L4jkzue8O4e+XLUJ6vRLzL+Sb2qhzRvzD5l4gILCmdn7NjPqcvaKJCmFq
         bfxEmzEf2YwgG8jKA/7SSYOnCEBKZqm53K3JZJP55Dev1QBip6INehIDxdOeZBX1QomT
         +zySQ3m0f2MuuPfM+80FJuYslqcyGccK+TMD2CdsMFHtEnmR5cApqXFKfmvjny4x17+A
         n9tg==
X-Gm-Message-State: AOAM532iqA5YAGqXyhqC7k+8SCsFo8T9Y/4LM6dxHeBOegAD7pfMcqSI
	hnMDoPUsswinKYznT0mBdPM=
X-Google-Smtp-Source: ABdhPJzr2QFAawbNPkfnJ8J02Hrdh8sTGIEBPUeg6XWU7HhH27f0mLWl7ma1hW+mdSIphal3lsOjbQ==
X-Received: by 2002:a17:90b:3851:b0:1c7:d26:2294 with SMTP id nl17-20020a17090b385100b001c70d262294mr25117pjb.97.1649874239775;
        Wed, 13 Apr 2022 11:23:59 -0700 (PDT)
Received: from aliyaR-laptop.domain.name ([14.139.241.88])
        by smtp.googlemail.com with ESMTPSA id d4-20020a17090ad3c400b001c65ba76911sm3613252pjw.3.2022.04.13.11.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 11:23:59 -0700 (PDT)
From: Aliya Rahmani <aliyarahmani786@gmail.com>
To: florian.c.schilhabel@googlemail.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev,
	Aliya Rahmani <aliyarahmani786@gmail.com>
Subject: [PATCH] staging: rtl8712: Remove unnecessary parentheses
Date: Wed, 13 Apr 2022 23:53:04 +0530
Message-Id: <20220413182303.34807-1-aliyarahmani786@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant parentheses reported by checkpatch.

Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>
---
 drivers/staging/rtl8712/rtl871x_ioctl_set.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/rtl871x_ioctl_set.c b/drivers/staging/rtl8712/rtl871x_ioctl_set.c
index 603a3a48f952..34c9a52b4c42 100644
--- a/drivers/staging/rtl8712/rtl871x_ioctl_set.c
+++ b/drivers/staging/rtl8712/rtl871x_ioctl_set.c
@@ -75,7 +75,7 @@ static u8 do_join(struct _adapter *padapter)
 			 * acquired by caller...
 			 */
 			struct wlan_bssid_ex *pdev_network =
-				&(padapter->registrypriv.dev_network);
+				&padapter->registrypriv.dev_network;
 			pmlmepriv->fw_state = WIFI_ADHOC_MASTER_STATE;
 			pibss = padapter->registrypriv.dev_network.MacAddress;
 			memcpy(&pdev_network->Ssid,
-- 
2.25.1

