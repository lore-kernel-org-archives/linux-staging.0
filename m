Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDE84C6C
	for <linux-staging@lists.linux.dev>; Mon, 22 Aug 2022 22:42:53 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id c9so7920333qkk.6
        for <linux-staging@lists.linux.dev>; Mon, 22 Aug 2022 15:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc;
        bh=6C/d8xlHQCGOlClXK65WdMdS1M8Gsu61gKL4UEc2TB8=;
        b=p/68VzadPb34Psj/7p/+bpCgGsInjxK7JXKHCtWZIF7GrlzSxf0Pak5jJxw8fMbdu/
         QU59+q+I1IAWDFndRk82ue5jatLFF5apcfv5vWxPC/dAx4l1/VQlbGZplcTGxgkbs4qM
         sCko3XKSlsxJoC7zPduKFee+QyycEODSRjDbbsOwVliJ6wwnSF25VMy1gKzJeXP9Yrrb
         JHLlsAhZj5Fd7eCoUozNQHzjTj562sFrB8cPiVpfWCPKHyH0R3o9zx5qYQrDXY7rQM9c
         78QyeiGrSsDQeZ3Bc1T55qLZPU264B4krlqYHGlW1YTDUotx/J+bTSUiXu4N/NTRHKo+
         Vmhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=6C/d8xlHQCGOlClXK65WdMdS1M8Gsu61gKL4UEc2TB8=;
        b=LAtbO8SxA0AV34EJTOAw9RmaFWyKZWGEY02mMYrB1XCtwFZPsSNRPcJICb32CQQRqu
         qgIfI7L0UgY80LZ6UyqrNeHf/zP2FEoAxw5/FZFu1pzxNpkNjQK5IxcxZal6fz1VWedD
         I4XiHe+DruUVtggDes4NKC67ZhXVrI1kMwKrpiI0xcb4J0JN71h3v0rvCu7pkrkgkz/E
         LypchKs8qV/X0Mv2Q17VhHd5CX2IB+qZYbmmeQ//GKeLoMDnZObhE1aPlBptGP7C+sDR
         svlyGzL1nGR8BdUV6m9G3bUkYLFqdSRAcYqQOk0/YB0+G7rxWpa2iQ6Q5SW7LFKdsOEe
         RFmw==
X-Gm-Message-State: ACgBeo3UJFFK8qreaJUTTuBOBCxAJ59r6iG8AbEBRILK8/hjZXTQJ31V
	PKdtxtdwPZB3o/iAinTopcc=
X-Google-Smtp-Source: AA6agR6193RM0nlcmpDSpP0KqEk10dsmRjfuA66BmNYTxwnKHnK7MI+FnN8t13CU1o+X6L17OmsoRg==
X-Received: by 2002:a05:620a:4e1:b0:6bb:5c0e:ab58 with SMTP id b1-20020a05620a04e100b006bb5c0eab58mr14525126qkh.730.1661208172231;
        Mon, 22 Aug 2022 15:42:52 -0700 (PDT)
Received: from valhalla (2603-7081-5203-61c3-0000-0000-0000-1449.res6.spectrum.com. [2603:7081:5203:61c3::1449])
        by smtp.gmail.com with ESMTPSA id hg17-20020a05622a611100b0034359fc348fsm9521347qtb.73.2022.08.22.15.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 15:42:51 -0700 (PDT)
Date: Mon, 22 Aug 2022 18:42:48 -0400
From: Christopher Carbone <chris.m.carbone@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: sm750fb: split multiple assignments to lines
Message-ID: <YwQGaLoBHH9C0aXN@valhalla>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Adhere to Linux kernel coding style.

Reported by checkpatch:

CHECK: multiple assignmentst should be avoided

Signed-off-by: Christopher Carbone <chris.m.carbone@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index dbd1159a2ef0..6f4c31635cc4 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -386,7 +386,8 @@ static int lynxfb_ops_set_par(struct fb_info *info)
 
 	ret = lynxfb_set_color_offsets(info);
 
-	var->height = var->width = -1;
+	var->height  = -1;
+	var->width = -1;
 	var->accel_flags = 0;/*FB_ACCELF_TEXT;*/
 
 	if (ret) {
@@ -498,7 +499,8 @@ static int lynxfb_ops_check_var(struct fb_var_screeninfo *var,
 		return ret;
 	}
 
-	var->height = var->width = -1;
+	var->height = -1;
+	var->width = -1;
 	var->accel_flags = 0;/* FB_ACCELF_TEXT; */
 
 	/* check if current fb's video memory big enough to hold the onscreen*/
@@ -723,7 +725,8 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 		0x800f0 + (int)crtc->channel * 0x140;
 
 	pr_info("crtc->cursor.mmio = %p\n", crtc->cursor.mmio);
-	crtc->cursor.max_h = crtc->cursor.max_w = 64;
+	crtc->cursor.max_h = 64;
+	crtc->cursor.max_w = 64;
 	crtc->cursor.size = crtc->cursor.max_h * crtc->cursor.max_w * 2 / 8;
 	crtc->cursor.vstart = sm750_dev->pvMem + crtc->cursor.offset;
 
@@ -1027,7 +1030,8 @@ static int lynxfb_pci_probe(struct pci_dev *pdev,
 	if (!sm750_dev)
 		return err;
 
-	sm750_dev->fbinfo[0] = sm750_dev->fbinfo[1] = NULL;
+	sm750_dev->fbinfo[0] = NULL;
+	sm750_dev->fbinfo[1] = NULL;
 	sm750_dev->devid = pdev->device;
 	sm750_dev->revid = pdev->revision;
 	sm750_dev->pdev = pdev;
-- 
2.37.2

