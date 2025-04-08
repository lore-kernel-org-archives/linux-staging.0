Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729B52571A6
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744150855; cv=none; b=PXUZJP1jCym8sHyjzWOP5LRkDstOPoMkFWFlepxJUEObcPIcyNzYNOY1LcZ2HTyNAAPhMhg29DSQM3InmLAFGjBESyu/hRtfBmSBc6zHIhzBt447/8y3NVeylWjNkdeA8CsjUcC8/LqIy6DsZ3E3XagY7Pa2baI1AJTgUiVmpBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744150855; c=relaxed/simple;
	bh=jF1a24mfxL1jqFtVcwZ6+GluDtbO5GZ51S9pedvlPxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MbwqjwRQBVT82A/b/X5+qG8BXCCeE9sznYjn4LfbaKlxa5DZXe5NRIYFnfwoUG0YWLCBV+c7jDn47ZYkYSzT0zFaZne5vhwtxMUeR+U9uC7L08liOceTJuHYsNc+hYQiR+qbm6XH//fMeEpxAQZdXxjJcIbjgskVYVk2RkvjOSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=HqqtYzcl; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="HqqtYzcl"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so7219203a91.3
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744150854; x=1744755654; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33nZ6O0N2cVQEHFgAZzBVBerjSy6t3qmg2lY5yN+LEg=;
        b=HqqtYzcl4eFUTlA1yzz5YQWW6BfznYWc4eFCXVfHQ2R2zqigmiT0KFariwvgKJrA5u
         2OuhtF9yIyADSSJe/n6WAjBHuVWEPpx4w6lOMm/Nk6IVOt+pMWuN36kJvkS4tRM8hRLL
         0Wh+4ewq4bsWl4fuBo+c1lFKX4LChg+WAfvvxWSJiop0l/aRAkkPxzePQzwHdrk1Dp+B
         RLhNKkoBF9vm90nid+xJKQ5/lM9k1v80vqTdAvvJ6SHP3ZKl1k1F2tobdff3jD2NPpON
         tthYs3xLtetb/Bg1qk5U15ls6q5uC23MvY0cHVoFKSx0ee38J3OLBmAKQHRaCJ9ryBmH
         p4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744150854; x=1744755654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=33nZ6O0N2cVQEHFgAZzBVBerjSy6t3qmg2lY5yN+LEg=;
        b=OLgoY88H4Ckhg87Eyt9b51CQVkmYRs1y2PmR0T5Vu+8PMDgyV8mgaZCT6/ygpYc/66
         luEVQFJZnLBa61c/VU33LMbBFNylb1oT1uv0b+72SoBqFP95z+gYcYS/BGcOswOSu+1g
         JH/yD6iG4AtWfFxQP6O6lcVCrS8YHckENwyB6AMxLSK37JWorBVKFHWYnvLxOzlRlmQH
         UevPgdzhWr3ulctQxa3FbKOtKatOoLDnbNShRVLQSVcfhTkFUh+0hBbZaG8GRv8IiTfb
         ljN5EuLF0UkXGIVgUzsjUX4LuS50OMrl6CU7lFBnSBZcVqR3JNqdjI97HhNo0mzI+D0N
         QkeQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+d0efJFclyisYB8WknP93i/EwXdGeaz1pvwlOBsBkYxmsCHklDOQDkqmSXSuxvsw86dq+62WHMXgQqFzH@lists.linux.dev
X-Gm-Message-State: AOJu0Yzuf/FEZj90O9H+BZNod6iEaqL02ZWArFTw33MvpdK8PF0CKQme
	hJMfd+rxMdDkBCLO73Sue+MqTA2q5BPEpekp6pUAu9nYUZO+q3D8QdfR+ewcUg==
X-Gm-Gg: ASbGncteaKfD6oLrJd6QbbaNKR/K1veIEYKcBVHLwntjX6g3iigi3CrriCDVLxeBve3
	BBvQVrHihKICagNHqxGfIYeFVnbacEs4OXRnh8Jwd/HG9iiK+4nI6C4eZIOC7DNHL4AzQzFCZyB
	QYa51Xv4VCNOPjN6tCV6NoW1/wP9ej0fV14m5bR/R2TmN1cwOPypm4UTEmBw5+pkfVgk8oaLuaf
	ZLTXA2TN7YqFuR5ANe5STWifDmjQQFs6g4TRMs0/PSXhO87o8z7SCj4Hsy9MomSL51UV+c9bRU5
	1fZWMQBB370XM7A1W6jEEu9ySjCbNnj+r15nVoWly61IvraieUqWjYw6aBWaSFcus4z65/LLKBK
	ktsEe+CQewg==
X-Google-Smtp-Source: AGHT+IGmTYIn9MZF+CcfjmeOhPrs0VWePDsbnp6cm2nW32efb/mbPpwmXL8dS1aQjP+HF+gfno1OeQ==
X-Received: by 2002:a17:90b:58e5:b0:2ee:d024:e4fc with SMTP id 98e67ed59e1d1-306dbc3b998mr1333320a91.33.1744150853918;
        Tue, 08 Apr 2025 15:20:53 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305983b9cefsm11565164a91.38.2025.04.08.15.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:20:53 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 08/14] staging: gpib: pc2: lines exceeded 100 columns
Date: Tue,  8 Apr 2025 22:20:34 +0000
Message-ID: <20250408222040.186881-9-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222040.186881-1-matchstick@neverthere.org>
References: <20250408222040.186881-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux kernel coding style.

CHECK: line length exceeds 100 columns

Reported by checkpatch

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/pc2/pc2_gpib.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/pc2/pc2_gpib.c b/drivers/staging/gpib/pc2/pc2_gpib.c
index 96d3c09f2273..5ff1d52c14e3 100644
--- a/drivers/staging/gpib/pc2/pc2_gpib.c
+++ b/drivers/staging/gpib/pc2/pc2_gpib.c
@@ -106,7 +106,8 @@ static int pc2_write(struct gpib_board *board, uint8_t *buffer, size_t length, i
 	return nec7210_write(board, &priv->nec7210_priv, buffer, length, send_eoi, bytes_written);
 }
 
-static int pc2_command(struct gpib_board *board, uint8_t *buffer, size_t length, size_t *bytes_written)
+static int pc2_command(struct gpib_board *board, uint8_t *buffer,
+		       size_t length, size_t *bytes_written)
 {
 	struct pc2_priv *priv = board->private_data;
 
-- 
2.43.0

