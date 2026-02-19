Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12462352FBE
	for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 17:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771521260; cv=none; b=dFRb821+7n1vOOSD1Imy04yBBObkfXYNyM7l/qmeR1keUyXdzJ6W91eYJ+fEJqLGJ63lMU6raMTyMlexFcigEdcMx2Sni8/h4FkU8DgdiNAFgBEyq52VYI86mEfzznEOjr+NPd/42EPsrj9GWKxlbIvr004igXiVKZBmHsda1zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771521260; c=relaxed/simple;
	bh=Hkj+3H7Z8a3D2Y8tRX2SbgMdeMF/kuGLJMd704mftHc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZNcc+FexSl54He2jm7r7S2wPEj8+pJgZE2oOoLb4kkMkULsYqQ3sMsZplOjUcO6L6BxqM/4qdQ9WgX1J672Djl9Xcdc4hcg80/VQDmEVtNpadC0lS2qk9I2TczCBHC7+jGco8lV7R4qRpJK5TqyR0xI9+VicYg4vm30Nm6vY5Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XFp6FWvv; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XFp6FWvv"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8249cb73792so1030100b3a.3
        for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 09:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771521258; x=1772126058; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKKfl8PT/GCaUO5UcTwQ5MiYDnn0Vh3veSo7jvr1Ic4=;
        b=XFp6FWvvyuu4aaPFNwK4eWZzkksXt+85is9/OpMI5ELDkRluXPjSlFCqMY3ekMS4LY
         hGUZlWW7m0LoqlLuA/LmXQcJ0ZBUGxROtLDLUxCjxJK6YMwkuWUKq3UsN8M2OlnAqb2H
         PG7x53uv6B4XWVwIBCAe/v5zsjWlmz3Kq4fDCpaQH6eX9x+dJHBkJmeveYKYjLmk2Bem
         AlVhyl0eDGxfpRfpHNFoWCFe8N0zwhWhTjPvWTPRT4cgIYwaS1sNfXIsUmH7RDzNt2aj
         fMmvVXC8d0oAufgDXB7Jtp46LrlHiRaPdlyQGyjb4QA+ufJBMg5WJHBxXs4LKKagSz0y
         ZlDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771521258; x=1772126058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QKKfl8PT/GCaUO5UcTwQ5MiYDnn0Vh3veSo7jvr1Ic4=;
        b=vgTaWJAJq+EpbPsaFNdmePKpOUsnzfKpOECuI9AeJ/gpTZJusBbJ6HrZV0FKjyWXSJ
         42clbEpAjp9Me/3hI7W+IMDjCn7AP/idm+1bgENNlqnS+VZnuFCnimN9SjwJA+fSnrA/
         dcmZ5A5N+sOqxvDGGAs45sKgAxDXwr66/7uIna0dGuSu92tbzGVEGsXvoSUk9qtp2BBy
         bszVdBdTQiIlGFTG0MpmhcBPzjBQVUnYkfiyjWRa+m3Dxi2ksNno0xr9JsAU3T1bAP0Z
         RPnvpNEnSoFa3bZGHyekim19b2Llc9VylwQ/2s9+j5HTZ0v37NScpx02b/Hm7iCZL+B3
         zrfg==
X-Forwarded-Encrypted: i=1; AJvYcCV32DLZJkGQQ1BQo2gnFiuHUHXYmH9V/StgpPBmixCKzwCohgQlYKBON4szqIHzO8pMMPTXyetr1KXYHKTv@lists.linux.dev
X-Gm-Message-State: AOJu0YxHXySYGSC9WhgR7IP6x5O19VgyaN1nudMPUwEy86LDDdeIiis2
	ywQiw32SUFMEe+x139cCzzd7IPUtc/mFcAKHYuzbo8DlMfbD5zBaoQcI
