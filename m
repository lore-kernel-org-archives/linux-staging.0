Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36642CA2
	for <linux-staging@lists.linux.dev>; Fri,  3 Dec 2021 20:15:35 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id o20so16096526eds.10
        for <linux-staging@lists.linux.dev>; Fri, 03 Dec 2021 12:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VQxJrVTwbMTGbpX2IL1FtoxqI0v6WcmxBcnCNhy3JLg=;
        b=O6d5Nr2jRIyqNqykxET77UEBjoNyYpFtwDUhP2OruMwVVe+i+xW53aPAmq203c5K9F
         nZzb+CjQECUqeFbxwDa9ZI9ovnczmvkZElrYTLGUbXskqkwqhjjMW2sNuB0ztHLLDYrF
         YSAsWjV0wOuz4tZuHssk/2ELuKmvQAzaPsLgQdLtKSkm0YZeP22HHcw0WXU7kH4jN4S/
         1EDIl5qJTHM1vfnKWBmmD5YCs1w5/NkngNgeZPWv0rjUtXPamRdViTRR5FfzHN15qKGi
         DQNjZU+V1O68N0N+JYkRHeTkqWAMcbFglol4sx06w9NNA6AOm4yAVVbX7Q/rc2c8fmf5
         uTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VQxJrVTwbMTGbpX2IL1FtoxqI0v6WcmxBcnCNhy3JLg=;
        b=5jnYOEpjDlqvu1G2PuGQirFYXOdg4UcctWdw7vHxW/oG2KRP6pC8FqVTD9QgPNVx4u
         R6aX/lPvduZMx+6zpuqzDagOTRHOZxWrinbDxH/QJ4ZOuPfkYEutWNj7zKJmPiqbtjuP
         Ev4L7Rgi7mpRo2uOn+FxwkwBB98pPzAnT073LgXLZo/qH5kTu1q1//P66Ex5DRUh9Z2s
         P/J/lQstQ6FvfTkYCFkEyuFARiriYgfiMXWfYRUuSjEKb0RVYR5bbwd36YfWQCJ7UoBU
         VHtOLDMkkzitnA48WmxrNFDC//NPn/jPlWOAYlyFO2NCl+AFWQd/jQIXyskWsnJXLCGi
         x79w==
X-Gm-Message-State: AOAM5325gEncBTtMwXlHobiKTvfiTv8EHD2wehG+blIGB/43EjZg9aC2
	p4Ei3YNME+KzgVYDTNMg6VU=
X-Google-Smtp-Source: ABdhPJxg/LxdAuOc59AIBf3PuXEtoIypdxhEGZK8tOMoI36L9KU5dWC1O//4bdcItkDzsthtuFq2WA==
X-Received: by 2002:a17:906:d54d:: with SMTP id cr13mr25768242ejc.72.1638562534177;
        Fri, 03 Dec 2021 12:15:34 -0800 (PST)
Received: from bulldog.fritz.box (host-79-17-112-183.retail.telecomitalia.it. [79.17.112.183])
        by smtp.gmail.com with ESMTPSA id j4sm2495133edk.64.2021.12.03.12.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 12:15:33 -0800 (PST)
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: alb3rt0.m3rciai@gmail.com
Cc: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	=?UTF-8?q?Aldas=20Tara=C5=A1kevi=C4=8Dius?= <aldas60@gmail.com>,
	Karolina Drobnik <karolinadrobnik@gmail.com>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] [PATCH] staging: vt6655: refactor byRadioCtl to radio_ctl
Date: Fri,  3 Dec 2021 21:14:50 +0100
Message-Id: <20211203201452.3806090-1-alb3rt0.m3rciai@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace camelcase hungarian notated variable "byRadioCtl"
into linux kernel coding style equivalent variable "hw_radio_off".

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
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

