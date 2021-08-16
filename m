Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60CA6D17
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 16:06:30 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id cn28so15351850edb.6
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 09:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7SbAK6kGh4YKKfxzmecBRbqxKsR0TxN0251PX8WUATg=;
        b=m9WXSNiQWMF73vhWyFfKR2TprePa5oqrBG2rBGyxCb0MRCI1rgxQJdKbnDroqoXX1X
         W6IbVF4I5lITEH8uZNl7a8om8v0gQctWN+h9+jDba6c/75pwI9EJzi/yu1nBoyZNJdmz
         UVaqDAgdeKKRjy6q2rQzFq5vFQjPD62bDGxcKvlHqh5J2GCYbGwNYEhSeszzc3HLzsfD
         DFao//2zb5L/TwTDQ2O7DnMJPsyS/bb7URa864MSZ3RA4yKCOSom/H0B9/0m0Cy6oXwv
         j3HYpOi/eWJmW+qov5mcwvSN5E61H6l1KsuYaZxF2RltXhA271Kz5av9s+xRwp5B24X2
         RJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7SbAK6kGh4YKKfxzmecBRbqxKsR0TxN0251PX8WUATg=;
        b=p20iepk516LsXoZewiKtT6sRunxLyUF5I8X3OSa6MZEhUhW2ffrTtnAjN1y90gYvFB
         PhF6DLI+pR/+16PMguVLexsFPR92qRZKRbVcIlIV7gcUF/gFK3KF4aBPNFgTa8YSwPzo
         PGodFHAFPtNSCsC1sWs1MkFsf49AsCDLhaXIC9IL8BwXzUzxaqQQTad0v0rtEM8quApo
         Sp+wHzyNnL0KbYKyAzzwg7Q39YNNKi/1F503Yj2t8C6xp8hErkS99iWvR43BANJ9/N4s
         8RY/4DVG18Z4HiIe9Lzbj+pL4y2ZEduWtFzLArNBhkQiNAWFnof0p30mWix5w1v7Z/ta
         EIAQ==
X-Gm-Message-State: AOAM533TheZRq1WRoIFsqzTi1PVvz7ymV7K2qPW1iahupW032oiMdUnk
	32TQ2hbAQG9NTmMG0tIA/ck=
X-Google-Smtp-Source: ABdhPJykHr+0+rBENMPKLBHbbdok1TimwrnKiDDPP8Uts4sW0j8Ony7kE6mLhRdBAJZRDBg+t6EBQg==
X-Received: by 2002:a05:6402:2206:: with SMTP id cq6mr20618700edb.384.1629129989327;
        Mon, 16 Aug 2021 09:06:29 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-109-211.retail.telecomitalia.it. [79.22.109.211])
        by smtp.gmail.com with ESMTPSA id s18sm3906239ejh.12.2021.08.16.09.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 09:06:28 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Martin Kaiser <martin@kaiser.cx>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH 3/3] staging: r8188eu: Remove no more used variable and function
Date: Mon, 16 Aug 2021 18:06:17 +0200
Message-Id: <20210816160617.11949-4-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210816160617.11949-1-fmdefrancesco@gmail.com>
References: <20210816160617.11949-1-fmdefrancesco@gmail.com>
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
 drivers/staging/r8188eu/core/rtw_br_ext.c | 52 +----------------------
 1 file changed, 1 insertion(+), 51 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index 5b032406e9d3..62864fbbdef3 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -326,56 +326,6 @@ static inline void __network_hash_unlink(struct nat25_network_db_entry *ent)
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
@@ -524,7 +474,7 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 		/*---------------------------------------------------*/
 		struct arphdr *arp = (struct arphdr *)(skb->data + ETH_HLEN);
 		unsigned char *arp_ptr = (unsigned char *)(arp + 1);
-		unsigned int *sender, *target;
+		unsigned int *sender;
 
 		if (arp->ar_pro != __constant_htons(ETH_P_IP)) {
 			DEBUG_WARN("NAT25: arp protocol unknown (%4x)!\n", be16_to_cpu(arp->ar_pro));
-- 
2.32.0

