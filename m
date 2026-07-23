Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1AA456E1E
	for <linux-staging@lists.linux.dev>; Thu, 23 Jul 2026 16:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784823549; cv=none; b=uJYGXzFbelqKGmaTcZUwKMFeeJyo6+GamWEp0O8TwtqidN/KYUQXZD8hKt41EULjkhiSOXbk04u6xhFb/2ccObyfrMJNq8tTG9JxqRLwiG6xJo3x0CGbW4y/iP9PB2kyQnns/J3nl14nOzU1HTfqDg4cmDZ7cw8nwLss50L3C34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784823549; c=relaxed/simple;
	bh=m10Tp///bVXlhJUeS/SvBawigHaYWgIpfVXkHjjJJpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sYI345QPbPl/xOI+jEbwVKVU32Ezm5Qin6ZkKJR0bP5YXD0cFJdUhYFpHLqwplIlAasQaEdGGzEshFXcyWDgySGSBGdIlqY2EiZcg3VJuQfNrqxPI14AANukCmT9dw9SB02iCtPSSnc9jhYUAdXO+L8Y29XsOU9u6Io7ftftzsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dc.uba.ar; spf=pass smtp.mailfrom=dc.uba.ar; dkim=pass (2048-bit key) header.d=dc.uba.ar header.i=@dc.uba.ar header.b=WE/NGyc1; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dc.uba.ar
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dc.uba.ar
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dc.uba.ar header.i=@dc.uba.ar header.b="WE/NGyc1"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5c2c46a428eso500589e0c.2
        for <linux-staging@lists.linux.dev>; Thu, 23 Jul 2026 09:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dc.uba.ar; s=googledc; t=1784823531; x=1785428331; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zxIAIolpKE8AXCFqXAOw27ED1oOQb15jrnDW7oEkheA=;
        b=WE/NGyc12gwQpZ49D1S+vj/5H9VNst0lmofeaKVPoJ91f5bilBFSJibMS5F6pK060B
         m9tkrVw72xotfMkyE+a8MSJOfsTFd0Z4CNzlLi4O20ydcO6kSP7MGZNDnsWFJ5elKNMX
         fYDl/CqMWgf+m7OewnhOsKzL62KYXr5UjuY6plcASwodtzfHGxuCg2dCrhd+tj+vJVqN
         1qFXUEqkGri7qn2l8T7sllKh/WM6DQEbs4RcqflM1lWPDUwkR7PX8rr19Gxu+sLUup6+
         QhYgkL9VomSx1LZwQ9m0B4JGJaGZuFTA3gEyF7t+rYFYhYBcIllOA5B3kdopQwj6/6Qb
         mgyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784823531; x=1785428331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zxIAIolpKE8AXCFqXAOw27ED1oOQb15jrnDW7oEkheA=;
        b=A0z4k77Ejwo5N+XwIGOWomDv4wepHQcSNs5UcpWQsLsNsCdNpZU+ij37JWV3iyQP1o
         x2VqSzeTVrkzaig3ZMEGPU2XFGdCC7gMYGbhN38KVA4Sk9QhDQLHJv/2afGhcOH1UW45
         lVXwRe63npdgYa4TOawYFv4lL5KM4XMRscHeidScf73E4bweolmDYHTCqnrDdspweukc
         /bryhyQzDcRxvFjVD/e8B+Q8DqDHuYUZGAfeYEy/ngQtU7VV5IDbQ6651rRnso8W+PTG
         849KpZ/rjgbn1NWY6AIwm4SBLmz2GvVObJDf6PeQy2fEjFqo6F3WkEl03uL4u/qT7lXq
         ONjA==
X-Forwarded-Encrypted: i=1; AHgh+RrtvSve5Is07sMh+74v09+j6CaYX5mYqZJ3IdPNJqP3nlB229rgUWRgbjLL+A8m3AvQiK3ek5ElMQaUs7RN@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5lhl0B0ZvZXQsD0ErfdX6ZTXiOaO3SESpMrbz7xZM93c096el
	me//4Vwop4XF+Ak53IdFbfTL/hQlnbG9pCoPip5L+nTbvyQKnMi7mkNbr2E6WMHH06Q=
X-Gm-Gg: AR+sD10uCKyRMeDbqa1vTyS3kT6NTrwBrOnsvMD1hMr+RAtoZLJxw8+5e+rci2GPm1v
	a30uyPcogNL98FT67MphFCEd+0gpYkNCyaxaAKjnCdJRaJnzBdkZrZ5byo4srphr2PwFs3yBNUg
	vq2R0+bDC9VKo7zInEr/p7Zjfv9AN6Z6qwY3HjygGZX6xcvdcWOihZ3FmO9XBivRzZnJfTpquE1
	eqZT07rEi4ODBjND8uJw5yssUaGJEbg2AnDK6/7aOYCJ3sWNkiCJZJAypktbb7Zh1HedEQc3VM3
	Q2stEI/ih7UvDolIKx1QjSvGkfk7GrRzFobircJvyu0ImeZU9PF9EzZr35TCoB3YEI/gc3H2EUg
	s0wKD1bzOzb+RglPmcbtzLe+2VcRWARkx5taIiaVRtqRoGvU5QJ4ugx0FEdpqOPXiuhu1vSFW7l
	BHrOFVuuMCGtlQ1/+4yHGaJcHyW9CpMalizYLiHgVpHeocx/Q=
X-Received: by 2002:a05:6122:6e13:b0:5c2:b8a4:95c9 with SMTP id 71dfb90a1353d-5c2da17b31dmr1841068e0c.11.1784823530922;
        Thu, 23 Jul 2026 09:18:50 -0700 (PDT)
Received: from juli-ThinkPad-T460.intranet.unl (fweduroam249.unl.edu.ar. [190.122.249.184])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c2c6275db6sm6659453e0c.3.2026.07.23.09.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 09:18:50 -0700 (PDT)
From: Julieta Goria <jgoria@dc.uba.ar>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com,
	Julieta Goria <jgoria@dc.uba.ar>
Subject: [PATCH] staging: media: atomisp: align * on comment
Date: Thu, 23 Jul 2026 13:18:12 -0300
Message-ID: <20260723161814.115168-1-jgoria@dc.uba.ar>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fixed the following checkpatch warning:
WARNING: Block comments should align the * on each line
in staging/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2.host.c:80:

Signed-off-by: Julieta Goria <jgoria@dc.uba.ar>

---

Hey, this is my first patch contribution, I would appreciate any feedback. Thanks!
---
 .../atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2.host.c     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2.host.c
index 177487b6b237..28fe34f2a848 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2.host.c
@@ -77,9 +77,9 @@ void ia_css_ctc2_vmem_encode(struct ia_css_isp_ctc2_vmem_params *to,
 
 	(void)size;
 	/*
-	*  Calculation of slopes of lines interconnecting
-	*  0.0 -> y_x1 -> y_x2 -> y _x3 -> y_x4 -> 1.0
-	*/
+	 *  Calculation of slopes of lines interconnecting
+	 *  0.0 -> y_x1 -> y_x2 -> y _x3 -> y_x4 -> 1.0
+	 */
 	dydx0 = ctc2_slope(from->y_y1, from->y_y0,
 			   from->y_x1, 0);
 	dydx1 = ctc2_slope(from->y_y2, from->y_y1,
-- 
2.54.0

