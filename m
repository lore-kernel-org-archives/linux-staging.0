Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51612586D5
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151841; cv=none; b=N/4kDwRYhR/aW5xaz/j6JANLUXApRtOXORuWxPHwxVNgbY6hlf1rby53KyklvWripfLb4Bee/SYbdrCstUyyJRLHBzVpeWCnEvtmJGJ0jAF7IC89+5fh5iK9/o4hhuCIGSw/Q6PssJ1n8HS9k1RFNqjNXW8FyybL4+yAAYizJTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151841; c=relaxed/simple;
	bh=7F6FhaL4ogWcnxhKShNpnm/dYuOadJGedBmOtrq5hbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IkohQYSlLKm2md4YKEnsM9VD5LxfuBcYNhb7BTHPnov3UZYqIe71LtDiX4Scp6EC4b/Vy8kyqQPYd+MwB/RFSmaa64+bBQgzEovs+2d6SRSOKwnmfSj3BZzEw1STvo9E+oomuts80QlsjwS3D+pVkPkMDXzLbtYt+ZzZsOZgfQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=DV/HzTbM; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="DV/HzTbM"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7376e311086so8169936b3a.3
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151839; x=1744756639; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+kyrdUmFMRxwM7TLfTUq/Q5pqKH9DQRyxYg9eWRSlc=;
        b=DV/HzTbMNn6JOZm1riI0DLmcaUuRJKfqlpfxhhTJd7uquv3BxaXu/mU59ITDS89ifD
         mrDvDlXZwOm6wmL3ogZ3jWHmB+D2tEArwc6FQjJpcF+W/7ctq7TFxuIGwobHoCSuqT3z
         G/W68YNBgn1rJAsi3HG0JoA2eHujSgE4qdRLa74Wqkw7KSkD1KqHeIHyX50sbhhB1wL/
         3h0fXVinxJXdz0LWtYLyPuJv4evB56cxPZFl5rR4nbzEUO8o/Px0yotarAtGQ6NIGnjf
         IXKIYArFa4usJtMZHQbuix2DQ6UL/Kdy8oBTOzv7ycMjU5ZPDgM7bp0hGmbQuYZC9GmY
         GeUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151839; x=1744756639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O+kyrdUmFMRxwM7TLfTUq/Q5pqKH9DQRyxYg9eWRSlc=;
        b=GxGc43MR5LLdfi482ZiOWUZ2Pl2rdRqQun61Rjhq1U79ZiO+i+6fRtPNh5fesCJMsg
         0RQKjBGlcZui4ieHPmmzzjrXH9oOHWx07ScSz7CWdfXAheu6c9V+JzX+er9ZerukmalZ
         eL2kuK+vCyVeblyDNH3kwnqVvcDfbb6aHPgimwy7PeRJn+4cWMfyFZ13Tf0ohk9Lxylg
         yuIMKD6yNqYLUyZzOklJZoM52S35O947K6DS4HOdEWIdNlBGKB0L7ZxMYmpJVZ0gRnor
         MoUCW/58jOnLdokeSAJdQOjwPfU8mTIuoi+ntDbkRagaDCOODCTY4KYuSg35a/T5bVLd
         R6hA==
X-Forwarded-Encrypted: i=1; AJvYcCX3qusWuVG3zIUAfHRskA14FO/bSSN2GU419Q+W8K9FQ8jRwqa3KNL6gU926mXOYx7zB9zV1I7UGP6pDuVE@lists.linux.dev
X-Gm-Message-State: AOJu0YwO5ffNq6VyhiCCP7vgVleZ0Oehq5dhyuoR52frYvxxkTUk+4eq
	TRSbOAJwqJl9cWHqmmFAx9cFws2qXUQdig35yQ/3c4fGpNfnZN01TpQXANhyKpKJGvYY7f7bseg
	=
X-Gm-Gg: ASbGncsvY3woDILxN6uIUq44TX/bhd4eBU7h17ED8Dz4qSNg3sLZq+nVVn0tyALltgr
	+unVko0I6t5Jf8yEgZmFRIiS9tIrSo8adUZsRkRLbbs/8MhSA+kNfE3uTaVofgxYexwOuja/+OI
	Z8MUOB1qSY4qHisSRdMz6MI4W9Wuh7JG3bRF0/E9skW3fM1OwPOzlgQZnXr/8FgJnMaj9xj4peI
	WmBQpmb44nN/zlR3bbkhed2g/N/jW7tj/z+5ZMLqDqGsNm+YDoe1RjDJCxihkqgW5tJMwhH5H5K
	f625k7JDBIHo4duG/lqT6OtMi3pxTPxX7PB1rARd9u4MRI8gzu/bemxRtwcNCQFsYOkOgx6DGEJ
	6JQ+Yx6AeoyndrGe1nb6k
X-Google-Smtp-Source: AGHT+IEHQS9JC2mKiQHcrs2AcKO96cjryH9ihDw9UUcv5vUP+SgmmoGFg6vz1axdsS/RsAHlHf0rXg==
X-Received: by 2002:a05:6a00:ace:b0:736:4b85:ee05 with SMTP id d2e1a72fcca58-73bae4d84f6mr799363b3a.11.1744151839039;
        Tue, 08 Apr 2025 15:37:19 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97ee90asm11550584b3a.57.2025.04.08.15.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:37:18 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 14/18] staging: gpib: lpvo_usb: struct gpib_board_config
Date: Tue,  8 Apr 2025 22:36:54 +0000
Message-ID: <20250408223659.187109-15-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408223659.187109-1-matchstick@neverthere.org>
References: <20250408223659.187109-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_board_config

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index a4bfa95357bd..fa185171cc69 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -384,7 +384,7 @@ static void set_timeout(struct gpib_board *board)
  * detach() will be called. Always.
  */
 
-static int usb_gpib_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int usb_gpib_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	int retval, j;
 	u32 base = config->ibbase;
-- 
2.43.0

