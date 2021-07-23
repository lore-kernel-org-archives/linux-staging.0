Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F852FB6
	for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 14:45:06 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id hu11so1421721qvb.7
        for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 07:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CgTuyFYQoE8Xu+ldgmooj9YVdlV27osFxONWObpTGbE=;
        b=s0z49SVS/C0xofoHHuMuXDk6l94GXG3oYgAcCnA7HoKp0zCZCylA7JoKdYguvvAnWN
         fBHEsFVSB6c6D+29DnRE3sPOBztoRTjL60IiJ2fJJ+nLpMX1v93bLlOArVe9Ix3HQg9s
         dvVu8NbLgkTfQp7uk/9ceeKkQv/7eJ4OTgAka5JH9IWOSWI+kG2Gmch1gSnGYLdqx8h2
         3Acr8ItLFU664flJLbyC9B0sDPPsDPtToLm9aC0ocVfRLcjEdFVIJzfaBo3ZPgXvgKk9
         B1Mwnt6diTa6GWcw8CM4tEQ4Qz9XKaw3p1BvSYeIDraB50hZgoP9bkkGEtGJC8/u2TlY
         qE6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CgTuyFYQoE8Xu+ldgmooj9YVdlV27osFxONWObpTGbE=;
        b=Kqo6m5mUWhvBrdR3N6hhiusQIeLH57RtIVJdBxHrRz8rxHw4xj1FmC9GkVNgR6/O+T
         /qMowpms9OmPZ9M5vuqICxeUEu+XwhC+uxck6NsMx4M7H3y0q9u9qqEPatr3Y4O/hkql
         bHhTRMkBkIdvJqu23o4yeBCAsOopcm+2Xbze/DbfUvgzR8zA/UUBN9D3DZWPG6zcIsXx
         yPV4iu9oxFZwcyevOossedzew52PJsIVoWib2SQ8DqkBVAPh5hHodRonVN/qhaO/hvHF
         rgSsAg+8sDzRQzbQFahwCC3zO/mqu+FESGEak+AQec6/cv5xrxsBfuxb56oayNGmxogV
         XEmA==
X-Gm-Message-State: AOAM531Lnhdxa2VsFZUFCB1HnfabIga090/SNr7Ed0Xjd8EkPu95NZYI
	GO2n915N94G/SV5GKzTGuG+BzA==
X-Google-Smtp-Source: ABdhPJw471IPpq1HLb0Ainy4YUDr+vEBEK7jYp/vFiUEsEzlWF8t1WR47ab63Ahbm2MYVeX0PI2XXg==
X-Received: by 2002:a05:6214:e4e:: with SMTP id o14mr4964444qvc.46.1627051506092;
        Fri, 23 Jul 2021 07:45:06 -0700 (PDT)
Received: from localhost.localdomain ([12.18.220.71])
        by smtp.gmail.com with ESMTPSA id 100sm3887223qtg.73.2021.07.23.07.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 07:45:05 -0700 (PDT)
From: Lucas Henneman <lucas.henneman@linaro.org>
To: greg@kroah.com,
	forest@alittletooquiet.net
Cc: lee.jones@linaro.org,
	linux-staging@lists.linux.dev,
	trivial@kernel.org,
	Lucas Henneman <lucas.henneman@linaro.org>
Subject: [PATCH 14/15] staging: vt6655: remove filename from mac.h
Date: Fri, 23 Jul 2021 10:43:39 -0400
Message-Id: <20210723144340.15787-14-lucas.henneman@linaro.org>
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
have the filename in the file" for mac.c.

Signed-off-by: Lucas Henneman <lucas.henneman@linaro.org>
---
 drivers/staging/vt6655/mac.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 6e2bd16ef384..9797eddaea01 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -3,8 +3,6 @@
  * Copyright (c) 1996, 2003 VIA Networking Technologies, Inc.
  * All rights reserved.
  *
- * File: mac.h
- *
  * Purpose: MAC routines
  *
  * Author: Tevin Chen
-- 
2.25.1

