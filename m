Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A383139566;
	Tue, 12 Mar 2024 17:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710263522; cv=none; b=aueSKpNVCfm2EjEveBHWratwGG9gKMz8OaHFC/5U/ZlnA7xYNAlbbglfTtaw6SCy5vPhbwD81pyHbeTOsg00Sj6f10Tm9Du1S3/ps3/GXqhrwPyDEsVxtBn9PXS7AoLY6cqkEtSIg+c9RikGb+YLi/DYv5EVgCtwfOUPR5fYGMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710263522; c=relaxed/simple;
	bh=+4z/fKVxIVcUeK/DqyugogB+o5o/9pkjvamszPJbA3M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=edluVkT4FZ4ok4U5svKMKsk4gE4Z5Onx3aswPQk/kA4LVTqtnF52F3uRE4lWidZJqx1KUqq4787Hk/ChI3kDnmv9e3GI8daeidHiBiS4nzL1WQy5pLTuGbpYR8kw+7Gs3sqjAggn9J+UxgBZkzRn6MkBozoR4cB2+lrl7B3iArA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dnq2OqFz; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dnq2OqFz"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-512b3b04995so4725184e87.3;
        Tue, 12 Mar 2024 10:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710263519; x=1710868319; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GCpDHHk1rEgXXfVDzy2o6ifm7MNu/s628JnAZoViwZM=;
        b=Dnq2OqFz5nLBXsvB3/WZTFiIq4eyA/ZfHIDeBH7nP/wOKErPVmqFsxh8WOAgNUBuCx
         tU6iNYZh2Q1MDeVZx2QxzDjTe0WWJx35ZYsaryTQZzBDSjCxTSlQdhguShtluG8hIqt/
         d5DZzNH+TBXJRSb+UOIWUiDByy6ze5KoUoPFThbiWWv0NzjQkMazpQRY+X/Pf3CPcqmF
         /JX59SzPxUwBz4Tq4UToi6PZftnGAL7Pv9LdxuLHwqefaYoKShcP1/gQqQ7rOk8tHA+a
         b93g72rVE0b3Hharby7M2lgWjvLJAaEgbzZrKUDn2mEyxC5+ddPJXJ5JtmjWOc2Ku5AP
         G/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710263519; x=1710868319;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GCpDHHk1rEgXXfVDzy2o6ifm7MNu/s628JnAZoViwZM=;
        b=BBAa3Q7sf5OvGyppsBrBzUSF1bQKZwjJoMfRumfCt3Wv5eTsafGLXyfq+JIItNR7Xx
         NQ/yq2pbEjTtXuU+f/VmTRs7Ql2JCDpS0yAz+ru4z8Y4xEwPBxlr1agi/1Zl/2r+9BVT
         O3qA978+5pEISBkkoRuimVf8eMfgqD54I7EYn3eRnjf6cIy+2IQgqGjV7brT0eNS7b2i
         MV7Juui5Xf3jHBkmhO3E6QKc3xmbekTqYVhw8Cvf4BBxZLlaDxAL9j8dZoynR1GNLlTh
         wBxT5rU/OyoCBmUZNzCxsWrpHyIYUvTcTUdF0efQN497BT6CH+l6Wrs0sCNHqExwiWil
         Y9xg==
X-Forwarded-Encrypted: i=1; AJvYcCXwViga69s1e3l30bsmIwQ4MO15wpD5x23WRvqAEsHXg/0061b1M/1WAaNaZeh/RLODx1MgpBntl4XSkVEwm1ZJf59bZT68VswgU6JkLQ==
X-Gm-Message-State: AOJu0YyiYiAAgWuFTlJ/S4HwNhi+w3qyjLGd85RXHpJGxHBpx8XcUQK+
	jjMQU9LmPhyuKrGSfMgpNGMm5euu2Wnt7Jq2d/Um5TA/nSTrpwX9KxPiYwBUuW2EXQ==
X-Google-Smtp-Source: AGHT+IFoaUFmekupZMWSBdIFGI8p404pPfoUjAX1esuRQ+pbxijn8Do/xwbyzhMShgceQk2+ebRdnQ==
X-Received: by 2002:ac2:5b9b:0:b0:513:5977:4286 with SMTP id o27-20020ac25b9b000000b0051359774286mr7015029lfn.19.1710263518513;
        Tue, 12 Mar 2024 10:11:58 -0700 (PDT)
