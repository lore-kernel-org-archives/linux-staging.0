Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE2A280318
	for <linux-staging@lists.linux.dev>; Fri, 28 Nov 2025 16:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764346018; cv=none; b=MyzlZQJAb0Gsy26N/BvPUOHmvJeJoLus4USl8BVxfK6jcws2k4D5C2wRpetvChDpRK5WSzLPmoM09BQ3sDOY69GWBIvRF08sqti8a41cvK5w8LY0M5OulqvAnhKZPV3VJ8Y3WyAbDXxD4arsn1iHzsdXztSqnkbD0j9Gz4YpfzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764346018; c=relaxed/simple;
	bh=e1DK8j+FiXmlj1eFN8Izgd5UcqsQJns59AycqwDqK3Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sME5ZYMrAxfJl8KAUoDZtOMK03Qa9TlIlCtpCPZMRpHEZbuuBI2TNfnZWiKBBkNJZCYzqR6zGf1+vFMu4AVQaBCKfNR1qm0r/mtXU3kgPvOoMt/k7mQAsZa+dNSs3iXpOgbXI7Qb28jfVVrnVa9bWqZDvD8Y82BONs7ebSba7qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f/BePjlf; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/BePjlf"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso2384665b3a.3
        for <linux-staging@lists.linux.dev>; Fri, 28 Nov 2025 08:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764346016; x=1764950816; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UGmuQqZjeUhbRmxIHTmmKtGFb/p0zxMormCTfTuA8dI=;
        b=f/BePjlfq3Wf5aL+KrZDHhSUQV9N1jImfmtIdX5BFAxOIiNe8yVYMVvxAnImA62QTD
         kfUg9jLrjGgqiDkk24Z1rkJecEcQvHbVqyiTNXNHwSgTvV1fjkI9lwbmUkHSAjgWAsRw
         r7+My8LkGwnMviC7ObKUE6fbXZB679+0yfOhqPsuAYDEBKRqmRDTDbR39RO98ixrBi3q
         zIdjkqpgTQqfAlMjAT/6bPYorIR7PBO1SY5GPAt7h4MDzALUmT/1mwYJ7nw49MXE5ZKr
         QB7H697saVIrZtMZ8X7rJ7vlqK87WbFF9F9rSJcS/pl5zvL7aYkjoBQ9f3Ig+Ij5MDgx
         TYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764346016; x=1764950816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UGmuQqZjeUhbRmxIHTmmKtGFb/p0zxMormCTfTuA8dI=;
        b=nON+PCriud0Y7M2F0FHHUacr/aRpiKZ0lA3cxSTLWiLgQA7v8QQ+9Oj6H7/o+LLSiW
         tktU3adwxxrINgkN15Dg+dcQWybolfrbHz/K+ogpUGiHs7i7eg23mtLxMxiPEuRH5ceP
         0NCGZCrOSbiFrPOMgOypTv2I9SWEm5geN5cf+tgc/sJtRw3qaIibD9JZEeAaUVdGacsR
         xy9GSrpCB4VVXHdCMj2q875+MQM8NDxoZXc+eV9uke+actvm/JO37IKJp+ZhzuYT/EFu
         wlBTV+cwsq2XEzTZrxnT3uuQWCtbtgi3Y0sy3zDfuoK7pHT49mB0Uuntk7HwDjUuNCqg
         T65g==
X-Forwarded-Encrypted: i=1; AJvYcCXr86mcECSOW8XE/b9Khix7uvHWlwgGk3fYCtyXO4kK9QzZ93F3AY2A16AJpV2RawkkNZMVuW8EANC6hWm8@lists.linux.dev
X-Gm-Message-State: AOJu0YzuRVgdkNSQY/mihr2n9JV6Vd2cf19+hEWofjSojMeDp3nzn8kR
	kfcHCe2XOsftSKYs56Vyvlh5wNODkkhgnRKn6fKcaX9BGUNSuD11H7/P
X-Gm-Gg: ASbGncuZQ0M4iwyAUN4Tkg97ly8e+qfKpuiYZCNdkRF2c+e9AUFIkf0YMZ3blTAXh1b
	x6KWLTXWT4ChABd896qZx9MlEAPS4OiygcRWhxqqK6+3+017/LbbTXDitGXWFjpHm/k7YPcsRu7
	zOMBg0c06Z5kWSy86t2OrWWe8sOvgQUNDnOr7LBH7rdYl5JlCqudSL/Pd9xw72LbBklDI9g2dOr
	77IxDm35Wv5Wu4AKNfNACEcL32XwB/tUUruEeVo3AKA+PToVbf+u/lnq74KJfxHw8vg9k1pObCb
	ZJnVMSsmNYP39B43Tvik0DzRIVrmiLT4BRIKgO6XSt1TBmMkEhI1L+j55KR7Q+MgBKHedfg189u
	LcZPKU18t0tiFU3LvXI7EqzDqb20TRUvYY9ASr01i1hzHNPZ7DCZZ4WfiDky4o+7hFV4TxLQMEl
	oHuD/TnN0BzA8D58J/b65YnKVdvptOWWRMwWue8A==
