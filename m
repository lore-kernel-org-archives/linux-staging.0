Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDC63822AB
	for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 19:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783710749; cv=none; b=VL/oFw5+49FlGlKJV/qF2yuIFnAimZb+z0Z7PTNgc2okkMpoTFYFNsgNiEhKpvCW0PSw1FHtuDDla8oq+Ql5WzC+pbLrgn+Qj+x5K/8GoM1K3HH3UddNCplMde2lcxbhyxjKVYPWk8rBJySJhg3IOEwSpvbraOZMlYB0em6nh2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783710749; c=relaxed/simple;
	bh=hN1BELHe0HzMVXZth/JdE+10ehzOn9zzJk1tjshEl80=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pj49zN6kmudrkfyZ6GnYlGGXML+dbdjDUP7kEcLDAeyav6EYelMXrAzLaWpIa/kw/m1HD1CQ1LQ5Ni9AeKfULmZcSSbK32KRTs60Rs+cJCQ3ky2eEp2cj1ndP8001cgQHNMjwv9yPYoAbK4sYx3rxNEp3p4jCCfOVZoe0/yJRqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qOkFMZ6h; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qOkFMZ6h"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aebc8cb5bcso910898e87.2
        for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 12:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783710746; x=1784315546; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UJQcbXWAh+kWYkQGfCOXff9Cmt1+z/g0OGZkizOIHnU=;
        b=qOkFMZ6hfmcQ3KFi49x+f1Aq/zqpAZzTULWeS5lqe+w+G/j9J7M89s+JTnDeZ7SZgJ
         rhte/+Eg+gH+I1Hcw7Av9tgLcOzLfYoAaXxZ1iovF4/ak0dXDtfVUOwtScIdzqd205Nn
         tQRIzZneCshvjyv/gVMQLmMyTzNCreXdUbvhsBwJBsoU/WMnNfmNqqEux3NAfzt1K4Zs
         XyHP2JW1b7Kr1uE/lcc3DJkHgdAx2xhqLzzCeP14/T37XzXcTJCy7EJoM5YIoV+eGC8o
         x2lvl/+MQS3Qal29l/weaXfUBLGjIYvF6+CwNkyQVYV2C3mo79Y9TQiAyJZahGsAKRMA
         Q+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783710746; x=1784315546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UJQcbXWAh+kWYkQGfCOXff9Cmt1+z/g0OGZkizOIHnU=;
        b=MLxohnyBJRDtrBHkHCSf8UC30DLDSqQ2WC1PdWHJFgLLnoj3BwC5s+GxPV1P8t8RW3
         axRmInw0GbcGMfEZCj8KyPMY7O6z6/RtCOhxRTklBr971GfbsaUCwJw05r1lAkFrzDRq
         3XXTx5X7hZZk+5q5vnpH4biFiY1FBrf6wNZNtkZRkJzUbaBuFsn/ieQiAkEwrWu+1K2/
         MLYfHxZVFe1jR7FfNcxSYGk21QKAxytp54lJUVM0Fyi1KHhUZMMjQ5cvurKLpLMZroMx
         TiZVHJbMxCS27WokJpQ5264ZpSg+/XhEbBS18CnI8I1P09k17L9J3SxO2IByik2xHE8u
         E0sQ==
X-Gm-Message-State: AOJu0Yx8spt5DqK5fgsjSGiYel8ZF8sqBBt3rgaLpb8UYq82cAsJ47WO
	L834G52SpIbYcfnxjmqyQnnrvHYDFVRrcZl94ep9Xb069ycXBORV3U38
