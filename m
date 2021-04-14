Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CB972
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 06:55:50 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id lt13so917352pjb.1
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 23:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PcanKz2JI3sv6qcdkfJn/3M37tEs8B/qxfDD8BezmTY=;
        b=AUC7XDuw1TQ1ZTbpzBOPu7fqFtP5txh9v46VtMvQTctw1GAWRarUdtmQ/5eOBOrHB1
         SBlSTJWkBxyTyT4ZtAM0vKA/ittgWiSZhGSipQo27TnJJ/z5GXvjMqdlkthGfOiW4rpQ
         35oPn775XC9E2IQwvgD29RbCy63ATQUaJ0WsJxfUqKBvffiLXYsIe1wq1gIYgN2uiXuv
         eUYKUVD3ra0NU9iO1fGYieOm1LEFt0O8DR8K8zgrRlIyRdkAU7DWxX9fYZKEzn/zoTpp
         8l00yccjLSGj7IxapSScQNOKPicP3x3wur9Sies+y/vctusQxr9wjHJQ0awMWaxLZBBB
         4K7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PcanKz2JI3sv6qcdkfJn/3M37tEs8B/qxfDD8BezmTY=;
        b=uMD9slU6tJJP2efTmvRVKdTIJWmCHIL1ShmBNqeZWFwSHp9hJpW6Plbzz5Ld8cx/5j
         uZ8NAOPcG7CXMw7U9lRe2gBqJ53gbaA77sZlvzGTzzUpYVawDi+S2JcrWue6Jj4AUpzt
         XPmgR0bBuWrU4AO07gJ30XbPOlRLtiwROFdAAqu0KYTPSeS8m63HfsBrV078m2DVHs51
         5VRpxs+7xVoI+aR2ZPqRpSPISY/im7HiPxSjf1dGonsGwvxKrTkmEj1UhCNq/nycDtVe
         lXDQsVJtJHhrYqXmKYScST/o6wuH7bUAkmSDHA0EoMxqC/dGtKM7WOYj99nHH7Knzzk/
         pEMw==
X-Gm-Message-State: AOAM530Um6VAYHy4ld9c9ouM+r9f68h5h2X6ECc/2RDfjGkcjejh8NLU
	Id6QEX90hwFpO2XKntCrJcI=
X-Google-Smtp-Source: ABdhPJxCWD/wDaDIetW79z2KKktAfpfDPU2N+11k34hNMq2GvHJoLMR5wU8Sl7SZ6ZLta0zfKiXCbQ==
X-Received: by 2002:a17:90a:b292:: with SMTP id c18mr2037422pjr.179.1618383350348;
        Tue, 13 Apr 2021 23:55:50 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id c129sm14470541pfb.141.2021.04.13.23.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 23:55:50 -0700 (PDT)
Date: Wed, 14 Apr 2021 12:25:41 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org, davem@davemloft.net, kuba@kernel.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH v2 3/5] staging: rtl8192e: remove unnecessary blank line
 after close brace
Message-ID: <40f72a84750f402c342b4685e0a2f15d27875c9a.1618380932.git.mitaliborkar810@gmail.com>
References: <cover.1618380932.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618380932.git.mitaliborkar810@gmail.com>

Removed an extra blank line after close brace '{' as it was not
necessary.
Reported by checkpatch

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 
Changes from v1:- No changes.

 drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 651441a71646..b6805908bbbd 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -492,7 +492,6 @@ u8 HTGetHighestMCSRate(struct rtllib_device *ieee, u8 *pMCSRateSet,
 static u8 HTFilterMCSRate(struct rtllib_device *ieee, u8 *pSupportMCS,
 			  u8 *pOperateMCS)
 {
-
 	u8 i;
 
 	for (i = 0; i <= 15; i++)
@@ -685,7 +684,6 @@ void HTInitializeHTInfo(struct rtllib_device *ieee)
 
 void HTInitializeBssDesc(struct bss_ht *pBssHT)
 {
-
 	pBssHT->bd_support_ht = false;
 	memset(pBssHT->bd_ht_cap_buf, 0, sizeof(pBssHT->bd_ht_cap_buf));
 	pBssHT->bd_ht_cap_len = 0;
-- 
2.30.2

