Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF1AA922
	for <linux-staging@lists.linux.dev>; Tue, 31 Jan 2023 18:14:42 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id dr8so22589943ejc.12
        for <linux-staging@lists.linux.dev>; Tue, 31 Jan 2023 10:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oBUJW5g0l7Cow1aZueI6QMIdh34q+4xeYl6ay0vZEdY=;
        b=ooUIqV1qOuf4L+JepERD12vmqc21GEhVvlFh8Kk/YMuX5rl/Emj5/KdJvys6lyRWPw
         KfA1VwfDQ+wdIW+wW7m8Aqd7YRGb4DE3UNTqsLa0sIVKR4/YOHpj9x5s3FrZxHJWvTaZ
         Dz7fuyyxHPYNQC37otjMILneEAZY92edcJhHaNyF/vn4BQgm28GhsVLQY20ZZq1GSUFJ
         R2vMXoQFwffwTr7347LV/UTAX9dr3A1p3Np5bwOIcNaf1U6B4sXd49Si+1P8sl+BeIiI
         c6zjTGW3x0uWfQXNeimNq6IJKSoAwV4RZOAa4dbg6xWbEN/EWmleGKrRcUU+ZnYRF+aO
         BSeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oBUJW5g0l7Cow1aZueI6QMIdh34q+4xeYl6ay0vZEdY=;
        b=pcA2okEHJ+xKcpK123V4A2NzULHAJX9EMzvPo5Zogy5KvDdgng/0wgXqSDKmhD4kpV
         RhH+zBgu9OCRZdu+Fyn7XIRTsHWzGEsj5vL7GZE6eY6oE/hRXsXnSimCHN5kbduPT0ME
         ZNTBhE0kPrq2ysnnjg3MpOQml5WjsshJDJgASFP+uuPo/w3p5rR9oEGEvoAjHBR2EkAk
         Al6eQCtLfCxtj9x5+x2TN+35Qk6L9AH/Iqkf619fLytyW4Zs26wwFwWi0+DapVblrUKG
         WQ8I4LsUfwLyyE5TPikpPlhvMUCP+EOoIq0IM+A7n8aEFQiESSiutz3Kv7p6YUZdR/n9
         Lj4Q==
X-Gm-Message-State: AO0yUKX+dKHiAIIlZKMw2NVQ0XFNvwejyb5AFPLM2uNuKT7EhnilqSmb
	gTrrPdZVunpJcQRoN6Smlprd8UGVMfs=
X-Google-Smtp-Source: AK7set/Fm2STpfkzkeO2bN2CrWnDnnHCG4vOw5APB3JNA3oxaU0Bf8XyZTdFJzyYYgRCvlzNO3jmFA==
X-Received: by 2002:a17:907:c282:b0:878:509f:798d with SMTP id tk2-20020a170907c28200b00878509f798dmr26429055ejc.0.1675188881209;
        Tue, 31 Jan 2023 10:14:41 -0800 (PST)
Received: from combine-ThinkPad-S1-Yoga (gw.combine.ideon.se. [85.235.7.115])
        by smtp.gmail.com with ESMTPSA id 7-20020a170906318700b00888f92f0708sm3370998ejy.15.2023.01.31.10.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 10:14:40 -0800 (PST)
Date: Tue, 31 Jan 2023 19:14:39 +0100
From: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: pi433: Added information about bit_rate
 configuration
Message-ID: <Y9laj+z0TuasBRx5@combine-ThinkPad-S1-Yoga>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Information in the TODO file for bit_rate configuration is
insufficient.

This patch adds information on how to approach when considering
to modify bit_rate to support upto 300kbps.

Signed-off-by: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
---
 drivers/staging/pi433/TODO | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/pi433/TODO b/drivers/staging/pi433/TODO
index 5cf3fd99d521..daa0dbcf6d53 100644
--- a/drivers/staging/pi433/TODO
+++ b/drivers/staging/pi433/TODO
@@ -3,3 +3,6 @@
 * Some missing data (marked with ###) needs to be added in the documentation
 * Change (struct pi433_tx_cfg)->bit_rate to be a u32 so that we can support
     bit rates up to 300kbps per the spec.
+  -> This configuration needs to be moved to sysfs instead of being done through
+     IOCTL. Goind forward, we need to port userspace tools to use sysfs instead
+     of IOCTL and then we would delete IOCTL.
-- 
2.34.1


-- 
Thanks & Regards,
Guru
