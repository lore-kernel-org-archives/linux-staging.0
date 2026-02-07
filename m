Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444CD3542DD
	for <linux-staging@lists.linux.dev>; Sat,  7 Feb 2026 21:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770501305; cv=none; b=U59u3gT7Fm6OA1mPa/8eqkmxxwtBU1arfO81WPtlogdbIfSMHWvX+zxQdISn280gu6fZ5ir4TTtTwLc0qPPRvtcqMGUqCSjLs+ImLshCfZyohBNC99JGfko+cswB1xmOqplkMj5DNeyt3fVFoR+24vs2o/ey8c+Gxw1VQJSVIrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770501305; c=relaxed/simple;
	bh=PQjivCNOY439ktYx5tKX1e++2US1TGIavnBo/qyhzOY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tFYuqGhNjao9jC+XK+Lq+NIjODO6fWfbBXrqy2MGZVEay/Zhtbt1Wj0Kk+6Z8pjrRiMMCdWkjsq4pa+vQFbj/E6WtpoZP6TCQTDQFMGWX2Q1ZcL7/o7YJ6IwWrmHFvPx1e98gYUjB+v0s9oGQYIEDSkrxBKUVCqPk1sDgeWKywE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KPqDkHTj; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KPqDkHTj"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b8eafb515aeso376623966b.1
        for <linux-staging@lists.linux.dev>; Sat, 07 Feb 2026 13:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770501304; x=1771106104; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D0DWgxZB6DONIOv0yYTd0CypbGD8Y7w74yVvt15oBiM=;
        b=KPqDkHTjCZFvnqV98z+ue3/NeuZBXols+xLFISnzQtExJwYRE/JqAH1WwkrzY0fCUa
         AwFvBpanGKQsBE9EFroeSfrP59ykREJb5FuJMgZBdEfId8yqxPJ7jmm2j/vIsAu3nEoS
         r93aQxyVLb0c15EYNkhqRjDjcwiWnqoyqEAgpPbqmdWnnFdR7MYHXIwiIhovIUruFkie
         6vVfFChlmw/nHg4Jz3SF8pF3K0rVuu87YU33txsvK2Jl8GccmQOTmvveb0p/z4Mt0yLl
         UWVE7Zj9hG9C9Ui/Kp2L4mZbJHtzAj9KBqjS++VQMDtKkUmhsREnIAdqCfdDwjMH9jhk
         xkeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770501304; x=1771106104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D0DWgxZB6DONIOv0yYTd0CypbGD8Y7w74yVvt15oBiM=;
        b=ovya5F6Dg04Nw5KANP5qI3ELrzd+Xib088w/rgm70Ih/zs+4wwZRC8AdtX+z2fPJXf
         YafPAPQfiuSQ6Cf+YfpsdZoPrycP4gqIEZV2ltdIkCCSe5WdzzdWrPCRXWHS8m9ZIm2S
         0moEHH92mIa7n5PM1y8QizPXem1fn87PetKue6Z41hDJ4vDb/jww9lgI91TfX8O78/1H
         P5miCrL3/rWaQoMPAUYd+TgUdlvkj3xE6qfAMV7x5lvDUDkhwJM9XZJ6dzgoWvr2ywwO
         zXWtMTqCbiD2cyi402bT8A6xqz47AJRGY18dah2DOYACvkka84yD535EBLwrO4kbbfqz
         qA1w==
X-Gm-Message-State: AOJu0Yx4kTaulHPpQzhC78ILtBlwc2dWQytUOHX62j+IQiD6ph9fq0bS
	JAdf7uOUwhB3q6G7y4VtfFgWEukmwd9SwKV7XPQdEzdkXSuA3NZ64SKg
X-Gm-Gg: AZuq6aKIRUgpkXLjlINNdog8BCDHXFLe6XzR6HtT7ECPm4mE80yDaBi2FZPh+2gpnpH
	H150O7GSawUUaQttbsVXM4u3GTca12CRLke1nCtn/UccPULAPtyTNM4h9sRuRT8QZwmdrsm1JgC
	9luIrS+DjXhpLpStteufcANmNGqfD+bKlZf9KMl8qxkXx+Ly4Km5qfBlX9YmPuMQTpv5ACsfmLk
	saY73oB6akMFivKDI75Vpv2hFbRbtEdroqCVQrNFjiwK9ADF0q7u6yJE122L8vMXCXAGjzf3y09
	h+nBcy2Xhxv24skyrVzBhVR+4VNs3T+qEqEE8j5e5JOg0fL5q/Y/tL26evlTca6kNgaZOX47bxe
	HingAKIf1QjcitNzBXmuN/02l8Al0+m66yucgCbPRMrk9ncaxf+PswV5JWiwU9A6RNLDfkWC8PC
	9hjCbR+7KsBF1hG9+S0+e5cBdomcHcsI5CrzyD36yJDYkInuJau63nKAfIrPOEQmaHv/pr9PA+y
	O++e38K2OvWQ0K6DrI1tHkJr4/B3vyPfPXgINEcRGIm/svOXPf0LlZVJGiSe/BLMAk=
X-Received: by 2002:a17:907:3d50:b0:b8e:2a8a:430d with SMTP id a640c23a62f3a-b8edf22fc44mr357048266b.26.1770501303318;
        Sat, 07 Feb 2026 13:55:03 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-a.c.od237066db22328bb-tp.internal (99.86.90.34.bc.googleusercontent.com. [34.90.86.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7a3045sm218635666b.22.2026.02.07.13.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 13:55:02 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH] staging: vme_user: reorder NULL check after kzalloc in fake_crcsr_init
Date: Sat,  7 Feb 2026 21:55:02 +0000
Message-ID: <20260207215502.1961-1-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the NULL check for bridge->crcsr_kernel before its use in
fake_ptr_to_pci(). While fake_ptr_to_pci() is a simple cast that
handles NULL safely, using a value before validating it is a bad
pattern that static analyzers flag and could become a real issue
if fake_ptr_to_pci() changes in the future.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/staging/vme_user/vme_fake.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index 731fbba17..506bc5439 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -1029,9 +1029,9 @@ static int fake_crcsr_init(struct vme_bridge *fake_bridge)
 
 	/* Allocate mem for CR/CSR image */
 	bridge->crcsr_kernel = kzalloc(VME_CRCSR_BUF_SIZE, GFP_KERNEL);
-	bridge->crcsr_bus = fake_ptr_to_pci(bridge->crcsr_kernel);
 	if (!bridge->crcsr_kernel)
 		return -ENOMEM;
+	bridge->crcsr_bus = fake_ptr_to_pci(bridge->crcsr_kernel);
 
 	vstat = fake_slot_get(fake_bridge);
 
-- 
2.43.0

