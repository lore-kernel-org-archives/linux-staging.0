Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433733FC0
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 03:39:24 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id v2so7424702plp.8
        for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 20:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0ms3vEIwed7axJJI4pRikbtTzcex85bsJ251ErKhjvo=;
        b=ilabGGj9uvmj1RzfihJGadghI0jqdj7TpAxqd3kz0KVNSQU+vatTG66po7Kh7Vfwu9
         bqFijo1p2oHK1xTeLRjINt/oom/UUpaB924qPdsdVTZR0kuOKGswdUhitdnJk3Cm6SMk
         Dwpj8mExHsS1QB4+RWb091sLAxtbd2+7zqEFlrXXVqh+B7FsTLEKLi2q6fKEu4wT437y
         9BziNBe1bXZhv/WCkAgUkIb6/1JF82lL9ESPIyMk+cNOSct5OXYWXM8+ZrHeuL7HG7G7
         kwsrW+izsl9cMAMtPeoGAG38hHAQKv+G0eL6z6bR3JtrsF9VvS4f3yd/BwRIIg86hnAj
         NQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0ms3vEIwed7axJJI4pRikbtTzcex85bsJ251ErKhjvo=;
        b=uxttaQQs7oNsyWBel2hohNt12y1FP9hOqW+ANxFeMQGcPq8n/nsPz9QyPimqODFmgn
         E7te+X8hgrYqw2NbSolhyScPJJnuNFehHAVayIuPudomlhx6t6o+2RHjr9jtwpj2RC+5
         ZW8oFCn7lCSebfCI8j0fU6fKcAm0wn2dk8QS+Fm850tYgGKLXg3O0a7oT+XuksDRozG8
         N8BKpNIKl6psB/4zn4fz2yFKEJjcTyt8NsgVG99+idHG3QlY64egTHz42lhXC59PAO94
         W8zge84UXRMrUx5qrrAqhDzPQcJb4GaqeQfn6uJs5QyolOoORGKK+HrJLg9svKFLq3jA
         rVPQ==
X-Gm-Message-State: AOAM531B2GsuYb28YyXL8W0ue9c+5M5UqH2VM4bbuj+XrQEOZnwcV78z
	5XyZKG/8RHA6TsqlxU9HMqs=
X-Google-Smtp-Source: ABdhPJwEZdSvXJGp8Ad+4wmgoHbSl5eovwDglEYhz2ffvQC8RCf8ldTGHJz/LI58C78RaV9i4Oo0wg==
X-Received: by 2002:a17:902:b717:b029:11a:fae3:ba7c with SMTP id d23-20020a170902b717b029011afae3ba7cmr12696892pls.28.1631936363747;
        Fri, 17 Sep 2021 20:39:23 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id m21sm7926957pfa.216.2021.09.17.20.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 20:39:23 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: deng.changcheng@zte.com.cn
To: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com
Cc: phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	paskripkin@gmail.com,
	nathan@kernel.org,
	saurav.girepunje@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Changcheng Deng <deng.changcheng@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH V2] staging: r8188eu: use ARRAY_SIZE
Date: Sat, 18 Sep 2021 03:39:10 +0000
Message-Id: <20210918033910.237216-1-deng.changcheng@zte.com.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Changcheng Deng <deng.changcheng@zte.com.cn>

Use ARRAY_SIZE instead of dividing sizeof array with sizeof an element.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 drivers/staging/r8188eu/os_dep/usb_intf.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index d04d2f658ce0..44bee3b2d0ce 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -261,10 +261,8 @@ static void process_spec_devid(const struct usb_device_id *pdid)
 	u16 vid, pid;
 	u32 flags;
 	int i;
-	int num = sizeof(specific_device_id_tbl) /
-		  sizeof(struct specific_device_id);
 
-	for (i = 0; i < num; i++) {
+	for (i = 0; i < ARRAY_SIZE(specific_device_id_tbl); i++) {
 		vid = specific_device_id_tbl[i].idVendor;
 		pid = specific_device_id_tbl[i].idProduct;
 		flags = specific_device_id_tbl[i].flags;
-- 
2.25.1