X-Gm-Gg: AfdE7ckF9TCrJY5qUZw1cHycMy3y63AzYg3cTjUjZfiLeuBrt1EKEY8Jbyg7ZGXvfs8
	kX6T6T/HQ3OtV9rloLhXzTTk5ssE/FOIhD+ZJ0USHRHyT1Dn+8/XQFsEfpYf+78fTA+rBT4GAqX
	Cx3QLgBN5AqaR1nN3KYHLdMWvo14hT+rABDseGpgS19K8Ku3kHxcAlRp5m/ic9Cxc3rMPTkyr72
	HgVF1c0b6CEnjNndYvHkEd+fTdLEELIwiV8oiljNWk3eopLRV4diR67TD8ePX9w7N+ZpiuTPndh
	Yn547VS4h/fLMqf9I6Sf9e6H2l+XdFFW+7jzagl0N1ujpOYu9inK1OTE4vRewEeXQE/PnmizG7s
	mbklyAbxKw42bpWShgHcSLepbueVXZ/BvSO6Mn8OuJqLU9Gy0uDgyuim0JD6JJSo1bu7dpnpLRY
	NKlz4JggqEebZSyrejZeIV7pqqv/u0m2lpD8ueD+FEvwjIwyp61nJqXEQUH7S/UL+mgkDTg1nqK
	GQHRjc=
X-Received: by 2002:ac2:51d1:0:b0:5b0:bc3:dc05 with SMTP id 2adb3069b0e04-5b02369c7cdmr76618e87.40.1783710745968;
        Fri, 10 Jul 2026 12:12:25 -0700 (PDT)
Received: from debian.localdomain (95-25-158-125.broadband.corbina.ru. [95.25.158.125])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca9dd41sm807683e87.48.2026.07.10.12.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 12:12:25 -0700 (PDT)
From: Igor Putko <igorpetindev@gmail.com>
To: gregkh@linuxfoundation.org,
	marvin24@gmx.de
Cc: linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	ac100@lists.launchpad.net,
	linux-kernel@vger.kernel.org,
	Igor Putko <igorpetindev@gmail.com>
Subject: [PATCH] staging: nvec: kbd: replace global state with dynamic allocation
Date: Fri, 10 Jul 2026 22:12:21 +0300
Message-ID: <20260710191221.2820-1-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the global static 'keys_dev' struct to allow multiple device
instances. Allocate 'nvec_keys' dynamically per-device using
devm_kzalloc() during probe, and fetch the context using
input_get_drvdata() and container_of().

Signed-off-by: Igor Putko <igorpetindev@gmail.com>
---
 drivers/staging/nvec/nvec_kbd.c | 40 ++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/nvec/nvec_kbd.c b/drivers/staging/nvec/nvec_kbd.c
index d2b91318f..4b61aebca 100644
--- a/drivers/staging/nvec/nvec_kbd.c
+++ b/drivers/staging/nvec/nvec_kbd.c
@@ -35,19 +35,17 @@ struct nvec_keys {
 	bool caps_lock;
 };
 
