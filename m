Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D6F11702
	for <linux-staging@lists.linux.dev>; Sun, 10 Dec 2023 15:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EXGReKTG"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40c32e205fcso4744515e9.1
        for <linux-staging@lists.linux.dev>; Sun, 10 Dec 2023 07:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702221960; x=1702826760; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1HxTpgRZMqUaasDK2SQoows7vTW70XnRViyUroMPu9U=;
        b=EXGReKTGVNMCwDEQgQgmc3oWJY4b1SvNBgIPmjCuYzyJeZG9wVtjtkYjDvXLkaBU54
         D1wudBOBN0CWqVySlOutWWRecFj1FY17A7BQYTsXEb4HZmkeh1bSbcFmOsk4ngglVDfa
         oqOVG2gnPok4VB3LOPP2HseX+LKWnbfMLuRAroqTbwU7TO2VRlNsNnm3TPNxfLZK4EDd
         AIXN7N36eSqUoRXXkRC43XlL1cC4PgXlY2iBHzxuquG1GOtiSvPxkH2jSGD71fXigwF5
         k2d8KXu0OKCqauJfv1g8cnQasVGahyG4KqPHe9+GVY+zD8eb4zgKorAT44FX6ePOGgF4
         5Z5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702221960; x=1702826760;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1HxTpgRZMqUaasDK2SQoows7vTW70XnRViyUroMPu9U=;
        b=darRbFwJdxQ0CynHUy/RaDh8g7A7LM6KiRUnuUlZZ2D3HdqznEE7rnslsgpeyZqVog
         yu09P4J6Emd9iVgpetEWGZfvJ2ERmhoqwxiKvJ4vWzcg0llbybEkG1qeFagKxFKjVyNn
         R3iVyx6lN/i+u2gvErYwia2ZW7BMxwenHOJdsgX1pNn0ELBtjl9m1MXrqB8UIrC74ItY
         Z9IjkdqBA+g6ydha/YLXZX/wUOwXrLmx9I58Nv905HijZFQNsD4vDKgz3CVtE39JQ/Sk
         3/X0x/A74uyC018/GbD8bxxdYI9ELaTFMTikLKtq4po9TSyTCAoWkILVtywlOKjv+BsH
         Nkmw==
X-Gm-Message-State: AOJu0Yx/Pe2ehSFa6D/jgpLi8j3aovGa3+wp1OiSgPLGGz4vZN+jWBuD
	1IuRpOQvZlMGOqfASFq5uQB90xEeKUY=
X-Google-Smtp-Source: AGHT+IH4EzRkwgg/9IU6xxKsto+E6fiddXvXCHiduD7imzBv3zqTn9K+VLHLteQrHMEJX5aVf67cYg==
X-Received: by 2002:a05:600c:511a:b0:40b:516a:3856 with SMTP id o26-20020a05600c511a00b0040b516a3856mr4029610wms.1.1702221959852;
        Sun, 10 Dec 2023 07:25:59 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id fc17-20020a05600c525100b0040c42681fcesm3080228wmb.15.2023.12.10.07.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 07:25:59 -0800 (PST)
Date: Sun, 10 Dec 2023 16:25:58 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 01/10] staging: rtl8192e: Remove unused struct
 iw_range_with_scan_capa
Message-ID: <8b4532b8739ca0baa9fa7c736dab68130510ffe8.1702212003.git.philipp.g.hortmann@gmail.com>
References: <cover.1702212003.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1702212003.git.philipp.g.hortmann@gmail.com>

Remove unused struct iw_range_with_scan_capa.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index 4371ab1239ee..4c884c5277f9 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -158,28 +158,6 @@ static int _rtl92e_wx_set_mode(struct net_device *dev,
 	return ret;
 }
 
-struct  iw_range_with_scan_capa {
-	/* Informative stuff (to choose between different interface) */
-	__u32	   throughput;     /* To give an idea... */
-	/* In theory this value should be the maximum benchmarked
-	 * TCP/IP throughput, because with most of these devices the
-	 * bit rate is meaningless (overhead an co) to estimate how
-	 * fast the connection will go and pick the fastest one.
-	 * I suggest people to play with Netperf or any benchmark...
-	 */
-
-	/* NWID (or domain id) */
-	__u32	   min_nwid;	/* Minimal NWID we are able to set */
-	__u32	   max_nwid;	/* Maximal NWID we are able to set */
-
-	/* Old Frequency (backward compat - moved lower ) */
-	__u16	   old_num_channels;
-	__u8	    old_num_frequency;
-
-	/* Scan capabilities */
-	__u8	    scan_capa;
-};
-
 static int _rtl92e_wx_get_range(struct net_device *dev,
 				struct iw_request_info *info,
 				union iwreq_data *wrqu, char *extra)
-- 
2.43.0

