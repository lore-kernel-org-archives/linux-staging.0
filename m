Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DBBD2E5
	for <linux-staging@lists.linux.dev>; Sat, 26 Aug 2023 15:21:31 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3a85cc7304fso1391841b6e.1
        for <linux-staging@lists.linux.dev>; Sat, 26 Aug 2023 08:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693063291; x=1693668091;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hd7adZZYOTiFa760wWHbvro1iAu1WnMNCa9ih8fX4BY=;
        b=rIfVMQCJThxrfongc1TNXRgOCpwRWM5Y/NYtBN5JZETFs5eqaD03F7yoPgwSZa24sk
         OZhaJcG3CoHGlVv7t9FwJ3GO9hqz4tlmrySztdY9UQqitMFgTwF0n78h187Odv6rRvPP
         iN1VXUva6lSBtt+7FG8qq4QI44R7Spv0LdwDpWy8817HCS6oAlrREDumSpSKrfI3c8dS
         1WLmRz73M0WHo5usq1XyCAE883blLbLC9KAf8pzB6f15m4QfTyIIaD+JEoCT2svPeNlZ
         /SpQXz0RIgmTwoowd9Jf5erDA8uzo353IhLnVfD3EE4NZ/9qMacc+MjC+8ngVzn0xyJb
         nuHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693063291; x=1693668091;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hd7adZZYOTiFa760wWHbvro1iAu1WnMNCa9ih8fX4BY=;
        b=fLCSoL8EAGs3V/F5t/hoLrs4VjomnH/FGlIZHESpYjRIjdoqJ/N/QRk0FO4V6J2syq
         EIFnvldFOBYnl8vKgOMxkvL0HQap9P6Foec8yc94qTdYJM+jhbFY/TimzgfXzKL0KY1l
         TLg6hu3bueotF2VREep4zT6EWQz/ILRUp4g4eA1xr5A9Bs6+NZnDZFsWQvcwyBPKwze3
         2LIe9uL1ySscDg/MvWgpQw7PKbtCvR4o0E+guFWLzCDGpb9QcRLT8BjCJCv04eLNfIrE
         zFdjcFhB3nvuxu72NiMbjlLJVOnN9N8k6v/S8zp3UKkGDcTVsdj5IojuylKXQP7dK2My
         G2Yg==
X-Gm-Message-State: AOJu0Yzxb0N8w15HR+6OTziPwof8JBgnlQt+GkXHzJpygXkdG5sysswN
	23FaUlXKEq6oeEc3cmEspDI=
X-Google-Smtp-Source: AGHT+IGMBg02sEa4hS1aKKX+LM72sLA42B9wE6fuIYdZvvSb5r5V5/YYMKA0SV+5mK4w9Cu+YGvb+g==
X-Received: by 2002:aca:1716:0:b0:3a9:bc8d:42c3 with SMTP id j22-20020aca1716000000b003a9bc8d42c3mr1663122oii.50.1693063290941;
        Sat, 26 Aug 2023 08:21:30 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:82ea:8c7c:b784:3f92:988a])
        by smtp.gmail.com with ESMTPSA id q12-20020a056808200c00b003a89019d5fesm1780379oiw.51.2023.08.26.08.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 08:21:30 -0700 (PDT)
Date: Sat, 26 Aug 2023 12:21:25 -0300
From: Alexon Oliveira <alexondunkan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH v2 4/4] staging: vme_user: fix check unnecessary space after
 a cast in vme_fake.c
Message-ID: <ZOoYdRNn/XYbzKqU@alolivei-thinkpadt480s.gru.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed all CHECK: No space is necessary after a cast
as reported by checkpatch to adhere to the Linux kernel
coding-style guidelines.

Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>
---

Changes in v2:
- Fixed summary phrase with tags to indicate commit order
in the patch series, noted by Greg KH

 drivers/staging/vme_user/vme_fake.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index 4258ed6033e7..4ccb16dd0d0b 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -95,7 +95,7 @@ static void fake_VIRQ_tasklet(unsigned long data)
 	struct vme_bridge *fake_bridge;
 	struct fake_driver *bridge;
 
-	fake_bridge = (struct vme_bridge *) data;
+	fake_bridge = (struct vme_bridge *)data;
 	bridge = fake_bridge->driver_priv;
 
 	vme_irq_handler(fake_bridge, bridge->int_level, bridge->int_statid);
@@ -1092,7 +1092,7 @@ static int __init fake_init(void)
 	mutex_init(&fake_device->vme_int);
 	mutex_init(&fake_bridge->irq_mtx);
 	tasklet_init(&fake_device->int_tasklet, fake_VIRQ_tasklet,
-		     (unsigned long) fake_bridge);
+		     (unsigned long)fake_bridge);
 
 	strcpy(fake_bridge->name, driver_name);
 
-- 
2.41.0

