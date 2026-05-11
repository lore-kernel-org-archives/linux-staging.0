Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6A643E9CB
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 17:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778519587; cv=none; b=NZZuI/XB8qiSug9UOepz8aCEQFo3LiqnITXFS/8BN5dPGlnSCyP3Y2408xEWOqmk18X4TNG3Bw9+0suNOIat4VwsJP88c5YeibiCK8fPAiZUMD6J3ewjRnXTAMbb4MVWEdbWFYVVHYxPmiFgoXDky7HavpNLFUSDg+H7QrHScns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778519587; c=relaxed/simple;
	bh=N0B6aeBfvO3+5jUCRXLgc9fs4gJYVndcLiF0eEoluaI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kzn8zp750CnYpTB5ZwesQVZlNgG9VYh3QImlVZmKptFlxaQ6QvXplmygBsIObxW95hd4gIqzcjXhakiy0F+olg9jHbDLPi1G4reNNu+oz6rCMLhhU9pPgQ7vzy+U/cuDJcC239DsYr5UWiNgxmyX47sI8HrHaeQY1Xxy15GlnM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WPiqWdEl; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WPiqWdEl"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-366139223e4so2842112a91.0
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 10:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778519585; x=1779124385; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dkzJ/hC822piYaCvNo19iUpPViiOD5q0JLp4DMc5nn0=;
        b=WPiqWdElZv2C8IaL1rX2GJRfalgLIvST1GkcIy0IQQ6ZrqGg4m6E8Bxe2/gz0B8qwf
         6dPvTBWG7wTukY0tVE9Br9XfaOxKbozV+mcT+SCnW4uEEp8NUYpgkObJR+7kyWGT1tuW
         RffzEO9ARewBmAe0b5iJOqksEdtsirEAWuFbXAiXAI2867FLf2mQVCvP4w4dLbtTz0Iu
         Nzx57xWInt7eGR7nQkHSCL1It1JlwTg8VL108osk7GM0VZ0KUCROiUcOeh+YygR+ED8S
         UBn/yFB4Nqjnq8fsRGhG+/81bZRnupev8lTQqvZDFAV8VT8nePfHxQ1YE4U5QY7MbbKA
         2G4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778519585; x=1779124385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dkzJ/hC822piYaCvNo19iUpPViiOD5q0JLp4DMc5nn0=;
        b=mGkhG1ugdekdoXSaQ8I51dKh+KYvxYY938q2vamLpYpi1NJy/rzGDa934tiXcC4a+Y
         Xi96ZanNcwZpzXD7NPJebZG/QVb6UcCNhoRY83tsICCuKgBfWykgWCO0ejVaHHk9HBST
         +jUSmXVuBC+2FnxbVmpoeMFs4nz/T4WPECDC6RpFQ7tVGTdx2+DEeG/wv2CSCoWCJur8
         7nQhJxBkuHFii5MKknbm150dg1icxCMKI55+ATjdMqmPU6TPL9NiOv4opUvafqwh0SOR
         HlnP6e6bqw4HVCvghjEJks+z/TudetqRCyMwkHHlHCYb8npg8Fp090vNLWJ1ilgLG24s
         Atvg==
X-Forwarded-Encrypted: i=1; AFNElJ/NII8iktqMayPVwAEkt0SOYKOM/E3V3Vgkgxsrngz31q0WAkK+6ujaRQSAVaU5LIRDqQ7xkS2SggBmIwBI@lists.linux.dev
X-Gm-Message-State: AOJu0YyACKqQARd2Xh0HXIhILnrW5iLQfN7FlOvcg1GZaC4gsgEGaXhl
	LloXYAPqJUYrFu6chjGRsYhKbidFouC9QSXjfK+8CYppcbSlT6aR/eu2
X-Gm-Gg: Acq92OHeOl4e8t0seqbKEp3YexLpgy8r4ZNvS04MWGm4exDnIgl1MVxVAOLibewkG1J
	s9JLKygdaMU/VC2B4ygWDLZ71kw6ov3w4u3OACRykI5IeVyNqtPBDjZVkzOVWiqJNxcP7KcT3QM
	nZ3qypmkCGMUMr+yNYKXX7Eb6dLtW2n9SZ9J/SkUjpAOgj3N3XeXrHCDL8oXX1efj00+T8HbTgP
	0LNmNgml9kKdwcQubojQ/WKhKIz/8o7pasmxI7zH1mMYvK7x2S2mUop8y9QThFXbaYCEBeppKO+
	zMXl+o/5lHIIYVuIJN82+8kuZWE2Oy6gxgmiiF94MAijli7uPtFte4BLqIFB7CSUA8h0ghzkkam
	ByS3v5ftdSRlO/SnYChUCp0sk+FlE8htv8Q56MY85O0ttOdb/DC/AD40wauMRoDQ2l1kFrG+XNK
	o1b62wFQbx+JN2C+E4bcOPiQ/SxVMUZQZjIzmk5/NRteikaeiaeo4x1uUq9IGDxYongyFCRXeNE
	Q==
