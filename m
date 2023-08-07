Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE53D3D9C
	for <linux-staging@lists.linux.dev>; Mon,  7 Aug 2023 20:42:32 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-76c9334baedso312237585a.2
        for <linux-staging@lists.linux.dev>; Mon, 07 Aug 2023 13:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691440951; x=1692045751;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HEHOruhAQboL2IZJ4xKRfJd4y+GyHfL/ZFsRcNEA2Vk=;
        b=KjbOPy6364kVnkNLLbhSypPPT4hUPeGlb4+nC2Cv3qKrX4rtoH79JEHNeASJ02YspO
         6FFOGeQBi85L97fa7QFadFoFTZwXIA3yjD+M0Hl1uctzCKFfakXhorENt5Eby7oQ9uwk
         Xb/bUG6blF8LihInw9JezmeXY8X8S8qHdTEob+dbHmHrkhBW+qQK3jy5/Xp3x8X8B61W
         z0v9ODtpH3eiDCOQAbk3S/3BKrjjaa4pswpQ5F9LDhi8XCZ9MBX9svk6z2+ZmzLkH0j9
         cLtExscyiMbIepvZ7bySjrldOYQKwTm0mvWTmHPYlUQsM6ZMTjeLOiVq2pDM80kA+7EA
         jXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691440951; x=1692045751;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HEHOruhAQboL2IZJ4xKRfJd4y+GyHfL/ZFsRcNEA2Vk=;
        b=kzH/lVWl/sQRsnbUInJCiXaukg+xj/xFdUX+0MSlSdFPWvO+wx1+xV46Xdu5DZNzDm
         T4pUuKbUBmZYm3d7T3KxHH+d3lVUD8IZViqa+VthhETHgVSe7F5BQ8PwlTT/Lcislx8H
         V04GumkY3jqHGPTAw06c+SnLh7w3E1uNYTQHX8ffLu5oldGRSwqqRCYH0mEsNccq4GDU
         ap9etpdMrTbrGHVK5LIyzG+kwihC1BO7CNmgzoLyE71H0Cwy+L15zln6Qo6aQF5P8aR1
         bjHw+bXOvieUqXxwtcmtB83rPQwegMRjkQlcbJctHSr91tqDrcGzdkfNO4ImOzWuygWX
         RyEg==
X-Gm-Message-State: AOJu0YzlbuQ9/6zUrjSWor7GOjWZ4NPvNkHJWedkGAw9v5+KMy12Jzx5
	LwUJrrnv5lXkCMjC8tTVYuo=
X-Google-Smtp-Source: AGHT+IEKWDJGGHtAZv6CaRvXSdrnf4QParZ5Qg3oFCCDddiRT69ZRYhCWzUBhnxr9+5albbgelbzJQ==
X-Received: by 2002:a05:620a:370e:b0:76c:a010:259d with SMTP id de14-20020a05620a370e00b0076ca010259dmr11840301qkb.23.1691440951395;
        Mon, 07 Aug 2023 13:42:31 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:86d6:7871:f7e9:8a15:865a])
        by smtp.gmail.com with ESMTPSA id c28-20020a05620a135c00b007682697dcb0sm2835953qkl.76.2023.08.07.13.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 13:42:31 -0700 (PDT)
Date: Mon, 7 Aug 2023 17:42:26 -0300
From: Alexon Oliveira <alexondunkan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH v2] staging: vme_user: fix alignment of open parenthesis and
 deleted trailing spaces
Message-ID: <ZNFXMrtqSWvZv+rl@alolivei-thinkpadt480s.gru.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed all CHECK: Alignment should match open parenthesis
and deleted the trailing whitespaces as reported by
checkpatch to adhere to the Linux kernel coding-style
guidelines.

Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>
---

Changes in v2:
- Fixed changelog, noted by Greg KH

 drivers/staging/vme_user/vme.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index 977c81e2f3c7..741593d75a63 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -563,7 +563,7 @@ EXPORT_SYMBOL(vme_master_request);
  *         returned.
  */
 int vme_master_set(struct vme_resource *resource, int enabled,
-		   unsigned long long vme_base, unsigned long long size, 
+		   unsigned long long vme_base, unsigned long long size,
 		   u32 aspace, u32 cycle, u32 dwidth)
 {
 	struct vme_bridge *bridge = find_bridge(resource);
@@ -614,7 +614,7 @@ EXPORT_SYMBOL(vme_master_set);
  *         device or if an invalid resource has been provided.
  */
 int vme_master_get(struct vme_resource *resource, int *enabled,
-		   unsigned long long *vme_base, unsigned long long *size, 
+		   unsigned long long *vme_base, unsigned long long *size,
 		   u32 *aspace, u32 *cycle, u32 *dwidth)
 {
 	struct vme_bridge *bridge = find_bridge(resource);
@@ -1045,7 +1045,7 @@ EXPORT_SYMBOL(vme_dma_pci_attribute);
  * Return: Pointer to VME DMA attribute, NULL on failure.
  */
 struct vme_dma_attr *vme_dma_vme_attribute(unsigned long long address,
-					   u32 aspace, u32 cycle, 
+					   u32 aspace, u32 cycle,
 					   u32 dwidth)
 {
 	struct vme_dma_attr *attributes;
@@ -1841,7 +1841,7 @@ EXPORT_SYMBOL(vme_unregister_bridge);
 /* - Driver Registration --------------------------------------------------- */
 
 static int __vme_register_driver_bus(struct vme_driver *drv,
-				     struct vme_bridge *bridge, 
+				     struct vme_bridge *bridge,
 				     unsigned int ndevs)
 {
 	int err;
-- 
2.41.0

