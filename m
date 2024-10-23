Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DB914C5BD
	for <linux-staging@lists.linux.dev>; Wed, 23 Oct 2024 22:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729723722; cv=none; b=OwLetkt+2arrDYMFCynz3FljlYPAnN2UMvLGIER6MNGaWk0ymjlKfuAiIkLRzr95dslbM5nGCp0kPcxg1hreeUPgbHjQTl1mQu88i1bue+jny6lswjcPB6rgvNMYcU12NwEeIGWNzTqrNjO/pqXHbkmxSk6fb0AZmOZxTGssU80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729723722; c=relaxed/simple;
	bh=wxpDHQwrwGkzB2vQpCqlwlMvsNeLE2V/UsRqjafQXsk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cinkJtH0LwjubD6wfmJLigHc9w8Lnnr+zHplA8kZU3dl2xrGZbkWpEpmA6m1lTZcwl79o7AU5JIQl9+qH5RWobsLVNWE9CcXbkmtnsFU/jr16kGh2snMBwKqdO93XAQC6T+YXEQX60xiEBej/T+MhSO4Nx0xmUBshSLRzotN6EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cBnzHNNR; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cBnzHNNR"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20ce5e3b116so1574365ad.1
        for <linux-staging@lists.linux.dev>; Wed, 23 Oct 2024 15:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729723720; x=1730328520; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pvfx4hhe8sNGyNx+56x8PO6ko62UBrDG29CxfNFOdpY=;
        b=cBnzHNNR6E5RZwaSUrNyqo5pL6hpYvQcRzaAnD3ErOgMxSM1wmbtJZIoIA45jeAbTF
         sCu2I3zTH0ULX5eEjlrZLAk9HPVUXpW+iHZqZOuz88P/mxYBrElUjCM3u5bzbNS1DgAM
         lP7Gtu3g/R99dncoj2638S1QzrWl58UiSqjFNtndfhiJDxLOqLJozcs4m65hzauAxTSW
         r3OaSIDjY6D33dTzfzXhpQgxX6Qc2pdw3MPfMsPrHKDPSzSRaJavcNvxJJGWZCylzcXM
         zrGzJRULjmX1n1TMBNebNy4c9M5jckS96f5rxf/Y6hBYix66UuLwIR1j6aDdwT9gupNQ
         hoaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729723720; x=1730328520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pvfx4hhe8sNGyNx+56x8PO6ko62UBrDG29CxfNFOdpY=;
        b=RKzWoTCPexRcCDcmqlD1f2ZYEqVX2ys1gOCJOsgjHJ95Itj5NFF/1zUkMn4vxjq2je
         v0TYQZPihx3bnDe5XSdwXt6ly6cWRooWKC/5BpnzQzBZ5qG3VJ2hdlYIF5Z2vpgR6bns
         iUeswTsdwS5NAINw9u76BzqiVCYmJSSM6xkoNfWZwYIcCLLMLB1yW8qCe+w39U9e5Zrk
         ghgGRf91SVqZxNDAbZZx7bR8aSnAtgXMIgmq5uv7nA6oBwXh9uudFdFNKL0h9AOP0+NY
         Ce49FhyOA5St+qURd2EA2ytzD6KdLyer21MLfCtQLfSjXQgpjl790pcTny9b6PkBxJj4
         gf5w==
X-Forwarded-Encrypted: i=1; AJvYcCWCMFIi7S/3eN7WP9s10DcxtrfVQt4GsOO46DOZyamjvJAoI+DUSk9BTFqN0vg8CWf6NFn/sA4RkDjYUXgg@lists.linux.dev
X-Gm-Message-State: AOJu0Yxthe0PB3phIMJuqjLlKbeGeBuefI8akTGzC2JvEaMR8FARikjN
	tho18KL+RCbiZf1PBIhNnHVRv8lAcaUXAzxWug+bs2tSThPVCGs9
X-Google-Smtp-Source: AGHT+IGZbCiqEOLJCUMgl47AYJePcJt9+VznTxqIG6dPlRBIZFF9qzG7zlv+Ql3cSN/QG0kbsb5Luw==
X-Received: by 2002:a17:902:da84:b0:20f:aee9:d8b8 with SMTP id d9443c01a7336-20faee9dee5mr38522305ad.20.1729723720180;
        Wed, 23 Oct 2024 15:48:40 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:81ec:97bb:b4e6:f236:f01a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0c0ee1sm62196325ad.160.2024.10.23.15.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 15:48:39 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: rodrigo.gobbi.7@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	philipp.g.hortmann@gmail.com,
	~lkcamp/patches@lists.sr.ht
Subject: staging: rtl8723bs: change remaining printk to proper api
Date: Wed, 23 Oct 2024 19:48:33 -0300
Message-Id: <20241023224833.12770-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241022031825.309568-1-rodrigo.gobbi.7@gmail.com>
References: <20241022031825.309568-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi, all, 
Please, ignore this patch, I've noticed now that I've missed
some places for netdev_dbg() usage. I'll submit a v3.
Sorry for that.

Tks and regards.
