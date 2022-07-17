Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617CD2906
	for <linux-staging@lists.linux.dev>; Sun, 17 Jul 2022 22:20:25 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id g1so13048775edb.12
        for <linux-staging@lists.linux.dev>; Sun, 17 Jul 2022 15:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CS/R4BBOiK/7PZe73tLvElDqF+cKw+/gEyRw36JfpCc=;
        b=MWAXpn5nsIZh8pGmb2NsgT4fEYy+1zmp2gxD9Wpzz1OzoZAD17GAtDydbKj6ACLFKy
         tDBmm1EIlKl9SBBDpH6sSE+txzuZVlDS6ZuH9HiDRQbmXFlks6K0flkH32Byavjvo6qR
         3WzstgE0a1kLsdrC1ahHA4qognmTNqat77FTV6CkXbMRY7GsbW/5SAsSwV5/o1ziLEU8
         mvfXDnj1eDpirND6XgyQSIqJ/2imykM5NbrkjGbqrNEOQajhj/cr71XUfe2U3TaLRsXN
         /4KCSXUtXP5Pkme1xPhoIvw5BMZ7NByGR/oOdAYLqwxU/0OqP5TdpJd6rcBqdvEFSMg0
         8Gxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CS/R4BBOiK/7PZe73tLvElDqF+cKw+/gEyRw36JfpCc=;
        b=lfufuC+v6bXqfRqHSJPVFGvaP3s4ywYotz9K9H+XpTNcLScut7L2T6D0XxNLE53Nk8
         6aQVyou5tRtJNXgntI8XfuZgQOy+8N6DZQ+6GSLkOQXneAQpu/2g7kWWR0wJJq1FE1+F
         6a9mbWDBK9udPdGNJAuLTgnZcS5DMukyHgbduIpi0EARpBOu4iiron0uevcbgZiRYq8l
         LTXY0v+/06urnBS4+HtUrOPMED8kXgr1VOlssm14kdkG2G4CRSIwJSEuj9c7YXX+7WQM
         7TZ9hleGo727v86Kr/JHMXdvdkLVb6h+F/tnulQeLBQmYKEP1qoGjau+U4xtNt6v00pw
         Rx+w==
X-Gm-Message-State: AJIora+l4me+htV65fcek6Wt7Sq3X6iJKbmiWXkQKZNiOlPINrmC7a1G
	v2athBQM9b8J2VFDkV5Jg+o=
X-Google-Smtp-Source: AGRyM1tQtMwf156iGbjB7Yd/tPtQT0oaQ3GrNSPIMSpgvlq2a7N5QBNDa6iUjFN3CUNcyEGyuZ+Gzw==
X-Received: by 2002:a05:6402:5418:b0:435:5a48:daa9 with SMTP id ev24-20020a056402541800b004355a48daa9mr33682976edb.304.1658096423688;
        Sun, 17 Jul 2022 15:20:23 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id kw5-20020a170907770500b0072f07213509sm3178268ejc.12.2022.07.17.15.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 15:20:23 -0700 (PDT)
Date: Mon, 18 Jul 2022 00:20:21 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] staging: vt6655: Add parameter to function
 vt6655_mac_dma_ctl
Message-ID: <476d9023863899ebd6f515e6a5c9022c9fd64d84.1658094708.git.philipp.g.hortmann@gmail.com>
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

Add one parameter to avoid multiple repetitions of the same macro/function.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/device_main.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index cf25644f8671..31e0e55b9220 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -125,7 +125,7 @@ static void device_print_info(struct vnt_private *priv);
 static void vt6655_mac_write_bssid_addr(void __iomem *iobase, const u8 *mac_addr);
 static void vt6655_mac_read_ether_addr(void __iomem *iobase, u8 *mac_addr);
 
-static void vt6655_mac_dma_ctl(void __iomem *iobase);
+static void vt6655_mac_dma_ctl(void __iomem *iobase, u8 reg_index);
 
 static int device_init_rd0_ring(struct vnt_private *priv);
 static int device_init_rd1_ring(struct vnt_private *priv);
@@ -207,15 +207,15 @@ static void vt6655_mac_read_ether_addr(void __iomem *iobase, u8 *mac_addr)
 	iowrite8(0, iobase + MAC_REG_PAGE1SEL);
 }
 
-static void vt6655_mac_dma_ctl(void __iomem *iobase)
+static void vt6655_mac_dma_ctl(void __iomem *iobase, u8 reg_index)
 {
 	unsigned long reg_value;
 
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
@@ -433,7 +433,7 @@ static void device_init_registers(struct vnt_private *priv)
 		vt6655_mac_reg_bits_on(priv->port_offset, MAC_REG_RCR, RCR_WPAERR);
 
 	/* Turn On Rx DMA */
-	vt6655_mac_dma_ctl(priv->port_offset);
+	vt6655_mac_dma_ctl(priv->port_offset, MAC_REG_RXDMACTL0);
 	MACvReceive1(priv->port_offset);
 
 	/* start the adapter */
@@ -1148,7 +1148,7 @@ static void vnt_interrupt_process(struct vnt_private *priv)
 
 		isr = ioread32(priv->port_offset + MAC_REG_ISR);
 
-		vt6655_mac_dma_ctl(priv->port_offset);
+		vt6655_mac_dma_ctl(priv->port_offset, MAC_REG_RXDMACTL0);
 		MACvReceive1(priv->port_offset);
 
 		if (max_count > priv->opts.int_works)
-- 
2.37.1

