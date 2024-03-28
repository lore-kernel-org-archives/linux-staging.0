Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0454B12DDAC;
	Thu, 28 Mar 2024 22:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711664812; cv=none; b=MIp9Up0nErF+ZIhueYxrKIO4xvPPtBBE4KvCWotDy8Ox3scbO7Q1wkLG7M5FFLf60/c05pBoQpUUV1U+xqeHQ1dlWCAZuDw3LlqWfkxCxkBEpYaqfE+ahFNmy0pPfwbRVEZ/8MmFCOzGiJHtr+URW5mPe2QOfDUiGDmA9hSUFqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711664812; c=relaxed/simple;
	bh=f2KZPL3xcVNpG7J9pfI78XLVn960iQlBYAAkqRBmdFs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RqSe21D0h6WUf2m8ODoFbGxE2PD+q1JG/Fk73oovlSzpeFARGL1scr4HPWJw0cxYn1DoRFA8ScKM70zl+I7JDn5TSY+rW2saD39HJOb7x+dzzbMQtQVKtnOl5BzbeTLAMmi0G0e1kvcYdhgMxpp/6eMOnzVg39KHuSDkhKzsj5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DoOT5vWx; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DoOT5vWx"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-368b9400e51so6683055ab.2;
        Thu, 28 Mar 2024 15:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711664810; x=1712269610; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jCGlANBlhtFgOS9gNA9KtfZG7bA9JbQQdS+5iDoE6gA=;
        b=DoOT5vWxUGznGTSYU2yKpKh+zdABjyjnjtMY5Ag+1ilgLbEliPEfqZ3JVWRERhRJ1n
         V4GTnXWPEedGjA/VhqLB6ldrpZRfOEqaJdvI+I2E5u7Fa6ai0oGCsaEVnJs2pqmFSyRc
         QZickaKt+jMnSrh+dUSG3S8sYgWlWraUNzsLMTXft68o+1nFP5PoQfz1FmRTDH9/Jlng
         lgP0/ZVkJaSDj/ZfxoJhtIxrAPA6PKkc0jReEg8/K8tTMgqtaQ8fiLwGFpGKooImV1ee
         qm6T3SAq+s6iOE1sgN4/GTaaCWkZCV1ZGCf1KJjrrZlB3RTKJ0K+c8ED1z49IAVFl0H4
         HxUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711664810; x=1712269610;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jCGlANBlhtFgOS9gNA9KtfZG7bA9JbQQdS+5iDoE6gA=;
        b=j35snRrgjIIUPhRwWOtGC7AkgVO8hVq//7+/05xA+/FcIbddIpFuIQ0o4OQ1/e4oJ2
         rfvNsEWawxya3f2kN1WmbMXGWdBoy6geoKaU+/Z9alVQ4wbMNy+MvOT5rKKrdyXboOyO
         0LyRWe+lyLzDgsjWfqanXypY/53zckB4fwzaaACOXEVgZAMW6PPG1ZWGHiEtFLzGNagC
         Adr255KTtQOiX98wTd7pzcDYFNGKHeDtrFuF3nrWmZklsh5mI+kLiTpHQJV0IIeRHkSP
         1TfqNVWwbQKwCQOpYcwunyFz8QHol2CfkYQY8reDgQ7w6tfMpmeGOwh//Y5+FV1F5xYu
         3ORA==
X-Forwarded-Encrypted: i=1; AJvYcCUBeieYBm1Rafj+fBNIM0GC5JzZkz/1bBHTrdOWZeiBF8w+kHhh2NlxfRXLExq03pWCfFuHAVORmaJkNT285pq8lbaWXI70db1ePEzcSutv2w7IAhUw+NJpwucBeWvT64gWhm1DhJde7w==
X-Gm-Message-State: AOJu0YyX8lqVi5RQ5PMYMieRZ96WmV6R7bCyIixt8IB9IlwYUwwLcECo
	VdarOgVDZ7t5Vci5YpZrWz0X7+T4pgKI3X8bsXsdJlzVrLHYoeru
X-Google-Smtp-Source: AGHT+IH2qqVQmRhKzSoKucyp6jbEq9qiSNnOHg2T2rWIs14uYn6qdOtF+yKO6Y7q4oywqwXTHdjpEQ==
X-Received: by 2002:a05:6e02:20ec:b0:366:468b:3e26 with SMTP id q12-20020a056e0220ec00b00366468b3e26mr466153ilv.28.1711664810046;
        Thu, 28 Mar 2024 15:26:50 -0700 (PDT)
Received: from tahera-OptiPlex-5000 ([136.159.49.124])
        by smtp.gmail.com with ESMTPSA id t62-20020a632d41000000b005dc85821c80sm1767676pgt.12.2024.03.28.15.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 15:26:49 -0700 (PDT)
Date: Thu, 28 Mar 2024 16:26:47 -0600
From: TaheraFahimi <fahimitahera@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH] staging: gdm724x: Align descendant argument to the open
 parenthesis
Message-ID: <ZgXupx0nXwIOjy7F@tahera-OptiPlex-5000>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Mute the following checkpatch error:
	CHECK: Alignment should match open parenthesis

Signed-off-by: Tahera Fahimi <fahimitahera@gmail.com>
---
 drivers/staging/gdm724x/gdm_tty.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gdm724x/gdm_tty.c b/drivers/staging/gdm724x/gdm_tty.c
index 15c246d3b1a3..bd80cd48fb44 100644
--- a/drivers/staging/gdm724x/gdm_tty.c
+++ b/drivers/staging/gdm724x/gdm_tty.c
@@ -272,8 +272,8 @@ int register_lte_tty_driver(void)
 	int ret;
 
 	for (i = 0; i < TTY_MAX_COUNT; i++) {
-		tty_driver = tty_alloc_driver(GDM_TTY_MINOR,
-				TTY_DRIVER_REAL_RAW | TTY_DRIVER_DYNAMIC_DEV);
+		tty_driver = tty_alloc_driver(GDM_TTY_MINOR, TTY_DRIVER_REAL_RAW |
+						TTY_DRIVER_DYNAMIC_DEV);
 		if (IS_ERR(tty_driver))
 			return PTR_ERR(tty_driver);
 
-- 
2.34.1

