Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8498A7F3
	for <linux-staging@lists.linux.dev>; Thu,  8 Dec 2022 09:11:20 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id p24so960102plw.1
        for <linux-staging@lists.linux.dev>; Thu, 08 Dec 2022 01:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t1wAtYZkQg8yxlvh3V2WzAs1Bk4wWoFDdDG5ii8S+ZE=;
        b=C5cAjxYYPbdbpMTbX/x0Ag4j99qppribUY9pXyVzfeJIH8LJ5bjcYCYA1I6s5Q/XNd
         mIEdB9YoIUPm3vl5498rOsHLWGfhjGNjX40VLZG1+fjS4hm717YlJh4PCSqO+iYFu4vH
         6ebXjNpFKrbrbp10EhF5eHolEa8RJXXeziZDXeDsxf8LURn/EfkzzoP38fNcPMmJmcfe
         SZ6g3BhwtG+P4RRqQt/VIR1xmRvBdJMmrytvNmThslaWrM6r257QP07J9QHH3xYIBppy
         G1o8a+i40pX2z27v0glyPITmrq+4t68igTJ2YxkYHObepdAltka8hsQGMC3fOIi6x88U
         oCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t1wAtYZkQg8yxlvh3V2WzAs1Bk4wWoFDdDG5ii8S+ZE=;
        b=1GH6wv04RTP4JSPODUaDPlrxkZXXXQuihzbKPT1zSZd/qSx+UDfJaOLrBLY9Ros6/w
         BMIx6W4EHbvM/dMrpJKJlptYo9V4TPfbkiPQ5N/wxMLcpAlN5FIcD7ycKanMTgTGkBKf
         5oipUwvl6oGkV+lItEjW9OveqslCiT9IYyOD10ohMax0JUeXVHRiLii1Vf8KgViqXCN9
         weEFz5XAi1krhx9+IUBNpDNLwtAPHnOTMF+juN6vvtlyLx/eaY5fNBq8lT1Q2wGLd4cN
         KPjJjo233MoPnhRRGu9W8vzWnCpR1pPveeCl1jPkOhVyfkIq8zawjcy2IGaQNgqr1NRX
         /s1A==
X-Gm-Message-State: ANoB5pnzb9XZksYbk40l09AlUO4nGBtRG32e4TdZJb5kOdrQy3uR6VLC
	f0UFMhKIXsQKMnBSPqAi7doPhHueqyYvKcpn
X-Google-Smtp-Source: AA0mqf6nuuyIVCUeKDrvq0WJlFuBsDFD8uIYrOlkZrUcPXkNeyn7jPh4YUl5DhDRi16W6p0C0TM4Lg==
X-Received: by 2002:a17:90a:ea8f:b0:219:2e8c:d1d0 with SMTP id h15-20020a17090aea8f00b002192e8cd1d0mr55902252pjz.57.1670490679822;
        Thu, 08 Dec 2022 01:11:19 -0800 (PST)
Received: from zoo868e (1-170-0-91.dynamic-ip.hinet.net. [1.170.0.91])
        by smtp.gmail.com with ESMTPSA id a15-20020aa78e8f000000b005743cdde1a7sm14801038pfr.82.2022.12.08.01.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 01:11:19 -0800 (PST)
Date: Thu, 8 Dec 2022 17:11:17 +0800
From: Matt Jan <zoo868e@gmail.com>
To: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 2/3] staging: vme_user: replace 'unsigned' with 'unsigned int'
Message-ID: <20221208091117.GA95220@zoo868e>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Update the bare use of "unsigned" to the preferred "unsigned int".

Signed-off-by: Matt Jan <zoo868e@gmail.com>
---
 drivers/staging/vme_user/vme_bridge.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vme_user/vme_bridge.h b/drivers/staging/vme_user/vme_bridge.h
index e17a8f7de165..9a127f6fefca 100644
--- a/drivers/staging/vme_user/vme_bridge.h
+++ b/drivers/staging/vme_user/vme_bridge.h
@@ -84,7 +84,7 @@ struct vme_error_handler {
 	unsigned long long end;		/* End of error window */
 	unsigned long long first_error;	/* Address of the first error */
 	u32 aspace;			/* Address space of error window*/
-	unsigned num_errors;		/* Number of errors */
+	unsigned int num_errors;		/* Number of errors */
 };
 
 struct vme_callback {
-- 
2.25.1

