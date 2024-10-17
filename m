Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6DE3398B
	for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 08:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729153294; cv=none; b=eVuVMTMw+roNn7nzlx443laYcc/Newq9tK+vukMtwbolz1M5cV1fSeW79TiqpKxIB8RgX8nlO/F2L6bxRpeZD5cZQx6XA6NXK0Ryarr19/pWtojMjlQpPGfuh/y+QQFzutgt3QRzPJkNOvrmaYnwwpoK7HbOMGnm0TUVlG6c504=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729153294; c=relaxed/simple;
	bh=Qt71jqomeTiOsHtOT1TI7YwwvbCbhkMchZi7rxHHJeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qOLNJgI6bQKBcY1oqOdKCSC+7ZgfkxBDIP58sFc+dSGKpYL6c2y8VlVd3qWweStre88t26gcpEHtnPSPFrZ94d+AsTQdMHY4UwqVv8lV1+ms6CAIGoQq3KCuoVzxW4f7a9ZG4Ye7wbnlEJ1jFN/9qfnQAtll+6RR+0kbp7JPGg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=R0zix5A+; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="R0zix5A+"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20caea61132so5625555ad.2
        for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 01:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1729153290; x=1729758090; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=21r4KjxS04aljSd/Fon09UcC72cpkOJeqlG20Lhe7Ck=;
        b=R0zix5A+T2d24pEsSBA/Lwd7kgWm2uOmbKfIAkk3hiTvUj3b6MS89DzpxirAiVfNkJ
         +mn5WzCK4t5JGHI70I3OHf5MRgVqjbe6CFZg65ALMH+6VGS+FbW1IoWgm+ALjFVe3d/o
         8vQCe4e/Vt/h6U028HbVkAYzKu6SAVN5StQwbYRF11FggAmoiSjvXrKFkCUkPcaaYMhD
         VDOLhBb2sics4vWATW9KeORN+sUJlpa4B4rwTfURF0nC/uvnOYyBrUky8t4b32QhnUHU
         ZXFBebjWxh0okC4HeM27RUMwer+xNKEmIfMLHzsTmR5QtYZwzQ5aQoIuy5WGvkOkhwLo
         5KEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729153290; x=1729758090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=21r4KjxS04aljSd/Fon09UcC72cpkOJeqlG20Lhe7Ck=;
        b=cEG8ShKQ6lFTexpHfpUzcuB0t31R3m6jgCljuOoKjuIsKVXyK0eX2pjoLQTv7mwnUU
         +YkCxs6JKr7OyUu4u2EiWzP9G4YykQ5D24Al9tBsC25q77RNWNEL8WqVKsRxQTJNoZxT
         JIKQZF0OYyN0LPm9Xe0C9RKEEhIzwkI4TqQfr9tTmTF531836v9fr99uIsD/8BU48sk7
         wFYFnqfLVSAjRwLbSy21g0gIpmdyJua94rdwxvp8HuJQF5+6Ex7t2hsEF6sOTiNC2Be6
         tZSkizcoLlJigbVmvcMPWkjtgU/4lFEJdj9vZMwJsYg09JV9BiZYmUWEppg1YRHJDZIh
         hKjw==
X-Forwarded-Encrypted: i=1; AJvYcCUAA99UPkzPCjCjarjFPUdsApe84rAaQ3FiFEuBxEQwP3x4uqPUAXc3BzWIYm+w/bOygptTJbjILKFgGnK9@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1Ftp4wUzEsoJQz95lwBRKAOvc2iA+sa6Gs0Ls/yZczDcNX7PL
	d5CCQrTmO23a+Sl7ECW0xtTiorTysoKHtuKkhxOOQBf5U1sSaoogr3L0z/YxqkSXv60j6SqJoZV
	5jAv8Bd2K
X-Google-Smtp-Source: AGHT+IEuPQNkBkf35mPaDfmPHqCgle48oyoM55cMhfMh+5dWLMsLpkcpas8peZNquQZKLveCOM3Skg==
X-Received: by 2002:a17:902:e887:b0:20b:b40b:3454 with SMTP id d9443c01a7336-20cba9ebb29mr248199755ad.0.1729153289656;
        Thu, 17 Oct 2024 01:21:29 -0700 (PDT)
Received: from localhost.localdomain ([132.178.238.28])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20d17f9e234sm39690655ad.114.2024.10.17.01.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 01:21:29 -0700 (PDT)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: "Everest K.C." <everestkc@everestkc.com.np>,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: gpib: Change return type and error code of fluke_get_dma_residue
Date: Thu, 17 Oct 2024 02:20:22 -0600
Message-ID: <20241017082022.16874-1-everestkc@everestkc.com.np>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fluke_get_dma_residue() returns unsigned int with -1 as error code.
This error cannot be caught.
Fix this by changing the return type of the function to int and 
returning the error code, that was captured.

Fixes: 55936779f496 ("staging: gpib: Add Fluke cda based cards GPIB driver")
Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
---
 drivers/staging/gpib/eastwood/fluke_gpib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
index f9f149db222d..54fdbef20d84 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.c
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
@@ -536,7 +536,7 @@ static int fluke_accel_write(gpib_board_t *board, uint8_t *buffer, size_t length
 	return 0;
 }
 
-static unsigned int fluke_get_dma_residue(struct dma_chan *chan, dma_cookie_t cookie)
+static int fluke_get_dma_residue(struct dma_chan *chan, dma_cookie_t cookie)
 {
 	struct dma_tx_state state;
 	int result;
@@ -544,7 +544,7 @@ static unsigned int fluke_get_dma_residue(struct dma_chan *chan, dma_cookie_t co
 	result = dmaengine_pause(chan);
 	if (result < 0) {
 		pr_err("fluke_gpib: dma pause failed?\n");
-		return -1;
+		return result;
 	}
 	dmaengine_tx_status(chan, cookie, &state);
 	// hardware doesn't support resume, so dont call this
-- 
2.43.0

