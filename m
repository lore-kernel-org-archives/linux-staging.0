Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331A62FB2
	for <linux-staging@lists.linux.dev>; Mon, 27 Sep 2021 16:07:18 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id e15so79866400lfr.10
        for <linux-staging@lists.linux.dev>; Mon, 27 Sep 2021 09:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v9YOxOqMuLc+F4aMhx8ncDQgU6zkNv5ONWwIowAktM8=;
        b=RWT0ekWC6Htbox7mj156mc+NheV3X1pX0x9qGJixO+cSbXgIns8Dw5R4v58Yi+cqSu
         Qupkcx5O4cKbxf27/lxApjB30zDrdIQRGl1BtvEoU5Grv3CvBgJ88kaEbpJ7ZGp6pAbC
         KSwki9mj5VCUYCPKJAnBQLLjz8Qszx/q2+mlsN4pj4uNVjIQHjkglycau7IqrKMGq9Nm
         wFVTsoLEymRaBu1IEvLeEN312f+3OzsmSzHJUp038zS0tS6X4LMAf+dTmJUaZNBQGjLj
         ngC/t2qsegd1WEdwvlw4oAoz1Yk1IOljEVjYG4XLAHfDVnJWiLsrw63qCT+GwvDbFhqP
         gLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v9YOxOqMuLc+F4aMhx8ncDQgU6zkNv5ONWwIowAktM8=;
        b=2zkxSVeA08b+277juPwQMVF2Ms2Da74LAuNjM85ws0lW9H8YbOewx77xIwfiP1RluD
         hrOGCVfvhuOne2bR6ykQqrTyd37m/nyMB6neS1txu4SehoZlGJMLV9XpJ5n9YdVggQEv
         z2NdB5q2YxK2zkrr89l2M3FvIhbzver+1kXsLYOAuCoNSaGa9wKN/Zb8a8f5bDJoOooc
         orsWNylobz+LUBNU+T6a9713vMePuWBswHsKRMdRDAfLX2X/v1x7GA9D8VS6pUvcq1TS
         58MFyPp8ZSGwEv0+euJVCB9I33lHNx72sEOY6Wlcxh2bsJmosy9nJWtNHmU3qPt4Ts29
         XZdQ==
X-Gm-Message-State: AOAM533N0a/6T8Cp+ny8yveMobyMw6tQqbPsBdoEJvhZXhf5fk5McXrV
	+Z0P/fp+O2cd19RqjYZyy5UJyA==
X-Google-Smtp-Source: ABdhPJwxAjNDuvwVhi+Tgto7o7+YxSo10UaS6vYWk7TYy1pGVQleT8uzYvxo86nnBNeF1HQVD3Oprg==
X-Received: by 2002:a19:911d:: with SMTP id t29mr513356lfd.407.1632758836302;
        Mon, 27 Sep 2021 09:07:16 -0700 (PDT)
Received: from cobook.home (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id k20sm1639441lfe.271.2021.09.27.09.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 09:07:15 -0700 (PDT)
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee.jones@linaro.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH] staging: most: dim2: use if statements instead of ?: expressions
Date: Mon, 27 Sep 2021 19:06:49 +0300
Message-Id: <20210927160649.29209-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <YVHoXyULqXsWktMN@kroah.com>
References: <YVHoXyULqXsWktMN@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For better maintainability, replace conditional expressions with if
statements in the drivers' probe routine.

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/staging/most/dim2/dim2.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 9300040ec84c..e8b03fa90e80 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -732,7 +732,8 @@ static int dim2_probe(struct platform_device *pdev)
 	struct dim2_hdm *dev;
 	struct resource *res;
 	int ret, i;
-	u8 dev_fcnt, hal_ret;
+	u8 hal_ret;
+	u8 dev_fcnt = fcnt;
 	int irq;
 
 	enum { MLB_INT_IDX, AHB0_INT_IDX };
@@ -765,16 +766,16 @@ static int dim2_probe(struct platform_device *pdev)
 
 	of_id = of_match_node(dim2_of_match, pdev->dev.of_node);
 	pdata = of_id->data;
-	ret = pdata && pdata->enable ? pdata->enable(pdev) : 0;
-	if (ret)
-		return ret;
-
-	dev->disable_platform = pdata ? pdata->disable : NULL;
-
-	if (pdata && pdata->fcnt)
-		dev_fcnt = pdata->fcnt;
-	else
-		dev_fcnt = fcnt;
+	if (pdata) {
+		if (pdata->enable) {
+			ret = pdata->enable(pdev);
+			if (ret)
+				return ret;
+		}
+		dev->disable_platform = pdata->disable;
+		if (pdata->fcnt)
+			dev_fcnt = pdata->fcnt;
+	}
 
 	dev_info(&pdev->dev, "sync: num of frames per sub-buffer: %u\n",
 		 dev_fcnt);
-- 
2.30.2

