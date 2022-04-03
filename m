Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9563B7A;
	Sun,  3 Apr 2022 15:51:16 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id s11so5950647qtc.3;
        Sun, 03 Apr 2022 08:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=KMyo2kuRhplybL49OQtW/YsdDRleCdv5VCypGkkq/8Q=;
        b=IhbZmIURx4wjA8epCWsV9y2q2ehL1GSy0DuVQ8w7lVx0Qu5vFV17i2xia+kljGzJWj
         zKG9GowRpdJyBEeSH5MgBuLLd9sF4jDVG7/RTSty2ncF+oVZFREZIb9LcHAAUud2/Wge
         +aa/TG00k9s3V3+uDZQ8Xr2KZ45UOEG4P7jfKpOzVv4QH5niFcoFgYUkNVkHXmC8hb/K
         YEKjcrYGop/5EY6HJAu8qzbtLU/L+4O+TjVslUQbVsQxw+felXsFUn/xcm2OE70JysLx
         GfyHtBDI7LlSHbac+QMFTGUX3gDRmd8qvO/iIf09cOV1hnLwhY0Ur+ha602svEDijEq8
         42+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=KMyo2kuRhplybL49OQtW/YsdDRleCdv5VCypGkkq/8Q=;
        b=FcgNoGkJxGbudN2OjlD6n8XAVid7P9IwPfaBwCA/9JxdKst8EGZkIxYog74BcbJGsH
         qkoSUKqHXfgIoZqHAlTu/Hz4cGBG+ZAR96WAZxCsJwlYinAkz8kPNKwCWWo81KsXoNVz
         QMQdlJ5NW5om619oxgkzgJQBCcWZ8wmIxMQ10rZfdJzwYhAlnVzYvE1w4EYndEDRsWio
         0F7juLukf0hteKS+5QFB+YJ2N1qKeMFES3DwTYZ6BEekHhlnF8YUtmEl6h9YqnBfOp0J
         NQUf1Pf/riEBtF0tJx1PW9qbBY25AwCNPIjRzWzse3JB79f4ZaPsMsCBOaWtD8D40aO6
         FshQ==
X-Gm-Message-State: AOAM530lFBYPTDNfXD92cYBiG1WTXjSEkXJiqeTwjrhA9CRZ2hDPO7km
	JtQ1IkTSyn5Xx9EPx/XE3Zk=
X-Google-Smtp-Source: ABdhPJxZaaj1JVs7XKsYVQ/SF9lpJqSJqujYHOjEQ/wzwq0ahOlmEyWuk6S2lLnvnh/nQJKwcA0Mdw==
X-Received: by 2002:ac8:7f07:0:b0:2e1:e86c:7199 with SMTP id f7-20020ac87f07000000b002e1e86c7199mr14586178qtk.591.1649001075387;
        Sun, 03 Apr 2022 08:51:15 -0700 (PDT)
Received: from euclid ([71.58.109.160])
        by smtp.gmail.com with ESMTPSA id o6-20020a05622a044600b002e1b9be8e6fsm6587133qtx.36.2022.04.03.08.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 08:51:14 -0700 (PDT)
Date: Sun, 3 Apr 2022 11:51:11 -0400
From: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH] staging: r8188eu: simplify control flow
Message-ID: <20220403155111.GA333187@euclid>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The function iterates an index from 0 to NUM_PMKID_CACHE and returns
the first index for which the condition is true. If no such index is
found, the function returns -1. Current code has a complex control
flow that obfuscates this simple task. Replace it with a loop.

Also, given the shortened function body, replace the long variable
name psecuritypriv with a short variable name p.

Reported by checkpatch:

WARNING: else is not generally useful after a break or return

Signed-off-by: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c | 26 +++++++------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index f94b1536a177..851092f61206 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -1637,26 +1637,14 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 
 static int SecIsInPMKIDList(struct adapter *Adapter, u8 *bssid)
 {
-	struct security_priv *psecuritypriv = &Adapter->securitypriv;
-	int i = 0;
-
-	do {
-		if ((psecuritypriv->PMKIDList[i].bUsed) &&
-		    (!memcmp(psecuritypriv->PMKIDList[i].Bssid, bssid, ETH_ALEN))) {
-			break;
-		} else {
-			i++;
-			/* continue; */
-		}
-
-	} while (i < NUM_PMKID_CACHE);
+	struct security_priv *p = &Adapter->securitypriv;
+	int i;
 
-	if (i == NUM_PMKID_CACHE) {
-		i = -1;/*  Could not find. */
-	} else {
-		/*  There is one Pre-Authentication Key for the specific BSSID. */
-	}
-	return i;
+	for (i = 0; i < NUM_PMKID_CACHE; i++)
+		if ((p->PMKIDList[i].bUsed) &&
+				(!memcmp(p->PMKIDList[i].Bssid, bssid, ETH_ALEN)))
+			return i;
+	return -1;
 }
 
 /*  */
-- 
2.25.1

