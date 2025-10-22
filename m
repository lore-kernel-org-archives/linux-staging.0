Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500C12F6921
	for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 07:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761118088; cv=none; b=sYTqYuHz6dIy9uuqLFK8YdjMKNGU7VL0BgcQSjbgJGjAmhh9MFVA2nKdn7LxDKh0C1gTQErY72l/6YEOIP15wAThf14AE7ERaAnNa4+a2JWXqJvvq0vl4T5M9sUYB+kJ0WSN2WGhUPpaPzlOBieWF95u+jjNqJZp6tLFbD2YOuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761118088; c=relaxed/simple;
	bh=WNyfnE70judBVS87NToHhBjaPBAnu/cg9W5gM0SBY7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Hao5ZLwypBZwYx0TZHfU0uWeLcFwZ+XqJtj5KyfEBrkDu8Ll/X6Pa1aIcSnuPJv8YkS9WcQLMLZVw7iKz5veuCMUVd1oCDvGzvKs4uPaSdqiX0CM1A5Z/5s69X1ujz2Zsd0s+Bn2hxaT9DiYgSrYyD8V+uY6tA83zdmmfmPv6Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=Opd5+ll3; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="Opd5+ll3"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-33ba37b3ff7so757209a91.1
        for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 00:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1761118086; x=1761722886; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vO9KHRnLBvKhkpXd/9jn5kuuFi+mv6wMYt7ZZXt91UI=;
        b=Opd5+ll3aBvTFnigWBw/12xOlSD0dirh7SX0TllIAF/LJbTWboZrKfSsgjdYvooNnz
         KhR1w4WTgmwzg7NQhI6+AMeZ5UctZbmGWSDwFIbY/J0zpvZmbH17mL+nbWA6GapJvGf4
         7nYhE2eiP5IuIUtLJys4AaFRYzlBhBS6B/FYpfblQPA816CluMswIo1l2R+HrIm9TxDU
         xGq55BGlqkDIa95PTP9+X6ASHxqsWbIjowae4Xm1dqp80tl/mpRFvAdFG5WAFdzQ0lXV
         5M000BNdRvQvLe3nFvmQ6MqbbKctoPFGdL+5W5cUuFNLIvT6OAXwQMEi4bmvrcOk8ino
         oMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761118086; x=1761722886;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vO9KHRnLBvKhkpXd/9jn5kuuFi+mv6wMYt7ZZXt91UI=;
        b=M3mS1dECo7Nyq9TZkGVZOTa7b7fhE8nM2jtmem8n+AqckcjSYHgxzgRc868hR3kUxB
         oFJHOZ3Cvr4U7M5PP3TWA/dBsKhtHZp1K88rZvuXb87Btvz9WoR+gG7AeOzKp5XDsJ0A
         eydAO9QKn9SpHARfL8LJez2UkxfuzlbWxufTvzdsGKvCSozhMCtL+1O1AFn/0TIsIbMY
         hZYQ1UM0aC2+K12bhlnlZR0B3dvjHdF4igBNiJCrCUdi2yb7W8sWpE9iI7bnDCBH6xNb
         0DYSv7KDksT18H2U1YwcvhRIP+n6NZd0I30i6D6QdL0RXPwiCd3+JynE66TlBQN5xQMG
         CBjg==
X-Forwarded-Encrypted: i=1; AJvYcCX2PMbaz4X3KiCMcX28D194GbIjkJ5mi8assAmHgu+DdPJ0xz702wuw3aX60d73XrhE9w0hFSKHHf9KmH/z@lists.linux.dev
X-Gm-Message-State: AOJu0YzS8BNHysnbqef+MfY7lwl/xjHMhkL8rCUFriZ5DJYEQG1s00jZ
	fawft7Ihi61eM05QP/hKRxTNKpz4Oh5EEPxWCyIPlMJR4WmH82/Jfq/oW5g7CCqK+Q==
X-Gm-Gg: ASbGncviv3IAeHZvaBqFPOOyTG1rmKdhjxKirrk9MkPub6lQKyBvIBFmk6NKoejKtX4
	/gLQS4FQb4sj3HqKgqkfAKBAUCbZUbdkQrbr7ULJvYFG+cTbyupOutq8Sp2vI/1DUHqMHe4omam
	dHQDzEwPvLwMoSZqxMTml1cvv9CcrYok87ZiyMDgYMVeXu8VKo96w+NPwPtHqnnM35M09K9iTMS
	tNejyN8JPUfkODLlBfGG9Nint2I1ZyS5YpsOd8C9Z97fbkvSL6NQ54rIDOKKN4CnYii5tECgpCJ
	wI6W1bRgCjYufIpHU54JP/Q59qjMgKY9PDjTXJR27N3SFnI1ykaHv6c0Mai8M/86nFnC0JYbfR+
	ndzSS/13QZY/2iV9PCK6viYUMHN9on8ks/V4JHkXEJT5mD7B6fn6bjS7+EL1hpH3BLPnrvF2wvY
	YZVUZbAW4jM5U=
