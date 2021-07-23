Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9941B168
	for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 14:44:55 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id 129so1577337qkg.4
        for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 07:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YycdUkhTEDkBlyaUzDFclTUavsGd31hn3kHb8gh7i14=;
        b=tASRT5DOnnMIXzlS81s/sGGlisX6ePy1jCTZJ5GUmD/A4kMQNgFZT55Jj2JWX9uw+3
         bjeOFd8zsudXqKn6T2yVevfQQdH9U4QFV5aHn0Q15yuucnWqvOwd7j55fR4q8+g0KwBW
         niQP1qCNKvNjPa2+4bt4QbNklr9EZ5KprOU/fuNMGkW2Nzg6z6l6yZBvWIA/UdWdXscn
         8oFILNNBsr7mn3y5ZwV8P/1hKZNqzUdqaGU4zlWK8HQVxSAhIVXyQB4LED0LexTOsZz3
         mdIZ5Anw8RQOTWKYSIRl0LtHGRi2s2m5MnDdIh2ydwMFPVhheqrpHNc+H8RUFWnPZaSF
         Vstw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YycdUkhTEDkBlyaUzDFclTUavsGd31hn3kHb8gh7i14=;
        b=LJsFu/0Lra11TmTeVa+Hep5Xl1sxE+50Ui32ZHbx6WZXDWO/AdAQYR2NqBo4xyixZI
         /8DtJ1lsDtFr9KkqBJ/cfznMZq0sv+IlJdw3UPbc0SCgts9ND/5+PLi9pQsCdqtkKvd6
         kkyVkn3Z53uy7awRTV/oSCdAC3LJxazs+LS8U2kb5FvKN+6NyWKE1hXVbIOKq64J2QFi
         fM+CsBZY8aOq96g+b/hCcH8xNSZTk1N8kG0RB/YQirCuU5c/94xZ0LTE9agQYR4nimhN
         a/vEp4uodimQfhR4YEuu9VHgFPU79gmhh3fpS9aGJXIfuj1refwrpCV2jNnunbpkyBWI
         H5oQ==
X-Gm-Message-State: AOAM531h+pxM2QnDVc3rAs0J8OHtLeUWTCs33SLbMOUYyfmn4uDibYOL
	PXUUEAHs4wNeiyJok6hKmzLLeA==
X-Google-Smtp-Source: ABdhPJxqKDq2waKlHNhe7ZxGXC3D2hHTfbH8PX87Qr3T6Lj8k3tSiiIX5ZJbgqF2kULVb85Y7kQeUQ==
X-Received: by 2002:a37:7c3:: with SMTP id 186mr4910549qkh.109.1627051494631;
        Fri, 23 Jul 2021 07:44:54 -0700 (PDT)
Received: from localhost.localdomain ([12.18.220.71])
        by smtp.gmail.com with ESMTPSA id 100sm3887223qtg.73.2021.07.23.07.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 07:44:53 -0700 (PDT)
From: Lucas Henneman <lucas.henneman@linaro.org>
To: greg@kroah.com,
	forest@alittletooquiet.net
Cc: lee.jones@linaro.org,
	linux-staging@lists.linux.dev,
	trivial@kernel.org,
	Lucas Henneman <lucas.henneman@linaro.org>
Subject: [PATCH 01/15] staging: vt6655: remove filename from baseband.h
Date: Fri, 23 Jul 2021 10:43:26 -0400
Message-Id: <20210723144340.15787-1-lucas.henneman@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch resolves checkpatch's warning, "It's generally not useful to
have the filename in the file" for baseband.h.

Signed-off-by: Lucas Henneman <lucas.henneman@linaro.org>
---
 drivers/staging/vt6655/baseband.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/vt6655/baseband.h b/drivers/staging/vt6655/baseband.h
index 9354ce724446..0a30afaa7cc3 100644
--- a/drivers/staging/vt6655/baseband.h
+++ b/drivers/staging/vt6655/baseband.h
@@ -3,8 +3,6 @@
  * Copyright (c) 1996, 2003 VIA Networking Technologies, Inc.
  * All rights reserved.
  *
- * File: baseband.h
- *
  * Purpose: Implement functions to access baseband
  *
  * Author: Jerry Chen
-- 
2.25.1