X-Received: by 2002:a17:90b:2d4f:b0:368:65bc:e32b with SMTP id 98e67ed59e1d1-36865bce380mr4105229a91.15.1778519584761;
        Mon, 11 May 2026 10:13:04 -0700 (PDT)
Received: from avinash-INBOOK-Y2-PLUS.bbrouter ([115.99.181.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d683fb92sm8055704a91.12.2026.05.11.10.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:13:04 -0700 (PDT)
From: Abinash Singh <abinashsinghlalotra@gmail.com>
To: jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abinash Singh <abinashlalotra@gmail.com>
Subject: [PATCH] staging: Documentation: dds: replace frequencyY with frequency
Date: Mon, 11 May 2026 22:42:55 +0530
Message-ID: <20260511171255.9668-1-abinashsinghlalotra@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Abinash Singh <abinashlalotra@gmail.com>

The documented frequencyY attribute naming is implementation
specific and differs from common IIO sysfs attribute
conventions.

Replace the non-standard frequencyY attribute documentation with
out_altvoltageX_frequency and document tuning word selection
through out_altvoltageX_frequencysymbol

This makes the documented ABI naming consistent with standard
IIO sysfs attribute conventions and clarifies how tuning word
registers are selected and programmed.


Signed-off-by: Abinash Singh <abinashlalotra@gmail.com>
---

The out_altvoltageX_frequencysymbol and
out_altvoltageX_frequency_scale attributes can be added
through extended channel attributes (.ext_info in channel_spec struct of IIO)

Feedback on this approach would be appreciated, and if
there is some other way in your mind. I would like to 
work on that.

I am also interested in working on the sysfs-bus-iio-dds
documentation and the ad9834 driver. I recently bought an
AD9833 IC for experimentation and testing.

Thanks

 .../iio/Documentation/sysfs-bus-iio-dds       | 31 ++++++++++---------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/iio/Documentation/sysfs-bus-iio-dds b/drivers/staging/iio/Documentation/sysfs-bus-iio-dds
index ee8c509c6733..dfc6ae3964d1 100644
--- a/drivers/staging/iio/Documentation/sysfs-bus-iio-dds
+++ b/drivers/staging/iio/Documentation/sysfs-bus-iio-dds
@@ -1,33 +1,34 @@
 
-What:		/sys/bus/iio/devices/.../out_altvoltageX_frequencyY
+What:		/sys/bus/iio/devices/.../out_altvoltageX_frequency
 KernelVersion:	2.6.37
 Contact:	linux-iio@vger.kernel.org
 Description:
-		Stores frequency into tuning word Y.
-		There will be more than one out_altvoltageX_frequencyY file,
-		which allows for pin controlled FSK Frequency Shift Keying
-		(out_altvoltageX_pincontrol_frequency_en is active) or the user
-		can control the desired active tuning word by writing Y to the
+		Stores frequency into active tuning word register.
+		To select active tuning word register, the user
+		must write the desired index to the
 		out_altvoltageX_frequencysymbol file.
+		For pin controlled FSK (Frequency Shift Keying),
+		tuning word registers must be loaded by selecting
+		each via out_altvoltageX_frequencysymbol before enabling
+		out_altvoltageX_pincontrol_frequency_en.
 
-What:		/sys/bus/iio/devices/.../out_altvoltageX_frequencyY_scale
+What:		/sys/bus/iio/devices/.../out_altvoltageX_frequency_scale
 KernelVersion:	2.6.37
 Contact:	linux-iio@vger.kernel.org
 Description:
-		Scale to be applied to out_altvoltageX_frequencyY in order to
-		obtain the desired value in Hz. If shared across all frequency
-		registers Y is not present. It is also possible X is not present
+		Scale to be applied to out_altvoltageX_frequency in order to
+		obtain the desired value in Hz. It is also possible X is not present
 		if shared across all channels.
 
 What:		/sys/bus/iio/devices/.../out_altvoltageX_frequencysymbol
 KernelVersion:	2.6.37
 Contact:	linux-iio@vger.kernel.org
 Description:
-		Specifies the active output frequency tuning word. The value
-		corresponds to the Y in out_altvoltageX_frequencyY.
-		To exit this mode the user can write
-		out_altvoltageX_pincontrol_frequency_en or
-		out_altvoltageX_out_enable file.
+		Specifies the active output frequency tuning word index.
+		Writing an index here selects which tuning word register
+		is written by out_altvoltageX_frequency. To exit this mode
+		the user can write out_altvoltageX_pincontrol_frequency_en
+		or out_altvoltageX_out_enable file.
 
 What:		/sys/bus/iio/devices/.../out_altvoltageX_phaseY
 KernelVersion:	2.6.37
-- 
2.43.0

