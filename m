Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BC023A3
	for <linux-staging@lists.linux.dev>; Sun, 29 Jan 2023 14:58:25 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id l35-20020a05600c1d2300b003dc4634a466so2391587wms.4
        for <linux-staging@lists.linux.dev>; Sun, 29 Jan 2023 06:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WMDHyvlfs7O/f9b0aUY8Mk44RRiJoj0uuEZqCuWERA0=;
        b=U8qeYGmLBlCJYcOTVLISYohR2qxsDZ1bIGwMgo+ozYZisTCvdpTSOb+t/WMHoRR1xR
         CIu0lhxN1GyLL7Adix2Na+kt1XMA9UWCiplJwRRzK1eHOw4SDJZxltOzFu7nwTMF8JDg
         U/nY34BrQ9N4EQKCWyd0xYNUGK4DOoY2Mu0jwnROimBUWeGtEbde4p8e0RWkeSADfiOL
         j6ve/Q1cwndyr/rS3VI5Qe5GWqY31T0es+MlK2mTSsDjoGuqu4tNTsh8H9DnHWuUhaaL
         7FkJQyxSuTJUfTQFnrmcoPHlsQW2o78Od9icSoPJG6H7aMKfJcsUw6P8ydjUOAHmKfYK
         W+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMDHyvlfs7O/f9b0aUY8Mk44RRiJoj0uuEZqCuWERA0=;
        b=ZAQd5Sl0yktmPGyGXGZLEUAkiKhpoXc8jY9Q5mnHVgfaA7GQTeFylvj0ZU5svdvxbc
         B2l7/8GNpqblqcwcRNrLhZvJeoWbWoEnuUOM25rLCDRZ66sIk5836u3ByBYILc7aLiv7
         2B0ne1bUomGGGtMksWy/6B4Gd1VUQCWVSz+4UwLnvna853/anUbN6JU1cg33PbpWSjPK
         /yXFQaeLqf9nVdaN7P3Y8708jag83s/H1Pm6k9KR/xqPe5bDrzGmZZjHb37JWYMmCvwp
         WbQga6ueVF6Rb4HRrPR0Q0TRJwJOIKw9HvYIzVKjJm2yMt6JJD8mJzoVn+2kCwzl05wN
         MyMQ==
X-Gm-Message-State: AFqh2ko4VR7jSkYX2Sngpo6V+M9NGg7w/jS0vIIVbXd9jMs0qzIqvvSL
	h4Ok31q84rwticzGLGUJPVc=
X-Google-Smtp-Source: AMrXdXvYTZTjqlLz3EJJYwiJBw9BoA6b3l1bQ66eqnoy1Om4WnKvjoucU/asJUo8sN+ZGPDRUKzO5A==
X-Received: by 2002:a05:600c:3b85:b0:3db:35e3:baf6 with SMTP id n5-20020a05600c3b8500b003db35e3baf6mr8664147wms.4.1675004303614;
        Sun, 29 Jan 2023 06:58:23 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id f7-20020a05600c44c700b003d995a704fdsm10008658wmo.33.2023.01.29.06.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 06:58:23 -0800 (PST)
Date: Sun, 29 Jan 2023 15:58:21 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 04/10] staging: rtl8192e: Remove unused constants from enum
 rt_customer_id
Message-ID: <108d80f0ae1006b716205dce0ca9a7ee597ba1dd.1675003608.git.philipp.g.hortmann@gmail.com>
References: <cover.1675003608.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1675003608.git.philipp.g.hortmann@gmail.com>

Remove unused constants from enum rt_customer_id. A part of the constants
would need to be renamed because of CamelCase.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 22 --------------------
 1 file changed, 22 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index d0c88d68b60b..17fc69c839d3 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -145,35 +145,13 @@ enum rt_rf_type_819xu {
 
 enum rt_customer_id {
 	RT_CID_DEFAULT	  = 0,
-	RT_CID_8187_ALPHA0      = 1,
-	RT_CID_8187_SERCOMM_PS  = 2,
-	RT_CID_8187_HW_LED      = 3,
-	RT_CID_8187_NETGEAR     = 4,
-	RT_CID_WHQL	     = 5,
 	RT_CID_819x_CAMEO       = 6,
 	RT_CID_819x_RUNTOP      = 7,
-	RT_CID_819x_Senao       = 8,
 	RT_CID_TOSHIBA	  = 9,
 	RT_CID_819X_NETCORE     = 10,
 	RT_CID_Nettronix	= 11,
 	RT_CID_DLINK	    = 12,
 	RT_CID_PRONET	   = 13,
-	RT_CID_COREGA	   = 14,
-	RT_CID_819x_ALPHA       = 15,
-	RT_CID_819x_Sitecom     = 16,
-	RT_CID_CCX	      = 17,
-	RT_CID_819x_Lenovo      = 18,
-	RT_CID_819x_QMI	 = 19,
-	RT_CID_819x_Edimax_Belkin = 20,
-	RT_CID_819x_Sercomm_Belkin = 21,
-	RT_CID_819x_CAMEO1 = 22,
-	RT_CID_819x_MSI = 23,
-	RT_CID_819x_Acer = 24,
-	RT_CID_819x_HP	= 27,
-	RT_CID_819x_CLEVO = 28,
-	RT_CID_819x_Arcadyan_Belkin = 29,
-	RT_CID_819x_SAMSUNG = 30,
-	RT_CID_819x_WNC_COREGA = 31,
 };
 
 enum reset_type {
-- 
2.39.1

