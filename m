Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E229B68
	for <linux-staging@lists.linux.dev>; Sat,  4 Dec 2021 10:16:08 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id e3so21846801edu.4
        for <linux-staging@lists.linux.dev>; Sat, 04 Dec 2021 02:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dN/oUTilGDj3oSXc/q4PkakZnOiuYdXeFtx+QhztwZA=;
        b=QZkgxOOa/GICNARrrQMFysa/639SFGfT5VLuY3Sr7X59mjlh7Zw79O+BHJAlPn73R0
         bT9wfgAYoCw+sqnqY+aZQTLXNbJwumTP9utTA0Az6kKhvEcWWLXcTFHtNxkmK7lgw9sN
         FXSVGX+DFAbS2ATE09pjoyTFuabtpkgNDclcqdDzWaKOkBvPKTUqNpXLtFOzXNRIJl3b
         r4jQNjjyMBIg5XrpE9+SwqQa06x2JcHURzndIvKT5cn43zWk/9mJT7QmOUvgSTVUovan
         mQ/9vx0NxzSTGUkR5xHNH/q0Tdk9Nmb0spYfustwtfTDRsPnyuRWvUL5dHEFtxvSZ7QL
         M0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dN/oUTilGDj3oSXc/q4PkakZnOiuYdXeFtx+QhztwZA=;
        b=sHtnWINwLDDYHQ7Xj/7cqKnK7668ExUDYETkXHJhu2v4ZuGkWdgofkYf+CBWp/GL4/
         4P6QNCrOwyJro6q7p71jubvkY4eZHwfhQPEi8gR6z1XB4cZhCv6l8pRIIsPR1yNv+kqm
         lIAAzPIOVMhf3tkrhLPeJB9exT0TwDu6Um3utUneXOzeYc4QE6WMZOQkG0Yvhssq9QpW
         2/c7tt8U5RtFU7CfoLXOnew1ZLD78DSLcQH3ktCnB5LVALLIIm+eOb25uiLF3r3GVeTk
         /aGUC4XJwtj35fkQ9xfQdBVp62kaF1VtKNRJwUaC+dqVTSJeLJYZ/nQadyaR07xRBdfe
         TbGA==
X-Gm-Message-State: AOAM5335i+cc6XMSaZBIgy8+DvgGjW2qmXV3KJIzV+6yjA4WUAgNVPjq
	PSxqi7EaopjEupI6dUhgUO8=
X-Google-Smtp-Source: ABdhPJwVLDiOANQkH4Ll5oiEzFwfCG34wXuP1nXwD1GDPPlHp5IGj+n4Tq50NJRFRjph8q1z78iINQ==
X-Received: by 2002:a17:906:d550:: with SMTP id cr16mr30655646ejc.544.1638612967289;
        Sat, 04 Dec 2021 02:16:07 -0800 (PST)
Received: from bulldog.fritz.box (host-79-17-112-183.retail.telecomitalia.it. [79.17.112.183])
        by smtp.gmail.com with ESMTPSA id d18sm3534450edj.23.2021.12.04.02.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Dec 2021 02:16:06 -0800 (PST)
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: alb3rt0.m3rciai@gmail.com
Cc: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Karolina Drobnik <karolinadrobnik@gmail.com>,
	=?UTF-8?q?Aldas=20Tara=C5=A1kevi=C4=8Dius?= <aldas60@gmail.com>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: vt6655: remove unused variable byMaxChannel
Date: Sat,  4 Dec 2021 11:15:28 +0100
Message-Id: <20211204101531.3924430-1-alb3rt0.m3rciai@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove set but not used variable byMaxChannel.

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/vt6655/device.h      | 1 -
 drivers/staging/vt6655/device_main.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index 245f992e5a23..bf2698056c55 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -201,7 +201,6 @@ struct vnt_private {
 	unsigned char byTopCCKBasicRate;
 
 	unsigned char byMinChannel;
-	unsigned char byMaxChannel;
 
 	unsigned char preamble_type;
 	unsigned char byShortPreamble;
diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 37a82550ca82..cf8d9a05734d 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -229,7 +229,6 @@ static void device_init_registers(struct vnt_private *priv)
 
 	/* Get Channel range */
 	priv->byMinChannel = 1;
-	priv->byMaxChannel = CB_MAX_CHANNEL;
 
 	/* Get Antena */
 	byValue = SROMbyReadEmbedded(priv->port_offset, EEP_OFS_ANTENNA);
-- 
2.25.1

