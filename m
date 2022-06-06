Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660627E
	for <linux-staging@lists.linux.dev>; Mon,  6 Jun 2022 19:37:17 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id b12so5879298ljq.3
        for <linux-staging@lists.linux.dev>; Mon, 06 Jun 2022 12:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LU+ehwQCgMw+RYAoa7UysR6sc9DbOFvZWP1+pr1tYwY=;
        b=lCbnKYifr76Ts+W+Qg90YlR4M6WXtHUcrsKy/4n+7CGfZnvzr3QaV5y+IRd710y+vq
         ZObhXIihBHKg6ecLk2vuSJpkIq7rPDnp2dVpDcA1+fx/lrQlp7vJhooYKtpbpZmbnoI0
         XAyt2V0GrN8EDAzLt9/K68mHqiAuQVDlqWJ5Rn5KpQ/2HGMg7/OOOMj8QA1xEgGwHQLZ
         9xXvgMWtAU7xLJhOnrBo5QGveUyjYRzFuxPYk17o7iGdLC7YGpZ1kJnUoSgR8h77FQlE
         FJymYiIzy0Q6ekLg3Z9OQuAdD+Pi5puRL1D8+SLH0m/vtBjQQ9QdW23o9qEMvR80mnVm
         KBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LU+ehwQCgMw+RYAoa7UysR6sc9DbOFvZWP1+pr1tYwY=;
        b=ODLI3/xQlPd9TbREm5jnlDUUyeej/NrCaR3trhGVp3tGoUlTOLND1J4KlUyctugRGj
         ikxxJJkEAdA7Mr0lpdpD9LvMtyi7iLgvIgFiSVq4264I/F4k6lty7s57CViHl2a/Gmob
         TC9swMdznpSUfmSU3MPgRgR/ELwx8xnr6dwbjOO4z2eyf0zn/NRc5wH9xno9u46uPeAr
         AHjbIRLI0IEEoBF/xMHlrQASybBd4v4VVhvVSAEXvPmy7y89UyRu/P3vnWJmE9fO4QPJ
         CgHf1fVLPB+Ec1fgyMye18PkedTeAs6dM1Xje0OvW3OCS2FXcdleHpOLcJdcVzZwtnC+
         XTow==
X-Gm-Message-State: AOAM530MT8fMXdTejUDfYl0NgVBbbzxpAW/1ElqgRuRMwDefj0zLy4gD
	H/23c7fovpg70UDOngWgOGE=
X-Google-Smtp-Source: ABdhPJxsCGSY9/dA+Q1B/ePGKjzzQzv5s5GxY2jagXqL8gholPFkBXGB+z4UXa3QQH6gJzNQ15qabg==
X-Received: by 2002:a2e:954f:0:b0:24f:4457:950d with SMTP id t15-20020a2e954f000000b0024f4457950dmr52789784ljh.35.1654544235470;
        Mon, 06 Jun 2022 12:37:15 -0700 (PDT)
Received: from localhost.localdomain ([94.103.229.27])
        by smtp.gmail.com with ESMTPSA id j22-20020a056512345600b00478ed85bc92sm2968233lfr.249.2022.06.06.12.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 12:37:15 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: gregkh@linuxfoundation.org,
	Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	dan.carpenter@oracle.com
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH v3 4/4] MAINTAINERS: add myself as r8188eu reviewer
Date: Mon,  6 Jun 2022 22:37:12 +0300
Message-Id: <a5e93a54a2481f7a0c1921b7c9914972a5a93e45.1654543286.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1654543286.git.paskripkin@gmail.com>
References: <cover.1654543286.git.paskripkin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I was reviewing r8188eu patches for a while, but I am missing some of
them, since I am not in CC list. I want to be CC'ed to help reviewing
and testing more patches.

Acked-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Acked-by: Phillip Potter <phil@philpotter.co.uk>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0a635f2ae5b9..bd38a2e465cc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18716,6 +18716,7 @@ F:	drivers/staging/olpc_dcon/
 STAGING - REALTEK RTL8188EU DRIVERS
 M:	Larry Finger <Larry.Finger@lwfinger.net>
 M:	Phillip Potter <phil@philpotter.co.uk>
+R:	Pavel Skripkin <paskripkin@gmail.com>
 S:	Supported
 F:	drivers/staging/r8188eu/
 
-- 
2.36.1

