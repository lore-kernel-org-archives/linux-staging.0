Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2E77F3
	for <linux-staging@lists.linux.dev>; Thu,  8 Dec 2022 09:11:37 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id e7-20020a17090a77c700b00216928a3917so4011174pjs.4
        for <linux-staging@lists.linux.dev>; Thu, 08 Dec 2022 01:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kMozxrhekUqthR/ZzwbfPqWM+5U9HTscLOB3qLeUQfY=;
        b=DBsimqLIo+qEE89hMxiDEss3nJ2pNnaSSoIITz+tZkSCSpOOMi9BfHHyh/D9aJhTUW
         +cLQyqcYWxVIc7CkFK6IvGYa5AvWgzczgw7F7Nog/uByh073u6U7WTRYdExJwarBvhGq
         /bLDVRO3zkCZqO9qEF94XaY0FYPuRvGVZM8wPol2XpcALH+q3PLQ4kr+Qm441egmZZ9q
         2IkpF5oyaJw1XsXUqZvln7togEZiyIRx9i8nQhS0XsNqVbJafjRXWpbgfgHWECKkVJ2f
         ecwLuSPT3cfbwsld5ldAuijnMxgJzspAV+qByDxxTRE7orj6pMY73Z8z67KS8SPAEZOW
         Vytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kMozxrhekUqthR/ZzwbfPqWM+5U9HTscLOB3qLeUQfY=;
        b=VPsLGIMIqhB8JyJWZHKd9tvBQx5UxyYUpl1cKpxD9Qt3n2MJM1tgpTtvoY/PSfOXAF
         Gae4k+wS5A9T6GMe81dEvzMfNZQZmDdZJ+VItYR1xa3sUgFvZ4rbnbuaIWRva642BB+K
         6W388wWNYTsvgOBMP+lXu0aCKWGVEwo9g3qJvACldLpY0si99WraNfk/iH1au/rd3mIE
         Wncu21FTl2PRpS9hAxXoiTV08MvlIjliIoEbJXSbllz0XuJ93hj7CJGm1CEGNXThMikQ
         eHG8XirkLp/D3EVasl5R81q0c7sxQZiQP+F6jYv6/fkOWIXALp61ha9BLJ56RhVT4fO+
         kTyA==
X-Gm-Message-State: ANoB5pmDJlrQ/UrCOjE2bRks8eUNu86vyzaau7ruCSzz9wD3lU+gv/Av
	sqMrprReQYu+ul93FIyIzITc3pMUzKc2dbhe
X-Google-Smtp-Source: AA0mqf6C2QSUugE5UVSkvjHjxR1eVa2jk+YidS6ZFLPvirzkPbRo28j3ULWyI9VDM+gJYlx2nMT/OA==
X-Received: by 2002:a17:902:82c2:b0:189:a208:d124 with SMTP id u2-20020a17090282c200b00189a208d124mr41050534plz.143.1670490696690;
        Thu, 08 Dec 2022 01:11:36 -0800 (PST)
Received: from zoo868e (1-170-0-91.dynamic-ip.hinet.net. [1.170.0.91])
        by smtp.gmail.com with ESMTPSA id n1-20020a632701000000b0047899d0d62csm8246766pgn.52.2022.12.08.01.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 01:11:36 -0800 (PST)
Date: Thu, 8 Dec 2022 17:11:34 +0800
From: Matt Jan <zoo868e@gmail.com>
To: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 3/3] staging: vme_user: remove unnecessary spaces
Message-ID: <20221208091134.GA95310@zoo868e>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unnecessary spaces before function pointer arguments in
vme_bridge.h. This is done with command ':%s/) (/)('.

Signed-off-by: Matt Jan <zoo868e@gmail.com>
---
 drivers/staging/vme_user/vme_bridge.h | 32 +++++++++++++--------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/vme_user/vme_bridge.h b/drivers/staging/vme_user/vme_bridge.h
index 9a127f6fefca..ab2e24d3b625 100644
--- a/drivers/staging/vme_user/vme_bridge.h
+++ b/drivers/staging/vme_user/vme_bridge.h
@@ -128,45 +128,45 @@ struct vme_bridge {
 	struct mutex irq_mtx;
 
 	/* Slave Functions */
-	int (*slave_get) (struct vme_slave_resource *, int *,
+	int (*slave_get)(struct vme_slave_resource *, int *,
 		unsigned long long *, unsigned long long *, dma_addr_t *,
 		u32 *, u32 *);
-	int (*slave_set) (struct vme_slave_resource *, int, unsigned long long,
+	int (*slave_set)(struct vme_slave_resource *, int, unsigned long long,
 		unsigned long long, dma_addr_t, u32, u32);
 
 	/* Master Functions */
-	int (*master_get) (struct vme_master_resource *, int *,
+	int (*master_get)(struct vme_master_resource *, int *,
 		unsigned long long *, unsigned long long *, u32 *, u32 *,
 		u32 *);
-	int (*master_set) (struct vme_master_resource *, int,
+	int (*master_set)(struct vme_master_resource *, int,
 		unsigned long long, unsigned long long,  u32, u32, u32);
-	ssize_t (*master_read) (struct vme_master_resource *, void *, size_t,
+	ssize_t (*master_read)(struct vme_master_resource *, void *, size_t,
 		loff_t);
-	ssize_t (*master_write) (struct vme_master_resource *, void *, size_t,
+	ssize_t (*master_write)(struct vme_master_resource *, void *, size_t,
 		loff_t);
-	unsigned int (*master_rmw) (struct vme_master_resource *, unsigned int,
+	unsigned int (*master_rmw)(struct vme_master_resource *, unsigned int,
 		unsigned int, unsigned int, loff_t);
 
 	/* DMA Functions */
-	int (*dma_list_add) (struct vme_dma_list *, struct vme_dma_attr *,
+	int (*dma_list_add)(struct vme_dma_list *, struct vme_dma_attr *,
 		struct vme_dma_attr *, size_t);
-	int (*dma_list_exec) (struct vme_dma_list *);
-	int (*dma_list_empty) (struct vme_dma_list *);
+	int (*dma_list_exec)(struct vme_dma_list *);
+	int (*dma_list_empty)(struct vme_dma_list *);
 
 	/* Interrupt Functions */
-	void (*irq_set) (struct vme_bridge *, int, int, int);
-	int (*irq_generate) (struct vme_bridge *, int, int);
+	void (*irq_set)(struct vme_bridge *, int, int, int);
+	int (*irq_generate)(struct vme_bridge *, int, int);
 
 	/* Location monitor functions */
-	int (*lm_set) (struct vme_lm_resource *, unsigned long long, u32, u32);
-	int (*lm_get) (struct vme_lm_resource *, unsigned long long *, u32 *,
+	int (*lm_set)(struct vme_lm_resource *, unsigned long long, u32, u32);
+	int (*lm_get)(struct vme_lm_resource *, unsigned long long *, u32 *,
 		u32 *);
 	int (*lm_attach)(struct vme_lm_resource *, int,
 			 void (*callback)(void *), void *);
-	int (*lm_detach) (struct vme_lm_resource *, int);
+	int (*lm_detach)(struct vme_lm_resource *, int);
 
 	/* CR/CSR space functions */
-	int (*slot_get) (struct vme_bridge *);
+	int (*slot_get)(struct vme_bridge *);
 
 	/* Bridge parent interface */
 	void *(*alloc_consistent)(struct device *dev, size_t size,
-- 
2.25.1

