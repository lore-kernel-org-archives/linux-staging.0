Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EE73502A6
	for <linux-staging@lists.linux.dev>; Sat,  7 Feb 2026 22:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770501947; cv=none; b=Rto25Mv8G8eobvkeEmrJMlh6IAtjcIy7EMfwHxlQC7iAZjWJxpg+zJC2ioAAQhwf3Gsyji2J5z7vE1qFgVQUqTQg69o/KPlJyYSPYdPi9oOF6TRj1fIef+Q3TAoTXDYYtdxkhi75rXBEn2ByKWggQHyI+hOYDtZzitRPRXBBzns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770501947; c=relaxed/simple;
	bh=tFeZ6eqQEns+BbNpZxKKzRzzk5L7mf1AI6/R/s6kqxg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b2l6KD8JYHlXJUa5DyTHEnWsUKEsugXn4JU40a/+LPkACIEzmoab1473Qsxc9Vl69JqvB/uNBcyvrUMIPJFzGry8lLX7bq3KaKwdTI/hj2jZY7MKM1w78qMBrG/qj08IMbZiWeHeYfjm+E5HSN1dzAa9Mu515habO21vgdgl2ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WVhok1C4; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WVhok1C4"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so427867866b.2
        for <linux-staging@lists.linux.dev>; Sat, 07 Feb 2026 14:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770501946; x=1771106746; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z7JzfkHfLZrS3JCd6WEG699dvuHJ446+yPABvOVAurU=;
        b=WVhok1C44N/PYHibNTCqWbnxn9kknFJ0NqmP3oDhRCqCLS2yAag2bxg6v4LBlvrO7H
         G7XrtDKPLgA6Jjp9SP31mYk5pmRefAHVMJvr01qJcPXDBvUjbcgi4vRcmzsPU7yXkWQg
         BryPQs+phEPl6CR+kGhdILUvAFoOKk9ZmP7t7mgaDMtOLrgzNe1z2BqlqBnQXRuZxYOx
         nwFeFx83jhBLK9j3BlKqNQUG4EosEruZS9oepBVPedyBBxX7/cOa0OpcdWbYEhQpa0w3
         QXhHbpS9kct30GoS/dQ7vYOXu5iPHh2Z0wpZE9CUQaKZE/iLB+bBMqR7kqJdKpciaTgg
         J2nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770501946; x=1771106746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7JzfkHfLZrS3JCd6WEG699dvuHJ446+yPABvOVAurU=;
        b=rYyzNWZmGQH9CVZwHZcqG47eIDyHt/BjzQ0i+v+xUwiCA4vDHszNkyN33tLVh40L4L
         4BQpyFp5/416j60gs6yJ+eGYx6/nOVZVDWEjcd9Zdw8HbUaY0TJnctzSR2FZsMdsSSxq
         Utgt1ILtZI2xd+FcEmpScSIngUzCeTALfP1NnK5cEG1+p47UqFU7wn5YclpZwYRuQ2RY
         1oWUrWY+iJ0suB/vWvRHt+pXxuUgjoJ+JQ1+nygMouQHmprVod4IPlfT5EFW+z/3dDtZ
         FwI1MjKEzejXZ4EIJ/TwhNYTU4Z30bfJSGCwxqMTdoxfV/IXDkWSg4Uratn71B+tRFAc
         gU7A==
X-Forwarded-Encrypted: i=1; AJvYcCXL2ARpp4rAmtW6GmQpJs28puu0cZ2XNc4S/QMaqYRzS0uPWUeL0EW3QvGamvgje1qD/AQWeLMVRciEDysL@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7bBLsug7NT1b/lbqg30nzNWSqTUZN6/obd3/DfDWifHnG8cAm
	NhoN0vs6f/mqRFLso84QJPffMW+9s+GfGhWlhGeFzbpbMeLbgvRky3WK
X-Gm-Gg: AZuq6aIKYzf4WLT7zQbz3hol7F1BKpM3qjvOVfjlQGfmv7qXmXup+JMjZTdJiqga1gZ
	oB+hr6ECT9d2f9Pe1KAnEJ0PlRn2cAPr9cBROkfVNM1uRSl29WL2gdSDduVLwAoTabbt2n5N4nQ
	Koo0QrRW8fB2rh7CWT6pGPnoHKs5t3MffmKMQ1x2+T6HkpcO3Rww4mL4C4thenyJaHlmMS0dzj7
	fkZLkPdEP6Rmuj46KKciHeGzrNV3NZUrpLhiOZMpLmUYo2ScSjmt8WwN09cHzDJ5RjeKQ6scsBE
	cgfiPrSRHD031wKxHT5kepyfgFG67LcN28cXP6SREJBa7Ri/lGR/IClIikkba1SUHdzRJj+EQCt
	xNCHgBRq/WWzDN531vtwAIPy4vE9k7nYRJFuQaRt0mB7MjEHqNBCH4IgThqAUDJQmtVaCh+egYk
	rR24aQe4xome2D5DqW4XhDfvnQDyMMphBW4A+b3WuCtp5shN0zeTsVgjaQ+HZB1G7QyV8klBR1P
	zS83kd5JYc37VDn0dS6uRwCXpPCCSdFp5mK9HcSZhDTxHJCCW2n0y5Z
X-Received: by 2002:a17:907:961f:b0:b88:7093:3cac with SMTP id a640c23a62f3a-b8edf43254amr385654366b.54.1770501945604;
        Sat, 07 Feb 2026 14:05:45 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-a.c.od237066db22328bb-tp.internal (99.86.90.34.bc.googleusercontent.com. [34.90.86.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7dd3acsm216806666b.28.2026.02.07.14.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 14:05:45 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH] staging: media: av7110: replace BUG() with error return in gpioirq
Date: Sat,  7 Feb 2026 22:05:44 +0000
Message-ID: <20260207220544.3884-1-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace BUG() with a return statement in the gpioirq tasklet handler.
If saa7146_wait_for_debi_done() times out, crashing the kernel is
disproportionate. The pr_err() already logs the failure, and returning
early avoids accessing hardware in a potentially broken state.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/staging/media/av7110/av7110.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index 602342d11..bd53d1a41 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -460,7 +460,7 @@ static void gpioirq(struct tasklet_struct *t)
 
 	if (saa7146_wait_for_debi_done(av7110->dev, 0)) {
 		pr_err("%s(): saa7146_wait_for_debi_done timed out\n", __func__);
-		BUG(); /* maybe we should try resetting the debi? */
+		return;
 	}
 
 	spin_lock(&av7110->debilock);
-- 
2.43.0

