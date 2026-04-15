Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905893845B9
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 19:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776279618; cv=none; b=NVnxeiUFu7EHnCc6HVUPAsE9zMtJBUKFHNFOAzz9gR14WhitB+C2igyyFe+y5RKA3iFHZurnk02p/A5apEaoCDrfhrsplzs2J+3IE3AqtxAQMl4IHi6OEm15koRSKHi1yNzI0xkkUyEwskOj7rHLrvQI2MwBWz9hQFRIyN2PhaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776279618; c=relaxed/simple;
	bh=ar38Q54FqS6BfJ7qfdNBxhWZJgoF1oHUW4lZ51lRlHc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lSHxxp38JNxvCX0OF6yin0d4mQc99qcX76ZB0OLzYpiEcCRlvRy4S7JyStQRQO2c6XvFEiZ7bBaTX5TmdGPp6tIjUdKXK2UqFXS5QdGK901PknpgXU0irivsw7Z9eWT0zww3tMAjFGZuIBZaBPV89rSxOcqaQj7t4YHztQwH4xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D8wodOvE; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D8wodOvE"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2d8ffdc31d0so7914984eec.0
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 12:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776279617; x=1776884417; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J2rpous9mFPOJaAxWsvEkQiTvEp0NZiIYNqjDYSwcQY=;
        b=D8wodOvErisFeTwU4yc4yoqbk0I9Z2wkqWbN5OPBnrc8VgBX6D8TYXKuIse6cqagri
         /9qsQg/fBzpMNe7UMo8ZuB40lx523C67F+eEdRAQxEe+xjm+0P5meqAaQCgyV5XC0LRe
         xYdCO0+dKqnMCAU2Hzu57LMO9Eh+Z7RL6OrDC39kA4Hl/LKRAIcsLd65QJ+Xy7UtizpN
         EX2zIrzXViEJAZouStvhWO5fXtBZUywrBPwiT0wcS6Gff7bILVoJ7l3OOewiOiCeo2Pg
         nL4Eof7BbL53ezZCvSAXXfl/andSNVLQCP+T06byc9H/r5wWfvNnBBsdMPJV9Prqo6tX
         0/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776279617; x=1776884417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2rpous9mFPOJaAxWsvEkQiTvEp0NZiIYNqjDYSwcQY=;
        b=SgsYF+Nh7iq3v+oVg2fXyeolnfJjkUZ6ug7x1k7TLlmSW/CvWkNtCrOi/3wxAkD+9n
         fkro0vBBOtM5I+3itA1IwjLbRKuEBPdApImCMScSNQqnL18Vn03NlZayslbJ6lk50EuN
         O2WjTs8qLMIh1UHSBCGZSG6uSZ8NGjXejnYEzI3RBr9SIsqG6ni74Y7vjFqiQ3SXMRuj
         LYiUf/0Bj3LcMgFt4LaMomt56bNY2bQonnlNyW27RzscPBq17KtYDUahYoSFubfr8QHG
         c5/DU6zvGVVbX0krcvgTeozTBtqz2miEWWXLzz00J4pl+lK/dtlYFbhYKCyt4+l96wCj
         9VlQ==
X-Forwarded-Encrypted: i=1; AFNElJ9iMLZuP6LYNxhC6qRXL/+R7QtjS1xd3Y9yFn8Ojnqo1CSZmcys873x20y5c2dH2DL4Wr9onKSei8+H4Bpr@lists.linux.dev
X-Gm-Message-State: AOJu0Yz355OAvAhrKOg/U7KkCrWZorMsnBC3sCOs7yQkoXxHOBEnc+Dd
	4jilXEFLoJ4KGrYAO7ue8fuPklH2MdfDJLZq5NLtZ6ctPhSAwxMSZ4Y=
X-Gm-Gg: AeBDietvzphv46m7cquRWOQ7n/vadH9CHymqPd1Jb33tJuksL05mowEMOmOIlAMKINc
	NA36fpxQNbsmsgJxfAh6UKzvPHElVV9H1wyCltSFbaN+06+RIJLChK5bIYfPYsB143jG885oeAw
	VrZo7DYODgrJwNItSESX0eHdsLbxLtAi9r2FgpgHnkymR7sbJZr6MWRYAzAXgZsMh26zlo0zM5b
	q8LJrimee73a9OTvIjifxq5XqeaoJd3bV2d9joshD17x6AhJTgv00OnxZGLPgDB3ZZyTVQeSYjK
	0rJP6xJSQzBQnLTQx1p7mnsd5ObzqmamM7Qk6PgW6AHIMiKneSVBeGhqfkXTvGRLaV9UaVZ8FMo
	GdhneelY2McUs+P1IThWPKA8ipjMXlGZpsa6ttylMDfaDRXPjLMHknv0+RM6eIW2PZRyuajVuKC
	2h73MP3v1waTtiHhyBtdIYbCsPkNR3Qc9Aebqb8upEXdbFiENtA65WknkXHTTckSEV5PVQOJTie
	s+7FWkKkA==
X-Received: by 2002:a05:7300:d08d:b0:2da:39e9:20fc with SMTP id 5a478bee46e88-2da39e96e53mr4933771eec.17.1776279616401;
        Wed, 15 Apr 2026 12:00:16 -0700 (PDT)
Received: from vilarmanjaro ([2804:29b8:50e0:3432:1ab7:b7ed:546a:3e8f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8eb84673sm4009468eec.19.2026.04.15.12.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 12:00:16 -0700 (PDT)
From: Ramon Watson Vilar <watsonvilar@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ramon Watson Vilar <watsonvilar@gmail.com>
Subject: [PATCH v2] staging: media: atomisp: use usleep_range instead of msleep for short delays
Date: Wed, 15 Apr 2026 16:00:05 -0300
Message-ID: <20260415190005.114900-1-watsonvilar@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The msleep() function is not precise for delays shorter than 20ms and
can sleep for significantly longer than requested. Replacing it with
usleep_range() improves accuracy and is the recommended practice
according to documentation.

Signed-off-by: Ramon Watson Vilar <watsonvilar@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index d3414312e1de..e0b0f09a5c26 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -433,7 +433,7 @@ static int power_up(struct v4l2_subdev *sd)
 			goto fail_power;
 	}
 
-	msleep(5);
+	usleep_range(5000, 10000);
 	return 0;
 
 fail_clk:
-- 
2.53.0

