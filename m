Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6D52C9D
	for <linux-staging@lists.linux.dev>; Sat,  4 Dec 2021 10:31:29 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id x15so22090774edv.1
        for <linux-staging@lists.linux.dev>; Sat, 04 Dec 2021 02:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y3uS29sk8arDOYaFNgLSLpZuH9ffdqV+pSvuIUovPK4=;
        b=YhhQj9HCudkWRmnADXEgimSoMFYflHNMbKWLIpnxXt/cOosIWp50u8k/tsNa2N61Th
         sczVRRGRB8DyjTCj9Gh1GF3iXERAA7QekNlB9oahVr1a6PmDzofk5Hd7+PcNjobDvMqL
         G0dUFGZ4wIZoVUdAVKiBrjvyrkqa58ttP7X4HywxF8SLZj6Vq2sRUhNK9V7FrKoxO/VG
         IWVPjdfLAMLits9qP0J7NEZDp6oCaMd2z8pbMQjZFgZsyeiXhlOMWjB24jszIOMRmYeR
         IE7c8AuBZUYrW7CItlQzUezv6SQDe2cC3VwomQEEvdRl4Q+5Pux8ebq15Z6OoLHx8OfN
         Am1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y3uS29sk8arDOYaFNgLSLpZuH9ffdqV+pSvuIUovPK4=;
        b=4t1+JcNoexQPRAyPrX4Jw+4tXdhrtM7cXvu3I3xO/WPAnzV8dCDTaMSDKbRCAMhETD
         L+iEUMzNU4q1lZ7otJ9loTDpS6oM0U6OVjD6W44UbiHS38ZYmT0MKzkPUFTJOZuCfKjQ
         fSxZ9ec6HdbdYvi98q8hRlFsMQlN0wDbMDc4ltE82mLsU60LRK3b4MgNsikIRClp3Q6g
         Zi5fY7rBP/5jzN8n1zhyctMIyMQ7tauPBUyuPOvF4XrS3qpWO1JmRxR/4/+gwOT8YerT
         j4MmEWa9Z6MtWOqn/RZFmhd4tE5tXx/IdsYc/C0h68nSXMPR2wDfoMaGrrfRfKPoauGL
         PtsA==
X-Gm-Message-State: AOAM530iut8aZ9HQs8HCN045+2B6pEU3oZBCiE4kZYVxbV2xMosPwccQ
	l+VjeITKL4XYyCHo9mYVlTQ=
X-Google-Smtp-Source: ABdhPJz7rJ9I38MlIcRMZJyEReJY0j+1NmLLm+8pFNACCpSnaMORuCo37VnckADa1fJc8+GKULTl9Q==
X-Received: by 2002:a17:907:a40b:: with SMTP id sg11mr30013595ejc.534.1638613887907;
        Sat, 04 Dec 2021 02:31:27 -0800 (PST)
Received: from bulldog.fritz.box (host-79-17-112-183.retail.telecomitalia.it. [79.17.112.183])
        by smtp.gmail.com with ESMTPSA id bd12sm3499839edb.11.2021.12.04.02.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Dec 2021 02:31:27 -0800 (PST)
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: alb3rt0.m3rciai@gmail.com
Cc: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Karolina Drobnik <karolinadrobnik@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	=?UTF-8?q?Aldas=20Tara=C5=A1kevi=C4=8Dius?= <aldas60@gmail.com>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: vt6655: remove unused variable byMinChannel
Date: Sat,  4 Dec 2021 11:30:51 +0100
Message-Id: <20211204103053.3934783-1-alb3rt0.m3rciai@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove set but not used variable byMinChannel.

---
 drivers/staging/vt6655/device.h      | 1 -
 drivers/staging/vt6655/device_main.c | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index 9e5f060f3784..b2aee3b8bc8d 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -200,7 +200,6 @@ struct vnt_private {
 	unsigned char byTopOFDMBasicRate;
 	unsigned char byTopCCKBasicRate;
 
-	unsigned char byMinChannel;
 	unsigned char byMaxChannel;
 
 	unsigned char preamble_type;
diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 6c5140e29f6b..d008b22cb98a 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -227,8 +227,6 @@ static void device_init_registers(struct vnt_private *priv)
 
 	spin_unlock_irqrestore(&priv->lock, flags);
 
-	/* Get Channel range */
-	priv->byMinChannel = 1;
 	priv->byMaxChannel = CB_MAX_CHANNEL;
 
 	/* Get Antena */
-- 
2.25.1

