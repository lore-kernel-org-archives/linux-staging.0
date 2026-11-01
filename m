Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793558971;
	b=Utgz53KTt1gd3fVgATIuURL0g6+2MBcRSy2Yog++ZEpGd625S1f0OWRI82TIeNYt4rWH
	 aVKtZ3DOpcwCblUGSmw5finSr9e92Bf/BVE+ucedqYaZlDeEYnEi+5fqmWRySs76Cfw+y
	 aR/Pz+E4ijS+y3wSE1WHfpg+goqYKo9JMFMzhHuw5+BkBWfYN0NTbDOSAtUhe5hzKRK3Y
	 HoxclvQLL+QdJYL1/+QZocHCsFz7scMX5ueuqq62tdDsJNE5E2N0W/RuluxMzam9cCBRw
	 6PJzes5HR4TUrt6p/AWIM8gyGZGzHkRfZJYgtItkrdHP+GdVrhv5S9IsmzHQs1lqpJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793558971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=i4kMYe4pF05BAeSRiIgaVbEHMlhyZzqAIkz58RqSejo=;
	b=3P8bHYCxxMW4PcRISpCNd6GTePM/vXz08GrhzXRMdgDgkCY6hEVWgvBb1na5pnSs3OKf
	 XKqJ2kJU2Fm95bnmRTl/qlTkSp21QQSKrxH9Q5i0JGiuGcFSbXe9050BDkPqbfk0xU/Kr
	 5QAHwlyyFo0dzV8OdttDJgsdaAodTz8MM3cig1xoV8KDx8DOMDzW/50nPeJ6q5XLhY/5e
	 jjsm6Pbw4YfvrgYJkdGQokHD/asicyYrPO7lEy2+vFANG1QbPVx5JmDzV2O7vwzP7w5X6
	 Y+rou6gLEngfGS9bXRgMswAMbZIMO5sWJ/oc7mlrdBBKdX4sM4gZbRPdQZ8lL42p0Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YYE95LTF;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0BC606A326
	for <linux-staging@lists.linux.dev>; Sun,  1 Nov 2026 18:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D0BC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YYE95LTF
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e0d1da913so1704107f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 01 Nov 2026 10:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793558969; x=1794163769; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i4kMYe4pF05BAeSRiIgaVbEHMlhyZzqAIkz58RqSejo=;
        b=YYE95LTFX0n9CCjS8nnRtydW2vpypwUTtq1fVsjXS9gAUuff+cjEJzBL4/BfR1Ywps
         NqKHFQtw9M7Top2wE9wLJ87yJIZ4ynddqRgctroCboyDKLUiWD333uRtBuuaDKnIHJfQ
         MqmJfzzL0JL2E49vsVrMEaOOjw8d9FNgh/nNhmR3S2qiGfXSijQCaifdOC/IQT8MkXti
         i8WinRKerMtlrIXJE6JvYNk53YeJwlms9rpw4WMYf6wZ61YQttBwqKv1gBsTb+S5bMtg
         fn3VfVbGZ2o8CNdrsuaZTtz4rfPnr+9EgYD2jn2d7sIB8GHaKpcioox/xIJ2EdUcXGSi
         W13w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793558969; x=1794163769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i4kMYe4pF05BAeSRiIgaVbEHMlhyZzqAIkz58RqSejo=;
        b=lLKjYzpVGxm4TrB1koX3WjPxozxYfPefxRpsxEFyYY5Z/+nKDfmeKF5h+jMabeCTaX
         FX/wryKg21VvLAYpRQqLqjBi8dONTSW2n27rXY0qiHjy+60Jh23XpyO9AscuQ+LWWz+4
         Ekeb8mVdWqPtNxWy1hvIt9MNT49krRlA7K1cqLI92GmuMKvV+I73e+Lb5xImc4W5KIcY
         cfgJPP+0UIULApZmylK09eVjTLSlErPkaf42Af34+rh4brZgkxgQqTGPBpknx1x7Bja/
         0s4Cg4+Z9WWzRe1gO4VlSpF1BBHE6OcajaGUI66Z2maOPvBoBznkS7fZTRl+Wxxa7gUh
         J9Hw==
