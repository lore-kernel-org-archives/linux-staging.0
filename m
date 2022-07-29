Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811843D76
	for <linux-staging@lists.linux.dev>; Fri, 29 Jul 2022 08:14:50 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id rq15so1228794ejc.10
        for <linux-staging@lists.linux.dev>; Fri, 29 Jul 2022 01:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=o4vW0UYou3fHkj8i9Q3MbAUiW6l95nNxKH7RBWOhBEI=;
        b=lM41+MOeWZIf+vIEDgI8G7YilKe6uV5Zid5DRANx70RDlgn0OB//yD/7Kp2VTM7fQv
         XmDkmzk4SuUHVxipxh31weWXMm5GCRoXOZhHxptSv8tnZA3qqiRZtFG8TGrjJy+JZeUe
         KpgtlZgDQMkY6YWrpTzQzbYiFJz7OR0sP7Tq8JeW3R11Hbp8ccdq3IgIkVQDqa9i91vP
         JMnI4yYlSNcKfqV5G8wN6/MeOVfxBLp6xkuBpmmaZOay/1uz8CYDV/ARJwmA3TVnJ8qh
         NUbhgbbrGU5KmGaXdmR+pG881h1KkGjc9egMVxo033NqaL3sLJm1MlRKeO7vb1bNOj0I
         8unQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=o4vW0UYou3fHkj8i9Q3MbAUiW6l95nNxKH7RBWOhBEI=;
        b=hqULDj16D8NmhNcY5NlfpZMvpW3j3422BB2ksLm5QuVkOdWO4nk91JpplowfvFYfCP
         6L5eTJjaudwgYNu03MHkGj40cUhDbhXjvwUS8JhETq7iWkfg6IBOwRWG6O5WC2lL/soN
         a17WGs5rK97LVZPMgGRbutlWAhnRxU8mcM1aJ2uVT37211BSszIG88pNG7Z/TIS/kc+i
         HmVXaaI2SAMFqQLQUMQxj0HHHF5G3FSTDA+UmlEZXOYXUlI4wNeHa9J3N3HG+SnSTDqD
         OWhbB8cKkex8DzAxmO6kLjFy6eIptegxldsJdlEsmaym8BpD7KrM5Xa8JbHmnHM1zszP
         P3fA==
X-Gm-Message-State: AJIora/XEXZLP7RnMn2F9CASRrPbK8qBGX2ZaMFfUPXi7oZ31tNn3Sjm
	4+W+pfu660lnEVOvUzPfQ0uhGGVU5WE=
X-Google-Smtp-Source: AGRyM1sDnGUVNtE6Vg/PEwO4s6uCfhUYlEE65SUIGxzr2DtcT6sswobLgFBi51+WLA2N8xrk6S/bEg==
X-Received: by 2002:a17:907:d1f:b0:72f:5d89:d08 with SMTP id gn31-20020a1709070d1f00b0072f5d890d08mr2037896ejc.231.1659082488852;
        Fri, 29 Jul 2022 01:14:48 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id ku24-20020a170907789800b006fed062c68esm1369857ejc.182.2022.07.29.01.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 01:14:48 -0700 (PDT)
Date: Fri, 29 Jul 2022 10:14:46 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] staging: vt6655: Replace MACvTransmit0 with function
 vt6655_mac_dma_ctl
Message-ID: <fc412f0fda11045a55b6b5867d51e250ca841ee8.1659080988.git.philipp.g.hortmann@gmail.com>
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

Convert macro MACvTransmit0 to existing static function. This saves
codelines and multiline macros are not liked by kernel community.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
V1 -> V2: Improved description
---
 drivers/staging/vt6655/device_main.c |  2 +-
 drivers/staging/vt6655/mac.h         | 10 ----------
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 554531411dad..c0a00063e4d1 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -1231,7 +1231,7 @@ static int vnt_tx_packet(struct vnt_private *priv, struct sk_buff *skb)
 	if (head_td->td_info->flags & TD_FLAGS_NETIF_SKB)
 		MACvTransmitAC0(priv->port_offset);
 	else
-		MACvTransmit0(priv->port_offset);
+		vt6655_mac_dma_ctl(priv->port_offset, MAC_REG_TXDMACTL0);
 
 	priv->iTDUsed[dma_idx]++;
 
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 5a473ca393f2..be33da59dd84 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -537,16 +537,6 @@
 
 /*---------------------  Export Macros ------------------------------*/
 
-#define MACvTransmit0(iobase)						\
-do {									\
-	unsigned long dwData;						\
-	dwData = ioread32(iobase + MAC_REG_TXDMACTL0);			\
-	if (dwData & DMACTL_RUN)					\
-		iowrite32(DMACTL_WAKE, iobase + MAC_REG_TXDMACTL0);	\
-	else								\
-		iowrite32(DMACTL_RUN, iobase + MAC_REG_TXDMACTL0);	\
-} while (0)
-
 #define MACvTransmitAC0(iobase)					\
 do {									\
 	unsigned long dwData;						\
-- 
2.37.1

