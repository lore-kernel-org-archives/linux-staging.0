Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3873EC684
	for <linux-staging@lists.linux.dev>; Fri,  4 Sep 2026 03:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788493617; cv=none; b=sp/hcNUavR4jwBDkeZ4uqGqNsDg511+H66g9NQw2K7z37L9WClsSWqLRTlwPSCXpXGyTvuoVS7IWe6Ltt2xIjFvgogQHcJ+TaLpuqixF+niGolrVNslDnCIQQCv+2+KDsXOUqPlw9kZnw7xgg5byrXkHMtI8Q63Rz19GAtEvrAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788493617; c=relaxed/simple;
	bh=oXR6+xqPTMqb3aR18JnMKEzkM0xnrSTREI+nxlj5VEE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qVH4S2vPGujy0ezeieeEiWyst1zVR+5/nFSPjEJXw4KW95TsA73Hpox7yTN70vlWsjUh3kV4tJFz7eI+WUpaxgL6DOMXMu3p+dHUNagd/y3yH6l4oxnqAIXNQYu6AUs/Q/RkgvpSbBreZFP+tox2KpXidwW/9XSVoI1T1KFw6j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gL0VrWr2; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gL0VrWr2"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-39675172593so442003a91.2
        for <linux-staging@lists.linux.dev>; Thu, 03 Sep 2026 20:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788493615; x=1789098415; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZelkIrSgWf1S/hUetmKRMP63MReDb+xb23Q9Brxld/s=;
        b=gL0VrWr2Dd4fWngbQbhtVkQA1VqTSV6m2pUDrqUnhKMkIok/aDg7/gyc3kyVnSZRtq
         Cem7fOCVthKCFWsojoM71fPt3HV/197D5pCQJ+HfF0ZsdYkbssW+Q8pEOlwrpBEXaruF
         DJLsBifXf9E7trV9cIjOLFvD70/z0nMwGHIToli/+xxrtk7mFleMSM5G8lbmviiBcZsT
         sd4M+V6ykWJaNm+yJLUKET/RUAlzNWTVioGm/ug6tGp5Xbe3+2U3wsuYEFomFOkhxMKw
         Ehar+8wh1eVzTIhd/JlXUM6Mc8kNt9hpoP19C6Bo1zIpcgmeHah/wl8OnCu+IfBKEU3W
         FPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788493615; x=1789098415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZelkIrSgWf1S/hUetmKRMP63MReDb+xb23Q9Brxld/s=;
        b=STD0r0PnTxYf9YuqOq7YfDcUi2qasF+qnnzCgt43JdZQoaPmPKbnC9OH3bpReC8j4r
         Uo76Dkj87b52j3Jg3DjNRra5rrQpbafJp6XPBRhorwU1xtSW/o0t6EfF2i62qgNuwzPt
         loyMn1DjS2Jk3bYJ3S55snecz0yiIXf6I3eHbnkMHpe7n+rqQHDY/5yNLwGiK/xrojas
         HG6ijz3FHiibBLyF+ccqTJH9DEAUSr2XAH43+cxiL4OqMPsgPAu4AUKf2iywowW9lA87
         6qNT4pNprWNWYD3mTqKFgB0G5Zw1hKc5YedS3cmxStvdW59/SIb/GAqlbg2bYossMyl9
         7/hQ==
X-Forwarded-Encrypted: i=1; AKwUvByllgJsGzjyCL00CMmpaSdj+iOsa/u/OjVtShzT6uspjeRoVSdevSQZYgHMFhOVFivbu28DaCyk4QH6QDtw@lists.linux.dev
X-Gm-Message-State: AFuF++kQmVqeDwLJo79f+dueMdtNm3MSvYHDrU2S0AbTCXgHb/WWdOTK
	i66nrBzc1coRmXqH2qlVjGrRqqjfdEiGFrY9YXVV5UHscXQf9UPZu+Vv
