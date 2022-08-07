Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB553C15
	for <linux-staging@lists.linux.dev>; Sun,  7 Aug 2022 18:13:41 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id a7so12911573ejp.2
        for <linux-staging@lists.linux.dev>; Sun, 07 Aug 2022 11:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc;
        bh=zD17J0eH2wPYwZr+9CUo9VuUmFGElTpvvgk6zTTTY90=;
        b=ZztM717a1mtjobKwFBK8U7wqJxMgEkltelF826ecqjXXWaGseSHNt0g8ztaSXMmX8x
         y1fLdu47CanmPT4NNAEYwSfVblRpWlZNsYef7x4+nI91wuIItOKkdxnov90ntvrdNuXU
         97m/e7HXAvwsmm2fKGLxHrZF8t0dxrBpQlXZhsSqa1cvaCtalCqwuveCzcC9L2HTJB0+
         IbsQLP0khV8XSwykp8q04EO353l38aQ2FqNVeARAuHDWIhWpNpvw2nnIu4Xey8GYPRAW
         mWbAnFNXQaxS3NwD4GpaNeCxd68fh5NKkgNwqTJbjZsMcJKUefBFwkylprvd/ZBXH5CW
         /V7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc;
        bh=zD17J0eH2wPYwZr+9CUo9VuUmFGElTpvvgk6zTTTY90=;
        b=Dl9KMn5HC+SnDtJKa7RM6wh616b2FhSZs9ZIDsRDZcMnXej7KTzY14tujb2b60ly4g
         LZJwaa5nnGbGIvbqf0YEsvU3sZqezN/wK6875vgaczsgorHNwF2SRxluoIaGNOBxwhm+
         x14JG1Em00/mdebHn5WscvTygUzcsmVMOQGAbh+UmkkpQb9U8ZahL+5vv9GO3mdcBqlR
         xLELIOPEAYk3PBkyZ1dA+o/dR8bPELjSmkjXXxANNRd364WcMcsNTVeLvhUzHO9ZoGNz
         GTNmyndxC0ArgnpoGILhq//nakDLDL3e5eAH6UD35EyoEMzYU6+qfaWT5HwzZup5IjLR
         4tyQ==
X-Gm-Message-State: ACgBeo19HJ0FjuUnkCc7/SaeVXnQgQVTLbKJUFKy5laokUjNiKcUEXDu
	45d+UqZiUnnEJnVlCh/ptOzX8m7w+sw=
X-Google-Smtp-Source: AA6agR6Xa3KQwBv71sNy/xYGmyk4Ok+a6lmfLPRbZ/59pl81W9v6lO0IN7Eaqne1ge7LY3x3IY5X0A==
X-Received: by 2002:a17:906:8a4e:b0:730:9fcd:d988 with SMTP id gx14-20020a1709068a4e00b007309fcdd988mr11498063ejc.636.1659896019873;
        Sun, 07 Aug 2022 11:13:39 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id q9-20020a170906540900b0073073ce488asm4021819ejo.45.2022.08.07.11.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 11:13:39 -0700 (PDT)
Date: Sun, 7 Aug 2022 20:13:37 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] staging: vt6655: Create one function for two macros
Message-ID: <78883f42b2df258dbf821d7f7515a82932a157f1.1659892670.git.philipp.g.hortmann@gmail.com>
References: <cover.1659892670.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1659892670.git.philipp.g.hortmann@gmail.com>

Create function vt6655_mac_set_bits with two parameters to cover
functionality of two macros.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
V1 -> V2: Change function to cover only the set bits part and omitted
          the clear bits part
          Changed title from "...four..." to "...two..."
          Changed description accordingly
---
 drivers/staging/vt6655/device_main.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index ab6456fc2b3f..dc50bff4403f 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -216,15 +216,20 @@ static void vt6655_mac_dma_ctl(void __iomem *iobase, u8 reg_index)
 		iowrite32(DMACTL_RUN, iobase + reg_index);
 }
 
-static void MACvEnableProtectMD(void __iomem *iobase)
+static void vt6655_mac_set_bits(void __iomem *iobase, u32 mask)
 {
 	u32 reg_value;
 
 	reg_value = ioread32(iobase + MAC_REG_ENCFG);
-	reg_value = reg_value | ENCFG_PROTECTMD;
+	reg_value = reg_value | mask;
 	iowrite32(reg_value, iobase + MAC_REG_ENCFG);
 }
 
+static void MACvEnableProtectMD(void __iomem *iobase)
+{
+	vt6655_mac_set_bits(iobase, ENCFG_PROTECTMD);
+}
+
 /*
  * Initialisation of MAC & BBP registers
  */
-- 
2.37.1

