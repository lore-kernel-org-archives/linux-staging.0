Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3FA45D1B5
	for <linux-staging@lists.linux.dev>; Thu, 23 Jul 2026 15:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784820328; cv=none; b=jPZnWDifvI73dfHY+r4sS3Wu6sa9+z8qJuh5bmscCVATGkU6QBQhFT+C0iTFeexbpn/yuguV0YIrJm1FpEYmtrW2aWJcKqkhWh79vLemf57fuo9Dk1lWFbdheQEoiWPW4UDqgwhmvUOlDTqDVRoytZvRagdQ3chGGqWaeQP2lbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784820328; c=relaxed/simple;
	bh=k053cqlIWB2E0/GJewREsJGQt/NhjXoCf+YJ9TrT8J0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UXxLtiVxQcBjwFBoxHlJy3KCdPYyHuJecHBVdM+Kgyc0io4F5Ik0okx9a3cP0hp79t/EwshOBKlfEjlJrlxDsSBsOIqlCtLjuebCa5nSHVrgtf6xxBxTcJ4pXTH3Ev6u9i97/cTVXl906GQPcUBuebHI6X7M4TUf9W2m8pKCIuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cMOrmCUW; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cMOrmCUW"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so8632195e9.2
        for <linux-staging@lists.linux.dev>; Thu, 23 Jul 2026 08:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784820324; x=1785425124; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TEjC/tOcu4DUpiopgBthHreWiCaj6q5yu2dDCSm3sQE=;
        b=cMOrmCUWCfYe/h5kK+Yqn+yVyRXZTwxhj1OjrOdsEOKwOPKkJX7rc5UlWeeYXMQTXg
         g+3IXLQkLriHAkTurCVy/xoEk77I4r078pOv6+oDlUb+yMF3Z6QMK+BEpeQoAFjgRyv5
         CCwhrz4tVZ+TLX6OJLH52pdqxIh8QUSJSFtoaxi6YtUGidCl8xaCrvjhfrBbpBA4YkVB
         ZJWlbOsceR56628/oKL8td8Br51Zh9CYBP8vCv8gcgn9I73wFn1Ix2dZ8WUoDxcvgDx0
         1blxTeVk29yHtZhEuEKpsAX7mMLxXn15PqHNiPLelW9ZnHQYjtDegfRlC2QJNXvjmy9d
         2sEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784820324; x=1785425124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TEjC/tOcu4DUpiopgBthHreWiCaj6q5yu2dDCSm3sQE=;
        b=qqsSSQyjmCfuNEqDE7uR4zi9eTbSR1v80QrC34+flALLhI7DMHWuto0nBzn4HkLQSP
         2YApOnP+BcJkDeOMojyBVbc8i68cFYiEj1ofd5D1VoLmN09U5lrD1wNLYwgy/1ZHMCcY
         RF/T9PmEbuhgEJWksJoiTB9mNPFYyOnhMPwtbsE7XYz3cmrCgYh6aJDoF/1ptxcUM8sP
         oTdbpcbtqGhQ1lwE6BfDzsq20kFHezbDPB4wGRyVfTXuQSaeEJXr5dFSqgINtadv5dBd
         xKaSvFDeEkhs4je3wkNvnrLRMe4EnNzjVZMcHB5HwJJKSulyEZTulYuj97UhMu0tuZyv
         O1cg==
X-Gm-Message-State: AOJu0YwyEHy/ItwTJXQ9u5L+FCItyZ/2Uyrhkx3FTlHlrwqtox1pK3B4
	j/iE9eMj7TDibVavVUiJCL5PDuvUK8rgfGQ7BzCWumFhUE36ByNGAfoj
X-Gm-Gg: AR+sD12RUKO51sZSQstynwvPqWYwAeNgGsw2fDVl84arvXNbdClU3fo/aUEpYuOwvK4
	PEUhDKWlZfh3GCtQBoSGpnXkgNjZONdf0iw7L3oKwJ51XaQmoTPir0mNm2Ggp9/zn9xhKb3drvi
	uT3qnXQf2FX3BjFrmwsLZy38s5kHXvSpF0Lsf3rg8WS5s1TQrNEbQ4c2XBa6kkzd1UpV5fAXlb2
	NEeTepHjTXrnTsdSTMnmz7WtbtotaWjTB8xUzkHgo6NBKGiRMzAK9/Kijlt4MgzyR1NAT2KQ21o
	bXkGHmAtxi67uz5cBh8oNGF3E8E/gljNA0+sE2fImUX0XdAscy3itFKzTsgQ+wTq0aeZ+dTJpHb
	8sdkxtFTWnjVa7j/p90nOOjuoP1JjnHTGc0z8LhUFhE7CV97EI6avZevGLmK07GMVRM5VsESWj7
	wbqgMBd3OwbeigBg==
X-Received: by 2002:a05:600c:1c18:b0:493:bb29:af40 with SMTP id 5b1f17b1804b1-49573cd1cddmr39778595e9.14.1784820323808;
        Thu, 23 Jul 2026 08:25:23 -0700 (PDT)
Received: from ubuntu ([103.196.162.15])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957af89be2sm1330355e9.12.2026.07.23.08.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:25:23 -0700 (PDT)
From: Faisal Mukhtar <mukhtarfaisal03@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>
Subject: [PATCH] staging: vme_user: Remove unnecessary parentheses
Date: Thu, 23 Jul 2026 20:24:17 +0500
Message-ID: <20260723152417.475323-1-mukhtarfaisal03@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix style problems found by checkpatch.pl,
which are the unneeded parentheses inside if
statements in vme.c.

Signed-off-by: Faisal Mukhtar <mukhtarfaisal03@gmail.com>
---
 drivers/staging/vme_user/vme.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index b5c66b66ce32..68b5c4613724 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -1210,9 +1210,9 @@ void vme_bus_error_handler(struct vme_bridge *bridge,
 	u32 aspace = vme_get_aspace(am);
 
 	list_for_each_entry(handler, &bridge->vme_error_handlers, list) {
-		if ((aspace == handler->aspace) &&
-		    (address >= handler->start) &&
-		    (address < handler->end)) {
+		if  (aspace == handler->aspace &&
+		     address >= handler->start &&
+		     address < handler->end) {
 			if (!handler->num_errors)
 				handler->first_error = address;
 			if (handler->num_errors != UINT_MAX)
@@ -1299,7 +1299,7 @@ int vme_irq_request(struct vme_dev *vdev, int level, int statid,
 		return -EINVAL;
 	}
 
-	if ((level < 1) || (level > 7)) {
+	if (level < 1 || level > 7) {
 		dev_err(bridge->parent, "Invalid interrupt level\n");
 		return -EINVAL;
 	}
@@ -1349,7 +1349,7 @@ void vme_irq_free(struct vme_dev *vdev, int level, int statid)
 		return;
 	}
 
-	if ((level < 1) || (level > 7)) {
+	if (level < 1 || level > 7) {
 		dev_err(bridge->parent, "Invalid interrupt level\n");
 		return;
 	}
@@ -1397,7 +1397,7 @@ int vme_irq_generate(struct vme_dev *vdev, int level, int statid)
 		return -EINVAL;
 	}
 
-	if ((level < 1) || (level > 7)) {
+	if (level < 1 || level > 7) {
 		dev_warn(bridge->parent, "Invalid interrupt level\n");
 		return -EINVAL;
 	}
-- 
2.53.0

