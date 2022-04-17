Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686402567
	for <linux-staging@lists.linux.dev>; Sun, 17 Apr 2022 17:54:55 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id c6so15348392edn.8
        for <linux-staging@lists.linux.dev>; Sun, 17 Apr 2022 10:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7CAZCfRACh0L5o3iUpdS1aX8z+UWy3lXInDId0V/Oc4=;
        b=P6HUhtYl1uh3h+roOaxgoAowVSYFjUKLpP+tNwbfMmaT9O7ADedH873ebyC/gPrFIG
         RavjhCD3EO7rHHonqHjgXC+m/4rdPrBVHnFjjNx5pKTxLibdwLwHEYtiz7turkWP/iUk
         iTxZR4aC5QThAkLnlcjYA+PPM7wh7KI9VZj4uP+T4lFOndZ+Qt1erM21H/KlJSCiNFdn
         Ty4Ya1xVqmWRbhu+wHL4XZAPpCai2pq6RAiui2kBbaGUu7liQwSu9Frk8obyHCIjsH85
         rHYPSbADLbBhc1Z3umj4ElOTuUk+6ovVwHLkZKcIEY4Opm82svhm7khoYfH5Ool5T3h4
         An0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7CAZCfRACh0L5o3iUpdS1aX8z+UWy3lXInDId0V/Oc4=;
        b=t4VJmrS9ZM3Wio33soNOmVlwGq3s7ogMcVl1FzZRfi7WExexpGtjP+JQkewJeKyRLv
         i2N1pWMtK1yVhOPkUJSqbnvVNpjUQmd1nIt00zJSTYmiex/Rwi8wvK9kFH4/vF7ytaAv
         i4ofgaadQwfumbpD4XAhkN1oI507lDA8PbiDzW12rSxqVwQseUITfjSiogl6J/vFCQAS
         xuZVNFhJRPRMqMzTUrrBwgPwBmF/cWj3D0QEUTRD2yYept7yH7NTdLGXlFagI2zQ0n5x
         4++SJZLerZg5cX3ReKHZ+ef14B08/PQAH81tWuITV35I8LV5l39j5YNMKoibmyWcjw4O
         L56A==
X-Gm-Message-State: AOAM533UZN0OhKRcZr+pcdFcJEOG2CdNzlRWww9UJQBPDwKNE8OG1US5
	/ZShxqYq3hc0dyJyJ1qyyWU=
X-Google-Smtp-Source: ABdhPJx6nU4bE19M11BfvT5Na8Jb8dh8bqyxVsyfIfqyuMkAshwrYU63shKfcHtbPnlgtLi6asbS4Q==
X-Received: by 2002:a05:6402:1b07:b0:41d:7abf:8337 with SMTP id by7-20020a0564021b0700b0041d7abf8337mr8559736edb.185.1650218093803;
        Sun, 17 Apr 2022 10:54:53 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abba5.dynamic.kabel-deutschland.de. [95.90.187.165])
        by smtp.gmail.com with ESMTPSA id jw12-20020a17090776ac00b006e87137194esm3719409ejc.150.2022.04.17.10.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Apr 2022 10:54:53 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v4 8/8] staging: r8188eu: check firmware header existence before access
Date: Sun, 17 Apr 2022 19:54:41 +0200
Message-Id: <20220417175441.13830-9-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220417175441.13830-1-straube.linux@gmail.com>
References: <20220417175441.13830-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We should access the fields of fwhdr only if the check for firmware
header existence is true. Move the affected code into the if block
that checks firmware header existence.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v4:
- no changes

v3:
- no real changes,
  just the pr_info() -> pr_info_once() from patch 7/8 is different

v2:
- no changes

 drivers/staging/r8188eu/core/rtw_fw.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_fw.c b/drivers/staging/r8188eu/core/rtw_fw.c
index 7c0653bb3bbc..bf077876ed3d 100644
--- a/drivers/staging/r8188eu/core/rtw_fw.c
+++ b/drivers/staging/r8188eu/core/rtw_fw.c
@@ -256,14 +256,13 @@ int rtl8188e_firmware_download(struct adapter *padapter)
 	fw_data = dvobj->firmware.data;
 	fw_size = dvobj->firmware.size;
 
-	/*  To Check Fw header. Added by tynli. 2009.12.04. */
 	fwhdr = (struct rt_firmware_hdr *)dvobj->firmware.data;
 
-	pr_info_once("%sFirmware Version %d, SubVersion %d, Signature 0x%x\n",
-		     DRIVER_PREFIX, le16_to_cpu(fwhdr->version), fwhdr->subversion,
-		     le16_to_cpu(fwhdr->signature));
-
 	if (IS_FW_HEADER_EXIST(fwhdr)) {
+		pr_info_once("%sFirmware Version %d, SubVersion %d, Signature 0x%x\n",
+			     DRIVER_PREFIX, le16_to_cpu(fwhdr->version), fwhdr->subversion,
+			     le16_to_cpu(fwhdr->signature));
+
 		fw_data = fw_data + sizeof(struct rt_firmware_hdr);
 		fw_size = fw_size - sizeof(struct rt_firmware_hdr);
 	}
-- 
2.35.1

