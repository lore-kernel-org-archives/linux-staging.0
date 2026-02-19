Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F5635294F
	for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 17:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771521252; cv=none; b=QPUw5B2TTh9RzPz7gAJZoN6mwK3zbPjhQwI+7l6TYMaKqV+mB74Hz7/a6hB4xR9hWyoNFKQbgRkX8AQlf3iujIlnFcrHEezOwpBezz7+zDobCVDDctWL1m8VdQPSDaQjMl/e5xUUnCpwTeqb1Tdoo7btdiz0Fk2GNC1+NhU3/TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771521252; c=relaxed/simple;
	bh=KahrOTGFxHDsPLdgeyQZNnXk2bivNdYNaTpq/NJnvcw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c2UB7PyT4R8tHTI7z282eVfZm5Y/qi7ahk2FlbZcFuLTm9kJvXI4qXaaKO94ragXU92KL+A/mz8J1aKoH22Ct+Z+dWOslve2+J3DClMONaHEU+s/SlYIDEUOoYEN0Puxf/RGvRz6q2oUWkr1cm3qt78Wwz8Jd3wAJZk60AJ1Yjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZECtjPUU; arc=none smtp.client-ip=209.85.215.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZECtjPUU"
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-c70378ddaafso660556a12.3
        for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 09:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771521250; x=1772126050; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+9Ys25lUX49p5aMZ9MF04Fc/6uWbxWTtkfKKvleWffc=;
        b=ZECtjPUUY7SfkKnQHEA4UOrDMqjfYa+w7g+gnzIogwMqJiYCKNhHp3iH24k4D4RzG+
         q0xebAatSc0qyVHh9EycEQGgDBWSLq9s0E39glrjkqxxMjCCwlL0WKULb8HM4vtlJdNK
         hgiJrqIeBpoSKTj2vaCpPPXnDxJrohkHpW02lWfO+VpRKikE8IMYUnybXeNnFlw9lExx
         ng9Y2OQaLpL8az1yZc3pPpBvYA1zMG8SmTRnFI9TXvzd8yO6gXwAtSXd5MEb+zcxn8sb
         gAIBlLKs6hL7ejF4RCqPBC8Kfa6h5fKRha1gUfdweixpfOhgzxTDaH7SDhK2JgxOiilz
         wGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771521250; x=1772126050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+9Ys25lUX49p5aMZ9MF04Fc/6uWbxWTtkfKKvleWffc=;
        b=PzHvnQLVPIEMK3DAdQsz3fxBOtLnW7LlGcMayDCbGKcZPoGTXoq63Ou9QFhAGaa/bp
         OrDb2fJigCrYaaZ6tsoynKXqz1kbISeDQgb6DY570dQaIAFS2JuMK7djUL9b6P9dUcm+
         l9zjqIb99QHKodPPgeHr3sophHA2aK2oDpd9iCy74hYm6RIUEqg2MI4ilw16GNqJNA3h
         0lGBwpKD5Sz9ehroJlJvPztCpfeKjl7I9vg0a5m9jUmvg8gwtu5HXCTPE9/SOjJi9Tx/
         Wy8f8WCKYMAIfxiU/jvSmkcmPZbP6lBV2jHyibDWrdWjZc0Im52qmhDRvY6KkoSK2mrs
         RLHg==
X-Forwarded-Encrypted: i=1; AJvYcCV+kCARK0dEtfjUfPrU2JKMpv5V5ys2fp/UIPyuOfeJsc7cX1cPHxW5JL5bMDqdWhDSe6pNTHnlF/14IhXL@lists.linux.dev
X-Gm-Message-State: AOJu0YzYF+I0wvaECiMQmB6JLvTNkja7eNoJKDrPK2EYunBUtqzJb+rh
	pCCzw9K7gNyR2SXHmiOcQ9WFEyzab+5RxHzxbzXlcKM6qFfiyXaiCjd7
