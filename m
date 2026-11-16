Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794850400;
	b=DeFYc7Iw+2Id81/hvEQzeamN5Y2RshDqho6eSc+sRZi6voz9wfAXQbAvG67sPuJVmjrI
	 kT1iDW/Yrdzk9GOhWNpRmjkKIXJSi3Hg2Rwqi+ErR4WqKwIc0Zu1Vps06CeNdtcNtHuD8
	 xY3Ybktu8G5Xava6SUwHMOUdE6fP4P2gNyGv14/diEz5WP6pxXutQIJ6/ejlkjmIzEaDj
	 JyxlLDQB0ySWJXIprxudT78jgg5JD/k1WxHrQ7QPZwg+4V67M+SrEthK2la+EHcMVXCRY
	 8WiSXTDhCH99kdyYyAgZ++YrGI2awCagoYkzH770BdY1bz0e4edfaKOJ/UHgOUz9/pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794850400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Hg9Uic1Jci3EVD6ABAnH87aOxyU3YxP5Q27E7GZD9Wc=;
	b=WMqU444Q0gOuF7DQmLC57AyP/dw1SHH3TiKaHHArD/Ddwe2WDThob2vaB4hjOcFKaihL
	 NPanmynNJlBDnLf0j7eDtfzpehVnMVfBbW31y3Eee4Z97gHCzANrgNLQ4tG5wzkjpGiUz
	 R3+e0LNqZliRi+LI2ijXZkaKSzcidlD7wUKaxVYGY+PbXSSEGYY5kNbZd6G2SDYe1ETqt
	 QhS0ZRwwXHv+gbC4g732Qx1Ng0GIHqZR6xk42QD+nrxIoryvGaM3rjCUbQxLIfzMhFf0B
	 nob2PuFY76wHFsYhWeUgOShT/C0R35VxSrOclBkt0YWWJDh0WaIvS69G8FQ2EECPoIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XHuiIyyS;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170D8606A32C
	for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 17:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 170D8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XHuiIyyS
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so12340485e9.1
        for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 09:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794850398; x=1795455198; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hg9Uic1Jci3EVD6ABAnH87aOxyU3YxP5Q27E7GZD9Wc=;
        b=XHuiIyySNIsyxY27BcQgWK+XStWv9Va1OsrL7JD3mid0XcqD3Dmt0fgb3MsSRhgkL0
         NnCJx2rwZ7ApMk/PtY69b/dX6sP0JaX/Wj7Q+E128w35/NffyYsfOr/UkNngyLSXFAmM
         TZOOeLw2RqKQqq6KH/CUPToEZO3QXrSuTtndCHZghtXPd2r2KV6iQ/eT5b1Ig0bn65g4
         LmBaaA899J52ZMNKDs8BaosNMDtL66Mah0+7ikfKXMdCb1RczvrmLJZP95ykBbUvB3zY
         T4lu5N9Tw57kDTM2X9t3DBFll5dniwNBM05fRFOJo0bvKmH6ezWx7lbtRvqS26ZFlzf9
         JP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794850398; x=1795455198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hg9Uic1Jci3EVD6ABAnH87aOxyU3YxP5Q27E7GZD9Wc=;
        b=Y4xJsVKpPwBaQalJFe60JyEzI5aDSQUCij2qE3WsOcDWo1ZHQZ9HdgGvwWSrb3Hk1l
         VedVKjjrSWFhPLBuotKNN3yBQnVXuH/Bka2p0Yv4rqSu6oT/9wFiW9MTqADWGjo7HOac
         vGpzvEE6NSYJ29NyB5hczJZwt6zZh24kndQLIR72NcWywCyOJB3eOlT76LHFqgWBNDXd
         gYuiFhsf0Ohv6SCqrJCrGMG6uwslJQ7ie9dtyS4gzoyy8tVR6faMElpTnde7cl0jrp+b
         jmL7ugqW9liK8UI9yRdTRI+XhtJKTd0owqffFXn55vKRkyKQRjFTjTZPG5eG7de1hz75
         NDrg==
X-Forwarded-Encrypted: i=1; AL+hErF0Q2Ui3zpB31zoTpml0byEbgOCWAnOFuy6mpzNs1yvuyeZ1z87x3s+l+7A3CHonY1dsW3wXBzLgloWEEB0@lists.linux.dev
X-Gm-Message-State: APuU4Z+yZuyCSrTGj+FmBhp3r2bMSNrCSWS1X3QVdWSbBWlDpRHoWD0C
	GUTiomaK12V6MlxXhuWHLSS+DA4+ibaYjG34unvenn/IKaIWToS25uN+
