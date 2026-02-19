Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3348134E774
	for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 17:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771521230; cv=none; b=gaEpJIj5ePINkEinQXwIWiqBh1nKg0JcTfHkdQLK67ombQ6YjmgWvKOu3i1tLIaKzG4yZzpr10stEF9mUf82DTI6jI2T43LEfXzXoM4cPWt/MXQ4zFGADI3fqY6PKI0GGIcYH17oQRqWYlCvfrCMvKplkVCc8ZuBapWp4VweuAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771521230; c=relaxed/simple;
	bh=k6En+RE2oEi/aaa6/FdQNRaFuxL1eHAD2YO7U6RNZuY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pSqqiOQKdlvNswhzJh+h1/9eqikKeDkN3mkntK8oPsEkDhjtDaP1DsMh0hEWBxqKyKB0SQLS2QYqBTyx4MhjRA5mN0715/T3Pz1mV7Yq9wrDO27Q97baxEAbrhcxOOWXZey1KjabatJwGyO2j+LoB2vnw858sFJFM4T4F9zmslI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EbneovSr; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EbneovSr"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-824b05d2786so867117b3a.2
        for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 09:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771521229; x=1772126029; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXffZK0HVFgBoSDOar6/ghoDeSLCHeI4/7cALkB4cBE=;
        b=EbneovSrkXQj5yVr277Ci3jPjcCQJBa2hHS/0smTdfnecJ+akPMx5cA17WC0d8xQq4
         PojiKPOjf3zLVlY4G65MPOnPn7F/29YuDtRahfN/hpTmJc22YteYI4aJ+8KpLKYtjCwZ
         5HzsL0bSgld2djYOLsQZ03jiG8fOJhm23YRn4DVbQih8BEWnwLP2l5uqKDGzy1upBXE3
         P65m+mWQPz0FD9MxEMVzM5UyOqZxsWjcQ5lv246DUca134r+abHmtPIa0ZLpasPu9SBp
         lltF/uhjVvnYs3NBX8kkk9hqh2o0vfIBKhuO13i2MORsoTrX3+27MfQzUlhyaOPUMURx
         1ZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771521229; x=1772126029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fXffZK0HVFgBoSDOar6/ghoDeSLCHeI4/7cALkB4cBE=;
        b=Dcff9a4UXz0/cYrbn8a/7m1Kj2KssprQoztBvjJxmTETh0U0PH3IR7gvvtbJ0VbcGM
         qklzasrpSkdePXMM2Ict8tHQfvHp/zMcNztNC2hcjWp4qq3uK6E/MFRzbbEHcbT4xTsV
         JzYQfEGt8I87/RJQtMVwRWCzZVi9hwBxVTsvvguHfxnKACYdRqy0SxA51eVh7TiPdoWM
         s4wBP/wWVZAqM2l1PTFHOa175wd5q+Ld1Ce595cgCPEtE2C3uo9nRKf2e1MyqyrGvQNT
         96GbO0c4PxTq1/h8wrdkY4LG642tE7w0umpY82M/QUN0ugmHEUxt2EK3otZsAgG+PlbY
         /LBg==
X-Forwarded-Encrypted: i=1; AJvYcCVwB6cKbylvcLzluPH2UjjlP2HYLX8JTKIEc8Fqom0X0VfdJeHOW+7YOss7oKXjSZ68fD6oIcjMncg9hMZv@lists.linux.dev
X-Gm-Message-State: AOJu0YwgAWR4s1BR1kKwIlcJBCvm/29GmrAAMiWihaDSh5g42t1s+hf0
	ng0gL624W/SpaGIEw1zWlMfYSx7jZEaW8KzbBxNTisV4IjIGfwelcLsX