X-Google-Smtp-Source: AGHT+IHFgcS37MSkxyU6h/6VU4QujwEp9l9tioYqbxhwqXHsDJs1YDVW+aLoiaG4Ar2Az1m+PVPn7Q==
X-Received: by 2002:a17:90b:2dc8:b0:32b:94a2:b0c4 with SMTP id 98e67ed59e1d1-33e9120647emr654212a91.16.1761118085605;
        Wed, 22 Oct 2025 00:28:05 -0700 (PDT)
Received: from [192.168.1.10] ([2401:4900:8898:a21f:edff:5244:379d:6d28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e224ca168sm1639039a91.22.2025.10.22.00.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 00:28:04 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Wed, 22 Oct 2025 12:57:57 +0530
Subject: [PATCH] staging: greybus: fw-download: Fix find firmware req
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-gb-fw-v1-1-183b18500cd5@beagleboard.org>
X-B4-Tracking: v=1; b=H4sIAHyH+GgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAyMj3fQk3bRy3UTTlCQzCzNLoyTTFCWg2oKi1LTMCrA50bG1tQAuTV4
 NVwAAAA==
X-Change-ID: 20251022-gb-fw-a5db68692b5d
To: Jason Kridner <jkridner@beagleboard.org>, 
 Deepak Khatri <lorforlinux@beagleboard.org>, 
 Robert Nelson <robertcnelson@beagleboard.org>, Dhruva Gole <d-gole@ti.com>, 
 Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, 
 Alex Elder <elder@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5140; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=WNyfnE70judBVS87NToHhBjaPBAnu/cg9W5gM0SBY7Y=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBo+IeAIjBqRHYyxWZfRp+nYQxBKIADZP2+vUCUQ
 J0yrc8WX3WJAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCaPiHgAAKCRAFzvXHieVa
 dBAQEADj1kutjPIAv3IJLOLqL8oGJfxa9Y3lOJTkHRYeEOvmvwR4Fm3f4SaSx3ivJxh/U19ZES5
 YSvlce7lmCis7bXLNc3LRQWbjcvEK/+WNZhfpZBcHF9zI4SI9CpzPtsX4tWFGg1cy1EzXG7xvwe
 tT2XGd5giCYm0jEVudTnkTx8cH8H3LSwePnSTHcDpkOI8e1s3A2FHRcH11OKs6aVBN3niJlEyeW
 iB3EZe372Qg5pcOJgiYsUUuxYKrysak4Uv3IXpCOmeYLESpRE2II1keXEiAeMBShoF1WJbxm3WY
 rxu4C8Hv3LsmH2E/VrQ3tgX7ETRhjmI4k+XhsowcpKwOiy4p+Z9CZyacQIez2vj4Y1qxfSkcRD/
 ZVgR1sQaSqce8ET3pc8fFhrEOZ34Gdxm7p8ocw6sBSOmLipJ47UxDgttbCickxUXXDFXodTakTd
 l4/ygTprza+uAMvGxSyWI6y2rZhcpI+yS+7u1NWeLgjq+yx3YTsv71E1oLr82rRrkTFBv3wDjko
 Pa5WH8/XW0nD+yqIK9FEn5AwHzDFic5fQSWc0jHO4ZDu1VLbtJh4i9n4e8yqRTrsiYI9ckWLlic
 VUvdISayc87bvT9Uk6/9wMQHsvv955qy11SliSB0EdcjUdrDN0YPoR7Ue5B9x684ew2BcP2bT+T
 Vp+JFekV7RMNN/Q==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

According to the Greybus Spec published here [0], the Greybus firmware
download find firmware request should have both tag and format as
request arguments. However, currently, the linux kernel seems to have
defined this request incorrectly since format is missing.

The patch adds format to request and am using it as the file extension of
the firmware.

[0]: https://github.com/projectara/greybus-spec/blob/ac47bc32dce1256489a82ff1f463fb979e9684ee/source/device_class/firmware.rst?plain=1#L152

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
According to the Greybus Spec published here [0], the Greybus firmware
download find firmware request should have both tag and format as
request arguments. However, currently, the linux kernel seems to have
defined this request incorrectly since format is missing.

The patch adds format to request and am using it as the file extension of
the firmware.

I came across the bug while working on greybus-for-zephyr [1], to get it
ready for upstreaming as zephyr module.

Open Questions
***************

1. Handle empty format

Not sure what to do in case format is just NULL. Should the request
fail? There is no reason to not support firmware without extension. So
personally, I don't think it should be treated as error.

[0]: https://github.com/projectara/greybus-spec/blob/ac47bc32dce1256489a82ff1f463fb979e9684ee/source/device_class/firmware.rst?plain=1#L152
[1]: https://github.com/Ayush1325/greybus-for-zephyr
---
 drivers/staging/greybus/fw-download.c     | 31 ++++++++++++++++++++++++-------
 include/linux/greybus/greybus_protocols.h |  2 ++
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/greybus/fw-download.c b/drivers/staging/greybus/fw-download.c
index 9a09bd3af79ba0dcf7efa683f4e86246bcd473a5..06f1be8f3121e29551ea8416d5ee2666339b2fe3 100644
--- a/drivers/staging/greybus/fw-download.c
+++ b/drivers/staging/greybus/fw-download.c
@@ -159,7 +159,7 @@ static int exceeds_release_timeout(struct fw_request *fw_req)
 
 /* This returns path of the firmware blob on the disk */
 static struct fw_request *find_firmware(struct fw_download *fw_download,
-					const char *tag)
+					const char *tag, const char *format)
 {
 	struct gb_interface *intf = fw_download->connection->bundle->intf;
 	struct fw_request *fw_req;
@@ -178,10 +178,17 @@ static struct fw_request *find_firmware(struct fw_download *fw_download,
 	}
 	fw_req->firmware_id = ret;
 
-	snprintf(fw_req->name, sizeof(fw_req->name),
-		 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_%s.tftf",
-		 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
-		 intf->vendor_id, intf->product_id, tag);
+	if (strnlen(format, GB_FIRMWARE_FORMAT_MAX_SIZE) == 0) {
+		snprintf(fw_req->name, sizeof(fw_req->name),
+			 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_%s",
+			 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
+			 intf->vendor_id, intf->product_id, tag);
+	} else {
+		snprintf(fw_req->name, sizeof(fw_req->name),
+			 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_%s.%s",
+			 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
+			 intf->vendor_id, intf->product_id, tag, format);
+	}
 
 	dev_info(fw_download->parent, "Requested firmware package '%s'\n",
 		 fw_req->name);
@@ -225,7 +232,7 @@ static int fw_download_find_firmware(struct gb_operation *op)
 	struct gb_fw_download_find_firmware_request *request;
 	struct gb_fw_download_find_firmware_response *response;
 	struct fw_request *fw_req;
-	const char *tag;
+	const char *tag, *format;
 
 	if (op->request->payload_size != sizeof(*request)) {
 		dev_err(fw_download->parent,
@@ -245,7 +252,17 @@ static int fw_download_find_firmware(struct gb_operation *op)
 		return -EINVAL;
 	}
 
-	fw_req = find_firmware(fw_download, tag);
+	format = (const char *)request->format;
+
+	/* firmware_format must be null-terminated */
+	if (strnlen(format, GB_FIRMWARE_FORMAT_MAX_SIZE) ==
+	    GB_FIRMWARE_FORMAT_MAX_SIZE) {
+		dev_err(fw_download->parent,
+			"firmware-format is not null-terminated\n");
+		return -EINVAL;
+	}
+
+	fw_req = find_firmware(fw_download, tag, format);
 	if (IS_ERR(fw_req))
 		return PTR_ERR(fw_req);
 
diff --git a/include/linux/greybus/greybus_protocols.h b/include/linux/greybus/greybus_protocols.h
index 820134b0105c2caf8cea3ff0985c92d48d3a2d4c..48d91154847dbc7d3c01081eadc69f96dbe41a9f 100644
--- a/include/linux/greybus/greybus_protocols.h
+++ b/include/linux/greybus/greybus_protocols.h
@@ -214,10 +214,12 @@ struct gb_apb_request_cport_flags {
 #define GB_FW_DOWNLOAD_TYPE_RELEASE_FIRMWARE	0x03
 
 #define GB_FIRMWARE_TAG_MAX_SIZE		10
+#define GB_FIRMWARE_FORMAT_MAX_SIZE		10
 
 /* firmware download find firmware request/response */
 struct gb_fw_download_find_firmware_request {
 	__u8			firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE];
+	__u8			format[GB_FIRMWARE_FORMAT_MAX_SIZE];
 } __packed;
 
 struct gb_fw_download_find_firmware_response {

---
base-commit: aaa9c3550b60d6259d6ea8b1175ade8d1242444e
change-id: 20251022-gb-fw-a5db68692b5d

Best regards,
-- 
Ayush Singh <ayush@beagleboard.org>

