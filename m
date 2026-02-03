Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1BA30DD21
	for <linux-staging@lists.linux.dev>; Tue,  3 Feb 2026 21:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770153795; cv=none; b=qauvXCuaAgvLSXm1pOYt9e3r57CzELQuWIpL/np0NvnY5WOsy5aM18oP2u9UR9/vQex+lL63/DZ50h0+fV4tSiA39EDdrt5cRjf+2AgnvfoByn4UxwwnP9wCc1bMmGLoMWOsiUOJBcs8i+aBNwHzaYzfSlD1crCp7WhFEEXx+00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770153795; c=relaxed/simple;
	bh=Xdwnu1tJR/LktOJJyAGSmz02JK3s6CZS6Y2+bfkQqSw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nrzLvv3R2iBK/umRfwzXALMg/qs533WqwBWPzTE99LitcM0AXA3G7I1cyj2WiX3PVHFl7+XSE1BepNTJPAvBsgtUSq7cOeAoXIaO6PvMErVUKfholgtMJ9YSqxZQjY8BuQP3mViMcYo8ExOijf8FjM4G1kqHRO4o9UMvhYmGyvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M2Ib/zYy; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M2Ib/zYy"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-88a2ad13c24so1021316d6.1
        for <linux-staging@lists.linux.dev>; Tue, 03 Feb 2026 13:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770153793; x=1770758593; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QUndUWbhdIHwanpBhZ12fokUHE7bF12BnIRi6yojFHk=;
        b=M2Ib/zYyHeiANIU1VN+ynq5lkWENH0DZqXIUZvCkn00/N84ok4z9sElSFTP3yw7m+N
         YgtdgBrrMFqyyLVBs0yRJoz6Q9rxIhX9EshdNqGsNeKTQahrDFB3Dt1LyyGSM5bHEOVA
         d/5dAKuqMjIbVnPWXK4baTUcfGkckJ9AlUqIKH3ezycJJMwEWJYtg6pEC/mIshRjLzn/
         WKQ4Kpk8gnGRJO0O4DGGGem/Oz7TWLANpGAHT4JwuXRF+QDs5Jy1Qyf6h3AeYPAiIC7f
         Il4Jr9GdiLQGfUCwHE1EyLYXX9d7i/lyl/xYdl07z5NJeawjkW4gp+VGnIQj45F7Rc+G
         ihZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770153793; x=1770758593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUndUWbhdIHwanpBhZ12fokUHE7bF12BnIRi6yojFHk=;
        b=ZWCNlsKdNglGXkeDwcnJQBvThd9mEDwYyYmBF1jRA6CyBIQDcxvrLeh+WXdLP135Hb
         egdvin5ZoZJ/sU53ynvobmldP5MrBCpPkFD8F5yq/ETIpLDwP8/iz09jF5aTbZ4fs8B5
         dz3Zv3YLXhA//IzaPmdvKI3K3gKIAR+TaxIXKWwsp0Goo68l0Yp6wnFdL93lego6sQ4z
         tisgm15/+z6RRpmWvaZ9+R+vR5A1TaD43YtWLJ0Ctya/gMCwZtlFnTlb8uY/0iunkqnw
         ukASm+u/5gRgaem89nlSOCh0qxsHtmvVQyz1EJFxPYZGzMT7XoHPYA8YvKtjwZrfzOom
         byog==
X-Forwarded-Encrypted: i=1; AJvYcCX1+X2BNBybKnhLlWQDIHvCUH9zeVYPVM/9eLVT8tUKgISp6YbZkBRoP5wIP+6xVD1XSNpw8rHOdjd0ccrR@lists.linux.dev
X-Gm-Message-State: AOJu0YzP9glVK+wqfC42sqnZ9ri1rWZ9Le1NQNi/h/sms9PoV0PGD1H8
	VLpdvMkSB3CyR0pyv97RI6yet6TTn1YFjyuhTOjiSahcJ0Tas3/JZcOD
X-Gm-Gg: AZuq6aLhzakvP4W6TGSSmqXn0GqvucqS89Vf2OOW+fl+reatSd80XYWBw77aGZ1+PeG
	VfIjZNGRGgH63KDnfuLvPK9cuRmtZoF9+4KOcGgClTRfwJJea9EfStqn4Xn4ujOTk88Te65wdn0
	2JLXHSc6hvVIXjhnBc7LVGeXJaziCqvlfrz1DQSqJJz6itOb58Iw9eNIl4wFScQF40hIImBFJCj
	2OI1NoLo7bt2Cu26hbaVjV4Ej3aMiaGEmS2HJNcC3MXIFz2OmLWeLv3q3wu8Fpaq0z40++n90dJ
	GYa+JxJylHcONNxEkGqMrKo0sWo9YHJIFYx6OnVtjMm7at8kZb7SerF388toPbc/JJZWvyod0E3
	uAWxpcRqtPYznaWIIxP6NksAd71cvOCrwBiveFtE4dl0754HMozU00hu432CUhAcbzsP4lEWYKi
	b5J919yOBA19SrOg==
X-Received: by 2002:a05:6214:5287:b0:895:3a3:b681 with SMTP id 6a1803df08f44-895221e3beemr12210696d6.68.1770153792875;
        Tue, 03 Feb 2026 13:23:12 -0800 (PST)
Received: from Mac.home ([76.64.58.244])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89521bfe708sm5684216d6.7.2026.02.03.13.23.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Feb 2026 13:23:12 -0800 (PST)
From: Neel Bullywon <neelb2403@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Neel Bullywon <neelb2403@gmail.com>
Subject: [PATCH] staging: greybus: gbphy: replaced sprintf() with sysfs_emit()
Date: Tue,  3 Feb 2026 16:22:54 -0500
Message-ID: <20260203212254.90855-1-neelb2403@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replaced sprintf() with sysfs_emit in the protocol_id_show() sysfs
attribute func to prevent any potential buffer overflows

This is to ensure a kernel-wide migration to safer string formatting
functions for sysfs handlers

This was compile-tested only (no VM/hardware used)

Signed-off-by: Neel Bullywon <neelb2403@gmail.com>
---
 drivers/staging/greybus/gbphy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbphy.c
index 60cf09a302a7..55f132b09cee 100644
--- a/drivers/staging/greybus/gbphy.c
+++ b/drivers/staging/greybus/gbphy.c
@@ -31,7 +31,7 @@ static ssize_t protocol_id_show(struct device *dev,
 {
 	struct gbphy_device *gbphy_dev = to_gbphy_dev(dev);
 
-	return sprintf(buf, "0x%02x\n", gbphy_dev->cport_desc->protocol_id);
+	return sysfs_emit(buf, "0x%02x\n", gbphy_dev->cport_desc->protocol_id);
 }
 static DEVICE_ATTR_RO(protocol_id);
 
-- 
2.44.0

