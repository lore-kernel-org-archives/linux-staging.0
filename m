Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6E4658B4
	for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 17:26:12 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-57b6a7e0deeso7197775eaf.2
        for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 10:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696008371; x=1696613171; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FmPWGFXlzm/HpDO5LhkisvPrSRbK6I07Ofe/Ps9MCc=;
        b=ciq5BgAGhZMFb0ZO+Mu6m3dCo6e+3j8J+TjUAAaU/0qhw8lEUpE2Ws5gBDaA5VrlLW
         aCEngbeDCfA5AX9utx/rBL6YVYyv03A8lLxvL2Sgvr71RgZtuYNe8mXykVC08gR00/qs
         8c/kSL70frpLKHyJrjuFfj9qedIDSJJtpDmo7oyr3c+Zn/Kr4bkm/rmfi6cVdp+6bh7A
         NnV1qF13Om360yTcY4E3iXHdSSjK4j+nrrnpveGhTQzsstGQ1D/twnli8VbZSeTTvfr2
         IQxo83Kg66q0kAoxUBUX31SrAdkWjVuHyubtK+HUQ73H9zmO75IkV+bx850/N+pfsnkT
         7HdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696008371; x=1696613171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9FmPWGFXlzm/HpDO5LhkisvPrSRbK6I07Ofe/Ps9MCc=;
        b=Lt1Hu+CRtLFnjJPxaElMRdSLiUkaE4pvGVezKrl1U5R9BOQXjqN+AxLwz2MiPAeTdO
         gG56aqEsL9lwyxwOL8fIvttxGmUTklA6dMJn3EX2GQUMch48WMrrwU0/kiAOgqmtac+U
         Ms9D8RB3bWE6ZylK+4HANtD3BlWl3dGeF0+jP2NGbJewtMJVIAZoZwud6/7nKCYK7jGB
         FUUoZ+wHQriPK/nPSQqBTtw/n1GMQjM2S0W8Pl9QG3pgwT4PvOutSvJXnUGEFsUl2ghf
         0bl8pSTbckGVW1vv2biOYCQ9MExGG/NL8Cq0psd2g/u3nTyrXKmWyhDFqDOz+JAeLnAH
         GgDA==
X-Gm-Message-State: AOJu0Yz9fmuVQKjtoEuUQCEEt23FSBjMuWP57GpqFbWrc6iZSa//NfLW
	+/Zm2chluYNzyN3+AlVIBQiT8g==
X-Google-Smtp-Source: AGHT+IGo8C13uUAx61E4DnW+F1vNgvyWsHBigt0nkOjFX5gCz6fiLgXMlerkCV5kZCgq3+GpEGMKnA==
X-Received: by 2002:a4a:ea28:0:b0:57b:eee7:4a40 with SMTP id y8-20020a4aea28000000b0057beee74a40mr5161864ood.7.1696008371561;
        Fri, 29 Sep 2023 10:26:11 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id f128-20020a4a5886000000b0057bb326cad4sm2272915oob.33.2023.09.29.10.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 10:26:11 -0700 (PDT)
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
Subject: [PATCH v3 27/27] staging: iio: resolver: ad2s1210: add label attribute support
Date: Fri, 29 Sep 2023 12:23:32 -0500
Message-ID: <20230929-ad2s1210-mainline-v3-27-fa4364281745@baylibre.com>
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

The ad2s1210 resolver driver has quite a few channels, mostly for
internal signals for event support. This makes it difficult to know
which channel is which. This patch adds a label attribute to the
channels to make it easier to identify them.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v3 changes: This is a new patch in v3

 drivers/staging/iio/resolver/ad2s1210.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index dc3cc3ab855e..a187fa07d315 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -1106,6 +1106,34 @@ static int ad2s1210_initial(struct ad2s1210_state *st)
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
+		if (chan->channel == 1 && chan->channel2 == IIO_MOD_X)
+			return sprintf(label, "cosine\n");
+		if (chan->channel == 1 && chan->channel2 == IIO_MOD_Y)
+			return sprintf(label, "sine\n");
+	}
+
+	return -EINVAL;
+}
+
 static int ad2s1210_read_event_value(struct iio_dev *indio_dev,
 				     const struct iio_chan_spec *chan,
 				     enum iio_event_type type,
@@ -1256,6 +1284,7 @@ static const struct iio_info ad2s1210_info = {
 	.read_raw = ad2s1210_read_raw,
 	.read_avail = ad2s1210_read_avail,
 	.write_raw = ad2s1210_write_raw,
+	.read_label = ad2s1210_read_label,
 	.attrs = &ad2s1210_attribute_group,
 	.read_event_value = ad2s1210_read_event_value,
 	.write_event_value = ad2s1210_write_event_value,

-- 
2.42.0

