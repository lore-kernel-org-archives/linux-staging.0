Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0688493;
	Fri, 10 Mar 2023 17:09:51 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id f11so5683861wrv.8;
        Fri, 10 Mar 2023 09:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678468190;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zOiwuqcweU7+YHTRApQGtYui62Ok/Rws6N1HxOxsdlQ=;
        b=RdaB5Uqq59Xixi3DPF5AMfpPhk5fNLSJ/FglPJkO9jLtEajpmmlxzJqv/W9K6DLaK/
         VdWxCbx27GOEB1fRBtkFFCqkoXc0jaygnLu2f4dSQtqxhvV8NKZXibqSh9rpryXS8Ave
         Sa3jnLX4uDjoDjrz9yFXu4JuZh2FFSQDTs8oW3oX8YOFG2cGy7PYQoFcF8NGXnoaCz1A
         4SOIyKRWt5r0ra1NjuzKtkDJkd0tNxkvhyXEtO4RdrPU1ZYnhOC+yqZ9u1rhhKhGVLlu
         LiZvwq1xfsIjj32euc/aJ9wP8szSMCJ3VgNk3W+SsvN/8D914To8acxCJOtsfz3UUmBN
         37sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678468190;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zOiwuqcweU7+YHTRApQGtYui62Ok/Rws6N1HxOxsdlQ=;
        b=B/23PXeUqR9ydz85QLxuMENr1S+iS2MPp/JCdBu5/y+O+rhc7IQ7SPznCoW+zfkKrl
         N6Tl/wU4uETRDb8Ye1tS9YKEnjGGkWRPBjyEWdmruowWi3+oCvKcr0gM+Hk2A0W/RbgQ
         A5/lHGSY0+N0nN3FvDVi38X/QOyzaTJdYZL09QRaPLSqTgFZZSVUETxOazBO37O3oWFL
         vb7qcr4zZq+DZsCQyQGv8fL3ZEQdjufNVxejszZHjZfUeNVFQwB+A7+KzpQNBzmW2RM7
         iJdu+jtgoSXB6Swfus9dXi79yteotkp50vofBciUidrTfWSRy+lTU7Y8RSg8J/xselfq
         IIaA==
X-Gm-Message-State: AO0yUKUYwiwC9rqcRyFzz73vAai4ks9W2+jXiJzz2lx+nHIT6uom5cQx
	LvQWf1OLxgfhOnL7npcu6Sc=
X-Google-Smtp-Source: AK7set/qo9y995l0QcIe7XINy9Xw7krXxPILJgQz4xXeZK2SqGcv8FKDtcu7qBUOcBqEv/Q2ioVh7w==
X-Received: by 2002:a5d:452b:0:b0:2c7:56b:863 with SMTP id j11-20020a5d452b000000b002c7056b0863mr18430570wra.10.1678468190085;
        Fri, 10 Mar 2023 09:09:50 -0800 (PST)
Received: from khadija-virtual-machine ([39.41.45.115])
        by smtp.gmail.com with ESMTPSA id c17-20020adffb11000000b002c592535839sm294581wrr.17.2023.03.10.09.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 09:09:49 -0800 (PST)
Date: Fri, 10 Mar 2023 22:09:47 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: greybus: fix exceeds line length
Message-ID: <ZAtkW6g6DwPg/pDp@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Length of line 182 exceeds 100 columns in file
drivers/staging/grebus/arche-platform.c, fix by removing tabs from the
line.

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/greybus/arche-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index fcbd5f71eff2..0f0fbc263f8a 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -179,7 +179,7 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
 				if (arche_pdata->wake_detect_state !=
 						WD_STATE_COLDBOOT_START) {
 					arche_platform_set_wake_detect_state(arche_pdata,
-									     WD_STATE_COLDBOOT_TRIG);
+						WD_STATE_COLDBOOT_TRIG);
 					spin_unlock_irqrestore(&arche_pdata->wake_lock,
 							       flags);
 					return IRQ_WAKE_THREAD;
-- 
2.34.1

