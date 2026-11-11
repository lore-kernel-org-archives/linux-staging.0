Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415145;
	b=g8qP0AhpI0E3Kf108PQGPhCQhrhzGKMx6SOM9bupv90CDiYFxrV3r51lrksMIUOoS8SH
	 Cf4lLPrHqFoK8lKBDdf6NLMa0EHfCbCb/U/FCGeFsvCOMuYlcaDWlLOIr1RI/t5Vdj/bK
	 0exSPm4ON+ZOH9Se6R2HBRES0G8N0dFIdVV9oSkt66RqgZ9qcUi+ailNMR1P3ao+SZhJ3
	 5sdjxKKyxvrrJhHhoJkULLWzYttJPOaZP16waTGL+TdzYgPyvufPw/QLkx1LPi2vdL+IL
	 gF+/9J1Xa5lv9FUiqJfq/B5zN0tD3ynVRi+yYUpiOAV3XigwMeKUl25ljysV3fXVsoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415145;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+GAFVM+nLFUYlbY24SmfVdNvtcwr0CEHKsDIq3Mqz6E=;
	b=dbjCp6fMePgTxEnCsgVmqG73UZdOwffkJIGS6cYmPfQsQ9kWy64JkenTXFAOGp8gQ/lp
	 Kv2gE4Fswthz/AZGuZGZOgJsVTVrVexLv1mnimm5kjsqzwsOC7dq1bsLRkzQk7xOfCQhp
	 TMcETGgmrJgrc3i8pL1DDTSAKakB0j5rTJyPKYbmEQ5/1nnfPB/W1cNy1GmJcmGuLrDw5
	 biq/tO1wrA9U4/p+rSrMYSJtbig+WhjhiZrVjGqv7wpimpa1Tvbo1JFVHYcoK9Dgy9P/I
	 RKf17PjMT1GKX7GNILKsUIAYMWq4i0PR1anrfadW0PxA2XLyIub/1kpb0753VH22jjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EUrCRAWz;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E435C606A326
	for <linux-staging@lists.linux.dev>; Wed, 11 Nov 2026 16:39:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E435C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EUrCRAWz
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1a2761c69fbso5665431c88.0
        for <linux-staging@lists.linux.dev>; Wed, 11 Nov 2026 08:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794415144; x=1795019944; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+GAFVM+nLFUYlbY24SmfVdNvtcwr0CEHKsDIq3Mqz6E=;
        b=EUrCRAWz89ZEMALF7ZLv7V/r+TwAR+ugSnjnrCxznzQIzxSLq7uzESxLmmGbLMLpUq
         PYLEqfprwVqFkiwTYnBP0nYtPWmRTMpKM1yMqf+wi151yW0KJ8f3ZH/ISswhs12n7U+g
         Vby55Kx0nbTcWC11NkfIRY46Mf3P3KysOzTRi8/RljluDv6FlXtpufMbtJzveN/Dm6Qh
         +pufrJ6VmqkZHd4pCASprME9hx77+v8gF24Iw9xiwAk/Vrzhmac/GHZJ2FpfFCZrdY4k
         imMshPElFVrN1C8oBJbIzig6uN4pzscIxO/K6Nu/noALk7XV/LXwtG/GOH4OSXpYZRJN
         YMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415144; x=1795019944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+GAFVM+nLFUYlbY24SmfVdNvtcwr0CEHKsDIq3Mqz6E=;
        b=uDElTGBbo+r3LCpk/XDm0cQX2yOOPVFdkU+7jeVQlSu+GVooTma5FPAXT+tZjcLVvg
         Efg7j2Mg1YUJHYQvkTZpxgy66yNL0Kixedzj2bZPHSZeQksIShjuQhiAzxz+nDjk5REi
         Y4Eyv5ESq5Mbw94nAQQevtCPUovub5mm1T+tyroH3A/Riwtt1iMUgxy1gRxZWGCVC5p1
         5TZm/aNm0YeGspN7A04jIn1s/wc1qpwBUv97K/uLH38idApOfLpvYbW5kUpJ4jOXcHnl
         jl1qsJO58YHH5t1tzulOyeZoGhfDzAqd9Eoob9ax0gVQzoyAHSrtDZOCo9/M0YNkpyrK
         5Glw==
