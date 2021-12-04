Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17172CA2
	for <linux-staging@lists.linux.dev>; Sat,  4 Dec 2021 00:41:13 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id v1so18184641edx.2
        for <linux-staging@lists.linux.dev>; Fri, 03 Dec 2021 16:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M3I4C4YUq1izmLBQSvsN84pqvyOl0SwNapJXdQ6Zcfg=;
        b=fk8fUfFKTqb8eEsJ2g0dy6rGLiOjZ0SzK7lQscTqB6z6PXqbzp4n4iApEzXwm/4Txx
         icQY/8vhH9AT1fXdSlCYacgg33ep+fAW8/HAXXubbST9QOqh7vwQgzN5fvWgvslwgq1l
         N8dCRvbc4+cdEbC2chZhzZWfjfg1JhdeLujaLwD1MAg382cn2/RcL3mahGC15tKnqtZm
         71AP4Tmh3jSDD7ZNbXgdQiKFaKs4IlOpa64lXEgQccgQe/tAtAkAyomyyT5y0nfQOAVX
         +zdF7lkGrtAJezLGlrwUgakAIppdbtSfNNS4BydjGmk81ULuhBWtm3pgjvKoHtXzWKbz
         rDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M3I4C4YUq1izmLBQSvsN84pqvyOl0SwNapJXdQ6Zcfg=;
        b=1sOe/jStgQjRpKn1XEt746EYDvifuHvUgkh0vehrJHfYEl7JLTREzZokVZKLKxyjMz
         aGdNlCvWXwMYL95F7+67oibl9cru24EfzjK9Z+bL6G0Ui6VjlKAUv7V5MjI7cqR0mqAS
         CN/P5R+WL1fEaxJ3Nna9tJz05YTMmWEPWJ7eyfgxxi3FPkzWdJIBVZYBZRunc1HfcoEV
         +0uLaW9gxwjTSj0TFyzbNuPu+BycvgyDpD/9CTfJIXjHJEPbaqtbcOhCrTEoSMOZ6ulJ
         2ADKx5b+2KVfgTacdqag2xeQswTx9Z+5NCvvHphFET3yB4jNayxKNDFlUckv8967l2a1
         a5aA==
X-Gm-Message-State: AOAM532XLKJEAHsOsxJKQ75oB+G3lAX7hwplkFv4XqF3gI4imVLcI8IL
	747QLDJMIfCoYt6kgDwBr/w=
X-Google-Smtp-Source: ABdhPJxrNqqWyIhGv7QNSuF4/CNZkxU7lf1uC8vo9Me6EcByVcUvRbXmXr9f7M5Z5QEkXUXuKgGj4g==
X-Received: by 2002:a05:6402:2686:: with SMTP id w6mr30860901edd.141.1638578472191;
        Fri, 03 Dec 2021 16:41:12 -0800 (PST)
Received: from bulldog.fritz.box (host-79-17-112-183.retail.telecomitalia.it. [79.17.112.183])
        by smtp.gmail.com with ESMTPSA id oz31sm2731858ejc.35.2021.12.03.16.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 16:41:11 -0800 (PST)
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: alb3rt0.m3rciai@gmail.com
Cc: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	=?UTF-8?q?Aldas=20Tara=C5=A1kevi=C4=8Dius?= <aldas60@gmail.com>,
	Karolina Drobnik <karolinadrobnik@gmail.com>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: vt6655: refactor byMinChannel to min_channel
Date: Sat,  4 Dec 2021 01:40:38 +0100
Message-Id: <20211204004041.3825744-1-alb3rt0.m3rciai@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace camelcase hungarian notated variable "byMinChannel"
into linux kernel coding style equivalent variable "min_channel".

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/vt6655/device.h      | 2 +-
 drivers/staging/vt6655/device_main.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index 6ea4165e4929..109d20a010ab 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -200,7 +200,7 @@ struct vnt_private {
 	unsigned char byTopOFDMBasicRate;
 	unsigned char byTopCCKBasicRate;
 
-	unsigned char byMinChannel;
+	unsigned char min_channel;
 	unsigned char max_channel;
 
 	unsigned char preamble_type;
diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 313f0241d989..4d92b5df5312 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -228,7 +228,7 @@ static void device_init_registers(struct vnt_private *priv)
 	spin_unlock_irqrestore(&priv->lock, flags);
 
 	/* Get Channel range */
-	priv->byMinChannel = 1;
+	priv->min_channel = 1;
 	priv->max_channel = CB_MAX_CHANNEL;
 
 	/* Get Antena */
-- 
2.25.1

