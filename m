Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E9A2236EF
	for <linux-staging@lists.linux.dev>; Wed, 19 Mar 2025 22:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742421604; cv=none; b=VsUu7xHO86XjcGG6R/HHQDCzObHR4RH4Ru66KlrAPXdYQK2EXN0gOB4TRhAEody4VqHwzhf8tGqPGmbjrcktDWBQEUhRYoGbnKeZZ5sg++aGWN57FBusOwNS0+BqJAhpKCRjiE6B/WGZr9uTRjoySr41hBsGn3Te5c3+iHefSjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742421604; c=relaxed/simple;
	bh=VbdeLRZV9ED0o/Bxs5o9aDMhEvtIGXCWX0egsa7yiVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ro+WC5WamfNiwOCGNbOh76No82K1qjzvaL+wofDKzl+ZG+nLIRc29jD17KnwzrQzknBMSQg/zl1yRKDROAQbFTaYCgVngzoZb1VkTx2sjsgKQegvZ+Me5pjQAE3506b2NxCIOp7kdK6YIVJyO7DnbLBRrbVHkzNksX2+hOz88CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=hfS5lQh2; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="hfS5lQh2"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-225477548e1so970035ad.0
        for <linux-staging@lists.linux.dev>; Wed, 19 Mar 2025 15:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1742421602; x=1743026402; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prJ1TM7FQQCq2HQpbJ4AVBwG2iHEDTkPGfRD+WVuSQ0=;
        b=hfS5lQh2HSvz+pASMrU8FnTCUGj2AgjHK8WKv0yBT8ZgPT4bApyRMu+khZLkDRf9tr
         37dPtA3en5Z1m9mVX55qqnfjjbatrpD8DEoKBTw6jjaFm/1CAitmq9aPi035cDC5q+0Z
         7M3C+xRCbf6EOUokPJoITnAMmpenCND/RzjRdPpgsamSf+1SWSXN2Vj795zy1nP168NJ
         XjilCdAcVTBNa5fcROgo/E56+JVVVhh23VYhjiYPMqaOZDe00/l4E+Nokx01J7q2+bXN
         L9s0CFUKACmTFeS9QBSUpQvjs0Lryx9Sa22B6r3/w49QqOwNvftDvEPESVDr1yfh7+tq
         reGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742421602; x=1743026402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=prJ1TM7FQQCq2HQpbJ4AVBwG2iHEDTkPGfRD+WVuSQ0=;
        b=uX7y8jHBFgwsRi0z75g621F/bXO5OCZPL6tE07sLWQtODHfpEQs4dLcRhJJMWZh5L7
         A3C5I5lvRzHlmrp9r09lo4JFxsmZIBhqdB9/pWn+PX/4GBMBcFZO1w9oO70gp6JvOkia
         C9KSRbEeOcstXPYFHOVl54oj/Xl/eoxJJY9PUAFeO9D7m4AuZmYhz5mz025StMRFztNU
         MBTlXb/a/dTSS5da94R713AqZibiDASsbtafagJXlSI1usKtzhE/9c8nV+Pm+8ICQNvo
         gTQcXPL4t2O4LOq07e+qvngRY27e6+X/Dg3sNEnVYaSqdl6DmAoq85tbVs4ZBMjIB6UY
         dqNw==
X-Gm-Message-State: AOJu0YxVgPYsAJBQYPhh8ee5jRoeiphc7n+S6jxGqa7zvGTDQhih7m5V
	IRCgK4KC8hPwzuuM06IX7UPohZKVG/UVM4z5ikXqYqVu3xaKJb99ytXBNx8B8A==
X-Gm-Gg: ASbGnctY6uiJokcGl5zPL2dPm6PQAnBllQjKwBt3hC/AbsY2cP8A1LqHFRUDYQcVrxG
	YKDKOVXQrv21pwR1wIsoJ3aMhirvvW4W2PMd23MVS+K8T35scE4Jo3iSGa5MavxASeu6oVVyLD8
	jU8u6gf1xA9M511z27pNfQAQNwyNTZoLF5YKg0wtxvS0YvsbYG3vZfwDFh69Q/+3OGfXcsz7Ui8
	mM8B+m/OrJc5X2380ok1Wqit2jOmgT9NfNyFVTNKdtLWArqVxUCcdX4RQgZbNrafsZY8nYs1JZ/
	hdpRG9iwysRPXzLe+uZhtryTECtfLrJ6HraP6mgmBWhf4uAZ+6GTLXUKdJYdigObH4ieGo8M/K9
	dVgTL6tEyzQ==
X-Google-Smtp-Source: AGHT+IFibFrspTU/Sa0g0di0JiPnyclzEvmMzIUQgoY1Fmh41qCzcBS8NG7aSZ/+vqVHMo9ZwlrHCQ==
X-Received: by 2002:a17:903:1d0:b0:224:216e:3342 with SMTP id d9443c01a7336-2265ee8f6c6mr13197075ad.43.1742421601806;
        Wed, 19 Mar 2025 15:00:01 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbe884sm120346345ad.185.2025.03.19.15.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 15:00:01 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 20/20] staging: gpib: Removing typedef for gpib_board
Date: Wed, 19 Mar 2025 21:59:24 +0000
Message-ID: <20250319215924.19387-21-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250319215924.19387-1-matchstick@neverthere.org>
References: <20250319215924.19387-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removing typedef as per Linux code style.

Adhering to Linux code style.

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/gpib_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index 515fdb91d150..31b35f2cb2e1 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -23,7 +23,7 @@
 #include <linux/interrupt.h>
 
 typedef struct gpib_interface_struct gpib_interface_t;
-typedef struct gpib_board gpib_board_t;
+struct gpib_board;
 
 /* config parameters that are only used by driver attach functions */
 typedef struct {
-- 
2.43.0

