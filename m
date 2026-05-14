Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9754386C17
	for <linux-staging@lists.linux.dev>; Thu, 14 May 2026 22:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778798287; cv=none; b=mDNPIkF1z+zCcbH+MFU+31dIRPf+1mpj7Dj8Cg+KsuHKeV4uM84qoR09T5pXW2dHhXhdYzmWGfxRpFA9T136PYLUh7Cw1jfGpBJgA3cJtFNGD26v0afVb5PsBIHzTo1LmpwcHUkn7SqYkor/TjorllEMFA/yiMIMwxSuG1IEhHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778798287; c=relaxed/simple;
	bh=xzwea+No2F6iykY0BD0lQPlUplXi4pH4W2/D1TKMCbs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gfFgga0JZeiWcBqs/VAqep7mMma7b8jCwL++/nGtbGRNzCmQMNJYzX7FxGeIhCIb2qjGKJhZQJgUqt36ODRG4HOvYldjx28fyjMr71j+e0LdXezXdNSjdAHGkpqMDMg0Vk8hMQDzE8BA978CmJlXSpzgJSE0YoNj0ImZMnXY32E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QzZPT60w; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QzZPT60w"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a8c6fc5fd3so319563e87.0
        for <linux-staging@lists.linux.dev>; Thu, 14 May 2026 15:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778798284; x=1779403084; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dxX9zvBHyN5ryR1giPLWH6y7DZhntku0F/oiu9fU2Bk=;
        b=QzZPT60wHNF0TPvq9CsVkgsRWIjlnw6L64k1XIbecnTtDaMgs3AyfCDxPCTeq7z8r5
         7suYpAsucD0Vj9NQVltMtn4SxZYfjDW9vdXXMAOS57nygfcc5cF1f9o4S10c/2fIkKT3
         Au31+AKNUXVr4rDoeO1KmO4K9m+QJxlcNPsr4S3KY0aksL89wCZzFJ4b5MrpqcifSvTa
         z9chrn65zFVSf7KFbgrAHDpamreIpF9vu8L/yl0mDUY+WJx6OAlEOQFTpUYLBgt2cqlm
         dduZkLLlhxT267M4BAl3TvOL886eYwgowvAZmgWSMJsMrDYsSrRoy923oRD+53HN0Ca4
         5NnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778798284; x=1779403084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxX9zvBHyN5ryR1giPLWH6y7DZhntku0F/oiu9fU2Bk=;
        b=aytnXk+N5AeYT96GpyYCe0+34BfoMZLZ0cyDnw1my8pijupECyqOJOOChOcRzyrDP/
         8Tb1pINbgveUtgPHBVtNJ9M/yDb/tyyj94XhY+EGV74Yv051zwrxPSHdR1nIo5XIoHSp
         G506iqhbMpgIz9KLmEVxE5Yf80zAwwn/YDVGtXAVXz+SsI5SFjohXpLE5b5+G07/Psi4
         HKUO4kGRL+FSkLq0RWKD33HTwd5TDTLpYdCtzWvo1m7LIm/Zf6eHoEtP5dkl5Q0m8Y3v
         KVe/hJga5S9KxMmBbBFZVbo/ZHhcmoSVKbmqUt4hkiowh8qSBHpUrQypsmhwXLSP/PH/
         uypQ==
X-Forwarded-Encrypted: i=1; AFNElJ9+HGjEdhApTgQcyZCkfKvqyL95s47uXQsWJSbct9m6S4z83MpJ9/FvVGqHnafYba4VEBA0ck0OjxlEK1kZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0MHQkmpMhzmfUROwAsTtEQ/Lnb5GjyYRKgu7oYx/gI/Y7Iu1A
	XtNP7y6BhoMdlx9fHSMiAOzkcbQhrqLoLBZmLi4RdwN9d861IFxBhBau
X-Gm-Gg: Acq92OGNy2tDQ9iyt2vYrP53pukgCVojdUaPxXRtKIyLjgXTToPG27uNyTQGVo+/SJH
	i9CNJQ3ESWE4Od/Pin9h4t/AcD2bZnrJ4GtWJQ/1az8iMDbk/ZjC1pvw5uDbxddu/KQwef0umTX
	ha7BVxcJfGIltVQ/hiWW3TZpwnEESquZapQE6PjL8z5KiQHb++rHaNIQyRBpDREPUVSA0jIz48B
	516r0Y/u/RDQr8idv855cp09lqU1tLQhHQBvA6jJsL0PbHl5xanMdePvRaQlGXY8xRFKDpwWmu+
	f0A7p2XB6DglSvLT0V8BPRW9phAYgwZpI9jCLaqO1bNFcMhBWWjIWf8aKvrDwyhSTUtz9ZsauPC
	W1XSL277s42SeQ7IPd6rod6ReDJw+QqUrzSyq8q6l90YItM6ae/P9Nd1jdF3FXu01gqynxHQAEz
	nkx+1sNy8cng/Jftz/zziMEvdXlkUO5tokOmP1jjeQn8pAZBpairp16o3FlA4Ft6EtZRc2t8dsb
	1VxWHU5rvwdcPj7Bw/xQDY=