X-Forwarded-Encrypted: i=1; AKwUvBwGwcG3GsvMMFBDLvqhCthLFoZunOzgMmG0oApXQ/ZLtjjc98teWw5ao7vkVQTFO/uUFQHm/gLQ8HPFOWom@lists.linux.dev
X-Gm-Message-State: APuU4Z943hOm4QarPd32vT72vZvmgWbMcuboABRElEzXKUQfXbXBqASY
	/iNVhJjmfGaVtwGeKEywuxsKInED0JqpWE7q/kW6WojqDThYGUB62i4pCFSOPjo=
X-Gm-Gg: AYBFou1k8zs5ZSSvufTmShL7nAAjt6B92j8N3iZBtGMVg25vtE+pjQNjbsXMIpWWyqb
	ML2wPnTmIbHFeDqyw1ofWgdR993D40OdPxQ+9A8XttdLvHoUjF1C0Bgr0KDnZbg42YNW5BVseBM
	DGiUiF6I5O81NbdRik3r3iYRYchPzTaC3L+uWs89OiTsdTkQKzxIaCdDu0R5PqYo4PwNRPyRjjA
	82tqIG4Td9qr9YwYxzr8R3lLXgEenc+f0J7hyVJ6jGlrzOhhXoNRU1UDdlGDbFhykJ9zC4Q8OpJ
	rpoWz7iQPx64L8tPWAJ3QTCT29Hc95YeUxsVQqDbMg7gGBxSDUXmSl6T5ngy34nBsv1KMwoJT6E
	U063lpjcfOtfF4I2AUzbgoDe3FtK4nXCpP/4NLIkz0QEFPk4kBAlhZekbv/Toi6k4GDPCnU8Il+
	s24rtMec5DPjI9f6q1lBbjak0pnQ6SmYAV/WseUMeeWWWS02GdDlPX4iwrrOXoWhRYBSH+tS1Ge
	E6qGs7dKV3pAR93ytna5ENaSQHmYT4Po9sBfrm2s112v+nk0as/crPkmofuRBx2EtOw0UNlRhEv
	xX2MJgJuynNDWPeeGeS2OrOL7bVijJuxsD4fZYws055EEF0F8hFMru+rdfGiqs8LDfGf8z4oQf2
	iIl6HbliVFpW9j+m4WLOPOjCsXdVAPHcqWABPxg==
X-Received: by 2002:a05:6000:4012:b0:48e:678d:396e with SMTP id ffacd0b85a97d-48e678d39eemr26985417f8f.9.1793558968758;
        Sun, 01 Nov 2026 10:49:28 -0800 (PST)
Received: from localhost.localdomain ([81.199.56.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b7270asm15530548f8f.11.2026.11.01.10.49.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 01 Nov 2026 10:49:28 -0800 (PST)
From: amit <amittibi123@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	amit <amittibi123@gmail.com>
Subject: [PATCH] staging: fbtft: remove unused ssbuf member
Date: Sun,  1 Nov 2026 20:49:15 +0200
Message-ID: <20261101184915.33899-1-amittibi123@gmail.com>
X-Mailer: git-send-email 2.54.0
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

The ssbuf member is documented as unused and has no
users in the FBTFT driver. Remove the unused member
and its kerneldoc entry.

Assisted-by: LLM
Signed-off-by: amit <amittibi123@gmail.com>
---
 drivers/staging/fbtft/fbtft.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index 40a7567df..3b58bb9d7 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -155,7 +155,6 @@ struct fbtft_platform_data {
  * @pdev: Set if it is a platform device
  * @info: Pointer to framebuffer fb_info structure
  * @pdata: Pointer to platform data
- * @ssbuf: Not used
  * @pseudo_palette: Used by fb_set_colreg()
  * @txbuf.buf: Transmit buffer
  * @txbuf.len: Transmit buffer length
@@ -192,7 +191,6 @@ struct fbtft_par {
 	struct platform_device *pdev;
 	struct fb_info *info;
 	struct fbtft_platform_data *pdata;
-	u16 *ssbuf;
 	u32 pseudo_palette[16];
 	struct {
 		void *buf;
-- 
2.54.0

