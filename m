Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267965;
	b=pWpU/WWZPRQqHRM/bg2riCmDJHgGNwRNIFawtJ7PO+gHocRq63Sz6kUBBnnsm7e5267i
	 JBNE6Ail5wMVomv8XqOThhn+8Spu/5YL+M1pnLdecmHzdW/e58qeC9bu4h4Ar5O3+nn7p
	 qU5yiYXiv1MCs5Ba02+T2sEVwCg6TnSrbnA837honx+an40IJJB7dO+enr3TpwmyjNy+9
	 aobkjoKkD+HLuGeYa9nBrp2VknwWNZ9yh3Pokny+35rx2EBJlrpI6IO1OUKTSohSv4JgJ
	 yyG9Dw00Vx4dL97XcvT9RmyA+jfz2fWfF++PgZSpiBh2GMUwaG31++BI5Xi5pfhnrAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=c3DsBgVi8DrQQ4XXQEryKDQ1UHFWr4n3CZ7L7GxpMVg=;
	b=WQeZx4jtDn5QgCVLU53BYfzK9CVVAoIxDCqEJNtmCM5+XnlXLPv9bJPRHavNQWQpxzr4
	 e5APVDDrrjXtFoy4dA2YBfJT31MUlpJvNeyH5w2biFfd1CZMSX8bSv6Qch6+IrNT35Oil
	 hxAMPTXLNioumF3OCC9YXt7f28KS/NrbvRWrdDcpTxsMvnMIL03/FpPp/SC3tn9SniWOI
	 P5B2CtjoUTeCZnBU1rtFaEN3ayQl9e1Tco8eal2hINnEPum+c0eJ6u2HjBdqFyDFeeQBw
	 HAiXy6k/eXp/aAJDxuFZzlEeKL/Y1rukcvE1UParksLwpEXNtggxkbYP+Yq5gf4zgmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wOqRJQJE;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1921606A320
	for <linux-staging@lists.linux.dev>; Sat, 21 Nov 2026 13:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1921606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wOqRJQJE
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so16490075e9.3
        for <linux-staging@lists.linux.dev>; Sat, 21 Nov 2026 05:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267963; x=1795872763; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c3DsBgVi8DrQQ4XXQEryKDQ1UHFWr4n3CZ7L7GxpMVg=;
        b=wOqRJQJEwkiduJSeTr3fJqPllbFffUSQGV+BgEoqbGSadJUq78+0FkX9D0yIzMDQwU
         sLhZXJmt66/zvEToaKU5+5jNKNx7N8mePwh2moCD3r+YYDVV/BVp8Qgs91M7geHsepQ9
         +fyc5QN8X4DpvGP9hl1du/E4uQfTHImfMD4MZrtyPJgovs5vJrBR0hPJSiks+zX6v34A
         KAvyObx/hWV/b4WiO8PfTPlTn+AO73D5j2rYsW+pJ19J8rvBscQ3JiigWNoklIAvAs4O
         F7QYk1iKsdNxamwiFFvGXlsosZKZIuCtoXF6+/sRbs1luNZ03sJqV1xOy9x3tfwO0HkN
         qIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267963; x=1795872763;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c3DsBgVi8DrQQ4XXQEryKDQ1UHFWr4n3CZ7L7GxpMVg=;
        b=dOv1Wrgq+wMg+f3t3NSuKcBXmcJcqZvTWVkUX3U79w8awNULdz7hA4uMFYMtc+avZg
         VQLywBGG/3YfbMQ/ut86lQDMFTxOUCNQYlJFP/lWD/SCNB5Ueokx2PZX5Y/7WzDL3fzn
         lzsUJURwOkAE05oPIevJsmOKVlAUrWdLUjdowfhG7YCYCZMvCqsWZkYPVnwjMwmom+k9
         xsqV8uFGD3mC9CPVmQ1chs0c+/CyKIZ0nXuPvySH1LdIPhFjOIUur/u+ATLe0MEMx3PH
         4M9ir8E2OdO+jtteAqHoe/PEncOSHeXw7kuSG+3mJ5K23AJiIARPzORzWYJmPpEGYFm5
         3mHg==
X-Forwarded-Encrypted: i=1; AL+hErGgPnpLxfdm0wUiKQaoL/pVZ4VgI93UweegEVRhBM0Mb3ifWYlSWT5JY2dr4Dh8ByaxSaz5kp7uDa66kZfN@lists.linux.dev
X-Gm-Message-State: APuU4Z9dFqINWNUY92L0cddrFccJijVem7CrFdUi7SDHbKWbVf0f7PGa
	uXPE1fIGfyXGvBCA/7qYxGD1sC9aAr0jhuYw3Gb2AExQT58YGVqgVvlY
