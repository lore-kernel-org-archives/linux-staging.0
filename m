Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1CDA53
	for <linux-staging@lists.linux.dev>; Sat, 26 Aug 2023 21:07:38 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-76df3d8fb4eso129256585a.1
        for <linux-staging@lists.linux.dev>; Sat, 26 Aug 2023 14:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693084057; x=1693688857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1cp+fyJaYel+OZ1knmXDOhGjnOwMl8kMcdgE1kpwYU=;
        b=HCmOC09D815V1tcwqb+w4bpZcBA1b94hJfGCLhMUPL+xDP8lrXvvcNLiiTny6vwo2H
         kS44rpgiUjwg3QQJati4v5gC4z+pXQ7jMlA1mLDicw+8uAX53X/hn3t4xO9cp4Kl0FHE
         OI4HHzjCJBCxmwMjwi7ZVUfwTD41ssl0dV+FZclJ70xPL6cSZk0gXx0S9E4rUe2CUsUH
         hK1V2glT60nQD+/CATM2Btf9EoIS40keflDYpv87EDTnSBbsqRJuvWDKmegsRvkXGNLN
         YS1V/aQbmJ+9MP1TwJs5ZEBl0COVjwpY3t8BZvODxDf5fLzTLa6QdPa4r2LKbTorPMMk
         OIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693084057; x=1693688857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D1cp+fyJaYel+OZ1knmXDOhGjnOwMl8kMcdgE1kpwYU=;
        b=fTAiALx0A4Pa7yXOdNFIZ5MmxVkgXpxLNZKBcanGRuPGCW8Q1AoAETbSzsxEnK+XX+
         mel8u9sI9x7heU5tPZXocwQlH6kQ3tbU3E6TsbA22yhxAVHpJ8E/n3CwN0aLmaWWy5iC
         N163mdH0iPrMaC9Pxke9+wo264cJCn836IwhoExUkMZmjEJW99zQV3YQ3LkXumpRIFCv
         nGQYkoYJe/IB3bLtNrjx5uZljX9prZd7BDvHUjgcPHlPrejlDOsJbH+rOxOH6DfUWEg8
         2pwlBk1iLjHDDca6Cb00rFLkzXMFCGcPWmep+YqsVVgNIj8u9sEgJTkIXA1SjWlD3DYs
         GU9w==
X-Gm-Message-State: AOJu0YyMnJveXVqO6rMZ/lI2DLRuKyBZhqDf9S9MWpsFLaoN00hBY1xO
	R1+i86sdawI4MKGGiOcS0kg=
X-Google-Smtp-Source: AGHT+IEihAsxISoI6EDC46JjVO+XeC9vekE/MKRlIyYzO3EV4hIi6JIWSXsW+MxaW2PqxvrZzv5taA==
X-Received: by 2002:a05:620a:bcc:b0:76c:a659:5ed8 with SMTP id s12-20020a05620a0bcc00b0076ca6595ed8mr26069932qki.10.1693084057017;
        Sat, 26 Aug 2023 14:07:37 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:82ea:8c7c:b784:3f92:988a])
        by smtp.gmail.com with ESMTPSA id w3-20020a0c8e43000000b0064f50e2c551sm1488377qvb.1.2023.08.26.14.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 14:07:36 -0700 (PDT)
From: Alexon Oliveira <alexondunkan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: martyn@welchs.me.uk,
	manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Alexon Oliveira <alexondunkan@gmail.com>
Subject: [PATCH 2/4] staging: vme_user: fix check lines not ending with '(' in vme_fake.c
Date: Sat, 26 Aug 2023 18:05:16 -0300
Message-ID: <9f3e2facdc4d5e612dc00830c2da0fb19c20f2c5.1693082101.git.alexondunkan@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1693082101.git.alexondunkan@gmail.com>
References: <cover.1693082101.git.alexondunkan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed all CHECK: Lines should not end with a '('
as reported by checkpatch to adhere to the Linux kernel
coding-style guidelines.

Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>
---
 drivers/staging/vme_user/vme_fake.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index a88d2c8a785b..dbaf050f88e5 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -403,8 +403,7 @@ static void fake_lm_check(struct fake_driver *bridge, unsigned long long addr,
 				if (((lm_base + (8 * i)) <= addr) &&
 				    ((lm_base + (8 * i) + 8) > addr)) {
 					if (bridge->lm_callback[i])
-						bridge->lm_callback[i](
-							bridge->lm_data[i]);
+						bridge->lm_callback[i](bridge->lm_data[i]);
 				}
 			}
 		}
-- 
2.41.0

