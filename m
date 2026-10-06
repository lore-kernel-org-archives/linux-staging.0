Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ADE503BDF
	for <linux-staging@lists.linux.dev>; Tue,  6 Oct 2026 23:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791328823; cv=none; b=iWlRlTaAX1VkD5sWUkl83jjJ/WLOgDvrI902FsGWvBiHig129LAk4EZp4FHvmZyM+CUpkFarkrsX7V+HctbHex+/aUMDc5JAqNHO4q6NWFRzqOyHEKevhcXZKk4ni0DkWIm/UMBPaOpVGjEDn8K59qv3jgSghqnAZHDAUQjKgWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791328823; c=relaxed/simple;
	bh=VQbKDtENdtiA/gHdO3Lp/ihBz95xu1qEeqYRSx5mLwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fZ6mexf8eqLyCuOtmopWvqitt3C7ALDlywaJhckqGtf03irbBuGmYVYQLjy0+RW8mLB7Y17M608PydwjrCMgA+zihw1KEwDD7JMkBl/De7tlNtrlZda2fHB3nSOHhMgpRIXuRfvT1MwaU3qnI2Zff3kZzlJuH48dFPm47SmJF3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ils/QC4n; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ils/QC4n"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1438d9363fbso1155711c88.0
        for <linux-staging@lists.linux.dev>; Tue, 06 Oct 2026 16:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791328801; x=1791933601; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e+WrNzXQAKfqTnjmMbSvbKj+VZWdk1qStCU+4tm1GM0=;
        b=ils/QC4nJUjxY+/01CIwSpzqWwbIxuuZltuH17rRXMykYUaDfuLqLuANIcK2td5REJ
         dELOiay7nnfaP4HIX0w9Fq2xHtIRtMw6tq3P/L1QngdUoVtmmgR4kG5fYO71k+HxJMLr
         EvK11dGSOoYxxogttqbwFtz4ywGRFV+d1obMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791328801; x=1791933601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e+WrNzXQAKfqTnjmMbSvbKj+VZWdk1qStCU+4tm1GM0=;
        b=T8FGEddTW3VTgpnFzS2fAGnZgpe9HY3Yk0nDELw+85BP6uPsKIiFOg2IlJPplAhp+2
         Y+mlh/BKa14V1wZ49yKye/ilwpfl2fnr8hOUUOlKbLNsnrxEkV/FFoTm/Em177VIt4wt
         EeVxe/5bSCIXYSY2hN0yTVJpFpHoH3Bn65T7KRlGS/3DqxeI/BXL7DgAK38ZlMvIxsfl
         XiTO3tTMjbONBCSSbs5WAjqvpplbQ40cPs85IZjCFWCQ8zZH8RhKpqFTJvsBpn7zyi6L
         LF9WTsdu+0pUq0CbdhYg+hzTnerv+v1NUelt3Qfk2N+AkhEhK4xOPotrjcNOpbTlFrh5
         +4Og==
X-Forwarded-Encrypted: i=1; AKwUvBz9cqLbttSLuGXlNGRh99uILy/vBx9ygwSBcaSOEU/X+lux8WUKj5fG430dIvODJLifYoDMbhQoogEaETQE@lists.linux.dev
X-Gm-Message-State: AFuF++kG/3l7l2rjQbgVkx0O4J28sOfirAi0qSsbT6NLIRcf7HnmHa2K
	Ytc1Jv7HHjk/Vf7sb167NuwFkgy19IYNcDIBRRwlVa/0nj3F8dhDwhu6ywJLi3C6Bw==
X-Gm-Gg: AYBFou2h3BviU+ph6IyS5kKXQqQeXV36mswa+Wfp70EBgnR81ytfi64DNxZSt/Fvprs
	lIrLGd+AbnjblSCUoH2XYXK5X4m+P4LsLCZAAdCmzAkJxFO4Ts0qlVq887s0t44lRdf2yoX6mtD
	oow5CdA9zbGI0GbAALRemJB145bPjq3SkGPRZbnRzI1eeFt7Qk4KZx2NnqCXnKpWTX/LZbAbbqm
	ILfP7y4M0WC2tkvYFGFBc03TI+Bpe1KDRtTqO1Uos2Rxw/0Vsa97nZtictzVGj8el0o75Y3+Sjt
	m4ZOPeLmyGpEnd/Ws/BQmLJWKguFnyLQ0ySH0PBQ6l1LkuM6LmNugsiKEW5pAng3T9zoVRKHP8R
	wPpR4tLMKddgdgFu8j+kmB1bXMJOFjyJ7hcy/SZSYe4RvzUH0Dwa+X3CvvxpTJFZF8z2rGg6HZZ
	+fCfEroxGnPX20X1gm8+7zO0hbdr1TecLNN09x+54DB71j5oyiakrO+szXcpYVLzJ19EndIBJmi
	W4DX90uA+jCFEDiA8eKjm6B2JuDGO9EtFRYoQ==
