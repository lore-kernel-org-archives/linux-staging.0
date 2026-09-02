Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035224A5EBD
	for <linux-staging@lists.linux.dev>; Wed,  2 Sep 2026 14:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360845; cv=none; b=Og2alFuKE2cOfhZ6xH4CcVwW/Jj6vAEFzg4A4zMQFCBHPQK8rBDgpa4m5RqEzNYyhSukWJPem8x2q1GhTaCE9c3ywxNIoF76odvc0EnqOECj0YoPvB/oK5DBPTycwz2j6crg3VHPhl9o5hQfHXmsx9IEuDbZ4zmO9isbf00k02Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360845; c=relaxed/simple;
	bh=fnLuAuk4DdEaA7jml3VwGJrscDjqw5zgrKIhfNOResY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fXKah/UJjpwE25F5qMrS2uKj+oiRrPURVaXkS1AvJv9qbFE2EsMldklRriqRD2cp1FY05SyZQTO/wBsPtvWP9QYV3q5t5DKq8Cn/Rf4bPNQqFXhj8asbJVI0LxVPYK1nNPigaHnKB4MSpdhh8rg5C9/OORQS8n9u8PvQ+aXmphQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fb1kZ0S8; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fb1kZ0S8"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-482fc3327fdso794139f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 02 Sep 2026 07:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360840; x=1788965640; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KqTr/x5yNF9r4lu6CVzssQgLLUaZ7eL+KNzZNSw0R0g=;
        b=fb1kZ0S86CfkLkCdVVfBrjoPSBq9Ke3R1CfnQb5q6ZVp4b1rnmuk4GEc7dvpmSdZcO
         r/zm9sgv78dMpb+yiMaBREuXi3xa1Rc8IPwHbwd0LWft9V8Bb0mo3qQnx5x18nN4UoCn
         5D6Rz7NFIo/l7bNjj90d/aLPnZGrCvw9DiPweReoyYMpCOvG7rElc0KxM++873QWguyP
         3EWluTaRlBSDoC7cefl8vD3oL54rn3U3FLnB7z/ShvUe0+WKNOEL6BaxR5xVr2QXJcVm
         hlTVTG2v0Uy2m0XrU7Z0rNIQE/YaVQQvTuiEBAeNxun9XTkZhAe0w9OME5orNi5fmGqc
         xhog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360840; x=1788965640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KqTr/x5yNF9r4lu6CVzssQgLLUaZ7eL+KNzZNSw0R0g=;
        b=hZfEXH0q7y/UdlZgy3kU6B4ZIHgRIy+CU1uMwjz0ps5k+g9cHCq803HcQaglSGe3uT
         AZGrEdc4UuNW/UpyjO1DEwa9oobxqX7AFYX8FCX4+REomFAupqLrqqoP8ZvoN8bS6CfO
         tzvd9zhxHjWLf/aigDDMzE+aTAg546PLgj+3Ne5n2q1oUDSUzH7dSeEg/kBfQSxxPHu7
         0w8pHEEf7BrMf91eI/w2R02J7moIOvfvws1GYvnyuNvw6dDbzyATXLpfDpzD769ubk5z
         5rpFcSRb438KUDsfYViz7aeBayQOqL8hpefGxk3z7zo2bl79X26Dqt+EVpYd4cyy2vs3
         Bcfw==
X-Forwarded-Encrypted: i=1; AKwUvBw/0H5c3q9pfeAKvKF9838q9OS4jzv2HKIRkBgtc7/cNrDnrqXWBxjE6cWLD90vL0U9FyePC+qU7aG578tS@lists.linux.dev
X-Gm-Message-State: AFuF++l9udgGG6weQCcqKgPStCKyIKZo5CEXJQJOoIpoPXbbtzjJQsYW
	SdMlySFEtD/IZ6hJOi65cj6PRVZDJPInZ7hzJxEG5aTgf4UnZ6ZaGIQQ
X-Gm-Gg: AYBFou2ghjZxw61O2QUkPb14FF6lL3sIyxx2tdpKpaAGbCqEKmJ2xqOtmyV3CyK65Po
	yLabd9ejda72u+fCWtrVeKmyiu8/8npwXT42gt1hHSJyDqxXGvJWNq1/4PSIsaBb6G30bKdmuE1
	fqaiUI1EyVY0wz8qRloGA66w8eXe61GsRehZ4qNjI3lyYd6eoXOrNW0Tznml33CSqAxEDBPI9Qn
	8v0RN0tZMfJHpkaX5cwUh7MTV+AhikKWSrUv0+OTjb0veDwmNgv4h3bdSbvKYcc+zxdVTHob2YQ
	/wxBuSpp75mcQ0cibOdGEMHz79+kvvMRLL8A7cmDhQFRYJf4j5aeRNjVpv0rdHeoFOYTtcpIjx3
	ly+9xSOnPl1LJqpuVxnNINVLaUT/XMbny7xkI2kh3wfUBBBtRm3HrrZ81RL0x16HLUH+YGFAL2g
	Whx8aZJRYFAdXXwgQ7iSccot6KGmpNWNu89SXo4zevY/z7xSetYJ8vuNQc5z5KEHJ9O1mt8NpsW
	OjRa2G/SiNAvJUk7dumMkXF1PWXRvpDafd2wj0i44Jq
X-Received: by 2002:a05:6000:4014:b0:482:fb97:2ae0 with SMTP id ffacd0b85a97d-484913b85a0mr10022359f8f.14.1788360840251;
        Wed, 02 Sep 2026 07:54:00 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:53:59 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 06/16] media: intel: ipu-bridge: Add Yoga Book camera sensors
Date: Wed,  2 Sep 2026 16:53:35 +0200
Message-ID: <4ccc1be17658cdf9ff1267d66db6c2b5a65d6e18.1788360629.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788360629.git.mauriziocasciano7@gmail.com>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Book YB1-X91 uses INT3477 for its OV8858 rear sensor and
OVTI2740 for its OV2740 front sensor. Add link frequencies consumed by
the sensor drivers when the IPU bridge constructs software endpoints.

This supplies endpoint data only; it does not establish that either
sensor can stream on the Yoga Book hardware.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98d6b..47317c423fad 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -65,6 +65,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT33F0", 1, 384000000),
 	/* Omnivision OV2740 */
 	IPU_SENSOR_CONFIG("INT3474", 1, 180000000),
+	/* Omnivision OV8858 */
+	IPU_SENSOR_CONFIG("INT3477", 1, 360000000),
 	/* Omnivision OV5670 */
 	IPU_SENSOR_CONFIG("INT3479", 1, 422400000),
 	/* Omnivision OV8865 */
@@ -93,6 +95,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
 	/* Omnivision OV2680 */
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
+	/* Omnivision OV2740 */
+	IPU_SENSOR_CONFIG("OVTI2740", 1, 360000000),
 	/* Omnivision OV5675 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
 	/* Omnivision OV8856 */
-- 
2.53.0

