Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B081DE4C9
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 06:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744180751; cv=none; b=J8h6FlWdzd5Yod5zF3Q7+h07Zwq4h/0EAjyQ6hp3gFLAB7i6zu1qfihdnSikNRrU7bHb4MfFnnlPzG40ddS14GqcxiLjDRhBl4HEJDm3CPjl85huXaXXWZGhkoXTL10m+SzoO8m1/dO6yXbrWc8ITrkv4e3CTW13T7NS9Cekpqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744180751; c=relaxed/simple;
	bh=0BwdTMeB4vj0H+8sONqYDXdTxoDaepL1rVj5QYYR5bA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RupgW6EDjI2m2yMaBr0oNI1PWXvKDMoByNzwUIim2lmMZ+aSBMSDWB+BuWaNlOmSBpwTJA+LH66XwNr5iiPyTesH8Ian3Yyn1jJ7SjAgc+MX+u8GEQ9NQYm8xoVG9/seWsosKMkrgGkC4JQ9dUPlbw18HcpiLWkUdoLGPg0crDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=Ty3Me13P; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="Ty3Me13P"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ff694d2d4dso5583285a91.0
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 23:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744180749; x=1744785549; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EhBjuzXfhpvMuUsgRC5Vl/rwEcnbNHJJRuuFjc3usdI=;
        b=Ty3Me13PXmKeYly2oogxgXWD2Edr0aRAhHgNWQv2waQL8xjUyMNAjO3bWM5IbUUcZn
         pYpct3gjf+9e8sHfGc7opRxiWw78tMuj+YyHih/0etJ9l8vXzsua3QyqGP0DSiPfp4pZ
         Ljhwk7lU/GVXV//7PhjBlX0jKxOAPlLIjrzZpwXvrZ3DzWeqmaroK9dWmVW/YVAAF2wn
         PcF+Q2WbE2F+uXLb6OVQVNMFVvQ5/7MyC5BZUN5Cb+2ZI11RaubduIPyYTQGiPa4l+mz
         GDdPSRgYXGNDDC3ThXI6iarauUDt+DlYmbi6i17jDTexDib76CG6d9kYAgY+F2gM2vWr
         Za1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744180749; x=1744785549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EhBjuzXfhpvMuUsgRC5Vl/rwEcnbNHJJRuuFjc3usdI=;
        b=vCjKNM2F1uJDcKE7bbnHmZYo4X9LwclZdvGuoX6E68F2IjUfptBdsncwUtrrMrzfd+
         AX+enAu6yUODuyHzoJcqvsUGUCR7xGTXYmQSDNdNVHlnSKnLaQqo9xErd4Zs/kUs1ZwV
         lDb8C3rNHai9G5muN0gOAUJVB2zOto0YpbgIu8NHffDVSoAveSxQiT56Gf56PLsPQ3qE
         HURy0TgBRW5h+pSqgvCriLNBWP+txGui7AUYb1iHT5cJSmNKFHeLMKbiP74I948n9pKw
         AIM/8ZlhOITPFR8UQX54OIvIoFUQ6KtjkJ1Mck9dSHK9nT3fEK86gPyzDFUgP+BRRK02
         AdPQ==
X-Gm-Message-State: AOJu0YxjU12ux0eI9fNYC63UUbEDJfKphD8TYiQ1v5qJs3DOkw9voojg
	ZTiyfZ34tA4IW7Ibmsoc5EIYVA/9PZtHS1SFSO3IcZSz811q+aQKBvW1w9ylIg==
X-Gm-Gg: ASbGncszG0Non2Po+VJaBB+QGjaOKVLwOHkrI9pWI7Llzx5AokTC3vT4iqrk7nPqBq3
	n8dySoJMsXhKN1/QD2S7j8kIpsI1eqF3TnlYLAlZ7HtkoaP0lGbt67NyNWAPJacNn6QfncoYuHL
	YWkQcaXFaL89U2q+p7DQppuXE+SQblGT0CnLWzDVQfCDM+NI7si73EToO0scH7rhgwOmYNQ3mw7
	uTFGntHjhiZLrA7Cqp6SC9ZKMHfUnT7oZC7IkoV0sGReGsXvrnSuAKdMpmG7c3vZc/zqp2lvZx3
	C2vuDdQk4DF0TaimcqLJHqNBBkEoErfdFfPDbi95Ja6cbMutYSeczuhrwgm2hWkfh4HWH5aBv9h
	spiPXww==
X-Google-Smtp-Source: AGHT+IGKZUoDFlUs7UnFcJ3yDWk9AFzzYDvUXtNaquHlXmmfZwUllHrwjbCkgfa7EHky/zlOGo4UiQ==
X-Received: by 2002:a17:90b:5190:b0:2ff:6e72:b8e9 with SMTP id 98e67ed59e1d1-306dbc297c8mr2737134a91.25.1744180748962;
        Tue, 08 Apr 2025 23:39:08 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df2fb171sm577781a91.34.2025.04.08.23.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 23:39:08 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 1/6] staging: gpib: Removing function osInit
Date: Wed,  9 Apr 2025 06:38:59 +0000
Message-ID: <20250409063904.342292-2-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409063904.342292-1-matchstick@neverthere.org>
References: <20250409063904.342292-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch.pl as CamelCase where function is undefined.

CHECK: Avoid CamelCase: <osInit>

Removing undefined function.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/gpib_proto.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/gpib/include/gpib_proto.h b/drivers/staging/gpib/include/gpib_proto.h
index 333f5c62da9e..43d655ee324a 100644
--- a/drivers/staging/gpib/include/gpib_proto.h
+++ b/drivers/staging/gpib/include/gpib_proto.h
@@ -8,7 +8,6 @@
 int ibopen(struct inode *inode, struct file *filep);
 int ibclose(struct inode *inode, struct file *file);
 long ibioctl(struct file *filep, unsigned int cmd, unsigned long arg);
-int osInit(void);
 void osReset(void);
 void os_start_timer(struct gpib_board *board, unsigned int usec_timeout);
 void os_remove_timer(struct gpib_board *board);
-- 
2.43.0

