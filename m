Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20C419D092
	for <linux-staging@lists.linux.dev>; Sat,  4 Apr 2026 23:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775344995; cv=none; b=jL7PMZOWdJ7Te9VmcSldPz8QsifQV6jcRlFUn1iFf8MZ9p5/9AGiAhhHOmnAaGiyei3n+u2BtznlM3Nt+eAxeThK073ISSlWc0KrrFhhTQK+krLER9+XvlljcLvHrV9z1bbukB2TLMX+wMyfd8r6w6XlphjOYPh/tyQb8vmE3nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775344995; c=relaxed/simple;
	bh=aHr247WZgADKTKUzBygaaf2YQeBar4PSJ17AIEQoyVc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CyLOIdrvU4MQs93QmNFnbM/TQn/OC+4/pRneX1fapMSXR7vpYJf90W+pladUlR4xuQcvCuL+4E22Nic+v2oNrfEl5eVwSjQZwxJaxLlOQ2fIsX/OkOSOo4bFyrrqdScIJd9laN4fkSL8icwNfxSmI5uOcNGlBXd1UVGHdD1oZ8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0SYH3Kn; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0SYH3Kn"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56d857af2a3so1026156e0c.1
        for <linux-staging@lists.linux.dev>; Sat, 04 Apr 2026 16:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775344993; x=1775949793; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QhxQ4oVxg7wwJH0gj6MCRdyLZTtveOYtZsme5m0GCsY=;
        b=d0SYH3Kn6Nx9hM0nMl80hLAkHQpj92654dKK8DvWcOiJ9VARhihMT9IMw3LIQgfpzA
         RgFw4KP5mIkZkWeg/KP3wYDyqOIJEm3V+15ME3XMozhptHDAXA6igJSmYAz6wMosz5hi
         yJtpeZyINni0fLexPoYqD2hJ01O7EXIdjmGZeXOfQA+2CwVv+t2txhoDr5A7BquRQdSr
         jPxcHBy91o5e+vnA6HJkpU02HKB3rRsqI9Q+4gE1hPg3VQtob7f5rnw8mX9SgAdidDeO
         35F61kzMAoMge3Ys/AqIN5Co1NKjB2BVJmrAT1fCGYH4lq2qbTv7BQGv51bl8HbtLjWM
         jGAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775344993; x=1775949793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QhxQ4oVxg7wwJH0gj6MCRdyLZTtveOYtZsme5m0GCsY=;
        b=Ieu+7HXVGK7zR2QNr60nAn7MqCWqmA6aGy/wZL+DYdL8d1+wLr2gmqgCQynn67BMs9
         bQK0rvMSd02KodcR7KG7dh4u/XKROQ013CRXAQ9MNS0uBuJ5uqvLqvu8YsjSJqM0gABA
         2mEE1cCeY775mYrRw2eXsaoktYYT7I9LTqy9/bl/DOdE70hgABMYY++cOFz2I6mO3kzM
         PKi9PMjwF4R05hoIodLMPOPQoi95zG6yp7dqNHFEhCMJEdBDqr9vOxba7zMvlaUalfER
         0ON/ISbL1jmfuTkOE9i0MTE3pIsCcLM/4gGRwjT62HlEoc/v/fBmC+9DdGoVYeLHK80Z
         Ef7g==
X-Gm-Message-State: AOJu0YxVPSHSY3R+F7jVV78UD1uAMkRhzbq96ot2AUILuab7cU2Zh9qP
	PZRSVeYi0Nd4YJhsaKsxsXN9jMGKp5X2+WCN2hiQ+y/oqK8hu7t60UXb
X-Gm-Gg: AeBDieuIhuyDbH+ICD4lyrgW+JcoFrwkRZ6JHjOf6uyAWS8S+/S1Bej6T4csD50jh4y
	0/UGSnqfIgpg9dL3O83uNpKSqciN4/07cjNNGgpQP35lXZIdzsV/Q62HnxoeyIy/+vG/qWXythO
	6Hb9eKru4ehbIsK0A0msxhva0p++Pzq9yH8kVacc4YJgFs+p6xboBcdRzmqEp4115edi6qYiYIf
	S+ljH59bWkOhusJSWO3zxjqmS1rNdksFH5HYQrM/N2Zok9m+wGsGlRDt+AsQgAZSB+Q0tDT3ctF
	qF9IV/MunrJDXJRxO6/I75vDzgH+GqAIGSdjyn18I1IIVYwOyBlRM0dQwHeOGWcZloPWUxNZNCW
	8ewxOdrbauj/L3bnr6aepuWvxRawxkJevdc2eTn8tQzI7SgkdmbAragUl1Xw4ZPUyS5Sfc6ixjX
	PFeNgPCs93I8EoPawzuusFbWnpes+Tbf2FJFjCMgwP
X-Received: by 2002:a05:6122:1d15:b0:56b:a673:27bb with SMTP id 71dfb90a1353d-56dab90d4f7mr2447140e0c.8.1775344993509;
        Sat, 04 Apr 2026 16:23:13 -0700 (PDT)
Received: from localhost.localdomain ([102.244.98.15])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bae1117sm11228422e0c.7.2026.04.04.16.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 16:23:13 -0700 (PDT)
From: Delene Tchio Romuald <delenetchior1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Delene Tchio Romuald <delenetchior1@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] staging: greybus: fix size_t underflow in cap_get_ims_certificate()
Date: Sun,  5 Apr 2026 00:22:42 +0100
Message-ID: <20260404232242.68423-1-delenetchior1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In cap_get_ims_certificate(), the certificate size is computed as:

  *size = op->response->payload_size - sizeof(*response);

Both operands are size_t (unsigned), so if a malformed Greybus module
sends a response with payload_size smaller than sizeof(*response),
the subtraction wraps to a very large value. The subsequent memcpy()
then causes a heap buffer overflow.

Add a payload size validation before the subtraction to ensure the
response is large enough to contain the fixed-size response header.

Cc: stable@vger.kernel.org
Signed-off-by: Delene Tchio Romuald <delenetchior1@gmail.com>
---
 drivers/staging/greybus/authentication.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/greybus/authentication.c b/drivers/staging/greybus/authentication.c
index 97b9937bb..1c14ad184 100644
--- a/drivers/staging/greybus/authentication.c
+++ b/drivers/staging/greybus/authentication.c
@@ -132,6 +132,12 @@ static int cap_get_ims_certificate(struct gb_cap *cap, u32 class, u32 id,
 
 	response = op->response->payload;
 	*result = response->result_code;
+
+	if (op->response->payload_size < sizeof(*response)) {
+		ret = -EINVAL;
+		goto done;
+	}
+
 	*size = op->response->payload_size - sizeof(*response);
 	memcpy(certificate, response->certificate, *size);
 
-- 
2.43.0