X-Gm-Gg: AZuq6aLoomR+ICce4AFNUeZxhQKq1NCqrta2IGfKAUsSP3jcfQdfHEUSTxZhyGmg/1D
	RcsVe8ha4N7qhInGvbHgPBD5Tpg/gC+AIBQSXcrAf7x3SuMaIAHX/mRjTrqPP2qVsvso95u+cru
	6mZmhbcOTJeDNneKiipstR8j6ceZedQWBQ5U8y1G/EhOAKpGv60bcbzhIfRJVjiyKY79SrX32Ba
	EqowzZ+06psA2dxiA+E+S1YHV1PCDUHiNxYPAp1xU+DQXV9x7hl0/5utbve+2NapeKTIvcjU3uk
	0oEuqyokuAzd8ocaEKWBPLEMMCugCApiFfxLIKfetA8sGgFNQp6T7cPbpW9mRuDnTKa5AZT4IMz
	GlLTkkZCjh0ccL0WI9MyO/lajkCp75vAu0Nd6CmOAOFZLuBLcDJ/+QOjRWlgYeYFzzdn1NEc38a
	7R0wMPjR8nuFJsOhmn1gZbUBMyCB7JOtQ8jEdkBNPDva0GA3Zk5A==
X-Received: by 2002:a05:6a20:cf88:b0:361:28dd:a9ff with SMTP id adf61e73a8af0-39483a5a85dmr17158114637.38.1771521258512;
        Thu, 19 Feb 2026 09:14:18 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.236.165])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e532fa2e5sm15895002a12.26.2026.02.19.09.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 09:14:17 -0800 (PST)
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
	linux-staging@lists.linux.dev
Subject: [PATCH 5.10.y 15/15] timers: Fix NULL function pointer race in timer_shutdown_sync()
Date: Fri, 20 Feb 2026 02:13:10 +0900
Message-Id: <20260219171310.118170-16-aha310510@gmail.com>
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

From: Yipeng Zou <zouyipeng@huawei.com>

[ Upstream commit 20739af07383e6eb1ec59dcd70b72ebfa9ac362c ]

There is a race condition between timer_shutdown_sync() and timer
expiration that can lead to hitting a WARN_ON in expire_timers().

The issue occurs when timer_shutdown_sync() clears the timer function
to NULL while the timer is still running on another CPU. The race
scenario looks like this:

CPU0					CPU1
					<SOFTIRQ>
					lock_timer_base()
					expire_timers()
					base->running_timer = timer;
					unlock_timer_base()
					[call_timer_fn enter]
					mod_timer()
					...
timer_shutdown_sync()
lock_timer_base()
// For now, will not detach the timer but only clear its function to NULL
if (base->running_timer != timer)
	ret = detach_if_pending(timer, base, true);
if (shutdown)
	timer->function = NULL;
unlock_timer_base()
					[call_timer_fn exit]
					lock_timer_base()
					base->running_timer = NULL;
					unlock_timer_base()
					...
					// Now timer is pending while its function set to NULL.
					// next timer trigger
					<SOFTIRQ>
					expire_timers()
					WARN_ON_ONCE(!fn) // hit
					...
lock_timer_base()
// Now timer will detach
if (base->running_timer != timer)
	ret = detach_if_pending(timer, base, true);
if (shutdown)
	timer->function = NULL;
unlock_timer_base()

The problem is that timer_shutdown_sync() clears the timer function
regardless of whether the timer is currently running. This can leave a
pending timer with a NULL function pointer, which triggers the
WARN_ON_ONCE(!fn) check in expire_timers().

Fix this by only clearing the timer function when actually detaching the
timer. If the timer is running, leave the function pointer intact, which is
safe because the timer will be properly detached when it finishes running.

Fixes: 0cc04e80458a ("timers: Add shutdown mechanism to the internal functions")
Signed-off-by: Yipeng Zou <zouyipeng@huawei.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: stable@vger.kernel.org
Link: https://patch.msgid.link/20251122093942.301559-1-zouyipeng@huawei.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 kernel/time/timer.c |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -1360,10 +1360,11 @@ static int __try_to_del_timer_sync(struc
 
 	base = lock_timer_base(timer, &flags);
 
-	if (base->running_timer != timer)
+	if (base->running_timer != timer) {
 		ret = detach_if_pending(timer, base, true);
-	if (shutdown)
-		timer->function = NULL;
+		if (shutdown)
+			timer->function = NULL;
+	}
 
 	raw_spin_unlock_irqrestore(&base->lock, flags);

--