X-Gm-Gg: AZuq6aL0+o+zac/Njk0HlxALawDJoEfNXSqhHl5eAFuM+WQtwr6rjHalKk+5sv89ooE
	AOG5aPxg8+cD092jTYkAL/goffpgiZ26bzaOmiRCXomIP3us0SWQ+4gjiMc68ovz1jo2tjOqaa9
	zclCq41VuSFZbNSCeZkMX2KwstcWdfBH+C0WyfnuZcNgVXkl2Uj7YguGwHyAHQwW88fV2qrQx+h
	4k4z6MOL4opf0FzM7QDb2zKpSeAd2SCmb4BVer+9EGIG4IJYKQHLNSmzmljvwlA8JQjx0e9uS6E
	5ymE2+Qlq7sWXEfmAYaRcIYD3oatv6NB0qYXWLmA/uss1xJKK61moFJi3vHFFOHN9wkbJcjF74y
	5/vEDxsyv6SbipK/ay+48pB+Zl49sOmTNBvJCUrsxhcE34jbT+D1Wvp2QJ2Q4JGkJvWFGla3y+t
	K3xKlKqBeh59Dqt0KIy6mF21etMVhGuh/p4FBBLC92I5ntFDhzNA==
X-Received: by 2002:a05:6a21:7785:b0:395:1869:f63c with SMTP id adf61e73a8af0-3951869f8e7mr1782258637.18.1771521250511;
        Thu, 19 Feb 2026 09:14:10 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.236.165])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e532fa2e5sm15895002a12.26.2026.02.19.09.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 09:14:09 -0800 (PST)
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
	zouyipeng@huawei.com,
	aha310510@gmail.com,
	linux-staging@lists.linux.dev,
	Jacob Keller <jacob.e.keller@intel.com>
Subject: [PATCH 5.10.y 13/15] timers: Update the documentation to reflect on the new timer_shutdown() API
Date: Fri, 20 Feb 2026 02:13:08 +0900
Message-Id: <20260219171310.118170-14-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260219171310.118170-1-aha310510@gmail.com>
References: <20260219171310.118170-1-aha310510@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
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
 Documentation/RCU/Design/Requirements/Requirements.rst | 2 +-
 Documentation/core-api/local_ops.rst                   | 2 +-
 Documentation/kernel-hacking/locking.rst               | 5 +++++
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/RCU/Design/Requirements/Requirements.rst b/Documentation/RCU/Design/Requirements/Requirements.rst
index ad2cc20131ec..e8af3dc3c95a 100644
--- a/Documentation/RCU/Design/Requirements/Requirements.rst
+++ b/Documentation/RCU/Design/Requirements/Requirements.rst
@@ -1858,7 +1858,7 @@ unloaded. After a given module has been unloaded, any attempt to call
 one of its functions results in a segmentation fault. The module-unload
 functions must therefore cancel any delayed calls to loadable-module
 functions, for example, any outstanding ``mod_timer()`` must be dealt
-with via ``timer_delete_sync()`` or similar.
+with via ``timer_shutdown_sync()`` or similar.
 
 Unfortunately, there is no way to cancel an RCU callback; once you
 invoke ``call_rcu()``, the callback function is eventually going to be
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
index 86ac2f4d24f7..4b8fd764aa7f 100644
--- a/Documentation/kernel-hacking/locking.rst
+++ b/Documentation/kernel-hacking/locking.rst
@@ -1016,6 +1016,11 @@ calling add_timer() at the end of their timer function).
 Because this is a fairly common case which is prone to races, you should
 use timer_delete_sync() (``include/linux/timer.h``) to handle this case.
 
+Before freeing a timer, timer_shutdown() or timer_shutdown_sync() should be
+called which will keep it from being rearmed. Any subsequent attempt to
+rearm the timer will be silently ignored by the core code.
+
+
 Locking Speed
 =============
 
--
