Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C8D100B2
	for <linux-staging@lists.linux.dev>; Tue,  8 Aug 2023 13:59:46 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6bcf2fd5d69so2129258a34.1
        for <linux-staging@lists.linux.dev>; Tue, 08 Aug 2023 06:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691503186; x=1692107986;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sVJ0p0WaC8Bx3ZnF3RkzwD7YcCGFMibfiG+VoV03ROc=;
        b=RmLHNUI3zgJOG/RTD9KOLrXGnYEwUILSJ2NZ2ZIUOXp2wRAcQBceURWhB7HCjywQuD
         nWBRDle8K2KQKLHZy5N4aDwLepkKZybHNo2w7S8gi7VH4YbhD1n0dX1M3NWAWaYMzmiG
         TF7xv9EB5GDHCC8HEisLev1JEAzUpn6LeFtoJl+kACtxRWVlCIi+5tNhxxtOkxLcqwtK
         mrgs3OnJ0Kw1hJcFwsOUXgLvDZKPAwPU3Fgxk3bB9B2K2sx471zrxrzAzY20HHl7DSj1
         W+qnwf0K3nX2pe9/oFyk1k7m/nx4Ddhzx9V0lG07BAQ6kkU+xujNOJm+hK9atRu/mzmq
         AO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691503186; x=1692107986;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sVJ0p0WaC8Bx3ZnF3RkzwD7YcCGFMibfiG+VoV03ROc=;
        b=ZlqPm0X22dhPvIxDvts4RwP0SMwMiee3jHvF8GWVg7i0aGBsviVGdF4C6pMaPQ1u9V
         pMIpeECMXrvVsls2Kkmksn7uh3Ca86ahh0kPzGoaHi7fOaxmppzkl2r7/BCjb6hc/OlE
         hCtYfAzR3GCOkCR2nchIb8F3dw6p+v4vbWIzJaST9XVHq5JR0unh6LTDSqGMJmLnHOee
         cFJwrLUGF+h1AY+yxVQJ55DpnzyIpqHfzwgmAsKMhiOVwJpbnDDlAiEYfNtaQMWEUdNU
         cgJsR9dOGCQ4IggxXGE3QFZ9vfvOAhkbzaSkLlWSk11SvtHcvM9WXxSsr1zFMfzteRqv
         exVw==
X-Gm-Message-State: AOJu0YwqJpWRTgf/due/gKq6qOk3mXxbJ75OomRjQw4QcZbpLZb+OyLP
	uKPANhF0nzL5fTjNgOo4sCE=
X-Google-Smtp-Source: AGHT+IFzjfgPVAMDP/IlnyhvMVGjufQyfLVhLezbz0C9N3wFwCNGl/Q+UyVhyvKUu5mXkp/cCiQSbQ==
X-Received: by 2002:a05:6870:3911:b0:1b0:3d61:553e with SMTP id b17-20020a056870391100b001b03d61553emr14068619oap.15.1691503185589;
        Tue, 08 Aug 2023 06:59:45 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:86d6:7871:f7e9:8a15:865a])
        by smtp.gmail.com with ESMTPSA id tp11-20020a0568718b8b00b001bec2a8f4e3sm6074614oab.14.2023.08.08.06.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:59:45 -0700 (PDT)
Date: Tue, 8 Aug 2023 10:59:40 -0300
From: Alexon Oliveira <alexondunkan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH v3] staging: vme_user: fix alignment of open parenthesis and
 deleted trailing spaces
Message-ID: <ZNJKTLZ62SZMM6D8@alolivei-thinkpadt480s.gru.csb>
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

Changes in v3:
- Rebased against staging.git and staging-next branch, noted by Greg KH

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

