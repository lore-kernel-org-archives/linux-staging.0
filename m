Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2324E71
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 03:25:28 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id r13so3956826pjf.2
        for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 20:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Pb7k5gcwx2hPb9DsQiJub5fjyYCpgcCw0SGHu/Bvicc=;
        b=eyLGoPCXFnG89ajHudvpOQd5GhZxWcC0Q9dKKfYJPAoqSep4Fe8iYcPs5vP/ZsRIKO
         px/ioy62DAQ8QXrZmr5/2A/ctwuMjA11Nrzybl0vxaRtBGyKpFBInXY/U/MU4CZG4eJE
         fsjAuu2HnocgIhyg89ojgybwY6qQHmB6x5wDZA5lGgsUjA7levkx2phhjns2LP28adyH
         qSTTgQQnTwdADfFFcD/ukie1AWbNYyLT7mMHBwthoSG42Xyqg4Yzd06NajkkWgHU+XO/
         0obGieEXj5aDPnMX+HwSv/lvBVIoENudyoI0+94GqlvF/+rcZaHxvsHZlVeIWHZu0vTA
         BetQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Pb7k5gcwx2hPb9DsQiJub5fjyYCpgcCw0SGHu/Bvicc=;
        b=o2PQkKqyPJU3jDstHzCEQOe4y9hcVxnKJRhyow/ryCHPLtbL/gKS2/U23WRV0E6PkM
         gQkoqpcWhkrgq1lXFmX+bQRW58IiyM9PZaioXtWkAkH9MkoNezL3JpXyTYs7ti80qi9V
         GogLOG+hncboh8aszCLDX/fnPa3RS0FbU7Lq8S/vPxb7UCCAqIPopgZhsj6voEDO6Qu3
         cBC4o1fWTOYzEjTkkXnKTLfayZYkMBNLZHrSScP6vvIROm9GQBoagQWcTOGIg033ag0T
         FTdpyupyzW2XhcHmMonq0RfhYSNYWXoNy5fClTrAWB9i9Mh/Ebh0x25Icjwj7XNYTXGZ
         J97w==
X-Gm-Message-State: AOAM532I9FNYgnbXkdYGTRer7cVcw5KYvFt5XqXmiZ3UUf17ZDWKfL3S
	FAMNXgLreka/xIcNokxjrV8=
X-Google-Smtp-Source: ABdhPJwObgy3r3Q6U3/WcSGyVSOKW4dX0p7tKwhvgpSgZqsclPzdBZluDlXYCwDhHaaUs7nH2ve55g==
X-Received: by 2002:a17:90a:af87:: with SMTP id w7mr2496370pjq.187.1618284327677;
        Mon, 12 Apr 2021 20:25:27 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id e65sm11549793pfe.9.2021.04.12.20.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 20:25:27 -0700 (PDT)
Date: Tue, 13 Apr 2021 08:55:21 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH v5 1/3] staging: rtl8192e: remove parentheses around boolean
 expression
Message-ID: <596aa7e6d4e8ce80eaa98519001e17cf9d370f45.1618283232.git.mitaliborkar810@gmail.com>
References: <cover.1618283232.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618283232.git.mitaliborkar810@gmail.com>

Removed unnecessary parentheses around '!xyz' boolean expression as '!'
has higher precedance than '||'

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---

Changes from v4:- No changes.
Changes from v3:- No changes.
Changes from v2:- Modified subject description. Changes has been made in
v3.
Changes from v1:- Removed unnecessary parentheses around boolean
expression. Changes has been made in v2.
 
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index b1fa8e9a4f28..431202927036 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -276,7 +276,7 @@ void HTConstructCapabilityElement(struct rtllib_device *ieee, u8 *posHTCap,
 	struct rt_hi_throughput *pHT = ieee->pHTInfo;
 	struct ht_capab_ele *pCapELE = NULL;
 
-	if ((!posHTCap) || (!pHT)) {
+	if (!posHTCap || !pHT) {
 		netdev_warn(ieee->dev,
 			    "%s(): posHTCap and pHTInfo are null\n", __func__);
 		return;
-- 
2.30.2

