Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23873AA51F
	for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 12:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785243313; cv=none; b=fA9KmseDxdsn+DEePs1Bp38MJsR3De9Rb7FMvIlJUOKtqltQq1dGg2jepSU5+knrW69eTDOaBmm87FgYznpt7OrmlQKmlN/u5gwXAvf+OuxUVBPuTOBa3k67r8W6o9WS8PWsjC8gXO8b1z50QlpeMTmBKns7Un5C9I1o7mV0ydA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785243313; c=relaxed/simple;
	bh=/+mqHkFHeQZWQoo91PDLcdeK72c5ehlB2OrXUNBlPiw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N/GC8+YbS/anTiPX0Wwoq5kmAZgqevZzQIk4lN6ZKeSS0w+UMUMNeXroGHwXXmEjHTZd9vjuIm16WXmzLcelNxnLGvxTK17D2yOF4FIViuIxkQ2cs5a8hIdI+rks1ByObqHoABIa5T0+X2goB5PXPUvW9Js/xq1mVsbXeBHMjKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rfoyTx+O; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rfoyTx+O"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4954afac04bso43887565e9.0
        for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 05:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785243310; x=1785848110; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z9ileo+nwDNfD8yfsO2EMCCm8J730wo2xe5C8RjlSbE=;
        b=rfoyTx+O8vCDu85paKuToE/uQzlNJ4TBNp4vezMHKhrayjnHXCVUd+iJqghk79BEaK
         jVpAclYLDH3LAest68jexvHpGdj1GTCvFdPwDKZtU2SibE8PWqufJfuwVZwZWq9HlgNk
         yXZ81cjSLNBpgHQN4SlS1zlik45iH1uJ8VFwKTSYHCB9+ro/8RxQvHea+WJZEAKhNnmR
         jkIUo8MJD7PLGePYqSSX1WPnW6szd8i0YTNwiHCs6l4I3marOR2zS9WaUFnpdSmH6g6U
         7rxsBQ8FP3rbrWB7fjSJGxEdTCxBLEUELmL3FYdNJsGHnzAmlgs7y9mSazR9UwflC/1z
         Zd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785243310; x=1785848110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z9ileo+nwDNfD8yfsO2EMCCm8J730wo2xe5C8RjlSbE=;
        b=HLEDwzDwgz0ZUKVrwRPKQtwjRsC2e0nzkh4A0+XK/4he4dGEVhMbRp2rQV20agY+kO
         DLV5wNjoTS3fAb6LQaAjxidEQre1oFAwyykMSXqEfMArGrGjDxSpKd1FZwKLFjWo+frf
         tyhpQDYaxHVmS7h3uitIKcNvPL6AI2lZ/u85D9xBBOgX3Y4Bh3v6vZ1zkE/t+fHnfTW2
         +DQrWob0rQq1FCvh0xKszHxup0cfkPcpVuKKGg2M29aeB3I6l0ZUJz0P5tlBEyIS0LOY
         P2BgGom8soxbnN1U7X0/xf8dKjJE7MZfJmlm9XGSG3UiqKRJyw4U/Nm9yMFYMOlDP3Kk
         kyGQ==
X-Gm-Message-State: AOJu0YxUoqRuTNxhHYu8wDUPBiRPeA+jIySzkaGSRHXBLhShPfjJCw6y
	M/UBb72wVEQApH4bQ2HcYVwRhISV6cspc9N2NPPJY0GacJKZ7E5wXXWKgCPp2UdZFlY=
X-Gm-Gg: AR+sD13CXMRip9jws6fb5gvQEZV/yzqhwLRGKaNlt9JIXU7kk7aZAA2jq7dvcHd053o
	6EPDb/KHshh1X43gs/6igRR6Zv0JYfY0+zy+jbqbBLpQsr7DeNPqkks2omUi3qZICJZPj7zhIIw
	/8ztEU+vsoZzypZGhw9qnmRZZOpaA7zMl2afcK8x2LMYQXPXhxdxsvhWA8FGGXOqEAJGCwIvoOl
	p2cZ1NOY0AfTPjpGPbeqkrhB6EX+uZ4wIRfwHZsKL/bCvnsPLJymAKOliWe3IgUEwoyeKQWzF5Y
	ctQ45OFKFooOiLgT1dwA8siOUb72yHGT2fzDR2zyChakC6Tx7aN1b3wgiW5+fdyejGziO4n3mwj
	EYLWmE/PaUjZDLb2aTGL6zkzvjKmqyULYqT3PtNgzvcTUw/wdM0ZXbftyrbvjzmI/9G14lCkoJZ
	gB2UBc1DrZNzb7Yu1Tgtbrka1ajuojSiQtV4IhVn22reHCyDalKU3x21GYgMdf0wfcpQ==
X-Received: by 2002:a05:600c:8b2e:b0:495:4dd3:ca97 with SMTP id 5b1f17b1804b1-496c659f843mr30259395e9.29.1785243309992;
        Tue, 28 Jul 2026 05:55:09 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c444304esm74096505e9.0.2026.07.28.05.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 05:55:09 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v2 0/3] staging: rtl8723bs: fix multiple OOB reads in IE and frame parsing
Date: Tue, 28 Jul 2026 17:54:53 +0500
Message-ID: <20260728125456.32359-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2 of the series fixing out-of-bounds read and buffer overflow bugs in
the rtl8723bs staging driver where length or offset fields from
untrusted wireless frames are used without validating that enough
bytes remain in the buffer.

Changes since v1:

 - Dropped patch 1/5 ("fix OOB read in rtw_get_wps_ie()") - did not
   apply.
 - Dropped patch 5/5 ("fix skb->len underflow in monitor TX path").

Muhammad Bilal (3):
  staging: rtl8723bs: fix OOB read / stack overflow in
    rtw_get_wps_attr()
  staging: rtl8723bs: fix OOB read in rtw_action_frame_parse()
  staging: rtl8723bs: fix OOB read in rtw_restruct_wmm_ie()

 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 7 +++++++
 drivers/staging/rtl8723bs/core/rtw_mlme.c      | 3 +++
 2 files changed, 10 insertions(+)

-- 
2.55.0

