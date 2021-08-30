Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837683FC4
	for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 12:04:41 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id t15so15863764wrg.7
        for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 05:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rUNc+8qOd4ajvWM/OEIrPhkDwrj3YE9cjHuomOPXBzI=;
        b=Jl1FQY+A47xSiHaj7G3xaSJL18aYVCQ92/5uE8Q3JRT2BdzAhwdzORcJ42RBCJjwzl
         EZoN2cX7lgyhJXpS5ehXr1LjQywcApnRj9TJeb96DIyB2bcui6kjPG4BnVeM+c4PwNuh
         wH7CbkQ7S42GthuJjDYu63zmuZHEOdA2Vj8ZLFVWTVmuvz9baaO3dyhCiOKolHm37HQ3
         5ApNaT9XCrwZh92ibWawVAoykS06RdxNbaQZDiW1YCvuDd+i/zT7l5QzEw9WSYzPy4t7
         GA4MZ82uA1mJk8/Y+Z6fiaH5yGKNw0nfzPoO3JSe7nGBUmFLC1G3E72EVsmNnOaidMPS
         q18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rUNc+8qOd4ajvWM/OEIrPhkDwrj3YE9cjHuomOPXBzI=;
        b=CYo2wnrCHcvMP6MRs+eNo1X/AO6ulXQMamby5UQCQ04AG3hlZ41pgVrF6TojnKymc0
         CDEX+SaY/MH7zo+/4mGqtVq/+/Q2khJ8wKRjPwOx80JCS7CfgobVJqFz8Z7Z+ielMIj6
         5DhBCn4GvK11dPtwxNo+BFFOCTcEUgC1tO17fOqTjQnKlgq30S0PGg3/v07v3ElhkSJx
         hamKOhSaPWGneuHL2IAsOClMqb7Q9fols0MRo/bHy0B29XkN5CSrZPAohcIVM4qHLNjL
         QiMqdW/H804wmtFdxeSEd5/61f/0lU9Imf39iVggQ2jufxmNk1mZrBNfaGnUuGiQQH/p
         jKLw==
X-Gm-Message-State: AOAM531iILt7Vw/ThRmdpTtLTpSujgavddJMGDw1pbZg/PFD1Iyb4vPO
	93kmYivpX3EjPNLgXRcrQYJxBLRc6l9feg==
X-Google-Smtp-Source: ABdhPJzq99F73yML1/5yQEmXeGfvjZE072k3RGbgloIiWRNhpmlypnHbC58Dtg8hSoh8IS7zGd7o1A==
X-Received: by 2002:adf:dd4f:: with SMTP id u15mr25574914wrm.237.1630325080065;
        Mon, 30 Aug 2021 05:04:40 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::16fa])
        by smtp.gmail.com with ESMTPSA id f18sm13184195wmc.6.2021.08.30.05.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 05:04:39 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 7/8] staging: r8188eu: add missing blank line after declarations
Date: Mon, 30 Aug 2021 14:04:19 +0200
Message-Id: <20210830120420.5287-8-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210830120420.5287-1-straube.linux@gmail.com>
References: <20210830120420.5287-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a missing blank line after declarations in rtw_macaddr_cfg()
to clear a checkpatch warning.

WARNING: Missing a blank line after declarations

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ieee80211.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
index c37358be631f..f76c762ccd4b 100644
--- a/drivers/staging/r8188eu/core/rtw_ieee80211.c
+++ b/drivers/staging/r8188eu/core/rtw_ieee80211.c
@@ -1021,6 +1021,7 @@ u8 key_2char2num(u8 hch, u8 lch)
 void rtw_macaddr_cfg(u8 *mac_addr)
 {
 	u8 mac[ETH_ALEN];
+
 	if (!mac_addr)
 		return;
 
-- 
2.33.0

