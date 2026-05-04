Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D873DD532
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 23:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777937709; cv=none; b=HRzqG38Cg5CJtphG/gddi1pxoMuRmETrfczjzDq0J1v4r/laCy+c5r1mGeqs07C7jZAnP8drHrl6iQ/qaMyF1yOV76PT+fZnNcntTsYNN6ka2hi9QNSKRJsI4BI2ep2uQxQKeC+912MI2E6fTuplyOGSSzGQHHlYsy6WQaJtBwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777937709; c=relaxed/simple;
	bh=VegP8TQrk6P3ldkT7/tjydF0ELscB0e9zJXGue7eDRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZAQv0T/DzGK+5lLzXVMtegTk2fIjg7SWm0vayN7H7934kYqp0DikfzT/Rhmhzcm2qewXSbkWFmsAXkPS5vwqHkJHH4ChPHUaTTpTlyqXHkqCXQqJHSZ0sCkvx8rxaWr+l2QkXNQL0qMOKkZT0o7RVE9Lxbzlj7jBMX1XA9RP6xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gabjgb+0; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gabjgb+0"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so51853175e9.2
        for <linux-staging@lists.linux.dev>; Mon, 04 May 2026 16:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777937707; x=1778542507; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WqpTPO4JM1ij5VfC2iJKwCbrcvO2GqT/K+xw0onwWmI=;
        b=Gabjgb+0R4+WMI0n3r3s19WusJGX1UEgaZ8xjuP3I8H+NjDo5MZtxbuRSrHC/oYBND
         UG8F7oKdG3hsmFrC7qO3VU4fj+eqyELXKvFmRasCO5iqfOXPoeSBaDmtEXMVUyZfg+vi
         0SoWI4Dz5jedD5aMS6WrbYqk4K4Xsd4SWRB+6UusBOWQmz0a4XBRN9ZmO96V4LulhbBY
         ns+DEIcCtgkvOjBtMHPl8ut6wTMeNMU8gbu10FQ3dxvStAR1psw79RI5nttZZMkI00Hs
         RR8lMHOOSAFcH1TsV+VVaZFPpLlkNwpWY7E6cqks6D+PNkn/gG7WXuAQMhYXT0sYRb2S
         aO2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777937707; x=1778542507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqpTPO4JM1ij5VfC2iJKwCbrcvO2GqT/K+xw0onwWmI=;
        b=NnaNtwS537NcTz1V7Oi7uITPRtjsNcNGHvSnYEHj/L9ef2mcdNQ5w8MAZKP0mUS29G
         vWWhnww/iH1HKaP9EOGZ+keYusXX6q8iLjXyqw8z11K+iZTuD8jmbuxEuQeD+Buc1elB
         UpyVJBIcUrW3F/y+JARIMbdXo2frZ0+UhPse87Iw8ghti/3BGh4GLq+RKAbNYAiIopfY
         EfcmLuhBa/G1fpI6WyQ1DmHiROUTwxpKYuE1gsHvvr5wrG90yk8GMN6dg89jXZIDRkqV
         OYAgwGHkx6NQroZUm/pfklY4Ske3wG5eOsQjIq2FF/SSk5aACEEteIfeTpbXc25S6TlA
         LkQA==
X-Forwarded-Encrypted: i=1; AFNElJ/shZ2E6PvVDAjDEBA5BVi0+K7QBRfXyh75nU94dG4VssfQi4/3/FPk6c4aKsu4ftEMsxt1C28KO1To1YlH@lists.linux.dev
X-Gm-Message-State: AOJu0YxIPdyEMYigehRfTFOkYxX3hTL3U5LG3Hm1jCEfUOD5SINbGojW
	jSLXtXQlFZJQfdPHKIQLpRKyzMsa1l26LXsjRT1l8ZwapmsdYyfPqGkE
X-Gm-Gg: AeBDietCVwFgXAbw/VIq4D/fccvFnSg1YMpAaCKQhp4yAseKPYHH6ittmuUznCOltve
	8gFdmg9Bt5CL8rGlKUKYLP+l+2NkkfjNN+XAV6wB3D/9RpGYaxKB3CZidudafNyVENNT72RlNvE
	I/S/rKBckfudY0fhAbIBI/Um+mRBdyQN0tx2+dVdGItjAJ8fV9IcaY5uFBqrRoEYf2GRPfCSKyZ
	+8lccLQFT87B5OaxBx9ZMPgwXhZkzES1fxBGMjQ0eTt1VxFF+F6u9PSn46eCsHwaHWVeJ76WbXW
	uW3UGdQRCXrSpUUGGyFTsLakDqaWRQDjVd+8GDJV2uQ6zecxqpQ1TBbxFLHJLq4hvR4hH84+yAz
	yDJ45WUA5k9I41Mg4y4czu4pVeM/XT95+Ugs/qCN0DMMPDD5KApansH/Hm1T0vYqxQ5tD6A0pjj
	N04mSN2sn6eWVyOu8wYbz8wb9EcKM=
