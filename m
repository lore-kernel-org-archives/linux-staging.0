Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D744685
	for <linux-staging@lists.linux.dev>; Wed, 14 Sep 2022 21:07:54 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id x5-20020a056902102500b006af1376b813so9259404ybt.16
        for <linux-staging@lists.linux.dev>; Wed, 14 Sep 2022 14:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=5O2B75yNfC6J+uDBuMXaelMehkHYewJIAkFNk70B01E=;
        b=NA2Ds0ycMhVzQIgLRmY6v8+vtAbFRO4hj1ZZQ0GRgkXvWWLX4JbSLnPSpQh3mLEUkQ
         chsJDJV0nb9kYsVuouCSiZNV3CzFQ6ejUMvhx9OuMbeBKlf5fWKabqyUPJfTpucL1ZA9
         kHhPxeFCwn070JGkh7Qtpmpgfyf+yZrFAMV/PYAtwQsSCLiKHUpMrzjwhjgH94gGYHsW
         TJ31ne/ZkjzIr3iRJoX85+j1Gz7tZleZwJidVedhHrzXi5mhLQny/4XA8dYpOZscgtZD
         Z9sZlTF5vwbnFRU8J7cHHWChaWGbWwQ5d/vQtJYzSBpZKb/C+1y27YKSGG7WZDyiDTSd
         IarA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=5O2B75yNfC6J+uDBuMXaelMehkHYewJIAkFNk70B01E=;
        b=mOlnwFX864/LtswNp+X4EMkTWjV/aomj5UcR4ULMKtlEgSz7Bxzxyuqxh2bZsT1ocl
         aqODt1Zh8iYYHCVOi5ZiLhZnjkGM8+R/4StS51EmZ+Ib7Jh3d65wVvou0Ac+8Z0PJf/u
         G74e3CTQ96bTHzJN62ujKDoJvoAkIUoYXugofasBUP9lmrIpQdRNYf0HAVMAptFtmxtZ
         mTx2Bxc0WUVzm2EXG2Wnhpu04qvlVOB/InETxYfhpTcK8+8Mu2m4rHJlrOQ2ecyFiEpa
         j9K1THPqvXQSXY02n05E7ww6SjHWNhT6SdjGhjhKEC2I427yebqBV0OMyZoSJ5bHnkgZ
         l+vw==
X-Gm-Message-State: ACgBeo0dB6Yc2o2xltQ/rqz/lhKOzQr1rU4fsjGk+dwCwRUcktTzbyBX
	pj64Zcr/VACrf3zpS9C8Yg/SdOsB7Q==
X-Google-Smtp-Source: AA6agR4YjN5o1V+7YpHEC44nv8XMRkYtC5qN3t+zwMxY4g/HAJsM6b5zTePRQHhpXASxFnOwXFOmf/+Z/A==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a25:9d83:0:b0:68f:a551:ec71 with SMTP id
 v3-20020a259d83000000b0068fa551ec71mr31466424ybp.212.1663189673186; Wed, 14
 Sep 2022 14:07:53 -0700 (PDT)
Date: Wed, 14 Sep 2022 14:07:50 -0700
In-Reply-To: <CAJkfWY6FYCNz_5+5cM2GoJdGLdBu7aPzs0e8uFmhgZRE_axLSQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <CAJkfWY6FYCNz_5+5cM2GoJdGLdBu7aPzs0e8uFmhgZRE_axLSQ@mail.gmail.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220914210750.423048-1-nhuck@google.com>
Subject: [PATCH v2] staging: rtl8192u: Fix return type of ieee80211_xmit
From: Nathan Huckleberry <nhuck@google.com>
To: nhuck@google.com
Cc: error27@gmail.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

The ndo_start_xmit field in net_device_ops is expected to be of type
netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of ieee80211_xmit should be changed from int to
netdev_tx_t.

Reported-by: Dan Carpenter <error27@gmail.com>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---

Changes v1 -> v2:
- Updated header file
- Added reviewed-by tag

 drivers/staging/rtl8192u/ieee80211/ieee80211.h    | 2 +-
 drivers/staging/rtl8192u/ieee80211/ieee80211_tx.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211.h b/drivers/staging/rtl8192u/ieee80211/ieee80211.h
index b577f9c81f85..9cd4b1896745 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211.h
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211.h
@@ -2178,7 +2178,7 @@ int ieee80211_set_encryption(struct ieee80211_device *ieee);
 int ieee80211_encrypt_fragment(struct ieee80211_device *ieee,
 			       struct sk_buff *frag, int hdr_len);
 
-int ieee80211_xmit(struct sk_buff *skb, struct net_device *dev);
+netdev_tx_t ieee80211_xmit(struct sk_buff *skb, struct net_device *dev);
 void ieee80211_txb_free(struct ieee80211_txb *txb);
 
 
diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_tx.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_tx.c
index 8602e3a6c837..e4b6454809a0 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_tx.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_tx.c
@@ -526,7 +526,7 @@ static void ieee80211_query_seqnum(struct ieee80211_device *ieee,
 	}
 }
 
-int ieee80211_xmit(struct sk_buff *skb, struct net_device *dev)
+netdev_tx_t ieee80211_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	struct ieee80211_device *ieee = netdev_priv(dev);
 	struct ieee80211_txb *txb = NULL;
@@ -822,13 +822,13 @@ int ieee80211_xmit(struct sk_buff *skb, struct net_device *dev)
 			if ((*ieee->hard_start_xmit)(txb, dev) == 0) {
 				stats->tx_packets++;
 				stats->tx_bytes += __le16_to_cpu(txb->payload_size);
-				return 0;
+				return NETDEV_TX_OK;
 			}
 			ieee80211_txb_free(txb);
 		}
 	}
 
-	return 0;
+	return NETDEV_TX_OK;
 
  failed:
 	spin_unlock_irqrestore(&ieee->lock, flags);
-- 
2.37.2.789.g6183377224-goog

