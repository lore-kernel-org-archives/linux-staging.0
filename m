Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8503A72
	for <linux-staging@lists.linux.dev>; Sat,  1 May 2021 19:31:09 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id v20so1528403qkv.5
        for <linux-staging@lists.linux.dev>; Sat, 01 May 2021 12:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5NGzqWvTvK589zokdLpymdCEmNc/llrSLUlZMFBA8FE=;
        b=Ex2dkyfLSkUIxknC8vMZhtwVIwpysg6mvT6d+W1OKohixIO2nWPUYPnQ/pf4GIJGyD
         91/ZV7M7TA07tutqfh5YOhK4TUUk/F3UZa2idd4wPvNbntrnQDa1+5JBMpq8J1d61jsg
         ZWH+jNdFzxilepzIzYWfkjYYre1R+KZpuhJvDVa7Yjdw30wb2NkabyTawLLiCo5IgulB
         9Rw9mi1FbE4eqiKjI2nBpTM0IDw8emXrqMJp82/wI4mrPJv24o1YbicvN9TA0FiFraDa
         W0XTXGTbg5cdI6mYSQX20WuWNudFBura5gCaJLDpnbBnRaZ+WncPyUe8vWU0XIMSwDyu
         3sXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5NGzqWvTvK589zokdLpymdCEmNc/llrSLUlZMFBA8FE=;
        b=iitlJzYO1ZLpOgY7WFnRH1NeD8hvjLVsdlvjxdHoj6alPgkikxJxIYRtS3N4/IFinI
         QbzwsdjB0pHtUfpI2+yIiXGtfq9YVY7fa5ofsxPPfvmzZ2CHB7tMIsEydBSNrIRVTgsI
         onvECB0qlK4BWVS19DR5GX2gwbncpygoBDKfHijBByveRyDm1Cw94yUAZNn3N4llYxLX
         E8M4EULzcVKFR49sIx5FHXKvO9uhBvk/Z1oNF3i6Azmzkmnygx8L+fH+q3W0/Xxp1yJN
         dRHNqitfsNqR4NvyMmdSZNuu4/TBdUjWMKF51dt0r53zstruMSeivARK4xaDFbrcflzt
         cB7g==
X-Gm-Message-State: AOAM5319XLQJ48WNwtvhJau1YgO950dA+2jxliysvBPAIlWccBJMmGnu
	O1L6PFLOMr3GahM72TFu8NI=
X-Google-Smtp-Source: ABdhPJymwcM2yWO75sXaqDFZmVXg/3JLoR3K63CxFSdw7O3AAiD+yc3GrI1G/rvrGUvlMMNXV0BeCA==
X-Received: by 2002:a05:620a:133b:: with SMTP id p27mr4757886qkj.354.1619897468692;
        Sat, 01 May 2021 12:31:08 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:cfcf:9b0e:2d21:2696:6c86:a623])
        by smtp.gmail.com with ESMTPSA id y23sm4690352qkb.47.2021.05.01.12.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 12:31:08 -0700 (PDT)
From: Thais Camacho <thaiscamachoo@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thais Camacho <thaiscamachoo@gmail.com>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Staging: greybus: tools: loopback_test: fixed coding style issues
Date: Sat,  1 May 2021 16:30:42 -0300
Message-Id: <20210501193043.12153-1-thaiscamachoo@gmail.com>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed warnings found by checkpatch.pl script

Signed-off-by: Thais Camacho <thaiscamachoo@gmail.com>
---
 drivers/staging/greybus/tools/loopback_test.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/greybus/tools/loopback_test.c b/drivers/staging/greybus/tools/loopback_test.c
index 867bf289df2e..553883b2bfa3 100644
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
 			fprintf(stderr, "unable to open %s for appendation\n", file_name);
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
@@ -675,11 +668,13 @@ static int open_poll_files(struct loopback_test *t)
 static int close_poll_files(struct loopback_test *t)
 {
 	int i;
+
 	for (i = 0; i < t->poll_count; i++)
 		close(t->fds[i].fd);
 
 	return 0;
 }
+
 static int is_complete(struct loopback_test *t)
 {
 	int iteration_count;
@@ -740,7 +735,6 @@ static int wait_for_complete(struct loopback_test *t)
 		ts = &t->poll_timeout;
 
 	while (1) {
-
 		ret = ppoll(t->fds, t->poll_count, ts, &mask_old);
 		if (ret <= 0) {
 			stop_tests(t);
@@ -780,7 +774,6 @@ static void prepare_devices(struct loopback_test *t)
 		if (t->stop_all || device_enabled(t, i))
 			write_sysfs_val(t->devices[i].sysfs_entry, "type", 0);
 
-
 	for (i = 0; i < t->device_count; i++) {
 		if (!device_enabled(t, i))
 			continue;
@@ -823,13 +816,12 @@ static int start(struct loopback_test *t)
 	return 0;
 }
 
-
 void loopback_run(struct loopback_test *t)
 {
 	int i;
 	int ret;
 
-	for (i = 0; dict[i].name != NULL; i++) {
+	for (i = 0; dict[i].name; i++) {
 		if (strstr(dict[i].name, t->test_name))
 			t->test_id = dict[i].type;
 	}
@@ -852,7 +844,6 @@ void loopback_run(struct loopback_test *t)
 	if (ret)
 		goto err;
 
-
 	get_results(t);
 
 	log_results(t);
@@ -861,7 +852,6 @@ void loopback_run(struct loopback_test *t)
 
 err:
 	printf("Error running test\n");
-	return;
 }
 
 static int sanity_check(struct loopback_test *t)
@@ -881,10 +871,8 @@ static int sanity_check(struct loopback_test *t)
 			fprintf(stderr, "Bad device mask %x\n", (1 << i));
 			return -1;
 		}
-
 	}
 
-
 	return 0;
 }
 
-- 
2.20.1

