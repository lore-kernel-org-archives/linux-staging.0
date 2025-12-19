Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB1026B2B0
	for <linux-staging@lists.linux.dev>; Fri, 19 Dec 2025 06:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766126081; cv=none; b=rIKedWsga3aEV6acAf/HfsYMeDt1/urGqgRdnSnfeZE4peKR+xNTyhsWGk03fdiRDfLQixWi0c99M6nmWVUILx6/zHo+LLQE2FWAEP1MepbHSSdBe3qVjujRoqIpBFf6rqHoRAmJb5jfkcbINQ61DG+tpZHMZUpU7b9osKvSbbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766126081; c=relaxed/simple;
	bh=9qvQkkRxgKjBOCEC9rr5nl8/7TR8tx2R0J5oBnFjRdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dGPgJFzdajjj+dCEwkHCQRY2WnF2IzCW3nNmG+BUSxiv70HhxvxXHWj4ZW6VdkftXkY2lCCkG62JTOT1TTydJ5nvqQxEHJEXLm24dmHbXvFVnHZ4Ik7Oew8I/9IGY+/4Ldh1N01llgmETD3zcc3v4SAIi1thIwi+QF+LAoaJbXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QwykQfQ1; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QwykQfQ1"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7f651586be1so712159b3a.1
        for <linux-staging@lists.linux.dev>; Thu, 18 Dec 2025 22:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766126079; x=1766730879; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sRkFJMuP4sgZFuSFb7yOTLztFZ/30cr5OImiNRmZCQE=;
        b=QwykQfQ1cVeU6Epw7WwVs5WBlkK+YOjG+2u+A7BQmB56piz4/Y9trSCVRs4Rp/6Nf/
         nZEo16aRJeNAwD1Go0HpiRawwC76mhdbCR9iAU1cmcg0Tu4KGISmk4emjiN9etDMHqEd
         3O4TF40AkHCLRWg3SkNj4+n0hoPl0oxRDxht5fNivISPONqWx4op1fmcLID0eaK3lDsY
         5JPJmRRwUG1NKnwAsUHJ8oq4+HjiUa2koIYRzpiQRS/M5G6oR6bnCJI15m9aKXNaMWVw
         5pjNvKO/RzkJvfzVxjEInt+HuAhCKEFOW2EXO7/fBnLWwUzWdqvXf8lhe1i8mE/p014f
         Xbog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766126079; x=1766730879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sRkFJMuP4sgZFuSFb7yOTLztFZ/30cr5OImiNRmZCQE=;
        b=F4MBNGAZhwoUvXxdRmJs+RBuxX8Y0u2U/4KNX/AjybswYhZuOcfPg19fqWt9go+MQw
         rXBgFJpqP1/88ecsoY7Bk3ntCL8Jr07otcfWptSZX8M6SELNuV9kLVPnPc3VzIC4KDBZ
         xQt/FsPIRRyKVsCMSxSYMnaVzp8X00HRShSzX6/K6KJ/3rnKazAQCHgtwUCBtuzkkGOy
         1SouBh0RHq0neKE9RixZ5ZmYTZ3k2umR5RxktSMOBCKU4lVFMr/W1QuVwQ6J6qJ2yHSN
         4HEvW9WbVxKzSVmvYIPoaMkM4F25t4zXj/Q24x1xabUid5KlWkZ+AWJKlQbp6BfnX8LM
         Wiog==
X-Gm-Message-State: AOJu0Yy7q3yXzZEzyKil7vAd/ZiyR4Ow4BULSNPqEGpgIphcf3+XbeLH
	JTfNdmMLQQn0pFQFAOeyZN7XMqmoLH2/Q/pDtd68WEk1YNOIBh6M6nwXUmIFRg==
X-Gm-Gg: AY/fxX488EPv+90ac8okPYwYZ+wMrlghubzqDEMTiVROhAnYn/2Aj6ErytfFEMDbNSl
	QDaNIYlivjLDts9/eFbFQuIxu8Gsd96atbKQeCZH82Fb5RIsH/j4t+USPtX7LyLhKnulH7cPTwK
	LFPgp5GiaBPsCkqKrTDQyx21aiTgylLgwV8iItBm1IBiYhiUqJIlxnrarZdsqQoBFcNYLQIcCn6
	ZU3Dbi3pUp0DdLOO08IVpHUL7skOguBg5mt+wpnfcHIkLjt3HBJvsOCqcJ950HcFgpqfRuSdkJE
	+zjswpGNvUgRQ/A9GvNXduST7orN1evEVlrMA5Ny/PPWGNeN4NU4aovF21ZF4kqxmcvkZ6u73oW
	oATbocJ2maTTTNnE6OVslzS/mb6BmXJjXtozwKICZwxtphIzHqR9gk0onJy/FtuWkx7C9RDnRJq
	ua9jHgUXXaa09J98SlUAS/
X-Google-Smtp-Source: AGHT+IE69ifN3k9iNNfERuD6Rav8dEu0iNqxPZsAMHgkf8Hz6fO72RoFw5rMRWK6IUVy0KiXICmnRA==
X-Received: by 2002:a05:6a00:4ac3:b0:7e8:3fcb:bc4d with SMTP id d2e1a72fcca58-7ff551dfc23mr1877388b3a.34.1766126079236;
        Thu, 18 Dec 2025 22:34:39 -0800 (PST)
Received: from DESKTOP-MOQC9AF.mioffice.cn ([43.224.245.233])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7a843a18sm1282071b3a.14.2025.12.18.22.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 22:34:38 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: linux-staging@lists.linux.dev
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH 1/4] staging: greybus: spilib: fix function parameter indentation
Date: Fri, 19 Dec 2025 14:34:12 +0800
Message-ID: <20251219063415.46818-2-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219063415.46818-1-zhanxusheng@xiaomi.com>
References: <20251219063415.46818-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl warning:
"Alignment should match open parenthesis"
by aligning wrapped function parameters with
the opening parenthesis.

Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 drivers/staging/greybus/spilib.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/spilib.c b/drivers/staging/greybus/spilib.c
index 24e9c909fa02..416ca27a25ce 100644
--- a/drivers/staging/greybus/spilib.c
+++ b/drivers/staging/greybus/spilib.c
@@ -159,8 +159,10 @@ static struct spi_transfer *get_next_xfer(struct spi_transfer *xfer,
 }
 
 /* Routines to transfer data */
-static struct gb_operation *gb_spi_operation_create(struct gb_spilib *spi,
-		struct gb_connection *connection, struct spi_message *msg)
+static struct gb_operation *
+gb_spi_operation_create(struct gb_spilib *spi,
+			struct gb_connection *connection,
+			struct spi_message *msg)
 {
 	struct gb_spi_transfer_request *request;
 	struct spi_device *dev = msg->spi;
-- 
2.43.0