X-Received: by 2002:a05:600c:4445:b0:48a:52ee:5776 with SMTP id 5b1f17b1804b1-48a986380ecmr189126045e9.11.1777937706367;
        Mon, 04 May 2026 16:35:06 -0700 (PDT)
Received: from node ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a822bf3ffsm390071835e9.7.2026.05.04.16.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 16:35:05 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Cc: vireshk@kernel.org,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v1] greybus: authentication: validate CAP response payload size
Date: Mon,  4 May 2026 19:33:28 -0400
Message-ID: <20260504233328.7409-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cap_get_ims_certificate() and cap_authenticate() copy variable-length
response data directly into fixed-size UAPI buffers using the
untrusted op->response->payload_size value without any bounds checks.

A malicious or compromised Greybus endpoint can return an oversized
certificate or signature payload, causing a kernel heap overflow.

Fix both functions by:
  - Rejecting responses shorter than sizeof(*response) with -EPROTO.
  - Rejecting payloads exceeding CAP_CERTIFICATE_MAX_SIZE (1600) or
    CAP_SIGNATURE_MAX_SIZE (320) with -EMSGSIZE.
  - Copying only the validated size into the UAPI buffer.

Fixes: e3eda54d0b5f ("greybus: Add Component Authentication Protocol support")
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/staging/greybus/authentication.c | 34 +++++++++++++++++++++---
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/authentication.c b/drivers/staging/greybus/authentication.c
index 97b9937bb..103cc15d2 100644
--- a/drivers/staging/greybus/authentication.c
+++ b/drivers/staging/greybus/authentication.c
@@ -109,6 +109,7 @@ static int cap_get_ims_certificate(struct gb_cap *cap, u32 class, u32 id,
 	struct gb_cap_get_ims_certificate_request *request;
 	struct gb_cap_get_ims_certificate_response *response;
 	size_t max_size = gb_operation_get_payload_size_max(connection);
+	size_t cert_size;
 	struct gb_operation *op;
 	int ret;
 
@@ -131,9 +132,21 @@ static int cap_get_ims_certificate(struct gb_cap *cap, u32 class, u32 id,
 	}
 
 	response = op->response->payload;
+
+	if (op->response->payload_size < sizeof(*response)) {
+		ret = -EPROTO;
+		goto done;
+	}
+
+	cert_size = op->response->payload_size - sizeof(*response);
+	if (cert_size > CAP_CERTIFICATE_MAX_SIZE) {
+		ret = -EMSGSIZE;
+		goto done;
+	}
+
 	*result = response->result_code;
-	*size = op->response->payload_size - sizeof(*response);
-	memcpy(certificate, response->certificate, *size);
+	*size = (u32)cert_size;
+	memcpy(certificate, response->certificate, cert_size);
 
 done:
 	gb_operation_put(op);
@@ -148,6 +161,7 @@ static int cap_authenticate(struct gb_cap *cap, u32 auth_type, u8 *uid,
 	struct gb_cap_authenticate_request *request;
 	struct gb_cap_authenticate_response *response;
 	size_t max_size = gb_operation_get_payload_size_max(connection);
+	size_t sig_size;
 	struct gb_operation *op;
 	int ret;
 
@@ -170,10 +184,22 @@ static int cap_authenticate(struct gb_cap *cap, u32 auth_type, u8 *uid,
 	}
 
 	response = op->response->payload;
+
+	if (op->response->payload_size < sizeof(*response)) {
+		ret = -EPROTO;
+		goto done;
+	}
+
+	sig_size = op->response->payload_size - sizeof(*response);
+	if (sig_size > CAP_SIGNATURE_MAX_SIZE) {
+		ret = -EMSGSIZE;
+		goto done;
+	}
+
 	*result = response->result_code;
-	*signature_size = op->response->payload_size - sizeof(*response);
+	*signature_size = (u32)sig_size;
 	memcpy(auth_response, response->response, sizeof(response->response));
-	memcpy(signature, response->signature, *signature_size);
+	memcpy(signature, response->signature, sig_size);
 
 done:
 	gb_operation_put(op);
-- 
2.54.0

