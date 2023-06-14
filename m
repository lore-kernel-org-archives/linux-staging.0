Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376277F
	for <linux-staging@lists.linux.dev>; Wed, 14 Jun 2023 16:45:00 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1b3c0c47675so33151835ad.1
        for <linux-staging@lists.linux.dev>; Wed, 14 Jun 2023 09:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686761100; x=1689353100;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+mtQ9KRgsRV3qb9QuuaC8ZHbI3X0Zw+V38td7BGTBqI=;
        b=j6SmFN2Yd9SEmBnmduo/sXgL3GdVdW191lYP9PKrlEWZXDPohVmh21QZKCMmLFICfi
         2O5TkdEok4yQ27votYVvZIq31e0INlTtNojlFiJT0VXLC6SxwH9pQgavHqcsrENHs2sl
         kRAB3ufu1fxZxP+eibzvJSi7h9eJhEogFm9PSob8PoO7QTjrLwvRrnM7iQmrBaGUnA1V
         iVqkcgL7dG6nMMw7lE9q7Ib6H7UQHfwn4/GiaJbAv4gtJ17cYriuIaAgrYDfSYaJ2Vjl
         YVI3HxnOh4VbMeN7djrYL05w/WSLL7guZd1Ru7Ei+LmTSw70LGIQqCxQhHvRhMf1P/xa
         xXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686761100; x=1689353100;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+mtQ9KRgsRV3qb9QuuaC8ZHbI3X0Zw+V38td7BGTBqI=;
        b=E9rZA0eLgVOGNILf27Xh7ydvKEDPXA2CG1as8w9y68aUWFlnHTfRrmollhBJTFTP5i
         ZaiL2CiHMqoces9PJCVqEQLRmTMGoWULOwyJy/q52aRtJD5Nyq2sCi6n937BYOYzcYBW
         CyQTWgRGd8zQVTy0dIWVYe1q9O0AxXeXVJ87dw+Q5EVWPCnsh3VrwoPOm4FEvjbzE3d/
         2Pt9PSq7oZpPsIt39c7krg1WY/SLjAniNmTMFh7hnBSGxcCS/JuEGLW/JgIqOGYFaDWP
         3BdxZbntJ3UGaaR+6qAbBQmcJ+6Up+3LBAgs00wxxzTtjNUbjxA7yH2OzR0Cu54ED3bC
         JZog==
X-Gm-Message-State: AC+VfDxX8dngN0VIHlstZ8fERmLwJ2jwiW6La5l3rrmEP+owNDAZUCBv
	PTL3GoMWdx0mHz1uEZczvmA=
X-Google-Smtp-Source: ACHHUZ6qVGJjFwohn/hFX5/jfRd/U83DOW+MztgzbSaWrfoIvYkCFtiHHzRfPBKD5NgSY+/aTbQzsQ==
X-Received: by 2002:a17:902:f7c3:b0:1b3:cc77:c8ba with SMTP id h3-20020a170902f7c300b001b3cc77c8bamr9063957plw.59.1686761100334;
        Wed, 14 Jun 2023 09:45:00 -0700 (PDT)
Received: from sumitra.com ([117.245.169.18])
        by smtp.gmail.com with ESMTPSA id jd4-20020a170903260400b001b3b83b7d4esm7576873plb.211.2023.06.14.09.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 09:44:59 -0700 (PDT)
Date: Wed, 14 Jun 2023 09:44:54 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Ira Weiny <ira.weiny@intel.com>, Fabio <fmdefrancesco@gmail.com>,
	Deepak R Varma <drv@mailo.com>,
	Sumitra Sharma <sumitraartsy@gmail.com>
Subject: [PATCH] drivers/target: Call page_address() on page acquired with
 GFP_KERNEL flag
Message-ID: <20230614164454.GA390511@sumitra.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

rd_allocate_sgl_table() acquires a page with alloc_pages(GFP_KERNEL, 0).
Pages allocated with GFP_KERNEL cannot come from Highmem. This is why
there is no need to call kmap() on them.

Therefore, use a plain page_address() on that page.

Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
---
 drivers/target/target_core_rd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/target/target_core_rd.c b/drivers/target/target_core_rd.c
index 6648c1c90e19..d8ea6aff39a2 100644
--- a/drivers/target/target_core_rd.c
+++ b/drivers/target/target_core_rd.c
@@ -159,9 +159,8 @@ static int rd_allocate_sgl_table(struct rd_dev *rd_dev, struct rd_dev_sg_table *
 			sg_assign_page(&sg[j], pg);
 			sg[j].length = PAGE_SIZE;
 
-			p = kmap(pg);
+			p = page_address(pg);
 			memset(p, init_payload, PAGE_SIZE);
-			kunmap(pg);
 		}
 
 		page_offset += sg_per_table;
-- 
2.25.1

