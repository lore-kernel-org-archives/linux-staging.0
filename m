Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208AA15CB
	for <linux-staging@lists.linux.dev>; Fri,  6 Oct 2023 00:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RGm00A8z"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1e5602c12e5so800866fac.3
        for <linux-staging@lists.linux.dev>; Thu, 05 Oct 2023 17:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696553474; x=1697158274; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7GrKPt25v0F5qGW1MO1rwyIqOaGtfzlSF8OgaxvhkIk=;
        b=RGm00A8zzT0BI8o0Jk/DrNt7lTy2VCVeG7smOlDT9MYgXm06KHIqRkee8oi0PFKIj2
         mfaOduy1FPan4UI6M0yGb5mVwkhbr0kHkdaP5+maVa4qGMgP/FT0wOb5byMQkvc1tfQ+
         57LU7UGOuOmWXPLDNLLPBB/F3K7dbFC0UBRkih5DUHhxXz5HE31GAxMOP1l2YLKDV/4Q
         Gvk7/AdCEtTF9Vl+1H4zcptHgGNt0I9QlNZEJeoS9XQoj2WldZmXOMXMxQDmUCuspFuA
         mypbDD+gFrzra6vWZWDx117EYc1ZXJ2xGbE3ImVT4o9Ng7L96mCCvEmbNuhUY3+RwmHT
         s6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696553474; x=1697158274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7GrKPt25v0F5qGW1MO1rwyIqOaGtfzlSF8OgaxvhkIk=;
        b=Mw1pS7Jh0WAPQsNGqUsdlB8I4hwJrMjhDJMj4wtJjEOPmIMiF5HJHgFjuNplu687s4
         Nned9aAUSI5hVMaxRi/5UVsJ+tb5zSrVI/SVa6rplHfy94RmekZ7zwMFovWX+rrRW1el
         iRVbNTimUr4AcX0j6RMOm3TpM7LGAFXeSFN3c8yCKgXgWCkw+lzIr4wf3DA4v4ZpnNgR
         ebrmU3zcuOi+eOTihXVGEXms9GmrLLXU8Xm628zgqt8UOb69YlYHStY98+v/JB2fKYkD
         u0leNRtlI8EIYgrAwyxbars2Ov4pkLj3QwGVhYJIRT/8Aqr6Inmss0cjePYhnSjNz9Qz
         qlaQ==
X-Gm-Message-State: AOJu0YzRpMGr+OKL5viBfwzcA7qRJ8DQNDs/3OikXcVFDo0dPkdb+twe
	RPaiPZ2/TidN25rJGdRcBMH2Qg==
X-Google-Smtp-Source: AGHT+IGyRfxDTD02W+NbTYBrLlyMzhCYrXHFjw0o8iIP3moML03a5BAuKjg5nbPWICu7hYMW6ckgQg==
X-Received: by 2002:a05:6870:40d0:b0:1d6:96f9:66fa with SMTP id l16-20020a05687040d000b001d696f966famr7940966oal.54.1696553474233;
        Thu, 05 Oct 2023 17:51:14 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id mo9-20020a056871320900b001dd0ff401edsm545072oac.51.2023.10.05.17.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 17:51:13 -0700 (PDT)
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
Subject: [PATCH v4 12/17] iio: event: add optional event label support
Date: Thu,  5 Oct 2023 19:50:29 -0500
Message-ID: <20231005-ad2s1210-mainline-v4-12-ec00746840fc@baylibre.com>
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

This adds a new optional field to struct iio_info to allow drivers to
specify a label for the event. This is useful for cases where there are
many events or the event attribute name is not descriptive enough or
where an event doesn't have any other attributes.

The implementation is based on the existing label support for channels.
So either all events of a device have a label attribute or none do.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v4 changes: New patch in v4.

 drivers/iio/industrialio-event.c | 55 ++++++++++++++++++++++++++++++++++++++++
 include/linux/iio/iio.h          |  8 ++++++
 2 files changed, 63 insertions(+)

