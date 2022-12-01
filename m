Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D824EED4
	for <linux-staging@lists.linux.dev>; Thu,  1 Dec 2022 05:38:58 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id v3so753430pgh.4
        for <linux-staging@lists.linux.dev>; Wed, 30 Nov 2022 21:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oregonstate-edu.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRfrpCcdqhoeRuzp0v0IXZ5eoT0+P8wQNToDtSeombQ=;
        b=B1o+NjOouQZew+heE6cm5PhgsIcyy1P3Hsc8vVzE0C/9e3esOd6qr+Qc3h+rzm8PS/
         PJmO4eSqErWMiypt13e3lWSpO9WHbPSLvrij11cWHOSp6enEvg4hAwHcWFSCB1Dxutgl
         z3pYnMa6PRethsqm68NXIaS99oRI0qzb7yyopvR6VjM2yiG2I5U09x99JsAWptmrkeHc
         w32uQgTH1LWQaV0sPkvnDH9eYc6Y+qTbY36Qnvttw6wvvuUlltEZuHZKgx3jk33r3FPZ
         37GP3yowNEGApdcLw2YSka5I9xbXqCO5zZWQrUtcQrs/lWx7hXOaWYkTRx/I0vObK15+
         rsNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gRfrpCcdqhoeRuzp0v0IXZ5eoT0+P8wQNToDtSeombQ=;
        b=cY+0F23eQMkSVkYU1eJbyEpC1W89p/8EmeyhYax7EpJPTYQTvw5BvtXNZLTXHzxDut
         FL1oUF8/5RYwF+nWPJqPgZlo/PCVaMnrmkowtMc0uEXhtHdui0+6eqdcoIyrtL5A2LbV
         696qfFiMuoyfXwsOYZoNUoGbJbIP5QpF+DsHBc/n7JgJOhxK5+QCALnEYqkBl8qt3wQ0
         z4vPpmlcAGCs5tbIOmrzZYXKsuLJTjxLBvwF+1kzxZtFPUm08smWMOJvub5Dd7YK/rtX
         J3AY8xI8h1Qo59Cpxa0uY+pUB2WwIQd0cc5xAAT3anA4aTBDvAavAdxZhcvA/eg4Y/ft
         VoGg==
X-Gm-Message-State: ANoB5pn+bQKLoc+RY2+EsIqFfX3SoJh2Nku2qquxmHienrZxw9sXii+e
	R7RNsng9nZpi5IOLZvidZ3cMWw==
X-Google-Smtp-Source: AA0mqf5LPxEjAzNgW88Jnl+1oVaRnxxuYa8oFMCErDjxgH0BduX8j7GonuWToggh9lLYlQMtaVjQ3Q==
X-Received: by 2002:a63:4d49:0:b0:46f:b030:7647 with SMTP id n9-20020a634d49000000b0046fb0307647mr39012597pgl.13.1669873138369;
        Wed, 30 Nov 2022 21:38:58 -0800 (PST)
Received: from ubu ([76.27.231.73])
        by smtp.gmail.com with ESMTPSA id d77-20020a621d50000000b00575fea99db9sm1282958pfd.27.2022.11.30.21.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 21:38:58 -0800 (PST)
From: Jack Schofield <schofija@oregonstate.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Jack Schofield <schofija@oregonstate.edu>
Subject: [PATCH 3/3] staging: greybus: loopback_test: Remove extra blank lines
Date: Wed, 30 Nov 2022 21:38:52 -0800
Message-Id: <51edbcc7583d64d3fe5a203d3a8649a695ef4a75.1669872193.git.schofija@oregonstate.edu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669872193.git.schofija@oregonstate.edu>
References: <cover.1669872193.git.schofija@oregonstate.edu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up extra uses of blank lines that do not follow the kernel coding
style. Issue reported by checkpatch.

Signed-off-by: Jack Schofield <schofija@oregonstate.edu>
---
 drivers/staging/greybus/tools/loopback_test.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/staging/greybus/tools/loopback_test.c b/drivers/staging/greybus/tools/loopback_test.c
index 7c1697304ab4..d7ad51ff60c5 100644
--- a/drivers/staging/greybus/tools/loopback_test.c
+++ b/drivers/staging/greybus/tools/loopback_test.c
@@ -239,7 +239,6 @@ static void show_loopback_devices(struct loopback_test *t)
 
 	for (i = 0; i < t->device_count; i++)
 		printf("device[%d] = %s\n", i, t->devices[i].name);
-
 }
 
 int open_sysfs(const char *sys_pfx, const char *node, int flags)
@@ -274,7 +273,6 @@ float read_sysfs_float_fd(int fd, const char *sys_pfx, const char *node)
 	char buf[SYSFS_MAX_INT];
 
 	if (read(fd, buf, sizeof(buf)) < 0) {
-
 		fprintf(stderr, "unable to read from %s%s %s\n", sys_pfx, node,
 			strerror(errno));
 		close(fd);
@@ -367,7 +365,6 @@ static int get_results(struct loopback_test *t)
 			r->apbridge_unipro_latency_max - r->apbridge_unipro_latency_min;
 		r->gbphy_firmware_latency_jitter =
 			r->gbphy_firmware_latency_max - r->gbphy_firmware_latency_min;
-
 	}
 
 	/*calculate the aggregate results of all enabled devices */
@@ -407,7 +404,6 @@ static int get_results(struct loopback_test *t)
 			r->apbridge_unipro_latency_max - r->apbridge_unipro_latency_min;
 		r->gbphy_firmware_latency_jitter =
 			r->gbphy_firmware_latency_max - r->gbphy_firmware_latency_min;
-
 	}
 
 	return 0;
@@ -536,7 +532,6 @@ static int log_results(struct loopback_test *t)
 			fprintf(stderr, "unable to open %s for appending\n", file_name);
 			abort();
 		}
-
 	}
 	for (i = 0; i < t->device_count; i++) {
 		if (!device_enabled(t, i))
@@ -550,10 +545,8 @@ static int log_results(struct loopback_test *t)
 			if (ret == -1)
 				fprintf(stderr, "unable to write %d bytes to csv.\n", len);
 		}
-
 	}
 
-
 	if (t->aggregate_output) {
 		len = format_output(t, &t->aggregate_results, "aggregate",
 				    data, sizeof(data), &tm);
@@ -741,7 +734,6 @@ static int wait_for_complete(struct loopback_test *t)
 		ts = &t->poll_timeout;
 
 	while (1) {
-
 		ret = ppoll(t->fds, t->poll_count, ts, &mask_old);
 		if (ret <= 0) {
 			stop_tests(t);
@@ -781,7 +773,6 @@ static void prepare_devices(struct loopback_test *t)
 		if (t->stop_all || device_enabled(t, i))
 			write_sysfs_val(t->devices[i].sysfs_entry, "type", 0);
 
-
 	for (i = 0; i < t->device_count; i++) {
 		if (!device_enabled(t, i))
 			continue;
@@ -824,7 +815,6 @@ static int start(struct loopback_test *t)
 	return 0;
 }
 
-
 void loopback_run(struct loopback_test *t)
 {
 	int i;
@@ -853,7 +843,6 @@ void loopback_run(struct loopback_test *t)
 	if (ret)
 		goto err;
 
-
 	get_results(t);
 
 	log_results(t);
@@ -881,10 +870,8 @@ static int sanity_check(struct loopback_test *t)
 			fprintf(stderr, "Bad device mask %x\n", (1 << i));
 			return -1;
 		}
-
 	}
 
-
 	return 0;
 }
 
-- 
2.25.1

