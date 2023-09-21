Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A741FBA27
	for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 14:22:34 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-32008e339adso1006727f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 07:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695306153; x=1695910953; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOWL8UFN0vGXrTIparX6s/KCVRR+pmZ6D/qH1lVsdWQ=;
        b=cH8naB5HoYLjDoSJZSsbeSBL9GoO/UnYIKPYnQdpOna0vrkBZCQpAbXv+j7I+hfR09
         ynXNIrnkBv68J4VemVCWkbhne7snHBzAuFtlv0gUVyy/15tHgudeSC6w27TOYrNEd0DT
         esVeYXiCMntgPuniOFa3vL9hhXnu48iGJ9E8v0aCvTE20MUikfaeEhNpfzSlJulNPopn
         9zLqkP9IpCjI1dZFOpag4UP6uTKJXQps9lTYC5z7NqHJDHNlW5a54o8mQFm5PKHaGsC4
         QEMjI5pYFQCHGpo8f33RMkdmqK7UMSVQMtJgGzTaDUNbfuaV3FNxH1IQbvDQCwqiWd2D
         hXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695306153; x=1695910953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dOWL8UFN0vGXrTIparX6s/KCVRR+pmZ6D/qH1lVsdWQ=;
        b=L6W8eiPXT6At3kRG2VPbXTgYgkD2FNQ54/6kZva5aYn5YTrwQ2lgQnOOZ0m1Nggmmn
         V8sUc5h8yoGSjE9EiwfkxGNYdAmpR3XJL03SgHHa/zKqF2pgCzqr7H6WebPgesnhLIJV
         EI/cFC67HozgNCCFNdox9mMewZko3U7TqaGHhntBn8zYLFikBC61NWZqG7nRXbrcDjUJ
         RM2byftibq5bzYYUCROLqp/jhA2rEtLobZAlr+Efs8a9i1+g2KleloPP8VT/wat8ETo/
         fzlpQlSYVV5LpFnsNaXT6oVVJRVnAOf74xa4xfxmGHLvjWE4/JEaEjP5bxO9MHCBfeM0
         n3DQ==
X-Gm-Message-State: AOJu0YxFsjaQxWuUHDTTpLcDqp/k/XWtAPIjJ9bvW5IKJr9Yvk9QzyM+
	VGqrQuDQ/JjCGla29FqEOY7ygg==
X-Google-Smtp-Source: AGHT+IErr9vfLKcGbuaDz6p0WEc9gtQaWzHZCdYrnWpb8xs+8uWyyRU6Xrb3jaQvYbOOtHHu0seULw==
X-Received: by 2002:a5d:6405:0:b0:319:6ec3:79c7 with SMTP id z5-20020a5d6405000000b003196ec379c7mr5205794wru.36.1695306152763;
        Thu, 21 Sep 2023 07:22:32 -0700 (PDT)
Received: from localhost.localdomain (abordeaux-655-1-129-86.w90-5.abo.wanadoo.fr. [90.5.10.86])
        by smtp.gmail.com with ESMTPSA id n11-20020a5d4c4b000000b0031fbbe347ebsm1901426wrt.22.2023.09.21.07.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 07:22:32 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Axel Haslam <ahaslam@baylibre.com>,
	Philip Molloy <pmolloy@baylibre.com>,
	David Lechner <dlechner@baylibre.com>
Subject: [v2 02/19] staging: iio: Documentation: document IIO resolver AD2S1210 sysfs attributes
Date: Thu, 21 Sep 2023 09:19:29 -0500
Message-Id: <20230921141947.57784-4-dlechner@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230921141947.57784-1-dlechner@baylibre.com>
References: <20230921141947.57784-1-dlechner@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds documentation for the device-specific sysfs attributes of the
iio/resolver/ad2s1210 driver.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 .../sysfs-bus-iio-resolver-ad2s1210           | 109 ++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 drivers/staging/iio/Documentation/sysfs-bus-iio-resolver-ad2s1210

