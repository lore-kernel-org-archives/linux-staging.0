Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D4B29CA
	for <linux-staging@lists.linux.dev>; Mon,  6 Dec 2021 23:49:58 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id o13so25652820wrs.12
        for <linux-staging@lists.linux.dev>; Mon, 06 Dec 2021 15:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C+BIND2ZoVF4Tr9QPLxHGVGa7QFELkyk6ki+EZDKm8g=;
        b=fwABxHvSrhuBMlL8yiFaS/KVVOSVAgYLcIVmBXmI3BFjOJ7Zv4N2p90xKjnxtTD75r
         NJAdcN6Hff7EOX9KbncY9pcbMkJMqf2IHvydi1SCK1fhuOC5WPkPQzX6vG8l9kiXfpbV
         2Fz7D63+VkWhVlLuFinJhW/bgAIrPY4nkmbe309eJHlLoDRWMGgZ58jUEQCch6uOYKcW
         +W94CJ44Kzsw0wh0jFa7kFXT9aDOxZStesez2I27+2zB+Pfuy+uZ9ZJV17VWWpMKI5M1
         xNIMU20sZMK7Lnl3zR7Y0attBQ320UGu4MIBsPtjVv4ZPmqGAIzOnCCJUKnEHBISuQXt
         0a3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C+BIND2ZoVF4Tr9QPLxHGVGa7QFELkyk6ki+EZDKm8g=;
        b=q+7Pxe03OE16u/2zx3hgFJQZhEmbI1kLFLDnR1otNnCdKOtWm6icUv8KAg7hFB/EOe
         uVQ74hLzbeRtC0kuvG+PIrYdM+TLPeSgZyt/ToOkys5hKKzdNZzyKHwd5vXvbnw71UZD
         66biMhV3Fx78FoxyBqObe9Yp/8ov+RMZguvwblwjRsZkr5DCl2accw5kVJhcxBvfT5YR
         iPHHO/cWt61xjLTvXkRg5IDOR7CwfsJ465ieCUDBtaro3OT/+CQL4bI3KOWMoKcizo8L
         oXuc6Y+bkwXbEeJCR5h5S5/5HglbHa8zmWTSftVaYH3AtVyG3S0aAj4FrYWD/TrRjxMw
         thDQ==
X-Gm-Message-State: AOAM532b1oIlnqJkImsXPJP/YcpkxhaXo1m7M6u+njMYM4bG1oChOs//
	JJhJ8QfjtrWaIoCKnHSnpZOkhg==
X-Google-Smtp-Source: ABdhPJz7gzMn+Wto+IJl8RwX775COT5DHG8twcU/+8raVJA/xpsiOjBV+5aBbzMcb90RVLaAUD80Rg==
X-Received: by 2002:adf:ce08:: with SMTP id p8mr47417101wrn.154.1638834597361;
        Mon, 06 Dec 2021 15:49:57 -0800 (PST)
Received: from localhost.localdomain (d.f.5.e.6.6.b.1.e.6.2.7.e.5.c.8.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:8c5e:726e:1b66:e5fd])
        by smtp.gmail.com with ESMTPSA id k187sm1241189wme.0.2021.12.06.15.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 15:49:56 -0800 (PST)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] staging: r8188eu: convert DBG_88E calls in core/rtw_security.c
