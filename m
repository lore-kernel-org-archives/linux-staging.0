Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B57570
	for <linux-staging@lists.linux.dev>; Thu,  8 Apr 2021 21:21:11 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id l76so2297475pga.6
        for <linux-staging@lists.linux.dev>; Thu, 08 Apr 2021 14:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=7KQ9dgyFpGmrno3NBnr3xvBzKME75uzvWjBYKMlTxeM=;
        b=GDc+O5ahwo0oKQQ/6akBDra6B3nJJ/iUovHy/hU4srnxmdKW9FsIN3hOg2CleNfyvU
         PYJg4Ixki7oSoXUbVmJknOSp7P9gFwaxNXU3BFWRdZoVN90ZR9Olsm/VsWdshBFQ5Xy5
         sMf7Nyfjxwg8Q1cpjAYlkFqrXFkp3KF4SR4IvE0+QzqCaIfTT33cYElCjmEctXL06sI+
         yqQcrSzIo3/nKOdjrFmeUoIjQsvPnoFTEVbdTIqkOn080GC2+EtOefGfTGmIrVevihx5
         Snj0Arn3ka4V2OCqn0vwI+p4uz1mqNMKIj9GUZo4La+l+2JBQ7F+246Vr9hq/yS21HdZ
         zVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=7KQ9dgyFpGmrno3NBnr3xvBzKME75uzvWjBYKMlTxeM=;
        b=mwZdfEyPnIz7M352wvwrULqp7Xz6JGevTZH2JeZ/MDkEeQnf+OXKZaBWCa78JJ/kBb
         toT03fW1l7Xut9VVleihIFWurcgs7TZ0zdGGgtos77+BggC9tHl36Z4zOV4ryTn8qauK
         7AjMuqaVtQj8f9rcbw+SCB2rbg4bzdCdO0LYrS1Xxt+LBD61wMFjawyIUEglhFKZwZTn
         874+SZE2QSDyulLScGvMDl3gXE+L9bfGMVylTv8qCcbTlvPCZCAEnls79qvKzuGI6R5/
         9C45CDttMwrpyDJUFruG8hy6XnUPqyoXewSxlrDwRD+IC6UoFCnPRgDhYGrpylyIAQ4G
         5DSA==
X-Gm-Message-State: AOAM533vY6dzVQSoGu/5II55EC3uwSIm3AZg5YWWbk2Dhiyk9w1NrcRy
	Feae3hyLhnf5u0UXFrHmtH4=
X-Google-Smtp-Source: ABdhPJwfinViQvp3s3C1Ztqe6bd0Xb92TsO8+3f8xSRMoFUH1NZcuef62xbT7jg4LCMRBPNZv9XXCg==
X-Received: by 2002:aa7:8389:0:b029:209:da1c:17b5 with SMTP id u9-20020aa783890000b0290209da1c17b5mr9439756pfm.29.1617916870938;
        Thu, 08 Apr 2021 14:21:10 -0700 (PDT)
Received: from kali ([152.57.243.224])
        by smtp.gmail.com with ESMTPSA id q2sm322538pfk.143.2021.04.08.14.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 14:21:10 -0700 (PDT)
Date: Fri, 9 Apr 2021 02:51:00 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: [PATCH] staging: media: zoran: reduce length of a line
Message-ID: <YG9zvMnYlZVbJhQn@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reduced length of a line which exceed the 100 columns limit by splitting
the line into two statements and commenting it with '*'
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 drivers/staging/media/zoran/zr36060.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/zoran/zr36060.c b/drivers/staging/media/zoran/zr36060.c
index 4f9eb9ff2c42..035634fc1c6d 100644
--- a/drivers/staging/media/zoran/zr36060.c
+++ b/drivers/staging/media/zoran/zr36060.c
@@ -249,7 +249,9 @@ static const char zr36060_ta[8] = { 0, 1, 1, 0, 0, 0, 0, 0 };	//table idx's AC
 static const char zr36060_decimation_h[8] = { 2, 1, 1, 0, 0, 0, 0, 0 };
 static const char zr36060_decimation_v[8] = { 1, 1, 1, 0, 0, 0, 0, 0 };
 
-/* SOF (start of frame) segment depends on width, height and sampling ratio of each color component */
+/* SOF (start of frame) segment depends on width,
+ * height and sampling ratio of each color component
+ */
 static int zr36060_set_sof(struct zr36060 *ptr)
 {
 	char sof_data[34];	// max. size of register set
-- 
2.30.2

