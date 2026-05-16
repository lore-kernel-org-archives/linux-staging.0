Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6754676026
	for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 15:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778946643; cv=none; b=Usj4EwRTxEKaVLkcwDjuMp2gYmAqdwcSlZ5g1+B9vW8VMKTEzP+debCVoukJKyuCop5IZzOfhRgVkmdEyu3BE640+dHEK+De32VOus8NlkrKhWfyfLt8oSgfCMaR1IPIQgPFYGiFuVuMAJ90ujzN4Eo7c+2l8tNjH9lF0OLeY3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778946643; c=relaxed/simple;
	bh=aJqZVRBOOHRr1u9rhoMoGzZ9jk+v/EIyL4ukBgQoxS8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EO1AGxmdq9Vlvhl5p7PWSVKw8ZkwEKer2zRTTYHtKWSxiBEBUijgz9Fdm74w6TaGxI7DRlRzS4vti6bUJeyQDKSuv7+zObVDPXgwctJ34JGadNKgkyMSIqKEb9hLhg8ijKjU5qntYMHibcgzBjTEiqXsvEYM7BiwFN3mBlLjnZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hj9XBYqp; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hj9XBYqp"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2bd266f6fc0so4304125ad.2
        for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 08:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778946642; x=1779551442; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s9FC9CxJQR4N5RFr/tQsV8rIuiO5rWa7L7GxlqmoSuQ=;
        b=Hj9XBYqpr41Zd88QJ4TaV/AvaniIGbwDnhK5b/Z1bhhCUqocp1uYlrdjj2Y+NsVuq/
         OpsxMPN1JMgaLV+dMg4mb/VBnfopRIkbbUahZ2BTksDzOtXmPqtsLdFH4gT0bAkfW+/F
         J7n+bYtu0/aE5FNmAIrRfPnCBlQ5o+AbPCdNzn5XJ1xvcTGvWUWzuvSq2lCfY1CcgIvf
         ASVHKDa7UpfoOSva8mNnrxwBIg3WAsmGAX5i1IQzDsKcN3N3YP6ClXABjIX9/IgSGx+J
         GVBkqjZtfKYmii3IJVjjTnQHBzROAZAWq7Y0xXrafMqeMLrlNFXGLw5EEqRAUf8Zj1Ry
         n/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778946642; x=1779551442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9FC9CxJQR4N5RFr/tQsV8rIuiO5rWa7L7GxlqmoSuQ=;
        b=VRqPPQsKQ2/UE8oFO0WHELkDI1bzYHh+/iycUFJwGNMAtc5VbAvfS7aGG8UANppR/A
         xRbC3pDi94ETutDiTXaGt1Z2Mxz6jjw2m6xxw6q2Jqk0FRaH2Ag0vnt5pm19W5mYbdPb
         MQFoNgHsaJGl4Uoo166q42BMhxfBpJ4SsPJezVI87szBe4nYaIgpPOkj8iO2hU/lgGVc
         BSGbQRcRmWPRRsAEoGkDY7XiWU1o6ydD5aMtbYcnezz6tfwqBio4PG0CfNKGxCBLdVmn
         gNDGhvvxWCn4yNZddgyUunm2Wwc/c26ttd5+EI0rAPfE3dK34MkHvWtMeSAi3abABwW4
         3TuA==
X-Gm-Message-State: AOJu0YwKz9FPl49EkI62wtHa+OCjdexK8aHgWVNTJj4r2mPoqgDLTjEv
	juwmJsrYHfqi1T7ta5O7qno7c+jYmVx8BFNfDio0f2GP68vrqS32WQy0oGD7n07a
X-Gm-Gg: Acq92OGkVIgBHT8CHtSD6w4m28pInAgS4a2892gpugfJ6fLKZeh8kWCz8UvY2cZ0Saw
	qWg/deqy22SGqFrjKdefLWRTi0ZOTywWlZRZoHYMTo4/uKPwZZrXItuDY2CI6bcpw8daC3ikZQm
	MWVpnpGkP+1h8Baya+6IzQ7Iy8rcYJ2lmQntQ5+tZw53B/l0lxWVDOtPl4+t9JLuc8/jW9dmbW9
	nZCG4ZvT59zQGYd0yPtHoSB6KGfZ+JOZn+Q2IGRRmmhIAmMh4ttB7up6eEbEezNnKwWt9G0ZtEm
	utnlhLG7EtnT57rUKB9A3kCszqC3Q8VWaB352VdQxhEZ7e5CYA7ywSIG8B5zBZEPCX4pbGQc71I
	mY8DafReA+yuuIAMCTR5fBUKHvPORIuoFXOnBGyvI3p5gh4ZUizBAmjYR50yPsUMq/KnAjDLJPU
	0x9U5a5LKoaR+Gv5d4x08mQr8GZhrZeTfGXIyRHT7E2qPSagxOnLzrpwtkDXsHYh960ak7wMNDv
	QP5HQ==
X-Received: by 2002:a17:902:ea03:b0:2bd:9c0a:32c with SMTP id d9443c01a7336-2bd9c0a065cmr47171285ad.19.1778946641560;
        Sat, 16 May 2026 08:50:41 -0700 (PDT)
Received: from localhost.localdomain ([2407:4840:a002:5ef4:c9d8:7ea6:1f8f:17da])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c0600a4sm89346425ad.30.2026.05.16.08.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 08:50:41 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH v4 0/4] staging: rtl8723bs: fix efuse formatting and brace handling 
Date: Sat, 16 May 2026 15:50:21 +0000
Message-Id: <20260516155025.230865-1-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes coding-style issues in drivers/staging/rtl8723bs/core/rtw_efuse.c and adds a missing brace fix.

Patch 1 adds braces to the else clause.
Patch 2 reformats rtw_efuse_one_byte_read().
Patch 3 fixes a NULL pointer dereference in mxl111sf.
Patch 4 fixes a missing brace in rtw_efuse_read_1_byte().

v3 -> v4: added the missing brace fix as a separate patch and compile-tested the series. 

Moksh Panicker (4):
  staging: rtl8723bs: add braces to else clause in rtw_efuse.c
  staging: rtl8723bs: reformat rtw_efuse_one_byte_read() signature
  media: mxl111sf: fix null pointer dereference in mxl111sf_ctrl_msg
  staging: rtl8723bs: fix missing brace in rtw_efuse_read_1_byte

 drivers/media/usb/dvb-usb-v2/mxl111sf.c    |  3 +++
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 12 ++++--------
 2 files changed, 7 insertions(+), 8 deletions(-)

-- 
2.34.1

