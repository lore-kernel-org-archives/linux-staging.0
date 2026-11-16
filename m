Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851540;
	b=pgz644Q58LGemiSG0+fdwNEvI1I58YQaEHEXEL2zQCBAoN++BeftFqGy7lOK/G3Fu6rX
	 6UfJt4/tFPKotQ4iktOZUtM47kBwdB2I/0Ag+NQMQnSsWo5f1a2ankLS8BaHerU6vPt70
	 +C2aIrYCF2Qb83heYe8gTGIlPG28nPjJz+4DKCYDCJiAARKFgZlAQzpeKFg+NzEVG98t8
	 Kq/4NTGqj+/K0HH3b3QA5aSzWFVGZShXp70laxG9Jt0K3XzRpZrRsMm7EGP7Z80cfUCFN
	 cw69SUkOo5bJWI6KhOb6Lp997Kimv9K63E8V4DuRlT9NFXzLxFRCV9yre8Zqm8mcuTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=27hTMuZJ1nA66i2pyU7gbAoW+DUnYiuiRAEIvnlQvps=;
	b=c18OlLIsKRa5d/EduHlQIJU+6QqEZFRWlLzsy3dOoJ1nzl+h4wKz8mqlYNkdJCgBFgOv
	 bL00gniaBkVv1hIaU1585Adj6lerGgKmrgc9NzYkt05NN59RUsz7KqQ/NG1zv+ZNXeHYh
	 Sqq+rp91PvKBWJrhnxc8khrjdF6te4ra41h8tuK9Stb5iHezgQ+f5izFceClfUrLKuERY
	 uXC85szGR9DI1uXWGKmIXkACE7MYusulpTPj6VjlaAY+HU+G4+ddTTXH/CuImKxMMvMG9
	 6d80U5L9MV7UCPcxraqMFzdhalWTSgEZqusnJ/cwDMy7zHHPW61vEUk2mIRUTJhkpbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BSPUuTne;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEED606A335
	for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 17:52:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AEED606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BSPUuTne
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so8488795e9.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 09:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851537; x=1795456337; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=27hTMuZJ1nA66i2pyU7gbAoW+DUnYiuiRAEIvnlQvps=;
        b=BSPUuTne1xhPrqwW255jfFNATGJ7yH/tyUYAnyls/KgmfYF8pf8JmGes+kiU705IM7
         P02IuwphYoQSNN94mNj73Ok5GE/GVrM5m43QDo9r/vnN0GjrZlxPWzBDlcH1GkYrR0XD
         JbV+hk9JhJd3/RUOrNaasUXM6EB5hSrYlp+a10a1YkFYCvA09nusJO0OrdJxheNWROxU
         XPyy5SE5Gl9V2DTp1TjalFXRBO+9KkTO0D68bFJxfWoLI5Dm2IGuo4TqZMwWwrcU20UF
         /h3edkeeS3qrvoRDOY6OIbbEimCn4y5c26lxbHWCKUsPV/5+UxIwHlmVyuolS1D6WFvw
         iJYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851537; x=1795456337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=27hTMuZJ1nA66i2pyU7gbAoW+DUnYiuiRAEIvnlQvps=;
        b=hPsjIuJBYQfiTRCg98mzRUJ143KVaUkJUjfCtFt8+d3TfJqivkOKvOcU0hM2bMjVhs
         wSH+6lQBpqZV+r72s937YM7m0Lr3dzqLeyeP0l9VjKMnPBkFcpR1g2V62Dbh7hh5zjzm
         RtqjaZ2F0Jx6kCcTgHoZT0a4ccc8fnlc6t29IZJ1GwikKfz2x07kkQ1jw9xmFuOm5qHq
         5Rq089PsP0lHLhRvYLixeBThc1b5pkrpPSpj5aBf/FVtl4c7ZYVsvzxWaxBI+/6ojFN+
         yCHbzUvCKrnYnXIrDKMFyn/1VhEmRp3R50Qd2G5hyWfWjv4fQTbetkbXmhPSvBpdh0fO
         vBvA==
X-Forwarded-Encrypted: i=1; AL+hErGfA0eqfz6SeH/3N1weJ9OkXFBTeap40iisgNg/xSDtPSDhyWkWpHWq1QIRoqpjybrpYrwFKYmGkFXQMPNw@lists.linux.dev
X-Gm-Message-State: APuU4Z9H6EAs8N3ia/TQltliQvWhwQmL7AiIBND+G1WqwihaOjtiWRAy
	Cd79puHYvKVgUQlv1MSSQMFeg+leBWG/XhFAYMeBjhJObdMXygKDUSOC
