Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA461A9B49
	for <linux-staging@lists.linux.dev>; Sat, 11 Jan 2025 16:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736612154; cv=none; b=gddqFTT6iCTQQ90kQsl+Tr2ZyoqKa6hE6SvNi+0nuFL/ZCP8XyiwWJYm/2magj1eoCrtVi3PVl8J90/ueplnwrFAYRUdm1ZlZueMfEGahzQk+C0qF5e50No9jqmUnn5Hxi7fZEjj1Y+/EM+XsfqUcH47rlKoYbvXFak7zRi9/ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736612154; c=relaxed/simple;
	bh=OI68onKi6KoJtopdFkSsGF2khOUuq6xNaRWnaWzYi6g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QdWVBN+qmWIz1xFiunDPsBzWdGKD9zGsL0LF6Uh7WS6zO3E6tqoa2LzDNmBiRp3r4xAKZ79Nsap7fpaiFPvYmCc2THww8xcU2lKZj7YKTO1ZisU8xSeRoKCta14DK1IzjQqzj7MIPjuhPXrRX5dHXpqZllElucwl7388vjTcP9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WwDjXfM9; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WwDjXfM9"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-385de9f789cso2115886f8f.2
        for <linux-staging@lists.linux.dev>; Sat, 11 Jan 2025 08:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736612151; x=1737216951; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XLNrcx9cjynqqzuzB4NpWA0HHiIsSv6AxtzMCkQZk1s=;
        b=WwDjXfM9goc2JO8RPmFk3OfNVcPoX/eUCVn73z86NZWhFgmhhfQ/PTOvb4a7+kOWnz
         fdQKdPbTKjctLo23s7do8zq2QeDVJ5JJEiDU+rDi083+cUsPZwNwDRuUkus4sOVCcvhZ
         tCtt+qzNV36gv3x7TuYOcK42ZbxpbZ7J4R8AohYt1TUdcGi7VaQqT3o22auRhVmTXgAv
         XYXqaEIHIi4qlXDaZAzREFxt2jiU5zRQwaFPKgN2kXb7XATUwJhBHU2WsKsmxRnCa52v
         XeNCiIWCS59vKIVNkBAP4OzVVKNlnTORORLIWHo60hG3Jtbqw/FCLvX36sl5mjm+hIAc
         GZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736612151; x=1737216951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XLNrcx9cjynqqzuzB4NpWA0HHiIsSv6AxtzMCkQZk1s=;
        b=N7L8w2u5TLIFwLqNAI6aPWrzI1V0PA7wcrb+ei5Lhdg5+ljk66G6cEBTf/0Q8KlyWY
         IcuYoP8EYliQrBdpPXyiC4/58G9VIxeIKORPJayK44kLf/+JOLFcGrlA0eYHba2Zv0SQ
         j1QGRyW7rSkoOtENPg8x+GNuKxYG6jaW07TmG6OScUMhNSLyEz4rka8CP0X3DtgTbXpB
         xzjCJW/+yOrwn5BbA/GQ1uo1mbS5Gw2T0pgJaXQ8yNIgai5Rkz5/vtaRPToqDBo0Ki80
         V9FVi8ePHIRIffGxV/dUixuR8+OIQDE2vVteFxrC7/BSXPwD1AC5kqFBtRqk+bHNyPXk
         utzA==
X-Forwarded-Encrypted: i=1; AJvYcCUEK6VdmuWsqoiBRQ7KHFvnvx4zNKWOfsWILAvUiSYMZDDWb3pK70CVGGB55GIc8c0JHp2Z4fasN4X+YBNB@lists.linux.dev
X-Gm-Message-State: AOJu0YzpPw2mRaYarW6rykEMlmDV73+bX1JuStJiezROwyrqco9oE7+y
	kQUfopa6d8QnzYiL1gRycscQ5rfHwf3l/40rhSgpvsSw5gCBd1rx
X-Gm-Gg: ASbGncuPRPLHSxJYxLmo2mdMREHZiwWl0uMyu4noM0o1wki3AXumt3uzZriYlKzRKCi
	qm3bd/aMekjyVNWA7QxGPkhux7hExdIM1h26c6oLwjlQJ2dkqwWRczXtPv+DpsjzBDT+JoSztZL
	EzxehZZxwz2f8JP6W4/6dkFz9gYdufQZyYtrZo3ICxm/RPdCCoVF7+a1+UMZw4kfzaPt0/iIESE
	u8Za73QFQohyXFctBXWA4d1grIN84MV4H0dzvZe3bkWYXEacRYgGmgc7YLAtaxKR1CoumMZb8V0
	TLUBTIilXY7/fhYY
X-Google-Smtp-Source: AGHT+IEUChZgtpBjDlM2swaLKM2R4wrNHUEikBNxyzZVL/fE7uEOs5QujBKNP/q4E4vMj0WslPyUEQ==
X-Received: by 2002:a05:6000:401f:b0:385:f7d9:99f5 with SMTP id ffacd0b85a97d-38a87316b7emr13412096f8f.51.1736612150599;
        Sat, 11 Jan 2025 08:15:50 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38bf65sm7493122f8f.49.2025.01.11.08.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 08:15:50 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v3] staging: gpib: Add missing mutex unlock in ni usb driver
Date: Sat, 11 Jan 2025 17:15:48 +0100
Message-ID: <20250111161548.27601-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the buffer allocation for return data in ni_usb_write() fails
we were returning without unlocking the addressed_transfer_lock.

Add the unlock call.

This was detected by smatch:
New smatch warnings:
drivers/staging/gpib/ni_usb/ni_usb_gpib.c:837 ni_usb_write() warn: inconsistent returns '&ni_priv->addressed_transfer_lock'.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202412201550.9NCO57Ye-lkp@intel.com/
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index 2c0a0d7e36c6..d0656dc520f5 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -783,8 +783,10 @@ static int ni_usb_write(gpib_board_t *board, uint8_t *buffer, size_t length,
 	}
 
 	in_data = kmalloc(in_data_length, GFP_KERNEL);
-	if (!in_data)
+	if (!in_data) {
+		mutex_unlock(&ni_priv->addressed_transfer_lock);
 		return -ENOMEM;
+	}
 	retval = ni_usb_receive_bulk_msg(ni_priv, in_data, in_data_length, &usb_bytes_read,
 					 ni_usb_timeout_msecs(board->usec_timeout), 1);
 
-- 
2.47.1

