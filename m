Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA8F801;
	Mon, 18 Apr 2022 12:03:39 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id s137so18511103pgs.5;
        Mon, 18 Apr 2022 05:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NnfylWN7MavTPT553g+jrwdoRsttSRF9ea+q5wroK2g=;
        b=SXVE+pR8devV3hO4tWlgoxCYNAdT0Ru6k53XSx5WS1V7guQJZqXF8ndR5M3UPGPryX
         preJK3/gW+63QwRNfoPx6ZtriC621Oq+FkCL6drTNIh/HRWLzHbUGf2IPoX7n5X4zmXX
         DOHLFuiRIigUu3TNkQw8E0AE09g6RMFWg2NuKJNlFvl9WHksO8vijte7fP0g2D2sIvW6
         cjf/kHgxe3bUrrvBB1cpRYs6NnwocbAxBZ+d91sUaqoDCFnI2YmlkAmeOSVVFGgg+E5L
         FxhzYqayBHTPeyO4t2FIhCvufk0Wklhv0jvy7Bw7sgh4KWBIE4TrMpm74eEZ3RuR0IWn
         PXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NnfylWN7MavTPT553g+jrwdoRsttSRF9ea+q5wroK2g=;
        b=ygkEnNlrHAb0aX+Bz07LRCkPzFb76B6gUqe5lP6+pbIJCJ2PNNXhhOL3V5t9GJ3Bjl
         4QaaGXRJMkfA0ruBxRWMgPoQDk4OntyotGh+o2o9qblQ3753ZsTZrD68N6I180qnzO7U
         UMHECbFvaGTSZ0fz2Z/mWNtHjds1MEyDtbDgW7Wq3psT0SCsdbhQxKUSKGQ0aUqHjWzg
         KRZRvTI5qgF1E5D1zTdFXN86dLI1UXU9M0AzSKBFN+mGl4gXN2XrPFYHYge54gAzO4Ay
         i9htroEKapYlYfO8c0ncj2hYO7AWg93GU4K2XTaN2OpfK3DbA35wF/gA8rhDZKJmKe/k
         jTnw==
X-Gm-Message-State: AOAM5300w21l2EjJNSUb/C9L+AqReB6eGFc8zr4x77LKEMoFr9jRXlvT
	XeLklWf/4ZLAgVPzpcRPBwxDJNCdcp0mDQ==
X-Google-Smtp-Source: ABdhPJxVYwRdke1zYGoWe8PpudWD0LJmyZsh75gb25UTnIp8YT9ms1lZ7EG2nblYE9sNVU+WooJIrQ==
X-Received: by 2002:a63:1d5f:0:b0:39d:b5e4:ae24 with SMTP id d31-20020a631d5f000000b0039db5e4ae24mr9551819pgm.502.1650283419258;
        Mon, 18 Apr 2022 05:03:39 -0700 (PDT)
Received: from aliyar-HP-Laptop-15-da1xxx.domain.name ([14.139.241.88])
        by smtp.gmail.com with ESMTPSA id p1-20020a17090a680100b001d28905b214sm3840628pjj.39.2022.04.18.05.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 05:03:38 -0700 (PDT)
From: Aliya Rahmani <aliyarahmani786@gmail.com>
To: clabbe@baylibre.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aliya Rahmani <aliyarahmani786@gmail.com>
Subject: [PATCH 2/3] staging: media: zoran: Code cleanup - else is not generally useful after a break or return
Date: Mon, 18 Apr 2022 17:29:50 +0530
Message-Id: <20220418115948.5456-3-aliyarahmani786@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418115948.5456-1-aliyarahmani786@gmail.com>
References: <20220418115948.5456-1-aliyarahmani786@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the else without affecting the logic. Fixes the checkpatch warning: else is not generally useful after a break or return

Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>
---
 drivers/staging/media/zoran/videocodec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/zoran/videocodec.c b/drivers/staging/media/zoran/videocodec.c
index 16a1f23a7f19..19732a47c8bd 100644
--- a/drivers/staging/media/zoran/videocodec.c
+++ b/drivers/staging/media/zoran/videocodec.c
@@ -98,9 +98,8 @@ struct videocodec *videocodec_attach(struct videocodec_master *master)
 
 				h->attached += 1;
 				return codec;
-			} else {
-				kfree(codec);
 			}
+			kfree(codec);
 		}
 		h = h->next;
 	}
-- 
2.25.1

