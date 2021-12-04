Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780722CA2
	for <linux-staging@lists.linux.dev>; Sat,  4 Dec 2021 00:34:45 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id z5so18448916edd.3
        for <linux-staging@lists.linux.dev>; Fri, 03 Dec 2021 16:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lrb4dejM62PcILwc0JnaQtpVY00TzngEYMl62VuFaVQ=;
        b=MNMh/4aPmTZN2oa04S2xiyz3v2sylXYSKmpJiOAXMMxrLDRpjWE2ZTofkA56li/YSe
         uOHADelxjhOsI7OAdi6GaCAhpXhWZjYH3O4ryJrY7Jobh6Q7g7BvyF6yQrYlQoSodOvM
         6fdIM/6S2qT94BF4fNAqInetUccxCkvae8853Fj5MPdfzv6ZIRWii/mRXAyhRT81nRLl
         1ieb5M3lJnPwgaiGriztM3nMLBOeAqxv8cIXlVFnwt/sTenGE2fUpQVVpFWLFM+BZKro
         L+TLSVfGEzHVs8VumBJ3qCGKcp3xKnOLOepvOfKx0TfaNj2Uu+x1gMdxYTRLatijX0iR
         cF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lrb4dejM62PcILwc0JnaQtpVY00TzngEYMl62VuFaVQ=;
        b=uskfMU6CE3uynalG1hZg47mqK+oI+0wB87truAsWfUKu+BSub3TUGuOCCbtgf9z+Pm
         qu/mTRWAPiwepy5ieMu7p2fYe4JR75WcJMRYqwcFJwM9tJdC0xuREzJ9QSA/2G0JE0vV
         a14BxIaXfumn3HUZZU3dt+xR80dZK/Nsy8miX34LRoeWEMOLmdkHbj/zTHx+xIAL+5Gt
         S8vgGxIoHwyO2O2V0Y92Bxbtsi3nh5i+T+a76tspWqa/JW5wu28cu+0hDT++I35X+uoH
         /RCzLnZCZK+uF6s1gUYnrIZVc1sQOYoKLAiM4K3yeebkT8x3GkSvA+W+ebJiVrt/f8aT
         3Nzw==
X-Gm-Message-State: AOAM530bqlfKKlvIn/Qx5Fx9VxOiTJBfD8gTA5YNKa5okX/jVVrVz5sK
	A6GQnnqat6qMXeb5hBGCFl0=
X-Google-Smtp-Source: ABdhPJwa/j6G63K81l3abOOuJc9zfYONpyPOwtxabooNBafb63TRxtesHWMAjX6+T6bimsNx5OFNAw==
X-Received: by 2002:a17:906:b01:: with SMTP id u1mr27043991ejg.504.1638578083848;
        Fri, 03 Dec 2021 16:34:43 -0800 (PST)
Received: from bulldog.fritz.box (host-79-17-112-183.retail.telecomitalia.it. [79.17.112.183])
        by smtp.gmail.com with ESMTPSA id hd15sm3058178ejc.69.2021.12.03.16.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 16:34:43 -0800 (PST)
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
Subject: [PATCH] staging: vt6655: refactor byMaxChannel to max_channel
Date: Sat,  4 Dec 2021 01:34:11 +0100
Message-Id: <20211204003414.3824745-1-alb3rt0.m3rciai@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace camelcase hungarian notated variable "byMaxChannel"
into linux kernel coding style equivalent variable "max_channel".

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/vt6655/device.h      | 2 +-
 drivers/staging/vt6655/device_main.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index 245f992e5a23..6ea4165e4929 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -201,7 +201,7 @@ struct vnt_private {
 	unsigned char byTopCCKBasicRate;
 
 	unsigned char byMinChannel;
-	unsigned char byMaxChannel;
+	unsigned char max_channel;
 
 	unsigned char preamble_type;
 	unsigned char byShortPreamble;
diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 37a82550ca82..313f0241d989 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -229,7 +229,7 @@ static void device_init_registers(struct vnt_private *priv)
 
 	/* Get Channel range */
 	priv->byMinChannel = 1;
-	priv->byMaxChannel = CB_MAX_CHANNEL;
+	priv->max_channel = CB_MAX_CHANNEL;
 
 	/* Get Antena */
 	byValue = SROMbyReadEmbedded(priv->port_offset, EEP_OFS_ANTENNA);
-- 
2.25.1

