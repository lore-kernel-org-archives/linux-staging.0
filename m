Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D6D18E02A
	for <linux-staging@lists.linux.dev>; Sun,  5 Apr 2026 16:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775407709; cv=none; b=r2rFPfyIcHr6M5stZ8yDZu3UmhNXKo/xiDKLeYvd+YxvM4ttM8nhPSpahpLKOPJvN5hdPonsDdo+Sd/Es7KEC0PjFOHVfzAshFt9uuFkDp3HHrWhXVl4E2YiLBUzGWSQv/YcpIWp2mdR67ByyecOBpXm96oG2vO6kwZyeQi4+ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775407709; c=relaxed/simple;
	bh=vcUcqOdWQ6kA3nCrO8cHjHeWCTwxdzuH/YsOrFVBsEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EshzArg12zEdyU9NV9fn8lZgfBjUIvWxsMPTmFaMB7/Twf/17xynCLdAldt4oVkoeVMRy/1MrAc4CzuwLZFL+ZJigVMwI1mZzhdizFttUzDkeCc4Wo0lqeBE3ljSXMog6dHA8KBNPjOEcD5E/Av4X993uWS5Ay1bD+L8U2bm+cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sS4zjHW3; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sS4zjHW3"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-43cfce3a195so1993371f8f.2
        for <linux-staging@lists.linux.dev>; Sun, 05 Apr 2026 09:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775407706; x=1776012506; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ybY16FKJGCFOfE4JG5kQRq5S9Gn9qgKSBF9P2Z0drUQ=;
        b=sS4zjHW3H5U8evfL7TTKHShamPN086HAuWs5RTQP0DgfGOR8fFWWOblZSfQPSJ4irG
         OQd1BEU1BUTlF8w0/p3UJI7ldkNg94BiUt2NXWdNBSHasoH6o4wSeZjEXoROQbQWOYTW
         FqXiQvbVlSQBkN9a0z+D/o452cEOy+7WNrq1/1Le6V17MByoOZsPW+Qt7t5CHZDkFxWL
         l+MSQeXgwcFcK4bIuC4XrUSgkmJP0ipmsIVWd9j0hgKMhz3+PH2C6bMRj8mIPnbhcov6
         RhG45oAwNCeS8MtW3oPUJALYFuqZPRzaxeAW1DceDQZOR4gcaxXFl5nXKC2Z3g+BqGoG
         sWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775407706; x=1776012506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ybY16FKJGCFOfE4JG5kQRq5S9Gn9qgKSBF9P2Z0drUQ=;
        b=MRWRvKIayEtUwSHjIrT0IqQcRGNcLPwvwcc3qyegWdP4xgBUUjXZ1YrI6M3dVIVsL8
         YVc7wR6SvdhyEqsjgK5LZm6Djd0eL7XNMjeIXMupAzUbDBlG8q19zND2o2AS6SEIjurD
         ep9G99x3koE9uZKkavXWhpI8crVFqZx1lhaL2ftrhSg3AhbsWJrQ0ISU2WxdwJraPpcc
         +7Kg3RguzCxqVHi0895rGaPw/LDU1g6ynoI6YlpTVV+rmpFWbswgr8DLxaUSWebRBg4I
         k+ZvnljQ8QnvNlGMkcG9Q9GFNPd9pYCjBeSUsQ0P5M+q6BY02ObDqOaxZcH9PKVWuttT
         PEVw==
X-Forwarded-Encrypted: i=1; AJvYcCUAxIbxWHkwpn71mTTmDKMVvqp7ZxpHtgbT4U+qNFdf920rnZnJQn9VldLFGZUv8Qabd5Ws1/Wzuo8kjtXw@lists.linux.dev
X-Gm-Message-State: AOJu0YxNU2bR7rIPF1H5mbp+8P95GUUhTIkTHCUF1n+mTMJhy3eOd25o
	P+kljQIGutYuT+a3Tano8MO4V393LXHp4DdaDioZMUi6ZhzR5E2fo1KcoDhNFCPB
X-Gm-Gg: AeBDievCtPvySqzLl2Xh379KP7Lwts/5fR7tPF3aXiDv03v8tkpWguXT/PFPP5fbhQr
	Vnl6UUqx7597sF/NLKDSoY8pxu4zlEeh8SXibAv43CKqALnmepyIUmCL48akCAdd/Xb329D5koG
	Gq1wVs6a5M+f/HwZgJXTtBrWSZf9bBNZTLSKfV9fkn9cuKJ/RMQgBXt4XrrkWXXE78LqPhvxLzT
	GPUNHvKclBQE6H2VdFsrR7b1k1qaX+GMqo0j/664dZ4vM9KjXVX/xUNJrU36RjO8uCcZHdBeGTS
	VRIl3ErzZMPm5yUsWiynP/tcCkGqtEJnjcV9yNsjOZG3b9xlL2zECiYrxjaHIuo0Wd4FCGcawdH
	P8G9f1s/t3mncAqwHyOWlm0qJIKPKUD4H6niQLOhxMpl4GiZAfScLD6P/xCrd7Mie9qHm12YINm
	OcwKXYFH1dcE8CPnfTol2I72csNFGbAY4=
X-Received: by 2002:a05:6000:2903:b0:43c:f66e:f31 with SMTP id ffacd0b85a97d-43d292e708bmr14438476f8f.27.1775407705956;
        Sun, 05 Apr 2026 09:48:25 -0700 (PDT)
Received: from bera-arch ([2a02:ff0:c13:2eeb:2e7c:3a4f:2bc2:f78a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c5468sm33217431f8f.13.2026.04.05.09.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 09:48:25 -0700 (PDT)
From: =?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
To: dennylin0707@gmail.com
Cc: ethantidmore@gmail.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: rtl8723bs: use standard error codes in xmit init path
Date: Sun,  5 Apr 2026 19:48:05 +0300
Message-ID: <20260405164804.5675-2-b9788213@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260405115728.12184-1-dennylin0707@gmail.com>
References: <20260405115728.12184-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun,  5 Apr 2026 11:57:28 +0000, Hungyu Lin wrote:
> Replace the use of _SUCCESS/_FAIL return values with standard
> kernel return conventions (0 on success, negative errno on failure)
> in the xmit initialization path.
> 
> Specifically:
> - rtw_os_xmit_resource_alloc() now returns 0 or -ENOMEM
> - rtw_alloc_hwxmits() now returns 0 or -ENOMEM
> - _rtw_init_xmit_priv() updated to propagate error codes and use
>  direct truth checks instead of comparing with _FAIL
> - caller in os_intfs.c updated accordingly
> 
> This improves error propagation and aligns the driver with
> kernel coding style.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---

Can't apply it to staging-next.