X-Gm-Gg: AYBFou3Oc2+5D47WWpcFe7ndtbASX0C2/uf4RjKrnQxk3NEy3RfnMxOu5+0w2HDnVUi
	bGBpvab8YR6ixUCWStC89xYmn4bkEcXFVA6gaOezuow5kRZWAMqPAudfymrgpwaZ7BW/qgs+bif
	iiI+ot0yBaYAUD7SjQaDyCdffRBaHN0WYTbD1ITxaFRaSTItBvLNR+F4zNgr8aVolrxxkrrt7rM
	lcyqkasMM8Xkvm+1fI3mBLUlseT6suQLxeSUKwC7a1GHHvZQ+XU4t838vCEKvjvOBtuKOY1GtF8
	bDhydIItrJdBISr0WbmSPYdCIOlbP7DncCi8+jbdNhWQn3huekXTKIoyURbJ2OGeYkkITbsXk1d
	UjSKSvuVLBFQtik7t+4h6BpmqfVGn1rOUy9/GBLXtpnEmbTwVs+/Xo26prArujvftQlBIJEIQZA
	0jyyHsW2VctDnqGzBRAS+1vqRe+B/jPiYPD32L7wipeMzIMfmhqbd0KKu5BZr5v2bWUV97UgKYj
	xYVP4s96AsLjEGVDzIg58TuZZW7Y3jJLXmjyBnTvepMPQHqJYiqoVUStZATOsM/6gyhfEjPzzr/
X-Received: by 2002:a17:90b:268f:b0:398:c3a3:dbd0 with SMTP id 98e67ed59e1d1-39b2612eb96mr5652582a91.8.1788493615091;
        Thu, 03 Sep 2026 20:46:55 -0700 (PDT)
Received: from hacx.bbrouter ([112.134.221.144])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b25c974cfsm2148062a91.0.2026.09.03.20.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 20:46:52 -0700 (PDT)
From: Suraj Theekshana <surajtheekshana1111@gmail.com>
To: vireshk@kernel.org,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] greybus: cap: bound IMS/auth memcpy to ioctl size
Date: Fri,  4 Sep 2026 03:46:28 +0000
Message-ID: <20260904034628.12376-1-surajtheekshana1111@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cap_get_ims_certificate() and cap_authenticate() derive copy
lengths from response payload sizes without checking the response
header size or destination capacity.

Reject responses smaller than their headers with -EMSGSIZE. Reject
certificate and signature data larger than their fixed ioctl buffers
with -E2BIG.

Signed-off-by: Suraj Theekshana <surajtheekshana1111@gmail.com>
---
 drivers/staging/greybus/authentication.c | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/staging/greybus/authentication.c b/drivers/staging/greybus/authentication.c
index d8f2cd4..cbd28a3 100644
--- a/drivers/staging/greybus/authentication.c
+++ b/drivers/staging/greybus/authentication.c
@@ -128,9 +128,22 @@ static int cap_get_ims_certificate(struct gb_cap *cap, u32 class, u32 id,
 		goto done;
 	}
 
+	if (op->response->payload_size < sizeof(*response)) {
+		dev_err(cap->parent,
+			"invalid IMS certificate response size (%zu)\n",
+			op->response->payload_size);
+		ret = -EMSGSIZE;
+		goto done;
+	}
+
 	response = op->response->payload;
 	*result = response->result_code;
 	*size = op->response->payload_size - sizeof(*response);
+	if (*size > CAP_CERTIFICATE_MAX_SIZE) {
+		dev_err(cap->parent, "IMS certificate too large (%u)\n", *size);
+		ret = -E2BIG;
+		goto done;
+	}
 	memcpy(certificate, response->certificate, *size);
 
 done:
@@ -167,9 +180,23 @@ static int cap_authenticate(struct gb_cap *cap, u32 auth_type, u8 *uid,
 		goto done;
 	}
 
+	if (op->response->payload_size < sizeof(*response)) {
+		dev_err(cap->parent,
+			"invalid authenticate response size (%zu)\n",
+			op->response->payload_size);
+		ret = -EMSGSIZE;
+		goto done;
+	}
+
 	response = op->response->payload;
 	*result = response->result_code;
 	*signature_size = op->response->payload_size - sizeof(*response);
+	if (*signature_size > CAP_SIGNATURE_MAX_SIZE) {
+		dev_err(cap->parent, "authenticate signature too large (%u)\n",
+			*signature_size);
+		ret = -E2BIG;
+		goto done;
+	}
 	memcpy(auth_response, response->response, sizeof(response->response));
 	memcpy(signature, response->signature, *signature_size);
 
-- 
2.43.0

