Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1146B288C96
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 21:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772401712; cv=none; b=iQtKXP3VD/x+eyn0S5Lw2JKljaSgj9nNJQMfxuaTtrajd8wl/x9IARtWtfzUMWd2nT9ZOLciLEockXguKoyxwbt/ayn4a/mBRe2tszWxhug99fPWV92q88zi5G+7WjeeNBJq1L25P3CDM0VuKFrGe+NbPHs7WOMvitDvzCeWE90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772401712; c=relaxed/simple;
	bh=+9b3RjJkx5ng+Illn3o+qPPQPwbVvRmikTuJPQko6YE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S3+xO9N9GHW0LX1g5NAQN1+z13HK7l8jTNPzWKnCMkJ1VU/XlzNmm24T9d776aYlog0xTNrzW46dJKMK3L3Wwqd/v92fDtOQ6gllasIPLL8kUmHnPS+YcI/OpTVm7GNfkPsGIOxNBy+wptvjjofsGzJj+iGCf49/6NRhX66WhvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q5ZxWk5A; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q5ZxWk5A"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-899a5db525cso34165176d6.3
        for <linux-staging@lists.linux.dev>; Sun, 01 Mar 2026 13:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772401710; x=1773006510; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/GuaQ80a/gKvbwXHclhflMNxiAA5Qw59zxd823PAwA=;
        b=Q5ZxWk5ArierjJclQ58t1H8XfM7sn0U1EhTRh5nqm9YvN+c4uo6Be6B4rvFqi7pcqT
         cFSVTs4CyfjvC0/f1523CBgCUMySsxRqnetFu+rILgHwQ/yY3IbC74NWZFlb9In2AP26
         etbLajHBT9Nq/fXUIEoFNABR7l48dtGVIL+LZaJ+LnbZCA/hCHHOsT3StBTSMmsYjQ+d
         +1OphSLsfKZ0TyBvQpvVa4QgRJe8eS+hNQaPOHM1SUQE3Wa/zVuLpYF0Ec3cEmJG7V+V
         V9m92iSRaCUN/Mn9pWpe/z3ZgF926TP9N0aCVr8Uex1aSKjJUjkbAkwSD9mRNaq5Vf6x
         PnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772401710; x=1773006510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6/GuaQ80a/gKvbwXHclhflMNxiAA5Qw59zxd823PAwA=;
        b=WTsJqoZJGJki3v7F6qwdQ4fuLPV/yYLCj2maYM9nN3YClYr7X9SbIV2maEqZdyIb/M
         /AaKryWZvdoE1ktWqvbjeC81C29DOIZDmwrfisZfcQ+NxXuoSre4SgYTlUELFI2m8kvA
         AIqSIhSxN3l5/UVfJmAnNy7ZnXPSaTIAbDrMea9332HnufTJ6N6dox9CEv2iifGa6hvT
         aeSQij4zdv906XZUyCRjFydNgkNt0SC1k+5XR3qLIUti+khqUkRpZaB3Ct9iKR+G2d/E
         wY4X2f2KZWEk/oeH1HdWyG+5A43ELb+oybZwUUG/uyW8WQTlFiD31q8NUKMAzMXBP7Ma
         NDNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCPlZPVeuLQTxQdQkwZ9RNJBb6fIHw42G3Qt7kg5FhMYxc8ghGETXfeSvPzpcjD6X9yToUq1ah3gm+wqA5@lists.linux.dev
X-Gm-Message-State: AOJu0YxBtFbSal9tcFlFoTaCqcXEDbIzbxwqHYnoifsfcVm5oOQHg4hm
	E7wwhw6hTApLmbX7T/7tcq6DhDd7YgvAn+AgM0qclPoVIZ28+tqnlLWx
X-Gm-Gg: ATEYQzziDfWN/BdIkPP97FL2HPiaQborPniaEw/w17zDzfV1hES8g+OvDleYlXvLkl7
	LC++YiXT+hUxMBVC1wkwNtIVIgJ/3o3r7fL4Sj21DccxtP/adr/s+poHr/6vFrgMH1wpIchISeW
	2NefVNEFHRZ3AyQHbchVpMVNib1s+Ml6xKrqkmlB4wmB9G7jd2C+j0JOwyDFTwm4UjOLuV9AGAz
	4HuNyzaisxcPu09EUQ6GDdemlfbC1BLu8YesL0aseOKQTvPb6UyCm6qhU+NVg2Sksb42YbdXZnt
	KZEiZgMqbi+GyoNYoxCGhk4utBVX3ZTEU6rvWrxwQL0TKqxI0kxxp2tjhSWCYeZcL9ntLgwnHdz
	1upWwZ16Qb2X/ml7pZ8fFI3qFm/6uDsOtX2JqFl/gt9xVeIzC+jL3BvkoYe5xtaq0FUvOyM2Hdn
	WdCpeX+4q/3RT1zTNWsNRHoMCQ+IRuYmgLEuL+W0vnOc5sd9dKe36ootP6lm8Jo61NkL2eunfbh
	tAT
X-Received: by 2002:a05:6214:21e1:b0:895:4b4f:133a with SMTP id 6a1803df08f44-899d1d8459dmr153386746d6.5.1772401710043;
        Sun, 01 Mar 2026 13:48:30 -0800 (PST)
Received: from instance-20260207-1316.vcn12250046.oraclevcn.com ([150.136.248.187])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf6f948dsm1006700085a.30.2026.03.01.13.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 13:48:29 -0800 (PST)
From: Josh Law <hlcj1234567@gmail.com>
X-Google-Original-From: Josh Law <objecting@objecting.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: Gabriel Shahrouzi <gshahrouzi@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH v2 07/10] staging: axis-fifo: fix grammar in Kconfig help text
Date: Sun,  1 Mar 2026 21:48:12 +0000
Message-ID: <20260301214815.2628942-7-objecting@objecting.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260301214815.2628942-1-objecting@objecting.org>
References: <20260301214815.2628942-1-objecting@objecting.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Josh Law <objecting@objecting.org>

Use 'an' instead of 'a' before 'AXI' since it begins with a vowel sound.

Signed-off-by: Josh Law <objecting@objecting.org>
---
 drivers/staging/axis-fifo/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/axis-fifo/Kconfig b/drivers/staging/axis-fifo/Kconfig
index f180a8e9f58a..e618f275e283 100644
--- a/drivers/staging/axis-fifo/Kconfig
+++ b/drivers/staging/axis-fifo/Kconfig
@@ -7,6 +7,6 @@ config XIL_AXIS_FIFO
 	depends on OF && HAS_IOMEM
 	help
 	  This adds support for the Xilinx AXI-Stream FIFO IP core driver.
-	  The AXI Streaming FIFO allows memory mapped access to a AXI Streaming
+	  The AXI Streaming FIFO allows memory mapped access to an AXI Streaming
 	  interface. The Xilinx AXI-Stream FIFO IP core can be used to interface
 	  to the AXI Ethernet without the need to use DMA.
-- 
2.43.0

