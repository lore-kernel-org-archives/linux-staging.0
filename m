Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A0E46BD
	for <linux-staging@lists.linux.dev>; Wed, 16 Mar 2022 12:48:19 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id b24so2548816edu.10
        for <linux-staging@lists.linux.dev>; Wed, 16 Mar 2022 05:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=XygkMwuh2MWsaZ+MkMSHPntfTcHrWBaJgT8VxhIRrmw=;
        b=YVVZeqqYD6xLnTq4lZJk+K2oYMIm+k7Z1fSxloPG9AJXclhPEjY7B/Zjt9QNUDpl/j
         2WdHmvgbKvFGVzCOzkib8tchMvDvVwZ9nvJintoDictU5depVV1XFdDhRPLsNe4fTlfW
         /qGMMrsySxMaQqEVxhJgLW4lChzrcvPVpZr+87wDeCepL3PNl5hY9j8WiwXJVwVNa3J4
         0xidiQRTiCh2LI4syKweFiWTxl9ZKDthrpoSbmEPdsEtiw4tZzQpKxdSvMQV9cGUAS5e
         n3KWjagY91M2w8lhn2ZvZFgQ76Y7iWd+SstwU+FggiGScxUln7gISYEg2BzesePyRkTm
         3fKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=XygkMwuh2MWsaZ+MkMSHPntfTcHrWBaJgT8VxhIRrmw=;
        b=aAXY0E4jeXuBvUalEZDzJxxDS1JpFWnMAazIR9QiLRV6Z+DCdCRdCcJHjgsZmxMJ1g
         U/o5pfgowMdj6YQHPYU40drcAZvQY6qppBqgk48qXvIL5+cFTgP2HlzxyGepoOpsbKpO
         JNpMk4YImJcdXp9rXuB914LfrZTSlnZxn6BDdu51fqZNVpLAhx7sKgQA9MLQhvD0i8uH
         2mWVb37YoQtwGD3QOw/jOyC1NOTirfyfLPGr/HNVHiIBMWH8aNzUWAorqIyH6vd7FEsT
         2E8LEwiiwko/NJUL6A/JzV55ojjPamHmwajMpfSuJyDgEN5o9Svj6k3wunYDjMLWwbm/
         qCeA==
X-Gm-Message-State: AOAM533Lr/zi32S3bxMbsff9LgCvrTCl0l0VhMP63tuKR+DASFjaJwe4
	NN44/D+0dzZf8Z0JfDHlEIc=
X-Google-Smtp-Source: ABdhPJxUCbJI38d9XPAi/0rGzQd0QKenyZzwAhUeJfbNsh0a1ESINhjn30PLIdVhLxk5y5HgOnmQrg==
X-Received: by 2002:aa7:d4d6:0:b0:416:30a2:58c7 with SMTP id t22-20020aa7d4d6000000b0041630a258c7mr29118605edr.271.1647434897994;
        Wed, 16 Mar 2022 05:48:17 -0700 (PDT)
Received: from felia.fritz.box (200116b826783100351493f9f729970f.dip.versatel-1u1.de. [2001:16b8:2678:3100:3514:93f9:f729:970f])
        by smtp.gmail.com with ESMTPSA id t19-20020a1709060c5300b006d582121f99sm848189ejf.36.2022.03.16.05.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 05:48:17 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Christoph Hellwig <hch@lst.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Martijn Coenen <maco@android.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Christian Brauner <christian@brauner.io>,
	Hridya Valsaraju <hridya@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: remove the obsolete file entry for staging in ANDROID DRIVERS
Date: Wed, 16 Mar 2022 13:48:02 +0100
Message-Id: <20220316124802.372-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Commit 721412ed3d81 ("staging: remove ashmem") removes the last android
driver from staging, but misses to adjust MAINTAINERS.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

Remove the obsolete file entry in ANDROID DRIVERS.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Greg, please pick this minor clean-up patch for your staging-next tree on
top of the commit above.

 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 963d7001f2ce..192e99b6b8f0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1325,7 +1325,6 @@ L:	linux-kernel@vger.kernel.org
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
 F:	drivers/android/
-F:	drivers/staging/android/
 
 ANDROID GOLDFISH PIC DRIVER
 M:	Miodrag Dinic <miodrag.dinic@mips.com>
-- 
2.17.1

