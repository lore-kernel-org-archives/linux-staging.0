Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577552FB3
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 18:05:45 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id z20so33359021ejf.5
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 11:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r7OUDigLFUsZqHC4kvxYuv61rT87pgpSVgATSRhFwRI=;
        b=rI1w81YGiE0DQSS5K5gm3Ai7rloEIsbXbu8cHjHzj9UQeO6/1aPf6LtX0Z76xPygAu
         jN5n8+jMneN6WaTMAW/mfwiTRwNd+OxoGczB4MDBsAve8Vyy03JqXG98mvKRC0Wy0ZJq
         ZtT0uX3KgcmhjAkfh5bAdsnV6AdMw9iFBTOQY9QhHmZeGfBRLUQlYgeoDnSAT+ZeeAdT
         /HvP3aN2rY1Ly3/nnEu/fPTQ2xa8zIRbQ1qZzTjAKbPKLj1fvBb0Yl4y3ThHi4a5jPUy
         2JSc4hM3yIP1Bzc+gM3xwy+I2o+tmE6I6njOiDZLuWlNIFsZHr62BHgxddf2qgO7KIXN
         Y1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r7OUDigLFUsZqHC4kvxYuv61rT87pgpSVgATSRhFwRI=;
        b=o/Qy30ufWuYBDHfKM9IV/ys6J2THaIPb1Mzns7HyLuaXnzkPDYoop2aUsMTKtYdfhp
         smyLyeqtStdGSrKWuROIEP/TS0xuVMPH8fKJ2rPlwlZ5svTC9ODKk3/4ELCVbd4V3nVV
         0utE8BrHEf1W5vcHojKUwoG6zfEpQxiHewRyx98BPAh1rXVz5WLmBFH9skOLHuymEWvT
         OBm6n7E7Vde6dnNetVhwyvepjYjUTD3UnpJrvTL3evXC4uI2nm0mxBK0YtOLUSkjMDAj
         LtnzA3EcaDKXW8qAOYEW2FBI4UK6lIGFxx1ur8FhXNaH2BxoPZSPVpUlEsK+V8SXkZUu
         gnHg==
X-Gm-Message-State: AOAM532ajP+6eCJI8Fpkk5HGm3Cp9/GYRGtF3h7V+5ZFyzQKAPFIU+D6
	0PYd0fmSWo22nT6KKPNd4bQ=
X-Google-Smtp-Source: ABdhPJxuT6rKxUMB0xSzgIuSVzpBSVZLN4B0H1uvAGV28E8nDl4QGisAqK1NVOjn/MYgbmKkuwMmkA==
X-Received: by 2002:a17:906:5a98:: with SMTP id l24mr16742622ejq.540.1629137143636;
        Mon, 16 Aug 2021 11:05:43 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-109-211.retail.telecomitalia.it. [79.22.109.211])
        by smtp.gmail.com with ESMTPSA id c21sm3947402ejz.69.2021.08.16.11.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 11:05:43 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Martin Kaiser <martin@kaiser.cx>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v2 3/3] staging: r8188eu: Remove no more used variable and function
Date: Mon, 16 Aug 2021 20:05:40 +0200
Message-Id: <20210816180540.29734-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the 'sender' pointer to integer. Remove
__nat25_db_network_lookup_and_replace(). Following the deletion of the
code related to the NAT25_LOOKUP method, they are no more needed.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

v2: Rebased against latest version of Greg K-H's tree.

 drivers/staging/r8188eu/core/rtw_br_ext.c | 52 +----------------------
 1 file changed, 1 insertion(+), 51 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index 0402f48319c4..ee52f28a1e56 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -295,56 +295,6 @@ static void __network_hash_unlink(struct nat25_network_db_entry *ent)
 	ent->pprev_hash = NULL;
 }
 
-static int __nat25_db_network_lookup_and_replace(struct adapter *priv,
-				struct sk_buff *skb, unsigned char *networkAddr)
-{
-	struct nat25_network_db_entry *db;
-
-	spin_lock_bh(&priv->br_ext_lock);
-
-	db = priv->nethash[__nat25_network_hash(networkAddr)];
-	while (db) {
-		if (!memcmp(db->networkAddr, networkAddr, MAX_NETWORK_ADDR_LEN)) {
-			if (!__nat25_has_expired(priv, db)) {
-				/*  replace the destination mac address */
-				memcpy(skb->data, db->macAddr, ETH_ALEN);
-				atomic_inc(&db->use_count);
-
-				DEBUG_INFO("NAT25: Lookup M:%02x%02x%02x%02x%02x%02x N:%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x"
-							"%02x%02x%02x%02x%02x%02x\n",
-					db->macAddr[0],
-					db->macAddr[1],
-					db->macAddr[2],
-					db->macAddr[3],
-					db->macAddr[4],
-					db->macAddr[5],
-					db->networkAddr[0],
-					db->networkAddr[1],
-					db->networkAddr[2],
-					db->networkAddr[3],
-					db->networkAddr[4],
-					db->networkAddr[5],
-					db->networkAddr[6],
-					db->networkAddr[7],
-					db->networkAddr[8],
-					db->networkAddr[9],
-					db->networkAddr[10],
-					db->networkAddr[11],
-					db->networkAddr[12],
-					db->networkAddr[13],
-					db->networkAddr[14],
-					db->networkAddr[15],
-					db->networkAddr[16]);
-			}
-			spin_unlock_bh(&priv->br_ext_lock);
-			return 1;
-		}
-		db = db->next_hash;
-	}
-	spin_unlock_bh(&priv->br_ext_lock);
-	return 0;
-}
-
 static void __nat25_db_network_insert(struct adapter *priv,
 				unsigned char *macAddr, unsigned char *networkAddr)
 {
@@ -493,7 +443,7 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 		/*---------------------------------------------------*/
 		struct arphdr *arp = (struct arphdr *)(skb->data + ETH_HLEN);
 		unsigned char *arp_ptr = (unsigned char *)(arp + 1);
-		unsigned int *sender, *target;
+		unsigned int *sender;
 
 		if (arp->ar_pro != __constant_htons(ETH_P_IP)) {
 			DEBUG_WARN("NAT25: arp protocol unknown (%4x)!\n", be16_to_cpu(arp->ar_pro));
-- 
2.32.0

