Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035DE34EF15
	for <linux-staging@lists.linux.dev>; Mon, 21 Sep 2026 05:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789967663; cv=none; b=IgH35WuVxChofVE5AoROQ+YeyIi0MmB3Fy3oQWyd/8jG9JGzF/7tpKuujybHWizLXql0mPsy/nrVj26ogxC+Xt8fwCpJ2J306V3kbN6I/5OCL9DiD+hAKa8/BLZjzi7l1MUkSP19isDGkUcHD8cx5r4S8+neim0YoQogG8PVauU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789967663; c=relaxed/simple;
	bh=YsJeicI+sUiMq44dJSu9w6TxdTn99RxrThcitzMwXUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SHTaoumjX0Fn+UiVvs20BDw9JzvaeNGLlhLqB+arIDQjTp0I+aE8Mi0mcphe587oojj7b8lLlv5NX3rZSsxtfUinxplcKSESs7Qd5gwGkzi2vF1SVUohzJW90TdqfN1sPj9CTxiphJm1W2fm7+hDeYY7Sv9XoAKwHJ/3C5+URIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TzRCBELV; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TzRCBELV"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso1806368a91.2
        for <linux-staging@lists.linux.dev>; Sun, 20 Sep 2026 22:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789967661; x=1790572461; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YsJeicI+sUiMq44dJSu9w6TxdTn99RxrThcitzMwXUw=;
        b=TzRCBELVCy3HsKxMPdRwPpufqYDUdlDz8310sXJl2lbvpNMhWUuqxPlfvq74fnZjAR
         c0wqj+59aJleAj3qOf8bTmBV7kQgWaGrhLP6zZd6TNh6JIiS0H/LRXLAQM9FgR2gXvc5
         1ALxoHxNENoGdSspRFjCL7/5+nAy+Mgmr0KC2rfCCe0tg/JGak9Gr7M91GQRloC2fIK3
         KeB5xTzT+hDSGxs/kTFxvlbX0KNPqYH4+3Huo3Jk+V4k43UDy7AKuSlxmGRPFEvLDGrM
         Cb8j3r98U4guPeWguQMfUlpYlfRPNKh0AXA2/R/5b+uehcv0I2g9C6kh2Upn4+WLzFcr
         z2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789967661; x=1790572461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YsJeicI+sUiMq44dJSu9w6TxdTn99RxrThcitzMwXUw=;
        b=KDEMkAe9B8RaoAfvVirXtPf44sqJHjEPa+LR9lL1ku5+ooUjH5YZLdD2AvIGuKdvqJ
         AAA7ojuK39xSG106QmykpHVyF+e97C2v6wttLpShjb5CXW59zkshFk5FZ8IaKI5iBigq
         w7isp6V7/HcqeBuL/b48uDMUksOxxiI3S9Mw/QX2G7bsiUPA5dDhYZFAzWScwq6Dj3PJ
         DWrWCGdrzUt+n0DQT3eKHfS+Guit+4l0BoXhBJ4R7ZnKIhuoP3HFHNELA+HjY2G6NodX
         MCglpMg7NslxUcR8ALnpZ8kC+xhpiphI3Xs+r1qY8nLtn0GT+Js3Uo6KdAPSvvlKsbHz
         Os9w==
X-Gm-Message-State: AFuF++nALBEtkIzORIPURshqE751jVAN/H2pu5W4fsLU9tKZwOV7h6SC
	7emdYaiCHMZewDQXC7U6ynVuSd/QflWPolwIfletFt5G3vDgDf05hhVz
X-Gm-Gg: AYBFou1E1lAUHNSOo2DUxRckpKdWT2VAS5ZKpiqXB7EeASLOt15r91aGW0tVOF4PSz4
	jK+npoTmpQzIikV27jJpdQBEAl6bgDY9g5NhhiWgeoOROwXmHc0fDiJ7RCnfnSANvZ+vGBu7DIK
	lMGsMKaIf5iOSAW3J7D8Nb0RMmGimk+9ho+Bb7bxZiB3x6agCiKjQEQcrkKFibs9fcr4jxVVoxM
	QsAS5hoHNCUOBvqS8KmbN3B2pxYSWvW00W1vq5X61YQCHzrFjwGzaqw3jHTW4ZCMhUAd1KVCUKp
	zzLJUZbLHtsUed4GkApbhEsmSPRJTjlk1eziN6eOXtYoWd9Od5RNiH8GpMbtsOdP0rE9vfXH+N2
	DK9/QTOma5l1/HJaHYJwSSYfPMsJIm2XQara5wAl5S+kJyBb4ACVaz/i9ssAMrWnnWyGtMDL7Q3
	/TnUzij2u8MCfebGbTtocM500btrCJFMqeOkFYoX5K9z2QNZWygfCow18PNc6CJykc8T05Imem
X-Received: by 2002:a17:90b:2d0c:b0:39e:6c6a:4b77 with SMTP id 98e67ed59e1d1-39e6c6a5492mr9009542a91.65.1789967661087;
        Sun, 20 Sep 2026 22:14:21 -0700 (PDT)
Received: from adi.. ([122.171.22.53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c33142a37sm17698440eec.15.2026.09.20.22.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 22:14:20 -0700 (PDT)
From: Adi Prasan <itsadi2409@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com
Subject: Re: [PATCH] staging: rtl8723bs: fix ie_length bound check in rtw_cfg80211_inform_bss
Date: Mon, 21 Sep 2026 05:13:34 +0000
Message-ID: <20260921051334.1143-1-itsadi2409@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026092053-rentable-affair-bfce@gregkh>
References: <2026092053-rentable-affair-bfce@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

I ran smatch over drivers/staging and it flagged this
function - the check here allows ie_length up to ~976 bytes (1000
minus the 24-byte header), but network.ies[] is only MAX_IE_SZ (768)
bytes, so the memcpy() a few lines down can read past the end of
that array.

I went and checked every place that sets ie_length before it reaches
here - collect_bss_info() in rtw_mlme_ext.c, and the two
H2C_PARAMETERS_ERROR checks nearby - and all of them already clamp it
to MAX_IE_SZ. So this isn't reachable through any current caller, it
was just the local check not matching the actual buffer size. Wanted
to fix it directly rather than rely on every caller continuing to
enforce that cap.

For testing I have build-tested with make M=drivers/staging/rtl8723bs, clean
checkpatch. I don't have the actual hardware to test at runtime, and
since this only tightens a bound that's already unreachable in
practice, there's no behavior change for any existing valid input.

Thanks,
Adi