X-Received: by 2002:a05:7022:439b:b0:14a:a6dc:9cbf with SMTP id a92af1059eb24-16205044165mr471978c88.4.1791328801526;
        Tue, 06 Oct 2026 16:20:01 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:63eb:e7f9:1d47:7d47])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-161680e191esm1584805c88.11.2026.10.06.16.20.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 16:20:00 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 07/13] greybus: Discard pm_runtime_put_autosuspend() return value
Date: Tue,  6 Oct 2026 16:13:35 -0700
Message-ID: <20261006161337.7.Ib0925681ca623093ddf812cc4de848e10ec07c73@changeid>
X-Mailer: git-send-email 2.56.0.360.g66cac248cb-goog
In-Reply-To: <20261006231900.3230373-1-briannorris@chromium.org>
References: <20261006231900.3230373-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Returning an error code from pm_runtime_put_autosuspend() merely means
that it has not queued up a timer or work item to check whether or not
the device can be suspended and there are many perfectly valid
situations in which that can happen, like after writing "on" to the
device's runtime PM "control" attribute in sysfs for one example.

Modify gb_pm_runtime_put_autosuspend() to discard the
pm_runtime_put_autosuspend() return value, change its return type to
void, and update its caller in the Greybus power supply driver
accordingly.  Also drop the redundant pm_runtime_mark_last_busy() call
from gb_pm_runtime_put_autosuspend() while we're here, as this is
already part of pm_runtime_put_autosuspend().

Note that this resolves a bug in the power_supply driver: in tracking
'gbpsy->pm_acquired', it erroneously assumed that
pm_runtime_put_autosuspend() would not release a refcount when it
returned a non-zero value. That's a false assumption.

This will facilitate a planned change of the
pm_runtime_put_autosuspend() return type to void in the future, similar
to commit 3afd8df02433 ("PM: runtime: Change pm_runtime_put() return
type to void").

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
This patch is independent of the rest of the series, except for the end
(changing the return type). I expect it can be applied by individual
maintainers, and we pick up the end once the dust is settled.

 drivers/staging/greybus/power_supply.c |  8 ++------
 include/linux/greybus/bundle.h         | 12 +++---------
 2 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/greybus/power_supply.c b/drivers/staging/greybus/power_supply.c
index 44bd8a72fa50..beefcbaf3681 100644
--- a/drivers/staging/greybus/power_supply.c
+++ b/drivers/staging/greybus/power_supply.c
@@ -377,12 +377,8 @@ static void gb_power_supply_state_change(struct gb_power_supply *gbpsy,
 			gbpsy->pm_acquired = true;
 	} else {
 		if (gbpsy->pm_acquired) {
-			ret = gb_pm_runtime_put_autosuspend(connection->bundle);
-			if (ret)
-				dev_err(&connection->bundle->dev,
-					"Fail to set wake unlock for none charging\n");
-			else
-				gbpsy->pm_acquired = false;
+			gb_pm_runtime_put_autosuspend(connection->bundle);
+			gbpsy->pm_acquired = false;
 		}
 	}
 
diff --git a/include/linux/greybus/bundle.h b/include/linux/greybus/bundle.h
index df8d88424cb7..361a94d3499b 100644
--- a/include/linux/greybus/bundle.h
+++ b/include/linux/greybus/bundle.h
@@ -59,14 +59,9 @@ static inline int gb_pm_runtime_get_sync(struct gb_bundle *bundle)
 	return 0;
 }
 
-static inline int gb_pm_runtime_put_autosuspend(struct gb_bundle *bundle)
+static inline void gb_pm_runtime_put_autosuspend(struct gb_bundle *bundle)
 {
-	int retval;
-
-	pm_runtime_mark_last_busy(&bundle->dev);
-	retval = pm_runtime_put_autosuspend(&bundle->dev);
-
-	return retval;
+	pm_runtime_put_autosuspend(&bundle->dev);
 }
 
 static inline void gb_pm_runtime_get_noresume(struct gb_bundle *bundle)
@@ -82,8 +77,7 @@ static inline void gb_pm_runtime_put_noidle(struct gb_bundle *bundle)
 #else
 static inline int gb_pm_runtime_get_sync(struct gb_bundle *bundle)
 { return 0; }
-static inline int gb_pm_runtime_put_autosuspend(struct gb_bundle *bundle)
-{ return 0; }
+static inline void gb_pm_runtime_put_autosuspend(struct gb_bundle *bundle) {}
 
 static inline void gb_pm_runtime_get_noresume(struct gb_bundle *bundle) {}
 static inline void gb_pm_runtime_put_noidle(struct gb_bundle *bundle) {}
-- 
2.56.0.360.g66cac248cb-goog

