Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91506188713
	for <linux-staging@lists.linux.dev>; Sun, 26 Jul 2026 11:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785063651; cv=none; b=bZ538uYXK3Qb6RnnQOhDtzpM+ADwsnfMPniHZXTR3zIG2HwpTqoVweCAfkSFwMRqZAl5xUcEJjroZNLj21FUL7dqVAHWR4B8/RDAdFkPNpluNXefw1e/Xuphs8jRhWkFNHOcJEIExQbDeUOypEEC48qyiGW2RFJNED1CtOcZi3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785063651; c=relaxed/simple;
	bh=gKneIjMhPY4flpNT4ndOyjBZS3SiT5vLw07ZWbR03wg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OidQHeqzKBvD0hG1Zqm9mrfThQUDt3DvAEsxD3KFmuVbbpFyFVR2c7k0Kube0GomzgoHAK1ZGM1SPHYwMvYVHkuSp3ffkjvcpGOnL3D9eBru5bqEsDy2N8Y5y3fy6xt+p+qmryhTbkTmU5LCJG4eCQCr9IAFw+1DnXu1FkUmLLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XWpJDDqw; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XWpJDDqw"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso1687024a91.3
        for <linux-staging@lists.linux.dev>; Sun, 26 Jul 2026 04:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785063650; x=1785668450; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6ZvFfCFvqC907oR/QkYITogpM1f6Ugnr3HAGHvwH+kc=;
        b=XWpJDDqwfPD/HAe4txKjZKDsSKpvcvNqcctAoRr/t8UK0KNewW5qfn3WMhAR51XXbG
         x/rX7JC6Y55YZnbUedDECwpLXIcBw4hxs7YC+mCHLCAqkce0vve+OBarNfISl14xljwi
         6ra5MtCWnB98d/UFcRA986mQIh2YJz+7KkB7VW4CSqofIlRQr0W8jTiI6EGVv+02cfps
         womGMDrf3hANMWJcF5Qs83YBGtbYJddYmE5kXsTUW1hwCW+O2AF1CuzgRQ1CL2IkKqFb
         E6De4MUIWbZRDgPda97dztICr+cP221XB+MeZlHQ1B0Ly9gZevGyCMADuHw1bM42WzC3
         TD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785063650; x=1785668450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ZvFfCFvqC907oR/QkYITogpM1f6Ugnr3HAGHvwH+kc=;
        b=lUXdYe0WgaE0WywmZU7Qyf7iB81jOMRIOP0fSJLkvddGo4/TckSzg1bRE8/1GgJ1yE
         fJ1pVJUYPxvkQRVRz46rfeMk1BM+ds6tOGjpBkYIyE2F/fUak6TOhdBwqI+NFyvQBtYb
         7OV9tkv0y5U8LYRs7LLsPLtj8mCDITwojqbSDe0CuGx+cldMOzjexveYulBfVnc5JJm9
         jmvMbOS4J0PYLrTmp8H2cR8Gp0FgD7DuCSucSWvQD3itXghS7T51lVTqPFIBbOwLMY3K
         8fvnI78fu44vSCinmi5T6mJhKhWK3CMfS/Feg+Yd9hrUTn2oVYVPj/dG20ov43GUjemn
         mVhA==
X-Forwarded-Encrypted: i=1; AHgh+RrcAJ2/d5/0SsLlMao5uGTqlAomSuQQD0R1WJWfr3dgfywp7sr6aQrPJ0wQxaGZ9iPOoCaAsgeTFkhnL+5p@lists.linux.dev
X-Gm-Message-State: AOJu0Yyml648Odlz/oxO05l+YHDNJM26axrX24sqAh0656icmXQOGFJ9
	xAkC717LTh9yz3n1nhCQstK75gJXtsSXs3OjSS8mB3/Ods5AEF0c7SHUZsXzFHygR0U=
X-Gm-Gg: AR+sD11I991hv4w5t+14zfDGKZUdRBpuJFxdFIDDEqXCNlxwsu59wjMMcGRvDfPyw4L
	SKKd/2ZG+MOfM9a3ou3k6r/VE7t5ZyWucIEKX1ve8+YWauiqlropssSIsOsKdZT9H+lv1lNekVN
	pPSpUxJqq6n6CiHZBeySC3uPI57CSulkx2ChEuOmdPXlnZWQtxdkchpI1S5X48uuLESCq+1rG/H
	A2/ya5x0WsBj3Ra8KAzBGO3ssQ5adjRl5OP2tJ3k/svXCbf2SWqX8SXFIF5diQfEIf2gfQ8pSu3
	wJAaFEyrJ/tSfr2vEVmWa4zdOhjm9Ep1uWJT1AptwV9K3BGvTL4UUCGAMF1DvNseeFSNyx9cpPg
	bSupJ/wmHB9B5nT4Hf11oPi5u7Ag/IUxaw1GceFROP3TN2/s3e9j6nnW35JxuBQ1H3MkvLuN2z+
	IdM9YzZcj/UyTKVf8ImHz/vWBKEud8jg==
X-Received: by 2002:a05:6a20:4e92:b0:3b3:216b:2743 with SMTP id adf61e73a8af0-3c67d9b42a0mr4666136637.4.1785063649844;
        Sun, 26 Jul 2026 04:00:49 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f55c6sm70516854c88.15.2026.07.26.04.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 04:00:49 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>
Subject: [PATCH] staging: greybus: light: fix leak of cdev->name
Date: Sun, 26 Jul 2026 18:00:39 +0700
Message-Id: <20260726110039.3674948-1-congnt264@gmail.com>
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
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
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

