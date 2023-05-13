Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BD37477
	for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 18:09:06 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-50d897af77bso2055247a12.1
        for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 11:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684001346; x=1686593346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Y1rZV1MmREzrVxUKPP6KLxWKeW+vjNzBkwfZoTYQPs=;
        b=oW2BTlZv06GJHQgOMs+JHJERgBNw3DCYSrqWmlpjcRvpjzifJMBlQk+N1u8o1iDZS1
         /y6ybJ1ADRb7POgVRx1BnBgla5ndAY9ItiBT0kVY3KowMHoZKBDvcfngAY0qAKH42oXy
         Q3BkaKo8uyMak0jGHeEIMcQP184ll3UtjpWwphGVfkiNlrr/r3Afuq9H/iY1aey7rSoF
         WwBHmYTnp8lPs8u+LghU+hRVoVg76ATY1zUJXXcn8XJa7o1S+k8d5IVfD7045Udt3tMI
         ExZkBVTnC2th0YwgR6PBPyq+RWboqCA3wJer0/GTedRf644VYrAchqPvCZFSJkvcYX2/
         Xjlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684001346; x=1686593346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Y1rZV1MmREzrVxUKPP6KLxWKeW+vjNzBkwfZoTYQPs=;
        b=Tp3AjN7/5FcnH2Jn21LVWHDnhuf9wBRsArbOMpkLfmF4gstjWFUDI0ma+cTz1OnGQF
         l7bP+zO8neVx2AHtLn5S7XXosQ/cQN8mer0q5QtIpUF09cg+CWz657GSjO9iR9UQK6J9
         L2vgxhF4CncoGlahSRrGPOEH3IwUBnpoi4QRYnhwtT4mOepge4PGW+EyxDfmvVkNiD9Y
         d+oj0qVKFiXyyXidGrL708Ep8CPyNuLitbjLJON1vNr+dHqr8fcDk6zrf2eHQSIFtRuV
         wwfLaabuC6mfVWeh8g2cgezS9TAPE0lIwzkiifR3ncJRFL64GNQ9AAALGQhegsYwAcLw
         ThmA==
X-Gm-Message-State: AC+VfDzLrslVnTrlQuP2zxUi+tIj+DF7D1W6P+ugL2d9uj0lcBQDmnfM
	Qe74v/2482zvkX17Dy7GYW8=
X-Google-Smtp-Source: ACHHUZ50OzxFPaGRr070VMQlCM0/PqcDsup8HIQ/SBm4Mr7SnRdU9WAgTZyuBOqxrMvKZj/0BGPwQg==
X-Received: by 2002:a17:906:217:b0:94f:66af:b1f7 with SMTP id 23-20020a170906021700b0094f66afb1f7mr22946006ejd.1.1684001345848;
        Sat, 13 May 2023 11:09:05 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935e01.dip0.t-ipconnect.de. [87.147.94.1])
        by smtp.gmail.com with ESMTPSA id p15-20020a17090653cf00b0094ebc041e20sm6952776ejo.46.2023.05.13.11.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 11:09:05 -0700 (PDT)
Date: Sat, 13 May 2023 20:09:03 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 4/9] staging: rtl8192e: Remove undefined function reset_port
Message-ID: <faa1fa979b214f709012a8bd65debbcc2bb59049.1683960684.git.philipp.g.hortmann@gmail.com>
References: <cover.1683960684.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1683960684.git.philipp.g.hortmann@gmail.com>

Remove function reset_port as it is not defined.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h    |  2 --
 drivers/staging/rtl8192e/rtllib_wx.c | 19 -------------------
 2 files changed, 21 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index aac71fda4541..cc4247ebea6b 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1661,8 +1661,6 @@ struct rtllib_device {
 	int (*hard_start_xmit)(struct rtllib_txb *txb,
 			       struct net_device *dev);
 
-	int (*reset_port)(struct net_device *dev);
-
 	/* Softmac-generated frames (management) are TXed via this
 	 * callback if the flag IEEE_SOFTMAC_SINGLE_QUEUE is
 	 * not set. As some cards may have different HW queues that
diff --git a/drivers/staging/rtl8192e/rtllib_wx.c b/drivers/staging/rtl8192e/rtllib_wx.c
index d6691f3c7c70..1876ff75c31c 100644
--- a/drivers/staging/rtl8192e/rtllib_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_wx.c
@@ -420,18 +420,6 @@ int rtllib_wx_set_encode(struct rtllib_device *ieee,
 	if (ieee->set_security)
 		ieee->set_security(dev, &sec);
 
-	/* Do not reset port if card is in Managed mode since resetting will
-	 * generate new IEEE 802.11 authentication which may end up in looping
-	 * with IEEE 802.1X.  If your hardware requires a reset after WEP
-	 * configuration (for example... Prism2), implement the reset_port in
-	 * the callbacks structures used to initialize the 802.11 stack.
-	 */
-	if (ieee->reset_on_keychange &&
-	    ieee->iw_mode != IW_MODE_INFRA &&
-	    ieee->reset_port && ieee->reset_port(dev)) {
-		netdev_dbg(dev, "%s: reset_port failed\n", dev->name);
-		return -EINVAL;
-	}
 	return 0;
 }
 EXPORT_SYMBOL(rtllib_wx_set_encode);
@@ -625,13 +613,6 @@ int rtllib_wx_set_encode_ext(struct rtllib_device *ieee,
 done:
 	if (ieee->set_security)
 		ieee->set_security(ieee->dev, &sec);
-
-	if (ieee->reset_on_keychange &&
-	    ieee->iw_mode != IW_MODE_INFRA &&
-	    ieee->reset_port && ieee->reset_port(dev)) {
-		netdev_dbg(ieee->dev, "Port reset failed\n");
-		return -EINVAL;
-	}
 	return ret;
 }
 EXPORT_SYMBOL(rtllib_wx_set_encode_ext);
-- 
2.40.1

