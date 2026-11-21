Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267985;
	b=YHWHsf5w3wSdx1J00SMkKTpnFli5AvUOdzY+eUZImV0ZSVu9NpQyyzpkXmWPH0dJUrjk
	 9OKN3zhR8kkSRoV8ccQ9kfe/04tUx0BOFdGDCgKZ0kFFJD1z3s/U7+lXioZcXl4QgMGs/
	 2qoSyX8LpUex/p175sZTmpYf0pguwAPhnzJ1r0VBpDaGGMxDoYVGRFEyFkX4YZrIevJu3
	 FM/yhuVgQ4UB8kvZWNBYnNUcIhNzjPdcp99BDu+l4+eF4Mtwx6Ay3z+vNhGKA4Z+RzYGK
	 WIZ+Gz2DuLevg5OHmXVn7bcSZo3WvDDf4nMGXIUUYMPVmfRvz0ptqaN6i6QiMP7Lxsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Zgg4MnVQv6eXgMCmnMqV/EBaLR8DuEalyOb+7ER6OOI=;
	b=DWnLK9px7s4P1XBoF3AdhmqdRN0FYX7OaSEvQ67G+D0EMuiyYBX+Y/ARvwApVQeZ51jQ
	 YgdAsG1n3zNs9xFb+ELaOtXewqxY1Yk3OLT7nfaWBKVRwV2RJqJ43oN6DHolFng71mE3b
	 tGSK0TH9+UGqokGFjFeitvwlpdGNJYdErODc7RP2wZIX35EH7zW4siIPboNOurN1Wtzf6
	 unZitrtnMBKLXTWcW/w6AS4+1YdHEO2n1wHGZ/RSPYs7ydtUYBmygIisM0IonhYV4+0uK
	 T1P0yTVpvXVD4IeRxoCa3S0WG3+LDfNWiqbgWin4YGesXsjL+5mnQ/8bwxFyszGIYXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cJpD5fJH;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C72606A696
	for <linux-staging@lists.linux.dev>; Sat, 21 Nov 2026 13:33:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2C72606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cJpD5fJH
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so16893315e9.3
        for <linux-staging@lists.linux.dev>; Sat, 21 Nov 2026 05:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267983; x=1795872783; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zgg4MnVQv6eXgMCmnMqV/EBaLR8DuEalyOb+7ER6OOI=;
        b=cJpD5fJHcp4mN9PLk6OtrbffeQQZxOVoMTeZr7f+bHZcV6FT3wyxf3hv1SXPw4s8T8
         SPYDy0kGz9gQSV0oq285TdC8iezqzLhgKqiJR0MDHlxC3VMH9hZGOInek5EM6bGLeQt+
         ItAMerOjwvkWq4xCmo7ms0OR93RyBs9T2y1rAqwm2vOvcCXixGAVSwEl/IEyQ0RWlgXa
         N2FTrWDKjdXPrRUW7pChHI4KLiOYsIOqGIxkvIBuYpmk0FpG95bCDleUt+pjlgaC41Bd
         +XBqSGsygf5lJIrU3RMJ+YAxR201a4IsaP8bWu0dXnEl2/vR518twgRh4n+XYkU3+2wb
         cuag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267983; x=1795872783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zgg4MnVQv6eXgMCmnMqV/EBaLR8DuEalyOb+7ER6OOI=;
        b=NuJU4GR1zwU5FxMxo8/zWUyw3er2scRQVD/9Xs5wu+MlG4gy4YI0nlTZtczNgifTTV
         E5S/ficqdWC0ov6n1/OcdKY/GmWbVz7NsW7FwBtBQuBfhwkbJZlaf3PkWhyudbxUAGS4
         sldh1jIXAe1m4yyXDMBi3rDzNPorzvYwpV3QR9oZKFiS60slg+9FjC1RETkMYyUeHlEy
         p51Q3PHjU0VqfsVkhW1X87PnbNDKMxk+0mXFtIsmCdkAua0ge1nO3B6PK5spIyq/SKIZ
         rm9Hi7Wi9Ax26Nsel+wMpHSwC5iAq52Cemxwc0o6QmZDCQD81vDsoAS2L0XUrDIBqMRM
         JSgw==
