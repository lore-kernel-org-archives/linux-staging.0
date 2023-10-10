Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A480225D0
	for <linux-staging@lists.linux.dev>; Tue, 10 Oct 2023 21:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dp/msnSv"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6c49f781855so4157077a34.3
        for <linux-staging@lists.linux.dev>; Tue, 10 Oct 2023 14:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696972375; x=1697577175; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5DYF1hS/5DymrCK+wzJy8sJOlUG28zHWF8r/ohf2D3c=;
        b=dp/msnSv0E/y3KjE/4eNcYNk74CXztTRB2Oj4ZyOe2O8n9vIG9QP50kVrtRPjIS5qL
         FtuUpCzkYFubAbTWeSClp5F+o5NE+sQ5JwS2T74EF7MfprFFPOjObq+0TXRHTscJ1Kxn
         IbwlQNUc87DQcJH+ja/eaBhQ4VHMaa488Tn5sVac5C/5Nmu9wbTYLSAZGGW2FT/F/5KP
         KKuispyjZy+IlZ2O1dvqY7bdUbRqaxjeLCAx3EgD4Fs7kDbfEzKsaL9YcigVFJ/Umck+
         HmEbpOqsKSxlBSHPcBnK8XdP7eWU96Zlk+GsXUsDioJpcUKJLqkJebDfD/URDk7DZw3X
         mtKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696972375; x=1697577175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5DYF1hS/5DymrCK+wzJy8sJOlUG28zHWF8r/ohf2D3c=;
        b=E07x4JIsYnC/57AMpNiIyFjxZbIu120+72QtYsFZoCwBGHKU2jCFCci20ClCaatmd4
         3emRPYClhJaRydE4hKfjKT/42DKHdhBCI9QmdPY0nM2maKH2CJju+bIQTFFSVkrvCULr
         TYCVtqUV16dQHSmtitdLKcv6RJ2yhQfCwDXBkhCQy5X1Odo1mZ++XbKNskJfGwRjRfLz
         ZKBgIQv65swd3CdhvBjW335j7fRJh9aqaaAa74795PKQpE95ZuPmmteLtZ6n8n+uSa7S
         ORySXTIzLTyVyJ9fpCQA6SSx9s81NALrh95LnmHLOM6x+jT34SdGOvPCjpQSxeVLGwi7
         LAmw==
X-Gm-Message-State: AOJu0Ywhct6ZwirGom3769KPl9GMcj+rTLV6cEQtAVboNtkP8asWSM1j
	FxQI7jkY3bJ2WmL8fJjm8deJ2A==
X-Google-Smtp-Source: AGHT+IH/gAGxyJIE23ycqiVPoJK2HFCeDd+zgQkTpKMR2q0Gj2vVF5euMIUZKlQ9IEciY75efo8P6w==
X-Received: by 2002:a05:6870:2198:b0:1c1:e6da:f88d with SMTP id l24-20020a056870219800b001c1e6daf88dmr22531136oae.56.1696972375541;
        Tue, 10 Oct 2023 14:12:55 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id ed46-20020a056870b7ae00b001e98b1544fesm52494oab.9.2023.10.10.14.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 14:12:55 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: David Lechner <dlechner@baylibre.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Axel Haslam <ahaslam@baylibre.com>,
	Philip Molloy <pmolloy@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/4] staging: iio: resolver: ad2s1210: clear faults after soft reset
Date: Tue, 10 Oct 2023 16:12:34 -0500
Message-ID: <20231010-ad2s1210-mainline-v5-2-35a0f6ffa04a@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231010-ad2s1210-mainline-v5-0-35a0f6ffa04a@baylibre.com>
References: <20231010-ad2s1210-mainline-v5-0-35a0f6ffa04a@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.3
Content-Transfer-Encoding: 8bit

When a software reset is performed on the AD2S1210 to make the selected
excitation frequency take effect, it always triggers faults on the
input signals because the output signal is interrupted momentarily.
So we need to clear the faults after the software reset to avoid
triggering fault events the next time a sample is read.

The datasheet specifies a time t[track] in Table 27 that specifies the
settle time in milliseconds after a reset depending on the selected
resolution. This is used in the driver to add an appropriate delay.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v5 changes: New patch in v5.

 drivers/staging/iio/resolver/ad2s1210.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index 59c273a4b6a9..cf4018434447 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -314,6 +314,9 @@ static void ad2s1210_toggle_sample_line(struct ad2s1210_state *st)
 static int ad2s1210_reinit_excitation_frequency(struct ad2s1210_state *st,
 						u16 fexcit)
 {
+	/* Map resolution to settle time in milliseconds. */
+	static const int track_time_ms[] = { 10, 20, 25, 60 };
+	unsigned int ignored;
 	int ret;
 	u8 fcw;
 
@@ -329,7 +332,27 @@ static int ad2s1210_reinit_excitation_frequency(struct ad2s1210_state *st,
 	 * Software reset reinitializes the excitation frequency output.
 	 * It does not reset any of the configuration registers.
 	 */
-	return regmap_write(st->regmap, AD2S1210_REG_SOFT_RESET, 0);
+	ret = regmap_write(st->regmap, AD2S1210_REG_SOFT_RESET, 0);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * Soft reset always triggers some faults due the change in the output
+	 * signal so clear the faults too. We need to delay for some time
+	 * (what datasheet calls t[track]) to allow things to settle before
+	 * clearing the faults.
+	 */
+	msleep(track_time_ms[st->resolution] * 8192000 / st->clkin_hz);
+
+	/* Reading the fault register clears the faults. */
+	ret = regmap_read(st->regmap, AD2S1210_REG_FAULT, &ignored);
+	if (ret < 0)
+		return ret;
+
+	/* Have to toggle sample line to get fault output pins to reset. */
+	ad2s1210_toggle_sample_line(st);
+
+	return 0;
 }
 
 static void ad2s1210_push_events(struct iio_dev *indio_dev,

-- 
2.42.0

