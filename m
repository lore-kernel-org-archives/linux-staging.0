Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8929E22CBD9
	for <linux-staging@lists.linux.dev>; Sun,  2 Aug 2026 06:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785650517; cv=none; b=Tbqbnw652fKklanUs0DF8VLhEd7AiHAbU5ZyGLZRHxvj563rCtG218yQtfl83hKLdtPnrfh4oN45AiQ21NXgVt43ZMHgnvd+BGGw48X1x2smWxIZu1nn+nP/REQQZtmo0+15TQOSD6R/rq3XgTGhUmpRXhjJRbzxSXF7BZVSt94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785650517; c=relaxed/simple;
	bh=JjxDKQF3hAPKt2Y2c8WbHYN4lqyU3INe1BlKLG3Hs+Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sAvdHSh6lzffWM9xJyIKmEr4KiST38b+KoEgyy7COLed9+dtnSDgPUK1WIArAigp6hoDpenOGB/QOMX9e4aggm+hT9FdOngtWeTWIfO6Ozm/gZ8+HW0mjNhmtIELdXiEJpnrhmRKY65lMf5R/fqOmO6/1JLpg3nci67jcqHn6wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YmljKItB; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YmljKItB"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38e347638adso2792492a91.0
        for <linux-staging@lists.linux.dev>; Sat, 01 Aug 2026 23:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785650516; x=1786255316; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Uf0TKCFjdWM1rYqDz7p4iU85M8ItTJOqGEGZ/I4vGE=;
        b=YmljKItB60ID7YaQmZIxIh/RaFFLuDnXas5zevW3JTXG6WQpXn4IOsdhXiboA4i37k
         9748vAX1QmSUtWZ6oYDX+f/B2sQ392EmF+9cvpPtpzNlS9dAoljjC96zE6DF8bhvqh6J
         JA6Np9YVqhFnbbkZDTACECeEf8KAY4DNNRAXrCmnlXFfeJeeGxscKwu1YZ9PiCmdIncJ
         cfrFmB2q0/sF8o+Up+2ZklHnbtwbWJqRWQnZ1VyeKqnaNZD317s8ACz9p2CFqfCHIIEI
         qPJycSXMXdwZ4pVoN0SAzEM7MoU0ZpwbkGWgjJsVNcRk9Nf0XYhXMVCfF29lbXFCm7C4
         X2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785650516; x=1786255316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Uf0TKCFjdWM1rYqDz7p4iU85M8ItTJOqGEGZ/I4vGE=;
        b=ab+ybJL6AwbYV71+C792gct0QxhA0loblnOwQGbURBP6FmpnN86SmoWpM72aCV67Q3
         iuKm+R5vc7NvAVo3MmBb8ghi4THOPD04/TmfCyN4Yxwnw/0Azdn2DwTK2lqEf0EYvqrb
         D9nkdStzvJvVfhtv0xS82g9VskUMOfloXZYr1h0G3f3RbW5Dpw3ln3CFx7IiAOu5SF6/
         kPOT1bGaExdpdVldsJ6PTvXce1O6lqpmOgybdkEkZgcAAzCjcPBQC8NS/1JUHC2bdepC
         SirK/cYqz7o9HDa9UoBL13ALU+5mxSQpiOp8GMrHtGs61gt4UucPHKuK5QfzMjH5v9UO
         H4Ow==
X-Forwarded-Encrypted: i=1; AHgh+Rqt742qCtjlNJQs8bzu4ZpoEHegOi6ZKKZe9KWzZzmm6vII5C4P7OQgiXtbWwaACJFfX4m0xuzNPFwRx1Bu@lists.linux.dev
X-Gm-Message-State: AOJu0Yzh7uK7VecEPJQv1tFxideu/OY/WsULVQa460p7rujgefnq0jvw
	E9D0Mdvxy//HH4jzTDk1GfteiOovTeG48JpmlPHN09dK8LX7tOzTDesz
