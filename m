Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1231DB362
	for <linux-staging@lists.linux.dev>; Wed,  6 Nov 2024 09:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730887112; cv=none; b=FXeoeoQDz266ZHTFhU2cZSMIeHSLgbzDsdlX+wjOFSAYdZM8TotqD6os0GnlbL+Bj4hdyoemDp4JjebUrgYVr1ziIi2POexE51vtP/GYL+Em87Y/Sue8rkbEDqLdXUhC31dBaywhp5UwLLhkold0XAIRaItCw0ENS7lxAl1y+fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730887112; c=relaxed/simple;
	bh=r8tGsCoG9wLufbOZ5M5/PI/FbmgjucQ6I3ohVntAYNA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FhY7FVOmSYoMHpmkb87ahB+2eds2QJoZeIBq3I+hF4SjucIap+vJdH4dbLPh4kWtj8c/VQ2BA/JwMIkzZtFO8a7cdixCUXQhoV0at600Nc0I+5TsK2Rgjupc9Ma19fCQv0Sr+kO0nokDqcgA3d+kON/6URKl1RioTizxGPKfYqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XOXqQv1+; arc=none smtp.client-ip=209.85.215.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XOXqQv1+"
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-7f3e30a43f1so1778161a12.1
        for <linux-staging@lists.linux.dev>; Wed, 06 Nov 2024 01:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730887110; x=1731491910; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IL+yWlh9vw0jY8HppITDLAmrvaCxhRoxikmmdyKh+y8=;
        b=XOXqQv1+CzqBprJbpCVHqq/ba0vf2MmCYLcYBimkL+r1YbdvsWbbHyXWV8SxbrWU0h
         77vyKz1SJT1tJ+oYuFNq8Xts0QYo/kMfBtwcUnR0ju6Ex4ACDFTo4pR51syWet0Y4e84
         j7wf17DPwqlBtc/RofLLfvoAwhMFpOFAdr0e+l0Iaw4G5WkGqV7sdaxD/r2OSMlA/QpQ
         W6TDa45AGnyiohHcMGKG2gU0jYdffImF/4j1XSubVG4vyk8ZALLY2Ym2x/+FyJ9tDG8+
         6xX4Vwn0CfG48T0SdG8v3pFBUgQ8v8odFcOnvGCy4yGXHn4ss+T4MqExEDM1SYlcus8/
         FlJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730887110; x=1731491910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IL+yWlh9vw0jY8HppITDLAmrvaCxhRoxikmmdyKh+y8=;
        b=Q8Rjrn8ASWJ9t93WRhmYQb3El2dhTmNkcfBVKxrjnn1bS85qaO4UrC2rTt1VDTmHWN
         61idL8WJgRmMAmCmT9JAmaNiS3pTSSe1iqqq1rh521wd2GkBs8GM+xbgLUqKnXCilgya
         69w4d2aoCK4LtmjDmzrdQVK6+zYlljO1wgaYg6Yp7tPVeVbT8+0TEC/Dp/nCpUwgFyRC
         DlaTYSKaK2BAwZXODxbquhjuh9Ge4Vt8Iq2rh2g6Uve3xIKeKz9z3e5kN1OOoViMGx3V
         6U1GmEqwxLaVReF4SNAKqzu81/ctSDA3umSTDit2GP/VYamq2UFgPPi7jFTafvsNazuU
         0qAg==
X-Forwarded-Encrypted: i=1; AJvYcCWk65XdrQnXmzAN9vwRNYrm6+L4qjRI/g02EST3TfUfftYs9fwBU4xYOHaqucZehuIErYZeTlMtxQHARNe8@lists.linux.dev
X-Gm-Message-State: AOJu0YwOmVIADYHu2MYJ94F4eIwNIpY1O/zGsXKSK2BRxw7cRXUcSbWj
	c1gkNu0SgLjdnaQIF+Iq2SzAT6HsirBAUKzmqkUxspZOsHiahMbyePcn3q1Hwao=
X-Google-Smtp-Source: AGHT+IG2tBOEv1SQ+V34aw/3CB9NObTGsM/TPaYr68DvAKudhuXE3dzD2HjurZOP4mEoNNYPZUQJwQ==
X-Received: by 2002:a05:6a20:12d2:b0:1db:e425:c8a2 with SMTP id adf61e73a8af0-1dbe4263443mr12310020637.19.1730887109882;
        Wed, 06 Nov 2024 01:58:29 -0800 (PST)
Received: from tom-QiTianM540-A739.. ([106.39.42.118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc2c3db8sm11229287b3a.131.2024.11.06.01.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 01:58:29 -0800 (PST)
From: Qiu-ji Chen <chenqiuji666@gmail.com>
To: dtwlin@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	Qiu-ji Chen <chenqiuji666@gmail.com>
Subject: [PATCH v2] greybus/uart: Fix atomicity violation in get_serial_info()
Date: Wed,  6 Nov 2024 17:58:19 +0800
Message-Id: <20241106095819.15194-1-chenqiuji666@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Our static checker found a bug where set_serial_info() uses a mutex, but 
get_serial_info() does not. Fortunately, the impact of this is relatively 
minor. It doesn't cause a crash or any other serious issues. However, if a 
race condition occurs between set_serial_info() and get_serial_info(), 
there is a chance that the data returned by get_serial_info() will be 
meaningless.

Signed-off-by: Qiu-ji Chen <chenqiuji666@gmail.com>
Fixes: 0aad5ad563c8 ("greybus/uart: switch to ->[sg]et_serial()")
---
V2:
Modified the patch description to make it more concise and easier to understand.
Changed the fix code to ensure the logic is correct.
Thanks to Johan Hovold and Dan Carpenter for helpful suggestion.
---
 drivers/staging/greybus/uart.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index cdf4ebb93b10..8eab94cb06fa 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -596,11 +596,13 @@ static int get_serial_info(struct tty_struct *tty,
 	struct gb_tty *gb_tty = tty->driver_data;
 
 	ss->line = gb_tty->minor;
+	mutex_lock(&gb_tty->port.mutex);
 	ss->close_delay = jiffies_to_msecs(gb_tty->port.close_delay) / 10;
 	ss->closing_wait =
 		gb_tty->port.closing_wait == ASYNC_CLOSING_WAIT_NONE ?
 		ASYNC_CLOSING_WAIT_NONE :
 		jiffies_to_msecs(gb_tty->port.closing_wait) / 10;
+	mutex_unlock(&gb_tty->port.mutex);
 
 	return 0;
 }
-- 
2.34.1

