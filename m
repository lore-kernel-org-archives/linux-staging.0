Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BDE1A23BE
	for <linux-staging@lists.linux.dev>; Thu, 24 Apr 2025 16:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513219; cv=none; b=Mo2b3brVZMcue/dq3OFPppv+L1jqAYxcEx+ZYYGegJafzYnv79GWX8+ccWMZx47S2Q7T5M+cOCxhvm8mTMei3UD7XQA3hv2dkL9JtmaCUI5/H55qEiLu7Xwa1YRi1Vo0LUei8xwb/HAFjmTzYpXPeBZ1TjqUtm3buDmCteP3b9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513219; c=relaxed/simple;
	bh=DnRed+2MKUgAgSOFAHNxY55sUYcrnMx6/ynGP7lOLk4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fjLiWfEiLBj/dCqUG+f2wYRubpCVnx3acEtDLz2zOiuH6sWvRqqGrTWD5ZU4LJV6eTU8cyl5bBUVT0gDcSAZ6PP/U0XpcWMj28k3LjRKQdswepEtNhLYQ0v9aB2LrSGB+iWqFPnW53AQV9hufKlXNRcl3Qp4Bvk/RwE33OKjytg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JUiKTzPv; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUiKTzPv"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c30d9085aso955188f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 24 Apr 2025 09:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745513216; x=1746118016; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tX6BYTT8dOmFs+pdX/MFx3gTZUblYOPi9JW4PiTBaik=;
        b=JUiKTzPvt/sCnm2+XzJKLxZGwTa3tIOzxgZqg43JTI1lrlGteOlPZsc+e0XEMicxU5
         jV26neSHHbsKeh2K04ZaSpGPnSSBqh7lZ54EhmmPwPHk75dZeNTaAWA1nMANrcvndDjN
         uekhlu4jtDzLa58rhjNvFkfA3lc84F2VOV58UpkSNPYyrUiIYRHvO29nZn+rB2DjeKcP
         qVNFbP9E2d2la1d83XpSHPtQQuNdfJGhm+Wo8934p2rkKqSjr3Cv4OwKASFRjFeYLFat
         UAEqCETWjoqqs4pXOCGQCMRDpOCe6cC+XfjAkz5XuT1BnVErxl9obMijSdo1j+HIInfn
         IQsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513216; x=1746118016;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tX6BYTT8dOmFs+pdX/MFx3gTZUblYOPi9JW4PiTBaik=;
        b=hFs5iHtVUaHx42PywCCbBBKnVv/vAsL0yah9/omuYBTTsxRtHnyzub/t6963kFe9ya
         5laKS1l7gb8Z7Gx6p4BmSfgsKTPODhoRE7M3if4XGvKOs6XWNCg1Yj1SgCKlZg6rZ6am
         QImR/fXxK/IISSKicQggPAcVvne6OMDgR4dmuvIDDxNuFbyWDHTVwLFnnujqaccgAU4m
         ad9/C251iuFoGkGE7dMPx+XWL9p22HrpQm9WulWYBBBoDZGzNGJeAL8DumfJ8fZrCluU
         goLZeAJSKSOOdMrGgH/dn6yZ6Bm4hJ/QPaO7qlwXycypmscKEndzsb3yG9NJcvC+atMG
         7/2A==
X-Forwarded-Encrypted: i=1; AJvYcCUudFWa1Ag08iM3Hk8kv51NrvGk/gVn28i4B38U3QFyxbcZnil0ZHDZ+ip0LeM2PrPVcPcoFwRYiX3cHmSb@lists.linux.dev
X-Gm-Message-State: AOJu0Yw86TXROhBTCaBquHL14LgAYS9F5aq7ZU8wz78qL6fpQI0A0Q0c
	+OxNcD70/A1U89WOcJld2DC1L18OH2k/zO+kCpTBZkv/30gSEx2CyTuMH9z5FGE=
X-Gm-Gg: ASbGnctuZ2Kxvu3bcyr56iqilWzWByXBt2lclqm5c2i1bzQxebcMB/hObrCqraa1+s/
	QW+yYroidC6T5rVQ/dZ2w6urahkvedBaZzALVD+lEoWaces5RZgtSuXKYO658Bq9IviCNVlFaow
	J0oNIl5CtiKF9J+nHf62piD7tWVn8i3CtQPT5bmjAi2THgJS1JUh1H3m0sQq/yESwhVURBKMydU
	++FnhnQcNTs32cOlFwaBnXTWU9aJmm3hRnn6h4eb500EtOx+N7AuTp7t94Xwq+3e1bfjzM8mEdB
	ANRo+Z80c929MHkk9/pKrLUdIYR7mdqN7YDVBITywrVsOrSJjaTLxfcX5qUrExQ07BSy4OedFXp
	E2g8JBzVEENgiNq/EspfzJJ3Y
X-Google-Smtp-Source: AGHT+IGbtUZ1epAFM71uoldTFr4VYxXQceNxeQpoJpuw+knCHDf5n5FvydE+by/rlcAYTosCU00hYw==
X-Received: by 2002:a05:6000:184d:b0:39c:13fd:ea9c with SMTP id ffacd0b85a97d-3a072bb7529mr36617f8f.47.1745513215697;
        Thu, 24 Apr 2025 09:46:55 -0700 (PDT)
Received: from andreas-VirtualBox (089144201082.atnat0010.highway.a1.net. [89.144.201.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a807bsm2633243f8f.20.2025.04.24.09.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 09:46:54 -0700 (PDT)
Date: Thu, 24 Apr 2025 18:46:52 +0200
From: Andreas Kleinbichler <andi.kleinbichler@gmail.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] [Patch]: staging: greybus: camera: fix alignment should
 match open parentheses
Message-ID: <aApq_JPIBhnGqfiR@andreas-VirtualBox>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Correct the alignment of the parameters to match the open parenthesis.

Reported by checkpatch:

        CHECK: Alignment should match open parenthesis

Signed-off-by: Andreas Kleinbichler <andi.kleinbichler@gmail.com>
---
 drivers/staging/greybus/camera.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
index ec9fddfc0b14..a1b76df39a8f 100644
--- a/drivers/staging/greybus/camera.c
+++ b/drivers/staging/greybus/camera.c
@@ -263,9 +263,10 @@ static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
  * Validate the stream configuration response verifying padding is correctly
  * set and the returned number of streams is supported
  */
-static const int gb_camera_configure_streams_validate_response(struct gb_camera *gcam,
-		struct gb_camera_configure_streams_response *resp,
-		unsigned int nstreams)
+static const int gb_camera_configure_streams_validate_response
+	(struct gb_camera *gcam,
+	 struct gb_camera_configure_streams_response *resp,
+	 unsigned int nstreams)
 {
 	unsigned int i;
 
-- 
2.43.0

