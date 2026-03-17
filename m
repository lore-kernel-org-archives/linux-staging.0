Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C67E30FC1E
	for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 13:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773755231; cv=none; b=QtqzMoUQa09d7xjTcltZhsAXBOZhuGdV3XMi+e0geiGKoqh7P5g2Ksjs8tqY7ecRRpaFWHgSClliewWbeVVzQyYdMFSSc4g0e6rMkUxvxQ4yZIsMZ+Cj9g0hkGbzoNAoRdEdd9FhH8esCNMbXhVD3GIDV1j6Rm0exhxuxjAkEiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773755231; c=relaxed/simple;
	bh=/x9bu8KevwXQZUlu2VPi3Pigx2Icge0JmO4mg9haX+o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sO/w5JrfH2lIvVFhx9W5L90E6h8ZsyqJH2+cg0VCdh3fz5NMfx3u5xi2ry/M18BSS5KpdPIsFW4XENVpg1Fyu+Z+3/VrhxJFSwEJDKrRu0oFknlNahFU5+kRLZPsIaNYSd9/eJCA4Kt7OjD/1u7ptarUyHQENtaD9M444Ze2i2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jAwMv8Ax; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jAwMv8Ax"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c7393c6832bso2050859a12.2
        for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 06:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773755229; x=1774360029; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MK795KpPXyjO/YxzSnwJyz0MTRv/X9Db9MYpfOCj3BE=;
        b=jAwMv8AxsdFcewFx0MvBuihTb+GasnMTVryoBQooLZU393LG+BvWDFoyFITPeEpHDV
         0hzoBbb0yIxcpA9pKf8ZJAUcAl5EuvaQn8t8+PwA90pwdazgdZaliV+q7p/cBZ+ux7sN
         OUfSPmCNKoRxNVOfWJi2LRIPoho5CN4DW406vuQbf37W/Zlp12o5HGzhMkIOTPlEbcP0
         vtCMOg7ur2O6jNtPFP7jQmIAzTPUpu6jCYid2baH5CFC4GJZLOiti1rUW+7TiEQE5E3Y
         HuH22BuQLPGtmWs91fkSuXUk+RLQznv6dMRnTSBKkn7f4F72qFJfhN/cs9VQXHWqTcDJ
         uZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773755229; x=1774360029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MK795KpPXyjO/YxzSnwJyz0MTRv/X9Db9MYpfOCj3BE=;
        b=ljMtnNjeJRrOzFveQ6I/6F7EpXSN3CXhJBvuXq9zAunH/jOxwx9b1QiWymo+NaOle4
         e+lnINMkXhOt+egS5rXVPbg08NMa04Xu1dUoZhGkLett9G2MsiBuE5I5VN4xoY/Ur2dh
         5bmyFt5X+1Jg3Y3u1XjkfS905xWvVpB6vlE9L/4ekpfF07xzFjdCF8fcA4pMmiME8IiZ
         gvGiRS+MVzvUGn3JJ/1gMJ85IaJse7R7s4ytl3ku99IW11DldaySlyHsT6eyufZqfgVV
         IfXmJqxmZgeMAZZ9opmn4G5QqGxgq9pAQQjgl/WptInR1MmosnFkTpRuYeLPA8sJ+dS4
         tljA==
X-Forwarded-Encrypted: i=1; AJvYcCVXMxoeORq2KKotfTTE4/IqGx5kzvgRcFZxwXVfM1bpZzIwufuoy0TWCfNxYwACMPOH+GM/C3T75a5eJfj9@lists.linux.dev
X-Gm-Message-State: AOJu0Yyu/63BzU5QqoxvM0Syl71fS2x6SJwdJLyoDrcsEgTWYmSsTS9I
	d5thfpFptx9txrUC4MJn4+XGCyXss5Sbbx9Xo3O3kHoQcGTUWlsh2Wr+
X-Gm-Gg: ATEYQzwhtlIfw4quFH5n6EBRwwLOsbel+usTvGoz00Wi5htD8kviRmp2kypDkiAZwNw
	qR2Yw2lhNeI99k4Al1cFxGqxPsz8KNECkUO7BM5q9lxrNyeFN4tjrYpxW4q86vuAfmmRem1bQJJ
	4HQTohbWXLEdiSNfSJrOLSqlHalvpyRPewm49Nm8wLN/l29TEt9k7eIQJ8ML7sI+on4NxnJi1zf
	+rkeO2ydiTE8Z9A2AloKsJ85ybDpB/PDxDeGMcVX35NNuyk2LwExcfw9XXiLSaxqdwQDU30b86A
	f/WvdjMSp3iomSnM/CNyq7IpK9ahTODxUIkHs1mHZX23MGWvyJHFGznRxLLOxjVUms/f9vfBZQT
	k24jKa1rsyh6+XjjPDQDMAH9ZWdCXQz5SdrtP78hiMPpDzbCrT3qWvuxgJXk+9AyA7CwZ7PHegj
	WY1y1W/WIy5u9WUFiSqhG1m09Pj333EVH1JvoZzg==
X-Received: by 2002:a05:6a21:50a:b0:398:9f1d:8a03 with SMTP id adf61e73a8af0-398ecd9d561mr16769427637.61.1773755229144;
        Tue, 17 Mar 2026 06:47:09 -0700 (PDT)
Received: from padmashree.. ([2401:4900:91ee:4baa:27e8:65bd:dbc5:b65f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73eba9e183sm11898643a12.14.2026.03.17.06.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 06:47:08 -0700 (PDT)
From: Padmashree S S <padmashreess2006@gmail.com>
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	Frank.Li@nxp.com,
	mchehab@kernel.org,
	s.hauer@pengutronix.de
Cc: padmashreess2006@gmail.com,
	festevam@gmail.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] staging: media: imx: fixed a brace coding style issue
Date: Tue, 17 Mar 2026 19:14:47 +0530
Message-ID: <20260317134448.389123-1-padmashreess2006@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed a coding style issue.

Signed-off-by: Padmashree S S <padmashreess2006@gmail.com>
---
 drivers/staging/media/imx/imx-media-of.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-of.c b/drivers/staging/media/imx/imx-media-of.c
index bb28daa4d713..7413551052ae 100644
--- a/drivers/staging/media/imx/imx-media-of.c
+++ b/drivers/staging/media/imx/imx-media-of.c
@@ -57,9 +57,8 @@ int imx_media_add_of_subdevs(struct imx_media_dev *imxmd,
 		of_node_put(csi_np);
 		if (ret) {
 			/* unavailable or already added is not an error */
-			if (ret == -ENODEV || ret == -EEXIST) {
+			if (ret == -ENODEV || ret == -EEXIST)
 				continue;
-			}
 
 			/* other error, can't continue */
 			return ret;
-- 
2.43.0

