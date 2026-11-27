Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782818;
	b=Fj7NaDBuy1S2Q607jzj42ZccCSKPSax/3kvveaNP9GyeoJ9tWILCrGR/L1TecU6s1qtG
	 BCU8ab2oZW2ygllQz5Jr0unkSPId60i2wlsyNoFftegEvivc19w0lcN/m1LTMo7vKh2KE
	 CyJB00cQ7nYUHe1Zu4mm3jd9t8ckRQCzEyk6ZvzsJ5gP9qwOJ2AryqY40IyJefafPO/vY
	 lDCfiIUBlcWE3mUev15vRBvj1cygmpz1oTrANsxg0PSnbfHeC+S2ZTuRS9bp6nDpK2ft2
	 vdEwEbm4JtX3vGm3qVk6bn2KV7kenEMyC4iU0kR9ABg9KqMZUA8ysyNj1W4fBgE/BUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UruTXZxxiLvetKzSZp7hmCf6qHi2zqy13sjBi3H5//8=;
	b=qipZDeDCVbpsVZu/afDI3yaoDXuOSZ9TA1OVCcFM4i+NFYMKmTdsr8lwLgKeSw0vMy+U
	 oqIopvT7mGYfQ2mQCkI0WzNZ+iatYdfVvwUbfPH1tYzBzHn8xVdT7GSGlMfr1sSwQXfns
	 OZopuE9ThwnbxnhILAq1mGP2CWG8oovqIGe0It36pi9gltSzR1CQ3Wnxw6O9YB8hxjUts
	 cNwSUZf3Dp3jd0cOVjYRBrWXGS9v4wprtLqoEaas/dK33jEwlX9E6VvWVK0Wh9Hu45dl9
	 kZv2vy8nDu1siKC7lveRGQD80BCCFqjnCAAfuYurSoaNxsLaHB9C1QylQYIiIXjuH3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ac5GrRG8;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42831606A31F
	for <linux-staging@lists.linux.dev>; Fri, 27 Nov 2026 12:33:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42831606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ac5GrRG8
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b4c8b51b58so4709578b3a.1
        for <linux-staging@lists.linux.dev>; Fri, 27 Nov 2026 04:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795782817; x=1796387617; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UruTXZxxiLvetKzSZp7hmCf6qHi2zqy13sjBi3H5//8=;
        b=Ac5GrRG8v3wLmkuToWmsV4TGnLoqW60pVGtsVE0qJfyYP2kfRrAvQpfOnhMP3cK7aC
         /kCsuIutzI0l3yrAa3c/t56XMt48UiPaohDvLX/WwsFJeqZ8494ypTty81PR9m24BLzv
         DpawOeHGbHK6v2WQfV+PNX9yOqsNuQdHqN6iJkJ4Pp2Xaj+3efa+DsgEW3RxjY/qW9BL
         0JyovZGw/tnJ8GLV/068W7ZKroygXM81RtznRkaVVxYGkLfZMl4sB76BkaPOYIZSVSIu
         Iwc+ztAC/uB2fmrJnb3o4Ww2fNK675LbZOwn8I4N4ljSUgnS4KOZB2St3KJcJfxsa/lq
         ZuWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782817; x=1796387617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UruTXZxxiLvetKzSZp7hmCf6qHi2zqy13sjBi3H5//8=;
        b=yE+RKIUmvwvE4mOv0F/OLRTtGSujwyf6VbbpH/J8azujLVMexLyumcX22AWaFdtHID
         qJB/q+5c8kHJCS3y+KALI5qLKKd2SvSJ+r4F9w9NwsA0mJbht5/Ebzm8jf92OEKUgvCR
         GAYXPIr1tm1uSYY8LblzG3tIkfGqhD6hhaWwSlrcNFS5rHtfggbHjISWUb98xjQmGLYL
         0C2uRPrAxlsDbO5QMAgabOmqlPIA0u4OWmxWI6tKVuANvHPPedUaeKlOERFoaf9OCccQ
         2U6RdkTPmfC7ilVWE2dxQo5K5iQkUVJIPPbGWvDDdTXf4S49BGXtqTiJOwe8v4cbgPRi
         Aaqw==
X-Forwarded-Encrypted: i=1; AL+hErFGKuKCMnjgQ9Wz0hLNV4xv16749ov746YM+MO3mY/Vait3Udsq6MEcGVW/Ipw7LEy1y1UyLiCmrQHeboOu@lists.linux.dev
X-Gm-Message-State: APuU4Z91HN/bEM0owp8TK3grCFtc46eGpNYfBiwP5W6h0GA5uhFa3k9p
	CILToDvh4ROIR9g/DFt4/xaE+CK4JLdNqBRc5n7ViwfWgRewtp34oZE/
