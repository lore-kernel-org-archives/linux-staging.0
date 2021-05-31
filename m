Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6429E2FBF
	for <linux-staging@lists.linux.dev>; Mon, 31 May 2021 17:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622482988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=K8nNOkX4zuqczQHURLREmFQOVbuEo/yfo6wOnioYIqU=;
	b=JcNY20K58fO+OTVMxLzSy6Xq+Y1w+n0RMrxxBM+RDz9OxwbZ/El/htibNbuHmuupP3Mwss
	1pQzwVz/jOF7TvXg0YNPLc3RStoLgKChrvNiKQzzPpLaf6o8HzhWi1AFYYD3ZEd+fKkMi7
	WZYlzOPF2XwcVv8yHk8F26zq5Sh+U+I=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-4C8-wZC7NeW7esoJmL7jVg-1; Mon, 31 May 2021 13:43:06 -0400
X-MC-Unique: 4C8-wZC7NeW7esoJmL7jVg-1
Received: by mail-oi1-f198.google.com with SMTP id a24-20020a0568080998b02901ee3e06e6a6so5609269oic.6
        for <linux-staging@lists.linux.dev>; Mon, 31 May 2021 10:43:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K8nNOkX4zuqczQHURLREmFQOVbuEo/yfo6wOnioYIqU=;
        b=HqHCD4R6up1N0HRTNUqVmAErTnlvMmWcnjzFHlc7WFfBnIDhXg5+Q6HIafxopRPWwz
         Lus3ryOkrTiVCWMMKP91hHD7dxl2S3HxOUVOCjX7Q1ucU71mJq8EvXTNWq3wcoP6cvPp
         JcSonEubeBOLXFWK5jAcyTWR8wj5mW9f9MMQ0BrxBRQYCBu6SY1IsMjZMpted0ut7PUY
         BBJdYjfF18PWTbIgd1BUOCHZmiGN9Zt+m6CnnC7yD0FM9w/DNpvzgmXP/bBL89QCC+v4
         35jSH5bkFfEOV4xy6ufEeEKwRi70J1bDhHHyJBNzY9MFHi5T01A+OQ1H4CmQHxwS8w34
         9swQ==
X-Gm-Message-State: AOAM5310oNkGVKMwvCCh1DsOH9x0QCm8Sdv5FYm0rd1i2RZvlcnCqMxm
	sbxXlUcx14bcdlxiduzaov6zbwNjQXju5HUzuRQrBW9o1SLjnhuVRdm8xmFuAHOzhE2cy0msZWG
	jaVGuCawN4Xi0MUNf2XukHVCqDA==
X-Received: by 2002:a05:6830:1d64:: with SMTP id l4mr17260148oti.95.1622482985552;
        Mon, 31 May 2021 10:43:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylhACZOWlRSSP56Xe+/shqCqK0nGlc+aQdIrngGYo9DVADhn8bqhxQrwJTGkiF1rvA1tn1sA==
X-Received: by 2002:a05:6830:1d64:: with SMTP id l4mr17260135oti.95.1622482985395;
        Mon, 31 May 2021 10:43:05 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id i4sm2943902oih.13.2021.05.31.10.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 10:43:05 -0700 (PDT)
From: trix@redhat.com
To: rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com,
	slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] media: imx: imx7_mipi_csis: convert some switch cases to the default
Date: Mon, 31 May 2021 10:43:00 -0700
Message-Id: <20210531174300.2594109-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Tom Rix <trix@redhat.com>

Static analysis reports this false positive
imx7-mipi-csis.c:1027:2: warning: 4th function call argument is
  an uninitialized value

The variable 'align' is falsely reported as uninitialized.
Even though all the cases are covered in the
	switch (csis_fmt->width % 8) {

Because there is no default case, it is reported as uninialized.

Improve the switch by converting the most numerous set of cases
to the default and silence the false positive.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index d573f3475d28..330f283030ec 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -1016,10 +1016,8 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
 	case 6:
 		align = 2;
 		break;
-	case 1:
-	case 3:
-	case 5:
-	case 7:
+	default:
+		/* 1, 3, 5, 7 */
 		align = 3;
 		break;
 	}
-- 
2.26.3