X-Forwarded-Encrypted: i=1; AL+hErFrlWwm6YaDj9imkB4M1fRJMGz4TPIq3gFTHQKBKBrLEjZeLcwXbVghxmjFD/Kf54ce0OQjSip+nWGCR1kB@lists.linux.dev
X-Gm-Message-State: APuU4Z9bjt64tivw/kJnzzrjsRKJEJRdG+IpAiK/7qgMAr5E1z7jZFVb
	vVJMLEeoatRyYv+rR79CTX/lPGf8jXBaqsI8QxNuNiVlDCKV+Pl9zclq
X-Gm-Gg: AZFdTZfMJMkzrIaZ1oJdwGn/cDnMIV3uBB+Qq5R8IPgyRaZt7K9sWhq1nDZEWRGSDgz
	ywe6FQ/qJ3F1F8Mn8L9CoE9Lqojo6zYcrRt32AX8kx+kWHm8QIhpjOnGK83m68pNbm0GtNeKR+c
	hOcUmnSjWN+MhFq3u0BUvilwrakSaY7H/JL2q9znRJikoxrXn4AnML8y8UnjevGgTP5kS3Ztmym
	Y9pWqlX58sroCQ/P6V/ad+QLyHHRcw7e/aoBCwEiGEM34Qouj/u8tEY0grCS5inHothf6MVyGnm
	uQW6X7VOm3Gy7strNXoexrt/w/fGyG+y0mMDk+3Jv10S9nZvHC9l83ceQUWfnwoMyPXjFxmhLOi
	Tm9mYOGgV6WM7tpif/BjkG4hqLs4KOTQmSCwqXN2KTr/NfWwd0yNXB0eLEaZInlQdcClGM4ESsR
	ftBbz8whteptOD62K6tDYXrtpCua13xNLuWWj3QiG+sJfwzHFL6pSB2sGHcGyDcFnfQwGSYRENZ
	PJqP3jv39J6gDv0WOZxifDW6tJGkFGbx/znO1O2AnqlE6NWFq6MZItQYydduIBq+RY+dnHKM3mc
	ra/ikWDTCYDj1SrA9rNv6fSDm/sx9mzfWZRlf7hX01fH5WameSg1oehKUWyqb0yFbnQMSgfocwB
	eXaggE+kmII31SGrxNb/ZXXjHXJoCTHFO+Q==
X-Received: by 2002:a05:600c:3ba9:b0:4a2:1050:aff with SMTP id 5b1f17b1804b1-4bb8881c741mr158498155e9.6.1795267983223;
        Sat, 21 Nov 2026 05:33:03 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:33:02 -0800 (PST)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v11 08/14] media: intel: ipu-bridge: select OV2740 frequency by IPU ID
Date: Sat, 21 Nov 2026 14:31:38 +0100
Message-ID: <388d5bf4b5e2f99f6e6d8c0eb41e88ad28091b75.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795267528.git.mauriziocasciano7@gmail.com>
References: <cover.1795267528.git.mauriziocasciano7@gmail.com>
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

The OV2740 connected to the Cherry Trail AtomISP uses a 288 MHz link,
while the generic OVTI2740 configuration uses 360 MHz.

Use the bridge's existing PCI-device matching mechanism to add a
Cherry Trail-specific OVTI2740 entry before the generic fallback. This
keeps the platform distinction in the bridge and avoids adding a second
per-sensor link-frequency override path.

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 5f6baac2c..5dbd74e2b 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -58,6 +58,11 @@ static const u16 ipu6_ov5693_ncont_clk[] = {
 	0
 };
 
+static const u16 atomisp_cht_pci_ids[] = {
+	PCI_DEVICE_ID_INTEL_ISP_BSW,
+	0
+};
+
 static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	/* GalaxyCore GC5035 */
 	IPU_SENSOR_CONFIG("GCTI5035", 2, 175200000, 422400000),
@@ -116,6 +121,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	/* Omnivision OV2680 */
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
 	/* Omnivision OV2740 */
+	IPU_SENSOR_CONFIG_MATCH_FL("OVTI2740", atomisp_cht_pci_ids, 0,
+				   1, 288000000),
 	IPU_SENSOR_CONFIG("OVTI2740", 1, 360000000),
 	/* Omnivision OV5675 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
-- 
2.53.0


