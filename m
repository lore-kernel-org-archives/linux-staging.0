Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561311E1E13
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 06:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744180755; cv=none; b=aUxtht54L10c709SAKTVWolnMz1HmUEdAjrwU8wD3RCqW87ISbrN/9ablNXzSzV+tAl/xPYnjJP4uSIk8SUyt7hL/98GUuMTOx9eo56b/7uDRoIN+ZyRbmN4JK5TRLbetjDjnxYpD4V+aMVzxR4HF1Gl7JK0my+qdCqJP9ygFYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744180755; c=relaxed/simple;
	bh=r8TH6mcmb+GwDgOL407oFInNBlJD/dP423X9WUlgNrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ujNIH424ltnOB3Nw8Ta5OyiymMqd++o/aH6dIIBxCgm2gZXGJ7uBpGPxeXDSAVlHNr/85jdch8ps4MY2QJ/WgyDk4EA+6iGzQp6cwoRZ/DI2mS4VfM8SwUQ2ve4iM66sYQbcswRvIo8c1jix2LTzTbdh81BbEZxfqnWy0vLPsuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=fGoP9rpn; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="fGoP9rpn"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2295d78b433so63601015ad.2
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 23:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744180753; x=1744785553; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZcBeMfsiz4GcBol8ax0dkkU7QnHt5l5HklTFHDCQmgs=;
        b=fGoP9rpnTAZBYRoDZAecP0XynvYVitpEeBeV4BRm8EBWEqPRxxSs/k3CXU4xEk5gcB
         Y7aC4oNMuZIGptB/5xsjGmvIyQanLV/I9k6sKNW/R9S8WcaCmLmbc9TWF5bt84zWZOwN
         +b0/Ha5KgP+bTRcCTAkipMGVOEUJNk+Eq/J9xM0zcrFdOTq6cojUCYW/X6UPXGL+fXZd
         jvVyJfsYgg1mZLE7+xPTGjk62QYiSETcwlN5cZMOpQihjxu/LpfZU76LDJYsQVM4mNsY
         N8gDsy+rf8765adLdR+pAEGqdflqGXN5LLvRDf6DzjFL9cX6TazhGZhSrrL6OTuOr2tI
         A/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744180753; x=1744785553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZcBeMfsiz4GcBol8ax0dkkU7QnHt5l5HklTFHDCQmgs=;
        b=pOkYQt3Q8EMFBLjYIjEZlv1pZlnEipmQ1Mo+whunIrDubdBcVkmn8LKNPVzmyDOfnS
         TiuAH801b3yccQoDP1ErBNozhx9ezCobH6E6Gb83k1/lRGqoqJMnNT3yBYxtJJnTehBE
         gyxpbibwdVRxuQEuQGdL6/68gHXouRwT1eZGGuYGlhTBJhUmmGhqWqRYNjI/G6CnZUzi
         GVjgiHjpy9ZtkqqnFAakXs/qctj6sWDWM+OMmngP74vOq487BxRQhRlj8YgYvbsDuCuw
         IeYMno5fIJHFlODGYWnHqdLWbsoeOYU/FgVuzWbSdiBv8tveWjEGDuNEwj74NnJ0tP4A
         wpew==
X-Gm-Message-State: AOJu0Ywtr3CGvb1F782SWcrTxHQ1RUkcAsiKBrw0FQUJGsUPqt//5hZO
	+P8DfudNkY3RH3EuTB9wVY2/o8BMDNn/IL3DaX5yWx+p4CbrmZCnYzwQaMG6ww==
X-Gm-Gg: ASbGncvnX9/kHm+hjSJgvgVJ4PRjwYKEGRE/ydVvsOKTHEAnEYMrfD2V53UyYVXnBbQ
	RxW7NRLmAgVHYL5s5+YegJWJUMHE3wyX49wLfP2iGoZ3L13iqg8Q8r0ofQRdgSzR2ecp/5MBoJk
	RlO1ivDCl0iRVCzKalg1u2+kysVD4mzX6zkwO08t+LJcF9nl7kgiCnxOONJmbudYU5aMFT7P9CK
	5UrcgFe4HwRhGzYobKzEkfBwV18goa+AitV6UkfVsP5L9ZOyO4qAYHVKOgXEDoeGxG5tyiBfhnQ
	zVGEpJrqwYdVXYF0S6Nadfw87f8RoHiEzGnYatSi+DHXGBesK1Qoo09yRgldSrdpZpw80HpcDhG
	YEdSjWJX/uBLI3QX+
X-Google-Smtp-Source: AGHT+IFSAfborwGo7qpfT0jt8vH/cw0np7IWn4rZA1MAlqczEe3tUw0w6bgYMfXGV5GBQXUOz2PBqQ==
X-Received: by 2002:a17:902:ef03:b0:216:794f:6d7d with SMTP id d9443c01a7336-22ac401078bmr23441305ad.48.1744180753652;
        Tue, 08 Apr 2025 23:39:13 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b65105sm4235595ad.44.2025.04.08.23.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 23:39:13 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 5/6] staging: gpib: Removing function ibaPrsp
Date: Wed,  9 Apr 2025 06:39:03 +0000
Message-ID: <20250409063904.342292-6-matchstick@neverthere.org>
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

CHECK: Avoid CamelCase: <ibaPrsp>

Removing undefined function.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/gpib_proto.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/gpib/include/gpib_proto.h b/drivers/staging/gpib/include/gpib_proto.h
index 73d7c7ed25fc..fce33f5715fb 100644
--- a/drivers/staging/gpib/include/gpib_proto.h
+++ b/drivers/staging/gpib/include/gpib_proto.h
@@ -22,7 +22,6 @@ int serial_poll_all(struct gpib_board *board, unsigned int usec_timeout);
 void init_gpib_descriptor(struct gpib_descriptor *desc);
 int dvrsp(struct gpib_board *board, unsigned int pad, int sad,
 	  unsigned int usec_timeout, uint8_t *result);
-int ibAPrsp(struct gpib_board *board, int padsad, char *spb);
 void ibAPE(struct gpib_board *board, int pad, int v);
 int ibcac(struct gpib_board *board, int sync, int fallback_to_async);
 int ibcmd(struct gpib_board *board, uint8_t *buf, size_t length, size_t *bytes_written);
-- 
2.43.0

