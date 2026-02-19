Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CB134E762
	for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 17:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771521204; cv=none; b=pWY78ebMHLGRaoFFm0Mgs0YUorJYrSSfrLbO8Yq3/me47Sn39+xilO+lu9bQDbTmhhHKpISD2Jl5sQKRroOilJ1xqbxHRJmStzNLBjZwVDrlulZj15W+pZ4uudGTe64Yd/t/hFp5F15UyR4K8aBFEeh4MbnZV1/R7tfkiezG1ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771521204; c=relaxed/simple;
	bh=BfuWtJpHFnoUxb8s7xJBVcBtioNVHYkElOeeOAD1d8Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p5ehEwbHY4kJ7YxDXP03BCHFWzKxqOUKbJVmlEhV0p+bNcVTL16mQRmBKd617smXI3zYzrG2saQSrjSr9gTnqQKSg6GMrsNgAVHet/zAF8WoIv+MlBTlTON7yxZrhbwJ+ppQ9YkgSz7hgVO/IuRaFKACeT2nLOWrluU6nnPykuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APZeZEGG; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APZeZEGG"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-824ba8f0acaso801910b3a.1
        for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 09:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771521199; x=1772125999; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGAsWoT0ij2AF8u7lzQ99aTp0zEqYgQwfONKoWXhuNs=;
        b=APZeZEGGwVE6csKDasIye5aLAAPRGlhrVS5S/7FXQ659D9aFuL77rCBPqsZMpUAJPJ
         wXThAJlklMk6zJrP+e0r+fenE6SJWOljnZ5a7DMQyzw/S4N6Y+u9HueWl+SZC8ll1Ik5
         ytB5aCdZg1FohDlpPb8bVhxm5Fajgev0Wp3qD959+lzmIiJhEb2tT9OErUI6dSDQyY8x
         hzDg9KM7eJ7HTOlbc+XcwedrqieJyK+AF7HK8rQJb6BgVqbg7Em+wajf+Aau+p4qHf5N
         IBmn7RdM6ap7sUqQ0SwcXh/TFSfuVI8JvGiYLshlrwY5EUO8xBED0Lhv9Fqyntbanw/J
         CHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771521199; x=1772125999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rGAsWoT0ij2AF8u7lzQ99aTp0zEqYgQwfONKoWXhuNs=;
        b=FXY9DXOyd9KfurE+g/VUGWlBz7BpomgkAuPhOCMi3NcKE6SeoSPEr/bAL7Wkwno3GU
         29FZK+UEVhDCmHbnfF02xwmwA37kmWZJAiU349y6SS1uiBVZ+ArbLWwAL0bErAdKYoVz
         Yrpofkv6MBYOTXf6CjgrcuZIqtUiFjHkLWebztIEpp5g21sgD3vHKnv6vTHDCRxFCBVr
         z2a4kx8ZU5Utmo4GEGzjTu/7KDtv8UBinI8yyq+/QIJFdFhR3AGsY+CajpcoBadz+sMu
         gLfSot8E0cpigVfdspSd8cvMyO3DfUtuqT+Y/HGrIlaqgscfaUsS5BIyNgBa7jXgYl3B
         gxBg==
X-Forwarded-Encrypted: i=1; AJvYcCWFeOD2mILCGjJOe7njC9Lzybx+ehsPZ5JBMcyOQhHfs4Ugd8jLLLEKT3oJbAtEiSvgZVgGo90u6sn0Zcrx@lists.linux.dev
X-Gm-Message-State: AOJu0YwDi2oCUYrOmSu80hQ7E18z9bh9RxCm4QOknwAWp3yCHKdRudGC
	zLJJ96gLw9XJhIKV3+yunqqDewgVofrK5rVrB9ZJ4SmfR837C87j7Mg3