diff --git a/drivers/iio/industrialio-event.c b/drivers/iio/industrialio-event.c
index 19f7a91157ee..910c1f14abd5 100644
--- a/drivers/iio/industrialio-event.c
+++ b/drivers/iio/industrialio-event.c
@@ -355,6 +355,21 @@ static ssize_t iio_ev_value_store(struct device *dev,
 	return len;
 }
 
+static ssize_t iio_ev_label_show(struct device *dev,
+				 struct device_attribute *attr,
+				 char *buf)
+{
+	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
+	struct iio_dev_attr *this_attr = to_iio_dev_attr(attr);
+
+	if (indio_dev->info->read_event_label)
+		return indio_dev->info->read_event_label(indio_dev,
+				 this_attr->c, iio_ev_attr_type(this_attr),
+				 iio_ev_attr_dir(this_attr), buf);
+
+	return -EINVAL;
+}
+
 static int iio_device_add_event(struct iio_dev *indio_dev,
 	const struct iio_chan_spec *chan, unsigned int spec_index,
 	enum iio_event_type type, enum iio_event_direction dir,
@@ -411,6 +426,41 @@ static int iio_device_add_event(struct iio_dev *indio_dev,
 	return attrcount;
 }
 
+static int iio_device_add_event_label(struct iio_dev *indio_dev,
+				      const struct iio_chan_spec *chan,
+				      unsigned int spec_index,
+				      enum iio_event_type type,
+				      enum iio_event_direction dir)
+{
+	struct iio_dev_opaque *iio_dev_opaque = to_iio_dev_opaque(indio_dev);
+	char *postfix;
+	int ret;
+
+	if (!indio_dev->info->read_event_label)
+		return 0;
+
+	if (dir != IIO_EV_DIR_NONE)
+		postfix = kasprintf(GFP_KERNEL, "%s_%s_label",
+				iio_ev_type_text[type],
+				iio_ev_dir_text[dir]);
+	else
+		postfix = kasprintf(GFP_KERNEL, "%s_label",
+				iio_ev_type_text[type]);
+	if (postfix == NULL)
+		return -ENOMEM;
+
+	ret = __iio_add_chan_devattr(postfix, chan, &iio_ev_label_show, NULL,
+				spec_index, IIO_SEPARATE, &indio_dev->dev, NULL,
+				&iio_dev_opaque->event_interface->dev_attr_list);
+
+	kfree(postfix);
+
+	if (ret < 0)
+		return ret;
+
+	return 1;
+}
+
 static int iio_device_add_event_sysfs(struct iio_dev *indio_dev,
 	struct iio_chan_spec const *chan)
 {
@@ -448,6 +498,11 @@ static int iio_device_add_event_sysfs(struct iio_dev *indio_dev,
 		if (ret < 0)
 			return ret;
 		attrcount += ret;
+
+		ret = iio_device_add_event_label(indio_dev, chan, i, type, dir);
+		if (ret < 0)
+			return ret;
+		attrcount += ret;
 	}
 	ret = attrcount;
 	return ret;
diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index 7bfa1b9bc8a2..d0ce3b71106a 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -427,6 +427,8 @@ struct iio_trigger; /* forward declaration */
  * @write_event_config:	set if the event is enabled.
  * @read_event_value:	read a configuration value associated with the event.
  * @write_event_value:	write a configuration value for the event.
+ * @read_event_label:	function to request label name for a specified label,
+ *			for better event identification.
  * @validate_trigger:	function to validate the trigger when the
  *			current trigger gets changed.
  * @update_scan_mode:	function to configure device and scan buffer when
@@ -511,6 +513,12 @@ struct iio_info {
 				 enum iio_event_direction dir,
 				 enum iio_event_info info, int val, int val2);
 
+	int (*read_event_label)(struct iio_dev *indio_dev,
+				struct iio_chan_spec const *chan,
+				enum iio_event_type type,
+				enum iio_event_direction dir,
+				char *label);
+
 	int (*validate_trigger)(struct iio_dev *indio_dev,
 				struct iio_trigger *trig);
 	int (*update_scan_mode)(struct iio_dev *indio_dev,

-- 
2.42.0

