Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EDC4C84
	for <linux-staging@lists.linux.dev>; Thu, 15 Sep 2022 20:29:58 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id l14so44733803eja.7
        for <linux-staging@lists.linux.dev>; Thu, 15 Sep 2022 13:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=v1YzXJ4RvumAwk7bF6dhyR+VAPv7fcA5m5FBuJy0qIY=;
        b=qPH+EslmJox4jB/AYeCJVyO2sQGqb2P7YW0rUcwI0rqV6lVGQ0zsfxckTccO+35RwJ
         D54NAIXUhnx7L7+nGaVxxv/YcyCGx7zWRSQX/OQmQEcBb/zUyF/9gMZQnD1kvz9iOf/3
         QU7WSvojdZ4m9nGT/BwQC6Ccxci9CIg29PqKNyiwXxKVXkJOrYCS2ulm0PvBVxsqN+1c
         7cPXwm05Gr27KWuIEnv4VON0gniO/kzAXrAI3Q95bZyjILHTlvunb/22gFl3YPJ1mrfR
         uMV2GjSbArOlKqR2BEweVwf76cVk3ig9sQ1CH3tXZv4JnX8gTJMf7xlfdIaG6w7HJa9p
         lV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=v1YzXJ4RvumAwk7bF6dhyR+VAPv7fcA5m5FBuJy0qIY=;
        b=ArvxkWWd5flRJAC7MmiBx2YYLX310z6kMPZPpcLpGmeOEx16chu2pXmd3gv+Ps7aiC
         yONzGmXo+aLUl8XTmnoybRftYGJPXeH9Nx1SncIuNhGLgRdLCJQveNYP8K+9SLz3jWXf
         cnBmejYg9uyMNzilcj/tMYAv3Xvqp+kCWih1qP3cJTZajFarlaWWULSjQQDUO8UoofRw
         nR2yYRI1g5IrpHpDX9cgIpsIhlfq+rudcqa0wHf1ajIOQIA67wXaNpOgQ05DXscp73Ls
         UHpIBqbhrB6gIv43rFK8iDNMJyrptl8oQQYlNJrLSS1vnaQs4KKZgRYI3egr7gJnFxEc
         /UwQ==
X-Gm-Message-State: ACrzQf0TtZnL0uEYt9JQbH2Q60nR9nTC4JusuC3+AYezGok0GUvsbhqO
	T9PJgtAMPfmBzyd48TyOE24=
X-Google-Smtp-Source: AMsMyM7mkHT26n8JwF9D9Gn8feUc/Kvkri9ZB0b/ZgqMXdfMsg8jMzESijFS1oWsnlJuXB6RvCrfRA==
X-Received: by 2002:a17:906:ee86:b0:741:89bc:27a1 with SMTP id wt6-20020a170906ee8600b0074189bc27a1mr1133421ejb.725.1663273796925;
        Thu, 15 Sep 2022 13:29:56 -0700 (PDT)
Received: from localhost.localdomain (ip-217-105-46-43.ip.prioritytelecom.net. [217.105.46.43])
        by smtp.gmail.com with ESMTPSA id ci25-20020a170906c35900b0072b3406e9c2sm9607295ejb.95.2022.09.15.13.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 13:29:56 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: forest@alittletooquiet.net,
	gregkh@linuxfoundation.org
Cc: namcaov@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [RFC PATCH 1/5] staging: vt6655: remove redundant if condition
Date: Thu, 15 Sep 2022 22:29:32 +0200
Message-Id: <1e26ece88d2fbf6dafff8694d70a8e52dfb3c077.1663273218.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663273218.git.namcaov@gmail.com>
References: <cover.1663273218.git.namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function vnt_receive_frame always returns true, so checking its
return value is redundant. Remove it.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/vt6655/device_main.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 04d737012cef..79325a693857 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -832,12 +832,12 @@ static int device_rx_srv(struct vnt_private *priv, unsigned int idx)
 		if (!rd->rd_info->skb)
 			break;
 
-		if (vnt_receive_frame(priv, rd)) {
-			if (!device_alloc_rx_buf(priv, rd)) {
-				dev_err(&priv->pcid->dev,
-					"can not allocate rx buf\n");
-				break;
-			}
+		vnt_receive_frame(priv, rd);
+
+		if (!device_alloc_rx_buf(priv, rd)) {
+			dev_err(&priv->pcid->dev,
+				"can not allocate rx buf\n");
+			break;
 		}
 		rd->rd0.owner = OWNED_BY_NIC;
 	}
-- 
2.25.1

