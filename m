Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD6D3A1CE4
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 10:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772100285; cv=none; b=XyF7Ldq+tRgf/YqPJIS3Ev9CrXtnnBlKL6usfcXgojAr5GeRHeh29AzvQzhMwL+Y5yhpKTB65UojOKPaM0pNre7DlEC7fxdcltjIqXt0X70KXAwCRl52KHrbHvJNekKcBPmNrKvJoT5wlwQ+eabGMCPLz/E9k/s9gvaegUqviy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772100285; c=relaxed/simple;
	bh=yUIFHjXLtZ4TbWU+3b7fyFLi+k2l24+t0x9oLOVYPKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nOTpnJMOYcWSuzyna36i4+ZYT8olb9JBUROrlhhgfdQG2F9PCBk+Iq26qo0SrAvAt0DYfawaPlyPZO8vLLWm4K+KtrJvEzpxTwPF6/XMBBvv7KDQNceI+OGtscnyGMzQmwaKyxAX+W5CtTOMwRyCcGrwOfFMNZcupmTGIFnzRN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ij2+CsEE; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ij2+CsEE"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4398e347a08so13588f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 02:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772100278; x=1772705078; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6zP+hqa+heSkLFBFWEGoJN3JaWx6Vl7LFULLp5xbn5Y=;
        b=Ij2+CsEE441TsQ4PtLC1DZOLTHmjSpnrt5EpFrAhZi3zU4PwRJHhoOutch8392CNzn
         46S+CHhiq48wItwSwli1btXFID6zJktloNrUQLM2mqWCjEFKBI2XOedx8X1Ks6/g0sLL
         XV/yb7qMa49ZvuNV962Yzjq2xGfjA00lewOSeV1zgrvo2h0utPjScrkrDymsCVbK8jY5
         Gjl5y5n06mRN9/bqkH4btODCZShLUtmzKS6SdLyXOrbNN/2KAnHxhUHkLYPA45OZ9upA
         EW4bcZ7Yp55ai8G1arVf+7cuC1G7TajBTIOcd1btU1IeTX5In6ESD+gjSM7k9TlyFJZQ
         JcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772100278; x=1772705078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6zP+hqa+heSkLFBFWEGoJN3JaWx6Vl7LFULLp5xbn5Y=;
        b=f9g70CXAJIPuuWVMgNz0/4eo5MtgTZcy28r5z5XhyuwLw/GNpHk6soq0M/fOaA584t
         Kv51wzfVDk7ejYd11gQhhfmU3VRUu+cHMOjHtZ8bV5WWO30Vypn/EzasVK8b2W+7TfYy
         hDp7t+tnpVF6nImkQdSwSV5xghwQ1fARTWLsc67KIlfvdQmh5RsQP+4bgTHyp7zDzM4c
         Du3wsEGrM8RPign3IN9Umr4MpFoWx07XYsQuAW7Xo9H05kqBB7pLNuttBzBrg7HUpUEI
         66YAQSvIzHsSnRY0p/xus5ZiwCJe9o0nvxppb+P+AJ7h3w49N7wfGx/6rFmSeWYED2fv
         z0mQ==
X-Gm-Message-State: AOJu0Ywz3t+0MWTmzrvwN/E5XY+qrfvnS067vRRYEAzfkT6eULAV7Ieu
	KuGqNHO/y/E+AUD/0CZGJ/z7yGlXkBt3bpRtM6i5APU2l7ebsX7ByhOmnqHF9pNiaUg=
X-Gm-Gg: ATEYQzyNTTE6hSkWfkAKppAL0LaUw9i1WLbBPAx5c21UhyfX+OwRq4zfYIX2iZtdSV6
	wNqcewRYKR6FMNoTkIYCpLivugohyGCvVNH6WxXxR+4la0YrQVOITnGcYVyV8U1hos+LTQBaK30
	QoZ3IRco8PoFEabeKA3v61YvNBv3MjwyeSzxPS2vV+Sbm57rRAaGrcYS+ne8XIu2/tc+XLnldM/
	UINN/vLFB4vE7ix8rA5t0rkll1MLuYhaccidFlZzdaTNTSYTfHpjVl2v7xrN34D5r2wQG6hjpgD
	+Bl5Hr5WMhtCGpPPVX6B8fbssm24gSHxsmtTGRPQnLI+D/of6+32AAJAN+ksuEItkHEoHFE1TG+
	w+PbB18jueIj3sd1ykN4NqT82xvFOjihbnalOG6l+kVptiqr8oYyNHL50kxoi7zLw6xR9dTzJO4
	6UCRzTW2+fBXp8fofyp+4JgEuPP+6jhz45hPi0rCs2GkSRLW3hewk2d7okAPfEWm36VZpAIXLX4
	QX9w5dEk9UkpnIB+51MMjsddb4yWPOTzRCSkW9D0nyVUuwiSdL3
X-Received: by 2002:a05:6000:25c7:b0:439:8f32:8679 with SMTP id ffacd0b85a97d-4398f32882fmr5923360f8f.6.1772100277551;
        Thu, 26 Feb 2026 02:04:37 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43994da2584sm7127026f8f.12.2026.02.26.02.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 02:04:37 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH 11/12] staging: rtl8723bs: remove unnecessary casts in rtl8723b_hal_init.c
Date: Thu, 26 Feb 2026 14:02:55 +0400
Message-ID: <20260226100255.167059-13-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary pointer casts in memset(), memcpy(), and memcmp()
calls. These functions accept void * arguments, so explicit casts
are not needed.

No functional change. Object code verified identical before and after.

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 8d259820f103..bc10f4aecda5 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1185,12 +1185,14 @@ void Hal_InitPGData(struct adapter *padapter, u8 *PROMContent)
 		if (!pEEPROM->EepromOrEfuse) {
 			/*  Read EFUSE real map to shadow. */
 			EFUSE_ShadowMapUpdate(padapter, EFUSE_WIFI);
-			memcpy((void *)PROMContent, (void *)pEEPROM->efuse_eeprom_data, HWSET_MAX_SIZE_8723B);
+			memcpy(PROMContent, pEEPROM->efuse_eeprom_data,
+			       HWSET_MAX_SIZE_8723B);
 		}
 	} else {/* autoload fail */
 		if (!pEEPROM->EepromOrEfuse)
 			EFUSE_ShadowMapUpdate(padapter, EFUSE_WIFI);
-		memcpy((void *)PROMContent, (void *)pEEPROM->efuse_eeprom_data, HWSET_MAX_SIZE_8723B);
+		memcpy(PROMContent, pEEPROM->efuse_eeprom_data,
+		       HWSET_MAX_SIZE_8723B);
 	}
 }
 
-- 
2.52.0

