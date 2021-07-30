Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D446A70
	for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 18:14:57 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id b7so14422834edu.3
        for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 11:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RLzGmg23wIZLMApLuoWPPi+Aep//XD12yszpCHUj1tU=;
        b=dtilBrvGD4Paiw5gtN95xp+rtU8nDFhHQEQh9n8pNS7e0IRW05ywg0na2P1Gw0MpDO
         MMw1ba8EPu1FCEvBUY3RIO8oZGf57gmSV89cR+S3wroFGPgd4nvu2wU+l5RrXtBgtI9K
         zaeAV+AJqrbhoiydjFA3qn+V4Bm4E3bHEJ/1MMZ520zgCzsno6fLb/MFcqEcqw1h5DJY
         iAsTxROnNdA1APDuuNccrzgSpVRJeO73QbNUYgBk8bAZzgMcC5X5DbhS1DheWpW2Op4w
         xy4eQUZnkCOWJ48ZdqBEs2X4E4iUyhka7osiqGLSnWCbZEQ2VvU4g2as2zMFIQPN4Qm/
         ec5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RLzGmg23wIZLMApLuoWPPi+Aep//XD12yszpCHUj1tU=;
        b=DHfelna7g9D8xYCAthLgbq6IQHUJbMJjncv1uNqkUhH7C+ptEFIozOzxlAEeEw1sWZ
         wqIdYyvJ/9Rt8qnjcTo50dbPzTNbbO5m8iaGeOznfgVZMOc8U1suhH7Rj6wPcNtdFeag
         CFI55UW0XSvWzWfJDPMbXWZHTSZCtKyRmOkzY2qdEYPvGcdoHwJRFoznsFKncE3e/ySI
         s+WFPS/+uYZtrDhX3UskBcv+PyNx38j9m8SYmStxbJcq9XOmzSSicFcPnx3fFV4t2pVr
         EHa/f+zRHsqKcRxMw2tWZhhUFirNsnsxv5nXS7YobRwXb2cLLnU6/7d/4LXoCPwotJzO
         64uA==
X-Gm-Message-State: AOAM530isgbyXcvgCUelCKPc2TZBiniRcZv8vhC8EmxrpeMM9J4Br7U+
	fipjEbF6/N6LepwDtlXxQS4=
X-Google-Smtp-Source: ABdhPJxx5K1MTv2lyaSEQT9WQlWlEBXpUucttGaqcRBZ299ooz10Gy3aZl6zE+A+dVc3BcOsdMHPeA==
X-Received: by 2002:a05:6402:280e:: with SMTP id h14mr4403812ede.187.1627668896126;
        Fri, 30 Jul 2021 11:14:56 -0700 (PDT)
Received: from localhost.localdomain (host-79-26-32-124.retail.telecomitalia.it. [79.26.32.124])
        by smtp.gmail.com with ESMTPSA id a35sm1036984edf.80.2021.07.30.11.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 11:14:55 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] staging: r8188eu: Fix different base types in assignments and parameters
Date: Fri, 30 Jul 2021 20:14:52 +0200
Message-Id: <20210730181452.23062-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix sparse warnings of different base types in assignments
and in passing function parameters.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_br_ext.c | 46 ++++++++++++++++++-----
 1 file changed, 36 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index e00302137a60..31ca2e548555 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -71,7 +71,7 @@ static inline int __nat25_add_pppoe_tag(struct sk_buff *skb, struct pppoe_tag *t
 	struct pppoe_hdr *ph = (struct pppoe_hdr *)(skb->data + ETH_HLEN);
 	int data_len;
 
-	data_len = tag->tag_len + TAG_HDR_LEN;
+	data_len = be16_to_cpu(tag->tag_len) + TAG_HDR_LEN;
 	if (skb_tailroom(skb) < data_len) {
 		_DEBUG_ERR("skb_tailroom() failed in add SID tag!\n");
 		return -1;
@@ -134,42 +134,68 @@ static inline void __nat25_generate_ipv4_network_addr(unsigned char *networkAddr
 }
 
 static inline void __nat25_generate_ipx_network_addr_with_node(unsigned char *networkAddr,
-				unsigned int *ipxNetAddr, unsigned char *ipxNodeAddr)
+				__be32 *ipxNetAddr, unsigned char *ipxNodeAddr)
 {
+	union {
+                unsigned int f0;
+                unsigned char f1[IPX_NODE_LEN];
+        } addr;
+
 	memset(networkAddr, 0, MAX_NETWORK_ADDR_LEN);
 
 	networkAddr[0] = NAT25_IPX;
-	memcpy(networkAddr+1, (unsigned char *)ipxNetAddr, 4);
+	addr.f0 = be32_to_cpu(*ipxNetAddr);
+	memcpy(networkAddr+1, addr.f1, 4);
 	memcpy(networkAddr+5, ipxNodeAddr, 6);
 }
 
 static inline void __nat25_generate_ipx_network_addr_with_socket(unsigned char *networkAddr,
-				unsigned int *ipxNetAddr, unsigned short *ipxSocketAddr)
+				__be32 *ipxNetAddr, __be16 *ipxSocketAddr)
 {
+	union {
+		unsigned int f0;
+		unsigned char f1[4];
+	} addr;
+
 	memset(networkAddr, 0, MAX_NETWORK_ADDR_LEN);
 
 	networkAddr[0] = NAT25_IPX;
-	memcpy(networkAddr+1, (unsigned char *)ipxNetAddr, 4);
-	memcpy(networkAddr+5, (unsigned char *)ipxSocketAddr, 2);
+	addr.f0 = be32_to_cpu(*ipxNetAddr);
+	memcpy(networkAddr+1, addr.f1, 4);
+	addr.f0 ^= addr.f0;
+	addr.f0 = be16_to_cpu(*ipxSocketAddr);
+	memcpy(networkAddr+5, addr.f1, 2);
 }
 
 static inline void __nat25_generate_apple_network_addr(unsigned char *networkAddr,
-				unsigned short *network, unsigned char *node)
+				__be16 *network, unsigned char *node)
 {
+	union {
+                unsigned short f0;
+                unsigned char f1[2];
+        } addr;
+
 	memset(networkAddr, 0, MAX_NETWORK_ADDR_LEN);
 
 	networkAddr[0] = NAT25_APPLE;
-	memcpy(networkAddr+1, (unsigned char *)network, 2);
+	addr.f0 = be16_to_cpu(*network);
+	memcpy(networkAddr+1, addr.f1, 2);
 	networkAddr[3] = *node;
 }
 
 static inline void __nat25_generate_pppoe_network_addr(unsigned char *networkAddr,
-				unsigned char *ac_mac, unsigned short *sid)
+				unsigned char *ac_mac, __be16 *sid)
 {
+	union {
+                unsigned short f0;
+                unsigned char f1[2];
+        } addr;
+
 	memset(networkAddr, 0, MAX_NETWORK_ADDR_LEN);
 
 	networkAddr[0] = NAT25_PPPOE;
-	memcpy(networkAddr+1, (unsigned char *)sid, 2);
+	addr.f0 = be16_to_cpu(*sid);
+	memcpy(networkAddr+1, addr.f1, 2);
 	memcpy(networkAddr+3, (unsigned char *)ac_mac, 6);
 }
 
-- 
2.32.0