X-Gm-Gg: AR+sD12eNwOBTyNaeCYu6aYhgej1idqBBqCaoWArwjFGv6OeLTXmJjC9dlLED7AZt9S
	a/Qt4EZqStUiCTauDreXz7QbYHZOvtB+QK1HsQLTxyM/+bLwEkEZxGakamxMv8+/PHPqKlipxbR
	VE7HP0zu9Pdga6Bpzo55Y5lwzIlk7ig/ujzDCaZS0V6X8PCskzIUKjg7h9IN1zQfekLOQE3T5kp
	JSzosu7dDtcoGwLSGzrXUt5fPkFiqujLoOs0Br3AaxQbT3LP0gxFBz5S5etvbEQllfbHy/IfnZJ
	fFoS6pw9jA/GCTWI3dhUw36CLS1Qx0pmtlTHowNhq7o35Ghzr946PE952J7w234lUmdmNm8vtyW
	AT3A8u9C521/3pNzWh7d7c7S6VeGYmQSQ44hk6GWISY/Q6Mp7ALCuS8y5BZ+sT/QUtJGjLm/spD
	KjsPQB/2lvPQqrZSAlJO6zQy8p24RMCyzXs8c0cnqmwPvkiqobbr3JFWIvNqwTa6NDt15ATJTNw
	ckf3A==
X-Received: by 2002:a17:90b:5605:b0:37f:9ce1:cdb1 with SMTP id 98e67ed59e1d1-38fbc57a333mr5181193a91.31.1785650515828;
        Sat, 01 Aug 2026 23:01:55 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab132cc4sm18610443c88.2.2026.08.01.23.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 23:01:55 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: greybus: light: fix leak of cdev->name
Date: Sun,  2 Aug 2026 13:01:49 +0700
Message-Id: <20260802060149.3803224-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gb_lights_channel_config() builds the LED classdev name with kasprintf()
and stores it in cdev->name for every channel during the configuration
phase, which runs before the channel is registered.

That name was only released by __gb_lights_led_unregister(), i.e. only for
a normal LED channel that was actually registered. It was therefore leaked
in two cases:

  - a channel that is configured but never registered, e.g.
    channel_attr_groups_set() fails, the flash configuration fails, or a
    later channel in the same light fails to configure and the whole light
    is torn down; the release path calls gb_lights_channel_unregister()
    (which returns early because the channel is not registered) and then
    gb_lights_channel_free();

  - a flash, torch or indicator channel, whose unregister path
    (__gb_lights_flash_led_unregister()) never releases cdev->name at all,
    so the name leaks even on a successful teardown.

cdev->name is a configuration-phase allocation, like channel->color_name
and channel->mode_name. Free it in gb_lights_channel_free() next to
those, since that runs unconditionally on every teardown path, and drop
the special case free from __gb_lights_led_unregister().
gb_lights_channel_unregister() is only ever called from
gb_lights_channel_release(), immediately followed by
gb_lights_channel_free(), so the name is still released on the registered
path and is freed exactly once.

Commit 04820da21050 ("staging: greybus: light: Release memory obtained by
kasprintf") fixed the leak for the registered normal-LED path only; this
covers the remaining cases.

Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
Changes in v2:
- Add Assisted-by: tag to document AI assistance, per
  Documentation/process/coding-assistants.rst (Greg KH).
- No functional change.

 drivers/staging/greybus/light.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index cab02b5da867..1ecca479b5f4 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -905,8 +905,6 @@ static void __gb_lights_led_unregister(struct gb_channel *channel)
 		return;
 
 	led_classdev_unregister(cdev);
-	kfree(cdev->name);
-	cdev->name = NULL;
 	channel->led = NULL;
 }
 
@@ -1063,6 +1061,9 @@ static int gb_lights_light_register(struct gb_light *light)
 
 static void gb_lights_channel_free(struct gb_channel *channel)
 {
+	struct led_classdev *cdev = get_channel_cdev(channel);
+
+	kfree(cdev->name);
 	kfree(channel->attrs);
 	kfree(channel->attr_group);
 	kfree(channel->attr_groups);
-- 
2.25.1

