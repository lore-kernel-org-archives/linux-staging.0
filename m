Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794319487;
	b=SMvntcMEgSw5B0d9E3548YkG975v+gp/RyZPm1G5+bsP2EMN4fgH2zouokyM/FLhKmu0
	 dGtbF+F79RPhXsSpHOy03s8DCD7zN29j+lH8TrdOKINo/zlXeww9YWk4cwp78Dw7DCAq9
	 Rl6FgjmWdqMPS/1Wkw2S2MSeihdTVURvhvnUNsCDQ3mf4HAsCzRm5xeqsJmhtHnOgMU0W
	 qtUnO1yvhettE6OveDYFA0ffYr49PVJJp+NiHdykpjZJ+aYfNwil4n5KMUxu8ohTwYiMt
	 kRsfREuo4X7LVNRPGyTOb08GsBTIO1v9AT8xqlAEtbj/H97tUAjwKmw3OvL6CDLyeeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794319487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=418qL2keCn/YC9lRyTTJ32argrNbioPNqzsGFZM0jp0=;
	b=S080KHV8FqtI76JlmmQKjoHlUNvkyyasIZYY25tlm/AqAP7X1xhRQRr1s9FSDyv0bsHl
	 UrncH6ou05sKWBOJvTSdP4fUbmK/dzQOEOpMoe9MGoTES/uSOTP8v9GtCd0yjgmnTmLDc
	 QNT//2zaKXFDjFwEb56MFH3O1pNjUkSZTlFY0T87EUhCo4yY2E6qnsuYe5muj3qxMn6ht
	 X88AhkBg83GX8dz2/NBuHrReIQ+XZROexDgAb0UpP2sS109FR4B4A1CJX49V1PpfHbkMa
	 Sc/sk9naAGWilyFQMlZp5Tso069u0xagooYhY9jLxj6ov7HJv/Vv9bsp74RM1jvOMFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eNI3XW+q;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EACF60A2600
	for <linux-staging@lists.linux.dev>; Tue, 10 Nov 2026 14:04:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EACF60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eNI3XW+q
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso1159783a91.3
        for <linux-staging@lists.linux.dev>; Tue, 10 Nov 2026 06:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794319486; x=1794924286; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=418qL2keCn/YC9lRyTTJ32argrNbioPNqzsGFZM0jp0=;
        b=eNI3XW+qS2+Rv+45MF1hnRbr4/fOljneIoOPIQ3tWtcOxHGogYo+3OSMXIH2DGldtC
         TKRcWXnrH0k2LnrPgtXj4as0JIe8t2wwvA+8uPO/DtNTJUuuLRdeT8uTVqXOLD0LgyZQ
         it2KJcpmliu+Doa00I3N1bbqb1/yRx2CzS2JZ9GigkNZ0sQjpqbQHcNK8rVySwkB1rpI
         jWnBTwyYySwTspAYyDVtpqngAU8wiyu4A2LJ6RpOvqGrpHAUa+K/05ZX3gA6MSZf9FQr
         g6EiEYY21aHyBWGN65JKdXXXxdblcII68cS5fpibP5NYKIbhsP5CQRD11qVlS7ux7EfU
         sUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794319486; x=1794924286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=418qL2keCn/YC9lRyTTJ32argrNbioPNqzsGFZM0jp0=;
        b=jaJbTSJRcuqv3ksb6goAmjwYJEwecxFdt40ve6a3FrzMZwOAaci5KasCQB+vjlzT7L
         DFvMdXTaQutHWGOLL3k33n11zfmIJheqt7XoPVl1mw4NJXbtTZofb8nasYGEWlfKwlVX
         Vg/YgQry45AlTTXYaiD8Z1cV8OG9B14PLsW2Avy2mlcU92h91SORhFXZ37qKuDB/ti4W
         eGJTlYKnXHEJtGmKAwhWp4m9ctvVEtFEnK5JTdRBW88v7jAYvIGPI+RHZcCET6aKkffu
         wj+jllTha0LVOA1OMRhFVLaArtZ+tWuHjiOv90DI7sm4/MJiUMQhB3ET6vjo2kFEi7SY
         8oeg==
X-Forwarded-Encrypted: i=1; AL+hErFff6rhdaXxdk2iCV3kSHT1eofA1mlPkkcoA8/XedO8FngusCwKQTpPyuM+jpoyaEaiyiAWXV7be/j2LErr@lists.linux.dev
X-Gm-Message-State: APuU4Z9VCe+omRpuTW4lWtERjGm644rJf6iNysNzZRWic8aqIRmrHnV1
	RlzvORepC519fP033W0oFuEeFQSfuCJfgpiql25a9y8MZ3wMryUesHPb
