Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06A71F238D
	for <linux-staging@lists.linux.dev>; Tue, 11 Feb 2025 09:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739266273; cv=none; b=KrPYA05B6K38sC+1EVkwJXl64R554i0hiX4XFnMyR7UFeA+IZA2ofjrXFVgkAFSuAxGwSUrYdn2PE7lBrBz0cDy6/e1BphCsvxTvOnUqEC2HhGH9uG01X0AMpLm1ylv4hoSSRT8sntSqFEcJt1XCyd4R3FsGpaAR7Tjwt/Ziins=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739266273; c=relaxed/simple;
	bh=R2tr/teNelQFSdpQQ6Fd/3FuvFlm5oXSb2ZRFJZSpJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nQWK6W1bqy+kQFANkzhauIZXRKTc3DGW5XQINU+7Umz4A0Xb6XgFT0Xfc1Ymd6HAc87b/+yXjunAcH8G6lHzQ3dcu3Q1OZV7p9rLS0I3/Si7TIRrRZdmYc2DA5D4yWXtxduABXZYOifXmhK15gHYLO4gfThq2H8ap69k/TSVpBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JH6sR6Fo; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JH6sR6Fo"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38dd006a4e1so2703243f8f.1
        for <linux-staging@lists.linux.dev>; Tue, 11 Feb 2025 01:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739266270; x=1739871070; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+dUOtNF+C14dt6CUe7Af3ir1c7oAlJYy1GBvcUH+r4=;
        b=JH6sR6FoxJpQXoB7tZ7z8DvIWsMH8h+UErX9+BuJNEXT6MhO3II1UeCDPCr69HEAfc
         LrlyEx8tlwfsck1JCF0naUWyCIuZQWfYI/90Xt1FxrZTgm0DS9TwUJlJVQQcBR4uRa/T
         2xFA5s6lIPjqIH99JymPHb8u3yVyfPk22jFvvDZencWnpup77hcS0lGXZS5/FdiqhP37
         N8ODAhCfbplzVojQG8gGu9KS5sENSGEYlaVVZf5lWk9gFYSa7eYDj4AMYZRqL2B+//Y2
         9RCjopXOLH03hh2mrfQ0pvO0SVPJRWYKVDDyw8IhIMRTG0xEtfmbPw+U2FWYSA3jLQFD
         7mVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739266270; x=1739871070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N+dUOtNF+C14dt6CUe7Af3ir1c7oAlJYy1GBvcUH+r4=;
        b=RJjxHmWclSEBtu2wDjDnAdPGCP0ISdY77iEJZOaaR1J8n7yFN0LmIKe3Nn+zWV3nFI
         QiU9GwYDBNvh7GmVxYH71PSvcciNAQ4cZnQapRqyuGr+q+YmZqulNxf684Yzu2YKCIN8
         cr3i5s9CJv2yQQw2ACTxRdOOeqGYF0z7xMEWy8lcNNIMDo4L/uHbQGmTxlsokb+S5MF9
         6f/oL6Sgr4XqzygLwI9Vem32OA/K3pAyavoKU4hTsfW8LtxnyLQlHWtRDLhjdEUKbbd1
         G/taqAsuxzhSv1Fqdof0jKl9pPqz8AQ1baC1r4Y+WuIioCxmkrRT5gqfXrbIuzsnoKV8
         u1+g==
X-Gm-Message-State: AOJu0YzJqEPVjRo5c0QFea8pdY411PHAC3Vhm9D4SSodhROkcRa9LDPV
	6GjklVIYttsQvAR06VwLlQUkffmoUAHKC37Kz7CgXgtAZYCKY1vT
