Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE55346AD5
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 07:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770364508; cv=none; b=GepJBRfAxmD9bj7yWmbc6iFhGIlF9NnGK7PELW+xKM+RWcWpuTZvDZz0vGIzn/qS6npNRL2OIgUsnYRS/9onDKQfdI5BDKfPpBWHPa73spDTPALfcsfX2RVfROMSecd6XehlEMXamNdRmoPTwmK19AQlBLYHMXZBi8wdOAAUpxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770364508; c=relaxed/simple;
	bh=JzfHCigjpzhEue6O6oT7OKneCtBT0tnEIAdpzv2yHCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fvl2esdr+UyCFEN5WuM7AzENYMSgWwVKF6eM3isnIuPcboqBYF3ZPt1JTqW4lWn+H2AZ8+5ZUWARk8n95G3UFGVhrpqN/YtTAAhsThXCIsNw42b0XDkxqwzg2lOJaam3TBvsuWRUVw2fl0eNc9CavSyoWaOTxLeIEL3RZ12mPZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YR8+gWuy; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YR8+gWuy"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4362507f0bcso903812f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 23:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770364506; x=1770969306; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VEF6A5x5ITOe5grXU3RbVa9iRhWD1z/UXHo6Z9gGSEw=;
        b=YR8+gWuyI0nERUw/bZTAWKfa8ljs/R379KjGC6PN37OkcaFmz/7nW5QCnVF5kS6jcq
         YCOVJnjik+r6PXVUX5jFBrUEQB4sktRpdB184VP/Wj9TgvXRaGdt+EkBJSbXK8qN2m2s
         XFUKOuiWweB36cdiWSYHeT8q7yY/niBnX0n5lF+1FBmgg+JXKrO86EPQpmQrs6uOAuC/
         8Lgd9IEIfVT98096/H20kA6DPT9hPWL62PL7FYvb3H81FTBlLuBnJsUBcGWLkul0YVBi
         7fjKPE4fHjX0yZDkN1NPTGMvX54iW/1bd5Xs+TV2HFCnYthEvjkSWj/r+a+kT3uKRo14
         jglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770364506; x=1770969306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VEF6A5x5ITOe5grXU3RbVa9iRhWD1z/UXHo6Z9gGSEw=;
        b=oRRfhrYQNZLso7X5oxe0DH1A0nyeI0EDHPnLdnC1yZ/ZM5lD9OCEp2hPfYtCX9TR+a
         Ti0RwpDQNQ4zbFGZ0Dcw6/peL6JwnkUksByucnXlMxyMDrYFB9Fu2b2u8gcvSux9zk8e
         +XGGTfD7OmEtycMKaO03gjeRpMC4vQkJukUVDNKlQhfqI4NXfd0jVdAbEPiBHaMXUsc2
         qppcHUOngf17y95iKmMeHu5Xuwp5Hom0gT7TetMWfejfYpHNX7/wMeDatAPKQd9GPJI/
         J58r2Ccwwl5SvfUtmqO0+GQlch7iLJ1B8gnoBaVQkdPzkFfEHG6aYvJgVRwW8KKlJO2K
         Zq0A==
X-Forwarded-Encrypted: i=1; AJvYcCWv7Si9jhZ4fE30hReXixcVyNmxTL+T9xeGz/f/6DY4Op1kYaf+bevNBFcG+h5UkzC9DiMEfdRmS1HV5Yba@lists.linux.dev
X-Gm-Message-State: AOJu0YwHb36fORHg/rI7b4rvHMnfOLaFMsqgA3Qh6npsx56srYakMZaL
	IbyNLix4QocubwbO2pJxsCA7hNul4Mx0g3LeFMb/W8zrbJZACUbrd0M=
X-Gm-Gg: AZuq6aLTPushdCnhoIenKbUt8joscBhDjR+aVzm1SVLqwiha6tn3PE2BcErfdHgNgsb
	Mk2MBo1oTBJOfKNhVEzMo4IUzn8kBnG8iEoaEDC9AE6wrbdoBgKOqVNgrRWq8Fr2OKSgqYCWcGt
	LeQFEIWA2WBEPuTZoWT+JX93R6VNyqk3CU3evA08z5AZ9EiUjJT2U8VtNQaqLQayxvUdh1Y0skS
	sCzc91DMwozxyjhV5vR+5nLeYEiM8ztmnl6W0x3YHMjom6r8xSKeph2CBCkwiKuhxG8QrbDKROd
	6oj3tdO0dmY7SUuVn6rLBUlascU4cNbBw8EyJXHt8AjDEuUh+YY1a9RlYXhtnEMK+s9Z+QIekXh
	sq68x1nvPJiY09uq8krrLvkrSeg0WXWMQeG78/Pck/Iod/pdcmfy9Uc1eyw2GE4NL9myefOMMyY
	pJaPECZwBC0nQP3ZAa+vXWvL76rX4QSsM34HDkQAQhnvFGiOtWDSlOYG/0FFuexvg=
X-Received: by 2002:a05:6000:2905:b0:435:9635:2943 with SMTP id ffacd0b85a97d-4362933ecb1mr3031051f8f.17.1770364506385;
        Thu, 05 Feb 2026 23:55:06 -0800 (PST)
Received: from LGPC ([31.223.131.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd3b8sm3836039f8f.11.2026.02.05.23.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 23:55:05 -0800 (PST)
From: lukagejak5@gmail.com
X-Google-Original-From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v2 06/26] staging: rtl8723bs: remove unused rtl8192c function declarations
Date: Fri,  6 Feb 2026 08:54:19 +0100
Message-ID: <20260206075439.103287-7-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206075439.103287-1-luka.gejak@linux.dev>
References: <20260206075439.103287-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luka Gejak <luka.gejak@linux.dev>

Remove rtl8192c_translate_rx_signal_stuff() and
rtl8192c_query_rx_desc_status() function declarations from
rtl8192c_recv.h. These functions are declared but never implemented
or used in the 8723bs driver.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 drivers/staging/rtl8723bs/include/rtl8192c_recv.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
index 9664758e21be..ac3e08ad53cd 100644
--- a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
@@ -34,8 +34,4 @@ struct phy_stat {
 /*  Rx smooth factor */
 #define	Rx_Smooth_Factor (20)
 
-
-void rtl8192c_translate_rx_signal_stuff(union recv_frame *precvframe, struct phy_stat *pphy_status);
-void rtl8192c_query_rx_desc_status(union recv_frame *precvframe, struct recv_stat *pdesc);
-
 #endif
-- 
2.52.0