X-Gm-Gg: AYBFou28sdEhqULRfXMuHq+fCBLbNGTSBbqMT6KiyycUnbQw1IYjHOzIB13FWzuRt+8
	JH/j+h9gqVj2pa6im5gh3Jq8/SntpJC+rjq0oVPfLtCcbR6i+koKpbyU3zHxAJrvbpAdPHSRcd+
	II8uQBbocPFPB35MVuOcGIICjzwGzWd96+aRNNKv0YUiY468tPUfTX0jzpZeQFe1atqCxu86Oo1
	7082Di6WCWtaQ+sXpMLZqo7VW4eICHxUG9vTukzwjgaQoWCbgC+5DyoTt6y9FOabNVTcl2PQahi
	dwg/8j7/IsSxRJ17kglfl/A+KbBOGAvXLtHX5t9RA20km/exQZgxawh8rT4+7stO3nzkB4beNOJ
	sw7xD9HLiy33MEmubOqSJw2dY6rpaDwGWm3NfLLrquakAmfc30mqOGe7NilTfAxlimGJxhO0C5G
	9Vqq6EGbZfnvrqBJMvE1Z2Z7rIP5egPadxyoMrcpzDAdyKbw+hK3xfbnghQ4e/x6QiFqfEjZp1F
	puD9eGqBGCEkT8d3UxrUImck2XYRWzDwzg1ag7Gu3kvNOUfsnvRuMMh7otValevlBF+jLx5J3qk
	rMlC4JxgLpQzlIxTApwBoUzdjzIsee1oJ4IQ6gellSzxs36y7UqD4QJggF1Q
X-Received: by 2002:a17:90b:1a86:b0:3b1:2810:dfdb with SMTP id 98e67ed59e1d1-3b166d1edf5mr2895888a91.48.1794319486272;
        Tue, 10 Nov 2026 06:04:46 -0800 (PST)
Received: from LAPTOP-6IS184GT ([104.28.251.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16903edfesm1875444a91.2.2026.11.10.06.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:04:44 -0800 (PST)
From: Nick <nick21042013@gmail.com>
To: gregkh@linuxfoundation.org,
	jic23@kernel.org
Cc: lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nick <nick21042013@gmail.com>
Subject: 
Date: Tue, 10 Nov 2026 20:33:54 +0630
Message-ID: <20261110140354.2047-1-nick21042013@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
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

From: Nick <nick21042013@gmail.com>

Date: Tue, 10 Nov 2026 19:57:26 +0630

Subject: [PATCH] staging: iio: adt7316: fix camelCase violations



Rename Vref and AIN to lowercase characters.

This fixes the style violations and brings

the driver into line with the kernel style

guidelines.



Signed-off-by: Nick <nick21042013@gmail.com>

---

 drivers/staging/iio/addac/adt7316.c | 12 ++++++------

 1 file changed, 6 insertions(+), 6 deletions(-)



diff --git a/drivers/staging/iio/addac/adt7316.c b/drivers/staging/iio/addac/adt7316.c

index 20f6052cc..a71502cf0 100644

--- a/drivers/staging/iio/addac/adt7316.c

+++ b/drivers/staging/iio/addac/adt7316.c

@@ -663,7 +663,7 @@ static IIO_DEVICE_ATTR(da_high_resolution, 0644,

 		adt7316_store_da_high_resolution,

 		0);

 

-static ssize_t adt7316_show_AIN_internal_Vref(struct device *dev,

+static ssize_t adt7316_show_ain_internal_vref(struct device *dev,

 					      struct device_attribute *attr,

 					      char *buf)

 {

@@ -677,7 +677,7 @@ static ssize_t adt7316_show_AIN_internal_Vref(struct device *dev,

 		!!(chip->config3 & ADT7516_AIN_IN_VREF));

 }

 

-static ssize_t adt7316_store_AIN_internal_Vref(struct device *dev,

+static ssize_t adt7316_store_ain_internal_vref(struct device *dev,

 					       struct device_attribute *attr,

 					       const char *buf,

 					       size_t len)

@@ -704,9 +704,9 @@ static ssize_t adt7316_store_AIN_internal_Vref(struct device *dev,

 	return len;

 }

 

-static IIO_DEVICE_ATTR(AIN_internal_Vref, 0644,

-		adt7316_show_AIN_internal_Vref,

-		adt7316_store_AIN_internal_Vref,

+static IIO_DEVICE_ATTR(ain_internal_vref, 0644,

+		adt7316_show_ain_internal_vref,

+		adt7316_store_ain_internal_vref,

 		0);

 

 static ssize_t adt7316_show_enable_prop_DACA(struct device *dev,

@@ -1684,7 +1684,7 @@ static struct attribute *adt7516_attributes[] = {

 	&iio_dev_attr_enable_smbus_timeout.dev_attr.attr,

 	&iio_dev_attr_powerdown.dev_attr.attr,

 	&iio_dev_attr_fast_ad_clock.dev_attr.attr,

-	&iio_dev_attr_AIN_internal_Vref.dev_attr.attr,

+	&iio_dev_attr_ain_internal_vref.dev_attr.attr,

 	&iio_dev_attr_da_high_resolution.dev_attr.attr,

 	&iio_dev_attr_enable_proportion_DACA.dev_attr.attr,

 	&iio_dev_attr_enable_proportion_DACB.dev_attr.attr,

-- 

2.52.0.windows.1

