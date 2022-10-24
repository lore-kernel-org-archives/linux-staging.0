Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5C56ADD
	for <linux-staging@lists.linux.dev>; Mon, 24 Oct 2022 21:24:26 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id y12so13258447edc.9
        for <linux-staging@lists.linux.dev>; Mon, 24 Oct 2022 14:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZsnAEsVBgH1SY91CR++8td8qF2as+jKuxUWas/0RKs=;
        b=dzRCCrMq/BADC/Fq6uUj+xe4Hc2cbZBCsUhG9yVbyfUSS1a86aZsZ7fC8TIJmhqzfY
         ogPnqCKM91NWVfT8PK2+CgtZNrLhZPwQcsiw/CRCvT1q2cN3Z5CMaAQHlwPes9vGSNFo
         /xF5YfpSccFvTfAzr0DtKzQZhbnfAgNQOkdGZiVu0Cx6sdb9/Pu9W7+634yEGHSyE5ah
         5agHKO/fxUU975BV+2IYrrVPVTkvptgwuh7KLNpdnZ9L7NB98wMG0fILvtul28sqSPJv
         XB3n4hDyQfiXhvAK0+aD+k6fU7jHFFRUv+USAh+LNlJpzxNPePRDAfMWoakPD+rXIxWq
         Ckbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MZsnAEsVBgH1SY91CR++8td8qF2as+jKuxUWas/0RKs=;
        b=klJOsTKinZ7Zu8qnZKCubuV5kbgIS6oxiWxPW9YW4iGk+4Y9/jTQSLqxDF/s4wKAxy
         PycKQwJ71QfcpVD61nCFDHd/TLssIMle8WPZLiCjHtYVMwQOB06rI4hR61IUYHyk7bnp
         SdJVL3khOgDf+P5MlYmBJpwFgm9SafJjTOttBD1Cs55QJkI5ydJLxeyN5Cly4Fl7WyBP
         ItseiWKO9lAAjeg2LJ5GOnIh5mfvdwgNgPl0ZEp58w1ysOgELp/V7f9FLkz3sRL51LR/
         wU+ZvpL0Ys7RMwWJbqqw54qtESYzMaFksmWxtJ1UWseZXat+SqC4Wak8nvGmQST1Hiky
         BnDg==
X-Gm-Message-State: ACrzQf0FIfOWefSe9P90LW3E0iSwiKJiVXWEnwJDzrQZI9JMjtGEcPxV
	u+Id1142D5c8IjPYtZ2PVj8=
X-Google-Smtp-Source: AMsMyM7RaR8vfj9qvimhwIoyMgNFL/0emWD7zwzvYCY0ojkY8rFMx9BmK8n9aBabFF67YVaGcDNeeA==
X-Received: by 2002:a05:6402:294f:b0:461:f5ce:31e8 with SMTP id ed15-20020a056402294f00b00461f5ce31e8mr2721525edb.363.1666646664984;
        Mon, 24 Oct 2022 14:24:24 -0700 (PDT)
Received: from localhost.localdomain (ip-217-105-46-178.ip.prioritytelecom.net. [217.105.46.178])
        by smtp.gmail.com with ESMTPSA id r1-20020a1709061ba100b007a9c3831409sm379354ejg.137.2022.10.24.14.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 14:24:24 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: namcaov@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] Revert "staging: r8712u: Tracking kmemleak false positives."
Date: Mon, 24 Oct 2022 23:24:06 +0200
Message-Id: <0542c043702f4b44be90f84b39f46fd7de5d85ee.1666645510.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1666645510.git.namcaov@gmail.com>
References: <cover.1666645510.git.namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 5d3da4a20a271e3cf5496a50cbb8118aa019374f.

This commit annotated false positive for kmemleak. The reasoning is that
the buffers are freed when the driver is unloaded. However, there is
actually potential memory leak when probe fails.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/rtl8712/rtl871x_recv.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl871x_recv.c b/drivers/staging/rtl8712/rtl871x_recv.c
index de9a568eaffa..4db7eed64a03 100644
--- a/drivers/staging/rtl8712/rtl871x_recv.c
+++ b/drivers/staging/rtl8712/rtl871x_recv.c
@@ -17,9 +17,7 @@
 #define _RTL871X_RECV_C_
 
 #include <linux/ip.h>
-#include <linux/slab.h>
 #include <linux/if_ether.h>
-#include <linux/kmemleak.h>
 #include <linux/etherdevice.h>
 #include <linux/ieee80211.h>
 #include <net/cfg80211.h>
@@ -61,7 +59,6 @@ void _r8712_init_recv_priv(struct recv_priv *precvpriv,
 				GFP_ATOMIC);
 	if (!precvpriv->pallocated_frame_buf)
 		return;
-	kmemleak_not_leak(precvpriv->pallocated_frame_buf);
 	precvpriv->precv_frame_buf = precvpriv->pallocated_frame_buf +
 				    RXFRAME_ALIGN_SZ -
 				    ((addr_t)(precvpriv->pallocated_frame_buf) &
-- 
2.25.1

