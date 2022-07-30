Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643B93D90
	for <linux-staging@lists.linux.dev>; Sat, 30 Jul 2022 19:20:34 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id tk8so13738716ejc.7
        for <linux-staging@lists.linux.dev>; Sat, 30 Jul 2022 12:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc;
        bh=HUoAZomuVEY3gWZs5PRO+GGlcpFSS2IlF4vVoPzeVgo=;
        b=HN2RwIDPEaVjNCV1XzPSUga1o1wtGNu7/UOLJgj5RnVjBNZl8cPif4Pxk1u6M9PH4/
         Xu9ffrQZeQ+D/+BB4eGl9BYvWuSdr/ZUtsQvlGgNskCjhn71D/8auNidWLp6ciZ9kvXO
         e52PgPCQw58BC7ngd6FnNKLujO0vTQvBkvu9wrWR/8tCB6tf5yuHY5S9/brMiDb+u9hL
         cYE1OcJD8b93E9/4usiin2XhQSlusoK2Vd8f2dTyyc7bpSE10pwCIdjIixrniaQMixuU
         UPgxLc2UHLjoalNv8BrGs3UvhvXlEBftUFZm2nRNdorbB9luhtO7kf3PYyPsnjoHAm7M
         mI0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc;
        bh=HUoAZomuVEY3gWZs5PRO+GGlcpFSS2IlF4vVoPzeVgo=;
        b=SMEA1QNExZJf/otXOK3nl7r/9+FCnM6peCkXmU4Gahzcal8ZCgedSkMllAOThgjfkx
         tQcXfdvAWvZQb/r+Z4fdnQVRwxt2ZqleH78U5PO5OQdkaOIQGj8SjDJwHlkT8wf2HjhW
         pnGgaoMxv8GhQfgemG8F8ZdBfAET7gs2LM6X8bO3IH/hS/3KFmy7XRgrjgnSYdFJxry8
         n3ZNeel/iskeEIQm/LxqZiVChSnPOWyBhzco5eYAyfK/SCTpo2LE75t4Rc20oEpyLLOC
         eoiZ5jNu7Lg2JLfh7ry0ssxiBAqDJhvn40KTLYqRHhnZWnpNGrTpekuDqK0xk0FuiT79
         Uqew==
X-Gm-Message-State: AJIora+jc4jX6eBgMFGqGJgwYS/GHZKYcZLBovCp5LC5OE+YPXGKSRjd
	K/bhvlYc1A7ni2fprgSlQNI=
X-Google-Smtp-Source: AGRyM1sJVck7k58kzPJmFKFcb8QhrXHG/kmie+BSgXBXqzStigwLX5UwwNgDAkLGbL4Ay+EMMYZu1A==
X-Received: by 2002:a17:907:2cef:b0:72b:5b3e:3d7a with SMTP id hz15-20020a1709072cef00b0072b5b3e3d7amr6942572ejc.293.1659208832652;
        Sat, 30 Jul 2022 12:20:32 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id g10-20020a1709067c4a00b0072ab06bf296sm3282425ejp.23.2022.07.30.12.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jul 2022 12:20:32 -0700 (PDT)
Date: Sat, 30 Jul 2022 21:20:30 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] staging: vt6655: Create one function for four macros
Message-ID: <d4768227a7ea10ccec6d08eb0c55f8790ef70379.1659192760.git.philipp.g.hortmann@gmail.com>
References: <cover.1659192760.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1659192760.git.philipp.g.hortmann@gmail.com>

Create function vt6655_mac_en_dis_bits_u32_reg with three parameters to
cover functionality of four macros.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/device_main.c | 12 ++++++++++--
 drivers/staging/vt6655/mac.h         |  3 +++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 3565aa53f007..5f64204dc312 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -216,15 +216,23 @@ static void vt6655_mac_dma_ctl(void __iomem *iobase, u8 reg_index)
 		iowrite32(DMACTL_RUN, iobase + reg_index);
 }
 
-static void MACvEnableProtectMD(void __iomem *iobase)
+static void vt6655_mac_en_dis_bits_u32_reg(void __iomem *iobase, bool en_not_dis, u32 bit_mask)
 {
 	u32 reg_value;
 
 	reg_value = ioread32(iobase + MAC_REG_ENCFG);
-	reg_value = reg_value | ENCFG_PROTECTMD;
+	if (en_not_dis)
+		reg_value = reg_value | bit_mask;
+	else
+		reg_value = reg_value & ~bit_mask;
 	iowrite32(reg_value, iobase + MAC_REG_ENCFG);
 }
 
+static void MACvEnableProtectMD(void __iomem *iobase)
+{
+	vt6655_mac_en_dis_bits_u32_reg(iobase, ENABLE, ENCFG_PROTECTMD);
+}
+
 /*
  * Initialisation of MAC & BBP registers
  */
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 84d203c56b1f..31e75df5f02f 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -21,6 +21,9 @@
 #include "device.h"
 
 /*---------------------  Export Definitions -------------------------*/
+#define ENABLE 1
+#define DISABLE 0
+
 /* Registers in the MAC */
 #define MAC_MAX_CONTEXT_SIZE_PAGE0  256
 #define MAC_MAX_CONTEXT_SIZE_PAGE1  128
-- 
2.37.1

