Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B33D2906
	for <linux-staging@lists.linux.dev>; Sun, 17 Jul 2022 22:20:16 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id mf4so18330103ejc.3
        for <linux-staging@lists.linux.dev>; Sun, 17 Jul 2022 15:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nyzrG7hvu7Tya4/vV8pmII/H6wDDB9RTk/WzCNXAw9k=;
        b=M9RYUWBwLBPtjW4ovR1ITfkUnU/FcuZHLn29wzsdn4rBpldeNcGF675pbUpUzFyNch
         l4frv/nTU/6Cw8AjtSyECcnyyk1DuGJ14R8B3QwGt9Ox8pfwR98Ce8gNDNzND0jxZlEl
         OGxGDyQxXTlneyhH7cXYkUfYUFklQ8VfCMNgz0mZfrEf7crtrFPS96tgtfOtns70dLpL
         1fYW7fiqseVLI6XixVxBvjAJFzfeerlLd4VonVzJSR3BAAxagujuF3yz8BNnXCsUyp3x
         DapkBkQZJsGf3VyHlcNo5prpWiNHQ/k85XQf/ki1CklJW80PIEwwIFHd80FJm1FVPdOx
         uMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nyzrG7hvu7Tya4/vV8pmII/H6wDDB9RTk/WzCNXAw9k=;
        b=j9F3m3RAhhA9esb7ChxquprmooSQd8kj5iRq+lwPvbnS9sx4b8H3AdVEhp9mLutf2Q
         aH99XHqRFv1KiZpz4qHPLgIDd99FsQf04U8fdYcuMV3PNsE5AVUmLuJLTX29I0yDwnaY
         B/XV5IxtmwZ/1I4f6xhZHTMCIr+Z0xaIiRM08L1MibwOGiPGUe6FGvMM0W9hjsa2AaJp
         1vb8JnJKJHhlgFhsapZPbN2TTjzTNa4hYMvq+lM/YJbTux8+PWq9VnZUFP3ea0d87/xf
         Qz/tSCK/u7TZ/6Qt8yfV2H6FwxTdeqU9LkuqzRuG1RtCixkoZK26X7EXIPRxtdf6Dafq
         RUWw==
X-Gm-Message-State: AJIora8yk7caa3p9HQxyg7dh/xr1TKPg7iKXv1VvfVwzNS9HLgjI6/Yi
	LrFlFZ3JPZWJWI4QBGCFTvs=
X-Google-Smtp-Source: AGRyM1sVirgPePIu4omTVkD83lwQdD6wG5OsPsxHaGxqVVpI8eqVl2tSlKgyQDy5hOknN6dZcFCj/w==
X-Received: by 2002:a17:907:75c1:b0:72f:248d:5259 with SMTP id jl1-20020a17090775c100b0072f248d5259mr4103463ejc.227.1658096414764;
        Sun, 17 Jul 2022 15:20:14 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id h27-20020a170906719b00b0072aeaa1bb5esm4775365ejk.211.2022.07.17.15.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 15:20:14 -0700 (PDT)
Date: Mon, 18 Jul 2022 00:20:12 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] staging: vt6655: Rename MACvReceive0
Message-ID: <d66d14075f365d26438c955082649a3e455542e4.1658094708.git.philipp.g.hortmann@gmail.com>
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

Fix name of a macro that uses CamelCase which is not
accepted by checkpatch.pl

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
Please read all patches of this series then the
new name makes sense.
---
 drivers/staging/vt6655/device_main.c | 4 ++--
 drivers/staging/vt6655/mac.h         | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 92583ee8bffd..6525b7baf644 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -420,7 +420,7 @@ static void device_init_registers(struct vnt_private *priv)
 		vt6655_mac_reg_bits_on(priv->port_offset, MAC_REG_RCR, RCR_WPAERR);
 
 	/* Turn On Rx DMA */
-	MACvReceive0(priv->port_offset);
+	vt6655_mac_dma_ctl(priv->port_offset);
 	MACvReceive1(priv->port_offset);
 
 	/* start the adapter */
@@ -1135,7 +1135,7 @@ static void vnt_interrupt_process(struct vnt_private *priv)
 
 		isr = ioread32(priv->port_offset + MAC_REG_ISR);
 
-		MACvReceive0(priv->port_offset);
+		vt6655_mac_dma_ctl(priv->port_offset);
 		MACvReceive1(priv->port_offset);
 
 		if (max_count > priv->opts.int_works)
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index bfcbeb96f839..60e0f980bcc5 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -537,7 +537,7 @@
 
 /*---------------------  Export Macros ------------------------------*/
 
-#define MACvReceive0(iobase)						\
+#define vt6655_mac_dma_ctl(iobase)					\
 do {									\
 	unsigned long reg_value;					\
 	reg_value = ioread32(iobase + MAC_REG_RXDMACTL0);		\
-- 
2.37.1