X-Gm-Gg: AZFdTZdhHEQX/fZL4Kj7x7anqU+cL1q6nkwirKEgtVyP7QuJ+ePdhe/zwojBBLEsS2u
	D0G364qlcP1bbzC2LUmshDmZZ1tPBwWDOcprbDlxwUeymC+dDLcBs9akgQ3pG3/h7N7CGL6MYV/
	5hP9fgakCGW/9Ve5Cq/gAOmCjbRJPK4wIRT7cVlYz70ez6HQT65XcXp8wSOAV59wdGGRMILZptI
	UaAd425byRfOCDohKbMMI1A7guFf/CO5VIerynEZllzn7uMmRAKS6RqtyiUwde8IIQ+RYuinUSA
	WX+ocj2AYL+EShFV4LZw3LCWV7zafAiw2WdjTwkmWehplPjJDOds9hS2zVMCzBj+jwBlIR3DbkA
	KhERJU6xFGd0Xc3ohkR5FSp+Qz1QYqAyOscB+o5RGAXbKLPDfsDJOx978ZIdGuIMSzoyUGcbuQN
	1ZPAKR8SPmYgqmRUU37OVz//3EfrqN5KkWDEurOdorb+pcwQ/2AJrcgQv/IC8prXt5XB/E3lJkX
	Krvs9HQ9Tp62G9ccZ4AUE6YASFL01UEh1bgQo8i9f0n+iSAIAwdaoU6b5bBYCyxPTnrsFt646VM
	K4+tTR7iB2B9s8UkPjmzBSk4QV3ZybMjnBW8TVvSwjqrm0JiAemTB730Iv+bvsSYVoN1Ptplr+n
	+TdnFXpZNoS/0
X-Received: by 2002:a05:600c:4e0c:b0:4bb:875b:f23f with SMTP id 5b1f17b1804b1-4bb88827f0bmr130593125e9.33.1795267963076;
        Sat, 21 Nov 2026 05:32:43 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:32:42 -0800 (PST)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v10 00/15] media: Add Lenovo Yoga Book camera support
Date: Sat, 21 Nov 2026 14:31:28 +0100
Message-ID: <20261121133148.1240789-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002-submission-media-yogabook-v10-b4-final-v10-0-817ec765b257@gmail.com>
References: <20261002-submission-media-yogabook-v10-b4-final-v10-0-817ec765b257@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

Thanks for the reviews. I made the following changes in the local
test series after reviewing the Media CI reports.

The rebase drops the OV2740 ACPI initializer cleanup and the OV8858
INT3477 match because both are already in media-next. The IPU bridge
uses the existing INT3477 entry and Andy's shared Cherry Trail PCI ID.
OV8858 19.2 MHz support is limited to four-lane R2A. I dropped both
sensors' proposed red and blue balance controls. I have a separate
reply on the clock register sources and the remaining 24 MHz testing.

The AtomISP CSI-2 timing code now uses div64_s64(). The i386 AtomISP
object builds and links with the kernel division helper and has no
compiler-supplied 64-bit division references.

RAW format enumeration now checks all the sensor media-bus codes.
RAW frame-size enumeration uses the requested bus code and leaves
crop sizes unpadded. TRY_FMT uses the same conversion padding rule as
S_FMT, including fallback to a native processed sensor format. I
tested those format cases with simulated sensor responses.

WV517S defers hardware access until first use and restores the last
successful focus value directly on resume. It balances the runtime
PM references and keeps its subdevice and control handler alive
through final release. The lens exposes only FOCUS_ABSOLUTE. Its
ringing-control mode is set internally. The actuator object built
with CONFIG_PM disabled. The WV517S lifetime change depends on
David Heidelberg's V4L2 subdevice release fix [1]. I used his
original posted patch as a separate prerequisite since the
media-next base lacks it.

The revised x86-64 kernel image and modules built, and the focused
Media objects passed Sparse. On the earlier 7.4.0-rc1 X91L build,
front, rear and front raw capture each produced 30 distinct frames.
RAW and processed TRY_FMT agreed with S_FMT. Compliance reported
40 passes and the same seven failures as the earlier kernel.

On the exact revised 7.4 image, both sensors and WV517S bound
automatically. Each camera delivered 30 distinct RAW frames and
20 distinct Preview YU12 frames before and after lens rebind.
The capture and sensor nodes survived the rebind, the held lens
descriptor closed cleanly after unbind, and focus writes worked
after rebind. The actuator returned to runtime suspend.

The revised series also fixes the V4L2 helper's rollback so a
failed lens registration preserves the existing sensor nodes.
I reproduced the old behavior and verified the fix with simulated
allocation, video-node registration and media-link failures.

One boot needed a manual front sensor reprobe after the initial
chip ID read returned -EREMOTEIO. On the next boot the front and
rear probes both completed on the first attempt. On a separate
boot, the front sensor read its chip ID before the rear driver
was loaded. The startup condition behind the earlier error is
still unresolved. The local OV2740 follow-up gives the chip ID read
a 100 ms polling window when the initial transfer is not acknowledged.
A wrong chip ID, an unrelated I2C error or a persistent NACK still
fails probe. A fixture verified the retry with simulated I2C
responses. On the X91L, both sensors bound automatically on three
warm reboots and three boots after a full shutdown with the retry
build. Each sensor delivered 30 distinct RAW frames and 20 distinct
direct YU12 frames in Preview per boot. The retry message never
appeared on the three cold boots or the two warm reboots with sensor
debug enabled. The third warm reboot used normal parameters. I am
keeping the retry out of the next revision pending evidence of the
failure and recovery on hardware.

The direct YU12 timeout occurred with AtomISP in Still capture.
Both sensors returned one complete frame in that mode. Switching
to Preview produced 20 distinct YU12 frames on each sensor, and
front NV12 also produced 20. Both desktop camera endpoints
produced 30 complete 1280x720 YUYV frames after a service restart
in the earlier trial.

The front-camera lane override remains scoped to the tested X91L.
I still need X91F firmware and hardware data before broadening it.

[1] https://lore.kernel.org/r/20260917-v4l2-release-fix-v1-1-acbac7f9b78e@ixit.cz/

With Best Regards,
Maurizio Casciano
