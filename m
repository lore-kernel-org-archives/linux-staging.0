Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5CC33E3
	for <linux-staging@lists.linux.dev>; Sun, 22 May 2022 19:49:23 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id wh22so24626154ejb.7
        for <linux-staging@lists.linux.dev>; Sun, 22 May 2022 12:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rlKCcc3Cfz4SOeHsE7kOSMH+pFkJNujvAhxMEYVEh9Q=;
        b=q5kfaCelUWQv/xUP6MeweT3/24WiJmRTKt/7UVHBd/KoXUBH0lWbJyL3MhV5okLzvt
         1/zuRxuqRBzMhckB/NVMQtoKsSygQW4edvm9kWQDpGIKCaUIZB9LxV7kf4jVARhgYYm9
         IzTHX0SrZ+9VA4OushDVjyo2egmUUiGX4aaTM9U8lD3T7V3LjrNXmPJSi3oB/LnUdmEE
         BVhI7M3yZSWlnXEtRLPWIC5D8AGu7suf1wLhnyEdUuKS9qAi6kWjcbfDNxqCJRcDTalk
         EAko7lf8V3MktQ0v2Q7KXmXF6LdnTCrBd7GnZlOmwmiHCdx6oHbXTwg7XuUGCKrvJMRU
         iodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rlKCcc3Cfz4SOeHsE7kOSMH+pFkJNujvAhxMEYVEh9Q=;
        b=bis1rJvHx2Jw5ddAj2WZO3RMm+Hc7kBZHssi2LI2QJVtMTrpFyKDF85uZZWUQYSkuF
         hr+J2JpWv4tUIRydnkZ+G0e6J1hQnxVxpN1CzyhbwsUDjA6S/7I3pjGrar1yVQ7THH1I
         Uu40wXJQ1HyJftpF1JJuTtI3/XLs+wDYJxJQtFOWe+GGBEi8weccMAugsj/SmGKI3D7Y
         BcOhNtRbSzPYFe+SgC1w/lV7ZyYA7RjgAdM0R+wNliiZ5Y2EWMLniSPDaOLiexhIY2BF
         RpprPUiOKlveh9rlLfIIrmjR205/mc7+k2XJUaY003S24hbnciOSG/nb5G/nFIE7cnrE
         RK2g==
X-Gm-Message-State: AOAM533cjIfQVq/d3dX3i4dCKzfnYBpf1wPVtFddRecnNJLGo106Ough
	0SXxFNIpN9r97sA1bv9BzbM=
X-Google-Smtp-Source: ABdhPJwolWOlDnZJcYlv0xEnTvnCXYVex1x24AP9SRExVk/EPWOzIPbGvT2MSXjWhrfsrLZBLHQUxA==
X-Received: by 2002:a17:907:3e0f:b0:6f4:5cfd:e6bb with SMTP id hp15-20020a1709073e0f00b006f45cfde6bbmr17338557ejc.38.1653248961901;
        Sun, 22 May 2022 12:49:21 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935774.dip0.t-ipconnect.de. [87.147.87.116])
        by smtp.gmail.com with ESMTPSA id my9-20020a1709065a4900b006fe8d8c54a7sm4984540ejc.87.2022.05.22.12.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 May 2022 12:49:21 -0700 (PDT)
Date: Sun, 22 May 2022 21:49:19 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 08/11] staging: vt6655: Replace MACvRx1PerPktMode with
 VNSvOutPortD
Message-ID: <9cb643b9554e33f5be7a2babefbed5eccca14625.1653203927.git.philipp.g.hortmann@gmail.com>
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

Replace macro MACvRx1PerPktMode with VNSvOutPortD and as it
was the only user, it can now be removed.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/card.c | 2 +-
 drivers/staging/vt6655/mac.h  | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index e907dfd58d1f..57ed2120dbc1 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -453,7 +453,7 @@ void CARDvSafeResetRx(struct vnt_private *priv)
 
 	/* set perPkt mode */
 	VNSvOutPortD(priv->port_offset + MAC_REG_RXDMACTL0, RX_PERPKT);
-	MACvRx1PerPktMode(priv->port_offset);
+	VNSvOutPortD(priv->port_offset + MAC_REG_RXDMACTL1, RX_PERPKT);
 	/* set MAC RD pointer */
 	MACvSetCurrRx0DescAddr(priv, priv->rd0_pool_dma);
 
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 161130084936..b68e21c62d2b 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -589,9 +589,6 @@ do {								\
 	iowrite8(0, iobase + MAC_REG_PAGE1SEL);			\
 } while (0)
 
-#define MACvRx1PerPktMode(iobase)					\
-	VNSvOutPortD(iobase + MAC_REG_RXDMACTL1, RX_PERPKT)
-
 #define MACvReceive0(iobase)						\
 do {									\
 	unsigned long dwData;						\
-- 
2.25.1

