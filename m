Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0052CA0
	for <linux-staging@lists.linux.dev>; Wed, 22 Dec 2021 09:36:32 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id m1so1862389pfk.8
        for <linux-staging@lists.linux.dev>; Wed, 22 Dec 2021 01:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=sgwNBG2Cny1fVZO0hlT3ohe+sFdmqVc2UDvfjIkF6eM=;
        b=Gtw64aYKGZsQ+dMlQmcTSBpB89iTplIsqutgq9KDlrnM+hli46Z2Ro7tachGGxM7w4
         oUHUisn4R+tgsDxHmxWzg/LEExczh+vNBt6gBCVzH9qgcomJ4JklY7E38fQ+HmXH9HHc
         eg2Uwx83TBMqxyE0lJyNBg71kv7DbhicLgTHhAmTtGgukQa6l5rvw0p/aS98bodqL36y
         T3DVarvdhCMZjo+ddhF8fX7JF++uK//sTAFFRAMbLqv627qG2eQiwOzNM5TZeFFE+ITH
         MWRmvG4cCUo+5gxWrK3LbO7iNauV6aqEwHEn832cG6ta7EdEYLBuG1LmqJ4qRwlqTIqV
         iAsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=sgwNBG2Cny1fVZO0hlT3ohe+sFdmqVc2UDvfjIkF6eM=;
        b=FRgcGwI5bpLh+XhLV11J9zHGva0hErRwu8ZikKvizmnJ9dOBBEt4SLk7Nh2TImFLKm
         YsJZyk8xuGhiNFo12uno5j+UuA30C0OUvU9t+h5WaNiIXHZvh4LaPfRf5f0z7knJ5AVG
         ql09fihPcjGEU4mj2r7+EGfAsrdTWWdAcN6O6eL+70iRXLYAKjjs+kXOjajaHFly64el
         x1RYCZUM6HpvUFMKwRusrhW9NaYdcunrjAr5fu2KK6NSr0viyJTeioqV7DV3TEMIjmf+
         Kcr5q/F0tBjfMoZwjHF+XlbTdmmtvhPWftTh9IpArt2lMithFER3h200Nz/JrorpeAMG
         Wjzw==
X-Gm-Message-State: AOAM5337qTHYOsJQz8H7/SiCXadkNQ/+AzSn5FqsyVSnZXW2ZWa6AIrX
	vbJvTMym/6HSYJbW8pGABhk=
X-Google-Smtp-Source: ABdhPJyERfHYaADMDkqmMfs0w+6zK8q5UnftfZAI+ylhVVB8Anx7cAHpS4amJepVdBH9A76ZpOYUQQ==
X-Received: by 2002:aa7:8e52:0:b0:4a1:5820:d9cc with SMTP id d18-20020aa78e52000000b004a15820d9ccmr2060919pfr.49.1640165792078;
        Wed, 22 Dec 2021 01:36:32 -0800 (PST)
Received: from localhost.localdomain (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id s207sm1616088pgs.74.2021.12.22.01.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 01:36:31 -0800 (PST)
Date: Wed, 22 Dec 2021 22:36:26 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: gregkh@linuxfoundation.org, realwakka@gmail.com,
	paulo.miguel.almeida.rodenas@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: pi433: add comment to rx_lock mutex definition
Message-ID: <20211222093626.GA13332@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Checkpatch reports: CHECK: struct mutex definition without comment.
Fix this by documenting what rx_mutex struct is used for in pi433 driver.

Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
 drivers/staging/pi433/pi433_if.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index 29bd37669059..aa0ecb3788c6 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -92,6 +92,7 @@ struct pi433_device {
 	u32			rx_bytes_to_drop;
 	u32			rx_bytes_dropped;
 	unsigned int		rx_position;
+	/* rx read and config operations can only be served one at the time */
 	struct mutex		rx_lock;
 	wait_queue_head_t	rx_wait_queue;
 
-- 
2.25.4

