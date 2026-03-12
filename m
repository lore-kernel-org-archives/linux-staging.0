Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37473BE626
	for <linux-staging@lists.linux.dev>; Thu, 12 Mar 2026 21:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773349933; cv=none; b=FfP23ogQdVQBmvbvkRvSTTtb5Y12cp8vc2gcglwvqPGoGrVtrI4Rc5BMEBinUsz/sscUWnBYqinNtOMv0sHpafJ5N4RVzGFzAr1CyLloHLRzJj1ZuhBlF6iWAC9VtT8LEgpdcrlI6yy/kCUY6aVIRYnq91Br5Etpl8OlAfhy/Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773349933; c=relaxed/simple;
	bh=XPa2fHPiFNHgLb9BQ1hCubAtkAhzSQ8PE4/mHmpaoDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tqRQYaDEr0bo23gGoVZMb9m32UVTt+wtL14RsM5wXwLc6HIqauIsTyr+oCZidfeCr2t0NOTh80o3DH+rcy91c+WDrZhT6lQHWStjfkREgYmJbhvVzwQSbp7USdbjwAyvzG8Fc/uPzULyNPX4xWHMK9+fujsVAStkBPKnSnwtBwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TarPlqtR; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TarPlqtR"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so1149585eec.1
        for <linux-staging@lists.linux.dev>; Thu, 12 Mar 2026 14:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773349926; x=1773954726; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4/g92r097+Q+bziB8D1wE9RZ6HdjWV3zyzwkFevGgw=;
        b=TarPlqtRCtquLR97RkSqoWUjS5u5RhvsoLlOZ6+QhnSjYdTW/wMv/NIli4nTvLYtuT
         tFm94sgJ/hZ7Fkftpaavd0376gQm8c1dJekxmU+qurpZbaXTJ83ORMNnZ8IJbj98W40v
         o4eNIReuDCMf+G57S0ZjsZjPIu82slpIVcb8i16qnejQsAitrtfjyf5cUpk212rcp/Ry
         41dq7NW4aIU9bGYNBgLEX6cgjPpQ4C8lwmdEa89uqOIIs8wmGyyzZQSJiUWs64lhq8oI
         JeMC3Tl8PSwuhkefJK28XTl9oQXcz8JnoqdyMu7EI+3ZiDfSVB7CSkz/cOWOsdi/ipai
         Iq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773349926; x=1773954726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P4/g92r097+Q+bziB8D1wE9RZ6HdjWV3zyzwkFevGgw=;
        b=Z7WJfX7KkgCgMMlS4YsWq76TGhQEpeY9lQ0Vo+uEhPYVhq4SMujAusfeEhaAMqIT1S
         jj3mBrqjf1lPsCT3Zu4DykAeO9/NkPOrVpBf19Z5HD4xEWCD+sV9oIWByPpcVy4hW42V
         DHdeAi8oYig6L2knylyEArr6Z8CTkr9Ui4+SdA9dzM5+xJrax6B+DKuk2u+Y/yrxMY7H
         wy55JiAygBeq+9SNNS7liFnABLN/OG0X9s63qTz6agDHb92r8jSenwXonIDETK9d8Toy
         F3rS6iy80yQqi1H/16ipBTYn/UjiRv3TRyoLCSJ9OCh50mb0l0Ff2Acpt4h79/J+tplG
         a5fQ==
X-Gm-Message-State: AOJu0YwqCtzGtE9UCTz3SvDW8rCDMNul2eNsUeJK77MbFeLhRsKMhTqp
	0d/sLITIC0MpDHujy938vZ00t4cqz9bjYe8QsAVSlXYurD6Z2hIzAq0X
X-Gm-Gg: ATEYQzyDn9YoAg8bO+ITGEAvdV2GgIHjIh2awMdyXR+TXd857VldFW+P3KDP4jd1uZl
	a1UO72LIFN77qlra9VKS746FgFfml565t4aVSvfzFGCJYdDzXE6kiP7UJyCv5bXeELGrxw07qa6
	Dc8hVm3Lgf4Qvau+08fGBX3H1ZXitHkZBhQ0SIBNN819OkUJLH1MWosr2iaVHo+rMO6R4p2Gc71
	jnFxFkR5R7sXy5K/6tWBIa3xeTi4CXYQIw3XyFqj2FxA1Ea2mUOt8ydAgLkM2rpMcvXC02Tc3ZC
	tPdus17VICiJOaJeuEoZFls1fUzS391/ZA4edAAuzDsqpwyaeogOUq4nA0eSwCU40gemdTQHytw
	4kktelAeU02PjlyxPC6VwmT1yWiSYiN3bGPFoEmUintY3kMSL02UcXtghAuE8HnzsVtMG8WmgS2
	ydVSIZ4vhqnmEx0yO/rs/JjEXSVxH+PktOiPBqunnbKww=
