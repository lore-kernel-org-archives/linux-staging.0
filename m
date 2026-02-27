Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2656346AF2
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 17:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772212676; cv=none; b=srYJrYnVOZpm5sHed+9wLIbUN/zRbE9+wy17hBV5PbSItinxlvyYFberMqahw7fZq2+sto2UOyavpIUsUA6gh7cKm0cckdKeKHlJSjgKzuNJ2YB5MPH5CAvQttQZ+nePt1RMU9zje9JgY54I2gmOyjMp7n8X0wVU0muNSCVrZ/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772212676; c=relaxed/simple;
	bh=chk+s7sHhDgpMr4pthHr6E01perbFvqGu7cfXRO9o7U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BaUcvZs5fsRJ9c6He//KR9fONgQuv8kxx6IG/MVIctVjkB4/iQZq4dIa74K0yURMSVMm75qlsX4Q/KeTK7eWnM5RiG+1SBMYUfMAG+VjLYKsVf6aYYBtgtBl7mW4OpnDfm9XOfl4NW4lXdjm4ixdypf/ygfy5gEOiQsHKewSzTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BBU5M+0a; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BBU5M+0a"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-94abd52b274so616780241.3
        for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 09:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772212673; x=1772817473; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hc0dLqQoQ6W/KnLUw4OXQrYgdCgC/5tcHVqNhJgH/8I=;
        b=BBU5M+0aoFa355d6d4AYbVXYLYCzb/lAzw1nd4vk2IXCvAmnQTStUs9mRl3kNRFIVT
         5B0q5PQ+CfGu36qx5cM6Rz6zooUBKP9+m7BGLd05zydWbNa2q+hLKPsT1sGYxCL8IQhG
         MeLCfJ1u0lpOdaAd0rRIGLKqK1S1WLgHrqmzXh7GwSRTK2YgV+iWTznMviX+6IXOdPeS
         2O336U3ynCmhNqgAcqR+epbdzYsThGoqskHjwuVRJi7wUv3G8dDONrHGhnidzfXSDTQT
         KXvWGxXo/GZJuZMONz7k57WYyWq4WoiMbpHpoLl6V+iyRzrdbBnN3hxDcgct7f+5PWDb
         3X1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772212673; x=1772817473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hc0dLqQoQ6W/KnLUw4OXQrYgdCgC/5tcHVqNhJgH/8I=;
        b=aGWJk2fzIqIc6/Mdt62C8SpuNTHZNjloSEB/OYXdiPSfIGcIoeJvF/YS9BIs9jRMZV
         A/7MGBkBr3oooNIIWbq95/jqGr2v3lS1ZH5J6nqjzqy6DXO01E+iYQTmtXWmusTmhVzH
         Qay/UAQSzOXTN86m9428b6zwN3c/29GivfrD4amcQcE+zSawmeEseXkXeO6iEaSyhUxC
         MtGT+rbkdTQ+iKJyJd0nj3YInrS9qY+WtERsgbPNdMwMdClfORj7fwzy2rmPBpPFd0vX
         KgDsHSrrX5eTk+ciAGJQnZVrEvG0Zu1ZByF2wI1dL9vbTQVtU9K6d72G7ad0MUVKCJ9C
         UmaA==
X-Gm-Message-State: AOJu0Ywj0E7fnA+w+SBhLgaApMD4cqRKsFJODRyQH/+/nWk1+Nb2ZF1H
	KauTv3QjPe1msqtf/xY7HsMG/a35uao1zxrHGw0hi2G0KgUP9HUDbGk0
X-Gm-Gg: ATEYQzx9SLuA8ATRrHsPzx9YvyRx9IqvEPxLLOlL6JcjicCs1X7LX7b4I4hH2/Pueo7
	2126UM+38yIzF76vCuIAKexgHVsj3yQTr7Hnp7CItb/QAQYibeTUSclNp02yHhbBeL7jpBbsu7m
	8ezExp9Zh08vdfhH9j3zdVpwEuzujsFbegQjTrz8xejT96e+kIVN4fhwwUz4n9BGlA7gVadY+qt
	txDFHG+1AzbWgu/dgT6HVF/QA7m6/RxDoGLSS2aRr9HiEe5HeNkPwFlXWdBFBoVuoo19DSrOIfz
	tln3hEiq1DpKUwTgjCSm4vmCWKNUg2It6DuKeoH17bQyxmbLsUMtebZ826U6lEMD6O5noF1WYFp
	YkWlaYzniUR/HY9auEmoxZs1FSr6yg+aqubx/vUegqLIRUWxMnHIKfrVQYP+dLRagjtLxHVU7Su
	qfivvhFICJmoKrbtN2e2wBO0aT
X-Received: by 2002:a05:6102:d8f:b0:5fd:f744:660e with SMTP id ada2fe7eead31-5ff32518085mr1743395137.28.1772212673412;
        Fri, 27 Feb 2026 09:17:53 -0800 (PST)
Received: from nixos ([2804:1b1:b880:4e06:554b:5779:2074:421f])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1ea116c8sm6028254137.10.2026.02.27.09.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 09:17:53 -0800 (PST)
From: Lucas Faria Mendes <lucas.fariamo08@gmail.com>
To: gregkh@linuxfoundation.org,
	ovidiu.panait.oss@gmail.com
Cc: linux-staging@lists.linux.dev,
	Lucas Faria Mendes <lucas.fariamo08@gmail.com>
Subject: [PATCH] staging: axis-fifo: fix alignment to match open parenthesis
Date: Fri, 27 Feb 2026 14:17:41 -0300
Message-ID: <20260227171746.24969-1-lucas.fariamo08@gmail.com>
X-Mailer: git-send-email 2.53.0
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

