Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C100E71
	for <linux-staging@lists.linux.dev>; Wed, 28 Apr 2021 17:35:26 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id l17so32490200oil.11
        for <linux-staging@lists.linux.dev>; Wed, 28 Apr 2021 10:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=Bch1oq78dAKG4OuGE0cpushN9U1V2L83n1Hncb6KNXs=;
        b=CKZmEMvLLQPT2T4K/7ACKFBrXF7Dhdf380FQNA5cqQe2irjZ403gMdDlBX+1W1xC9k
         +VOkxWalv8VgGr2ROCyoY8e3Fh6wGVkbIl5wUhoKy2BUfl77SzXazI9cTUDh/4lx9FBx
         NhNHj8hpxlEVoyIAK1PkDcGUdomELhUJffyng2SPlDZsWUew8rVgpV1sedEuEBSOBhE5
         gJnsYf6awNVs5XIqjjxh7FF+gD7fHuD1oOeOx/p4mBSBl/SRUqokGX6QwJuluRRJ3+TR
         vby1TYffahtl48jVCMGdyjUD6g+ecCRIJLRhy0GXJPEC931CMqGu4O//P7iWw3l6ilaE
         OJdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=Bch1oq78dAKG4OuGE0cpushN9U1V2L83n1Hncb6KNXs=;
        b=b7L7PdinJO8KFRVcgN0d1bfsetwxBN2ODgHznNUnD8JUbW5rdzliPcKHnsmupzhI6l
         1nWFaA54FMoAHBFkrSyyCUtNegEjqszE7Tu+rTEyh43QXsxQuAwlKxSqTqd7PUXLUTFe
         YvBciB+iY8/KRlrwJMgSEG1FQ3UjWD3HpKPvivj0bTSgfGr58sljoHhZCzK9A2drI7Ui
         nNpC0B9ByyAjwpinV/+jHIdSZFIoEt6JUAXNnN4YLfqkTvh4ODRk7Unv3SdUCWqesKXJ
         RlsCF9FPll8AknA8/0czOwXciPqsnupjOLa/xzj51hqZouPi1rpfhQqeHuDfyGzrOln1
         qXhg==
X-Gm-Message-State: AOAM533lllkww6uFTZVO14DPw8R1hRm4ILfElraR7+hdpdj5NfUUTvSd
	oCRblsoEb1cpI9K5BonYfpA=
X-Google-Smtp-Source: ABdhPJw0Z1soQrHdhdkaW+wEPDLB2epqNABhfB/3YssWKPvMAlY7jlCBUvm5+BDwJlbJ0Qv/t98yvA==
X-Received: by 2002:a05:6808:1393:: with SMTP id c19mr8850865oiw.149.1619631326062;
        Wed, 28 Apr 2021 10:35:26 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a11sm107487oif.52.2021.04.28.10.35.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Apr 2021 10:35:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] staging: rtl8712: Use list iterators and helpers
Date: Wed, 28 Apr 2021 10:35:23 -0700
Message-Id: <20210428173523.149958-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Use existing list iterators and helper functions.

The following coccinelle script was used to convert the code.

@@
identifier v1, v2, v3, v4;
symbol next;
expression e;
iterator name list_for_each;
statement S;
@@

<+...
(
- e = v1->next;
|
- e = get_next(v1);
)
  ... when != e
- while ( \( v1 != e \| e != v1 \) )
+ list_for_each (e, v1)
  {
    ...
-   v2 = container_of(e, struct v3, v4);
+   v2 = list_entry(e, struct v3, v4);
?-  if (!v2) S
    ...
(
-   e = e->next;
|
- e = get_next(e);
)
    ... when != e
  }
...+>

Compile tested only.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/staging/rtl8712/rtl871x_mlme.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl871x_mlme.c b/drivers/staging/rtl8712/rtl871x_mlme.c
index ba4a71e91ae0..92b7c9c07df6 100644
--- a/drivers/staging/rtl8712/rtl871x_mlme.c
+++ b/drivers/staging/rtl8712/rtl871x_mlme.c
@@ -139,10 +139,8 @@ static struct wlan_network *r8712_find_network(struct  __queue *scanned_queue,
 		return NULL;
 	spin_lock_irqsave(&scanned_queue->lock, irqL);
 	phead = &scanned_queue->queue;
-	plist = phead->next;
-	while (plist != phead) {
-		pnetwork = container_of(plist, struct wlan_network, list);
-		plist = plist->next;
+	list_for_each(plist, phead) {
+		pnetwork = list_entry(plist, struct wlan_network, list);
 		if (!memcmp(addr, pnetwork->network.MacAddress, ETH_ALEN))
 			break;
 	}
-- 
2.17.1