X-Gm-Gg: ASbGnctpCTl5G8qjBoUNpsu7zm1vQuYt+P1wUkNP3fJCoiilq4o3R+x4jGtpxBqUT0H
	VEmBOgI/FpfGdknJSnpTm9bQf6tiPQ1uKoST7DzzdCYniN62ffjz0KIuLY+3/3lNGTcJIA82zPE
	IWleMjG5kbPlQC/ROtLo/DLVeJs0J/wA806T+4Hn8PC2XD8GoxpcevGUCnu9Ki+U+fsKjtWZ4vb
	a4/y1RyjJ80PMU4/GRIbtYXNxlNO9jzpitSa1q1XfDZvZuyzyfxAwaTTlBUbTAVTfpH1Cl+XpuX
	uFS5BZJFitM=
X-Google-Smtp-Source: AGHT+IGayxZEPjkNIx8NHOIpTQ+ARq27YFxquSiUQkxyiE8ktL4jjrfZuqpz08fiAnwGa1TzO1vOwA==
X-Received: by 2002:a05:6000:18af:b0:38d:e6b6:508b with SMTP id ffacd0b85a97d-38de6b65641mr771345f8f.9.1739266269484;
        Tue, 11 Feb 2025 01:31:09 -0800 (PST)
Received: from void.void ([31.210.181.104])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd07fa80csm10152873f8f.13.2025.02.11.01.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 01:31:09 -0800 (PST)
From: Andrew Kreimer <algonell@gmail.com>
To: Dave Penkler <dpenkler@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Andrew Kreimer <algonell@gmail.com>,
	Greg KH <greg@kroah.com>
Subject: [PATCH v2] staging: gpib: Remove unnecessary TTY_LOG expansion
Date: Tue, 11 Feb 2025 11:30:13 +0200
Message-ID: <20250211093051.15993-1-algonell@gmail.com>
X-Mailer: git-send-email 2.48.1.268.g9520f7d998
In-Reply-To: <20250210121552.33455-1-algonell@gmail.com>
References: <20250210121552.33455-1-algonell@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When drivers are successful, they should be quiet.

Remove the unnecessary TTY_LOG expansion.

Suggested-by: Greg KH <greg@kroah.com>
Signed-off-by: Andrew Kreimer <algonell@gmail.com>
---
v2:
  - Change commit message/body.
  - Remove the TTY_LOG line as suggested.

v1:
  - Fix a typo in TTY_LOG message.

 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index 85322af62c23..b2c4d1d26f12 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -542,7 +542,6 @@ static int usb_gpib_attach(gpib_board_t *board, const gpib_board_config_t *confi
 		return -EIO;
 
 	SHOW_STATUS(board);
-	TTY_LOG("Module '%s' has been sucesfully configured\n", NAME);
 	return 0;
 }
 

Interdiff against v1:
  diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
  index 1c3e5dfcc9ec..b2c4d1d26f12 100644
  --- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
  +++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
  @@ -542,7 +542,6 @@ static int usb_gpib_attach(gpib_board_t *board, const gpib_board_config_t *confi
   		return -EIO;
   
   	SHOW_STATUS(board);
  -	TTY_LOG("Module '%s' has been successfully configured\n", NAME);
   	return 0;
   }
   

Range-diff against v1:
1:  779e59d74722 ! 1:  463e7000d1a7 staging: gpib: Fix typo in TTY_LOG message
    @@ Metadata
     Author: Andrew Kreimer <algonell@gmail.com>
     
      ## Commit message ##
    -    staging: gpib: Fix typo in TTY_LOG message
    +    staging: gpib: Remove unnecessary TTY_LOG expansion
     
    -    There is a typo in TTY_LOG message:
    -     - sucesfully -> successfully
    +    When drivers are successful, they should be quiet.
     
    -    Fix it via codespell.
    +    Remove the unnecessary TTY_LOG expansion.
     
    +    Suggested-by: Greg KH <greg@kroah.com>
         Signed-off-by: Andrew Kreimer <algonell@gmail.com>
     
      ## drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c ##
    @@ drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c: static int usb_gpib_attach(g
      
      	SHOW_STATUS(board);
     -	TTY_LOG("Module '%s' has been sucesfully configured\n", NAME);
    -+	TTY_LOG("Module '%s' has been successfully configured\n", NAME);
      	return 0;
      }
      
-- 
2.48.1.268.g9520f7d998

