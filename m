Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B9CE4E3;
	Sun, 19 Mar 2023 16:45:29 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id iw3so10153854plb.6;
        Sun, 19 Mar 2023 09:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679244329;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wmtLzAp7TAfFzU4Wal3aHOCAS9vHX2uOg0KnFqhgfOg=;
        b=LXs9nIjHeLGc4vvNlmA23A/cSABl8I0XqAC1aUqw4CUby9pvLsTuK+E/TA3D3Bz5a9
         3iBf1J/ArqNespEhEmmrBwb444AgD9APc8yDQD/YiU/+E7/9CqeSgSIpE2bb/pZPTp7B
         wOOh6SiAnC7qlePvsPYEk7H6nmZqnYJy/3vtJhd31RFDVkHgXhAptaQhgsLadb+W5IhE
         A8MNpfPa1HdDhAHNTK6BN6qKHHBc/L3qWrLpK8BVbtWJov/xFFcxWOihgu44cA736mo1
         5LeUWymaryZOHNVb6weW14aeEn+feYT7V4VMYlavnQB/0pEGMJ5jXxx6P6VpsU0zt3oo
         Lcbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679244329;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wmtLzAp7TAfFzU4Wal3aHOCAS9vHX2uOg0KnFqhgfOg=;
        b=4ujs9iIxqs3YBwxGMZK+0NbCBUHXDZ1xSL4dduYu6WSe3XPXjlhtRkrsMtgmS0jVgT
         wJ9Qb2/9BwUZkDzNzfJI2JmKNtNt9OQIJeFboVRdv+k6yDvDrfTXAQQBZwG3SJV2sCD1
         qxw2eINSVmCLlpybX0fys0Hz9hL9JtEzhilcrpRP96Yvy4IdfcZqacp1MNlt1OdLUrLG
         Cwnm5EtgvbdoM8hVCNqxb8AfRWk3qb56WvTMk1Fegjw9OVfIPsREnWD5MIap6ZxJbT14
         X44ukSCeuNL3YBa7rywL9SVCiKpawdoVQa7nD2Aij4Qm3Pp7iq1JJIbbDBgDmPK/M+dw
         cdxQ==
X-Gm-Message-State: AO0yUKWDlSktK7ycXKNOzFNZJ0UJH5Axh/tPa5pSXJasQSDi5Uyxrjv6
	rB/tRI8ZS5kONdQ7u/Y0QXk=
X-Google-Smtp-Source: AK7set89cJ4rq6OJEYq0Uljx9YEOr8CfmsGk8+Y5TyoZookPRhjaGAooHa6/vi5uZaiShmz6OVcAzQ==
X-Received: by 2002:a05:6a20:7aa2:b0:d9:1ec8:e9bb with SMTP id u34-20020a056a207aa200b000d91ec8e9bbmr2242327pzh.28.1679244329269;
        Sun, 19 Mar 2023 09:45:29 -0700 (PDT)
Received: from sumitra.com ([117.209.117.91])
        by smtp.gmail.com with ESMTPSA id m5-20020aa79005000000b00627f1efd470sm1091128pfo.135.2023.03.19.09.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 09:45:28 -0700 (PDT)
Date: Sun, 19 Mar 2023 09:45:20 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: outreachy@lists.linux.dev
Subject: [PATCH] Staging: greybus: Fix lines ending with '('
Message-ID: <20230319164520.GA125117@sumitra.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The coding style used to limit lines to 80 characters,
which led to splitting of these function headers into multiple
lines and ends the first line with a '('.
Such splits causes checks reported by the checkpatch.

Place the function parameters of each function immediately after
'(' in a single line to align the function headers.

Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
---
 .../staging/greybus/audio_manager_module.c    | 40 +++++++++----------
 1 file changed, 18 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index 0a0f0a394c84..81b4ba607a0e 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -70,9 +70,8 @@ static void gb_audio_module_release(struct kobject *kobj)
 	kfree(module);
 }
 