Date: Mon,  6 Dec 2021 23:49:51 +0000
Message-Id: <20211206234952.1238-2-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211206234952.1238-1-phil@philpotter.co.uk>
References: <20211206234952.1238-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert all DBG_88E calls in core/rtw_security.c to netdev_dbg calls.
These calls seem to contain useful information/assertions and so are
probably worth keeping. In doing this conversion, also convert
static aes_decipher to take a struct adapter * parameter, as per the
convention elsewhere in the driver currently. This allows us to pass
this through and access its pnetdev member for the netdev_dbg call in
the function.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/core/rtw_security.c | 22 +++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_security.c b/drivers/staging/r8188eu/core/rtw_security.c
index db35f326bbb1..4e93c720c1b6 100644
--- a/drivers/staging/r8188eu/core/rtw_security.c
+++ b/drivers/staging/r8188eu/core/rtw_security.c
@@ -545,7 +545,8 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, struct recv_frame *precvframe)
 			if (is_multicast_ether_addr(prxattrib->ra)) {
 				if (!psecuritypriv->binstallGrpkey) {
 					res = _FAIL;
-					DBG_88E("%s:rx bc/mc packets, but didn't install group key!!!!!!!!!!\n", __func__);
+					netdev_dbg(padapter->pnetdev,
+						   "rx bc/mc packets, but didn't install group key!\n");
 					goto exit;
 				}
 				prwskey = psecuritypriv->dot118021XGrpKey[prxattrib->key_index].skey;
@@ -1145,7 +1146,7 @@ u32 rtw_aes_encrypt(struct adapter *padapter, struct xmit_frame *pxmitframe)
 	return res;
 }
 
-static int aes_decipher(u8 *key, uint	hdrlen,
+static int aes_decipher(struct adapter *padapter, u8 *key, uint hdrlen,
 			u8 *pframe, uint plen)
 {
 	static u8	message[MAX_MSG_SIZE];
@@ -1329,8 +1330,10 @@ static int aes_decipher(u8 *key, uint	hdrlen,
 	/* compare the mic */
 	for (i = 0; i < 8; i++) {
 		if (pframe[hdrlen + 8 + plen - 8 + i] != message[hdrlen + 8 + plen - 8 + i]) {
-			DBG_88E("aes_decipher:mic check error mic[%d]: pframe(%x)!=message(%x)\n",
-				i, pframe[hdrlen + 8 + plen - 8 + i], message[hdrlen + 8 + plen - 8 + i]);
+			netdev_dbg(padapter->pnetdev,
+				   "mic check error mic[%d]: pframe(%x)!=message(%x)\n",
+				   i, pframe[hdrlen + 8 + plen - 8 + i],
+				   message[hdrlen + 8 + plen - 8 + i]);
 			res = _FAIL;
 		}
 	}
@@ -1358,13 +1361,16 @@ u32 rtw_aes_decrypt(struct adapter *padapter, struct recv_frame *precvframe)
 				/* in concurrent we should use sw descrypt in group key, so we remove this message */
 				if (!psecuritypriv->binstallGrpkey) {
 					res = _FAIL;
-					DBG_88E("%s:rx bc/mc packets, but didn't install group key!!!!!!!!!!\n", __func__);
+					netdev_dbg(padapter->pnetdev,
+						   "rx bc/mc packets, but didn't install group key!\n");
 					goto exit;
 				}
 				prwskey = psecuritypriv->dot118021XGrpKey[prxattrib->key_index].skey;
 				if (psecuritypriv->dot118021XGrpKeyid != prxattrib->key_index) {
-					DBG_88E("not match packet_index=%d, install_index=%d\n",
-						prxattrib->key_index, psecuritypriv->dot118021XGrpKeyid);
+					netdev_dbg(padapter->pnetdev,
+						   "not match packet_index=%d, install_index=%d\n",
+						   prxattrib->key_index,
+						   psecuritypriv->dot118021XGrpKeyid);
 					res = _FAIL;
 					goto exit;
 				}
@@ -1372,7 +1378,7 @@ u32 rtw_aes_decrypt(struct adapter *padapter, struct recv_frame *precvframe)
 				prwskey = &stainfo->dot118021x_UncstKey.skey[0];
 			}
 			length = precvframe->len - prxattrib->hdrlen - prxattrib->iv_len;
-			res = aes_decipher(prwskey, prxattrib->hdrlen, pframe, length);
+			res = aes_decipher(padapter, prwskey, prxattrib->hdrlen, pframe, length);
 		} else {
 			res = _FAIL;
 		}
-- 
2.33.1

