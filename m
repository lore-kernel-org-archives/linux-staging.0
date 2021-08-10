Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C746D0D
	for <linux-staging@lists.linux.dev>; Tue, 10 Aug 2021 23:50:56 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id z9so277246wrh.10
        for <linux-staging@lists.linux.dev>; Tue, 10 Aug 2021 16:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fpBdLM1jjgCWmFdFG4PeoevZT0phpfn4uYGIZYMaDtU=;
        b=dPId21aa+NzITqtT02ztCNHXgTunSTuesgek5y7mZ+4QohkF0XVlrJhj2R7jU6GXUu
         7CrMI181xRQCtVr62rTkM/HIOxPR3Qas80FUYhxKP/8ulnOXYN1rr61qp5uJoiy6LLDb
         THUGOhRBPKafrNDJV1Zmz7Le3RaBSOhuvWxwmEnzdQ47LZ/jFlfenW/z5FrH5oRpj3mN
         eCdxX4aBLj5H1GXYgRKTXhUYdOZbhjy/dL//DY9zrufxRmOqBayjNu5ZFwSL+QH9PkhZ
         ZE1tqEYJS6CbG+pXhqw9FVw8beMuU1amW5GbYFI+3Z7Nw/EeWVCIGXC40uoaEODeoQrz
         38fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fpBdLM1jjgCWmFdFG4PeoevZT0phpfn4uYGIZYMaDtU=;
        b=mVJRx3FsCBYlsdNi3RHSc2H9+7+9LJAwRH95D+BSEwuG2VkWAtV9EIWZUXYhSSJEOL
         wVWbf/IqMMDFNGHpwSutZLZ2USXcqFd1sYfNb+M4N//zBLqWNYtNy4lQsLxBeAPzMdFx
         0TXhed/EmiS/yOYvwGfsINFbG9Pf18KY8qHVyK+XhDlj5ofsHBmzY+mScy4K6HCC3t8y
         im7bmvgqC8okEmlb4/YgyhPs3dooVw1K1jJt9NhVUYy2/2SVHcN6K4LveUoKzxKXxsMU
         07TAziswWR+demGba/TgY3rWyHOABLKwg58ROdKRIjUM74nFbSNEj6ebrr/e+UQzXbpn
         WKJg==
X-Gm-Message-State: AOAM5307lt929Twhulny/q3pD6OCN/AM724cT3Q+RsTjKM+9HlCyoEvN
	3Posmhy3N/qOmGE38yslXvK4vA==
X-Google-Smtp-Source: ABdhPJywP3kWWA2u+Px59SXSCD+LDZZ3cpzqiUoMoRG8kBZNiQXcJezLI2mVkzTsmGKTrVqd8N30Hg==
X-Received: by 2002:adf:f4cf:: with SMTP id h15mr15572164wrp.67.1628639455231;
        Tue, 10 Aug 2021 16:50:55 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id p14sm13881220wro.3.2021.08.10.16.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 16:50:54 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] staging: r8188eu: remove lines from Makefile that silence build warnings
Date: Wed, 11 Aug 2021 00:50:47 +0100
Message-Id: <20210810235047.177883-9-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210810235047.177883-1-phil@philpotter.co.uk>
References: <20210810235047.177883-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the several lines from the Makefile that append EXTRA_CFLAGS options
to silence build warnings about unused variables, unused functions and such
like. This will enable cleanup of missed warnings, and easier spotting
of future such problems.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/Makefile | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/r8188eu/Makefile b/drivers/staging/r8188eu/Makefile
index 152d6325b4d9..7f6658f931d1 100644
--- a/drivers/staging/r8188eu/Makefile
+++ b/drivers/staging/r8188eu/Makefile
@@ -2,15 +2,6 @@ SHELL := /bin/bash
 EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)
 EXTRA_CFLAGS += -O1
 
-EXTRA_CFLAGS += -Wno-unused-variable
-EXTRA_CFLAGS += -Wno-unused-value
-EXTRA_CFLAGS += -Wno-unused-label
-EXTRA_CFLAGS += -Wno-unused-parameter
-EXTRA_CFLAGS += -Wno-unused-function
-EXTRA_CFLAGS += -Wno-unused
-
-EXTRA_CFLAGS += -Wno-uninitialized
-
 ccflags-y += -D__CHECK_ENDIAN__
 
 CONFIG_R8188EU = m
-- 
2.31.1

