Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55483D76
	for <linux-staging@lists.linux.dev>; Fri, 29 Jul 2022 08:14:28 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id z22so4901986edd.6
        for <linux-staging@lists.linux.dev>; Fri, 29 Jul 2022 01:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tld5gMWJsp3kV9hB3O0WlH/vr+yYwLN7z32U+sL7wws=;
        b=XZSCO6k5T8iolGHuAQUnp4oI+0aciy6f+kG8Zlj09o3633lzPBTOhD4YFFkyb8RYW1
         guG+YkmWGMe1BUUcN209Fwth3zqheiFTafLkAUmFDCCYarmcZprgn0axBw5+JfFB34qj
         RBEvMgwy6d9nhLRMRXYu0Dc+iJXZJdBnYwQMTAYbdVDO0Kfqz4Tfz7Y5dMuaJNkPQfGf
         U78hk3DKCecuCJ5taP9c2J/jhsFAxRW6Uf+8Jp0zxfVZ0mjEFcdBcIkBqo9nOoDpiXq3
         JVFhtFGCS+iev5MjnJ8zD1tR2JcWzC2QDOzCLfeAlYWOC9C6FUo5s0pan8+9/Uq50qpP
         LaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tld5gMWJsp3kV9hB3O0WlH/vr+yYwLN7z32U+sL7wws=;
        b=YuQKpBvxAMlvYhQ8aJCXxsW5t5WK8sgkahpWGeyND6YTCQoeoDdL8ilxYk8ijBGkSo
         RsoOgzZTnWWLkDHoc5ZkS3CvOIYzMsSJ38OdBSpAfUDDskWB3pJF4XZrva5xMprjS44q
         MJuFgrQqam8oFTO+gfoSHWgvl/BwLNOd8cxrvpa6Kgu/W4JYdrXXLHfuCS3k7aOmcK9w
         nG2ZxYCvBwA0vGUEBV8Jvl4azYzMGfXeifyEGiO2IWWDQT/CXw7qNH5GzrTWKbh4HP0Y
         2R7kERJhXMTv/+LGjRQMok4YQekaIxeERp4p/stvath7POV+CwOcrPWyv8TghEFCE5pN
         XLMA==
X-Gm-Message-State: AJIora/X3XzUAjJUa412wb99b7nHh9i9FjQNMeufQw1UKZ18Mva3g44n
	wwWlqsmfesq/wmoWIeyapWQ=
X-Google-Smtp-Source: AGRyM1shgJ8iVuBfVAGM8u07JMkbeCYmk9v/QuW7OvpREHWc7F/JnbQ/vH8RLlSBn51LTF42dAFNgA==
X-Received: by 2002:a05:6402:1859:b0:43c:b0db:3f9a with SMTP id v25-20020a056402185900b0043cb0db3f9amr2474362edy.120.1659082467018;
        Fri, 29 Jul 2022 01:14:27 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id 24-20020a170906301800b007262a1c8d20sm1402066ejz.19.2022.07.29.01.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 01:14:26 -0700 (PDT)
Date: Fri, 29 Jul 2022 10:14:25 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] staging: vt6655: Rename function MACvReceive0 and add
 parameter
Message-ID: <e5ca6208263d5aa3f1d6f0359fa602187d799f19.1659080988.git.philipp.g.hortmann@gmail.com>
References: <cover.1659080988.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1659080988.git.philipp.g.hortmann@gmail.com>

Rename MACvReceive0 function to vt6655_mac_dma_ctl to avoid CamelCase
which is not accepted by checkpatch.pl and to clean up namespace. Add
one parameter to avoid multiple repetitions of the same function.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
V1 -> V2: Combind patch "Add parameter to function vt..." with this one
          Changed order of renaming function and conversion to function
          Improved patch description
---
 drivers/staging/vt6655/device_main.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 39bfbb1ab742..fb40d71d9e8e 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -205,15 +205,15 @@ static void vt6655_mac_read_ether_addr(void __iomem *iobase, u8 *mac_addr)
 	iowrite8(0, iobase + MAC_REG_PAGE1SEL);
 }
 
-static void MACvReceive0(void __iomem *iobase)
+static void vt6655_mac_dma_ctl(void __iomem *iobase, u8 reg_index)
 {
 	u32 reg_value;
 
-	reg_value = ioread32(iobase + MAC_REG_RXDMACTL0);
+	reg_value = ioread32(iobase + reg_index);
 	if (reg_value & DMACTL_RUN)
-		iowrite32(DMACTL_WAKE, iobase + MAC_REG_RXDMACTL0);
+		iowrite32(DMACTL_WAKE, iobase + reg_index);
 	else
-		iowrite32(DMACTL_RUN, iobase + MAC_REG_RXDMACTL0);
+		iowrite32(DMACTL_RUN, iobase + reg_index);
 }
 
 /*
@@ -431,7 +431,7 @@ static void device_init_registers(struct vnt_private *priv)
 		vt6655_mac_reg_bits_on(priv->port_offset, MAC_REG_RCR, RCR_WPAERR);
 
 	/* Turn On Rx DMA */
-	MACvReceive0(priv->port_offset);
+	vt6655_mac_dma_ctl(priv->port_offset, MAC_REG_RXDMACTL0);
 	MACvReceive1(priv->port_offset);
 
 	/* start the adapter */
@@ -1146,7 +1146,7 @@ static void vnt_interrupt_process(struct vnt_private *priv)
 
 		isr = ioread32(priv->port_offset + MAC_REG_ISR);
 
-		MACvReceive0(priv->port_offset);
+		vt6655_mac_dma_ctl(priv->port_offset, MAC_REG_RXDMACTL0);
 		MACvReceive1(priv->port_offset);
 
 		if (max_count > priv->opts.int_works)
-- 
2.37.1

