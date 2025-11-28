Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969E629D267
	for <linux-staging@lists.linux.dev>; Fri, 28 Nov 2025 16:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764345955; cv=none; b=T6AI8Ti24NgjnDAZ89rBUi5d/Kgi4x6NAcssUxUb679d4NqqdmgEJhn2KsQEDtr6DLkm0Y9aT8ed9fSbAfpMPYucpah1pj5F8ip/cwfgvXkJWy4rwld3mx5Vj8eVlv+2ziF3/6W/wQel87BH12J85glzHXn9HaRKLz9a9sRRBBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764345955; c=relaxed/simple;
	bh=BfuWtJpHFnoUxb8s7xJBVcBtioNVHYkElOeeOAD1d8Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nwKEAgP1N3SKeKg3PGIw893uuel/z+Y9aCo4k1DEOSXrUYdM0dwoIiwVUhvxvDr89Zy/kQ7Llg51IxULG/Cy7s1rSCMxRSVqOp/ytisqzi0aW9cjqW7yDbEkrIcqJXEXznhYUEnFyxMqMBdQZGvs4jMLUCyxPBMltqR5Unq4hQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OEjZN20x; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OEjZN20x"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7b89c1ce9easo2435945b3a.2
        for <linux-staging@lists.linux.dev>; Fri, 28 Nov 2025 08:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764345953; x=1764950753; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGAsWoT0ij2AF8u7lzQ99aTp0zEqYgQwfONKoWXhuNs=;
        b=OEjZN20xLVEb0W2ObdmOtwXQdofFpuoe+RJHT39sG6JOxjDSOFOzgHs5PAKYWq/jlO
         7v7Te+I3NRpwGK0N8syA0mkooECvOrNzTAqd6deZe3IHM6vUexNN5xZ4mFB4/VfBSxmz
         TbRoGxQT9xPVJ0yK7XzAxdRsM9ffJld3EanRwd5EEBwJsWs8raJIiMWPEUjSHOsc8ThR
         8zDuG0JDyBEFW6Ipc0u/vorG1WBtQ6lnk9KhNKxIWfLGC8//VMMwhOSNS8RctnJdf7H9
         VUo2e/1B66MT0t2b1/DjhscR5HEO4rk/iGLxf4+dtnm5fRT85QBPhV4xUZF11WFHP7bw
         q4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764345953; x=1764950753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rGAsWoT0ij2AF8u7lzQ99aTp0zEqYgQwfONKoWXhuNs=;
        b=mLqhC6V6F7w1VgLnw95dm4tXHJ847T+KH8a8ujlQetBpgO/hyubz8vzp/9srloMelh
         66dPFcC+ZZCk6E0VptIGbZDlCjrkkpT0HoPAdy0Y9gKYMnUZQN6le0LYIhCq7X3rRl0N
         dyu4xs6LsLgYiNMc0yq9xfiCVTOswpjp3jmibtmF72mQN2fxo71QhZ6LYafBAhXWHn6P
         FwUWwYYctlB4SeiUd856826YorgcKcOaVuJ6zSP/F3RlNjdjedMFtS+5a0UFV7TadQKi
         05sm0tFCYrTOumSp9/+agHKOR/Ut7fnZD8lOG0xh9JDhE2/VOL7wDsLv/e/zhdsY0/to
         v1jQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfK0NyaTJ4KQwz8cviu1nr1BX5AF2alOL0gArQ8YKyYjrQUPi5zD3rwI18/+uWwsCK36W+c4ZsdSC4MQk7@lists.linux.dev
X-Gm-Message-State: AOJu0YyZh75IRfrHN5SrFPx5cs1ISpiJ4cyBLqS/wjXFk1tCytLChMb8
	PYCoVj7mrWHwFbbPZWRBcmBpuQUyU55UmsKz64NfLFpIL9TAVn7VVRQl
X-Gm-Gg: ASbGncvjK0IiUSrYJMGUNhOTtr4qiZi0XtCYr77cEwI5G5Ati0Lrc8qNdYBa+1pDvtn
	yC1V9c2ZGECD4GHHgX1YjuPi9aTmEWlj2uyuXeZer3RKJlwzeQMVbjIeD9EII6DutJWK5kDhhXR
	AyqWkykHzxKrGvCSUaWCysPX4CNLhQlvoJYEtY+mqnBQp6ZDKHKZJ2U0TfS1UHbAaeuxVH4M2VO
	0BvQ3/WRrzAng/SYm+hZnAiz4/aWSaDem/G1FwLXaxzwHYvyj8Covuwsdp2hvolun8W76CHNeNc
	gj6jAPGDTwYIUxSo8NW5/N40zInEe6tRZAhBcSdFi+a/FnWnBGRVz5F99l9PG+v1MllXor7kIUu
	fo1EHGxYVWxeGGDFR4wCF89c81x9JN8QL+pcP7yjPjiJqF/fEzKYk79FnAzTp8VY9WaoPGfE+l7
	c32dWLIXQpvq7dntB5nAtc5Y0Kegb2H2f45epeX+r3aTLRxbLh