X-Gm-Gg: AYBFou0FrtK3nh19gzD8bsXCgqCcfpEw4Wfv26QpFcJq4ktGbcvs0z8pib2Ke8d2N62
	M5lOuCNu5RiUiHNa0mNEJt+PULPTbecwWxZzrYGIDEx43VSXzZMYdS3uMEWLG+DxbnMlDZe20oM
	7Ac7TiObrTIUd8/9FGyGnmbtUO7d+wXPJ09a4GqyfBv5B60Jz4kIHGkv6voH9C+AYjALjDyeFcq
	oJaziUEK4jQvc8MOCqw2WI8PsCaQRcQCGTxwSXxKo3oByv9xciC31F8+vavsdZ0UiMMfSFaghEG
	xhenKllNW3F4Zy6ddQbirByDsbqcTW9ruEiSLC7b/A/nVtf8FDi2ZLkGVK4xzdHwDdVVZphZDrJ
	scifxJj8FiAnwDNCzpUTHfL2Xajm5rYrH/kRXmYmo+287Lkbm/+WHN9Krw2aolObKLPJz5dq0rF
	ZgQXvlWWbcdNSH2VGC7bThR26FDGHdvosc0yltI49XGPeIPiFx3dpwZQ4O6HhVP2J60ATxLhzoE
	/xlA4b6HoQCMLvNKbp1lqUHMLKuECiCW6oP8QYm6HatTQQS6iaykeSkLtJHzfn2Do7NGdDHo5hX
	abNjsl7tDjZ6WfN5EfA/xYeL8I77wnDWySw/PAvwJ9z4go5Nn/jHEwjjKv74wdmW2Ss=
X-Received: by 2002:a05:600c:8b8a:b0:4a1:9078:911 with SMTP id 5b1f17b1804b1-4bb55abbadamr247795715e9.31.1794851536667;
        Mon, 16 Nov 2026 09:52:16 -0800 (PST)
Received: from Kyiv.home.arpa ([2a0e:1d47:4093:b600:498f:88ac:2ca1:60d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78430752sm4546075e9.12.2026.11.16.09.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:52:16 -0800 (PST)
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Volodymyr Chapman <volodymyrchapman@gmail.com>
Subject: [PATCH 3/3] media: atomisp: csi2-bridge: Add IMX175 sensor config
Date: Mon, 16 Nov 2026 17:51:51 +0000
Message-ID: <20261116175151.20150-4-volodymyrchapman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116175151.20150-1-volodymyrchapman@gmail.com>
References: <20261116175151.20150-1-volodymyrchapman@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sensors without an entry in atomisp_sensor_configs[] default to 1 CSI-2
data lane, unless the firmware provides a CsiLanes setting, which the
Lenovo ThinkPad 10 (20C1/20C3) does not. The IMX175 rear camera of this
machine uses 4 lanes, which the imx175 driver requires, so add an entry
for its ACPI HID INTCF1A.

The firmware's own camera _DSM data is consistent with this: it returns
0x0104 for the IMX175 and 0x0101 for the 1-lane OV2722 front camera from
the same method (GUID 918ab242-c37c-450a-9d0f-f47ab97c3dea), which
appears to encode the lane count in the low byte.

The VCM is left disabled: the firmware does not name the VCM type and
driving it has not been tested.

Tested on a Lenovo ThinkPad 10 (20C3) together with the rest of this
series: atomisp configures the primary port for 4 lanes and the IMX175
streams in both of its modes.

This patch was drafted with the help of an AI coding assistant (Claude)
and tested on the hardware by the submitter.

Signed-off-by: Volodymyr Chapman <volodymyrchapman@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index cca91c6d7..239c287ce 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -360,6 +360,7 @@ static const struct acpi_device_id atomisp_sensor_configs[] = {
 	 * an i2c-client for the VCM, so it is disabled for now.
 	 */
 	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),	/* OV5693 */
+	ATOMISP_SENSOR_CONFIG("INTCF1A", 4, false),	/* IMX175 */
 	{}
 };
 
-- 
2.43.0

