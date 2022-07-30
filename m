Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABD61FB8
	for <linux-staging@lists.linux.dev>; Sat, 30 Jul 2022 01:27:30 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id z19so5999053plb.1
        for <linux-staging@lists.linux.dev>; Fri, 29 Jul 2022 18:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jn4/LA7fxNt8iXGVssrYM+dajHtnWZvbUaOvrA1fJlQ=;
        b=UherdjpeAiGSg3iy6gWENoRuu+eJVyt1yoSXDWVcALTCxNeCo9woucCva3GKjeCZGc
         04mhRO9LuBK1m0Qur0gZE0zICckc0O0sVmn1pqdBybPI1oxHYTA42TYjTXAISgp4itEY
         8A3JXLb9igc9E/SfMD8ZGmzbjDL23OXQU5ms7CFqSsSqjvTK9KatpPkrnpD0S6DvK6Je
         qFg6iRtDxeTHR9yxylPrOh/Y9iE1HJpdU4TtQs/Fttyxq6c70qlIDUkBgoiyD57iBtlI
         BYZGksjyQV0LW7yP6iHYnEC9qkifgGQDYZ4bE3o6fqx5IJvVvs7f2rmDM7NKdpK5uTMw
         wE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jn4/LA7fxNt8iXGVssrYM+dajHtnWZvbUaOvrA1fJlQ=;
        b=7Is9fQwFz9Fk69qYer6Rqwt8Zk9wdow1/+w4HEPNItg2GaTD+FrsMdkcbZa/PHb0Zw
         mUtP8DlPl02YYMWLw5Lordi0hpH2F4CTjPCNKnOAXB1YMrQGt0t76myfe1Ov+hs/hjb3
         b8q8W9MzqER+uBiX5QGp5cfT7Jc668NWWe0ZOdVHLa6eJ22Cdjs4RbEp8Izz0ASMHDlG
         z3Ccyyl/HPtI6+yJCjL+do6TX06WIuaW4FMWT7bJIGI8He20dXPOH1yNd9zZY5/PJ0Ev
         roVztZi9xd0M83Q/dI608LzRnfjYPc8sunsggmjJtk/VgjsiMr9VliPPB54sWXQQDl5j
         ABMw==
X-Gm-Message-State: ACgBeo2ADkCWfdlvf5Sfu9W7P0AqUqR7P/Ze4WuVXPaAwBptyBCETFBT
	K9sXuJk6oUqpvWlAF0jWT3I=
X-Google-Smtp-Source: AA6agR7JDXm24wIBhiFmWsY1Z8pdIth3ZJyCwhmhZ3BrwBim+03Up78YuCPWc7TOoQPnbxX/3428cA==
X-Received: by 2002:a17:90b:3c4a:b0:1f2:205d:dbac with SMTP id pm10-20020a17090b3c4a00b001f2205ddbacmr7012517pjb.110.1659144450067;
        Fri, 29 Jul 2022 18:27:30 -0700 (PDT)
Received: from localhost.localdomain ([175.195.128.78])
        by smtp.gmail.com with ESMTPSA id m9-20020a17090a414900b001f251948ad6sm6518255pjg.35.2022.07.29.18.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 18:27:29 -0700 (PDT)
From: Sidong Yang <realwakka@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
Cc: Sidong Yang <realwakka@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: pi433: fix wrong debug message on rf69_write_fifo()
Date: Sat, 30 Jul 2022 02:27:24 +0100
Message-Id: <20220730012724.1138-1-realwakka@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The debug message should describe error when user calls rf69_write_fifo()
not rf69_write_fifo().

Signed-off-by: Sidong Yang <realwakka@gmail.com>
---
 drivers/staging/pi433/rf69.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
index 659c8c1b38fd..8c7fab6a46bb 100644
--- a/drivers/staging/pi433/rf69.c
+++ b/drivers/staging/pi433/rf69.c
@@ -816,7 +816,7 @@ int rf69_write_fifo(struct spi_device *spi, u8 *buffer, unsigned int size)
 
 	if (size > FIFO_SIZE) {
 		dev_dbg(&spi->dev,
-			"read fifo: passed in buffer bigger then internal buffer\n");
+			"write fifo: passed in buffer bigger then internal buffer\n");
 		return -EMSGSIZE;
 	}
 
-- 
2.30.2

