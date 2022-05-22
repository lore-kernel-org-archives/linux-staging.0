Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679433203
	for <linux-staging@lists.linux.dev>; Sun, 22 May 2022 19:48:47 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id rs12so13020512ejb.13
        for <linux-staging@lists.linux.dev>; Sun, 22 May 2022 12:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=c0kDX2w0usdtJZ1wjubssadkVa9RQCCYPM/2J54JHbU=;
        b=Zx+JfWo20KMaPBqsbs3SpMWK3e8JgYZeZkJ6cRLH2PdWs9omM9WN84HKnrNxAoMP+p
         X/C6xyowLMTB8LLHNCZlWpcdh7aikJJcWnN2aSqhxQEIsIlb7uvDo3PWSaKz3M3xuMnX
         ma7SxF6IU2pjYx9xD5OtGbi8fSAvTDEsiqLrVu00zcNAFoPtoTY8fRshyRzxNZklM+Kp
         bs7CWirKEMduEM1K3eBtLfRdSfRZt68Jnn+TxzQ31hzRJouINVZHNjN+dkvg0ye++vzg
         RUklCL7YYLa2xmpY3PYuyEc2ryKX/35L2KRmjQZAoZxjweaDwBxhOAggs3cQMMczqWhh
         LsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=c0kDX2w0usdtJZ1wjubssadkVa9RQCCYPM/2J54JHbU=;
        b=Xy1t7DmWrBRd2yZpfh6saAjiZcl/EPygYJLURJcB118ADVQjYTlKe4Ak4dXBom2C20
         ZeqTddbhf9xgQh74UhijAH2pwIy2Qb1U6PNWqjMaHyHH9D05bhqPU0seqGU3SHkFZiqr
         YEmakxAXKNnIxxIJZyctkGEjMRnxnpbY6VPdM418N/ltZJ4glieiwsSVuSESd+UH3NLQ
         f1CMLPPOovKnWOk3cmT6a6hxzZBVyAQFVZE6h3AX43Fx2bVED8Q7lfA9M51HOMhWKCdQ
         c9R93X12zCn99MxGoH7NEI4yY6TiMFWfvY7ceVgjZ9WCQW3n0GxNBt2Z4Vtl3uKuB/mf
         WQ0A==
X-Gm-Message-State: AOAM5300pgTRVrUo/cn2s1bi2WjD59v0j7/Fw6WRHHri7rS6NOE2/vc/
	lkWfFOJkKTC3/QXJr4e3zZI=
X-Google-Smtp-Source: ABdhPJxmWErdjdV8qfgsfdFM33uNPONcPlWXYRfVcUQcBUVa3xbGAwA2MHBZP4HfxL6lR5nrfX6XWQ==
X-Received: by 2002:a17:907:94cd:b0:6fe:a2ae:a696 with SMTP id dn13-20020a17090794cd00b006fea2aea696mr13129035ejc.656.1653248925573;
        Sun, 22 May 2022 12:48:45 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935774.dip0.t-ipconnect.de. [87.147.87.116])
        by smtp.gmail.com with ESMTPSA id n20-20020a509354000000b0042aa23fa93bsm7523895eda.20.2022.05.22.12.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 May 2022 12:48:45 -0700 (PDT)
Date: Sun, 22 May 2022 21:48:43 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] staging: vt6655: Replace MACvSetCurrBCNLength with
 VNSvOutPortW
Message-ID: <8ff556c84b3a4a70e8151965bcf6357e1de61bd1.1653203927.git.philipp.g.hortmann@gmail.com>
References: <cover.1653203927.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1653203927.git.philipp.g.hortmann@gmail.com>

Replace macro MACvSetCurrBCNLength with VNSvOutPortW and as it
was the only user, it can now be removed.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/mac.h  | 5 -----
 drivers/staging/vt6655/rxtx.c | 2 +-
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 57ae3bdbdb2d..23ebae99e0ae 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -570,11 +570,6 @@ do {									\
 	VNSvOutPortD(iobase + MAC_REG_BCNDMAPTR,		\
 		     dwCurrDescAddr)
 
-/* set the chip with current BCN length */
-#define MACvSetCurrBCNLength(iobase, wCurrBCNLength)		\
-	VNSvOutPortW(iobase + MAC_REG_BCNDMACTL + 2,		\
-		     wCurrBCNLength)
-
 #define MACvWriteBSSIDAddress(iobase, pbyEtherAddr)		\
 do {								\
 	iowrite8(1, iobase + MAC_REG_PAGE1SEL);			\
diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 71cbfa607d96..54b0556f500f 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -1422,7 +1422,7 @@ static int vnt_beacon_xmit(struct vnt_private *priv,
 
 	MACvSetCurrBCNTxDescAddr(priv->port_offset, priv->tx_beacon_dma);
 
-	MACvSetCurrBCNLength(priv->port_offset, priv->wBCNBufLen);
+	VNSvOutPortW(priv->port_offset + MAC_REG_BCNDMACTL + 2, priv->wBCNBufLen);
 	/* Set auto Transmit on */
 	MACvRegBitsOn(priv->port_offset, MAC_REG_TCR, TCR_AUTOBCNTX);
 	/* Poll Transmit the adapter */
-- 
2.25.1

