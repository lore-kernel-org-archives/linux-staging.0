Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48B171
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 14:56:49 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id ot17-20020a17090b3b51b0290109c9ac3c34so6416776pjb.4
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 07:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=0TGpMHgPIfxwquihKnJpBKaC4RMUZ2v7oFEWg7Mcab0=;
        b=Zrx0F0knYCjj6b2nKA8VbMAMpWQta5nUHIvTUZf1ttbj8OeIOQBqtIPvk/xrQdNxsj
         6+Hx8V+YpEI1dehE5kVzX+GJKcmG/haur9hHHCK2Rf/ZKcfKKlNjyUZSyLz8QWkzpBcL
         W8dzf6fq5X3Itg4DqhDnvixq9jNfIsCHsa4/Icgfrb791LtzjGJ4TSYk5WXVJIOuBP5P
         pSViikg0pLSmIf1TeofAgvE+kdqfFa/cdxpFTwnPqjsvshi2613/5ruardWdzuMYRat3
         hReNHAAG63aXMr74unwEZv1pBenROlXLFDPOv/Bu6tWCog5JKW4Em/hvCv/rrdU4o/Sc
         sYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=0TGpMHgPIfxwquihKnJpBKaC4RMUZ2v7oFEWg7Mcab0=;
        b=icgrEMWVwubaH92hWqynCUEsnCdO0q+cei+FC4J5qkiHRcft1nwwlcfpKG3gZx6gyj
         87yMxZiUp7FJOsHRq38CKNMyY+yMHPRDlWhygB5agjEEbQ1mtEEb7wunYlNvGfG5IM4M
         6IOgX5h/gYrTZ121FW7Q1fgRjO9kB4WqtAr7bD/O+wrx7htg7OAGYPP9TIz2I/jkFwd+
         bA+PHEESqHxU/2V/e5pDDn/f4+5510g4g8CTP8O1ZWGqrV9dOaEfK6J7w9UxQnXoLx87
         hbjwJozfixsHjBv4Gkg+Jnf+R2Z/dHzgurF+PC4CuT2CrPEXt9o3dV57YZGq0ecEcvqS
         FrRA==
X-Gm-Message-State: AOAM5304wwyJwl8gLlZx/YYaSSXDmo4ac/9ATN+GYxqITbNPhdWE+79O
	CI+Ndr6LOLMI1ndm161LtylIwPnDk9a1aA==
X-Google-Smtp-Source: ABdhPJzGBm4qq6eDo/9Bt0Gy82xz5/48yUG3qIXicy6em5pcNXw6xf+fxv+t+UrsBhGYDTwqA7egCg==
X-Received: by 2002:a17:90a:1b4b:: with SMTP id q69mr6854213pjq.188.1618066609328;
        Sat, 10 Apr 2021 07:56:49 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id e9sm5827703pgk.69.2021.04.10.07.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 07:56:48 -0700 (PDT)
Date: Sat, 10 Apr 2021 20:26:40 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH v4] staging: rtl8192e: fixed pointer error by adding '*'
Message-ID: <YHG8qARLUX2KPWwI@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed pointer error by adding '*' to the function.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
Reported-by: Julia Lawall <julia.lawall@inria.fr>
---

Changes from v3:- added reported by tag in proper manner.
Changes from v2:- changed the patch nody to describe changes.
Changes from v1:- added pointer to the function.

 drivers/staging/rtl8192e/rtl819x_TSProc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index 4457c1acfbf6..78b5b4eaec5f 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -327,7 +327,7 @@ bool GetTs(struct rtllib_device *ieee, struct ts_common_info **ppTS,
 	}
 
 	*ppTS = SearchAdmitTRStream(ieee, Addr, UP, TxRxSelect);
-	if (ppTS)
+	if (*ppTS)
 		return true;
 
 	if (!bAddNewTs) {
-- 
2.30.2

