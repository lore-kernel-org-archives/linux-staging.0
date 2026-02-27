Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CC031618B
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 18:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772215901; cv=none; b=pA9M6rxbC58J88AMTr4GRvyyWhga8thxQrbES72HmhcgVHeh6kt0Gde9yf8UhDtK6Uqz5XyMmb7V9cbudtR7/60QOS1hU+XUn4mTjcsyWYhK6EjazpyWu6FkbI2xHwcd4xbc7JvI0oJo64vSf+zsmfl5k49FdpmI1RRXXyZYBQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772215901; c=relaxed/simple;
	bh=chk+s7sHhDgpMr4pthHr6E01perbFvqGu7cfXRO9o7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JU33bVsQKj7d/2sNHPzm8f6Z51ytmfU9CGuGQVAWHlAqgG9w1B+sdvEegBoyIKP+CzNRCR2wQ66Q+hxRE9ccXhUD3C0tzj1ho+M384Y0ts1/Wwhs8Ideud+Y6dM1w4Ej1dolkL89kFyjjG+bbrZYvqvM7QtoNT87F1DH5hPT/Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8TmDbbr; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8TmDbbr"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5688b9e4e80so2310428e0c.1
        for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 10:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772215899; x=1772820699; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hc0dLqQoQ6W/KnLUw4OXQrYgdCgC/5tcHVqNhJgH/8I=;
        b=G8TmDbbrIcrh3tzd5MEdNLAzAvaW/J1SL9irOZfJgOYEKPsaRqMnaRVjhxRWsTDAfU
         2//CT+NqVjvWQqz8k8Deg43/ZHiv3NWS30jauiyBVJOm0KU5XOcXkPTtaaTI4ZSNPDMx
         eclmZhRH+QyZiszIxfsb/hWxCVxg3WEuYhcd8QQkGmWc/6n/lplJ8u+6IBsKxLh+f6ub
         8bkuoaTeFEfzUpyvDwsDbI9IlXpsnHL31ybKJZf8PzQv5JslJEDirpgtlvdXkBCoh828
         pFbtPFx3msPOUN76/hajimGp8VZ7PWdu+RAmpaCZv3WA6sQYcDNaG6ZSXF6whOr09LxW
         Xttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772215899; x=1772820699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hc0dLqQoQ6W/KnLUw4OXQrYgdCgC/5tcHVqNhJgH/8I=;
        b=Z9HekyBbbsHW0LwkOMwYXSgwpOkIyd26fSID4Kr9k8bVLoXdtU5ltkgw44BGAlRv0r
         y+ubgxytwGZUTizyvZHpAfdCrj7Gnc6Nz7Eax9Kk7qBX5eGUed1saEPq9WhCDzn8ToKq
         tSLzjiF74dJJwj1ODR8BEXRTuuL53yYRkUrTw1JLy8KBIq4XsTYiULBcViIC6RXX9+f6
         uvC42BzV+niFwZRaDDNSS2dgjbkjbnyzjecAUp4OFSTP21QaOmgS1GsMShvmlF3YdivE
         QL7c0iLrrfsyDF4lgQolYbd5g44E3rxLB336jQIES15RbiCuR/4N7u61XzQHB6QAvQTe
         HkPA==
X-Forwarded-Encrypted: i=1; AJvYcCXNBsvUwVDIZbU4M302jZ642kCczpYDpX0+GYnKe0ahFLGGhw3bo26TMmDjJNXDUr+Hz2eFtwbWk98ISqtA@lists.linux.dev
X-Gm-Message-State: AOJu0Yx90n7/cpRk17vhs1/GxOD1/Oa5yUC9XBe5wz/D7lXbNd8/dbLH
	UmlHgoax9Dv7zD0OM2H+lwwJZb9Lma/1Y4hONBAuKh/2DlgnIjN2nTz6
X-Gm-Gg: ATEYQzx+iB6tqM9j6GLP97gzqhtM8zMnSXiTPZeIoRN2Vlp/W/OyQeQhV5tCK6OOHKw
	1g/46rw8CfASzqeqfWnv7H43fKCcstRFqSWcNqc616GMPi/EWfJaxpS+UXJq3Oc27qx+a6koi12
	AAspDkCpY2tZW0hC9cr5NKvIQqsWD8ekFlZRvdMvsa9baI2Z7zaxj+swQzgGveT6Bmkwe7uhkb3
	tHU9GrpEmSuDcPvsZimHrTtPb+n24pK5SyDBU3XajGlKbxVTIEjekLEda/m6TV98BIe/2WW3Pex
	bcZxXKmHn2ZXwuVI3T5Eigl/8b2ltpLYaF9TIEWZGjmu4ph+2+Px++S7Tq40IUeV/2EBOr8ADw1
	nmeY/bmUlQUfGf5iXXMkfhJu6gPXKZ2IesrNnDH6CtzxsPhQHeTEzdTG0FW0bdrSzkE9WJUW9Ob
	U2iL9d7ykuOh4VXFtf0eLnpmc1
X-Received: by 2002:ac5:cdc6:0:b0:567:8fb:136b with SMTP id 71dfb90a1353d-56a907b46damr2948323e0c.0.1772215898853;
        Fri, 27 Feb 2026 10:11:38 -0800 (PST)
Received: from nixos ([2804:1b1:b880:4e06:554b:5779:2074:421f])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a92049d05sm7452905e0c.12.2026.02.27.10.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 10:11:38 -0800 (PST)
From: Lucas Faria Mendes <lucas.fariamo08@gmail.com>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ovidiu.panait.oss@gmail.com
Cc: devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Lucas Faria Mendes <lucas.fariamo08@gmail.com>
Subject: [PATCH v2 1/3] staging: axis-fifo: fix alignment to match open parenthesis
Date: Fri, 27 Feb 2026 15:10:43 -0300
Message-ID: <20260227181051.36207-2-lucas.fariamo08@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227181051.36207-1-lucas.fariamo08@gmail.com>
References: <20260227-unboxed-customary-7ce6eda1858c@spud>
 <20260227181051.36207-1-lucas.fariamo08@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch CHECK for alignment in the wait_event_interruptible()
call. Align the continuation line to match the open parenthesis as
required by the kernel coding style.

Signed-off-by: Lucas Faria Mendes <lucas.fariamo08@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index aa90b27197cf..c64a7249feca 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -246,7 +246,8 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		mutex_lock(&fifo->write_lock);
 
 		ret = wait_event_interruptible(fifo->write_queue,
-			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
+					       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
+					       >= words_to_write);
 		if (ret)
 			goto end_unlock;
 	}
-- 
2.53.0

