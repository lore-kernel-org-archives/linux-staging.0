Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E10E481FB6
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119849; cv=none; b=I7oKp2IPxlTpiZPXTtO6U2MDN9i5FFi5Ns3nHUyFYIuHlIsFsHKH4CT9kgpxRjTcmoF5PXW0aYX7brDbAyBeqhaAtl92vxEzgFZ5UQXJsWVpx+ZAQwlh9HBxS/anyJETuYOqSZ6cRiNftZWC6DnsF8ccsHej/Xf0j3TeYItv2ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119849; c=relaxed/simple;
	bh=jaa4xZ8buzO1FgNdxtRxTtKV88KgOH4L50TBAJ0fgBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jBce5mU1PHlWhG/Q8SbcqeQaYpvP8gPjXtneMqKvVR7QxEjBMzwyvmg986/7ZJlOa5OpNnSz6H28Yheq0EzRB+cGHTMTp590tBU/Z938yK2UC8KXVxwlfigjsVJJw9qv77AZeCkvW2xrVAxHDQh5Z3C4HAIr8q0pB38L13jkU48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WUZ0TTrV; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WUZ0TTrV"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so7804324e87.0
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119842; x=1784724642; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J4DZ1Y+35tqkPvEDsXNQFAF6mIcFObOEtgy3lw4FCmI=;
        b=WUZ0TTrV5FCy2rdZ+YS2DqOJd2RwkK+N/mumdVELeqn4BpDIX9Ys5QU4uVkO2k9A1C
         m56Hw03zbh1w0CYsmVkMqCbS5db8I44tSdEwsV8cLXrQ1ON4TDmR/89nzRM292tnvAe1
         PlL+ovz/sOP7f1Ogu+HJbTPCAxawrbELnLe6vpelc4t1fBZKwahFvZl5ohwaxBXSQH45
         Tfjgso97QbijG1OLiPT30w4Tiz6OfFJInGuvEw+6qq73nqk6CZaVSCg8kwqs08bap2Qt
         toV3QoMWlFtq/Sc1qvfrUPr2RIcgcIOl9xjUVBo8GbArQvY+LyedvegiLQHZMXVpyKrQ
         hd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119842; x=1784724642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J4DZ1Y+35tqkPvEDsXNQFAF6mIcFObOEtgy3lw4FCmI=;
        b=i/nf47O80uzi+l+J6fBQU1atTDIlFF7Bx0jXX/9nfQ8Y9Yt6CkNDtl/aKnxi/9on1N
         jCyXel2RCRlpT5cLVq6TOc16nI1ADqq59FbezDwvdQGrYH6JaNZy/AYmoOG8LD7dctN5
         QP71OgT/PHv6FdkCxRbWu0aEg7sX6I8oZcX4WKyCN9gD3ez0Lr2RxyTEKL4n6sXPSesh
         btuORc4SRO6lJqgAl7W+TNVSuJ3Z9/+SBRPWWcxadvKk3yM9tlVf0kpfT5TvDWRyk5kc
         ZXCV3Xtzg3OTNfmXkbJGjcgJoXIFV20rQLshLdC88Y8B7UPSwTfOZu6Ym8Bgxtc+66kb
         CbnQ==
X-Gm-Message-State: AOJu0YxRiqaJOrfHLTu3n2CGMM7UgHRWZd4mgJ/Hk6Ar/iY3o5XtDbfi
	hP9aJ6xl+6paCjRdtmwoFybdXN9A+iozk64Tx8Msq05rEs7I7Q59vMOa41sYactcYtk=
X-Gm-Gg: AfdE7cn8bnqYSq25tcCHT1ghfzjBlLkPrlcej1ik6YLNzSv2kywPGRzkQs1VQhQPANg
	Vm11b+85Raa3stCb8SU/aOCxgqUUflmi010ExY4KPYhN/yKYc1XPlvegnzkRwS/5uNRwz/b+BFp
	8cIolKMXp4t3ODZovU6gHSGt909cjRme6cVMk5rSApKKXM7DzjCzUSi/sFB7vVlrkD31/sQedgw
	8xFxQdrfzTIoDEHDfGiA4KwLwkK8hOp7syYSmWBt1g7yNGQKU2CsN9Gf2wfYtc/ZZnITSXELiK5
	HX1VN8r0Qv0XySk+3KtRqyJahjgaXgdiCv37Yv4vxYqy/5zJZN5m+jMJV5blfblzOxLMLyLRLhP
	Wr58taxl+IgaIAFy9xVfSgyS70nDW+UB+KxvQKEgREMn2mXkPhLv7Tq8phi5FBYE6NeEIhDngGA
	QpXp+FYAWvW1Td0tjU7GEDd9r9eiNOxEvEIyRtiN7vcPL+pVAUy/ea7u3zyWbRvtE/r3h7w81+q
	Kq7b61EwlwMIZ6T9rvstzSh
X-Received: by 2002:a05:6512:3f3:b0:5b1:1b50:7232 with SMTP id 2adb3069b0e04-5b15825966fmr1325260e87.4.1784119841590;
        Wed, 15 Jul 2026 05:50:41 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:41 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 33/61] staging: rtl8723bs: remove duplicate prototype of rtw_free_network_nolock
Date: Wed, 15 Jul 2026 19:48:01 +0700
Message-ID: <20260715124829.90290-34-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the redundant forward declaration of rtw_free_network_nolock()
located directly above its actual definition in the source file.

This duplicate prototype is unnecessary since the function body
immediately follows it, and the proper declaration already exists in
the corresponding header file. Clean this up to reduce code clutter.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index e86a4e83b..73b20a78d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -302,7 +302,6 @@ u8 *rtw_get_beacon_interval_from_ie(u8 *ie)
 	return ie + 8;
 }
 
-void rtw_free_network_nolock(struct adapter *padapter, struct wlan_network *pnetwork);
 void rtw_free_network_nolock(struct adapter *padapter, struct wlan_network *pnetwork)
 {
 	_rtw_free_network_nolock(&padapter->mlmepriv, pnetwork);
-- 
2.55.0

