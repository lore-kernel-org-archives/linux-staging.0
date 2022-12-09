Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127767E
	for <linux-staging@lists.linux.dev>; Fri,  9 Dec 2022 02:18:52 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id o12so3369717pjo.4
        for <linux-staging@lists.linux.dev>; Thu, 08 Dec 2022 18:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xuFHYlW2BQjam/A3YEU1fB8z1wItTgzvbQlA1F7NMJM=;
        b=l19aM2o8vaD62DX6ft983uZYWlnAkhv5ZEakvO13bgO5uWVuCNoxebb4Ygp5ny8pyW
         ENuK0BNaGd7Om5jfiVuDc0KatTJz4fIjxR5QWqOTfGASowEaPDMKoA0vVOjbaaBIigIW
         ZYY1/d38yLS9o58fLvVEiFnBmmiNUz1tmQzX3Fv5Fo6A5vGi1CT9fV0oDkEsfTgL0qZZ
         jOMyz43NmlKUjKTiWUa2s6Mhi3tw/v579JbGTvbmsHs6OCdUm5OMZ5qhuis6JxG6OtFz
         8mgzUYtf0aqnoCrnSLsT7zbbqCKWzkVOxzARYBrb+Wyk+zqOjEOBe0VGwgoj0ZIHyy/L
         Bzaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xuFHYlW2BQjam/A3YEU1fB8z1wItTgzvbQlA1F7NMJM=;
        b=LZlMZgKGp7jMLMoMJyHkLUDxTTf3NPVmXpxUBrkHExmLLOCHhJj//gu9H2DFGMauSs
         zVNvW1mFuIb3Bxj7XWMfsWQSGfpf049SGKP2lrfpC4R57NmVaDchBbmy9DyKBHfDQl9r
         8GyQT4PyH4/gvcszFsAvQKB5DD3t1Y/wXGoeqDHm7vTQkkhLkAmyD0ibA6Y0LGfLEUh9
         GZX6t61HmPWCK01WjMCZxkxrBST983RlpO2xdxWxQkk9UeSw7yvLiK5zR6aNEb4BaRIW
         h61T29tnfQM/arm4DIVrT1nlnXbAqfDI86/GS98Rm76AepYskndg+oeTeBIpK/dFhaNi
         LmKg==
X-Gm-Message-State: ANoB5pkFjmMRXvpD5cTJGuUNFuHW3e9wNzcoSIfL1Rcc2nMDYvQK7PEd
	Teut3QdNg0k/FAG7F1fZ0ts=
X-Google-Smtp-Source: AA0mqf70bEGhjPW0P50KIYTmTD2unY5Oqczpy1uTbvCdV7r/JElohG1AF31pXe92sueoNtH+PaXAKg==
X-Received: by 2002:a17:902:db01:b0:188:77a7:ea9 with SMTP id m1-20020a170902db0100b0018877a70ea9mr6217893plx.55.1670552331430;
        Thu, 08 Dec 2022 18:18:51 -0800 (PST)
Received: from localhost.localdomain (2001-b400-e283-776d-8739-aa48-f251-9f2f.emome-ip6.hinet.net. [2001:b400:e283:776d:8739:aa48:f251:9f2f])
        by smtp.gmail.com with ESMTPSA id o16-20020a170902779000b0017f5ad327casm116249pll.103.2022.12.08.18.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 18:18:51 -0800 (PST)
From: Matt Jan <zoo868e@gmail.com>
To: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Matt Jan <zoo868e@gmail.com>
Subject: [PATCH v3 2/3] staging: vme_user: remove unnecessary spaces
Date: Fri,  9 Dec 2022 10:17:55 +0800
Message-Id: <20221209021756.5597-2-zoo868e@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221209021756.5597-1-zoo868e@gmail.com>
References: <20221209021756.5597-1-zoo868e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary spaces before function pointer arguments in
vme_bridge.h. This is done with command ':%s/) (/)('.

Signed-off-by: Matt Jan <zoo868e@gmail.com>
---

Changelog
v2->v3: Resend the patch set in properly threaded and move the patch
		changelog to correct position, noted by Greg Kroah-Hartman
		<grekh@linuxfoundation.org>
v1->v2: Resend the correct patch set, noted by Greg Kroah-Hartman
		<gregkh@linuxfoundation.org>

 drivers/staging/vme_user/vme_bridge.h | 32 +++++++++++++--------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/vme_user/vme_bridge.h b/drivers/staging/vme_user/vme_bridge.h
index e17a8f7de165..5da2643e20d5 100644
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

