Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDD6ED4
	for <linux-staging@lists.linux.dev>; Thu,  1 Dec 2022 05:38:56 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id jn7so602612plb.13
        for <linux-staging@lists.linux.dev>; Wed, 30 Nov 2022 21:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oregonstate-edu.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qzd7T7c88aZQcOpjF7mk1g5wAmp98SNe8kgkrI3AbJ0=;
        b=CedsK0vqoJwz3a+jhzg3J8h8zWDk2DCZ7uK/Exfjsb2mwChoCqRBmA9xfSyhlU8LBI
         P5p9gzV3GijCYxamcfjA9HtwH9ydD9QJVwIOOf9iQLHK+6p9kWpnq3CSNXAALX1MUr/u
         xnlN5q3tQVkjnLb8sVb2pquxr9u1ehlXqTAiii42IQrYezYHThzHWKQDhfsvFNBmWA28
         Z6wrzATv5RJeXzI/oZ8CdPm35tO3VYs8wi83Pgn0ueMIpYmg69JtFOWRi7Uj6r3cQwxa
         LJcNI30UPOx976SMtIXgHuewxr9pufXw/iUV6Rlg6QRSuf/QkDdtPo8+vPFQjAXS/ezo
         /VXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qzd7T7c88aZQcOpjF7mk1g5wAmp98SNe8kgkrI3AbJ0=;
        b=UPM+FmuTbHCmNaf2rvQzPXUe6VltM2Jk6+kTLsnohgZnAdJgJe8leqGITQsFASPU0/
         ADq4oMHcHNg4R99DlwDHuFZE0cWoQ7EOAUv4ArqK3evvoLt8TBXvM6zOTiopYnJs4ObR
         U3GhZaWIejSBjU12SYdbar9Go9Yz0hmTk0uIYz1/WeF1ZDg9yaR7FuhfV+2Rk3Cjw3Ov
         pCRmDiI2LQBi/MrElDZFh2f+Icp1/b0y6PrbRiK2SHg6DPBTqZ1Kx2Vv4W5biQ9MHHaJ
         cZd1uZp1hwc4NnbH1IppZeIKUSkM7OfW8zDCOIYMrTqDzV30it6y1DiCmADGlxCtB5kB
         cnLQ==
X-Gm-Message-State: ANoB5pnL1eJi/MB7NvF9DnfccEyYgIHD+yvqspGrxRTA/TKXuaD9rAq6
	8dF71Hf703ON8m8Pf7nNfiywjA==
X-Google-Smtp-Source: AA0mqf5ve22NoC+ei00xHE87/cE+o70Wl9tMVVuhnNNHbKszB3a5kdKZGtJoN+bGghrhf1a7C/Nb2w==
X-Received: by 2002:a17:90a:930f:b0:218:9107:381b with SMTP id p15-20020a17090a930f00b002189107381bmr62438828pjo.75.1669873136401;
        Wed, 30 Nov 2022 21:38:56 -0800 (PST)
Received: from ubu ([76.27.231.73])
        by smtp.gmail.com with ESMTPSA id 17-20020a170902e9d100b0018997f6fc88sm2523547plk.34.2022.11.30.21.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 21:38:56 -0800 (PST)
From: Jack Schofield <schofija@oregonstate.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Jack Schofield <schofija@oregonstate.edu>
Subject: [PATCH 1/3] staging: greybus: loopback_test: Add blank line after declaration.
Date: Wed, 30 Nov 2022 21:38:50 -0800
Message-Id: <048967b5c3b157e19ccf4608f71da8418fc31877.1669872193.git.schofija@oregonstate.edu>
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

Declarations are to be followed by a blank line. Add to follow Linux
Kernel coding style. Issue reported by checkpatch.

Signed-off-by: Jack Schofield <schofija@oregonstate.edu>
---
 drivers/staging/greybus/tools/loopback_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/greybus/tools/loopback_test.c b/drivers/staging/greybus/tools/loopback_test.c
index 4c42e393cd3d..242138c4f6cf 100644
--- a/drivers/staging/greybus/tools/loopback_test.c
+++ b/drivers/staging/greybus/tools/loopback_test.c
@@ -675,6 +675,7 @@ static int open_poll_files(struct loopback_test *t)
 static int close_poll_files(struct loopback_test *t)
 {
 	int i;
+
 	for (i = 0; i < t->poll_count; i++)
 		close(t->fds[i].fd);
 
-- 
2.25.1

