Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E841F16B
	for <linux-staging@lists.linux.dev>; Sat,  8 Aug 2026 04:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786163462; cv=none; b=bQ8UmGl0JEccErdR8oTZGz3V4Or+ObMQfR6ANuuW7BblkNOAFuBzL621Bw0NTGdRwi8w1EKBkkV4+xS28EYECdk4RFGxcO5WJkBClJDcAI8+P2bs5Y8oJDglKhsd98yZXGp0yPsFq+gVuj8jh50y/tHExH9ROKkKzn6767THCe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786163462; c=relaxed/simple;
	bh=FPHAe4ZalTRRep82ITgSnoG0MJEYJSRKN29ZWYyOp2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W1LGZFSu6p49Bygtzffvk9HNQZT3ditm8qDqtJGuviehbj/HaCoS+RD7rInYrSeKAfEkVRe3Q1QuVcidIYF8ByecPj4xu2lcrDTSz2NfUOeJYdaYe+AtxwBbfrJAXIg78gucxP3ymc64A+jGuAVrSTNJAQH6Lkw+K57hwLdMSeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fDJ+pNnk; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fDJ+pNnk"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e041ea211so212921a91.0
        for <linux-staging@lists.linux.dev>; Fri, 07 Aug 2026 21:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786163461; x=1786768261; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I4oeMnbiZ3A93sA/68pPML7ewKxr/ZgYfLBewFTjvwU=;
        b=fDJ+pNnkaoGypCzcDZxJtaZ3xHcJE87hi7K8oBRVFIpRhWpqFODH4IpSwC9lv2LdT8
         GtEGIRCJM2AXUKqvhpBpQsvngAHBzyJttROuOCZuKtN+S+zlTgDvjGs+JMq9ZbFgPWx+
         MuBfYhNinYQ2rBqZEf4vSFlZW2E6ktBvIYRC0r8C5tKcGiq8ajlqRuA70zRpHesacOPS
         V75KKLnMHtXJXpms+pyZ6obyt2XM4H/lkHaMjt6iMkXTNq0rAo/9evw9KVjRU8xhLxhG
         C0sMon7Fb2krWYEsHxe8d1WX/pRhy+3ll1qD/XoXDVQEFZi/CJph1JY4Tfl5bOkvdFXz
         lelw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786163461; x=1786768261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I4oeMnbiZ3A93sA/68pPML7ewKxr/ZgYfLBewFTjvwU=;
        b=IeUgY3KFbMfhJEhhh3LsgFgIT6rslFuHKcSONYvzr6NCzcD/viX8wERh7mlKt89S+A
         vpLnyEdz4KC9h8fGBrGtGMITX6fzZqLFGxLDMzURdEuJjQeRNmzD3zvLYMKrRa1MHQPL
         wgGqau0nc3l3MZN5IIUVZ7lVvByZJ149Ckxn+A8oJdJfgoEJBEoDk5lrTHWAwqWlAIWF
         g5L3GCYx5jibLwe7EVj82QesZaU+KaazP7q7QNlRHe2GEz4WpeUOhQtXFn1ojFyVMyfp
         1NNvvgQSBiytO/HWrEy8SuWgIrE72VaaZVwxsvIYqyr6aPfrAfA2UtVJ2/ZXiV3Hp81C
         HeIg==
X-Forwarded-Encrypted: i=1; AHgh+RqNVgdCCOcosGJuHRZ9ZfTjI6dq+MoOZ8jIevSn8Oi262N4VAlELnzf1mCmqfyqy8SQ1z4g+94KwlMtc8lM@lists.linux.dev
X-Gm-Message-State: AOJu0YxRVOfrGVABJJAPuYsq0qLzNGJhmYbytxoes/XW6SuMDswRBIoP
	zPSdNQ3mR5VvV41kukvMeeuZ8QkjWrNTlMq8eH6Ny5srHsoaVUrmFaLU
