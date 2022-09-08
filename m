Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD1F89CB
	for <linux-staging@lists.linux.dev>; Thu,  8 Sep 2022 20:32:47 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id lz22so19919213ejb.3
        for <linux-staging@lists.linux.dev>; Thu, 08 Sep 2022 13:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date;
        bh=qfAt/hjdgJmut/nxKh8LKAbLz+hFQ0D93ZGVPZeDHCE=;
        b=aAIE4m7F9Tr38MxixsV+aCa56FNNfunP8LyZ6eaxqWLkEYCIAuRZZ9a7xKuNpZH9JR
         TvcK6AEx475kJbWAnLMPjwwIDDchCLPnpp3zl4ikPn6JdGAAnitymy3w+lCiQ1C2wBHx
         vONvovyCv1lER0INez4U7O+AptQcjPYlhloRdo41iNjL1OjWAZ8FwCnUDuSpFvimg2bT
         LAqf8UplcHfcPkzShALjjzE89yZ2JINpO9nQ5kS/V4keWZ6M/KCyc9peErinsjhoH0+d
         zckM97GKxUU31qcfrQKB0bSDs6G1jYEkViYFDff5KkiifLw6sEyrM8knt+dabRxt2+m4
         JfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=qfAt/hjdgJmut/nxKh8LKAbLz+hFQ0D93ZGVPZeDHCE=;
        b=YJp5lqEIhblFbU7klZ6XkgL12NCeLNE4Zuk/BNGAAGL2skaJ5H7ORZsAZz2nb9LgZq
         UUBVw1YyvloDv8ZHFEMb2c9Ycawc8vqaf0gh6D5C1YWPUVB7QTPlZevsg3YWaMbECpeH
         pfZuRSoyOCWQrF7A+GmLpG8cVS5vZFFpWQQhkzUJlTAFtV7iMlFaleh5fKp/XPFJNoy4
         +OOOKt1lOvOtXwpC/8QVjruCp0bxKIgy4Zeafqh/+is+iX5StiG6eaSJjqCinGLjW+Tv
         yAMt+5XDqalwR/FFdiiEpkmtLAlB5v59r4GgROlw3LboXGaObb5baSfS1+ZFavWi9ugt
         FF+w==
X-Gm-Message-State: ACgBeo2nXt4/PSvQ6jSy68tmLrq+b12POzioiPi/msodRF3IOOFs+nRs
	OrdnaTZ/HftcABBA6oVimB0=
X-Google-Smtp-Source: AA6agR44ZBiMS9NG4ag9pmG5ERjX8gI6Q9WP+Nvm09J3cDY9v9fxOke2Ltb9DBX0l6rEcVzwSrnEDA==
X-Received: by 2002:a17:906:cc5d:b0:741:38a8:a50a with SMTP id mm29-20020a170906cc5d00b0074138a8a50amr7165129ejb.650.1662669166030;
        Thu, 08 Sep 2022 13:32:46 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id el3-20020a056402360300b0045081dc93dfsm1609355edb.78.2022.09.08.13.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 13:32:45 -0700 (PDT)
Date: Thu, 8 Sep 2022 22:32:43 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH] staging: rtl8192e: Fix return type for implementation of
 ndo_start_xmit
Message-ID: <20220908203243.GA23048@matrix-ESPRIMO-P710>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CFI (Control Flow Integrity) is a safety feature allowing the system to
detect and react should a potential control flow hijacking occurs. In
particular, the Forward-Edge CFI protects indirect function calls by
ensuring the prototype of function that is actually called matches the
definition of the function hook.

Since Linux now supports CFI, it will be a good idea to fix mismatched
return type for implementation of hooks. Otherwise this would get
cought out by CFI and cause a panic.

Use enums from netdev_tx_t as return value instead, then change return
type to netdev_tx_t.

Suggested-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
Tested with rtl8192e
Transferred this patch over wlan connection of rtl8192e
---
 drivers/staging/rtl8192e/rtllib.h    |  2 +-
 drivers/staging/rtl8192e/rtllib_tx.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 0ecd81a81866..b4b606f552fb 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1938,7 +1938,7 @@ int rtllib_encrypt_fragment(
 	struct sk_buff *frag,
 	int hdr_len);
 
-int rtllib_xmit(struct sk_buff *skb,  struct net_device *dev);
+netdev_tx_t rtllib_xmit(struct sk_buff *skb,  struct net_device *dev);
 void rtllib_txb_free(struct rtllib_txb *txb);
 
 /* rtllib_rx.c */
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 42f81b23a144..ebcaf3bf22d6 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -543,7 +543,7 @@ static u8 rtllib_current_rate(struct rtllib_device *ieee)
 		return ieee->rate & 0x7F;
 }
 
-static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
+static netdev_tx_t rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 {
 	struct rtllib_device *ieee = (struct rtllib_device *)
 				     netdev_priv_rsl(dev);
@@ -946,23 +946,23 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 			if ((*ieee->hard_start_xmit)(txb, dev) == 0) {
 				stats->tx_packets++;
 				stats->tx_bytes += le16_to_cpu(txb->payload_size);
-				return 0;
+				return NETDEV_TX_OK;
 			}
 			rtllib_txb_free(txb);
 		}
 	}
 
-	return 0;
+	return NETDEV_TX_OK;
 
  failed:
 	spin_unlock_irqrestore(&ieee->lock, flags);
 	netif_stop_queue(dev);
 	stats->tx_errors++;
-	return 1;
+	return NETDEV_TX_BUSY;
 
 }
 
-int rtllib_xmit(struct sk_buff *skb, struct net_device *dev)
+netdev_tx_t rtllib_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	memset(skb->cb, 0, sizeof(skb->cb));
 	return rtllib_xmit_inter(skb, dev);
-- 
2.37.2

