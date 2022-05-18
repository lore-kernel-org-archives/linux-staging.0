Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E460533C1
	for <linux-staging@lists.linux.dev>; Wed, 18 May 2022 22:12:10 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id f4so5911853lfu.12
        for <linux-staging@lists.linux.dev>; Wed, 18 May 2022 15:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cn63gQ8fiAaCxUAU+GTYt00yC4JfY8txZfLENC/Ur9w=;
        b=GQzLTFCOrNanqTm53W3JgcJ/s6SmwuCgS3A2l9Sfjr4qOIA3OtMOW46EryhNNjDLsn
         SdIxVDoIi9qQue2hi8jtFVzVhjh1vQOhmXFHuN7H1ijXrYgOfxbpq4LfNqCpcUEYCStN
         RqWhqUMpDDKculdrAtCqaQxLgo5C0Kic0ken3PECPtrlKCMBIKSjeD6rokGdwC+bwUa/
         tEx1XcSx0T5s4eRe15812GAO4xpmkA/6cOco9pOmZvvuC3Aqh7cgz7Agb7cifOcydZA7
         lz6jOsZQgQLCVY9o/BfL0f8EU38KI+RoEbQecYOuycx8JjFLpAsj86cwc57jnhvkHCgU
         7jeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cn63gQ8fiAaCxUAU+GTYt00yC4JfY8txZfLENC/Ur9w=;
        b=TSYlPDxJUMX2ymBH2ozcL0DNQqC4y4TNHPJedGWh6vFs0o+skTqlap8y/ryTSWb5OF
         2RLS6wSvPTvblGP0jsQlgwsfiuunr2nhpbuA9jwHXflsJlWVPI5PSihieFDwjQyVinth
         VUu7MTS8e0oPh/bLWsD2W8QXOrPhluX55WAhLlkEGlfruMtba/Y7TyMJIxQYwSreh6ub
         cXmcr4VOxhTXeNivfJbSAE++HTXEQYI6RvqfpKUb/F93uF9SsJ7icAuQyaheFi65L7GB
         2swflc696gQ2lnLyYD/Xd8OmiB9GIvIFyYPEATTy1sexDU198n+HssgyIdz203NsQEBZ
         Yhgw==
X-Gm-Message-State: AOAM531bNk6ytZYlbXqy1oxSSNYSVc1tx6/VbLWDsc1HKti/sPQxPaoj
	Kv/AgsRkGqb5TWUGMeJcTmQ=
X-Google-Smtp-Source: ABdhPJxqQOd8gl6Gdx8ldU4/CWEFIHt5q7SkIzGwSMHTA+fcC45NmWvTJFdnaVHDZSN+e5fjJemAjw==
X-Received: by 2002:a05:6512:21ad:b0:477:a61a:bfe6 with SMTP id c13-20020a05651221ad00b00477a61abfe6mr1061417lft.173.1652911929001;
        Wed, 18 May 2022 15:12:09 -0700 (PDT)
Received: from localhost.localdomain ([46.235.67.4])
        by smtp.gmail.com with ESMTPSA id o23-20020ac24e97000000b0047255d211b0sm65411lfr.223.2022.05.18.15.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 15:12:08 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: gregkh@linuxfoundation.org,
	Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	dan.carpenter@oracle.com,
	fmdefrancesco@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH 4/4] MAINTAINERS: add myself as r8188eu reviewer
Date: Thu, 19 May 2022 01:12:06 +0300
Message-Id: <42559eab6dd1a69c3fb11ee6ed1f33337041817d.1652911343.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1652911343.git.paskripkin@gmail.com>
References: <cover.1652911343.git.paskripkin@gmail.com>
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

Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
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