X-Received: by 2002:a05:6512:6181:b0:5a8:fbe0:bc5f with SMTP id 2adb3069b0e04-5aa0de7351dmr444102e87.5.1778798283749;
        Thu, 14 May 2026 15:38:03 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c8b2sm756279e87.17.2026.05.14.15.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 15:38:03 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: gregkh@linuxfoundation.org
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH] staging: sm750fb: rename CamelCase variables in sm750_hw.c
Date: Fri, 15 May 2026 01:37:49 +0300
Message-ID: <20260514223749.2321542-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renamed the following CamelCase variables to snake_case to comply
with Linux kernel coding style:
- pvReg -> pv_reg
- pvMem -> pv_mem
- initPram -> init_parm

Issue found by checkpatch.

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/staging/sm750fb/sm750_hw.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index ce46f240cbaf..ce6a0d2ebbb5 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -49,19 +49,19 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	}
 
 	/* now map mmio and vidmem */
-	sm750_dev->pvReg =
+	sm750_dev->pv_reg =
 		ioremap(sm750_dev->vidreg_start, sm750_dev->vidreg_size);
-	if (!sm750_dev->pvReg) {
+	if (!sm750_dev->pv_reg) {
 		pr_err("mmio failed\n");
 		ret = -EFAULT;
 		goto exit;
 	}
-	pr_info("mmio virtual addr = %p\n", sm750_dev->pvReg);
+	pr_info("mmio virtual addr = %p\n", sm750_dev->pv_reg);
 
-	sm750_dev->accel.dpr_base = sm750_dev->pvReg + DE_BASE_ADDR_TYPE1;
-	sm750_dev->accel.dp_port_base = sm750_dev->pvReg + DE_PORT_ADDR_TYPE1;
+	sm750_dev->accel.dpr_base = sm750_dev->pv_reg + DE_BASE_ADDR_TYPE1;
+	sm750_dev->accel.dp_port_base = sm750_dev->pv_reg + DE_PORT_ADDR_TYPE1;
 
-	mmio750 = sm750_dev->pvReg;
+	mmio750 = sm750_dev->pv_reg;
 	sm750_set_chip_type(sm750_dev->devid, sm750_dev->revid);
 
 	sm750_dev->vidmem_start = pci_resource_start(pdev, 0);
@@ -76,15 +76,15 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 		sm750_dev->vidmem_start, sm750_dev->vidmem_size);
 
 	/* reserve the vidmem space of smi adaptor */
-	sm750_dev->pvMem =
+	sm750_dev->pv_mem =
 		ioremap_wc(sm750_dev->vidmem_start, sm750_dev->vidmem_size);
-	if (!sm750_dev->pvMem) {
-		iounmap(sm750_dev->pvReg);
+	if (!sm750_dev->pv_mem) {
+		iounmap(sm750_dev->pv_reg);
 		pr_err("Map video memory failed\n");
 		ret = -EFAULT;
 		goto exit;
 	}
-	pr_info("video memory vaddr = %p\n", sm750_dev->pvMem);
+	pr_info("video memory vaddr = %p\n", sm750_dev->pv_mem);
 exit:
 	return ret;
 }
@@ -93,7 +93,7 @@ int hw_sm750_inithw(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 {
 	struct init_status *parm;
 
-	parm = &sm750_dev->initParm;
+	parm = &sm750_dev->init_parm;
 	if (parm->chip_clk == 0)
 		parm->chip_clk = (sm750_get_chip_type() == SM750LE) ?
 					       DEFAULT_SM750LE_CHIP_CLOCK :
@@ -104,7 +104,7 @@ int hw_sm750_inithw(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	if (parm->master_clk == 0)
 		parm->master_clk = parm->chip_clk / 3;
 
-	ddk750_init_hw((struct initchip_param *)&sm750_dev->initParm);
+	ddk750_init_hw((struct initchip_param *)&sm750_dev->init_parm);
 	/* for sm718, open pci burst */
 	if (sm750_dev->devid == 0x718) {
 		poke32(SYSTEM_CTRL,
-- 
2.43.0

