Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A0C5336D
	for <linux-staging@lists.linux.dev>; Wed, 12 Jun 2024 14:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718201319; cv=none; b=iSLo8DlhRcROV/PEd3i5dnbBwOfwKa+8yeTPlrNgSSN6sSxVp1ugpmKRKX1sgeu4YewZzzVHWk4PhSI+UHeCMgqOcjK8pUKnTXPlo0xYsilHp/sNQexG8GJ3zwlmf7lZdxwfhXDiJ6ZA7Dtg5QJKIBRlZpCotI6OSRDx1NtL5Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718201319; c=relaxed/simple;
	bh=EpvtIHS1PelMca+SvWG7puAknhHjGxVB5DFPtxmwnCs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RMmDMnZjckOE4BbBObFKe6vBZsDXcVewBXV9qKVF4FepiOcpE57UYJoqIEK1aHQUzgebx8H2mgq1qaePWks2xrTwhNaJSRVkbrv4WzAuubp4s58yiPNTuumd3AbszC1zC7fPMLDZ+B4mwSRVL8NtxYLZsqnC7w+buRcSpF3P4KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SCtYPfTI; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SCtYPfTI"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-421a1b834acso29140875e9.3
        for <linux-staging@lists.linux.dev>; Wed, 12 Jun 2024 07:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718201316; x=1718806116; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HObF6GyKNBlnlVP2vyDjiuSpWYXmvpX4Hwsfl7m9FPA=;
        b=SCtYPfTIg0FGohV4prv1Ti84I+a5kpSPeX/yLY9t2God8Xqs2fSvv8gx2+GEGtuLn2
         OjxzNPnUtXu1Cf8ZSSxRqbE7pMs9Zx5RboUlTTh0kRJvvAKAZzBbapMrjOy6BGaZ7W1h
         S0Q0/5WQsopObmQBNfZTkF2k8j3xEVWrnS1WtZIZYHN2Ig/zxFNWoVD5qgZAafQDoNdt
         P2uR/eYkL+bRJL+LFdT1I2YsSfWzGPYgPC8vOFdpwoVMJG6YcXBYB2LMkjkjaXdvtySS
         tekTKFcamh+jYdgiVhJdR4w0GpwxkIgikl1amXM2lQtEFf87OHoDMYr0GNPisWoEJnq5
         v7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718201316; x=1718806116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HObF6GyKNBlnlVP2vyDjiuSpWYXmvpX4Hwsfl7m9FPA=;
        b=WfPbZ6/dDdrjw5opDhZZlI5ftguEqXwv0s1m+RvRHxzn7BlIdvOlWHlmIGcsUcxh5Z
         ux32XIZ3WPOGU7DRYejFKpsePtEf3bbjk6KqXju7K7p4Bv0TmcfW5RSyO9uKAMy+lFC9
         rOk7I+8RUIqjYGV/zvQC1+Q+bhDiROhryiggB6Vdn3ZMeXLZHDqDlCB9smpqnlHVu2Op
         qzn+A9yYKae8fS7mjczqCHVqBj2mIQwP3zV0MB4O1KjygrAwKmU+dakkTn5c7f1LNzwo
         k+jbYI+MErSktrDiTp+q5RtW3HUIhmI+1Q+qPlxxhLOtugGDfDzsWYwDURfMgPGqKRq7
         KETA==
X-Forwarded-Encrypted: i=1; AJvYcCXpGq08Z/CBIitFRihBBpYwqzjvmNRLGavu/T6iUTLJ/F2rzHPvkS/wSZ0l6Jd8nW4PB71daQKb/xDV5FphoWz5/YrXgZFBZwOhDYRYpw==
X-Gm-Message-State: AOJu0YzCKrb87SmlXOOvV9HVReAxjx18wGUkNQUtlpmu/lbLFdOh7oB3
	oEk5p/PFYODEQW5sIOJsSTNO3Y6R+OdBytbabIDCRN7FWKijJ58Q
X-Google-Smtp-Source: AGHT+IGtyhCbkkyE4wxl92np4Yd0e/c4iXM7sZBxzrfswg2WrQiy8hXPAmQ9iuPCrsi0sQcRtMET8A==
X-Received: by 2002:a05:600c:4e04:b0:421:29ab:1605 with SMTP id 5b1f17b1804b1-422862a7461mr17234685e9.7.1718201315631;
        Wed, 12 Jun 2024 07:08:35 -0700 (PDT)
Received: from localhost.localdomain ([31.120.167.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f2f67b5b8sm4023796f8f.12.2024.06.12.07.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 07:08:35 -0700 (PDT)
From: Teddy Engel <engel.teddy@gmail.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Teddy Engel <engel.teddy@gmail.com>
Subject: [PATCH] staging: vt6656: Remove line from TODO
Date: Wed, 12 Jun 2024 15:07:35 +0100
Message-Id: <20240612140735.2423-1-engel.teddy@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove checkpatch.pl line from TODO as no valid checkpatch
recommendations still present.

Signed-off-by: Teddy Engel <engel.teddy@gmail.com>
---
 drivers/staging/vt6656/TODO | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/vt6656/TODO b/drivers/staging/vt6656/TODO
index e154b2f3b247..876cdccb6948 100644
--- a/drivers/staging/vt6656/TODO
+++ b/drivers/staging/vt6656/TODO
@@ -11,7 +11,6 @@ TODO:
 - switch to use LIB80211
 - switch to use MAC80211
 - use kernel coding style
-- checkpatch.pl fixes
 - sparse fixes
 - integrate with drivers/net/wireless
 
-- 
2.39.2

