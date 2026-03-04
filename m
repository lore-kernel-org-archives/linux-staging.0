Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A72B2110
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 09:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772617152; cv=none; b=lcF6JqZ4TPnSUnpp1GkJ/IMM3wVXiFwSqHJUggL/qkj8tAzBX1Ug+7mnadZBkD+oD6KeBQEgtJkkC0+sP/WrQZ1Z9DuFFVEN1FFCrASWeGw87vwJ/dkNMQ+JKbiiljAyLVxfuRTWdTdg1/I/ymkl5z6gR85yk7AwB9Ee9w/UZBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772617152; c=relaxed/simple;
	bh=evyLIuR2VctR/Yu/KfgkAyoz3VqqLa1hcx5Cx+bQe44=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HBBerjRjN863QDKTkeklAdODNXW2lsFEe2J2GOM+gNb1dIYXKAGTe7o6j4W7CNcNcasjdB3cYEbCjSTCnAL7Db1PwIZOYDjX3DVc7298u+u4qaq9ZuTDdA54d+xvelqqSWfDwwQbs5IGttMSAyiOQemhsgDH2ILVcs33xmu6Y7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHuhl6bb; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHuhl6bb"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c65c87f73e3so395367a12.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 01:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772617149; x=1773221949; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rN93ANA+HWtDdddG3XEUggwOUXjfX92/pIpoIVfilZ8=;
        b=FHuhl6bbAV6kngjVARMahV/Wmn4IJDZOuWIMNb4FrbP/poXqj6tCGfWjCrK6RS9uWG
         0ql5CGLIsDu20DgcYgO7F/pu7qAU6HyA17cCSxBrx4CEFXbBxZH/JB3ps+Y+KGNf3tuO
         /m+YEgd8pWrnz0y6RNwpcAp2Ml43K3uO8E9dqlH1T4j0VR7EA/rp46Ug7H9uOQ5IJTz+
         PbEjkS6Wq8KlWfzCqEBdNg58kMDQYB/C1HWtWNhjTJwF28XgU1KbdJOmoyFoL3JslevQ
         2RukeAXEZThw3XCGMLExM4yiuhgza24z8FIJee4d3V+U74eMOevvgtx87OHesressK1I
         eG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772617149; x=1773221949;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rN93ANA+HWtDdddG3XEUggwOUXjfX92/pIpoIVfilZ8=;
        b=ulzeE91Q0u5DGutfJvQsUMVPg4jQoveDxTokF2KVHXr+j31Mwg9Z0UJpmTAyXupJnS
         PdDo4CsbjBZBPnD3CC0AruG/oSOAWM7J5p1S/BoLBney+18RtIeca7hci/ZhUZOBa4n5
         Cp//BwRgGX3FmrtYpthKDdL5jvWTUCNy5Qsl+kSIwEAjUsJ2RHv2jBHRW693UPPq9wgH
         oXXTzisLUN4m5YOjcMrirLqjoN6z6oBy39McIK8uAVcuKMj9vJtTRx1tK+lhk2YPUjjL
         u9RZ5q2A9ySJI5ySze5BSDHnASKlafm4c0icQWqgo7AaZY8QPET8Xa7NDIw0rDoGZL+g
         f/IQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyUFJKfBY8TL3h8CcYkVi4yFc46UEbc8ObcN7kdLyhK0MmnF094ILDU0RT2qXWc62aTVL3pTPpICMWasWR@lists.linux.dev
X-Gm-Message-State: AOJu0Yy01xlnJcv8QqMhiqhG/SGgY04Il6Cb7FQJByuN5cnRCYllIOQF
	OKzUbwP0P9OJaDBnq7075ANJv6cWfmDg+eX0sE2yMXJM/jJFGZJqgVTY
X-Gm-Gg: ATEYQzwfnHfUfOT2RHnKM4YWeCWvdrvhDni6TsDaNcSckTrDTXeCZF5wirRlW4L3yu1
	0wGhYVQuQcXTjYVcSEHNBsALAW6nm6gbwyFMWhCbkrBxEko49JZ+M39Ra8MOmhS74PUkYVVPlQW
	TBqSNb5nS2guj5CuCxlwK4FBiSBYkrX65ho4/5ZOwcecf/KNBitlgCHfIOhLzlltmIAJLfrBDtu
	UE4vc7zpPdx7QG+pTkkLTtUAjsVpG0e8bWlIBLWfo8WcNiVhR2tFVGBdZ8S4sMATvzvG7TagMSt
	+OlhLB8CxwkLRJlcUCtewjfmjR4HHVoU60bJIWOLIPmUBY14QG4ADyVT3rTaNwB8vUkc9PQxohq
	ACgAxLs2b4CDHQGydgzf6KJYuKX2Tf7ACv3Iao2tTWM1UFkC+StD6khTUoKrwWAMn5unSHA9Gjm
	FINOR+5F3JXS2x3gP7B1g=
X-Received: by 2002:a05:6a20:12d1:b0:341:730a:ef54 with SMTP id adf61e73a8af0-3982dec6183mr1099807637.1.1772617149371;
        Wed, 04 Mar 2026 01:39:09 -0800 (PST)
Received: from marchy ([180.75.247.187])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a081a14sm17142736b3a.64.2026.03.04.01.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:39:08 -0800 (PST)
Date: Wed, 4 Mar 2026 17:39:05 +0800
From: Adam Azuddin <azuddinadam@gmail.com>
To: andy@kernel.org, gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: fbtft: Update RA8875 Kconfig help description
Message-ID: <aaf9uQOBzCwQuff4@marchy>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The current description is too brief. Update the description to
include the manufacturer (RAiO) and the supported resolution
(up to 800x480 pixels) to help users identify the correct driver.

Signed-off-by: Adam Azuddin <azuddinadam@gmail.com>
---
 drivers/staging/fbtft/Kconfig | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/Kconfig b/drivers/staging/fbtft/Kconfig
index 578412a2f379..92943564cb91 100644
--- a/drivers/staging/fbtft/Kconfig
+++ b/drivers/staging/fbtft/Kconfig
@@ -86,7 +86,11 @@ config FB_TFT_PCD8544
 config FB_TFT_RA8875
 	tristate "FB driver for the RA8875 LCD Controller"
 	help
-	  Generic Framebuffer support for RA8875
+	  This enables generic framebuffer support for the RAiO RA8875
+	  display controller. The controller is intended for medium size text/graphic
+	  mixed displays with a resolution of up to 800x480 pixels.
+
+	  Say Y if you have such a display that utilizes this controller.
 
 config FB_TFT_S6D02A1
 	tristate "FB driver for the S6D02A1 LCD Controller"
-- 
2.53.0