X-Gm-Gg: AZuq6aJlA2bYmExBPyLl83cxXRseQOYqQt0JAMhR/a9evQJJ9qz5YmzA5jCiV7lSAe9
	9NJ8pnFqsSXC6W/2I3Cd5KQZyiY/+j8sUm7+KL6kf/JZISFjeDtWZ4l3TOQxSgtqeiJpQEYcjfG
	Q1vn4GOw8tNuM5RSUa1j40hm2ZiK51F9Bw3acDAdbYg9x1I/74NNsmYdUjDU8R2FgEp/cTxd+Az
	t9GLRiJ8UcTMU4LUPyjPsA9vNjU81CV+LuOtsS4rd+mys3gc52Kgi3RZxIEzBwN039cMAwNWjgG
	wF8ykr/PmcN/16C1ul7brm4qa8FZ806XSiGNUgAV9YUyE8yzvkQP6n1tzF8jQh3dttW/R8z63+T
	tN94ruU/FtaUH3aOlyOQUcYTdEsqumZu7IwVLgMg2YYwkIq+wWcxCGPLV6TqnH97fynPY5gYKQC
	5hZ3tNC1ubfDii1OT5hz0ioH/ADEfg66lwiAEE2vbVrGJJN7O63w==
X-Received: by 2002:a05:6a21:328d:b0:38e:c789:4f39 with SMTP id adf61e73a8af0-394fc339e83mr4954575637.49.1771521228655;
        Thu, 19 Feb 2026 09:13:48 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.236.165])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e532fa2e5sm15895002a12.26.2026.02.19.09.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 09:13:48 -0800 (PST)
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
Subject: [PATCH 5.10.y 08/15] Documentation: Replace del_timer/del_timer_sync()
Date: Fri, 20 Feb 2026 02:13:03 +0900
Message-Id: <20260219171310.118170-9-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260219171310.118170-1-aha310510@gmail.com>
References: <20260219171310.118170-1-aha310510@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Thomas Gleixner <tglx@linutronix.de>

[ Upstream commit 87bdd932e85881895d4720255b40ac28749c4e32 ]

Adjust to the new preferred function names.

Suggested-by: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Reviewed-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Link: https://lore.kernel.org/r/20221123201625.075320635@linutronix.de
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 .../RCU/Design/Requirements/Requirements.rst          |  2 +-
 Documentation/core-api/local_ops.rst                  |  2 +-
 Documentation/kernel-hacking/locking.rst              | 11 +++++------
 Documentation/timers/hrtimers.rst                     |  2 +-
 .../translations/it_IT/kernel-hacking/locking.rst     | 10 +++++-----
 5 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/Documentation/RCU/Design/Requirements/Requirements.rst b/Documentation/RCU/Design/Requirements/Requirements.rst
index 1ae79a10a8de..ad2cc20131ec 100644
--- a/Documentation/RCU/Design/Requirements/Requirements.rst
+++ b/Documentation/RCU/Design/Requirements/Requirements.rst
@@ -1858,7 +1858,7 @@ unloaded. After a given module has been unloaded, any attempt to call
 one of its functions results in a segmentation fault. The module-unload
 functions must therefore cancel any delayed calls to loadable-module
 functions, for example, any outstanding ``mod_timer()`` must be dealt
-with via ``del_timer_sync()`` or similar.
+with via ``timer_delete_sync()`` or similar.
 
 Unfortunately, there is no way to cancel an RCU callback; once you
 invoke ``call_rcu()``, the callback function is eventually going to be
diff --git a/Documentation/core-api/local_ops.rst b/Documentation/core-api/local_ops.rst
index 2ac3f9f29845..a84f8b0c7ab2 100644
--- a/Documentation/core-api/local_ops.rst
+++ b/Documentation/core-api/local_ops.rst
@@ -191,7 +191,7 @@ Here is a sample module which implements a basic per cpu counter using
 
     static void __exit test_exit(void)
     {
-            del_timer_sync(&test_timer);
+            timer_delete_sync(&test_timer);
     }
 
     module_init(test_init);
diff --git a/Documentation/kernel-hacking/locking.rst b/Documentation/kernel-hacking/locking.rst
index c43204b99df7..86ac2f4d24f7 100644
--- a/Documentation/kernel-hacking/locking.rst
+++ b/Documentation/kernel-hacking/locking.rst
@@ -976,7 +976,7 @@ you might do the following::
 
             while (list) {
                     struct foo *next = list->next;
-                    del_timer(&list->timer);
+                    timer_delete(&list->timer);
                     kfree(list);
                     list = next;
             }
@@ -990,7 +990,7 @@ the lock after we spin_unlock_bh(), and then try to free
 the element (which has already been freed!).
 
 This can be avoided by checking the result of
