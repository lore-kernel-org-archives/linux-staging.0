Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48E12040A4
	for <linux-staging@lists.linux.dev>; Tue,  1 Apr 2025 14:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743517082; cv=none; b=BW+I2hT0qq4JWxrhrRbuRaxJlgo6LMvj3kguqMdydJlsMaBFWndYh8n2a06M+PBx/3KTotCXhKOkBpAsNyprAPyd7zcvOVNO23bD5MhX4iGnAKaG2VE/SmpcmdfwZ9yufIyXQZ+5Kv6ALMXaQyzXxWPts5tVy10IjcQzXQ5Wvzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743517082; c=relaxed/simple;
	bh=qBYjcouQW6HReKbjdwqHeD5kVbmPx9ci9r+cFmpKKBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R273GZYlJRFlo/xEio6qiKBMWTuLQ5g7SKLs46Aas0Z3cYPG6hRIkdDCt0EE3Ztd4eqr72vJe/yTlqwRaV7PsK31zp+HryvRRP+3NrfQGt5KHHlbBJcn2JaCB+29fC91c0W/peFFXIbImvcThRaChFpK4pHjflYv68gsng7FJaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ew2vkEWu; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ew2vkEWu"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-549b159c84cso3979715e87.3
        for <linux-staging@lists.linux.dev>; Tue, 01 Apr 2025 07:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743517079; x=1744121879; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=11E24h0kkMUDJZI1H/PMbxoLXdKMo2wCD3aU6/q3qUU=;
        b=ew2vkEWupmiYRktU51dNzLaXjoLA86j0sEhocTa2n8fKJfB/oq9lwRNVD9Dc/ym3CH
         jiEa0qVGwKTQMEruE3DOlBUo9Juxun6uz+tEM25u/UwIUfMchP+uBDGD61MbVKU/UKK4
         O5vT4voG1TYuRHz1ZMGrCo0/ofavHuvhughNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743517079; x=1744121879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=11E24h0kkMUDJZI1H/PMbxoLXdKMo2wCD3aU6/q3qUU=;
        b=t5+551VChgrpDicvRzK0jz/iYX99q99dSFgNKU33JzuVsDw1PZ3qU8qMLp5kS0zVuW
         N9tLtU62NoOt6ocpDmNMIrZKiTP+RV8k2gk8w9bV5CoAn7wdPRKde6kXRDlq0hJoeDkI
         CKy5qyPf9368Scy9WtGn3om+1Ebdr6ONduyhgF0z6q+y3ag1zA6/H912WSD6QzHPJRjd
         2NtVIKKrDVtUcH7azrFKg7ub+UqgjRIGGeGjdbzAte/WuwPLfqGPVS3iy0fRSTR4bVy4
         44ZFtl8BXg/toF0jrfAwDuJQNYazWnugWUaSL7ClSHcj/y9+3gmEjgAnoESUoW9UqXCG
         /kUg==
X-Forwarded-Encrypted: i=1; AJvYcCWAKKTOJrMZ5w3Eq9KecMU76np0elTLc0YRxtW+LwrYLbQ0RFcSMhgZTKed1P1XO4SUNB3n2ERNyvw4nAme@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0jAihtNdHpHkqvX7nskuzhD1fBZISsBjY0kvN0W6mCtYyAUTa
	yUwjRlyYxC6G4SCqp/k/TkNsY5I8Rgz+Y9tvND5FvKN/2f9SnCGthyroJKGW5w==
X-Gm-Gg: ASbGnctW+O3QHWRzRhOnyugpe4ZD12sNH9QwZQzgOePcKWzn5kFQgpJ6slDk+KO0X6d
	Qd7IIOP+yPUfujyE1gATUtv9i6pAfISNogaqfEZhLY2965dRcs07jMiLOVVOuGelqcZjkBuQxI4
	vMHgSSlScOm0wuSLd9qVXgkzD1wEpYinaX7ruVYAR7GJGbbflEQKnxT2vxXGgWYVus4d+Hi57R0
	IMJwZBDUdMGQtLw7UXeWQTQ0fi9VXD+5MalidcDC7E6kpA9M5MHxg/86lU9LoHrkNt9rhNpvMPe
	WaUGZcFML6dC9SvfBo2lYN5UNEc+qy4KerR9RoociSZENaUzBQkKUqBjrVRJnMKFioH1egy6XVq
	teT+SjrK7WsvIaEkcAjc/SVvf
X-Google-Smtp-Source: AGHT+IHN6U3rH8+fca2aINvuxvaQMLkM1cf4WYnPgGffYBfOrlVLilx3ccY/7R2tGC7KC/dIyogKJA==
X-Received: by 2002:a05:6512:108d:b0:545:2b68:936e with SMTP id 2adb3069b0e04-54b10eca297mr3363397e87.25.1743517078964;
        Tue, 01 Apr 2025 07:17:58 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094c19a3sm1377789e87.80.2025.04.01.07.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 07:17:58 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 01 Apr 2025 14:17:55 +0000
Subject: [PATCH v2 2/2] media: cec: extron-da-hd-4k-plus: Fix
 Wformat-truncation
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-v614-v2-2-53024c4fcdc7@chromium.org>
References: <20250401-v614-v2-0-53024c4fcdc7@chromium.org>
In-Reply-To: <20250401-v614-v2-0-53024c4fcdc7@chromium.org>
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

From: Hans Verkuil <hverkuil@xs4all.nl>

Fix gcc8 warning:

drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1014:44: warning: 'DCEC' directive output may be truncated writing 4 bytes into a region of size between 0 and 53 [-Wformat-truncation=]

Resizing the 'buf' and 'cmd' arrays fixed the warning.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
index cfbfc4c1b2e67fec9434aa6852ab465ad8c11225..41d019b01ec09d1d3e72c89155042888b7948463 100644
--- a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
+++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
@@ -1002,8 +1002,8 @@ static int extron_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 				    u32 signal_free_time, struct cec_msg *msg)
 {
 	struct extron_port *port = cec_get_drvdata(adap);
-	char buf[CEC_MAX_MSG_SIZE * 3 + 1];
-	char cmd[CEC_MAX_MSG_SIZE * 3 + 13];
+	char buf[(CEC_MAX_MSG_SIZE - 1) * 3 + 1];
+	char cmd[sizeof(buf) + 14];
 	unsigned int i;
 
 	if (port->disconnected)

-- 
2.49.0.472.ge94155a9ec-goog