diff --git a/drivers/staging/iio/Documentation/sysfs-bus-iio-resolver-ad2s1210 b/drivers/staging/iio/Documentation/sysfs-bus-iio-resolver-ad2s1210
new file mode 100644
index 000000000000..32890c85168e
--- /dev/null
+++ b/drivers/staging/iio/Documentation/sysfs-bus-iio-resolver-ad2s1210
@@ -0,0 +1,109 @@
+What:		/sys/bus/iio/devices/iio:deviceX/dos_mis_thrd
+KernelVersion:  6.7
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Reading returns the current Degradation of Signal Mismatch
+		Threshold value. Writing sets the value. Valid values are 0 (0V)
+		to 127 (4.826V). To convert the value to volts, multiply by
+		0.038.
+
+What:		/sys/bus/iio/devices/iio:deviceX/dos_ovr_thrd
+KernelVersion:  6.7
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Reading returns the current Degradation of Signal Overrange
+		Threshold value. Writing sets the value. Valid values are 0 (0V)
+		to 127 (4.826V). To convert the value to volts, multiply by
+		0.038.
+
+What:		/sys/bus/iio/devices/iio:deviceX/dos_rst_max_thrd
+KernelVersion:  6.7
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Reading returns the current Degradation of Signal Reset Maximum
+		Threshold value. Writing sets the value. Valid values are 0 (0V)
+		to 127 (4.826V). To convert the value to volts, multiply by
+		0.038.
+
+What:		/sys/bus/iio/devices/iio:deviceX/dos_rst_min_thrd
+KernelVersion:  6.7
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Reading returns the current Degradation of Signal Reset Minimum
+		Threshold value. Writing sets the value. Valid values are 0 (0V)
+		to 127 (4.826V). To convert the value to volts, multiply by
+		0.038.
+
+What:		/sys/bus/iio/devices/iio:deviceX/fault
+KernelVersion:  6.7
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Reading returns a hex value containing the fault bit flags.
+
+		Bit	Description
+		---	-----------
+		D7	Sine/cosine inputs clipped
+		D6	Sine/cosine inputs below LOS threshold
+		D5	Sine/cosine inputs exceed DOS overrange threshold
+		D4	Sine/cosine inputs exceed DOS mismatch threshold
+		D3	Tracking error exceeds LOT threshold
+		D2	Velocity exceeds maximum tracking rate
+		D1	Phase error exceeds phase lock range
+		D0	Configuration parity error
+
+		Writing any value will clear any fault conditions.
+
+What:		/sys/bus/iio/devices/iio:deviceX/excitation_frequency
+KernelVersion:  6.7
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Reading returns the current Excitation Frequency in Hz. Writing
+		sets the Excitation Frequency and performs a software reset on
+		the device to apply the change. Valid values are 2000 (2kHz) to
+		20000 (20kHz).
+
+What:		/sys/bus/iio/devices/iio:deviceX/los_thrd
+KernelVersion:  6.7
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Reading returns the current Loss of Signal Reset Threshold
+		value. Writing sets the value. Valid values are 0 (0V) to
+		127 (4.826V). To convert the value to volts, multiply by 0.038.
+
+What:		/sys/bus/iio/devices/iio:deviceX/lot_high_thrd
+KernelVersion:  6.7
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Reading returns the current Loss of Position Tracking Detection
+		High Threshold value. Writing sets the value. Valid values are
+		0 (0 deg) to 127 (9/18/45 deg). The interpretation of the value
+		depends on the selected resolution. To convert the value to
+		degrees, multiply by 0.35 for 10-bit resolution, multiply by
+		0.14 for 12-bit resolution or multiply by 0.09 for 14 and 16-bit
+		resolution.
+
+What:		/sys/bus/iio/devices/iio:deviceX/lot_low_thrd
+KernelVersion:  6.7
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Reading returns the current Loss of Position Tracking Detection
+		Low Threshold value. Writing sets the value. Valid values are
+		0 (0 deg) to 127 (9/18/45 deg). The interpretation of the value
+		depends on the selected resolution. To convert the value to
+		degrees, multiply by 0.35 for 10-bit resolution, multiply by
+		0.14 for 12-bit resolution or multiply by 0.09 for 14 and 16-bit
+		resolution.
+
+What:		/sys/bus/iio/devices/iio:deviceX/phase_lock_range
+KernelVersion:  6.7
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Reading returns the current Phase lock range in degrees. Writing
+		sets the value in the configuration register.
+
+What:		/sys/bus/iio/devices/iio:deviceX/phase_lock_range_available
+KernelVersion:  6.7
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Reading returns the possible values for the phase_lock_range
+		attribute, namely 44 and 360.
-- 
2.34.1

