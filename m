Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C7FEC4
	for <linux-staging@lists.linux.dev>; Thu,  1 Dec 2022 05:38:57 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id q71so742011pgq.8
        for <linux-staging@lists.linux.dev>; Wed, 30 Nov 2022 21:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oregonstate-edu.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tzXcxEhY206rBEzs9pZWVugpUSKJxpd3SA2u/++FFEo=;
        b=nTBGN+TxqobVpNVk5u779lh6sCrYGmQUfTv23baPBaJBsfbFVn2yeMJdZ0OgMVb7cf
         KMq79c/+6kZB/HlT6g+mWoOFQNKAJLxeEbZavIbdNqOd8Zf1b/zTxMf797jvcAhMeaA2
         jfsW9tlfn/m/e5K+1nHHuotMBnA8ibMaEBiiEG6j6u5yuqPazkWLsveIEA3D5r3JAaTj
         T+UZNnfYC6LFPg7nYQvRfeEPvt0Nq1AwI86JWuK2CzMllD/4UqDVsfrk9kMLhe/hf68x
         btbClZmceoUpj1y7TXDYCqMYRE7CkbFQFg5v5T7mdMStAQVPexmBttElEZJChqmxaLBw
         5KNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tzXcxEhY206rBEzs9pZWVugpUSKJxpd3SA2u/++FFEo=;
        b=D7jW0gfIAv7s6zjgs4VcRTgT8i8E+RwOVGKQEFi3cYj3vIrOED8dtwXHwqUOEcMYwM
         h61DKVIQKVUxKSRAZY0hY550MS1WhNuEVt4eWtjxWuLt1tJpN5RwvqFrOy9KuOuZT4bL
         EQbX34D9W1MSryAp+kst+5bzCVnofZbi3c52Ss3ZRgswP5/nQd1BE6xEv9t9PeAxCHz0
         z0gBXyMfVHVVzUGlQANO52CgUneUP7eFwRjvLVT7w/hZvOZjNd72oNhz3ulnNKAoBCKE
         zro9jOQphHin0/ZNLwb/omBaTPd5Ob3JjVL3WgVkv+bIfws+0wZyNu5blZiBx9Rey8dv
         HxpA==
X-Gm-Message-State: ANoB5pkcYKEzOLjItNjZfSwmgAmMW1n7IR2qgb6Qky5EMlt/0UwLku/+
	pxLhqHKsxRik5WKP0u8KCYhxTQ==
X-Google-Smtp-Source: AA0mqf5wrrGDIjuBXPbh2ixyzd37b5q+71oNaWfElX1EHUxAIGdrdZnxc5DJjW/ALu85TqfqVWbyUw==
X-Received: by 2002:a63:2043:0:b0:477:5e25:4ca8 with SMTP id r3-20020a632043000000b004775e254ca8mr42709541pgm.511.1669873137434;
        Wed, 30 Nov 2022 21:38:57 -0800 (PST)
Received: from ubu ([76.27.231.73])
        by smtp.gmail.com with ESMTPSA id q4-20020a170902dac400b00189651e5c26sm2514657plx.236.2022.11.30.21.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 21:38:57 -0800 (PST)
From: Jack Schofield <schofija@oregonstate.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Jack Schofield <schofija@oregonstate.edu>
Subject: [PATCH 2/3] staging: greybus: loopback_test: Remove void function return statement
Date: Wed, 30 Nov 2022 21:38:51 -0800
Message-Id: <5d465d56a6e3de2cb9d2f34377cbb82678cc67b1.1669872193.git.schofija@oregonstate.edu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669872193.git.schofija@oregonstate.edu>
References: <cover.1669872193.git.schofija@oregonstate.edu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Void function return statement is not useful in this case. Issue
reported by checkpatch.

Signed-off-by: Jack Schofield <schofija@oregonstate.edu>
---
 drivers/staging/greybus/tools/loopback_test.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/greybus/tools/loopback_test.c b/drivers/staging/greybus/tools/loopback_test.c
index 242138c4f6cf..7c1697304ab4 100644
--- a/drivers/staging/greybus/tools/loopback_test.c
+++ b/drivers/staging/greybus/tools/loopback_test.c
@@ -862,7 +862,6 @@ void loopback_run(struct loopback_test *t)
 
 err:
 	printf("Error running test\n");
-	return;
 }
 
 static int sanity_check(struct loopback_test *t)
-- 
2.25.1

