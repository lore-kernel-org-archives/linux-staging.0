Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596EB15C0
	for <linux-staging@lists.linux.dev>; Fri,  6 Oct 2023 00:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="FIgjw4jI"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1dcdfeb7e44so1042068fac.0
        for <linux-staging@lists.linux.dev>; Thu, 05 Oct 2023 17:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696553476; x=1697158276; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZI34v4vwW5XM25KikYNf+BGSccyPUhljKdJ83kHWmf8=;
        b=FIgjw4jId0ZYQl+8yi2GDzpSHLAyxcPz8a0eIiLeVO8u7Zj7ctlN/yqFJa/++w39Ma
         jvFU+rkX3HnT/PRsxb0J1P15m1TRicLRNNOY0AFs0wGkQpyukwZVZNU0OdcCB+yz7I7E
         Z2vfB8T/Ow1fyKrFV53sgIRRgAmvkeiyhqwIfIN3CD22+4z7yPk6qpicpdiKv5/afj31
         qp+3r0LrHXX2e+aO6Ck1Zg9xgVViwrlNtXKW7VeNfH2MGGESNLNZIJOkCvnV2eYU6Lfl
         JqScjk0oqpAhn2dKAwy+9yK57QaOabjMSWe+f8TGFJWzcdAd/jzMtO0EtEmmZVLOgCyD
         KToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696553476; x=1697158276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZI34v4vwW5XM25KikYNf+BGSccyPUhljKdJ83kHWmf8=;
        b=B4Vu/fUFrQ7i7vxzhS5Ik9Ee8DQhiH19elbesgxBjPF3VAhrfEuWSDjiMsylewAu4w
         /TmrqTuyA8d+SogdswvV5tN1cxh3yqndz/uqi5xo3wOL2NNNDdMyoAnFbpJ1VKo8Vf6+
         Lp91En2cdlPydUuQfAY3WWwCvY0JIZG66me/nZ2d+balX1aw4bhQU18+GymcAI89+dOx
         kzAT/uQNqwm/gv6Gj3K1vakPjzGsujYM3dZSbjDi7s3TDBnpR40gsIuBaQEO4XHWIzS0
         Q+j2xzBE12EkWvTr7I0yEJbBVrRSnkMDGXrsO/E7De4+dGeYABN7d8uNAO0kvbXishlS
         yL8Q==
X-Gm-Message-State: AOJu0YyEfHW4xHrXQrTYl6nuFAQyxjn3dhG7kb9uUUcwRzP+yndNyT0J
	8iDilPLgNoVjYW1Bir6vkrOvxw==
X-Google-Smtp-Source: AGHT+IEchoMTXOEbw8NFS2gMIPHbq+oGOliYuhmKz8ENK3CaoNOlDvSRLvdogehnLIb+B2nw1m1lEg==
X-Received: by 2002:a05:6870:1490:b0:1d6:56d8:a788 with SMTP id k16-20020a056870149000b001d656d8a788mr7430599oab.40.1696553476450;
        Thu, 05 Oct 2023 17:51:16 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id mo9-20020a056871320900b001dd0ff401edsm545072oac.51.2023.10.05.17.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 17:51:16 -0700 (PDT)
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
Subject: [PATCH v4 15/17] staging: iio: resolver: ad2s1210: add label attribute support
Date: Thu,  5 Oct 2023 19:50:32 -0500
Message-ID: <20231005-ad2s1210-mainline-v4-15-ec00746840fc@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231005-ad2s1210-mainline-v4-0-ec00746840fc@baylibre.com>
References: <20231005-ad2s1210-mainline-v4-0-ec00746840fc@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.3
Content-Transfer-Encoding: 8bit

The ad2s1210 resolver driver has quite a few channels, mostly for
internal signals for event support. This makes it difficult to know
which channel is which. This patch adds a label attribute to the
channels to make it easier to identify them.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v4 changes:
* Adjusted for channel rearrangement in previous patches.

v3 changes: This is a new patch in v3

 drivers/staging/iio/resolver/ad2s1210.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index 51490fea1647..59c8eed26701 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -1158,6 +1158,34 @@ static int ad2s1210_initial(struct ad2s1210_state *st)
 	return ret;
 }
 
+static int ad2s1210_read_label(struct iio_dev *indio_dev,
+			       struct iio_chan_spec const *chan,
+			       char *label)
+{
+	if (chan->type == IIO_ANGL) {
+		if (chan->channel == 0)
+			return sprintf(label, "position\n");
+		if (chan->channel == 1)
+			return sprintf(label, "tracking error\n");
+	}
+	if (chan->type == IIO_ANGL_VEL)
+		return sprintf(label, "velocity\n");
+	if (chan->type == IIO_PHASE)
+		return sprintf(label, "synthetic reference\n");
+	if (chan->type == IIO_ALTVOLTAGE) {
+		if (chan->output)
+			return sprintf(label, "excitation\n");
+		if (chan->channel == 0)
+			return sprintf(label, "monitor signal\n");
+		if (chan->channel == 1)
+			return sprintf(label, "cosine\n");
+		if (chan->channel == 2)
+			return sprintf(label, "sine\n");
+	}
+
+	return -EINVAL;
+}
+
 static int ad2s1210_read_event_value(struct iio_dev *indio_dev,
 				     const struct iio_chan_spec *chan,
 				     enum iio_event_type type,
@@ -1338,6 +1366,7 @@ static const struct iio_info ad2s1210_info = {
 	.read_raw = ad2s1210_read_raw,
 	.read_avail = ad2s1210_read_avail,
 	.write_raw = ad2s1210_write_raw,
+	.read_label = ad2s1210_read_label,
 	.attrs = &ad2s1210_attribute_group,
 	.read_event_value = ad2s1210_read_event_value,
 	.write_event_value = ad2s1210_write_event_value,

-- 
2.42.0