-static ssize_t gb_audio_module_name_show(
-	struct gb_audio_manager_module *module,
-	struct gb_audio_manager_module_attribute *attr, char *buf)
+static ssize_t gb_audio_module_name_show(struct gb_audio_manager_module *module,
+					 struct gb_audio_manager_module_attribute *attr, char *buf)
 {
 	return sprintf(buf, "%s", module->desc.name);
 }
@@ -80,9 +79,8 @@ static ssize_t gb_audio_module_name_show(
 static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
 	__ATTR(name, 0664, gb_audio_module_name_show, NULL);
 
-static ssize_t gb_audio_module_vid_show(
-	struct gb_audio_manager_module *module,
-	struct gb_audio_manager_module_attribute *attr, char *buf)
+static ssize_t gb_audio_module_vid_show(struct gb_audio_manager_module *module,
+					struct gb_audio_manager_module_attribute *attr, char *buf)
 {
 	return sprintf(buf, "%d", module->desc.vid);
 }
@@ -90,9 +88,8 @@ static ssize_t gb_audio_module_vid_show(
 static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
 	__ATTR(vid, 0664, gb_audio_module_vid_show, NULL);
 
-static ssize_t gb_audio_module_pid_show(
-	struct gb_audio_manager_module *module,
-	struct gb_audio_manager_module_attribute *attr, char *buf)
+static ssize_t gb_audio_module_pid_show(struct gb_audio_manager_module *module,
+					struct gb_audio_manager_module_attribute *attr, char *buf)
 {
 	return sprintf(buf, "%d", module->desc.pid);
 }
@@ -100,9 +97,9 @@ static ssize_t gb_audio_module_pid_show(
 static struct gb_audio_manager_module_attribute gb_audio_module_pid_attribute =
 	__ATTR(pid, 0664, gb_audio_module_pid_show, NULL);
 
-static ssize_t gb_audio_module_intf_id_show(
-	struct gb_audio_manager_module *module,
-	struct gb_audio_manager_module_attribute *attr, char *buf)
+static ssize_t gb_audio_module_intf_id_show(struct gb_audio_manager_module *module,
+					    struct gb_audio_manager_module_attribute *attr,
+					    char *buf)
 {
 	return sprintf(buf, "%d", module->desc.intf_id);
 }
@@ -111,9 +108,9 @@ static struct gb_audio_manager_module_attribute
 					gb_audio_module_intf_id_attribute =
 	__ATTR(intf_id, 0664, gb_audio_module_intf_id_show, NULL);
 
-static ssize_t gb_audio_module_ip_devices_show(
-	struct gb_audio_manager_module *module,
-	struct gb_audio_manager_module_attribute *attr, char *buf)
+static ssize_t gb_audio_module_ip_devices_show(struct gb_audio_manager_module *module,
+					       struct gb_audio_manager_module_attribute *attr,
+					       char *buf)
 {
 	return sprintf(buf, "0x%X", module->desc.ip_devices);
 }
@@ -122,9 +119,9 @@ static struct gb_audio_manager_module_attribute
 					gb_audio_module_ip_devices_attribute =
 	__ATTR(ip_devices, 0664, gb_audio_module_ip_devices_show, NULL);
 
-static ssize_t gb_audio_module_op_devices_show(
-	struct gb_audio_manager_module *module,
-	struct gb_audio_manager_module_attribute *attr, char *buf)
+static ssize_t gb_audio_module_op_devices_show(struct gb_audio_manager_module *module,
+					       struct gb_audio_manager_module_attribute *attr,
+					       char *buf)
 {
 	return sprintf(buf, "0x%X", module->desc.op_devices);
 }
@@ -181,10 +178,9 @@ static void send_add_uevent(struct gb_audio_manager_module *module)
 	kobject_uevent_env(&module->kobj, KOBJ_ADD, envp);
 }
 
-int gb_audio_manager_module_create(
-	struct gb_audio_manager_module **module,
-	struct kset *manager_kset,
-	int id, struct gb_audio_manager_module_descriptor *desc)
+int gb_audio_manager_module_create(struct gb_audio_manager_module **module,
+				   struct kset *manager_kset,
+				   int id, struct gb_audio_manager_module_descriptor *desc)
 {
 	int err;
 	struct gb_audio_manager_module *m;
-- 
2.25.1

