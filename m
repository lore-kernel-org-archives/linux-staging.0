Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BB720F0
	for <linux-staging@lists.linux.dev>; Tue, 11 Apr 2023 06:10:37 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id m18so6811327plx.5
        for <linux-staging@lists.linux.dev>; Mon, 10 Apr 2023 23:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681193437;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dkAjXSbInJqpK+AYc3d/JTbngjvRoOz7ZrebCZ3Qty8=;
        b=Cq+C1T1mKjadyzRrmUi7YZr+1GwwK9zT2NdxFEBImGXebuTjB81i64Obyilk+jpUsb
         98mTqc4iHqgU7ZyXys6ZXQ659/ifXQ9nNG1JKRhH+bebbYzUfamDCEMyNGfyM7Am1bOB
         c5iKP4psRGYi5nCPFdZ+yvvOSp7BBmd+610XUzXupPqWLGChkHS5DvB03fu6S/IdjhuE
         FLi0R3A5bdsRwxdLOdyP3yXqpDV/cEhjK6B8Gv39dSjAxOSfCbl1WmeBwg6Semcmf6sR
         Bx93unBSUdjLL76QB0aRi0tgM7pfYidEyPK79ATA3mkNzQVnfe15CyN/xE9oJqeYaPMP
         RAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681193437;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dkAjXSbInJqpK+AYc3d/JTbngjvRoOz7ZrebCZ3Qty8=;
        b=REA94auCNOFK3Dt0VzhXUb/I/OKRm4fErTypkOG6VAJVlHnlkTaT1UuTdG4YL2NrU1
         K6Rpmb3kNuHf9p8VXgN2Y/0QsjicM839+K0lyJZUUhy19BDcCE1rHYslTolO3y1ZRy8R
         iy3ci92qwQJO22/eV6mEuHyIUeTNc1J9H7JT2Fljb29xu0HkcVJtiB6OnI7iEEwlDvnV
         yDFsgJbU/G1ke2aKg1LRQjAwXq5c9Y8YhP8KJ1yBf8qWvvcxdPWUvd4keicYzMM0S6wi
         JGaxLeZil4taOapQNJXqn5/Iyd3Lta7m6VnjNfQy4ifuX4ItZp6TPqrJf2COImZwaB5g
         7JQA==
X-Gm-Message-State: AAQBX9fi4foFqDE4GxoxY/BWAeBW6sjLyl1UrkHuAiYPeRNk4PngRSJw
	siidY1pbBXI/rPC9ANtOgyM=
X-Google-Smtp-Source: AKy350a8JFT2RNuf4juC0oFeBWrPRMCjw/qVCOsvKbwrvnqLx20P2GC0fu66AA4AUiKdwkNp/udOdA==
X-Received: by 2002:a17:902:e803:b0:1a0:6a47:184e with SMTP id u3-20020a170902e80300b001a06a47184emr16859960plg.42.1681193436916;
        Mon, 10 Apr 2023 23:10:36 -0700 (PDT)
Received: from sumitra.com ([59.95.151.140])
        by smtp.gmail.com with ESMTPSA id g24-20020a170902fe1800b0019aa5e0aadesm6471086plj.110.2023.04.10.23.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 23:10:36 -0700 (PDT)
Date: Mon, 10 Apr 2023 23:10:32 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: rtl8192e: Move logical operator to previous line
Message-ID: <20230411061032.GA265761@sumitra.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix logical operator continuation as suggested by Linux kernel
coding-style. Check reported by checkpatch:

CHECK: Logical continuations should be on the previous line

Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
---

v2: Change commit message, sugested by
Alison Schofield <alison.schofield@intel.com>

 drivers/staging/rtl8192e/rtl8192e/rtl_ps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c b/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
index 5a1cd22f5e25..58ed394202ae 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
@@ -209,8 +209,8 @@ void rtl92e_leisure_ps_enter(struct net_device *dev)
 					&priv->rtllib->pwr_save_ctrl;
 
 	if (!((priv->rtllib->iw_mode == IW_MODE_INFRA) &&
-	    (priv->rtllib->state == RTLLIB_LINKED))
-	    || (priv->rtllib->iw_mode == IW_MODE_ADHOC) ||
+	    (priv->rtllib->state == RTLLIB_LINKED)) ||
+	    (priv->rtllib->iw_mode == IW_MODE_ADHOC) ||
 	    (priv->rtllib->iw_mode == IW_MODE_MASTER))
 		return;
 
-- 
2.25.1