X-Google-Smtp-Source: AGHT+IHy5Mo29j/CWbee5Q6OSCJW+TSTmTNfb4OAc8LY3nxwbKHubZG/p57p57Ap+fsLvqvjiDlwdQ==
X-Received: by 2002:a05:6a20:4328:b0:350:fa56:3f45 with SMTP id adf61e73a8af0-36150f033c0mr33804804637.35.1764345952577;
        Fri, 28 Nov 2025 08:05:52 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15f26f11fsm5408499b3a.50.2025.11.28.08.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 08:05:52 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: stable@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	Julia.Lawall@inria.fr,
	akpm@linux-foundation.org,
	anna-maria@linutronix.de,
	arnd@arndb.de,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	luiz.dentz@gmail.com,
	marcel@holtmann.org,
	maz@kernel.org,
	peterz@infradead.org,
	rostedt@goodmis.org,
	sboyd@kernel.org,
	viresh.kumar@linaro.org,
	aha310510@gmail.com,
	linux-staging@lists.linux.dev,
	Jacob Keller <jacob.e.keller@intel.com>
Subject: [PATCH 5.15.y 01/14] Documentation: Remove bogus claim about del_timer_sync()
Date: Sat, 29 Nov 2025 01:05:26 +0900
Message-Id: <20251128160539.358938-2-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251128160539.358938-1-aha310510@gmail.com>
References: <20251128160539.358938-1-aha310510@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Thomas Gleixner <tglx@linutronix.de>

[ Upstream commit b0b0aa5d858d4d2fe39a5e4486e0550e858108f6 ]

del_timer_sync() does not return the number of times it tried to delete the
timer which rearms itself. It's clearly documented:

 The function returns whether it has deactivated a pending timer or not.

This part of the documentation is from 2003 where del_timer_sync() really
returned the number of deletion attempts for unknown reasons. The code
was rewritten in 2005, but the documentation was not updated.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Reviewed-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Link: https://lore.kernel.org/r/20221123201624.452282769@linutronix.de
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 Documentation/kernel-hacking/locking.rst                    | 3 +--
 Documentation/translations/it_IT/kernel-hacking/locking.rst | 4 +---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/kernel-hacking/locking.rst b/Documentation/kernel-hacking/locking.rst
index 6805ae6e86e6..b26e4a3a9b7e 100644
--- a/Documentation/kernel-hacking/locking.rst
+++ b/Documentation/kernel-hacking/locking.rst
@@ -1006,8 +1006,7 @@ Another common problem is deleting timers which restart themselves (by
 calling add_timer() at the end of their timer function).
 Because this is a fairly common case which is prone to races, you should
 use del_timer_sync() (``include/linux/timer.h``) to
-handle this case. It returns the number of times the timer had to be
-deleted before we finally stopped it from adding itself back in.
+handle this case.
 
 Locking Speed
 =============
diff --git a/Documentation/translations/it_IT/kernel-hacking/locking.rst b/Documentation/translations/it_IT/kernel-hacking/locking.rst
index 51af37f2d621..eddfba806e13 100644
--- a/Documentation/translations/it_IT/kernel-hacking/locking.rst
+++ b/Documentation/translations/it_IT/kernel-hacking/locking.rst
@@ -1027,9 +1027,7 @@ Un altro problema è l'eliminazione dei temporizzatori che si riavviano
 da soli (chiamando add_timer() alla fine della loro esecuzione).
 Dato che questo è un problema abbastanza comune con una propensione
 alle corse critiche, dovreste usare del_timer_sync()
-(``include/linux/timer.h``) per gestire questo caso. Questa ritorna il
-numero di volte che il temporizzatore è stato interrotto prima che
-fosse in grado di fermarlo senza che si riavviasse.
+(``include/linux/timer.h``) per gestire questo caso.
 
 Velocità della sincronizzazione
 ===============================
--