-del_timer(): if it returns 1, the timer has been deleted.
+timer_delete(): if it returns 1, the timer has been deleted.
 If 0, it means (in this case) that it is currently running, so we can
 do::
 
@@ -999,7 +999,7 @@ do::
 
                     while (list) {
                             struct foo *next = list->next;
-                            if (!del_timer(&list->timer)) {
+                            if (!timer_delete(&list->timer)) {
                                     /* Give timer a chance to delete this */
                                     spin_unlock_bh(&list_lock);
                                     goto retry;
@@ -1014,8 +1014,7 @@ do::
 Another common problem is deleting timers which restart themselves (by
 calling add_timer() at the end of their timer function).
 Because this is a fairly common case which is prone to races, you should
-use del_timer_sync() (``include/linux/timer.h``) to
-handle this case.
+use timer_delete_sync() (``include/linux/timer.h``) to handle this case.
 
 Locking Speed
 =============
@@ -1343,7 +1342,7 @@ lock.
 
 -  kfree()
 
--  add_timer() and del_timer()
+-  add_timer() and timer_delete()
 
 Mutex API reference
 ===================
diff --git a/Documentation/timers/hrtimers.rst b/Documentation/timers/hrtimers.rst
index c1c20a693e8f..7ac448908d1f 100644
--- a/Documentation/timers/hrtimers.rst
+++ b/Documentation/timers/hrtimers.rst
@@ -118,7 +118,7 @@ existing timer wheel code, as it is mature and well suited. Sharing code
 was not really a win, due to the different data structures. Also, the
 hrtimer functions now have clearer behavior and clearer names - such as
 hrtimer_try_to_cancel() and hrtimer_cancel() [which are roughly
-equivalent to del_timer() and del_timer_sync()] - so there's no direct
+equivalent to timer_delete() and timer_delete_sync()] - so there's no direct
 1:1 mapping between them on the algorithmic level, and thus no real
 potential for code sharing either.
 
diff --git a/Documentation/translations/it_IT/kernel-hacking/locking.rst b/Documentation/translations/it_IT/kernel-hacking/locking.rst
index cfd0bbabb113..adb17d3ab67a 100644
--- a/Documentation/translations/it_IT/kernel-hacking/locking.rst
+++ b/Documentation/translations/it_IT/kernel-hacking/locking.rst
@@ -1000,7 +1000,7 @@ potreste fare come segue::
 
             while (list) {
                     struct foo *next = list->next;
-                    del_timer(&list->timer);
+                    timer_delete(&list->timer);
                     kfree(list);
                     list = next;
             }
@@ -1013,7 +1013,7 @@ e prenderà il *lock* solo dopo spin_unlock_bh(), e cercherà
 di eliminare il suo oggetto (che però è già stato eliminato).
 
 Questo può essere evitato controllando il valore di ritorno di
-del_timer(): se ritorna 1, il temporizzatore è stato già
+timer_delete(): se ritorna 1, il temporizzatore è stato già
 rimosso. Se 0, significa (in questo caso) che il temporizzatore è in
 esecuzione, quindi possiamo fare come segue::
 
@@ -1022,7 +1022,7 @@ esecuzione, quindi possiamo fare come segue::
 
                     while (list) {
                             struct foo *next = list->next;
-                            if (!del_timer(&list->timer)) {
+                            if (!timer_delete(&list->timer)) {
                                     /* Give timer a chance to delete this */
                                     spin_unlock_bh(&list_lock);
                                     goto retry;
@@ -1036,7 +1036,7 @@ esecuzione, quindi possiamo fare come segue::
 Un altro problema è l'eliminazione dei temporizzatori che si riavviano
 da soli (chiamando add_timer() alla fine della loro esecuzione).
 Dato che questo è un problema abbastanza comune con una propensione
-alle corse critiche, dovreste usare del_timer_sync()
+alle corse critiche, dovreste usare timer_delete_sync()
 (``include/linux/timer.h``) per gestire questo caso.
 
 Velocità della sincronizzazione
@@ -1384,7 +1384,7 @@ contesto, o trattenendo un qualsiasi *lock*.
 
 -  kfree()
 
--  add_timer() e del_timer()
+-  add_timer() e timer_delete()
 
 Riferimento per l'API dei Mutex
 ===============================
--
