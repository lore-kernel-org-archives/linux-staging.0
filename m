Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D682CA2
	for <linux-staging@lists.linux.dev>; Fri,  3 Dec 2021 20:26:38 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id e3so16300822edu.4
        for <linux-staging@lists.linux.dev>; Fri, 03 Dec 2021 12:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9zHipByrsNK0qk+HHU/d1JXlrjGn7rcQqoiAh21t8ds=;
        b=l4GFWECq5qmLbXfAQOX7iJRHDEu8A/P7w2MnzLbhUBogNlo+L0tRrDzsmS0j5uyqmO
         gVHVezGFR8CSnsNtrak01SKfgQeC0Ez3kpnW5QVeJpd5QVvloDPryeyiCA4aFXLoA2Tw
         /mS4mw0/sMSeGlioDD6+qtkZKkaniX6ZrqQHlvci42OLT51SISgrhBQM5IcoqfXReJAD
         L5iWDSMDJGmvmeXvtVOvxhZeTXihp1vl7g35jwuN7081aAhnYSicvpmr6sc9pK3cECbX
         FYpR2rUeELm7oW2k7P/YmlQZSnRbyUhRgJKfGvsqfLwmginIVSeT7mKm8lZUpsS5vgqL
         Wk2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9zHipByrsNK0qk+HHU/d1JXlrjGn7rcQqoiAh21t8ds=;
        b=PJ3F9RhSgB11kpordnJqXZyracIttsYkNS6aMs8sRKSv9jdRgBTtHD9VKPAeHTn4Jp
         WPXJJ5VmB0/hsH7WKS3XjeexTaInhwHkudBfJOCPDA5SLjTRzuZl14EzAO/46kRNNtWK
         Gs7hl0vl47WsZcjdAA3O85H+DddoERA1l/2Jhx8+Fcr/eCs07OgIZmANUVAdGeZt6QCw
         EBPFP0LSeY+eUcEzrVfx8LkljP+8zCbEE50uilYeGgjWaLz5CJGNnV9dmOi0pSMoXINS
         yJvXu00RH2VWZVKQAiJoftF5nbVhS3ehgS8wYbVhqOSpciz/HOPK7e7BkTdGnOiMnkJs
         NxqA==
X-Gm-Message-State: AOAM531ynworaj9OL8U2SmKoH3BrCw6GaOGYjSFq8oZDfLI0ePGJlJ4y
	FwLSW7lG9FLG/YIThVHj/1c=
X-Google-Smtp-Source: ABdhPJyp8uxqvwbPQ9viHB/F27DeLB2IJdAOVMZJ4dToWRGr/Qj8cDyyU6h0h2neBEwXNS6FncBy7A==
X-Received: by 2002:a05:6402:3596:: with SMTP id y22mr29793203edc.297.1638563196598;
        Fri, 03 Dec 2021 12:26:36 -0800 (PST)
Received: from bulldog.fritz.box (host-79-17-112-183.retail.telecomitalia.it. [79.17.112.183])
        by smtp.gmail.com with ESMTPSA id f17sm2596547edq.39.2021.12.03.12.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 12:26:36 -0800 (PST)
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: alb3rt0.m3rciai@gmail.com
Cc: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	=?UTF-8?q?Aldas=20Tara=C5=A1kevi=C4=8Dius?= <aldas60@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Karolina Drobnik <karolinadrobnik@gmail.com>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] staging: vt6655: refactor byRadioCtl to radio_ctl
Date: Fri,  3 Dec 2021 21:24:06 +0100
Message-Id: <20211203202410.3807147-1-alb3rt0.m3rciai@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace camelcase hungarian notated variable "byRadioCtl"
into linux kernel coding style equivalent variable "radio_ctl".

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---

v2 -> v3
- replace typo inside mail message body
v1 -> v2
- Correct mail subject

 drivers/staging/vt6655/device.h      | 2 +-
 drivers/staging/vt6655/device_main.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index c51eba94230d..245f992e5a23 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -227,7 +227,7 @@ struct vnt_private {
 	bool bPWBitOn;
 
 	/* GPIO Radio Control */
-	unsigned char byRadioCtl;
+	unsigned char radio_ctl;
 	unsigned char byGPIO;
 	bool hw_radio_off;
 	bool bPrvActive4RadioOFF;
diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 897d70cf32b8..37a82550ca82 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -371,18 +371,18 @@ static void device_init_registers(struct vnt_private *priv)
 
 	priv->radio_off = false;
 
-	priv->byRadioCtl = SROMbyReadEmbedded(priv->port_offset,
+	priv->radio_ctl = SROMbyReadEmbedded(priv->port_offset,
 					      EEP_OFS_RADIOCTL);
 	priv->hw_radio_off = false;
 
-	if (priv->byRadioCtl & EEP_RADIOCTL_ENABLE) {
+	if (priv->radio_ctl & EEP_RADIOCTL_ENABLE) {
 		/* Get GPIO */
 		MACvGPIOIn(priv->port_offset, &priv->byGPIO);
 
 		if (((priv->byGPIO & GPIO0_DATA) &&
-		     !(priv->byRadioCtl & EEP_RADIOCTL_INV)) ||
+		     !(priv->radio_ctl & EEP_RADIOCTL_INV)) ||
 		     (!(priv->byGPIO & GPIO0_DATA) &&
-		     (priv->byRadioCtl & EEP_RADIOCTL_INV)))
+		     (priv->radio_ctl & EEP_RADIOCTL_INV)))
 			priv->hw_radio_off = true;
 	}
 
-- 
2.25.1