X-Gm-Gg: AZFdTZe7y72q5kVYJvQ0t7XQCA/Ux8DZYthywenl1mnAE/jir6JiJVLdZipN1xglylF
	+9GDbnkUFxJ1ouOzSNqdvLBxmi6tgwpSrmTLf537irIJpqQLHvMeJJkBDkFbM2TsLWmqLdas1s5
	x5mvNps7C5F+ITOqnx/s3tgFzZ83HGgxc6fAFj46HGQ2WfkdD2zHloAAoxMpMfJSrNSwLown9Tz
	jPJxTJzVFjRh5WjEE1uZnqLJwcojT5q00Ly9p7+0iNdKCdILAhsjab6r0gRWeJzQLZd5g3Fohk4
	ByiJ9ygUj/kkDd/pwD8FE6helZNp63VUVL3Yqj73u8X/fTUWe7CzeUDOJTQOxmD6r5ga4zjkGv5
	WPKYFT74WqiX8pWgbivazMI4kqQcx3tcn/xY/gj2FrJ3abqCGdjJacQ6vV5s5PzPNz9h+AKX6Tv
	HFxVxjxBns4lnGqj6Y1BtpDS947+mnVGIFzpkzL5UtXV4c1vS9tg05rZvXFI1G6vPS+IElpswzA
	g0PCmOie7xwF2YCyrLPyGUs5de3UFt/IcJXEOl5rRrFdLREbtSHvmJ1w3tdUGOsnmOXmtvypiHP
	68DFKXjFY8Ys62J3//bf5KGDi8pWdIwSrfC6Y/k8pwN0GWtAyaRxWGbJ5p3e3/FFvxCGG0A=
X-Received: by 2002:a05:6a20:430d:b0:3eb:aeb4:2c2c with SMTP id adf61e73a8af0-4014a17d41dmr27791319637.4.1795782817548;
        Fri, 27 Nov 2026 04:33:37 -0800 (PST)
Received: from localhost ([2401:4900:1c2a:12da:3176:e694:92eb:c932])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077944bsm12568899b3a.2.2026.11.27.04.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:33:37 -0800 (PST)
From: Punnay Sharma <punnaysharma805@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux@analog.com,
	Punnay Sharma <punnaysharma805@gmail.com>
Subject: [PATCH 4/4] staging: iio: impedance-analyzer: ad5933: keep old values on failed writes
Date: Fri, 27 Nov 2026 18:03:03 +0530
Message-ID: <20261127123303.144052-5-punnaysharma805@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127123303.144052-1-punnaysharma805@gmail.com>
References: <20261127123303.144052-1-punnaysharma805@gmail.com>
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

ad5933_store() updates the driver's copy of a setting before it writes
the setting to the chip. If the I2C write fails, userspace gets the
error, but the driver keeps the new value.

For out_altvoltage0_raw (output range) and in_voltage0_scale (PGA
gain), the new bits stay in st->ctrl_hb. ad5933_cmd() sends ctrl_hb
with every command, so the next buffer enable programs the failed
setting anyway. For example, if echo 198 > out_altvoltage0_raw fails,
the next sweep still runs with the 198 mV range. For
out_altvoltage0_settling_cycles and out_altvoltage0_frequency_points,
the attribute reads back a value that never reached the chip.

Save the old values before the switch and put them back when the
write fails.

Fixes: f94aa354d676 ("iio: impedance-analyzer: New driver for AD5933/4 Impedance Converter, Network Analyzer")
Signed-off-by: Punnay Sharma <punnaysharma805@gmail.com>
---

Notes:
    Tested in a virtme-ng VM with a throwaway copy of i2c-stub that makes
    the next write fail with -EIO. The copy is test code only. I have no
    AD5933 hardware, so this does not show a real bus error.
    
    Before: echo 198 > out_altvoltage0_raw fails with -EIO but reads back
    198. echo 1 > in_voltage0_scale fails but reads back 1. After a buffer
    enable and disable, 0x80 is 0xa3, so the chip got both failed settings.
    A failed settling_cycles write of 1023 reads back 1020, but 0x8A/0x8B
    still hold 100. A failed frequency_points write of 200 reads back 200,
    but 0x88/0x89 still hold 100.
    
    After: each failed write reads back the old value, and 0x80 stays 0xa0.
    The same writes without a failure give the same results as before.

 drivers/staging/iio/impedance-analyzer/ad5933.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/staging/iio/impedance-analyzer/ad5933.c
index bb72d9c55f6d..cd3c8661f4ff 100644
--- a/drivers/staging/iio/impedance-analyzer/ad5933.c
+++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
@@ -379,6 +379,9 @@ static ssize_t ad5933_store(struct device *dev,
 	u16 val;
 	int i, ret = 0;
 	__be16 dat;
+	unsigned char old_ctrl_hb;
+	unsigned short old_settling_cycles;
+	unsigned short old_freq_points;
 
 	if (this_attr->address != AD5933_IN_PGA_GAIN) {
 		ret = kstrtou16(buf, 10, &val);
@@ -390,6 +393,10 @@ static ssize_t ad5933_store(struct device *dev,
 		return -EBUSY;
 
 	mutex_lock(&st->lock);
+	old_ctrl_hb = st->ctrl_hb;
+	old_settling_cycles = st->settling_cycles;
+	old_freq_points = st->freq_points;
+
 	switch ((u32)this_attr->address) {
 	case AD5933_OUT_RANGE:
 		ret = -EINVAL;
@@ -443,6 +450,12 @@ static ssize_t ad5933_store(struct device *dev,
 		ret = -EINVAL;
 	}
 
+	if (ret) {
+		st->ctrl_hb = old_ctrl_hb;
+		st->settling_cycles = old_settling_cycles;
+		st->freq_points = old_freq_points;
+	}
+
 	mutex_unlock(&st->lock);
 
 	iio_device_release_direct(indio_dev);
-- 
2.56.0