X-Google-Smtp-Source: AGHT+IGqQi/OiFjS5pDqCveMxUEGU2hbXLOMS4pWdjHOTPjXEVY9szwG71GV7vAeUueeEkA+Bqs+sw==
X-Received: by 2002:a05:6a21:33a3:b0:35e:4b35:3669 with SMTP id adf61e73a8af0-3614ed962d0mr30665526637.31.1764346016068;
        Fri, 28 Nov 2025 08:06:56 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15f26f11fsm5408499b3a.50.2025.11.28.08.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 08:06:55 -0800 (PST)
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
Subject: [PATCH 5.15.y 13/14] timers: Update the documentation to reflect on the new timer_shutdown() API
Date: Sat, 29 Nov 2025 01:05:38 +0900
Message-Id: <20251128160539.358938-14-aha310510@gmail.com>
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

From: "Steven Rostedt (Google)" <rostedt@goodmis.org>

[ Upstream commit a31323bef2b66455920d054b160c17d4240f8fd4 ]

In order to make sure that a timer is not re-armed after it is stopped
before freeing, a new shutdown state is added to the timer code. The API
timer_shutdown_sync() and timer_shutdown() must be called before the
object that holds the timer can be freed.

Update the documentation to reflect this new workflow.

[ tglx: Updated to the new semantics and updated the zh_CN version ]

Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Reviewed-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Link: https://lore.kernel.org/r/20221110064147.712934793@goodmis.org
Link: https://lore.kernel.org/r/20221123201625.375284489@linutronix.de
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 Documentation/RCU/Design/Requirements/Requirements.rst  | 2 +-
 Documentation/core-api/local_ops.rst                    | 2 +-
 Documentation/kernel-hacking/locking.rst                | 5 +++++
 Documentation/translations/zh_CN/core-api/local_ops.rst | 2 +-
 4 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/RCU/Design/Requirements/Requirements.rst b/Documentation/RCU/Design/Requirements/Requirements.rst
index 546f23abeca3..49387d823619 100644
--- a/Documentation/RCU/Design/Requirements/Requirements.rst
+++ b/Documentation/RCU/Design/Requirements/Requirements.rst
@@ -1858,7 +1858,7 @@ unloaded. After a given module has been unloaded, any attempt to call
 one of its functions results in a segmentation fault. The module-unload
 functions must therefore cancel any delayed calls to loadable-module
 functions, for example, any outstanding mod_timer() must be dealt
-with via timer_delete_sync() or similar.
+with via timer_shutdown_sync() or similar.
 
 Unfortunately, there is no way to cancel an RCU callback; once you
 invoke call_rcu(), the callback function is eventually going to be
diff --git a/Documentation/core-api/local_ops.rst b/Documentation/core-api/local_ops.rst
index a84f8b0c7ab2..0b42ceaaf3c4 100644
--- a/Documentation/core-api/local_ops.rst
+++ b/Documentation/core-api/local_ops.rst
@@ -191,7 +191,7 @@ Here is a sample module which implements a basic per cpu counter using
 
     static void __exit test_exit(void)
     {
-            timer_delete_sync(&test_timer);
+            timer_shutdown_sync(&test_timer);
     }
 
     module_init(test_init);
diff --git a/Documentation/kernel-hacking/locking.rst b/Documentation/kernel-hacking/locking.rst
index c447d55fa080..3bbb11ba647a 100644
--- a/Documentation/kernel-hacking/locking.rst
+++ b/Documentation/kernel-hacking/locking.rst
@@ -1007,6 +1007,11 @@ calling add_timer() at the end of their timer function).
 Because this is a fairly common case which is prone to races, you should
 use timer_delete_sync() (``include/linux/timer.h``) to
 
+Before freeing a timer, timer_shutdown() or timer_shutdown_sync() should be
+called which will keep it from being rearmed. Any subsequent attempt to
+rearm the timer will be silently ignored by the core code.
+
+
 Locking Speed
 =============
 
diff --git a/Documentation/translations/zh_CN/core-api/local_ops.rst b/Documentation/translations/zh_CN/core-api/local_ops.rst
index 22493b9b829c..eb5423f60f17 100644
--- a/Documentation/translations/zh_CN/core-api/local_ops.rst
+++ b/Documentation/translations/zh_CN/core-api/local_ops.rst
@@ -185,7 +185,7 @@ UP之间没有不同的行为，在你的架构的 ``local.h`` 中包括 ``asm-g
 
     static void __exit test_exit(void)
     {
-            timer_delete_sync(&test_timer);
+            timer_shutdown_sync(&test_timer);
     }
 
     module_init(test_init);
--
