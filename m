Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C5CC8EC
	for <linux-staging@lists.linux.dev>; Wed, 23 Aug 2023 16:17:18 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-76d83954c40so402035585a.1
        for <linux-staging@lists.linux.dev>; Wed, 23 Aug 2023 09:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692807438; x=1693412238;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Sb+MR/Lt+uikyl1c75o5pU9syq5jGmJBTY3hwwDWFw=;
        b=gnZ6gP/4kTK+Ozb5yJMZy8i97A7/By1IZQU3ZwcZlBiZWZNcES/FqIsOCIOGvPn7Fs
         7IHIqcUD9ACXWOfqxUErkeIT7h7np3gUa7vFuLXjxwnQw42/Q4+ntjqSBKLaeKdJ8zvS
         yTIzREC1nDLJo5bq+0Dvl0QwhQWtQfh1ak/Eh5Fm5ApSuKxVjJXSwqZX/C8w3UKMxRNk
         OjM4Bd7JbcmPFNIPtrFNAfsZFdseUVwMs24TW5WGtm3mj6yU/RRFzMkyQpaCWUU6S/B6
         jehBYVsKrEKjCjhTYgDOcgeWZfZrshXe30Gto3PC6lNMG4/uxzgZHIliPpgDDSwkVnV2
         0EEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692807438; x=1693412238;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Sb+MR/Lt+uikyl1c75o5pU9syq5jGmJBTY3hwwDWFw=;
        b=ct4pJRzze+Y8GECmGRIk5D8KkTz5vrfbQeRLD9OXU38Sk3+xGjKnAa8bYoNjXNs0RI
         9U2fOKIq4PM9nMbZODlxBmPutil/zBpyg9DlH3gfR8KBDWYY68deHwBLO8N/NgfMIM25
         jUlLOQO75QM1zykkDpJ3a3Jt9VpGnSN4E80paYgWLhSwilOY3KW5AMFHvoGJ4N0AmuL1
         UBCpyFpotAaksFFXJs4Cbfs+ZLSaclDOk8TX4fOSeIFdYJqRz3h9VZVglJPKm5tKGnSu
         NGovfJ81sMzrjnikvGPeoUOMDz7yxhKpQPp4CupFvxlh12LBu5J0h2DUbbzQwAUHSWDN
         wpgw==
X-Gm-Message-State: AOJu0YzD9Kd2GRoyDRLCItKcxQHHhPqZ6t1SW4oR+fdMIpZ0iAQZoWxT
	vgxh/RasUG1+569gmdcWUMM=
X-Google-Smtp-Source: AGHT+IEAfeIP+ECkRHM/ZnJvfacEMrbMzK3qL6v0mlT6M71nKJPK8Q9PhjD640mqIfNytSoJqju+Pw==
X-Received: by 2002:a05:622a:4c7:b0:410:92f3:8ede with SMTP id q7-20020a05622a04c700b0041092f38edemr14158882qtx.9.1692807437671;
        Wed, 23 Aug 2023 09:17:17 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:82ea:8c7c:b784:3f92:988a])
        by smtp.gmail.com with ESMTPSA id d14-20020ac8614e000000b00410ab3c78efsm450829qtm.11.2023.08.23.09.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 09:17:17 -0700 (PDT)
Date: Wed, 23 Aug 2023 13:17:13 -0300
From: Alexon Oliveira <alexondunkan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH] staging: vme_user: fix check misspellings
Message-ID: <ZOYxCQlCd04HHFZ+@alolivei-thinkpadt480s.gru.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed all CHECK: 'specificed' may be misspelled - perhaps 'specified'?
as reported by checkpatch to adhere to the Linux kernel
coding-style guidelines.

Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>
---
 drivers/staging/vme_user/vme.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index ac98b3da6bed..1e11047acf54 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -1620,7 +1620,7 @@ EXPORT_SYMBOL(vme_lm_get);
  * @callback: Pointer to callback function called when triggered.
  * @data: Generic pointer that will be passed to the callback function.
  *
- * Attach a callback to the specificed offset into the location monitors
+ * Attach a callback to the specified offset into the location monitors
  * monitored addresses. A generic pointer is provided to allow data to be
  * passed to the callback when called.
  *
@@ -1655,7 +1655,7 @@ EXPORT_SYMBOL(vme_lm_attach);
  * @resource: Pointer to VME location monitor resource.
  * @monitor: Offset to which callback should be removed.
  *
- * Remove the callback associated with the specificed offset into the
+ * Remove the callback associated with the specified offset into the
  * location monitors monitored addresses.
  *
  * Return: Zero on success, -EINVAL when provided with an invalid location
-- 
2.41.0

