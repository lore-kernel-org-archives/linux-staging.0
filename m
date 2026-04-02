Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C671DD0EF
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 05:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775106708; cv=none; b=oEScez1BEMm+LZAPxVVt6Nh5f+H9squcv5Bv+monxEiF7cUnKggWNFoWu3SX5cYl1nF1/Sw7MUGAdvD5M0UmCHY54E1BWEq8cH0ZzYL3nvHjrJm7vWxrZFIJ8YBZlqie9KQiUY8lYvjH8/zz9eidUPFcXgf/P+y0oEyyKEVctSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775106708; c=relaxed/simple;
	bh=8J9rakAYpJj5MoO6KT1kInwRd4vk+HscQO6uh3/AFW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WxyKIdGDtvlwmGI6UWhlGtbVOpY62DhGtZPreb5BWbASUO6PWUSgDFtbLaBxr2n/vz8YQymFqj1mskSjpZDw4D6b8eg1d27Weo0kDWu1r3eGo/bKC0delBtfC8hxq7+FKzqRmg1wpeiTNEjxW87BTuSBNZbfDWunM/nGknOYfho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LjxH+pkr; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LjxH+pkr"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35c2fe0d90fso244494a91.1
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 22:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775106706; x=1775711506; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qblWufffu4CarmNyKrjU8dBtzc7CIBINQdO/rvlz4/s=;
        b=LjxH+pkrKBe4qNTgsT56j3QebcdrCGkpel7z8TVnxLVwIePzjhuj2aBUe1XKnXKRxL
         r93w9uB3zSGpb49rT5LWpIWJrjgaayPAeBR8adzAhzpKbyBbpkO/W957cbi67d9DwOgi
         6wXJQCu9DQUSoQjUdONP5AAqIFy/QfN1Z0Ya+homMnqFEuQig/uRDqR0JGFvYOftsP1J
         wWSZu0ZIvh5PN7nUbYmf0XKcC6jd4ibma0DydY+eiao0Bz60P9tC8/QJpcfwr/LkioIv
         +MrKIrmcZK2GVBebbvzz699UtEkMKKI/SE+r3EbX9Kq9h7f5yIp2ztPgRboCFFYqiv6F
         EIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775106706; x=1775711506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qblWufffu4CarmNyKrjU8dBtzc7CIBINQdO/rvlz4/s=;
        b=qRhHUvPrdGxGQScjT5+d5+IglxHONp44kTVGSHrQk3dXKQCbq/FhuoIVQ8zrrQxTDZ
         qYH4f2AKXmO3+0BdHQsqgFi2LZkO5wbdtX7m0dUmdEfneMw5TLwGa8xsDMmaqEduKYoI
         nsBJxLYrojsr/tv866cCgtX6MH6Dqk14Rqn3azH5vxKG8TqQaIHhzIGTmpnpMs1kBW6G
         d9ktxdUcpExETXu6SVR4oxssOY3eOWUrWYN8vY3zar7YrRqPSawYbplUwtsSF6+6tKoG
         w5RsQ+b4UwiOQZty7t2T733MHbblDhplv/h5Ha21E4Pd5mZy2OAHBRnHFdASLLfeA9v1
         SgFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXx+ZaLtu/47xYv6pbHnPdB2KPsw3zjRYABMN5lmY+60AOc4XO7PpBAMfli+95LP7D2pyCBUHpP2b0V221P@lists.linux.dev
X-Gm-Message-State: AOJu0YzMrSDs3ay9zcqDxDQOJ+DY4dmgUzdnwSn+RcRYvOza35j2hYRz
	1OyAMFtuWIWAOZ0TriY1jjz5bEHZjNTWfmEfrToKX9660WWJb87A85pf
X-Gm-Gg: AeBDiesenmNL/W/c8qaSimJtfWkFVxY8dY/Lyj8l+kLU5pgGFoj491v0Vwmp1Fx1vqJ
	I8nI9e1p4R9nl1HRabIOYMRgkc+goRg/8OHG7sayO2AsZcYkEk6qjaw+4QWPFO0EETogu+P9r09
	zFk19rPu7mHDJkj1o1c6WTO63fvlWwuwSl+ksOxZ83o3+BWjQ0910SJvDRBmNfhKeNOUWE71SZd
	ejlevxMw0V30DIX2/yIxypkGy80kII1NnhnLzjtK0u0XI4jUDUgkZ6z70A7nR/6ZNqe/P67+gRa
	QfbqI5pUGpb60y4lRGYEcj0flrGDF8jlo81UXrgFy0pQbLz+M+ZGDGTiKlwBPCyDCJFXqNjs2dP
	MjSWmi/TA0IiLmbGKr8ZIlNw18JyW9dYMifoKCJbrilQpitolvUhg9Zn73rMKFUvDUpU/qmhFKc
	pwVnXLQ0Zwn9CaFN89rJ4HB8tK9LulILFGjsPSSQ2ATFlywazpg3BSa7WrqC86I+HNklhXL9eel
	KE=
X-Received: by 2002:a17:902:ce0a:b0:2ab:230d:2d96 with SMTP id d9443c01a7336-2b2758a1137mr18240395ad.11.1775106706479;
        Wed, 01 Apr 2026 22:11:46 -0700 (PDT)
Received: from koskos-Default-string.tail0f993c.ts.net ([2409:11:3cc0:3700:a459:5c89:eaa2:f305])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27472d54bsm14652405ad.1.2026.04.01.22.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:11:46 -0700 (PDT)
From: Kosugi Souta <k.souta0926@gmail.com>
To: gregkh@linuxfoundation.org,
	johan@kernel.org,
	elder@kernel.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	k.souta0926@gmail.com
Subject: [PATCH v2 1/2] staging: greybus: fix unsigned long long type warning
Date: Thu,  2 Apr 2026 14:11:23 +0900
Message-ID: <20260402051124.101197-2-k.souta0926@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402051124.101197-1-k.souta0926@gmail.com>
References: <2026033032-rethink-jogging-f3b0@gregkh>
 <20260402051124.101197-1-k.souta0926@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Kosugi Souta <k.souta0926@gmail.com>
---
 drivers/staging/greybus/Documentation/firmware/authenticate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/authenticate.c b/drivers/staging/greybus/Documentation/firmware/authenticate.c
index 3d2c6f88a138a..0ef88b7d24de0 100644
--- a/drivers/staging/greybus/Documentation/firmware/authenticate.c
+++ b/drivers/staging/greybus/Documentation/firmware/authenticate.c
@@ -58,7 +58,7 @@ int main(int argc, char *argv[])
 		goto close_fd;
 	}
 
-	printf("UID received: 0x%llx\n", *(unsigned long long int *)(uid.uid));
+	printf("UID received: 0x%llx\n", *(unsigned long long *)(uid.uid));
 
 	/* Get certificate */
 	printf("Get IMS certificate\n");
-- 
2.43.0

