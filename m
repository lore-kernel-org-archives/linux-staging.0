Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017EF7E
	for <linux-staging@lists.linux.dev>; Mon,  4 Jul 2022 18:21:07 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id fi2so17963568ejb.9
        for <linux-staging@lists.linux.dev>; Mon, 04 Jul 2022 11:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9A6wPP/Y//CXYJtxQs8Hsds391x1hM4igQ2mocLqrek=;
        b=i4CLbmgl90VzwHTsq8uaP/EoCwoaD1hZ+YPpjMFwJ5TzaEBvx5+EQ55I9bbC3JuIbL
         5yJ4FDOJCd0nNEvE+ubbl3yCzJq0QHbF5dg4Lq1FrPowF6phIYfeNucqkThmlYSg55Yc
         L0frm+vXsKco7ji1abMH/pW+MHtmogDnEiUl5tjhW+WwUI5Ejo18X8hXD5cb85KPkaKL
         VuXlCItoDbmIAA60lNn1urGuyBrrqzTVii5gexpnSgzd9gSPBik27kAUJKLGx/+pFx14
         OghGaWFiDmMwYgWQEmjdOg8DY5+wFcr8bi07YPfMYH9ltlRSaP6DesE8A2h7a7jekKYl
         cPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9A6wPP/Y//CXYJtxQs8Hsds391x1hM4igQ2mocLqrek=;
        b=o8VQl1F5wXz3i3D9iUg/GkvGqbJC2VJHO14wx0JNuHSReTlBeEO2a657n0Vfl0mkc/
         PUlnKVK1elLXgAYcZhag821XcEEcZU/3UcnXtmB1CxzsmbU0u5dEUsIkyhRICE7RTjYI
         ASUol0Qd3dxvyLLDAU41IayK6vaLbtGGMe0r+5JIRxnoWX1pg/h31V8vYtu6sgHiXI8e
         rMMLZQioaIhR8iQLFroolAUakVQ5o1bf2tsqWUUH1WLmPVpaczJeeC59+u8m8Y/Lb9o1
         MA6rJc7GKDESed/58rpL7XoZAJp1Ihte+LxLIxPvLXf0LjtEqoWGyEOhqn+2MKsrwabL
         GmZg==
X-Gm-Message-State: AJIora9i76DPotIhEd4lo2UmCFRLjAKB9aE7UJCV5Oxo7ev5Ad5jT1+P
	hxwHua4GbwtVhi/BdJTH1Wc=
X-Google-Smtp-Source: AGRyM1u+qh7py3nrb75GEAi2vvjJPq6SLI4xpY194/KWWXF7jJ9fqZIS/WUYA+6LTHTd7+1dAizoaw==
X-Received: by 2002:a17:906:3899:b0:715:9fb4:bd28 with SMTP id q25-20020a170906389900b007159fb4bd28mr29062978ejd.97.1656958866415;
        Mon, 04 Jul 2022 11:21:06 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id t13-20020a056402020d00b0043a71775903sm700493edv.39.2022.07.04.11.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 11:21:06 -0700 (PDT)
Date: Mon, 4 Jul 2022 20:20:57 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] staging: vt6655: Convert macro
 vt6655_mac_write_bssid_addr to function
Message-ID: <caecf7287d92c5d25ba0dfc16a24a6ce4aa67d55.1656835310.git.philipp.g.hortmann@gmail.com>
References: <cover.1656835310.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1656835310.git.philipp.g.hortmann@gmail.com>

Convert macro vt6655_mac_write_bssid_addr to static function.
checkpatch.pl does not accept multiline macros.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/device_main.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index fdb653071918..025a53b493d3 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -122,6 +122,8 @@ static int  vt6655_probe(struct pci_dev *pcid, const struct pci_device_id *ent);
 static void device_free_info(struct vnt_private *priv);
 static void device_print_info(struct vnt_private *priv);
 
+static void vt6655_mac_write_bssid_addr(void __iomem *iobase, const u8 *mac_addr);
+
 static int device_init_rd0_ring(struct vnt_private *priv);
 static int device_init_rd1_ring(struct vnt_private *priv);
 static int device_init_td0_ring(struct vnt_private *priv);
@@ -186,17 +188,17 @@ device_set_options(struct vnt_private *priv)
 	pr_debug(" byBBType= %d\n", (int)priv->byBBType);
 }
 
-#define vt6655_mac_write_bssid_addr(iobase, mac_addr)		\
-do {								\
-	iowrite8(1, iobase + MAC_REG_PAGE1SEL);			\
-	iowrite8(mac_addr[0], iobase + MAC_REG_BSSID0);		\
-	iowrite8(mac_addr[1], iobase + MAC_REG_BSSID0 + 1);	\
-	iowrite8(mac_addr[2], iobase + MAC_REG_BSSID0 + 2);	\
-	iowrite8(mac_addr[3], iobase + MAC_REG_BSSID0 + 3);	\
-	iowrite8(mac_addr[4], iobase + MAC_REG_BSSID0 + 4);	\
-	iowrite8(mac_addr[5], iobase + MAC_REG_BSSID0 + 5);	\
-	iowrite8(0, iobase + MAC_REG_PAGE1SEL);			\
-} while (0)
+static void vt6655_mac_write_bssid_addr(void __iomem *iobase, const u8 *mac_addr)
+{
+	iowrite8(1, iobase + MAC_REG_PAGE1SEL);
+	iowrite8(mac_addr[0], iobase + MAC_REG_BSSID0);
+	iowrite8(mac_addr[1], iobase + MAC_REG_BSSID0 + 1);
+	iowrite8(mac_addr[2], iobase + MAC_REG_BSSID0 + 2);
+	iowrite8(mac_addr[3], iobase + MAC_REG_BSSID0 + 3);
+	iowrite8(mac_addr[4], iobase + MAC_REG_BSSID0 + 4);
+	iowrite8(mac_addr[5], iobase + MAC_REG_BSSID0 + 5);
+	iowrite8(0, iobase + MAC_REG_PAGE1SEL);
+}
 
 #define vt6655_mac_read_ether_addr(iobase, mac_addr)		\
 do {								\
-- 
2.36.1

