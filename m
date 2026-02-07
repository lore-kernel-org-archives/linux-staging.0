Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB6533D4FA
	for <linux-staging@lists.linux.dev>; Sat,  7 Feb 2026 22:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770501926; cv=none; b=HOuuO5xn9LsMAJS2WUYaldUNqpQaFtBwThGLqxBGy/Ll6YN4Yd8mE/Z5fdEoO8Kr110j3iHk9p+0OcNmDAI3z1z/JcDUV6MPrfqMwGwWfOmLgnwDCXBC2wDncA6rbbNRMRcSsB50dWUD5w+8U/bMm8K1fnfVatRvm+aZM2eEAcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770501926; c=relaxed/simple;
	bh=8H2Ql6oifHkT4CjsqLdLoTTkCv7GeOjtLl6+VhEXK3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n+PnzyZ6s4fmz5cQnPRfpgSZ+znfIq8Fom4oQ3MjyMLMy9AMV5x2S2i2zFBcNU56ODmxmcBMLvwwCMPLuwM5Dkr0W4E/DUWXZCPjnRkfdOOErl8/JjvMKIMRn9kh+RXPb4qtxWatp9AssTR+hTg5XkOtNvzG5DB4gQFALVgvkVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PV3X4TRO; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PV3X4TRO"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b8842e5a2a1so503971666b.2
        for <linux-staging@lists.linux.dev>; Sat, 07 Feb 2026 14:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770501924; x=1771106724; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CkQTUcevqbbom2GaQZHgQn6sBJw6oM5+vBUm2+nyG+U=;
        b=PV3X4TROikwG0AtCc5LlnTrD+0JgeDyJL7lnef6qTTLfuRdoGLQMe940za1W/L4K9G
         x1vOdNMjsVSK4jVNFdo6UqXNdIi89XHmEBx71HJi3pNbwEpiwhMlA4e9yVWpR9/vPNdz
         R0oq2+oUgmYfqaYxGCjNMuNVZSkAM63bu1Epc+vnzoteLwVxVKvbTh9H9xQIB4Aq5EwD
         Tiz4SSIN/AlvSHE+B5LwdrmFB6NTlgOY7wrqr2/41csagw8lwOrQhWVmogONlriERqM6
         0tXkQ9lAj3EXnatyPOxhjZyAUSvrm8qw/KEn7Sr5Nj/4m9FFp5ZQKteqOxAVqQ687hq5
         HIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770501924; x=1771106724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkQTUcevqbbom2GaQZHgQn6sBJw6oM5+vBUm2+nyG+U=;
        b=Um4hIPVGSMX3N/00CwmeokfC0Sf4DKfFQN5a4R9v32s5loqTRxM0BmlAyIUMcGKx9Y
         i11SoZBlKXM0pt1iyRcB+F/aqnfH/UkyHxuXVUX1zCprd4rbjs2hF5kV2pIJy6hQIm4u
         P3v1dvM09jz4ysq1kLlMTKlr/RLSPz0fbV8iKWS4WFucVxFDrJC42S8Cgt8J45ZTfoKg
         AT2ARhZaCDRbMIM5/p00swhE3ycD30eoMdykaOavBFpmnNqkf87Mf0T1yfyoGlu0EWIb
         yiEDtBbN5ynlwIbyA1k8GZjklFkFDv0oG3YZC+yKYcDpS5WV+Sf5THfeXPvkE1i0SFp/
         /+kA==
X-Forwarded-Encrypted: i=1; AJvYcCVq8a2Q/TmSe/IgcMOKaMh3OhR0jkUx0rvps60PFe3oiMTSbsnGhuTc7RSD+zrOY5oryWD5oG5AmpGydgNm@lists.linux.dev
X-Gm-Message-State: AOJu0YwNqSrTJ7letzOtTtjNi0croZ98woEvhIF1DfvFzeDJtiGfDbxx
	eXdWKcT+xAxbE9jx9o2NZOArOuCXaXnosL5FR9ofPCKBG3JSk8+2awd4
X-Gm-Gg: AZuq6aLL2nsySMHuQYqGmiEkT9sVIoF2qqDd3eyrSq66qc1SNHnrB95rGJ5rnd/zUDH
	0kwNUGzpRZ4OxLioZFOkmRlP/X1Wb/7zHggqA9YOTEafRw008XS2xlhZlGy8dPEwcBBFq4a15vm
	m4mFSfPum+XZqZnFOvdiTwFWe6xXne5kPuk5MCYEEz8LxcCd30w4GLdlKPwPbJqOsFnB7LfrARx
	v4DSKencUmJdErKXC3dQ0iT9aE4Xu9oH0tHbp0OOGA5c0D8zAn4KK7CvVytRwjwOzQ/ivEJoWJl
	BW1m7WTmuKIzJsdghtNmNSGK7/iGMKvDN7RJl5nh3AIEE7uaSWW+VDkofOqrEtTtpu0qEB2Hclw
	qSn1HzXb6osnWbMQQaEzYyu4J2RvBccGCkZoKSms9f6xGHJYJKNwrVUIg2nJjHrE10bX0KLh3CR
	mjerirFakR7oio+v8FSFGsc5gbncsEB1J+YlXrtsHnhd7/YCqLLdLZ2UBlQA2tgQdVIVW96lOQ/
	kZ8sFE2W28w+vYEoO1c3LjudYc6/Zucl2jhy1eNkBLPBXd2gYL4pQyg
X-Received: by 2002:a17:907:802:b0:b87:1590:d528 with SMTP id a640c23a62f3a-b8edf2fe560mr403194166b.40.1770501924363;
        Sat, 07 Feb 2026 14:05:24 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-a.c.od237066db22328bb-tp.internal (99.86.90.34.bc.googleusercontent.com. [34.90.86.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7a46ffsm222487666b.17.2026.02.07.14.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 14:05:23 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH] staging: fbtft: fix unchecked write return value in fb_agm1264k-fl
Date: Sat,  7 Feb 2026 22:05:23 +0000
Message-ID: <20260207220523.3816-1-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The second call to par->fbtftops.write() does not capture the return
value, so the subsequent error check tests a stale value from the
first write call. Add the missing assignment so the error check
applies to the correct write operation.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/staging/fbtft/fb_agm1264k-fl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_agm1264k-fl.c b/drivers/staging/fbtft/fb_agm1264k-fl.c
index 207d57854..b4883c365 100644
--- a/drivers/staging/fbtft/fb_agm1264k-fl.c
+++ b/drivers/staging/fbtft/fb_agm1264k-fl.c
@@ -375,7 +375,7 @@ static int write_vmem(struct fbtft_par *par, size_t offset, size_t len)
 
 			/* write bitmap */
 			gpiod_set_value(par->RS, 1); /* RS->1 (data mode) */
-			par->fbtftops.write(par, buf, len);
+			ret = par->fbtftops.write(par, buf, len);
 			if (ret < 0)
 				dev_err(par->info->device,
 					"write failed and returned: %d\n",
-- 
2.43.0

