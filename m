Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D5C38F98
	for <linux-staging@lists.linux.dev>; Fri,  6 Oct 2023 19:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VxLOIiKn"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-533c71c5f37so782518a12.0
        for <linux-staging@lists.linux.dev>; Fri, 06 Oct 2023 12:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696619117; x=1697223917; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L+5/W8zfr89+jzPHersBFwpSIge2gJvw1XUex3kLRTw=;
        b=VxLOIiKnkymAWALxw+djsREj2VJNFCPybgfO/F39hkDc/nLTY1vaJA+8u3H92Uabuz
         DOW5FJY/jXXkUJ58FlOPhjdzDP5ss8B30/elKxENYi3Z3PhPRZSBR4PdfDOVoZ3QjDtg
         dO8s7ZRBh7OhvCYSvBGAz5GMi8pRCbto8EByurLeP9ka3hAtJCygg7lfwU4Si2hrTzHE
         6GYVEvWWi8XmtLkLdsdF3lchkN0InyD12+GSacreJlzwE8vyY4+T6LvNJCee5of5gOEt
         9Zu795o/OSMaMC8N7EnG3m70TrTN9Y+mrJfD2TWDdUCU+rp2Oo7ORKYCTwCXyIVBhmHM
         Jk6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696619117; x=1697223917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+5/W8zfr89+jzPHersBFwpSIge2gJvw1XUex3kLRTw=;
        b=C0jAyXMhtnG16u5SfQeST+X2oV5toitRiJ88rk31r7pTn0gV86aMiu7TAVZa/YTC2O
         2IXhlhJM7s52a0ufVHSYQtjDxTKU6g0jZdabPEBqFcjQROMFdNKp1h4cfVFYd0Y3S1OK
         YolCDN/pSNsUqhy1EhlSDZdHl5ipoYoLkOk+Mnt5Q/JRBRYsQ2o2gmbK7hX1CE0uJ3Gf
         T/QPPM7kyKUPdkcIdKdDHCpLlo75kw7pCD9yOu2p54AXdQu1EubyMWf7F6xTzC7z8LuP
         zo6mJYikjco6S+Dd0Z1M+GTCSrwwsjmz8nv/B+ZJM2zICdddynOHKdwswiNWG1PF0cgq
         MLCA==
X-Gm-Message-State: AOJu0Yx+BjzJWgrlOH1utvkVi/DtQj8dSOE4E75oaEI7XTRdebCqJ963
	uegJ48taGQqZ1eE2OAsVimSStwdxsPY=
X-Google-Smtp-Source: AGHT+IEvANf54FpArnQMlxmNuMfePdWnNr1sJEIJQOKWvwvG7U+yoh110mg1nWK9jpRaYXH9ABew8g==
X-Received: by 2002:a05:6402:524a:b0:530:8a69:c6da with SMTP id t10-20020a056402524a00b005308a69c6damr7326575edd.4.1696619116810;
        Fri, 06 Oct 2023 12:05:16 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id r19-20020a056402035300b00522828d438csm2993147edw.7.2023.10.06.12.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 12:05:16 -0700 (PDT)
Date: Fri, 6 Oct 2023 21:05:14 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 06/10] staging: rtl8192e: Remove function
 _rtl92e_wx_set_scan_type()
Message-ID: <8a0ce95447dbd736e3aeec5f7aa0e997f916b7d8.1696548527.git.philipp.g.hortmann@gmail.com>
References: <cover.1696548527.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1696548527.git.philipp.g.hortmann@gmail.com>

Remove function _rtl92e_wx_set_scan_type() as this functionality is not
commonly used and the tool to access it is deprecated.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index 27309df925ba..d4d8d66df82c 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -627,22 +627,6 @@ static int _rtl92e_wx_set_enc(struct net_device *dev,
 	return ret;
 }
 
-static int _rtl92e_wx_set_scan_type(struct net_device *dev,
-				    struct iw_request_info *aa,
-				    union iwreq_data *wrqu, char *p)
-{
-	struct r8192_priv *priv = rtllib_priv(dev);
-	int *parms = (int *)p;
-	int mode = parms[0];
-
-	if (priv->hw_radio_off)
-		return 0;
-
-	priv->rtllib->active_scan = mode;
-
-	return 1;
-}
-
 #define R8192_MAX_RETRY 255
 static int _rtl92e_wx_set_retry(struct net_device *dev,
 				struct iw_request_info *info,
@@ -896,16 +880,12 @@ static const struct iw_priv_args r8192_private_args[] = {
 	{
 		SIOCIWFIRSTPRIV + 0x0,
 		IW_PRIV_TYPE_INT | IW_PRIV_SIZE_FIXED | 1, 0, "set_debugflag"
-	}, {
-		SIOCIWFIRSTPRIV + 0x1,
-		IW_PRIV_TYPE_INT | IW_PRIV_SIZE_FIXED | 1, 0, "activescan"
 	}
 
 };
 
 static iw_handler r8192_private_handler[] = {
 	(iw_handler)_rtl92e_wx_set_debug,   /*SIOCIWSECONDPRIV*/
-	(iw_handler)_rtl92e_wx_set_scan_type,
 };
 
 static struct iw_statistics *_rtl92e_get_wireless_stats(struct net_device *dev)
-- 
2.42.0

