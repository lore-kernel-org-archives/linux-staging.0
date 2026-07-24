Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2CB3A963A
	for <linux-staging@lists.linux.dev>; Fri, 24 Jul 2026 20:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784925754; cv=none; b=UNVeHMn/tR1n7iwIWHDJS8EFTXh+Z0esFNXDarpDHBoOsM0s1+mNt/W544raBwyGo2wX0RYh3BnxlBTWQlITSK3pCWU7kpjXbgBRg9X39MGxTqw7BJxbQjCUf0hpfSLdw80s0G1ptDL6XN0gsKjDIebMtgdgClUB604dlLgoees=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784925754; c=relaxed/simple;
	bh=AAv0ds3z+jIQUP01p6UndRq/dyhu/4/2tH+ZKIUCfqo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cl2VpQKw872A9ZAiyAsBYhmQ9s21EXFYwaRmLQ04D+3aMpZyptgocj2yWtA45lVPBOmoar6/9aBGmm33qAPpGzGrMgYjRc98LkVXmnzV9RxyKDKYvZpxHdtg++AQCmKVolFs9wIydMy3zoZ7TdPurKGUJiGOeQSL8lDnOCM9zko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BfPgr+X5; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BfPgr+X5"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f703a9d05so575382f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 24 Jul 2026 13:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784925751; x=1785530551; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i36PerSCUWxtZK3ePPQwmUd/0IhzO70n8IebedooQRw=;
        b=BfPgr+X5Lpbu4b4Q/67KaHPp+wTadsFkJrrBCTIaX8Tfpp9VofdPlqAJK0Pk72NcX4
         9A3xwOdBJxLFRQRlxUsWN3R99E1Z1t9uKS0Sfmy7IjFFkrYZHClZq4cY98FymF7S5Zxp
         V8PKsWY3BHTeqPNYwFCVMi3nb5BDNIKZCmNz12JkBE3ZCJCVmqW0QMv7j4NpCndaXz4m
         DfNqPhiI6EXuKJbQiYCbsXQDWoLAFKLL4MpilHVlfW2lQB6X1PJp/Dl9stgnkpES+dnW
         QbJm+pHFHhWzUCIB0wyAghbwlIdM9GqKjtiFSiwrurA9jtMUciQu8070xQ/Cb/Txannd
         PMaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784925751; x=1785530551;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i36PerSCUWxtZK3ePPQwmUd/0IhzO70n8IebedooQRw=;
        b=YwWI2LXDl6yQoVByVoD8i0QUbx5b2si75B4rIJrwWInysFJSvcL6cJ5yzxYkXA3c9i
         l5K5QXjn+m9OM5CWSRjonk7fkYjqGqebp3csCg6oQdRV0fKnf1X2tVR0YD0wrzHkMufi
         6WqtdeS01vFRvkqVprzOmzUT6/HyHmA+YZ4h2dnCZMag3BO2Tp7cBShSHPvHLpU7Z7i7
         7T/iFd7fKweXoQc2oD2i8ebs36lRabMK4EPXuWEBWeaYIqDMinIBknYbEpnmA2CgvIco
         QBIrti/Wx5LC+5A5/ua5R4neXRILrakD+nonQgqCSKrXWtQ0BsjfHLkn3m7db0XRhn/S
         Liew==
X-Gm-Message-State: AOJu0YwLLxkvwzdR04dUf1YuldIN6XHZSPi7MJd+Ce9/C2XTyp8K4trN
	tOIhWchOLAQxOYtfdlMbvOeUHeqafRjIHFbR/h3UJsV4+xkgh5Jjm26jz2cUmNiK
X-Gm-Gg: AR+sD12zga7zzedyoYR7GRbZFPFXzRdftLENKjgilx4EcmHOklznrW0jBL0WiJBWYsw
	OBJosl7NiTKfO73nuYRy/FuYyx4wV8NH7JUbS6MWqugCLrx+Q++TeSsnrw1h3YEAEgSU1Oy+kuj
	gvHPyhKgl0KUr3HHv0auFnI04tFfs/xoI2i4uxEO/CdAXe6yLS5C/ZIl/UQc9RB5Cnq7BNR/qWl
	4+KIsLsZp/nbnNkNZSX/V8Biu0r/1gsjyOMWRrtMyrLPtsTdN30BiddMj2u6EfR/3yIogW5lzR4
	SlWzKQxpJEFwHayUpDYMjjAvAosglfTS1cWZPfQUPiztZjUoHSiHaeXentVlC823TRvudu1mQFU
	3P/APpH90wIeqyq6RzBms/uX5W1SxxotgLFScxu2VkgHKtMXncXvZxOWthn0iOmoMdc7z3FLlms
	5WHscmOmEYWERCZY/+0k3ppLY=
X-Received: by 2002:a5d:5850:0:b0:47f:703c:e000 with SMTP id ffacd0b85a97d-47f8dcbba5dmr11329544f8f.55.1784925751321;
        Fri, 24 Jul 2026 13:42:31 -0700 (PDT)
Received: from localhost.localdomain ([176.223.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c67339sm28157392f8f.31.2026.07.24.13.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 13:42:30 -0700 (PDT)
From: =?UTF-8?q?Paulo=20Tom=C3=A9?= <paulo.jorge.tome@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Paulo=20Tom=C3=A9?= <paulo.jorge.tome@gmail.com>
Subject: [PATCH] staging: most: dim2: remove volatile qualifier from struct int_ch_state
Date: Fri, 24 Jul 2026 21:41:46 +0100
Message-ID: <20260724204146.36726-1-paulo.jorge.tome@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove the 'volatile' type qualifiers from request_counter and
service_counter in struct int_ch_state.

According to Documentation/process/volatile-considered-harmful.rst,
using volatile type qualifiers for structure members is discouraged in
the kernel. Kernel locking and synchronization primitives or explicit
accessors should be used instead of relying on compiler volatile semantics.

Signed-off-by: Paulo Tomé <paulo.jorge.tome@gmail.com>
---
 drivers/staging/most/dim2/hal.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/most/dim2/hal.h b/drivers/staging/most/dim2/hal.h
index 5d69a5e7d299..bc04bd9451af 100644
--- a/drivers/staging/most/dim2/hal.h
+++ b/drivers/staging/most/dim2/hal.h
@@ -34,10 +34,10 @@ struct dim_ch_state {
 
 struct int_ch_state {
 	/* changed only in interrupt context */
-	volatile int request_counter;
+	int request_counter;
 
 	/* changed only in task context */
-	volatile int service_counter;
+	int service_counter;
 
 	u8 idx1;
 	u8 idx2;
-- 
2.47.3