X-Gm-Gg: AYBFou1NIQm70kEtBNmOwXfe5ANaLHjJMwNdE7OH4kOAF7qZdhVBHqXsRHtY+p3ThRm
	yLPzb2prkYsWshiQuDud9C17Bw0GoY+dGmB0M8NjNeNx5Aoa46gTJTfWdVRP7ihSM3zF1wKcT+H
	bH212U7jhxplwUbq0onpal0nof1BvWS+q+fMg9+5Ku1PHYL2IpSRvpVNIC8lE6hZJ2C44xAQ7Jx
	wIP+VZFFpqf9CUhP5MCeaKu6HYA/c5R81HNxjeP2khuLUPN7/oJFjpIfcLbfNEV83Ho0m4io0fq
	iL+LPjAobvLluATKZ22CwzDnbLfMYT1949k+egCs5NhXI2hlaF+FbzoVSdcS7cnc3AJm1rrW3f7
	SAH5cg038DXZgs4poymmTVCrFL2QK3QkCGSoqx7iAewE/A6dzXWt/IFLoZTnAdUjcjWHuHCLBfq
	rOyEdQQ3piFSrTvaSoZT/CQ1irGfb5Ma/ShBn8c/JnkVNWPgOAxoBOw9Au/RL9xhrfFx//5XPU0
	2s4qQxygTZ0QlsDdvMwlhRN84uaaGCtZwV8o+HrcILbzK5k0Kk+KAfVl/S8alhvZ0ZiDtkl92MZ
	IwjsrMScwnnFb8tHwtLvjDVINFGe6hzr0P7vWNgrhox54+tYPYp1jgRqWHRe5/01Xik=
X-Received: by 2002:a05:600c:8905:b0:4a3:5a98:c279 with SMTP id 5b1f17b1804b1-4bb55a57c66mr161878745e9.8.1794850398200;
        Mon, 16 Nov 2026 09:33:18 -0800 (PST)
Received: from Kyiv.home.arpa ([2a0e:1d47:4093:b600:498f:88ac:2ca1:60d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78430752sm3327525e9.12.2026.11.16.09.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:33:17 -0800 (PST)
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Volodymyr Chapman <volodymyrchapman@gmail.com>
Subject: [PATCH] media: atomisp: csi2-bridge: Don't cycle the PMC clock if its rate is correct
Date: Mon, 16 Nov 2026 17:33:06 +0000
Message-ID: <20261116173307.14169-1-volodymyrchapman@gmail.com>
X-Mailer: git-send-email 2.43.0
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

atomisp_csi2_set_pmc_clk_freq() enables and disables the sensor's PMC
platform clock to be able to change its rate to 19.2 MHz. ACPI however
also controls this clock, through the CLKx power resource in the sensor's
_PR0, and caches the state of that power resource. When ACPI has already
turned the clock on, the clk_disable_unprepare() turns it off underneath
ACPI. ACPI keeps considering the clock to be on, so a following power-on
of the sensor does not run the clock's _ON method and the sensor does
not respond on I2C.

On a Lenovo ThinkPad 10 (20C3) with an IMX175 rear sensor this makes the
sensor's probe fail intermittently, depending on probe ordering:

  atomisp-isp2 0000:00:03.0: Found supported sensor INTCF1A:00
  imx175 i2c-INTCF1A:00: Error reading reg 0x0000: -121
  imx175 i2c-INTCF1A:00: probe with driver imx175 failed with error -121

The effect of the clock cycle was also reproduced directly: with the
sensor powered through ACPI, a single clk_prepare_enable() +
clk_disable_unprepare() of pmc_plt_clk_0 makes it stop responding.

Only cycle the clock to change its rate when it does not already run at
19.2 MHz. The DSDT's CLKx._ON methods on this machine already select the
19.2 MHz PLL.

As a side effect, a clock which the firmware left enabled at 19.2 MHz is
no longer turned off by atomisp_csi2_set_pmc_clk_freq(). It is turned off
when ACPI powers down the sensor, e.g. when the sensor driver
runtime-suspends it.

Tested on a Lenovo ThinkPad 10 (20C3, Atom Z3795, BIOS GWET50WW 1.50),
with this file built out of tree against a 7.2.15 kernel: without this
change the IMX175 probe failed on 2 out of 10 boots, with it on 0 out of
10 boots. The probe failure and the direct reproduction above match;
the boot counts on their own are too small to be conclusive. This change
was also part of a media.git next kernel (7.4.0-rc1) built with the
pending IMX175 driver, on which the IMX175 probed on both boots tested.

The problem was investigated and this patch drafted with the help of an
AI coding assistant (Claude); the testing was done on the hardware by the
submitter.

Fixes: 0af9078315c1 ("media: atomisp: csi2-bridge: Set PMC clk-rate for sensors to 19.2 MHz")
Signed-off-by: Volodymyr Chapman <volodymyrchapman@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_csi2_bridge.c   | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index cca91c6d7..a49996e26 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -257,6 +257,17 @@ static int atomisp_csi2_set_pmc_clk_freq(struct acpi_device *adev, int clock_num
 		return ret;
 	}
 
+	/*
+	 * ACPI turns this clock on and off through the sensor's _PR0 power
+	 * resources, without the clk framework knowing. Cycling the clock
+	 * below turns it off underneath ACPI, which keeps considering it on,
+	 * so only do so when the rate must change.
+	 */
+	if (clk_get_rate(clk) == PMC_CLK_RATE_19_2MHZ) {
+		clk_put(clk);
+		return 0;
+	}
+
 	/*
 	 * The firmware might enable the clock at boot, to change
 	 * the rate we must ensure the clock is disabled.

base-commit: 3fc9303dba01676c2090768126e5327e341b7761
-- 
2.43.0

