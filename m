Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0EE1DF24F
	for <linux-staging@lists.linux.dev>; Mon,  4 Aug 2025 17:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754329751; cv=none; b=knrGtrliS3rRGE2nqlRGWDFM6wJBeioN643Vr+SYFcDOQovOMpGz4rkw7HRZjdDCo/se+2l3HtzDcWefE95hYnyjllxE57hd3eDzJIyZFuZRyazwRSbRrDdfTfFhlSMAXpCDOUAQ36hh7fPnVGuBmY2uLRVBNOMN12qCiclLJOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754329751; c=relaxed/simple;
	bh=v4pUmsqMa6OFko8oVu9RDVTG4nJaK5RpK2KGBLtv8XY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OnIltGy+KqFTKPBFiX1oQ7L5Xd5a21CuM/i3c3szA/8J/kAJh9mVfwvb8r3PcjFqmDNVpskkJnf0CmMHFi5RSyrNuwJpef4iohuiMWcFO7L+5KUVk5OGpOSTtscrSo5Jaqc9+DrBvXZquXiZSS9RRd0b8pHlBv//xcrtll/yL2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hvp1OO+0; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hvp1OO+0"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45994a72356so14061375e9.0
        for <linux-staging@lists.linux.dev>; Mon, 04 Aug 2025 10:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754329748; x=1754934548; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0PNg9gSDjOiob/s8QaN8PpDUNVskdCO9RYGBdtiZaAo=;
        b=Hvp1OO+0P5E6vlTo64IPoS0bt3X0qbMcl+GxofwGyu95E+O+otpTPNFEnPvLY/RBdz
         edNiKODuA5s1JHQXpKTD8wMQ3bTVQTxNzplH2RhbNBALFkDSO7cTPrfzecQ3a7MC5hFd
         r+Rf6bMyrn3kW9m7M2Y4vJgzVrj5SdezaWVAFHzUcKYCqJRdZ7r3oi32kolvXyZEQO36
         vjYeB5xxBdMuEopibjzf6WOSEo55apfJWhoq9f2ag6qZVcSF5csaL23Ym0YnHcaVmEtt
         0lp8vzKGQAjYyWgIaVQeGD6yOZsmIh5dhXzuUViI3oLUPN5FKyIWz+9iXoFAh1TtoR5G
         gK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754329748; x=1754934548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0PNg9gSDjOiob/s8QaN8PpDUNVskdCO9RYGBdtiZaAo=;
        b=uwjau3kN2S5Xl8DMJrf/wY7rA2MNxoSkLwpsXr2UkhFdYpO5FiVPxhxRoRYWz2CURP
         4ACxP7004X6LaeparrrpOr4U8q0ikjnTTvGicaJK6VUj3OzTQBAO4A7yc8drDwEpimB3
         1TFbnbaoumvrDzGJf9NNsiL8S5kJZzZJpVA8uHEs7JA6S4XBfezkCahKUvwsQhczIn8L
         FgIba2+QFOsx/Y18yE/YXj/+52Og4D4gcy9IdjBSxX1hlMmYPjOtjozIKZdjJ2G7yr8b
         oPFoPqt36Lgc6D8rafkXgN2PNVIwOZBW1zh332kkPHpKpATWk10OhDbAohiW3I9KSGL9
         M57w==
X-Forwarded-Encrypted: i=1; AJvYcCV1+nkWfEqXRPIUB87bTHxz9w/+5oZ+v58Isig0fp8EQJ8ExyU62le1eod1RWDkI4a6q/AJSYNjt1vWI33F@lists.linux.dev
X-Gm-Message-State: AOJu0YxH8HNtcgDqSskkTsfcWj4QhsfLmDyhBXjMkOhc/3x9ycVtuTqH
	JGB4eY+6gIsimjT8NB3ITVV2BuqRuZO/PkYf4rqbaLXBUuUaeNZnLIxL
X-Gm-Gg: ASbGncs4UAro8rqtMkV/5Tx95sTI776hgGajdmZ1H67YuCktIKwY7cNeyimixxDVHEa
	KVfKR9pvHLKfSRregitzkzEADUjtfpMyci+aykJdtn5HWUv2gfv03IPGHKu4udrPjkR6wqgO1NU
	vHtd3J1ohMDujtfAtovMuVtWYxleZIBYAShyh9qnPxSH2X9f8kHdYI177kjgVmiAbXOTbCZe4/1
	o2NdFDd+n9gDeUVASpqx4NRheqV+P2VNyFZXpUywAxaeV2CI1mEzGchS2qEMz5uCg/WrS5zLdiR
	KbH3QIPgATXq+T2jVQ+6vtvvHrIYa8MxPjQyzo9bDnXvNbwelg4Ep7/rYq6b8jx62SbkgYTCoKy
	6iewjrecfeCsKWv8aLY2oZxufTvfS6L3wbYo/nkyJbOOiIQtcuyk3Ib0=
X-Google-Smtp-Source: AGHT+IFOOE3AXvqzuEIjTYw9u2iDlmZZpzl0a6bpUDI2FU8kwx1CCcCcT3KRIH5cRtf3YuJwjOSfuQ==
X-Received: by 2002:a05:600c:c119:b0:456:15be:d113 with SMTP id 5b1f17b1804b1-459e0cbf682mr3528715e9.1.1754329747710;
        Mon, 04 Aug 2025 10:49:07 -0700 (PDT)
Received: from localhost.localdomain ([2001:16a2:6713:7d00:3d48:427d:c564:e107])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4595cffdb28sm76021935e9.32.2025.08.04.10.49.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 04 Aug 2025 10:49:07 -0700 (PDT)
From: Osama Albahrani <osalbahr@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Osama Albahrani <osalbahr@gmail.com>
Subject: [PATCH] media: av7110: Fix warning 'unsigned' -> 'unsigned int'
Date: Mon,  4 Aug 2025 20:48:59 +0300
Message-Id: <20250804174859.9419-1-osalbahr@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following checkpatch warning:

av7110_ca.c:29: WARNING: Prefer 'unsigned int' to bare use of 'unsigned'

Signed-off-by: Osama Albahrani <osalbahr@gmail.com>
---
 drivers/staging/media/av7110/av7110_ca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/av7110/av7110_ca.c b/drivers/staging/media/av7110/av7110_ca.c
index fce4023c9dea..63d9c97a5190 100644
--- a/drivers/staging/media/av7110/av7110_ca.c
+++ b/drivers/staging/media/av7110/av7110_ca.c
@@ -26,7 +26,7 @@
 
 void CI_handle(struct av7110 *av7110, u8 *data, u16 len)
 {
-	unsigned slot_num;
+	unsigned int slot_num;
 
 	dprintk(8, "av7110:%p\n", av7110);
 
-- 
2.39.5 (Apple Git-154)

