Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79382FB2
	for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 14:44:59 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id g11so1738920qts.11
        for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 07:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M9k0L3mWwjOKkNNYZY6VqBYfmk6je5Fv56cPP3EbwDw=;
        b=PHHCsDIUFD6edPffLkQditHmfBQB4VRHGhoqG+zHHWLVM2Y73OutKNIflURuPDbVui
         wAUFZPto9RPXRuNWKjZutFDYGlRT++5HGHuCvq+xNbUV/SJ+8ePMRz2SqjopkRMYUWMk
         waSWCxZSsrnyoGccWhGo4OR9cc5hr163VIaasmo8mk05lzbmG7czpmhPneKbp1X5+T+n
         RfGmMSwYk8ppIFxEsLNxv4xBSV/M3Q7e8ptcwBhlwZmrkK6f5HqzohQzOtZgFiiONhwm
         GCZmUxFwOMpGHupOVT74csNgNmdu0e0zaXb+y706wmkTOWqPSXjht2z/6TPLFyg23pwA
         fm7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M9k0L3mWwjOKkNNYZY6VqBYfmk6je5Fv56cPP3EbwDw=;
        b=VoPvwQBYjtuCLt5DPvvz5Y6TCBn3tT7FMcTnEkTGGFf0NKDBFxPlvKO34xVj7KF1z/
         e9lnBSRh0LLZ/BxPON5F2uOn1AVwi6zycNDpTMFjYHC/CENlsjGpU/vAKdzk4pVQqxTR
         j4eHK9Q2qTnUfUtlFwFMaEdnxytgLlx5uLJZo5oTI15Iawn+ftBmhLgQWAeOtiqtJHOU
         WVSh3Yf26m1QLWeDbeiqzJCWODg1zgWO01GKzpR0PO9jJsthsf12H+L2dj0GomPY4zq0
         gYVRZN8Tnci1lorwDAbYZtDuDM0/0sNdt/IooOLPYROhLRBrjrJt78yS98kK6hmTtW58
         N0AA==
X-Gm-Message-State: AOAM53090BGH9Liowa5B1OaanclOiyKWXIRlnvWY1wnxjenQwzWflhqX
	mAWXWOKZrkeY8DPh8n1+9/oFww==
X-Google-Smtp-Source: ABdhPJzG89GT88rlRMsGVCzeF1ivH4rXXOIkRmR75ic7tiMJkuKxhgml2cGfScp4KAOxS3sz2q630w==
X-Received: by 2002:ac8:4986:: with SMTP id f6mr4235949qtq.125.1627051498986;
        Fri, 23 Jul 2021 07:44:58 -0700 (PDT)
Received: from localhost.localdomain ([12.18.220.71])
        by smtp.gmail.com with ESMTPSA id 100sm3887223qtg.73.2021.07.23.07.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 07:44:58 -0700 (PDT)
From: Lucas Henneman <lucas.henneman@linaro.org>
To: greg@kroah.com,
	forest@alittletooquiet.net
Cc: lee.jones@linaro.org,
	linux-staging@lists.linux.dev,
	trivial@kernel.org,
	Lucas Henneman <lucas.henneman@linaro.org>
Subject: [PATCH 06/15] staging: vt6655: remove filename from channel.h
Date: Fri, 23 Jul 2021 10:43:31 -0400
Message-Id: <20210723144340.15787-6-lucas.henneman@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210723144340.15787-1-lucas.henneman@linaro.org>
References: <20210723144340.15787-1-lucas.henneman@linaro.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch resolves checkpatch's warning, "It's generally not useful to
have the filename in the file" for channel.h.

Signed-off-by: Lucas Henneman <lucas.henneman@linaro.org>
---
 drivers/staging/vt6655/channel.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/vt6655/channel.h b/drivers/staging/vt6655/channel.h
index 0d2709607456..78b2d82317e5 100644
--- a/drivers/staging/vt6655/channel.h
+++ b/drivers/staging/vt6655/channel.h
@@ -3,7 +3,6 @@
  * Copyright (c) 1996, 2003 VIA Networking Technologies, Inc.
  * All rights reserved.
  *
- * File: channel.h
  */
 
 #ifndef _CHANNEL_H_
-- 
2.25.1

