Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403872F23
	for <linux-staging@lists.linux.dev>; Thu, 10 Feb 2022 06:04:18 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id p14so4184741qtx.0
        for <linux-staging@lists.linux.dev>; Wed, 09 Feb 2022 22:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8IguWedCfgYcNS4qqgdsH8hKCfOP9gHJvHTgKmsnzDo=;
        b=qkDCU8kTDf9D6+ZTpxLGrT0JfQ+PJhEBRB1E+iQIpQQxlhevHiq0V4j3bPXeetlVa8
         +/mwbpdkKxM5I6XJMX1Burn20+acMhiclCQK08f/0Tubw46VekO285B6J+4xR8p5Vgk6
         cXZZNhnExGpkIc1O80V0549vD59AjJKPg4hMF/MTn+WDk0UVlYhCAtwz2QivXXka8xGi
         cdr/wgtmE46mCeBbccH0FXbBAism2M/nCey1DS9LgIb65977c/+Qfrngq69rGnw1MWJd
         G3jcBiUrAi6gK9V0t/pAR6D6HALGy2IxV5bZ++0zpiWHtbYlKx8tCHbd+gKXxD3+j3O6
         +JSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8IguWedCfgYcNS4qqgdsH8hKCfOP9gHJvHTgKmsnzDo=;
        b=VewU4kRy86iOvk7Q5aUIfKH204plQa01gYFIzxY15SOluuzS+f9GW9VWz87zKG9HaR
         ogIdwqTAhML7zI8iaiYRLA3NGc0/4bXxWMOeIJiA2GFh3gz3kXNbNU+I69bbjUVVyMNS
         BGprkhuQuQwwrcdYn33pIHsS/czfEC7uBimXhh0lkL5my+U3K70gyLfXzWDvk5n8hoQ3
         jRiPtKySEZWd9NlPZascF3NogP1Kxz3VR6loBfQuyKltfurUoZiiU8p8NMzloUdV51py
         uKUhamzV3Kv4TBTKd7vBTKDrHK4ea6XuUcATncCMcIbSCZpCzEcuUD+bvqrQaxpbP9Yi
         CyjQ==
X-Gm-Message-State: AOAM531MYbUBUiaH7B8vNsOH0ZIeb3i3NyCyHA1F3+e3op9da3+7gHXq
	iVMeaFJvNZ0NoRb3KeRSRdMRNEbHuss=
X-Google-Smtp-Source: ABdhPJzVOlJFWyeIEgnZABXxPt5TemSYedk7zgAGGRMXt1qPyKyK9DYyPdgIIi1ViolAo7T/o1pX/g==
X-Received: by 2002:a05:622a:1348:: with SMTP id w8mr3956850qtk.216.1644473057357;
        Wed, 09 Feb 2022 22:04:17 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id y20sm9234632qtw.28.2022.02.09.22.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 22:04:16 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Minghao Chi (CGEL ZTE)" <chi.minghao@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] staging/ks7010: Remove redundant 'flush_workqueue()' calls
Date: Thu, 10 Feb 2022 06:04:11 +0000
Message-Id: <20220210060411.1607928-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Minghao Chi (CGEL ZTE)" <chi.minghao@zte.com.cn>

'destroy_workqueue()' already drains the queue before destroying it,
so there is no need to flush it explicitly.

Remove the redundant 'flush_workqueue()' calls.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>
---
 drivers/staging/ks7010/ks7010_sdio.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks7010/ks7010_sdio.c
index 98d759e7cc95..9fb118e77a1f 100644
--- a/drivers/staging/ks7010/ks7010_sdio.c
+++ b/drivers/staging/ks7010/ks7010_sdio.c
@@ -1102,10 +1102,8 @@ static void ks7010_sdio_remove(struct sdio_func *func)
 	if (ret)	/* memory allocation failure */
 		goto err_free_card;
 
-	if (priv->wq) {
-		flush_workqueue(priv->wq);
+	if (priv->wq)
 		destroy_workqueue(priv->wq);
-	}
 
 	hostif_exit(priv);
 
-- 
2.25.1

