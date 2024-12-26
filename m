Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DB1176ADE
	for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 19:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735242575; cv=none; b=IM8V4b2hhxsLPXNEKBZ6/F8Q6s9NfMAO9sO/Hp4MLWjXPwY6x/UH5CLgd5hLuKXBf2dXsLaDKPuRXR9gZnryLibKzMGt1oG1OyQe0kci5uhC2tqU3xV4FGDWPZjFJ0+L8NDEW5X4Ewj/7SxWSu1PU4EOaD1WS1uiM5lInB/PAt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735242575; c=relaxed/simple;
	bh=F6jz18fUTt/WGUdJMn78AT7obmibKSnGAl0CjYbQlsY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g5kiBuRdizVMeDxvqQQBjs4JnY0nxR8f4KtpFD8hhIxzNqX0UmX9/sPo3lKSkDydIkQX791IYx/rJKp4A4hPJKWODUJAQAb+dCYvt05JsfU0XXzc/0QJbTgFTG0PSR8O1/HH61W2XcNWG6WVlHkcIg/anTqzVJEBdxKpwZmU65c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OAeMI4pT; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OAeMI4pT"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2161a4f86a3so7919625ad.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 11:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735242573; x=1735847373; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXudBEfa67ru92hiSni5t52owHUXzQ1TaFPBYkz21dA=;
        b=OAeMI4pTxtfo18W8JeriECUcbF1Z1LBMWpVydv9DDaS4tZK9N+bai5DEW/DqnjH9vD
         nWDWAEs8RIvfOi1xZ2LVk0GF8jNO19uO8JN/dDPgW8d1hXQX45QeaeNsRUL/jo8OfLSk
         +kdRKgzlnTrtBGOaRu94CrgrdYaIM5aoWUEM0jbt8ymjWpisHUX5O3Dp8eCNb4apczDY
         zLlJYA/JRbpMEbmelHGX1UNDFyvCMEkGNxsAEtD3pEGpz8srRxsqt02V8nfUlAMOje2W
         HYTQzk/KVB+K9UXMTTidjYqySjerWCOr7uGcfpoIbNtFCWVd1llBbu4C1j9KsPcrx2+7
         80EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735242573; x=1735847373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dXudBEfa67ru92hiSni5t52owHUXzQ1TaFPBYkz21dA=;
        b=U2jXyl5f0wIeeDQd8Uf2tUac+kFs8KC2hNBD9Bw6eewgsIfBhDsvpaWWgqoE9tDzEs
         Sd1Rn1Hy3gN3DUw8gNNb8lLcbvHxe/lMIGjOKVzgkZuqtjM+G1OG6CVuobVZSUEhiKtv
         uFv5MKXHzN6HbEFD8uQsibKxNkq754JSrqMZPiEBiBlZiLeDyWrMB8Antefg1JBUy3Bc
         3OGqTqls8SyATtApgAE+6xFTD9WJYSyxQghlYvBPrIHt49rC4Px3wwOfsd/BFEfNdwxT
         13qktLZEqC26/LUD7QZre/ApOyVq/fdbLctndVvXg38cdiwaSdnAUP96yDQeIN1HUbuu
         AfFg==
X-Forwarded-Encrypted: i=1; AJvYcCUYYBJtz8kA/TLh9IsaqSRVGryTIJfqTb4DT74+vAi7ofDXl8AAdnjCF9C4C/IoyXdXd/qYZ/W1bVl+8c3z@lists.linux.dev
X-Gm-Message-State: AOJu0Yx93UnvGaGuYp6jTaXsfOCgFMwhAFV2SPTutOkKUc+/FpYqSblP
	tHDvENDlmyDDIoFY5aJ9EtoudFnlo+JZsQ41k37bM6k4SQtuWLCH
X-Gm-Gg: ASbGnctlWqB1kFDS/I3B/he2ymkc+GbNzIJ6/tlLXcbXyaMgW0dunZm1l7qfSYE7v2U
	8dyVPOttNoVtVBQSjST0oqP4UCtBb94bWFJHc75hOvqyk1Yh34jeSGkLjk31BE4KF4ZsV8aVxE7
	LXuE/nZb0CrGRoz+WgN0SkRfHrWA7IGHNQVBb1HyXJT3KpA+Z8tiAo6Kv/0y9JiqNUjA5qLqowe
	0XJmGJb6X4uZW9G17IpW0H5Vk+38dSx4EYI7185unXlpPeQLhT1a4k=
X-Google-Smtp-Source: AGHT+IH3zYa80e14n8q/Wa3gLe5UBUTz0L0/+2YwKF6kv1M6pjd5UyvW0VCbPzjIjWGPQt+KaCteaw==
X-Received: by 2002:a05:6a21:3991:b0:1e1:b1e4:e753 with SMTP id adf61e73a8af0-1e5e047faefmr15388272637.4.1735242573425;
        Thu, 26 Dec 2024 11:49:33 -0800 (PST)
Received: from ice.. ([171.76.83.141])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842e35d4becsm10304580a12.79.2024.12.26.11.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 11:49:33 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v4 09/15] staging: gpib: hp_82335: Return error value from gpib_register_driver()
Date: Fri, 27 Dec 2024 01:06:33 +0530
Message-Id: <20241226193637.241049-10-niharchaithanya@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241226193637.241049-1-niharchaithanya@gmail.com>
References: <20241226193637.241049-1-niharchaithanya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function gpib_register_driver() can fail and does not return an
error value if it fails.

Return the error value if gpib_register_driver() fails.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 drivers/staging/gpib/hp_82335/hp82335.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/hp_82335/hp82335.c b/drivers/staging/gpib/hp_82335/hp82335.c
index 40afe42aea47..1fa7bcb7d8fa 100644
--- a/drivers/staging/gpib/hp_82335/hp82335.c
+++ b/drivers/staging/gpib/hp_82335/hp82335.c
@@ -325,7 +325,11 @@ void hp82335_detach(gpib_board_t *board)
 
 static int __init hp82335_init_module(void)
 {
-	gpib_register_driver(&hp82335_interface, THIS_MODULE);
+	int result = gpib_register_driver(&hp82335_interface, THIS_MODULE);
+
+	if (result)
+		return result;
+
 	return 0;
 }
 
-- 
2.34.1