X-Gm-Gg: AR+sD111z4SVyaxAPwDv4bXx9g6Jbx4oCjBBjTHxgiyDW1B6Y86IjJjeyKHgM+90Fdk
	fFNv8psh1k4drVDSBHggUCZ/ACxpu06ge+BVZl3fAsy6KaCG2ul2H22gyRL0cJZBoBydOGRyKmA
	GR2lCO9wCp3GFw1xBFCoqg2oAhlUY+NYi43OR6RDuIZ5kyqvAkBhkXs0uZ51dCpk74cxf8F+DdA
	IoFyxZtrSk0Vv48KWgcm60RglWkXRbcxFG9YUrxZgKC5W+dkgaJSqoKD2IwFWW1i3zztrops/B9
	JyODkTz+ma7GsEhF8USsy0jAEdEAEvAWarig/TOoAL4IbUTCTtXDfddvIXwBIBy90NL4o6nwAQG
	IZPdFnimhNUSoZzNisMBrBp1rSV5vu2S64YxGn9b4XbDeebtAyuNNRV75gUqcOhLP64biLZHKsj
	25d+nN9AXO+dIRou4L84O7acfs7ho4bzUDZdZfDLUPBU1dQco7jz/RK25wZDmPT0Md5u9xZD51k
	4o/4+vnRPJIx+o5QDC6E7fNnLICAlskxF3WzTbcEl3wweBxsqH8lZ+iZH+svw3PSIQFy2zLGJY=
X-Received: by 2002:a17:90b:270e:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-3903bb0cf61mr29965252a91.0.1786163460506;
        Fri, 07 Aug 2026 21:31:00 -0700 (PDT)
Received: from kernel-dev ([49.36.97.234])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb8844fsm14424443eec.16.2026.08.07.21.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 21:30:59 -0700 (PDT)
From: Aditya Chari S <adi25charis@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aditya Chari S <adi25charis@gmail.com>
Subject: [PATCH] greybus: usb: fix response buffer size for fixed-length hub requests
Date: Mon,  3 Aug 2026 06:32:48 +0530
Message-ID: <20260803010248.339120-1-adi25charis@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hub_control() sized the Greybus operation's response buffer purely
off the caller-supplied wLength. However, per the USB hub class spec,
GetHubDescriptor, GetHubStatus, and GetPortStatus have a response
length that is fixed by the request type itself, and can be larger
than (or independent of) whatever wLength the USB core happens to
pass down. This could under-allocate the response buffer for these
request types.

Special-case these three request types so the response buffer is
always large enough for the data the module will actually send back,
matching the equivalent handling in usbcore's rh_call_control(). Fall
back to wLength for all other request types, as before.

Compile-tested with 'make M=drivers/staging/greybus C=1', including
sparse, with no warnings. checkpatch --strict is also clean.

Note: this driver's hub_control() is currently unreachable at runtime
since gb_usb_probe() unconditionally disables USB support pending
separate USB core changes. As Project Ara hardware is no longer
available, this change has not been tested on physical hardware or
with a Greybus module; it was verified only by compilation, sparse,
and code review against the equivalent logic in usbcore.

Signed-off-by: Aditya Chari S <adi25charis@gmail.com>
---
 drivers/staging/greybus/usb.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/usb.c b/drivers/staging/greybus/usb.c
index 475f24f20..ea6c0800c 100644
--- a/drivers/staging/greybus/usb.c
+++ b/drivers/staging/greybus/usb.c
@@ -105,8 +105,29 @@ static int hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue, u16 wIndex,
 	size_t response_size;
 	int ret;
 
-	/* FIXME: handle unspecified lengths */
-	response_size = sizeof(*response) + wLength;
+	/*
+	 * Several USB hub class requests have a response length that is
+	 * fixed by the request type rather than by wLength (which may be
+	 * zero, or otherwise smaller than the actual data the module will
+	 * return). Make sure we always allocate enough room for those.
+	 */
+	switch (typeReq) {
+	case GetHubDescriptor:
+		response_size = sizeof(*response) +
+				 sizeof(struct usb_hub_descriptor);
+		break;
+	case GetHubStatus:
+		response_size = sizeof(*response) +
+				 sizeof(struct usb_hub_status);
+		break;
+	case GetPortStatus:
+		response_size = sizeof(*response) +
+				 sizeof(struct usb_port_status);
+		break;
+	default:
+		response_size = sizeof(*response) + wLength;
+		break;
+	}
 
 	operation = gb_operation_create(dev->connection,
 					GB_USB_TYPE_HUB_CONTROL,
@@ -126,10 +147,12 @@ static int hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue, u16 wIndex,
 	if (ret)
 		goto out;
 
-	if (wLength) {
+	if (response_size > sizeof(*response)) {
+		size_t data_size = response_size - sizeof(*response);
+
 		/* Greybus core has verified response size */
 		response = operation->response->payload;
-		memcpy(buf, response->buf, wLength);
+		memcpy(buf, response->buf, data_size);
 	}
 out:
 	gb_operation_put(operation);
-- 
2.53.0

