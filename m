Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C076168
	for <linux-staging@lists.linux.dev>; Tue, 28 Dec 2021 10:17:52 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id lr15-20020a17090b4b8f00b001b19671cbebso16679512pjb.1
        for <linux-staging@lists.linux.dev>; Tue, 28 Dec 2021 02:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p/VayS/BsqiSiN6ukY1nlzS20RWmSqXpiNahjHrdYfs=;
        b=mqJ+zuSLjx9zZFj3oo94UbK16dt1vE8SMoRs/PTFjMm2aX9CfHxzezaOoGbQIN5dJH
         WjbuuCtbmOT90pqr6edA/FFjQIDcc5XhwtGHQg3nIaPTKksiWfwEz/JLDrvsuo0xGuRo
         +89fP6UocmvfqAA2HEguqblCZ7FlS8g0n1hrSv4i9Lzt5GwODQHzlzdP3jvy+J74t19C
         ThpoqXwqTKQqre/JyArMxgl9e2YxqjtstwPnNE3X6qiVt30AzAbvXKhk8/i+c7kW5HVo
         Z7il6hZpddGc7KDSupj8VfH6YmcZLyyUxd1e6r8Gd2plutgGU6Z38ttxnAjB03k5g/qO
         Cenw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p/VayS/BsqiSiN6ukY1nlzS20RWmSqXpiNahjHrdYfs=;
        b=idlqWTlfOnI7v7au2uHsau7qRnHRPU0hT82uFY+hYZGcUhu3yEEuIf0P1S4lBvJqUx
         joq/oesstv1kOBfe+pFEY8n+5Z943lNwMimEV0HNGTA1Bjk7tCimwgBkqlPoQ0dAjyxy
         RrSX4hNaMY2JA61AYz51CftTq8Uv7W87JogbbYBCREiwC9JrJxrmdr1g2XDOx6D1Dsp0
         4VTQ02dcuuQuN7oqmFt91YT3h5C4fQmXbEZiVWye+Nncc8kkGHs9awFfvuHgkj26U5Xb
         B96DxtEyGSi548Hw1Whl3hmlGrPq335r9pI6Vj7jACeUxG0g/+u4eb2lqiiu7leSzvsX
         cxFg==
X-Gm-Message-State: AOAM5304ci5AQu0+kHcU+Fsa0tw7aF2t9CXF70rjI7pnSbUl9uPvKs19
	zGmoujTv0ThXDAzJF+6DT7g=
X-Google-Smtp-Source: ABdhPJzMgkPnEDB3/JPDkBk1kIfG7elVB019OKw2Fkhr8+SouvbJ3YYsUFUWtQgjNV++iOu2zF4/Cg==
X-Received: by 2002:a17:90b:384f:: with SMTP id nl15mr14747235pjb.91.1640686671744;
        Tue, 28 Dec 2021 02:17:51 -0800 (PST)
Received: from localhost.localdomain ([103.230.148.190])
        by smtp.gmail.com with ESMTPSA id f7sm18795938pfe.71.2021.12.28.02.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Dec 2021 02:17:51 -0800 (PST)
From: Gautam Menghani <gautammenghani14@gmail.com>
To: nsaenz@kernel.org,
	gregkh@linuxfoundation.org,
	stefan.wahren@i2se.com,
	gascoar@gmail.com,
	ojaswin98@gmail.com
Cc: Gautam Menghani <gautammenghani14@gmail.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] Drivers : vc04_services : Remove repeated word in vchiq log warning 
Date: Tue, 28 Dec 2021 15:46:15 +0530
Message-Id: <20211228101615.5073-1-gautammenghani14@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In a log warning in vhciq code, the word 'count' is repeated twice. 
Remove repeated word 'count' from vhciq log warning.
This change has been suggested by checkpatch.pl

Signed-off-by: Gautam Menghani <gautammenghani14@gmail.com>
---
Changes in v2:
- Specify a description of why the patch is needed
- Write a more descriptive subject

 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index c650a32bcedf..6759a6261500 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1661,7 +1661,7 @@ vchiq_dump_service_use_state(struct vchiq_state *state)
 				  service_data[i].clientid, service_data[i].use_count,
 				  service_data[i].use_count ? nz : "");
 	}
-	vchiq_log_warning(vchiq_susp_log_level, "----- VCHIQ use count count %d", peer_count);
+	vchiq_log_warning(vchiq_susp_log_level, "----- VCHIQ use count %d", peer_count);
 	vchiq_log_warning(vchiq_susp_log_level, "--- Overall vchiq instance use count %d",
 			  vc_use_count);
 
-- 
2.25.1

