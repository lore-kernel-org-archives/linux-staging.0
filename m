Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8847FC
	for <linux-staging@lists.linux.dev>; Sat, 24 Jun 2023 06:03:44 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-51669dd574aso316453a12.0
        for <linux-staging@lists.linux.dev>; Fri, 23 Jun 2023 23:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687586623; x=1690178623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aBSfn8glPT2kxNQHy+PfpOOqO6rN+IWZ6miV6QcZYkw=;
        b=NVRmC14/S1OEnqRzqTWlTQDcv+sbJhErpLvqB3BWs4Mx8Knib/+pRG2df40Gzi/ySA
         FUUWa3ijaGP33OSAlh0XF+ZADZUYgLEx7f3npCaxkn6MIAH0dSi+QEO74GRMgt36jJE4
         GJp7xCpnJuFSHKf3cE05WpNVjJHPXbBHUoTU4aQeVmwaDJ/pKKczDtF4IOI6Nn9lC7t3
         hhYPD1DPh3tGIgLG6BqjRmwHEJRUmqWpL3j0HaZkq9I8LdddDKNpz5unUvaGpjph3E6f
         Opu86HT7G+Iel/iS6uTmplkgVZjeBM9AcmZ2JIyE3HLBl9QmRXE9gUZY8umwhDN6R0Vc
         1pXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687586623; x=1690178623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aBSfn8glPT2kxNQHy+PfpOOqO6rN+IWZ6miV6QcZYkw=;
        b=ApMCvCXpSqzxxPeF23IvpFxcPNqVhoFoe0RffSGatHHSYP5GuS902RNbPciBOSnX5J
         qE4Ss4pqvNk004B+VQhHaXv+8J2pkW2iLvFtPSWXTqRTJ14F1QlemSiU1Xr0Y5VRQgZT
         H09znMYllQdQZgxHaZuv/op/SYABefEsvXimrncR6t2K3cvmvxkPyYdnj/apWAJBTEzo
         vaWcxp2bcVipW5FQACQY0TTlQUOFuKe0z/Ubqk4y2kRo5Hnnk5hE/l+oQb+ldck1sgNC
         pmSCTkeN0X4YlrsRzZfgjzkR2IkNCxwkyS5HcPEUSKk3hjWvRE9SOJBT8wofKK09xWPr
         SAUA==
X-Gm-Message-State: AC+VfDz0s/poKQdLiBzu3hKn8fAqgr1iVmeZNXhojL0e5Ax2gvPGJv82
	ydJyEpBz/+FbNQnJBeVVOqgXcz6vFec=
X-Google-Smtp-Source: ACHHUZ5g2n9rJ9hdt9TSwklixbRmpTWI8h2/OX/znA4tlIeI4dLnfbSPJpP/mntq1lx1LS/4DAUkjQ==
X-Received: by 2002:a17:906:73dd:b0:989:1ed3:d00b with SMTP id n29-20020a17090673dd00b009891ed3d00bmr9942539ejl.4.1687586623029;
        Fri, 23 Jun 2023 23:03:43 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id h9-20020a50ed89000000b0051d888df7f8sm31279edr.56.2023.06.23.23.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 23:03:40 -0700 (PDT)
Date: Sat, 24 Jun 2023 08:03:38 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 02/11] staging: rtl8192e: Remove equation of local variable
 InactTime of AdmitTS
Message-ID: <ff2d60f157059e5440a4b583f2604d99db4d8d2b.1687583718.git.philipp.g.hortmann@gmail.com>
References: <cover.1687583718.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1687583718.git.philipp.g.hortmann@gmail.com>

Remove equation of local variable InactTime of AdmitTS as AdmitTS is only
once called with InactTime as 0. The equation is always false and
therefore dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index 00f6a66c2265..ed124f85c2b1 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -188,10 +188,6 @@ static void AdmitTS(struct rtllib_device *ieee,
 		    struct ts_common_info *pTsCommonInfo, u32 InactTime)
 {
 	del_timer_sync(&pTsCommonInfo->InactTimer);
-
-	if (InactTime != 0)
-		mod_timer(&pTsCommonInfo->InactTimer, jiffies +
-			  msecs_to_jiffies(InactTime));
 }
 
 static struct ts_common_info *SearchAdmitTRStream(struct rtllib_device *ieee,
-- 
2.41.0

