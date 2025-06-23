Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2294022425B
	for <linux-staging@lists.linux.dev>; Mon, 23 Jun 2025 22:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750716625; cv=none; b=UstccQ8NX7P8TG10sEOKD2kXLXMP7dJNxsk3RuaLo18RNMlJWKwRfrKc5Gp+mOI76sB1CS74OmaI6bWAtKhRfI8gacnmGPLiMAhNPzuMrE3cBFZd5x1b173yxrggcD0hpn7h9eWXIvkxezKUVrhCG0/4umKIwLIr/ZE7fbxeeLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750716625; c=relaxed/simple;
	bh=rJtgUixg3bc+6Lniu8+P4i4uXvGUZP8yfzVme7m18jg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PxyuWsgCrRfbFyllVSkqFNmrMo3v2Omkl/W1SYeiU2+yZd9wVOwgeXLzhpycQ0X0xyFPM9SeSa3RwjqQ+aid7poT49RXssLx3NNf8V7C24Ya8IhXKEZx9ujxKyEyh99YaAXgW+//GpbKe+eo7U32wKTPhHZ4eIMT5B1w6qMq/z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WWTmUbEa; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WWTmUbEa"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so2387972f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 23 Jun 2025 15:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750716620; x=1751321420; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g6osNOP9K2XHQbWWpjHXmBIwvo4RDOmUZ4V/GR1O0W4=;
        b=WWTmUbEaLjLATqwuG52tNEH/kGnf/zw6aV97x0liwGHTrlFO2pMeiPSXy9uJtfeazg
         fsz1n5Kgxzlq5GAob+/+K0e93iu2x5fz0AWRm3eXPzmd/EFoNEOPVowGl4FGy3zd0UGZ
         gV4iuGcQY7YXmBHtrjIQSHv8gH+JP/0Grya6FEStfFlkZoc+klGfRCKiXzLxTIeeXr/Q
         75lIrMOSMwwqrArPrtcXaGtRDwPnDVk5jXik+MfkXOZNHa5945/K57iEU2bYiQ8ICDoB
         LDJG68/ial9F4IyARvxwF25PkEfDk3CM+gQUuMThvsW9nZyr1YHzXOyHv1xFPOLq7XZo
         grjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750716620; x=1751321420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g6osNOP9K2XHQbWWpjHXmBIwvo4RDOmUZ4V/GR1O0W4=;
        b=sqa/wt2aaIBZr5YZuPqDQNxR+bgINsv0nqLG4/E4pYVrX/PZ0T01uG352JcD84HC/k
         KsUqXMjeOcaNarYHbyW0LErQg9GnabJClLjew+iioDcj4QMxMU6NrMH9bAZE86LfX8Oh
         2GFW5RRxZ9kXxzpxOQEE7zOsc/FOnh2nQpoNjqPjfSNFtoIycuLknwQPw111tHnCABNd
         wXKgMfS4ceetAZBBhP4sdEU2nwaWsWFHfxMapeu2sPTzq8bHxizMwJdRzCLhYdWzUmC0
         vsAKTF2PZjBaSzo1cnmP5mcTg/UdqJmZnzCM6dYSFoLGyBGtsl0B/7QqBMc8U0RmAwkx
         Cmfg==
X-Forwarded-Encrypted: i=1; AJvYcCWVaphfQHISerz8QIQoYnnS7OtGWbuL8Til2wQZrWjD9D06bzf8mNljWfyF1VBtuG8Nx6oD7V69z6zMGkLt@lists.linux.dev
X-Gm-Message-State: AOJu0YyezqAsalMrqYj2NwfRNQAzhnRNmhWJ6IWITg554qr8z/mHpvG8
	L+iMyeroFDGJFzTK8BxhIFS2iziVUjsX1kTQhgqjWm9N2jGXgyJfJejT
X-Gm-Gg: ASbGncsscGYRGspIrauXjwLA4GLR+W+i0uImZcKDRltdVrzTFS0js8oVXOGbeiZJwr/
	4NI4wXDx+yrapuH4+SmD2j4lueB0A2IAPxHsl8Uk6CfcylWc2C3izc+gdCOMVicYdrx4Dww3SL5
	M2nnsASZQmwHg5uqnGRp103jPFTdeFGzAM14ygijkIkL7Evh7R6KnoaJDQrIWY6qin1SwY4kWaw
	GTIZqEKgwR4Rm6cq76N+COaF60mpsbSgMjjz0XE1tXaf3ywGcOCcgRopN8r+smRs+A/QwWh3TZy
	CEUEL67odjWB9jnCHKbXNY0ADvzWtpGdSg6RqGnCgiE8k9lBD+1YfmzDpIKE
X-Google-Smtp-Source: AGHT+IEwnihSKaV9MZa8JbefwtxfYi1D+ExJQVtkVsokJq+3Xaa3axXjCwHA/ovAMgIPs5P8j8qYfg==
X-Received: by 2002:a05:6000:2503:b0:3a5:39d7:3f17 with SMTP id ffacd0b85a97d-3a6d12e68b2mr12366601f8f.47.1750716620193;
        Mon, 23 Jun 2025 15:10:20 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a6e8064c61sm250475f8f.36.2025.06.23.15.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 15:10:19 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Rubin <matchstick@neverthere.org>,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] staging: gpib: fix unset padding field copy back to userspace
Date: Mon, 23 Jun 2025 23:09:58 +0100
Message-ID: <20250623220958.280424-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The introduction of a padding field in the gpib_board_info_ioctl is
showing up as initialized data on the stack frame being copyied back
to userspace in function board_info_ioctl. The simplest fix is to
initialize the entire struct to zero to ensure all unassigned padding
fields are zero'd before being copied back to userspace.

Fixes: b8394732ff0c ("staging: gpib: Add bit and byte padding to ioctl structs")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/staging/gpib/common/gpib_os.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index a193d64db033..93ef5f6ce249 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1774,7 +1774,7 @@ static int query_board_rsv_ioctl(struct gpib_board *board, unsigned long arg)
 
 static int board_info_ioctl(const struct gpib_board *board, unsigned long arg)
 {
-	struct gpib_board_info_ioctl info;
+	struct gpib_board_info_ioctl info = { };
 	int retval;
 
 	info.pad = board->pad;
-- 
2.50.0

