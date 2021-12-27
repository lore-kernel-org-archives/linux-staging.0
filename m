Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E423A173
	for <linux-staging@lists.linux.dev>; Mon, 27 Dec 2021 13:19:21 +0000 (UTC)
Received: by mail-vk1-f169.google.com with SMTP id b77so8575920vka.11
        for <linux-staging@lists.linux.dev>; Mon, 27 Dec 2021 05:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=a38JSinn6KGDl7s2dZ5j9DvJA5cTm6pRNLn1Do3OpbM=;
        b=Td9zBgf+8LvoYGqM1W1HTekFTTSf5ZLojhZlPd1gOuSmOlralfxnewnCu9/57IyXQC
         htUK71RuhW1e+WC7G/K/vxZ6AGGQ13f2m9+yTiitCwmcA3Mph2lqTERZC8bjMCLdBAlz
         y6gqTqPIq46bjMxYj5uZSoqOVPmaOld+DgO8gIJW0RpUBu/UUSkdqVnSPZNSKfesLCNo
         dtdMvL4+Zzjc66O0KXodrywD4eyumjcE9V6Nak0jshBfeD/y+4Mlbv+5EQliHOVPQnFy
         ci8LVRb7i2Kz/34fQn0uDpiNUb9pyskRP0WZp6KS01C6ZQSmabEl12CEUVNyzOLR25+X
         YNHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=a38JSinn6KGDl7s2dZ5j9DvJA5cTm6pRNLn1Do3OpbM=;
        b=sAS4TFReFiI2K+3jYTVAf1wOactIye0I8dHIKLUblaUh4S5peyleMizzUuokNkewo0
         8Dw9olsGTXx1mf+6UISCE4IiBX1qo/qRAPQEZMp0ZbbUGHzi2MTEJmQjaU4qMvces+io
         rnBKr0yht/Borw/H9jMcp3F10Pbbq2lk003rgnmhfcXOsBAx6XLtHorTRDzpd8tlHw8l
         EzJBXLe/lUune2JRiVrN3I98ZvDemeH2lmIEDODlTPhhS72pi/VTU72VWJchuV7JJa+R
         qwrcGi8ROZsaSXS00z4vot0zE+J8B1J8ncQgQsD9UlAxWlwSgk+zjTUTyz+AovYhm3yd
         fcsQ==
X-Gm-Message-State: AOAM5339BpmNo53L/GkrI1QUaF2NyVhVWV/SIR/q6g6xRu4+xDneuxVC
	a87Rb5PDy2jA5f8OJLL7mz3rgJewo9TwjjaBqPk=
X-Google-Smtp-Source: ABdhPJxOlPkSAUR0PoLL5+VRcmCBcY35kR+I9xvdCz17NSXH1FlWClSZH1LvpwpXp67hHa5swHQNQsrd8pGtxsIMM1E=
X-Received: by 2002:a05:6122:178d:: with SMTP id o13mr4725985vkf.15.1640611160867;
 Mon, 27 Dec 2021 05:19:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Adam Kandur <sys.arch.adam@gmail.com>
Date: Mon, 27 Dec 2021 16:19:10 +0300
Message-ID: <CAE28pkNNsUnp4UiaKX-OjAQHPGjSNY6+hn-oK39m8w=ybXSO6Q@mail.gmail.com>
Subject: [PATCH] qlge: rewrite qlge_change_rx_buffers()
To: netdev@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

I replaced while loop with for. It looks nicer to me.

Signed-off-by: Adam Kandur <sys.arch.adam@gmail.com>

---
 drivers/staging/qlge/qlge_main.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
index 9873bb2a9ee4..69d57c2e199a 100644
--- a/drivers/staging/qlge/qlge_main.c
+++ b/drivers/staging/qlge/qlge_main.c
@@ -4012,19 +4012,17 @@ static int qlge_change_rx_buffers(struct
qlge_adapter *qdev)

        /* Wait for an outstanding reset to complete. */
        if (!test_bit(QL_ADAPTER_UP, &qdev->flags)) {
-               int i = 4;
+               for (int i = 4; !test_bit(QL_ADAPTER_UP, &qdev->flags); i--) {
+                       if (!i) {
+                               netif_err(qdev, ifup, qdev->ndev,
+                                         "Timed out waiting for adapter UP\n");
+                               return -ETIMEDOUT;
+                       }

-               while (--i && !test_bit(QL_ADAPTER_UP, &qdev->flags)) {
                        netif_err(qdev, ifup, qdev->ndev,
                                  "Waiting for adapter UP...\n");
                        ssleep(1);
                }
-
-               if (!i) {
-                       netif_err(qdev, ifup, qdev->ndev,
-                                 "Timed out waiting for adapter UP\n");
-                       return -ETIMEDOUT;
-               }
        }

        status = qlge_adapter_down(qdev);
-- 
2.34.0
