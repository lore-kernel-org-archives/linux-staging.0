Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20F5658B5
	for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 17:25:57 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-57de6e502fcso2661736eaf.3
        for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 10:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696008357; x=1696613157; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bIleoNt3McOityrbAncOn1e2uXvostp1PJRCN57ck0k=;
        b=b8heWICS85H2SjidDiS/e+AebSvSYOKVA5foPpk6bASCsvvIaNR+OsUZkpWMlpfKHk
         /gBkRhev+qLrqLqOqkd6hUF4PDazUmnzSbYjO0n5sJxT4LHuj5znHUN+rLxj+Xpmdw+1
         oPHW7Yz0xQ0n6jjRAo5I2DwqFIlI9qeLsyZhinS3WVOJT4N5LBAPvenmqm7lKNGpIohr
         dY5S7IZO/2+JD67wvYhBraIprR2PghjyXJrTwyAOs/CCYB8PqhOi4FesYcJBXWZbfcwm
         UlaPcF97OuiSEvuTbc0RDVnU4VfZCmuRRTl2x7f2PEZKdJRAKRPpOKD6QJ7+c+CQ/QG1
         MyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696008357; x=1696613157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bIleoNt3McOityrbAncOn1e2uXvostp1PJRCN57ck0k=;
        b=VILS+N7DpnehMevETydcQzYCo5BFE4r+fFkb+fEF1gykLa1mRdi/HA7sqtEguhq/iz
         RFoc1UQx1xgf2KqczqPWH+fyXLKLhGXIRcPFqK0EHlzg27pGiI5sLJBTP+7ixtCvhu8j
         L4OWbesWZuEB7go17nVW6tu2H956Vfu9c5EuoeNAgHkI6MgjHMvoUE/I/zvzQUp8k057
         bhxXQAUjymC+mqE0DJJUdgLOeKqoL/jLfJKW8U0KNz/K6cOxUcsKpnAIukpSCJ8ON+de
         WOiwNX0ECziuQP3eoGi0+tX/MiGOP0tbsrkjH9E+83n5YKlrW1zC6Zqde/0/cIbF8xwm
         Lygg==
X-Gm-Message-State: AOJu0Yxk9XHwRFscZ/UkaTuRBzBdOvDR+mSc1Entgfc9R1HmHYu08syD
	PAYiMo9flv04MN2YoOx8MMpNNQ==
X-Google-Smtp-Source: AGHT+IHLFf9v4qAbn38RSz6/N2MsDw9a72xTy6kMUQDUcQjaR4b3zXDVJNtTSV4old/0mSNpduMelg==
X-Received: by 2002:a4a:3c07:0:b0:57b:6f5c:c90a with SMTP id d7-20020a4a3c07000000b0057b6f5cc90amr4717947ooa.8.1696008356922;
        Fri, 29 Sep 2023 10:25:56 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id f128-20020a4a5886000000b0057bb326cad4sm2272915oob.33.2023.09.29.10.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 10:25:56 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: David Lechner <david@lechnology.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Axel Haslam <ahaslam@baylibre.com>,
	Philip Molloy <pmolloy@baylibre.com>,
	linux-kernel@vger.kernel.org,
	David Lechner <dlechner@baylibre.com>
Subject: [PATCH v3 11/27] staging: iio: resolver: ad2s1210: add debugfs reg access
Date: Fri, 29 Sep 2023 12:23:16 -0500
Message-ID: <20230929-ad2s1210-mainline-v3-11-fa4364281745@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230929-ad2s1210-mainline-v3-0-fa4364281745@baylibre.com>
References: <20230929-ad2s1210-mainline-v3-0-fa4364281745@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.3
Content-Transfer-Encoding: 8bit

From: David Lechner <david@lechnology.com>

From: David Lechner <dlechner@baylibre.com>

This add an implementation of debugfs_reg_access for the AD2S1210
driver.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v3 changes: None

 drivers/staging/iio/resolver/ad2s1210.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index 0663a51d04ad..31415fbb6384 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -614,9 +614,29 @@ static int ad2s1210_initial(struct ad2s1210_state *st)
 	return ret;
 }
 
+static int ad2s1210_debugfs_reg_access(struct iio_dev *indio_dev,
+				       unsigned int reg, unsigned int writeval,
+				       unsigned int *readval)
+{
+	struct ad2s1210_state *st = iio_priv(indio_dev);
+	int ret;
+
+	mutex_lock(&st->lock);
+
+	if (readval)
+		ret = regmap_read(st->regmap, reg, readval);
+	else
+		ret = regmap_write(st->regmap, reg, writeval);
+
+	mutex_unlock(&st->lock);
+
+	return ret;
+}
+
 static const struct iio_info ad2s1210_info = {
 	.read_raw = ad2s1210_read_raw,
 	.attrs = &ad2s1210_attribute_group,
+	.debugfs_reg_access = &ad2s1210_debugfs_reg_access,
 };
 
 static int ad2s1210_setup_clocks(struct ad2s1210_state *st)

-- 
2.42.0