-static struct nvec_keys keys_dev;
-
-static void nvec_kbd_toggle_led(void)
+static void nvec_kbd_toggle_led(struct nvec_keys *keys)
 {
 	char buf[] = { NVEC_KBD, SET_LEDS, 0 };
 
-	keys_dev.caps_lock = !keys_dev.caps_lock;
+	keys->caps_lock = !keys->caps_lock;
 
-	if (keys_dev.caps_lock)
+	if (keys->caps_lock)
 		/* should be BIT(0) only, firmware bug? */
 		buf[2] = BIT(0) | BIT(1) | BIT(2);
 
-	nvec_write_async(keys_dev.nvec, buf, sizeof(buf));
+	nvec_write_async(keys->nvec, buf, sizeof(buf));
 }
 
 static int nvec_keys_notifier(struct notifier_block *nb,
@@ -55,6 +53,7 @@ static int nvec_keys_notifier(struct notifier_block *nb,
 {
 	int code, state;
 	unsigned char *msg = data;
+	struct nvec_keys *keys = container_of(nb, struct nvec_keys, notifier);
 
 	if (event_type == NVEC_KB_EVT) {
 		int _size = (msg[0] & (3 << 5)) >> 5;
@@ -70,11 +69,11 @@ static int nvec_keys_notifier(struct notifier_block *nb,
 		state = msg[1] & 0x80;
 
 		if (code_tabs[_size][code] == KEY_CAPSLOCK && state)
-			nvec_kbd_toggle_led();
+			nvec_kbd_toggle_led(keys);
 
-		input_report_key(keys_dev.input, code_tabs[_size][code],
+		input_report_key(keys->input, code_tabs[_size][code],
 				 !state);
-		input_sync(keys_dev.input);
+		input_sync(keys->input);
 
 		return NOTIFY_STOP;
 	}
@@ -85,7 +84,7 @@ static int nvec_keys_notifier(struct notifier_block *nb,
 static int nvec_kbd_event(struct input_dev *dev, unsigned int type,
 			  unsigned int code, int value)
 {
-	struct nvec_chip *nvec = keys_dev.nvec;
+	struct nvec_keys *keys = input_get_drvdata(dev);
 	char buf[] = { NVEC_KBD, SET_LEDS, 0 };
 
 	if (type == EV_REP)
@@ -98,7 +97,7 @@ static int nvec_kbd_event(struct input_dev *dev, unsigned int type,
 		return -1;
 
 	buf[2] = !!value;
-	nvec_write_async(nvec, buf, sizeof(buf));
+	nvec_write_async(keys->nvec, buf, sizeof(buf));
 
 	return 0;
 }
@@ -107,6 +106,7 @@ static int nvec_kbd_probe(struct platform_device *pdev)
 {
 	struct nvec_chip *nvec = dev_get_drvdata(pdev->dev.parent);
 	int i, j, err;
+	struct nvec_keys *keys;
 	struct input_dev *idev;
 	char	clear_leds[] = { NVEC_KBD, SET_LEDS, 0 },
 		enable_kbd[] = { NVEC_KBD, ENABLE_KBD },
@@ -115,6 +115,9 @@ static int nvec_kbd_probe(struct platform_device *pdev)
 						true };
 
 	j = 0;
+	keys = devm_kzalloc(&pdev->dev, sizeof(struct nvec_keys), GFP_KERNEL);
+	if (!keys)
+		return -ENOMEM;
 
 	for (i = 0; i < ARRAY_SIZE(code_tab_102us); ++i)
 		keycodes[j++] = code_tab_102us[i];
@@ -138,14 +141,18 @@ static int nvec_kbd_probe(struct platform_device *pdev)
 		set_bit(keycodes[i], idev->keybit);
 
 	clear_bit(0, idev->keybit);
+
+	input_set_drvdata(idev, keys);
+	platform_set_drvdata(pdev, keys);
+
 	err = input_register_device(idev);
 	if (err)
 		return err;
 
-	keys_dev.input = idev;
-	keys_dev.notifier.notifier_call = nvec_keys_notifier;
-	keys_dev.nvec = nvec;
-	nvec_register_notifier(nvec, &keys_dev.notifier, 0);
+	keys->input = idev;
+	keys->notifier.notifier_call = nvec_keys_notifier;
+	keys->nvec = nvec;
+	nvec_register_notifier(nvec, &keys->notifier, 0);
 
 	/* Enable keyboard */
 	nvec_write_sync(nvec, enable_kbd, 2, NULL);
@@ -165,12 +172,13 @@ static int nvec_kbd_probe(struct platform_device *pdev)
 static void nvec_kbd_remove(struct platform_device *pdev)
 {
 	struct nvec_chip *nvec = dev_get_drvdata(pdev->dev.parent);
+	struct nvec_keys *keys = platform_get_drvdata(pdev);
 	char disable_kbd[] = { NVEC_KBD, DISABLE_KBD },
 	     uncnfg_wake_key_reporting[] = { NVEC_KBD, CNFG_WAKE_KEY_REPORTING,
 						false };
 	nvec_write_async(nvec, uncnfg_wake_key_reporting, 3);
 	nvec_write_async(nvec, disable_kbd, 2);
-	nvec_unregister_notifier(nvec, &keys_dev.notifier);
+	nvec_unregister_notifier(nvec, &keys->notifier);
 }
 
 static struct platform_driver nvec_kbd_driver = {
-- 
2.47.3

