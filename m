Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1885238F98
	for <linux-staging@lists.linux.dev>; Fri,  6 Oct 2023 19:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YKTr3ati"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-53636bc91a8so841577a12.1
        for <linux-staging@lists.linux.dev>; Fri, 06 Oct 2023 12:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696619129; x=1697223929; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4lreX3SHKEa8+ecJVm/PXdFDdYzsRKnuuuJws5KzVZg=;
        b=YKTr3atiPKf8KOUCXiB8YoPub6VL0f7hztLg3/zL0E0k0GaQSD//zR1FHouWpsPHHt
         JtamQqE0cJt5b9DL9U9e3Yrt1gj2mg1I0xP7fJtoyppsWXHoQPqZWA+gat08o+a2KRyW
         iTM4sTd1liV50gVS/qtj6UDypY7KXSraBQve5jyua46Y+pW7rbG6h/37sIuxhUkG+L0W
         D8iQfdyR7ZEbXugoY8ednRnV/Nsb1gOTyMPW+QsCji9n/duvP0+58FbOVQWf5eZaPeJm
         6Is+2MC67pcEqiXJQt18hn0FK8xzkqxw6Zr9le1+lsRTNb1l8WYMLa3eSeccNg22KWtp
         VYng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696619129; x=1697223929;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lreX3SHKEa8+ecJVm/PXdFDdYzsRKnuuuJws5KzVZg=;
        b=NzZ/+jmgI35JohKCWlGICDH0VeLYAqhmvZYr5zdUHYgI8Pt6E5FY2p5uOg2wosN0Uw
         I0QJ6OOkAOuyeg6wqpKxWadJYOYy8QS3byKOO4F1xLtrnr1umWunFVILncg0GrF7ffzy
         SmJC/ZuOAxc+MUgz7W5wkGL4LjQjyCFu50eyoCutj27DajKtdCutl9zWnhs6vSVuZ79X
         I6zGWLiBsZNN/+Q47NnXPaqj+9uq09f9VT9xpH9x3jeGJFdZegk1Ant+oNTzFQnYfRFV
         yAoUPjPx0R6d+wZ6MbgXH1BDK+wylmAMgbvwzAmWxA82O0Jo3+8HZb4oV98l9ycMIzck
         u7bg==
X-Gm-Message-State: AOJu0Yw8XHzoeCDC02gBNyYk/RK1QFai3ukRqjGoaEpkvs4wFwO4pZ3R
	lC9AOdCW7FsUyLh8RCfRxL8=
X-Google-Smtp-Source: AGHT+IEQ9iBFt236jfyvvA52ycBLUW+mtonNN2gijec8nrJC/C4dXiDWsZPqvpoqIe5kMoeVQosHng==
X-Received: by 2002:a17:906:530b:b0:9a1:aea8:cb5a with SMTP id h11-20020a170906530b00b009a1aea8cb5amr7653347ejo.1.1696619129491;
        Fri, 06 Oct 2023 12:05:29 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id g20-20020a17090613d400b009b96e88759bsm3406991ejc.13.2023.10.06.12.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 12:05:29 -0700 (PDT)
Date: Fri, 6 Oct 2023 21:05:27 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 08/10] staging: rtl8192e: Remove function
 _rtl92e_wx_set_debug()
Message-ID: <887ca5f66bad5105eeba449a9bd3e40be4b835ce.1696548527.git.philipp.g.hortmann@gmail.com>
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

Remove function _rtl92e_wx_set_debug() as this functionality is not
commonly used and the tool to access it is deprecated.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c | 40 ----------------------
 1 file changed, 40 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index d4d8d66df82c..ec8e7d5fe634 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -122,25 +122,6 @@ static int _rtl92e_wx_get_power(struct net_device *dev,
 	return rtllib_wx_get_power(priv->rtllib, info, wrqu, extra);
 }
 
-static int _rtl92e_wx_set_debug(struct net_device *dev,
-				struct iw_request_info *info,
-				union iwreq_data *wrqu, char *extra)
-{
-	struct r8192_priv *priv = rtllib_priv(dev);
-	u8 c = *extra;
-
-	if (priv->hw_radio_off)
-		return 0;
-
-	netdev_info(dev, "=====>%s(), *extra:%x, debugflag:%x\n", __func__,
-		    *extra, rt_global_debug_component);
-	if (c > 0)
-		rt_global_debug_component |= (1 << c);
-	else
-		rt_global_debug_component &= BIT31;
-	return 0;
-}
-
 static int _rtl92e_wx_set_mode(struct net_device *dev,
 			       struct iw_request_info *a,
 			       union iwreq_data *wrqu, char *b)
@@ -872,22 +853,6 @@ static iw_handler r8192_wx_handlers[] = {
 	[IW_IOCTL(SIOCSIWENCODEEXT)] = _rtl92e_wx_set_encode_ext,
 };
 
-/* the following rule need to be following,
- * Odd : get (world access),
- * even : set (root access)
- */
-static const struct iw_priv_args r8192_private_args[] = {
-	{
-		SIOCIWFIRSTPRIV + 0x0,
-		IW_PRIV_TYPE_INT | IW_PRIV_SIZE_FIXED | 1, 0, "set_debugflag"
-	}
-
-};
-
-static iw_handler r8192_private_handler[] = {
-	(iw_handler)_rtl92e_wx_set_debug,   /*SIOCIWSECONDPRIV*/
-};
-
 static struct iw_statistics *_rtl92e_get_wireless_stats(struct net_device *dev)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
@@ -919,10 +884,5 @@ static struct iw_statistics *_rtl92e_get_wireless_stats(struct net_device *dev)
 const struct iw_handler_def r8192_wx_handlers_def = {
 	.standard = r8192_wx_handlers,
 	.num_standard = ARRAY_SIZE(r8192_wx_handlers),
-	.private = r8192_private_handler,
-	.num_private = ARRAY_SIZE(r8192_private_handler),
-	.num_private_args = sizeof(r8192_private_args) /
-			    sizeof(struct iw_priv_args),
 	.get_wireless_stats = _rtl92e_get_wireless_stats,
-	.private_args = (struct iw_priv_args *)r8192_private_args,
 };
-- 
2.42.0

