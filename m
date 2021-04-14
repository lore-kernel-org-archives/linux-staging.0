Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07E672
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 07:22:21 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id r13so6011890pjf.2
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 00:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bOPzYhyvJvVeiml9bPQrg6xtoJCGmo6/t9FOb5TdJag=;
        b=jMVDMm76mBSnsuvjoK65aKRcxKQ82DrfuvIEwMueNgXXtO0BwQPLK3gUj9y65eyfI2
         81AadnT3nuyjjiA0hGlfn0O5WYsd7qV6FX5dKtt6bPUx6KQtPXeBbYnKsDRLF2WjqnVD
         7W9mMTHsxtcFSjE3kmO/6Mnxx5h1nKZvtXJCn10E1/8Vit4+LCj9+V4KuwnIcBRAYY43
         68H3oJvzgzb4JEfUqbYBVE5DSFU0qPm27ybKogdWPMqKFwPzF7UhFH7R5CV447NYsL76
         SeK2GXUeiGFt4Kz2//AfbLhRUVwKtShNIctyEBL96iBM/uSR+J/oWIfXYeMMfVAJ7fEj
         mhBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bOPzYhyvJvVeiml9bPQrg6xtoJCGmo6/t9FOb5TdJag=;
        b=F9Z2SqONqn4FUVu56s5i/vPGFzXt9uTxBQYPwoqLdKD/Id+0C84gsdCXXKZ39P6B3Q
         A31mClOa1vmhNGMFXN+6gwsdVbpFSmjr57QG7SMPsruqVkSkLMA/rt+PFWd9fzzPdNfG
         tYQH87aEMDTORy+B4X86DhNbkrdOC49METNXNafL1YVVB+E6Afy9XuulhbqgJczaNS7D
         WXudCZvoGYjqgPLgiMhNVT4KY9wDRjzy1Z24XtadBciLr/+Xpm7rkeAr1rZtgj1xbz2r
         0hGAN6KE2H2X4RiYLLkVChXJk6MFeAzTs++2rrJjf2JsEQziynp30zfmyYNOPF6GgDFu
         A1HQ==
X-Gm-Message-State: AOAM53139scJCTgaLvzMg2gP0rzcOJI75JHAbSoktDKjEz94niIC7vjD
	aGHC50g6r3S/Ko3DYSLJuUo=
X-Google-Smtp-Source: ABdhPJyiVqELxuxWAEiFr6hqPPjXxgUYHZxsxK/2aUz1Kxh1evr7gH6m/jLskN3aFnYY0Ad3YovwAg==
X-Received: by 2002:a17:902:7589:b029:e8:c011:1f28 with SMTP id j9-20020a1709027589b02900e8c0111f28mr35753149pll.35.1618384941156;
        Wed, 14 Apr 2021 00:22:21 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id i22sm16235159pgj.90.2021.04.14.00.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 00:22:20 -0700 (PDT)
Date: Wed, 14 Apr 2021 12:52:12 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH v6 2/2] staging: rtl8192e: remove casts and parentheses
Message-ID: <f23b290c27fdfaf36ff723fc49f486cfdb985052.1618383684.git.mitaliborkar810@gmail.com>
References: <cover.1618383684.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618383684.git.mitaliborkar810@gmail.com>

Removed unnecessary (void *) cast and parentheses to meet linux kernel
coding style.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---

Changes from v5:- No changes.
Changes from v4:- Removed unnecessary casts and parentheses.
Changes from v3:- No changes.
Changes from v2:- Rectified spelling mistake in subject description.
Changes has been made in v3.
Changes from v1:- No changes.

 drivers/staging/rtl8192e/rtl819x_HTProc.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 431202927036..ec6b46166e84 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -646,14 +646,10 @@ void HTInitializeHTInfo(struct rtllib_device *ieee)
 	pHTInfo->CurrentMPDUDensity = pHTInfo->MPDU_Density;
 	pHTInfo->CurrentAMPDUFactor = pHTInfo->AMPDU_Factor;
 
-	memset((void *)(&pHTInfo->SelfHTCap), 0,
-	       sizeof(pHTInfo->SelfHTCap));
-	memset((void *)(&pHTInfo->SelfHTInfo), 0,
-	       sizeof(pHTInfo->SelfHTInfo));
-	memset((void *)(&pHTInfo->PeerHTCapBuf), 0,
-	       sizeof(pHTInfo->PeerHTCapBuf));
-	memset((void *)(&pHTInfo->PeerHTInfoBuf), 0,
-	       sizeof(pHTInfo->PeerHTInfoBuf));
+	memset(&pHTInfo->SelfHTCap, 0, sizeof(pHTInfo->SelfHTCap));
+	memset(&pHTInfo->SelfHTInfo, 0, sizeof(pHTInfo->SelfHTInfo));
+	memset(&pHTInfo->PeerHTCapBuf, 0, sizeof(pHTInfo->PeerHTCapBuf));
+	memset(&pHTInfo->PeerHTInfoBuf, 0, sizeof(pHTInfo->PeerHTInfoBuf));
 
 	pHTInfo->bSwBwInProgress = false;
 
-- 
2.30.2