Received: from MOLeToid ([102.244.37.37])
        by smtp.gmail.com with ESMTPSA id bt11-20020a056000080b00b0033e9186f043sm6910960wrb.41.2024.03.12.10.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 10:11:57 -0700 (PDT)
Date: Tue, 12 Mar 2024 18:11:53 +0100
From: "Felix N. Kimbu" <felixkimbu1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: outreachy@lists.linux.dev
Subject: [PATCH v3] staging: wlan-ng: Rename 'foo' to 'rc' in p80211conv.c
Message-ID: <ZfCM2RyeEpxooKz+@MOLeToid>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Rename identifer 'foo' to 'rc' Suggested-by Alison Schofield in functions
skb_p80211_to_ether() and skb_ether_to_p80211().

Fix indentation necessitated by above rename Suggested-by Dan Carpenter
and Philipp Hortmann.

This change adds intuitive meaning to the idenfier, adhering to best
practices and coding style.

Also, driver has been included in the subject Suggested-by Philipp Hortmann.

Signed-off-by: Felix N. Kimbu <felixkimbu1@gmail.com>
---
Changes since v2:
- Fix wrong indentation introduced in v1
- Correct subject to include driver from v1

Changes since v1:
- Rename identifier 'foo' to 'decrypt_check'

 drivers/staging/wlan-ng/p80211conv.c | 30 ++++++++++++++--------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/wlan-ng/p80211conv.c b/drivers/staging/wlan-ng/p80211conv.c
index 8336435eccc2..7401a6cacb7f 100644
--- a/drivers/staging/wlan-ng/p80211conv.c
+++ b/drivers/staging/wlan-ng/p80211conv.c
@@ -93,7 +93,7 @@ int skb_ether_to_p80211(struct wlandevice *wlandev, u32 ethconv,
 	struct wlan_ethhdr e_hdr;
 	struct wlan_llc *e_llc;
 	struct wlan_snap *e_snap;
-	int foo;
+	int rc;
 
 	memcpy(&e_hdr, skb->data, sizeof(e_hdr));
 
@@ -185,14 +185,14 @@ int skb_ether_to_p80211(struct wlandevice *wlandev, u32 ethconv,
 		p80211_wep->data = kmalloc(skb->len, GFP_ATOMIC);
 		if (!p80211_wep->data)
 			return -ENOMEM;
-		foo = wep_encrypt(wlandev, skb->data, p80211_wep->data,
-				  skb->len,
-				  wlandev->hostwep & HOSTWEP_DEFAULTKEY_MASK,
-				  p80211_wep->iv, p80211_wep->icv);
-		if (foo) {
+		rc = wep_encrypt(wlandev, skb->data, p80211_wep->data,
+				 skb->len,
+				 wlandev->hostwep & HOSTWEP_DEFAULTKEY_MASK,
+				 p80211_wep->iv, p80211_wep->icv);
+		if (rc) {
 			netdev_warn(wlandev->netdev,
 				    "Host en-WEP failed, dropping frame (%d).\n",
-				    foo);
+				    rc);
 			kfree(p80211_wep->data);
 			return 2;
 		}
@@ -265,7 +265,7 @@ int skb_p80211_to_ether(struct wlandevice *wlandev, u32 ethconv,
 	struct wlan_llc *e_llc;
 	struct wlan_snap *e_snap;
 
-	int foo;
+	int rc;
 
 	payload_length = skb->len - WLAN_HDR_A3_LEN - WLAN_CRC_LEN;
 	payload_offset = WLAN_HDR_A3_LEN;
@@ -305,15 +305,15 @@ int skb_p80211_to_ether(struct wlandevice *wlandev, u32 ethconv,
 				   "WEP frame too short (%u).\n", skb->len);
 			return 1;
 		}
-		foo = wep_decrypt(wlandev, skb->data + payload_offset + 4,
-				  payload_length - 8, -1,
-				  skb->data + payload_offset,
-				  skb->data + payload_offset +
-				  payload_length - 4);
-		if (foo) {
+		rc = wep_decrypt(wlandev, skb->data + payload_offset + 4,
+				 payload_length - 8, -1,
+				 skb->data + payload_offset,
+				 skb->data + payload_offset +
+				 payload_length - 4);
+		if (rc) {
 			/* de-wep failed, drop skb. */
 			netdev_dbg(netdev, "Host de-WEP failed, dropping frame (%d).\n",
-				   foo);
+				   rc);
 			wlandev->rx.decrypt_err++;
 			return 2;
 		}
-- 
2.34.1