X-Forwarded-Encrypted: i=1; AL+hErE156yF223NhOFn34yFnGz34rQnfK/LIBjajz65LIkIlVkH5AvGAWgc8ikVF4JgW2JUecZciHIWDIhHgIWN@lists.linux.dev
X-Gm-Message-State: APuU4Z/ZBVLbJV72ldGIUq0YyPTLLKSL0QTjVEbEcVRyweSaFz1FPOcL
	A9/olf0yUB3fx0IeeM+J7kCu9lkE56OqKBYnScIRPXgdMDey4B2RVqQR
X-Gm-Gg: AYBFou07zrN9fzZE+MyP9cEX0RhhtWeGDCXNL6CAwa/0zbjdNv0WCz25KM7V9XhseHW
	ajuCvRjsOfXgVvGvKT8qRWZwOKVdxA9r1OS+LDozd/pplnn06mhk+lUblmKRGmEsR7Wh+hrVSsN
	yRhpcqCG/1VEc+NgubgklqT7OroqYczKPS9DosXukXjhSeA/RxASX0Xtpi8FhDELnERF0GD3ZJ8
	jJL2aJtdYK3rVeaE8Hnu8I9/6pItgd95dsKrcIovcSdFcF7N01lwxpsx6SeY51TgjMkRUEdxDIX
	tOIb+FvBROgeqL5LHfRplZeo1tPPrV8UtddBqfCnT1UDXY5q14dKmLsD/HM2+y1/qF5LlFw629q
	SPnK9swYS3U4ZB+vyCvR05A1EE5pqZSHFPnIjncuIc1m1Zob442bx4rMczyulD7vdalxBfbJOqN
	+dAovxtxIv9USc2+RZ086NRHkZw0DLG61Q/ALrf/dypju2nlBwLgCkekM1ex+ChEjGietL+aQda
	YQYHXdZUWjaWXRymFwdb1nKTkEqH9RCbSJiM87kHeR5eEeLT04ERpfjymdeKQ7TIkQmHUtH3tTF
	QAh4L4L5wcVok0627R41AyhqVQnjNVGVemIfDj8L1qD7Ke4=
X-Received: by 2002:a05:693c:8201:b0:376:98e7:eeb0 with SMTP id 5a478bee46e88-37698e7ef92mr3137525eec.7.1794415143641;
        Wed, 11 Nov 2026 08:39:03 -0800 (PST)
Received: from himanshubakshi ([2401:4900:1c2d:8feb:6d7e:ed5:ad5f:62ed])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bf3e18sm35046496eec.16.2026.11.11.08.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:39:03 -0800 (PST)
From: himanshu bakshi <himanshu.bakshi478@gmail.com>
To: gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	error27@gmail.com,
	cenzhang@linux.microsoft.com,
	dennylin0707@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Himanshu Bakshi <himanshu.bakshi478@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v4] staging: fbtft: remove unused fbtft_init_dbg()
Date: Wed, 11 Nov 2026 22:08:19 +0530
Message-ID: <20261111163819.143147-1-himanshu.bakshi478@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>

The fbtft_init_dbg() macro is not being used, so delete it.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
---
Changes in v4:
- Add Reviewed-by from Andy Shevchenko.

Changes in v3:
- Fix tag formatting as requested by Andy Shevchenko.
- Add revision history and testing details following review feedback.

Testing:
- Built the fbtft driver successfully.
- Verified that fbtft_init_dbg() has no call sites in the kernel tree.
---
 drivers/staging/fbtft/fbtft.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index 40a7567df1eb..16459e4e0ba0 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -420,13 +420,6 @@ module_spi_driver(fbtft_driver_spi_driver);
 #define DEBUG_REQUEST_GPIOS_MATCH   BIT(30)
 #define DEBUG_VERIFY_GPIOS          BIT(31)
 
-#define fbtft_init_dbg(dev, format, arg...)                  \
-do {                                                         \
-	if (unlikely((dev)->platform_data &&                 \
-	    (((struct fbtft_platform_data *)(dev)->platform_data)->display.debug & DEBUG_DRIVER_INIT_FUNCTIONS))) \
-		dev_info(dev, format, ##arg);                \
-} while (0)
-
 #define fbtft_par_dbg(level, par, format, arg...)            \
 do {                                                         \
 	if (unlikely((par)->debug & (level)))                    \
-- 
2.56.0