X-Gm-Gg: AZuq6aIW3T1q5okIMlSAiKDHqOmI6jTdM5xqHvqUcVZ6ie8WGbqIVVVXhRszaidSmS6
	ix4Adc47pGfLCdlRayONu/4jnAmECrrlSf9t3LBxwTSFNxd4JMKns0aQd0hufLftFGIFQDZNUIP
	HTDaBk+YLmgUre/DP87gaVLGLdPBCKP/spimfEZ9XYGiSxdgbD7G++mXDQHmXDpU6hxaFShl0yg
	JziOwvy0DM4ffNz+UHXEjGja7WpukD0DnY4yvbqodwaIC+T5upHYJYPyGeWApO0TWdp/dbkd8za
	29mOOaxyrgNOITMkLbkb7MURJCQsDX7mqSF5r5H3z8Z4zr7YBGGoYlETYcBNVaUNaLd4DRILjA3
	sTiDl+RjDM6d7N4pXidVQ1mY8Q/Cu09/2zD0PMK6O3bPG7F4wvQFNjjY5mZqZYjL6OLc3r0QhAO
	TyGvIGRlJ6x5Qrh7FAMAMRGn4I7xe1lVGiM48MJIcAULg9ZobvJgcsi1lxJujI
X-Received: by 2002:a05:6a20:d81a:b0:366:14af:9bb4 with SMTP id adf61e73a8af0-3946c96fef3mr21545093637.62.1771521199469;
        Thu, 19 Feb 2026 09:13:19 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.236.165])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e532fa2e5sm15895002a12.26.2026.02.19.09.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 09:13:19 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: stable@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	Julia.Lawall@inria.fr,
	akpm@linux-foundation.org,
	anna-maria@linutronix.de,
	arnd@arndb.de,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	luiz.dentz@gmail.com,
	marcel@holtmann.org,
	maz@kernel.org,
	peterz@infradead.org,
	rostedt@goodmis.org,
	sboyd@kernel.org,
	viresh.kumar@linaro.org,
	zouyipeng@huawei.com,
	aha310510@gmail.com,
	linux-staging@lists.linux.dev,
	Jacob Keller <jacob.e.keller@intel.com>
Subject: [PATCH 5.10.y 01/15] Documentation: Remove bogus claim about del_timer_sync()
Date: Fri, 20 Feb 2026 02:12:56 +0900
Message-Id: <20260219171310.118170-2-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260219171310.118170-1-aha310510@gmail.com>
References: <20260219171310.118170-1-aha310510@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Thomas Gleixner <tglx@linutronix.de>

[ Upstream commit b0b0aa5d858d4d2fe39a5e4486e0550e858108f6 ]

del_timer_sync() does not return the number of times it tried to delete the
timer which rearms itself. It's clearly documented:

 The function returns whether it has deactivated a pending timer or not.

This part of the documentation is from 2003 where del_timer_sync() really
returned the number of deletion attempts for unknown reasons. The code
was rewritten in 2005, but the documentation was not updated.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Reviewed-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Link: https://lore.kernel.org/r/20221123201624.452282769@linutronix.de
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 Documentation/kernel-hacking/locking.rst                    | 3 +--
 Documentation/translations/it_IT/kernel-hacking/locking.rst | 4 +---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/kernel-hacking/locking.rst b/Documentation/kernel-hacking/locking.rst
index 6805ae6e86e6..b26e4a3a9b7e 100644
--- a/Documentation/kernel-hacking/locking.rst
+++ b/Documentation/kernel-hacking/locking.rst
@@ -1006,8 +1006,7 @@ Another common problem is deleting timers which restart themselves (by
 calling add_timer() at the end of their timer function).
 Because this is a fairly common case which is prone to races, you should
 use del_timer_sync() (``include/linux/timer.h``) to
-handle this case. It returns the number of times the timer had to be
-deleted before we finally stopped it from adding itself back in.
+handle this case.
 
 Locking Speed
 =============
diff --git a/Documentation/translations/it_IT/kernel-hacking/locking.rst b/Documentation/translations/it_IT/kernel-hacking/locking.rst
index 51af37f2d621..eddfba806e13 100644
--- a/Documentation/translations/it_IT/kernel-hacking/locking.rst
+++ b/Documentation/translations/it_IT/kernel-hacking/locking.rst
@@ -1027,9 +1027,7 @@ Un altro problema è l'eliminazione dei temporizzatori che si riavviano
 da soli (chiamando add_timer() alla fine della loro esecuzione).
 Dato che questo è un problema abbastanza comune con una propensione
 alle corse critiche, dovreste usare del_timer_sync()
-(``include/linux/timer.h``) per gestire questo caso. Questa ritorna il
-numero di volte che il temporizzatore è stato interrotto prima che
-fosse in grado di fermarlo senza che si riavviasse.
+(``include/linux/timer.h``) per gestire questo caso.
 
 Velocità della sincronizzazione
 ===============================
--
