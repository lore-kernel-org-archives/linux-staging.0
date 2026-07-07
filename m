Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD9743E9C3
	for <linux-staging@lists.linux.dev>; Tue,  7 Jul 2026 18:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783448444; cv=none; b=g3APL4JUwNOqFdDeHuR3zDn+yZD6sBSJbp1IFGrYgVB+P2OdzJYgLReLcW8y05KYSkZEILXkbcmT88Iyx8h1uwbYNY7cH+GBSh4/ju0WPKj0rYBPDQQR29rD4F1Kg4DoC1mvEi72kgMQRTSZqUb4MwrCl9bNQNOAQNo7P5gA9Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783448444; c=relaxed/simple;
	bh=g1zAIWFmkUZwiUF0hcpaMNmvul4PNuWYv8tgelQ3dMU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ELS1zR4+XUNoba/CewWOU+eZXcii3MgpZTDlA79wIBrEG3PUuY45ezEv3OXh8zzCZ2a1QhQEs7oNGGBWjjcOo3TC8Pvh81ur+lffR1mebgT1CckqYJJUSlUWw6pa4q6ri50LLf0MdNCS6VFUHi4FtPT2zF3ezSwaZ9Vvq7uiI7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lhfTWu9/; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lhfTWu9/"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c12a1a3cdb9so460138366b.0
        for <linux-staging@lists.linux.dev>; Tue, 07 Jul 2026 11:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783448441; x=1784053241; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ks6w83Xyv70mgkQdf8zQvAzceeJ9Ijm1jp2O4nTcqwU=;
        b=lhfTWu9/2KmNwdsqVXWQA6JM35cWsq1dZiOetvYfX6eiG96QVC6RdJtTNSLRq9hZJ1
         tFWK8S3kMmTZWvux3MBhO0WaFOhrNKo3syFgHrEA7ESoIB1BeOOT4xN1Eq+1l5NUFYSB
         7f6s33Iw0ufENsoodEvRIjWuhocotDJSqKQfs6Xtvd86/Cxw7M4EnV+gNExfogY0w4Rs
         I03ZD7+hvFi2pXEoynV8Xd1wB2d871Y611Rs79NU26xsINOXTmcTsym10qniIxlyOXhR
         fxPg//TtCXUzNEBOftQvpqRG9YFooeMlkR/s4GqL+YRZrmzBmXktqlC2Vf6uPy/a5GtS
         dmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783448441; x=1784053241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ks6w83Xyv70mgkQdf8zQvAzceeJ9Ijm1jp2O4nTcqwU=;
        b=isnitrrbG2OGZxh2KyzVryjH33LIkIgTRQ4BfCHVJydPdIGpoQlCAKU7npsUGqJy4L
         ryXOyoqWPCC/aDeDOJ/XHyq0nCTPARUXYo/L/njUxAqVZjJhS6Qzh5/hx/InLzEzXw0F
         CXFRyenHTp3++VlvdT49xOeMoW+rnyOr2VRE6dMBoxYeMDi/KxbXmS3w/HndYh4vwDbj
         b6aWcrYhvdXRczFVZVylWbDJuiqe/46dykmr+lc2ZE8SjmrF9Rm5wzISEzBAVhkMB2QZ
         rELSyje9TjVmYRzbato9JAxP+nMw7x8DRLXycd1tZgG4etLGbXis0h8dB4olPqf1cdEG
         vUhw==
X-Forwarded-Encrypted: i=1; AHgh+RqL8/ht5RSQmQ8W70vOP/la51VXsTl9xne0TJ6gbfE42lxbAjDt/GT+7oT1gtUmN+dJKVsgwNEWuPrws1QE@lists.linux.dev
X-Gm-Message-State: AOJu0YzaqtCpKSOCWPr/P3Q3JlX894adkCXqKjlw2g7RAs/BfyQPg3/1
	4bu0+ewf1gPXskt+eOcv8zLvvIHoKWR4SIytos1FjPhdwfpLDMmwZY6s
X-Gm-Gg: AfdE7ckbwt1O9s1oXQUgSuBlFtt8m8lr0YILjiZ4K+DFD4/Ay+GNOTe3MCIplbRCubg
	Ioc1E95KJODdeD6qredHXLuZlO5mvz+t2pb119yCPIWJlf/LhwMNsBjOBaYewnES2oKswfbRnAN
	4Z3xYwapNt/vqeRh+tvLqZbYwd3mvugoLaTvW7fqrQ2LohQY4l79Fi7EkLTUWpeINxPm/23PQmJ
	cmdaxsPf/Dv/xO7XMbAKtFjj5q2NoU7gHsZ8wkddz3PgRal8kBXVm674QcEywqRZ10CPND5UXKA
	xkkGGobTGSuLX49cIF5Fy6L+BKCyxA/kzHAZcjCCg8muXpOMTWtunLOgTxSQs3QHVpJzfUZGtVW
	UW6wZwgpjCRVLZFWodQqu3h2MfzXcBM0QevrW9//FFiOwEvEQx9Pl+uRuh1W3ZvSA5Q645kja7J
	TxFJ1/PLpB3qpavTAIzFnCHHoBSHBZk/RUOoXM5MrA3AEXkK+Hkcm4EStnp6zDDXZkmL9poBCmj
	X5T
X-Received: by 2002:a17:906:584e:b0:c12:67b7:848f with SMTP id a640c23a62f3a-c15a696fa61mr264603266b.65.1783448441130;
        Tue, 07 Jul 2026 11:20:41 -0700 (PDT)
Received: from misharu.home (2a02-a463-a071-0-ee82-c956-8198-51c6.fixed6.kpn.net. [2a02:a463:a071:0:ee82:c956:8198:51c6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ada057dasm184028766b.50.2026.07.07.11.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 11:20:40 -0700 (PDT)
From: Hari Mishal <harimishal1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hari Mishal <harimishal1@gmail.com>
Subject: [PATCH] staging: axis-fifo: Align arguments to open parenthesis
Date: Tue,  7 Jul 2026 20:20:38 +0200
Message-ID: <20260707182038.37405-1-harimishal1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align the second argument of wait_event_interruptible() with the
open parenthesis to fix a checkpatch warning.

Signed-off-by: Hari Mishal <harimishal1@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 3aa2aa870ea9..1c34de020cf8 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -246,7 +246,8 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		mutex_lock(&fifo->write_lock);
 
 		ret = wait_event_interruptible(fifo->write_queue,
-			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
+					       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >=
+					       words_to_write);
 		if (ret)
 			goto end_unlock;
 	}
-- 
2.43.0

