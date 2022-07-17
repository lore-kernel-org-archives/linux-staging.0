Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E0C2906
	for <linux-staging@lists.linux.dev>; Sun, 17 Jul 2022 22:20:29 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id va17so18396354ejb.0
        for <linux-staging@lists.linux.dev>; Sun, 17 Jul 2022 15:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OnSb4cWLjt1pnom/8Wk4obyvClEVJICo+D/S3R4PBI4=;
        b=G3FtfebYwFbuog5iXivUQ61G4ZOlpCRwTGQJbG8p7Op3yRfieh7Csn5gpHNJ8nNw2e
         OAVyuIeQ1ddoC7cGyxbviPgL87LtvxPN5+ZiLDyflV8mlYtxeT0kVZj0P9vIvN2Nvp3X
         SWO4XRRbZ/BGWbETa3Z5FC5cGPPBxMVv+Q0RviL7RnJCHVBg+g+WrZBQhc41COjgPcbp
         6bfiDj1C7SwbuQR9KYIuoaeL7s7rBdYliBbCDPc1lFcuasjxPKGIje5/rTQVCegRmVIV
         dRBzYkMPmbocw3xCLfkn35kqCWCwJzy8M6b1kEOvtqS0mUge4LVryBxbIA/xoo0gQI98
         1yTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OnSb4cWLjt1pnom/8Wk4obyvClEVJICo+D/S3R4PBI4=;
        b=FNxjs4xyFHzk7k/jvTcEKAoTcV5Ob9lbaoYyuYtD8IiMU8gaDpDgTdEY4mJwZ8H5T2
         BG21EyL4jShV7KXPgUVYH+e9RuUVBllEtzVB68j+KMF+NdNDtDVwnocOzkG/vabgSJbi
         523sd2w146ghCLL5/T6LForP+fAyBle0TLvj2icHA+JiieLlCXTIwJ+k0Vsnn6g5w5kU
         zS8cTCh8cZAeKc0auKZT0m5B1zIBMf8AEIT8OREjvCJovoos1zjnriGz6Nxl+ssoZl7z
         kGcKnQ+y5stb8UtdqIci2H5Gi8SzTdmO0g1G13nG+sfL4JsHO0++sXZYgnqOReePr2Uz
         lW9Q==
X-Gm-Message-State: AJIora+HhcPLsA5+IydMui5sWLb28OsQlWrpDypFr5cU+D39swwKcs/Z
	w4GwZ5P3dm6uO1m64Y1wOWc=
X-Google-Smtp-Source: AGRyM1t/ChPmaw/+zDHud+lvcfgi6W8mcKEtpJXF/7FFipoDl0OeyHnCUKiNZxmT/Dg363MAwymUsw==
X-Received: by 2002:a17:907:60c7:b0:72e:d01f:b884 with SMTP id hv7-20020a17090760c700b0072ed01fb884mr19613051ejc.550.1658096427670;
        Sun, 17 Jul 2022 15:20:27 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id l10-20020a1709060cca00b0070b7875aa6asm4715913ejh.166.2022.07.17.15.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 15:20:27 -0700 (PDT)
Date: Mon, 18 Jul 2022 00:20:25 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] staging: vt6655: Replace MACvReceive1 with function
 vt6655_mac_dma_ctl
Message-ID: <c433e54f0fae051fc8ba9050aa094d6f7141e8d4.1658094708.git.philipp.g.hortmann@gmail.com>
References: <cover.1658094708.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1658094708.git.philipp.g.hortmann@gmail.com>

checkpatch.pl does not accept multiline macros.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/device_main.c |  4 ++--
 drivers/staging/vt6655/mac.h         | 10 ----------
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 31e0e55b9220..01ce1c90ab09 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -434,7 +434,7 @@ static void device_init_registers(struct vnt_private *priv)
 
 	/* Turn On Rx DMA */
 	vt6655_mac_dma_ctl(priv->port_offset, MAC_REG_RXDMACTL0);
-	MACvReceive1(priv->port_offset);
+	vt6655_mac_dma_ctl(priv->port_offset, MAC_REG_RXDMACTL1);
 
 	/* start the adapter */
 	iowrite8(HOSTCR_MACEN | HOSTCR_RXON | HOSTCR_TXON, priv->port_offset + MAC_REG_HOSTCR);
@@ -1149,7 +1149,7 @@ static void vnt_interrupt_process(struct vnt_private *priv)
 		isr = ioread32(priv->port_offset + MAC_REG_ISR);
 
 		vt6655_mac_dma_ctl(priv->port_offset, MAC_REG_RXDMACTL0);
-		MACvReceive1(priv->port_offset);
+		vt6655_mac_dma_ctl(priv->port_offset, MAC_REG_RXDMACTL1);
 
 		if (max_count > priv->opts.int_works)
 			break;
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 5747de436911..129a6602f6f0 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -537,16 +537,6 @@
 
 /*---------------------  Export Macros ------------------------------*/
 
-#define MACvReceive1(iobase)						\
-do {									\
-	unsigned long reg_value;					\
-	reg_value = ioread32(iobase + MAC_REG_RXDMACTL1);		\
-	if (reg_value & DMACTL_RUN)					\
-		iowrite32(DMACTL_WAKE, iobase + MAC_REG_RXDMACTL1);	\
-	else								\
-		iowrite32(DMACTL_RUN, iobase + MAC_REG_RXDMACTL1);	\
-} while (0)
-
 #define MACvTransmit0(iobase)						\
 do {									\
 	unsigned long reg_value;					\
-- 
2.37.1

