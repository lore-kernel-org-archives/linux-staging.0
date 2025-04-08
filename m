Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FF21DF99C
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151112; cv=none; b=Rq+G5bzE63aZzcgsn5Jtc1UoaiGiQ0srv5i8cgv3vyRmQ8yIvNdIsFZrP/QyEMpb2wrfRsBJd72d0PnrTFm1/GaMmXIBjI/7C/dsKS2CnGJf7NNC9axWfNbkvZ69ggB+vPjC1uM26mLNnSMuc/BSnRcXWZbq730GvUSzDPzpT28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151112; c=relaxed/simple;
	bh=zBaT4vEsCW9WabioGiD3eVnIPOZk+030v6c65zQMLr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WVBiHehZXwroPBe4ekVQUWZ3Hb53ZzvSh2hgTxYyHwKOYbQB8Nu/gviC/YrbEZfrysl2HxMeorckPHY0USxVY1fVBZw4bj2zU2yk002ZBwjV9GoY494R0pY2Uw14FyX4Jxzsi9MASNmOHSESFQhef5JPtpA+BqDCIYTiLk3G6Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=fkADnZ8B; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="fkADnZ8B"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3014678689aso5128591a91.0
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151110; x=1744755910; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+6UevCyLnjvsWBFbzNWa3AXPSyQaeuqdYb/dtZs/F4=;
        b=fkADnZ8BYgQYuTGPmfQX+pwC9UXQUuw8PQkrKh8FDbjSHHpnzTM2hk9WZ0PRDa3FEw
         PknjgPRAy2w+Mb6UQcZcEFSgNEO/jhz27N7suVIsesDydtOFj4b79/f2rZRqngkUnX2q
         NOElW2fkhhfj3RSMx2cQWypaQ28UIKfDB1Jocf0DWHA8K7Bu2RGy6EwtL3n6DJ9VjEfb
         N8FywYW42AtqYiS0oYiVdn0HtMGRTCeGPjTW+7ywmkNwM2XN8dgMf5iE4zQXlg+L0UL1
         goDciRSMXRhNIz4IXt04iZSV0IXEOO+6nHbNBCOmpvYWNE4Pr1ugN/qnVEAhmDq6uI51
         XlDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151110; x=1744755910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+6UevCyLnjvsWBFbzNWa3AXPSyQaeuqdYb/dtZs/F4=;
        b=Mu3J4dx0f2f2lhS8iMPPIgQwPbfedKHe/IcwN7y56BBBnl88ISantfmXDFH+zDezaP
         4i7VAr/MwzTeFKKIR8bBW2tO6/puurOsMBNXqGASnOZPOsbqi+H6FZoDrEj0wbpqE0dh
         X+eDuQ5Q+YCg2usBZIHvNoxYePUbTmOq16IXCvsdNGzZUQzDRUFCL39QrNaRMQHEMy3h
         nnH+Q1Z7bH9SZqCWQUg7MIIVaQonqWEs0On1BZ19ON33IMCQyK4kdV8RtXa+zvDx+Ih7
         F9aHI+OSWarXQvKbNTKlizT+jABq4BTeLztzVh8yix1Vd578jHyZlrA8YnhNwr/ccs3z
         YJVg==
X-Forwarded-Encrypted: i=1; AJvYcCX+GVw8Xe7qO5xoDZ9d5Pot3MGFIggRij42PJnAwB7HZqJwgLVvz9Hi7NWrvMp2b/s8qoG1EdwJbYRp40Oj@lists.linux.dev
X-Gm-Message-State: AOJu0YyiSLD7H8AOiPGsHterkiD/yEUiVy6opY0isNq2MGO695BqVWRu
	//nCuIAT7oOaQc1a/aZWdIu8O4DNv6FNZjSRaKMYsszA5i8m2XHiqQfwjmXJqA==
X-Gm-Gg: ASbGnct+9A5syD3ZGUA8+FXU4/lLbmFuB5Qm61jq7W8HaVyiFAE3MuUdI1THrv9j0FY
	omiTKS5WS/PP0fKSDZ5pc+4p4gzgkCA5mXrVB3q7snTmp+CrSKhn/2DegTY1w2Blp6YBhWvzlzY
	VfTxS3f/h9Vf9qVE9TGjLfIg2awNy8at9QIryb7hCMbuL19nJlV2RPdAOzpPuFdx1jZmkUqJlrL
	sKZTAkZdWSmPin4N2ksJmsPqu+ex9Jx18pZ8srUD5zVeChswtYeKjrHmceY4JPTj0r2du9Cyqqi
	IptEYlxZF4ts+D3ZFGqST8gWI0XIknINuh8jKXl98cZYEPgL4A205pzUszOzLM79dYsChI0C7iJ
	0Gun2YvaJzA==
X-Google-Smtp-Source: AGHT+IE+BRpGJQpWMRHPf266YMAqNBHhYQqHdf7mDGI2jGj+pgqv++XJKzlr2H/xRmZNYQI9+lIlcw==
X-Received: by 2002:a17:90b:4d0b:b0:2ef:19d0:2261 with SMTP id 98e67ed59e1d1-306dd52cademr217788a91.16.1744151110296;
        Tue, 08 Apr 2025 15:25:10 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd12b4bdsm92176a91.27.2025.04.08.15.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:25:10 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 01/18] staging: gpib: struct typing for gpib_interface
Date: Tue,  8 Apr 2025 22:24:47 +0000
Message-ID: <20250408222504.186992-2-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222504.186992-1-matchstick@neverthere.org>
References: <20250408222504.186992-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for gpib_interface struct in .h to allow drivers to
migrate.

Adhering to Linux code style.

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Reported by CheckPatch

WARNING: do not add new typedefs

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/gpib_types.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index 2d9b9be683f8..10d8776ef425 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -22,7 +22,7 @@
 #include <linux/timer.h>
 #include <linux/interrupt.h>
 
-typedef struct gpib_interface_struct gpib_interface_t;
+typedef struct gpib_interface gpib_interface_t;
 struct gpib_board;
 
 /* config parameters that are only used by driver attach functions */
@@ -51,7 +51,7 @@ typedef struct {
 	char *serial_number;
 } gpib_board_config_t;
 
-struct gpib_interface_struct {
+struct gpib_interface {
 	/* name of board */
 	char *name;
 	/* attach() initializes board and allocates resources */
-- 
2.43.0

