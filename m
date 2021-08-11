Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAF672
	for <linux-staging@lists.linux.dev>; Wed, 11 Aug 2021 03:12:37 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id f3so836544plg.3
        for <linux-staging@lists.linux.dev>; Tue, 10 Aug 2021 20:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nA6s5SUKPBQ0dyQ+8gQLVtYbBBkn3UOaZ+NSfCbjMkg=;
        b=p5LDgZ2t+B+JteWwdlOOKCismHfQQXlCRhIDfxKJg64yBCytrfwvqhyPLHbmNHDc3H
         WI5qCmW6TFZxjefGoteq1BOf7SbmmCyy5HN1TP0JEKib8gthBm/vP9RbbW0uyR0ASLPg
         RY0RtCK62UPLIn6CmgPOrEGOwNT2hh2XYosr4RT9SDrrOQZ9mnC5qdQGg7lYqvdOtnmi
         18Cqa6mKu0ogxFQMm7gphFFzxaX9CowRtlZ5yJx6UOmzXj/8dRbHe77V/nF2qcJlHdKS
         CkLHd9rFQz5thhQpvia9wf9aQxJNSmxAszcI79LsRmcl2cf7O6IY9UqRavRdDREtOG7T
         AQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nA6s5SUKPBQ0dyQ+8gQLVtYbBBkn3UOaZ+NSfCbjMkg=;
        b=dvSek0gzE94Pd8V63OUGX/z/I3pS0wbQc2Cf+FnmxwVZ4wcq37NsRflYIiT+yvPSOy
         JU5VEhJc5APqgt0fvlAAOH1an72Q9zQKpjH+rpOJXfdrPYMil21vySj8U/TtieONmn2p
         WdeVdlamB+jQ+FeEHEjHrZ1m4UZWHucQglwvKe2axpKo1lqJPQNumYfWSqvQl4qJsozy
         RGbJlfjb3DymHAg8yEOHlmzBgW6Pp1UorLNFycFJW+Tx+fTkPnfrQZjnYHEeEIbNE+Xv
         RYYakFygMaTNr2TxrzNuw5sgXP2XMich8XOrAVMynry+cWTYHgg2JPk1GJTpeSuHsMRW
         Kfjw==
X-Gm-Message-State: AOAM530uVWHnqVX9es91MWhCmz9nl7d3l6h9btFsgJ43zKqAO0ohiOs9
	gPWMA7Sa2OWudAZO7uuqPuw=
X-Google-Smtp-Source: ABdhPJyysRuUq7d4TEhgCa6TpIX0ck1p4VhxU7XDNRsw74KRlsI/BERlTGNzeP/A2anDTf2uYAM4UA==
X-Received: by 2002:a62:864b:0:b029:3c7:7197:59fc with SMTP id x72-20020a62864b0000b02903c7719759fcmr28120433pfd.59.1628651556775;
        Tue, 10 Aug 2021 20:12:36 -0700 (PDT)
Received: from localhost.localdomain ([45.135.186.103])
        by smtp.gmail.com with ESMTPSA id q21sm28800989pgk.71.2021.08.10.20.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 20:12:36 -0700 (PDT)
From: Tuo Li <islituo@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@oracle.com,
	will+git@drnd.me,
	romain.perier@gmail.com,
	yashsri421@gmail.com,
	apais@linux.microsoft.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	Tuo Li <islituo@gmail.com>,
	TOTE Robot <oslab@tsinghua.edu.cn>
Subject: [PATCH] staging: rtl8192e: rtl_core: Fix possible null-pointer dereference in _rtl92e_pci_disconnect()
Date: Tue, 10 Aug 2021 20:11:35 -0700
Message-Id: <20210811031135.4110-1-islituo@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable dev is checked in:
  if (dev)

This indicates that it can be NULL. If so, a null-pointer dereference will 
occur:
  priv = rtllib_priv(dev);

However, the value of priv is not used in the remaining part of this 
function. Thus the else-branch can be removed to fix this posible 
null-pointer dereference.

Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
Signed-off-by: Tuo Li <islituo@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index e85d9c2cdc96..0eb37a95b519 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -2557,8 +2557,6 @@ static void _rtl92e_pci_disconnect(struct pci_dev *pdev)
 			release_mem_region(pci_resource_start(pdev, 1),
 					pci_resource_len(pdev, 1));
 		}
-	} else {
-		priv = rtllib_priv(dev);
 	}
 
 	pci_disable_device(pdev);
-- 
2.25.1

