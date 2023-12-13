Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856AD1D684
	for <linux-staging@lists.linux.dev>; Wed, 13 Dec 2023 16:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="asUfMxyk"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a1c6dad2dd0so223974266b.1
        for <linux-staging@lists.linux.dev>; Wed, 13 Dec 2023 08:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702486317; x=1703091117; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eXXlT7BTSZdbME0dg+FI046fx4EL208vm6bp8OzrrlY=;
        b=asUfMxyk9UKAm6Sa6T/S9mcQPY/LoKK5Sjas6U/y/1WhfrXaPOp0bXJnkLNZcoTF1b
         3X7njaLTde36rYHKusg4orxIyPV+0wnsdwrndAoRCUzQ/E2xYDb70ZJomB5yvW8qEDHu
         x3xPH0QZsyXunHcEw3aFhA2uvfjk7OWXy/YFYsooNiDp/AlB8jr5sYisSyvBDe7pMDLE
         pYF3IpRjTGLQw4QpO8URlpt91sMHx84z2t73jBfVoJFYmGTB31ukUDAx+wdMn2wE0HAs
         zHFKIk+LMoyN4nFQDb/SobE7zCEq2ht8R+gzrFSJmunVdqdo/YtLW3u1eBKDP6JM5BX5
         hY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702486317; x=1703091117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXXlT7BTSZdbME0dg+FI046fx4EL208vm6bp8OzrrlY=;
        b=KEVGsaXrsgpouDI58SKiiqEAg1RafLk9Q7/PA16VThJbCiDSwKSyo6r2Bf7I4bXrk4
         7h3pNcoLBAs2Yol4jrcENxeyR97WBy/rYxOqy49EgzgZenNGVoqIxAzte9YWMzfWcQkg
         /WXPTswj30J99o/xffweoP8nn69v44vGFpcw68vpepRwazhqkpjURkhujoLxXTRazLHo
         ZFlEaUaGHP4VULREB7nHsQc3Hkzu/neaQeTjAGZBtjz+niuxi8pccCNdSmTNJqUxHPo2
         Ue1aq7gz0rhSy6hMJP5ryRLHIV/vUw6qKNFsunSJdxKaj2GFVSxxkvpty7EBu+Gh16cO
         zVPw==
X-Gm-Message-State: AOJu0YxhCxuK2HHAOAdpms62BQLpSHAXvGMk6arNYJ1cPPZKRYPDWDem
	ud9egNi5D2EA5CLOtQj7bd4=
X-Google-Smtp-Source: AGHT+IETY7P9GMKjZx9EPgWPbvimebCoDuiRMS5fO6AQLWeVnzPfKMDY1g6Uc1uE0otAlnpuyx6dCQ==
X-Received: by 2002:a17:907:a789:b0:9e6:c282:5bd5 with SMTP id vx9-20020a170907a78900b009e6c2825bd5mr8721352ejc.3.1702486317003;
        Wed, 13 Dec 2023 08:51:57 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id vu8-20020a170907a64800b00a1d5c52d628sm8044926ejc.3.2023.12.13.08.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 08:51:56 -0800 (PST)
Date: Wed, 13 Dec 2023 17:51:54 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 03/10] staging: rtl8192e: Remove constant variable
 self_mimo_ps
Message-ID: <9e1bec657ddb22eec54e441a4341ddbe4ed7568e.1702406712.git.philipp.g.hortmann@gmail.com>
References: <cover.1702406712.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1702406712.git.philipp.g.hortmann@gmail.com>

Remove constant variable self_mimo_ps and replace it at the place of
usage with the value.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     | 1 -
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 5 +----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index ff0eb0d01022..eb2cfeab97d6 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -112,7 +112,6 @@ struct rt_hi_throughput {
 	u8 forced_mpdu_density;
 	u8 forced_short_gi;
 	u8 current_op_mode;
-	u8 self_mimo_ps;
 	u8 peer_mimo_ps;
 	enum ht_extchnl_offset CurSTAExtChnlOffset;
 	u8 cur_tx_bw40mhz;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 379934a71f87..71d5b6f32869 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -77,9 +77,6 @@ void ht_update_default_setting(struct rtllib_device *ieee)
 	ht_info->ampdu_factor = 2;
 	ht_info->mpdu_density = 0;
 
-	ht_info->self_mimo_ps = 3;
-	if (ht_info->self_mimo_ps == 2)
-		ht_info->self_mimo_ps = 3;
 	ieee->tx_dis_rate_fallback = 0;
 	ieee->tx_use_drv_assinged_rate = 0;
 
@@ -266,7 +263,7 @@ void ht_construct_capability_element(struct rtllib_device *ieee, u8 *posHTCap,
 	else
 		pCapELE->ChlWidth = 1;
 
-	pCapELE->MimoPwrSave		= pHT->self_mimo_ps;
+	pCapELE->MimoPwrSave		= 3;
 	pCapELE->GreenField		= 0;
 	pCapELE->ShortGI20Mhz		= 1;
 	pCapELE->ShortGI40Mhz		= 1;
-- 
2.43.0