X-Received: by 2002:a05:7300:4348:b0:2be:140c:bc4a with SMTP id 5a478bee46e88-2bea53d7473mr594194eec.3.1773349925598;
        Thu, 12 Mar 2026 14:12:05 -0700 (PDT)
Received: from localhost.localdomain ([2804:d59:7f1c:1e00:6632:a8ff:fea4:c8d3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be8a83514asm8422272eec.4.2026.03.12.14.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 14:12:05 -0700 (PDT)
From: Gustavo Arantes <dev.gustavoa@gmail.com>
To: gregkh@linuxfoundation.org,
	marvin24@gmx.de
Cc: linux-staging@lists.linux.dev,
	ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dev.gustavoa@gmail.com
Subject: [PATCH 2/2] staging: nvec_power: stop EC queries during system suspend
Date: Thu, 12 Mar 2026 18:11:51 -0300
Message-ID: <20260312211151.85379-3-dev.gustavoa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312211151.85379-1-dev.gustavoa@gmail.com>
References: <20260312211151.85379-1-dev.gustavoa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The nvec_power driver continues to schedule its polling and battery
metadata work across system sleep, even though the parent nvec core
suspends the controller.

Track when each nvec_power instance is suspended, stop scheduling new
work once suspend begins, cancel the pending work items, and restart
them on resume. This keeps the driver's EC traffic quiesced while
the parent controller is asleep.

Signed-off-by: Gustavo Arantes <dev.gustavoa@gmail.com>
---
 drivers/staging/nvec/nvec_power.c | 52 +++++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec_power.c b/drivers/staging/nvec/nvec_power.c
index 6b3235f41d07..54e5c5cdaf63 100644
--- a/drivers/staging/nvec/nvec_power.c
+++ b/drivers/staging/nvec/nvec_power.c
@@ -25,6 +25,7 @@ struct nvec_power {
 	struct delayed_work poller;
 	struct work_struct bat_init;
 	struct nvec_chip *nvec;
+	bool suspended;
 	int on;
 	int bat_present;
 	int bat_status;
@@ -158,7 +159,8 @@ static int nvec_power_bat_notifier(struct notifier_block *nb,
 		if (res->plc[0] & 1) {
 			if (power->bat_present == 0) {
 				status_changed = 1;
-				schedule_work(&power->bat_init);
+				if (!READ_ONCE(power->suspended))
+					schedule_work(&power->bat_init);
 			}
 
 			power->bat_present = 1;
@@ -398,7 +400,9 @@ static void nvec_power_poll(struct work_struct *work)
 		dev_warn(power->nvec->dev,
 			 "failed to query battery status: %d\n", ret);
 
-	schedule_delayed_work(to_delayed_work(work), msecs_to_jiffies(5000));
+	if (!READ_ONCE(power->suspended))
+		schedule_delayed_work(to_delayed_work(work),
+				      msecs_to_jiffies(5000));
 };
 
 static int nvec_power_probe(struct platform_device *pdev)
@@ -471,11 +475,55 @@ static void nvec_power_remove(struct platform_device *pdev)
 	}
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int nvec_power_suspend(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct nvec_power *power = dev_get_drvdata(dev);
+
+	WRITE_ONCE(power->suspended, true);
+
+	switch (pdev->id) {
+	case AC:
+		cancel_delayed_work_sync(&power->poller);
+		break;
+	case BAT:
+		cancel_work_sync(&power->bat_init);
+		break;
+	}
+
+	return 0;
+}
+
+static int nvec_power_resume(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct nvec_power *power = dev_get_drvdata(dev);
+
+	WRITE_ONCE(power->suspended, false);
+
+	switch (pdev->id) {
+	case AC:
+		schedule_delayed_work(&power->poller, msecs_to_jiffies(5000));
+		break;
+	case BAT:
+		schedule_work(&power->bat_init);
+		break;
+	}
+
+	return 0;
+}
+#endif
+
+static SIMPLE_DEV_PM_OPS(nvec_power_pm_ops, nvec_power_suspend,
+			 nvec_power_resume);
+
 static struct platform_driver nvec_power_driver = {
 	.probe = nvec_power_probe,
 	.remove = nvec_power_remove,
 	.driver = {
 		.name = "nvec-power",
+		.pm = &nvec_power_pm_ops,
 	}
 };
 
-- 
2.53.0

