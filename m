Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCD87F7F4
	for <linux-staging@lists.linux.dev>; Sat, 17 Feb 2024 21:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708204422; cv=none; b=olKeAzdG7JadnNVq4uQyIte15+mGM7CO5wqo7JAhQbzRHgd/LpUBw1vnwdrF6XxS6v+vONX2r/qQlbGlVrbb/SHGFCCtyBPK1T1nOHxNadoY75u8Vf3NQK7+JFvusUiAG2KUfdwhmN1CPHGaxINEb3Oa1CFb24REl6ItHCad2J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708204422; c=relaxed/simple;
	bh=I3tCiGlk5ny85vI8kqZUsRbjY/tEETYNUbs6XI91XYw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u1s3VjPKXW9KjYOC9XhYpVleKbgtwZs0z2MhwqUQff2bqjb8OAdhN3QOOKFLtj2moPiQLrx+7cB8BRY1Wsrz79vxsmk5eKY2RxiFBPknyPIfkC6yQexPYZm6n1S0rdRjOmeOahN2UiAWLpZhfU1gqpt66YlKKglHwQl75LF2BHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGBpOtQf; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGBpOtQf"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-563cf3087cfso3015554a12.3
        for <linux-staging@lists.linux.dev>; Sat, 17 Feb 2024 13:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708204419; x=1708809219; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sMro+oCLHPLwncyYRlafFQVVFeqU1GH/O+kRfL0UaO4=;
        b=mGBpOtQf87vYGq6wApSqrQpjoSSOM93tBpKsCuoc/j+K3i9aO4zLyqM7R5cDfnX4/i
         DTnJ1D+OPwwoLUKxmHWEw8AuWBx9t/AXaOeWF4nh0fcPly/x5GiK0dEA98e5r1Sscenc
         ha+RUvs+GF5lbrfr1V1CN7eKJ6svgO61thN4onGN0IMdG6F77JUg/NeofGETbjfXLtBP
         CF1bT/ts4V8FjLZVYiLfCx11UCLk896NDU4EEuaKGqELQqoZj8KaNo/W3JA8Jbue7okb
         AeTul9IxLvjuUWFRmLFh2EOeq3IGwfY6GzGuOpZwmq43NfEs8fE6IuRFYf7sqeLBJkmW
         hGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708204419; x=1708809219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sMro+oCLHPLwncyYRlafFQVVFeqU1GH/O+kRfL0UaO4=;
        b=bJ8jj2tJQyfmwrnyVWte0iJ9c0Y62IKyW6Z5TvZ513vcCamZwABhB8TRcXMRvb0blc
         WRUROp3pwUpvn3WNOzT428Mz45B3AMInX2B7y3NvaU/suKzeGWS2IAW7RFklF+Atwgut
         G1/cFcedDEs2z/sW7RhVtBUfX0EG+0SLIjJg5vB1KNKdGzrqqFuhjp5Z3PqqsUt9fCtU
         J8D+EL24XsNcb3PzThj5+zjFjxW2eo+Zamz3HUuRMcwy530MrWtSzRzvte0W2cpl+foO
         +k8uKHQugSfhLx0Wu0LLxZPQ/BsuiVhQq5pPak/vJ9cCY2cTDTqSnzPEc0+RanhRi6lQ
         6p9Q==
X-Gm-Message-State: AOJu0YxJ63bofhgcRnyzb8+rmWwSA8QGhSsuGEAM/G01+wFrDZy6mKM7
	iy1hKOeAiyyBRuiAZWUnEjAnctvXX+hNPz+iyCDbB+WrHF7i2Eo3
X-Google-Smtp-Source: AGHT+IEoNBqCOK0k4SmqM3vYyOz2c2cDzzAfpxUu5xcR4QMvO5z2o0Wwr6bO/vQj3VwyKOQQ9qlk3Q==
X-Received: by 2002:a05:6402:b23:b0:561:347f:ec5e with SMTP id bo3-20020a0564020b2300b00561347fec5emr6143066edb.32.1708204419145;
        Sat, 17 Feb 2024 13:13:39 -0800 (PST)
Received: from pinguine.lan (ip-176-198-146-182.um43.pools.vodafone-ip.de. [176.198.146.182])
        by smtp.gmail.com with ESMTPSA id n3-20020a05640206c300b005644eca3befsm132087edy.85.2024.02.17.13.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 13:13:38 -0800 (PST)
From: "Moritz C. Weber" <mo.c.weber@gmail.com>
To: florian.fainelli@broadcom.com
Cc: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Moritz C. Weber" <mo.c.weber@gmail.com>
Subject: [PATCH v2 5/8] Staging: vc04_services: bcm2835-camera: fix brace code style check
Date: Sat, 17 Feb 2024 22:12:43 +0100
Message-Id: <20240217211246.28882-6-mo.c.weber@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240217211246.28882-1-mo.c.weber@gmail.com>
References: <20240217211246.28882-1-mo.c.weber@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reformat function parameters to fix checkpatch check:
Increase readability and consistency

Signed-off-by: Moritz C. Weber <mo.c.weber@gmail.com>
---
 .../staging/vc04_services/bcm2835-camera/bcm2835-camera.c    | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index e2d058732..b9745bb80 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -783,9 +783,8 @@ static int vidioc_overlay(struct file *file, void *f, unsigned int on)
 			ret = vchiq_mmal_port_connect_tunnel(dev->instance, src,
 							     NULL);
 		if (ret >= 0)
-			ret = vchiq_mmal_component_disable(
-					dev->instance,
-					dev->component[COMP_PREVIEW]);
+			ret = vchiq_mmal_component_disable(dev->instance,
+							   dev->component[COMP_PREVIEW]);
 
 		disable_camera(dev);
 		return ret;
-- 
2.30.2

