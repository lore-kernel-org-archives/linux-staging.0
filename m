Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DFF3C13
	for <linux-staging@lists.linux.dev>; Mon, 30 Jan 2023 16:05:55 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id e8-20020a17090a9a8800b0022c387f0f93so10882602pjp.3
        for <linux-staging@lists.linux.dev>; Mon, 30 Jan 2023 08:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KokH30JDIzxDGaC1x+0b+EMKCAN6MSlfv0P938jyASo=;
        b=JtfOkSxZfDZm4S7o3ReKBPP2gH7CTGGiycUmiZEsoBYBlsU9iWnCjdi+VZ3fRobB7Y
         3ytA+ttCMYG+VKcVqCBdR2nSZ5Xl93ErG6hgbKlkjcRNAmC0zFhoXiyVspUA8w3snrlV
         Pa/HwJrakSfwVd7/J80ChZzaQENwC/IMDHXOKncd4mkt6q8fkYhjzlaCfgwPALitYXIV
         rl8irG2a1K82+X0qeMbGdyH2nlOqTOIsxvAmxa0p6FusS+1Go2h/43KFSxKKrhnUA2YG
         Ib2jX+1MgWBEFb2bt2cR+Ron1Tg1GFIBH1VSlaE811pKMiS3/VVIOttSA5zQLaEdzP4V
         muLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KokH30JDIzxDGaC1x+0b+EMKCAN6MSlfv0P938jyASo=;
        b=onxzVvtZyq+Hk8OKLY4iEo7D031rx34+1xNzMWUsQLv4hbQzeGvLfnTfuJlLpYol/B
         j6PAdZJyB2I8ciejVsCPoQpqfAWRlpZz0rVTFSiJ0xoInvTu0zSwk2+FSnWl848VQJKl
         o2Ei1j5pFYlBvU04AQ3IFJzYPe5RWr7WG12bbAKD1iPu6iDtOkP7QJYEDJAg4Vcafoe9
         nruXuiHtyyH2diOgY9AEcGBWUueplR4ZGCCAasnkoz19tNfSl+Czuc3Nje8wgAB0JaId
         Q+PWMnBuG4l4HUXN9NCMm2FBibowaRqTdic6e0rflMbjczPAqI/L8p0Rvc+VQ4nK8IEo
         /8bw==
X-Gm-Message-State: AFqh2krPcxIufIWnLxRK78rBLoBBUXHOqSt9vo9tdnz134RM5c3o7ErS
	spmO3jKUt08hIrmiWizEciU=
X-Google-Smtp-Source: AMrXdXseh+XsMJ9zxICqoRbtz6thohANB0jPakj0GX6bXwOACgZOdu96RTSQOxtoEpw7p5pZNYWGeQ==
X-Received: by 2002:a17:902:8c94:b0:193:ab5:39c7 with SMTP id t20-20020a1709028c9400b001930ab539c7mr47506462plo.11.1675094754867;
        Mon, 30 Jan 2023 08:05:54 -0800 (PST)
Received: from localhost.localdomain ([112.212.226.173])
        by smtp.gmail.com with ESMTPSA id e3-20020a17090301c300b00177faf558b5sm7974224plh.250.2023.01.30.08.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 08:05:54 -0800 (PST)
From: Jongwoo Han <jongwooo.han@gmail.com>
To: f.fainelli@gmail.com,
	bcm-kernel-feedback-list@broadcom.com,
	gregkh@linuxfoundation.org,
	jongwooo.han@gmail.com
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] vc04_services: mmal-vchiq: fix typo in comment
Date: Tue, 31 Jan 2023 01:05:48 +0900
Message-Id: <20230130160548.45879-1-jongwooo.han@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct typo from 'witin' to 'within' in comment.

Signed-off-by: Jongwoo Han <jongwooo.han@gmail.com>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 294b184d4..e318f3609 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -245,7 +245,7 @@ static void event_to_host_cb(struct vchiq_mmal_instance *instance,
 /* workqueue scheduled callback
  *
  * we do this because it is important we do not call any other vchiq
- * sync calls from witin the message delivery thread
+ * sync calls from within the message delivery thread
  */
 static void buffer_work_cb(struct work_struct *work)
 {
-- 
2.34.1

