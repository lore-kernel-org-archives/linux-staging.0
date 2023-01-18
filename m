Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D27753A7
	for <linux-staging@lists.linux.dev>; Wed, 18 Jan 2023 19:59:56 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id f19-20020a1c6a13000000b003db0ef4dedcso2165484wmc.4
        for <linux-staging@lists.linux.dev>; Wed, 18 Jan 2023 11:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k3R7IB1dzrow/0Vr25tuv7jgHVFQelvLSJmLj6RztKg=;
        b=BwCqiuF5rAns/7by5wAvM7UGegecxxogcobljziaCG95at/IxsAxj705wzdLi21lbB
         nMyFmITB7jqRMmRzFMQGnhNd4MoIcZRPTXwBbJfiKIRedP3sM1qMwHjzCDrVdaZ2nrbS
         nT5ciWbg8eqpc60g2FsRnPxSeqEQABxDzV1FBuvJbawm/hLSe65OHvUtU8nPd0FybwDc
         gRjUBFsvyLRydbDiSfO8zGMybzEWaomyJDRpAtPqGqYFxIf3QPySMuDA8qWEHzzU7NFi
         UFN6zTNusmhOszo/CYH/VsT/dtLFcAHQi2HrwrbjLPHeTMZxI558jpPuJaWqltHhu/AK
         Gl1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3R7IB1dzrow/0Vr25tuv7jgHVFQelvLSJmLj6RztKg=;
        b=d9QOKz0xyJNL+KOww8ubtxReJhbzYdsJzrGgcrNQuTg7EBuG1QC4ytgh/Oxaa96q7D
         58CUj5/3VL2Wd8WrqTHStNY+XNcC8U4e1dnDrPKL/eUgfOFHAPhCmeoUL1vjxUJBvarI
         a/HK95IflLJtg7vOhkoCcEaM/JMbPs2jwXLfOR4+0DuGPCJCei7hom440ah33Q7RXG2Q
         GxlazhjO/mM/J1zefT+wxM6TBVZm/ZD/6mKffMT8H8vXqxYU+bYySYugKol9NnV2EL1c
         7llMvjkVom4RKyE2tVh+QyqLNPxvJ8gOwJj1UeZ+SW69nhIUxVQ/y6617oWUH4i9vvd8
         2ZKw==
X-Gm-Message-State: AFqh2ko7aRV0k7BuntdExEDP3nB8DTX6jBp7dZPVD74HLeOEvpg76E8i
	UksCk/h/M1CpWAfS1UlSNBFtxj2YsrI=
X-Google-Smtp-Source: AMrXdXujSXUzoIM1dbRu2AwiupxJNiRB32qV9TPx4Wdot64USNx8/1/KvkZ9STHwwfXPI3kr5ciNdA==
X-Received: by 2002:a7b:c849:0:b0:3db:303:2724 with SMTP id c9-20020a7bc849000000b003db03032724mr2008902wml.1.1674071994863;
        Wed, 18 Jan 2023 11:59:54 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id bu9-20020a056000078900b002be1dcb6efbsm6009244wrb.9.2023.01.18.11.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 11:59:54 -0800 (PST)
Date: Wed, 18 Jan 2023 20:59:52 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 6/9] staging: rtl8192e: Remove unused variable
 PwrDomainProtect
Message-ID: <769f4d3337872d29d8fc5e31613aac52b6bae95b.1674071236.git.philipp.g.hortmann@gmail.com>
References: <cover.1674071236.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1674071236.git.philipp.g.hortmann@gmail.com>

PwrDomainProtect is initialized and then never evaluated. Remove resulting
dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 --
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h   | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index fe985f4b8dbb..227c13d552fc 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -2027,8 +2027,6 @@ rtl92e_init_variables(struct net_device  *dev)
 			    IMR_RDU | IMR_RXFOVW | IMR_TXFOVW |
 			    IMR_BcnInt | IMR_TBDOK | IMR_TBDER);
 
-	priv->PwrDomainProtect = false;
-
 	priv->bfirst_after_down = false;
 }
 
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 626a2bc48969..e90cc61b3817 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -526,7 +526,6 @@ struct r8192_priv {
 
 	bool		chan_forced;
 
-	u8		PwrDomainProtect;
 	u8		H2CTxCmdSeq;
 };
 
-- 
2.39.0

