Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470A21DA50
	for <linux-staging@lists.linux.dev>; Fri,  4 Aug 2023 21:20:56 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-76cdf055c64so198056485a.3
        for <linux-staging@lists.linux.dev>; Fri, 04 Aug 2023 14:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691184055; x=1691788855;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R+n0XwgRUCBYf2v/4RICLfZrVX06sOWFrOWSc1o23EY=;
        b=LMuRxuzPH6t80/VZd9NGC4a+uw8L0mEuI1TdIF8O6lJgpM01c9O8WtXCsxclOw3795
         w8Dc2yworB6vfvSqAva+kWk8zgQ+Dmflk6SbZZRAW8QfBW91THGXvpEcHuVGOy53qIvs
         BSAWCY1EySMrAg8jbdtP6JhYudlh+NHqE6vQtaCf49jPv2/eTQltk8jHKBuc3QqAtLQU
         Sj6mA1jDOog3TWR28TPcEOP1gsj9lMOitNNTW+8zAsZm3a4Y+xOJ2nvQ5vsOk2WWceIk
         IBFNV6G0g97drLGBtyiQZ/clCs0/XU/8MVifGGKoyQHuSP+RDMLKfeY7C6aQ5l+bYg6n
         AVYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691184055; x=1691788855;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R+n0XwgRUCBYf2v/4RICLfZrVX06sOWFrOWSc1o23EY=;
        b=NJ79rws7lT6lwy1m7O1IhAH+oDh3HwkQyQTaCYQWCU9wGH6l286Z37in145TjxVyPj
         dgIXyEyf34y+bwjfqPf62JSPDFK9azX3w/KMELY0N3/W7AMDd7Os7+DgUQL+nPtIIJZa
         Bks4UL0GarwexFGCt4ucItIY6orH4hYmtEwSDHUgJ4EjWpvFNqucl5uVq93qVXcL/cJo
         AHnCmThYGOjx+X6fnYmzgMC4xLt+D75wjkbf1neQVw+clmUQlk/bJuYmALyHOTBodEJX
         +P1iKDwJP8CX0CJl+ZcIjmMIojzcs8m5k/3xZMsxdHhKmItpdBa+K8WtxhQUVkADz1sv
         YeyQ==
X-Gm-Message-State: AOJu0YybG+4j4YTS3xS5JXX8erYTNHzsOjwGWwoa3kGJ7rFNOuIPttny
	K+ogeuGgDtutDbyln43Rgks=
X-Google-Smtp-Source: AGHT+IFzdt4urw+AVt2ALCVaR7x99vA6RibBcMvQ1ydqWcFDBWwXKKz1rpuqpW0MQNQysN9TLB+f1g==
X-Received: by 2002:a05:620a:2807:b0:767:6fd:4c1 with SMTP id f7-20020a05620a280700b0076706fd04c1mr3442749qkp.77.1691184054885;
        Fri, 04 Aug 2023 14:20:54 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:86d6:7871:f7e9:8a15:865a])
        by smtp.gmail.com with ESMTPSA id l8-20020a37f508000000b00767cf270628sm905884qkk.131.2023.08.04.14.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 14:20:54 -0700 (PDT)
Date: Fri, 4 Aug 2023 18:20:50 -0300
From: Alexon Oliveira <alexondunkan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH] staging: vme_user: fix check alignment should match open
 parenthesis
Message-ID: <ZM1rsu0M22HHtjfl@alolivei-thinkpadt480s.gru.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed all CHECK: Alignment should match open parenthesis
as reported by checkpatch to adhere to the Linux kernel
coding-style guidelines.

Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>
---
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

