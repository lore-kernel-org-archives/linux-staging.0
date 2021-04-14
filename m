Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6258A6D36
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:12:04 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id d21so4716458edv.9
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w6SQ1ybYGNpR6i4fr50V/uxRLezTq7QfUcLspczsFwM=;
        b=BPh/W2h09sfAbzXDVjDliOibJ6rwIUqN0B5SFn3EJIdLmX9uqG61r+XJvhMBSOPU5s
         G8zFb8m4CYmpINkN7bCqrdMuACfx2YZ/75NhJLW8abHHj4xUyci8tRJgTs6YIlYBOzbr
         h8SADpWUxODr78OE8z0OhPklEPvO4CszUPcpGxgkc0EZ7L4pE1AZPd2QYvWASJeubV7V
         zFcd5GirlLTP2z4oEHd93p2ZeDqy+1QQG6MwGldW72yuj6nCi7krvbVaomyIx0XwcVW1
         pwldw8u0DFZMtQMYQVnzQRRWlOad0BGlCna7sDpQOyG8aoOlfGGH+AreVfYsjXOUnai3
         QBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w6SQ1ybYGNpR6i4fr50V/uxRLezTq7QfUcLspczsFwM=;
        b=ABI0XVTW1K99+wfNi6JvHEwq891+2bENNUUgzFv+IShXTO1Px945os/3oaLQIy5FKu
         lGzfX15Ikq1msCSffaQywAWbqZyjoEKhLWuxsqx3L78eNeTX2kXVTBIsZTP1WRDUV1qI
         x42elawUQXqlMt6TNpXN+quWg1CPXa674a55Exyw23XL/z+9gWesAHnuzU8YNQwCe0mC
         jpypRMeoEjSN+qhIX2+CnEuOTVJjG3zzkoLLJTazuSDetTPqhbDv6f0R9Wa4WJheFD5Q
         lAbchtQbmc0MFfx0gnoW01eBKJnNqdEQM1C19c43PpcVTl/yE3P0wsmc1IB4G+MeT5wE
         OIgA==
X-Gm-Message-State: AOAM533qeZ1qfBnUHvNL4RbyyzH0jWSNai+ctIok+7h59/ztQOIncwx1
	S4oeHVOVdg0n8rYQN7oPP8EQXA==
X-Google-Smtp-Source: ABdhPJygVibirgTJ1RiC2e4eJvM3HIYbtUFSnBlMnCCBZgdSfZVytcFRS5B/KEwIJ79Blm7CyncBqQ==
X-Received: by 2002:a05:6402:104c:: with SMTP id e12mr204936edu.108.1618423923032;
        Wed, 14 Apr 2021 11:12:03 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:12:02 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH 27/57] staging: vt6655: upc: Suppress set but not used warning in macro
Date: Wed, 14 Apr 2021 19:10:59 +0100
Message-Id: <20210414181129.1628598-28-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

The variable is used in the function using the macro.

Fixes the following W=1 kernel build warning(s):

 drivers/staging/vt6655/upc.h:45:16: warning: variable ‘byData’ set but not used [-Wunused-but-set-variable]

Cc: Forest Bond <forest@alittletooquiet.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/vt6655/upc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vt6655/upc.h b/drivers/staging/vt6655/upc.h
index e086ec6e77f73..8608693ae9c3e 100644
--- a/drivers/staging/vt6655/upc.h
+++ b/drivers/staging/vt6655/upc.h
@@ -42,7 +42,7 @@
 
 #define PCAvDelayByIO(uDelayUnit)				\
 do {								\
-	unsigned char byData;					\
+	unsigned char __maybe_unused byData;			\
 	unsigned long ii;					\
 								\
 	if (uDelayUnit <= 50) {					\
-- 
2.27.0

