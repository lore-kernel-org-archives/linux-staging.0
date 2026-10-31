Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793420636;
	b=pNmv9LfAg6nTzW+GHUXpwyl4CXmPxAXg6qT9IvUgh4hAmM1XuVNo3qibbtm5DO1ha/ZO
	 EmiVYIAhdaAFp23EK/eXYv6GUyk06VGGY1VN5N0v76nfohOiEQNZ25Jwbc63+YndVkEyW
	 MPqnODqbv8me2S7N5duWhdPIi4ISwfQfDwiyRkstV5MAxPDbMtWtT3KBypaRt8JDma+0P
	 qxGSxkxH4EjE0MDSwnh8JoU/g3qGr69TKPXttw/ftDTsv6sVh/YkHoHAVfa+rUrS7pZZU
	 Atk2m8kMAfMhtfaniFgoXqQeJn7CjZ8inNsWRxLKMT/J2fdQqILLaUuw4tajka4ZueQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793420636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oyMiLoLSdUtmLwvkMWGKLcY+WxNb77Nh3Idx5n8lKi0=;
	b=OqIrgrzzNok+BuQ6LoH1etaPf1XGan59+WVyLB82qEoU0CHvgYUBXscnl4KhQDdhp3jz
	 eRfSIu0ugjtzv4gy4S4z5T6gB5mVLTV+4c5WRVlGKD7ez9Cxp1jFQiRUTwDyB7ZGAS94T
	 4KiB9fCXyplX/4XWZ/DFS1ZeQI7J1FRr0fPsokFfpQ8zd1xNaRE0rOKYOIIonq8vMAhDY
	 J2nVvnHBPRpReTh6lnVfQDu+30aLoner6n9YA7/svuXsLOtMoKqjdK2mNnF6j43+Ujq1D
	 m2LmjGDIs2uptF5vhywaiv5cnUOPpGUl3UfrNcnVp/vrPd0g8TWk2R1+fN8kIs2kpOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FUVQRw7Y;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9676A606A31C
	for <linux-staging@lists.linux.dev>; Sat, 31 Oct 2026 04:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9676A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FUVQRw7Y
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3aded3c6103so660167a91.0
        for <linux-staging@lists.linux.dev>; Fri, 30 Oct 2026 21:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793420635; x=1794025435; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oyMiLoLSdUtmLwvkMWGKLcY+WxNb77Nh3Idx5n8lKi0=;
        b=FUVQRw7YbTGPfNXGrzc3tVFu1qb9PwkMrJmzgNYz6sXgP96tWPuXIoffAJxe8QjAaa
         o6TmaKIExB3g+2FbipS8hlg75m1WG1IIPOaLRSW5r2owl7t8MMy+DznSlwxD/6Y5Ase6
         yxcLdnBmYd8PhYIeY/7r4IBxnTqLj3hd0VgUBRWmRgAj/RdnfQ24537Np8kFVIspwG0/
         O1Yop62XAW8VmSILGsjt8VOe5RNBOQuRr066FvJRfSTu9jpy1fCfNVntVE6KjRgoxJZD
         TwVKMpQHawmTHRh4QoR9WqMOnK1CqHelJQMgViZyDOb+kxB/VV1PE6OVzfX/Qq2C2ZKH
         mFWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793420635; x=1794025435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oyMiLoLSdUtmLwvkMWGKLcY+WxNb77Nh3Idx5n8lKi0=;
        b=FqQr1iNfzOfeyOScgu06XGdSGPXBLwc0sO+AN369qaiuHDO1IWrqJOxIICjrL6UNFB
         S03uOq8B2w3VK0j/0psXywZOZWvAcJL/rbTsqOUki+JJes/3OPfAGJ/D8xOXs1NSF66g
         /7sKVx9/ub6jr55MoZ2CBHoz5giXQQQKChGK5Du1Dp7xl0pp/o19Lim/1xzqr4hpOTNm
         kl9K95c2w393vyQs5naIm3VFw3KAib6dIbjIodieeRjdiEakZw3uyBGpbhfsl6g+jIIk
         NOTj8CGobQ0VvgMrnbIZANBaFNDccbZQxmtQZiDuakPV+Qxr16qDu2Zntjt4EVdc3vcd
         /OJg==
X-Forwarded-Encrypted: i=1; AKwUvBzJK+c4/uhOzznj+2Oj85q80/ei1eFrg1XXCCbzwOGzKWm5XSKwKzstzjkpGTFOvLHfXvzP1vWNQFqB2i9a@lists.linux.dev
X-Gm-Message-State: AFq9FYLdwwWHHQ/UKjvJ0+cqpp3vtpdz+82wxcD/GZxmGifz93zHqu/0
	3Z9xDuQuWM+3egcDF2lhWThirx26vaJXO/tGfC8jHx3dfMeY2Ygqvai1
X-Gm-Gg: AYBFou3EIbxJAgMlndgC9KXInoVYSY/76xWeVkYUiyQZE/d93YfegIgjKPgOU5TbQw2
	HrOGXmRJ4/3VWRzFg6zc4Ww/wNREbMaQLEVWcSJ/RyKvct69d/T6Mj+uJfuVhVCGEnZeE89D8Lk
	xPPaheZd+FXzRomjlA78jk9XfX7Dk2KdZzadmnpvtd8ni5vaZJcTed9KAAqdJnGnLuBgkFruLyE
	YcgTVKHqZnsWBXfg0pgouqtzqwqyd9rBCxboepkOV8rRloVRYZnCOcZEo9F79EIXCnVQfCrFMqg
	diAvkKW7S/R8oTfXKlHNDBRGZh7YO6RSPV682Gz7o4DDvY9oh1rhO5HOCm/dQGkA29ARasid6p3
	gRnbLkpKkt0w2EI6Srszl8fTY0dz12s+FbLfyNhvJDpfSr1Cc6CD7wcrZD4n/p9/yrSjg1ReIIU
	z9bOSiIWid57r/bEyfNR/bP5tTSHnQhLN8bz6eIN2tTu4I21v8/hR8D+GAVRLsQq5iKcmw41zwD
	4RVvzre70Hwevem7ShxXB6n8K38rGz96F+/0PY8uPQ4xlm6BZ/kVhs5/mbH+UqzNOWej1lzuRc2
	OpB7kyvzHYUe4y1hQtqxfZI8fm4tf+YaJUSu1bVOWSKI6/YPxR1k1FEU4V8rjxy/urE=
X-Received: by 2002:a17:90b:3f84:b0:3ab:b39f:41da with SMTP id 98e67ed59e1d1-3ae89776af6mr3372365a91.11.1793420634944;
        Fri, 30 Oct 2026 21:23:54 -0700 (PDT)
Received: from localhost.localdomain ([223.167.219.91])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae84596e3bsm6344526a91.9.2026.10.30.21.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 21:23:54 -0700 (PDT)
From: Eric LI <eric.lee0305@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Eric LI <eric.lee0305@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: fbtft: fix space prohibited before that close parenthesis
Date: Sat, 31 Oct 2026 12:23:15 +0800
Message-Id: <20261031042315.1122699-1-eric.lee0305@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Clean up the following checkpatch error and warning in fbtft-bus.c.
drivers/staging/fbtft/fbtft-bus.c:14: WARNING: macros should not use a trailing semicolon
drivers/staging/fbtft/fbtft-bus.c:65: ERROR: space prohibited before that close parenthesis ')'
drivers/staging/fbtft/fbtft-bus.c:67: ERROR: space prohibited before that close parenthesis ')'

The reason of that error is the modifier argument is optional to the
macro define_fbtft_write_reg. So, even if removing the space before close
parenthesis, another error "space required after that ','" occurs.

In this fix, I change that modifier argument as optional, so that
it is both ok to use that macro with or without modifier argument.

Signed-off-by: Eric LI <eric.lee0305@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 30e436ff19e4..e483ecb10938 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -11,7 +11,7 @@
  *
  *****************************************************************************/
 
-#define define_fbtft_write_reg(func, buffer_type, data_type, modifier)        \
+#define define_fbtft_write_reg(func, buffer_type, data_type, modifier...)        \
 void func(struct fbtft_par *par, int len, ...)                                \
 {                                                                             \
 	va_list args;                                                         \
@@ -60,11 +60,11 @@ void func(struct fbtft_par *par, int len, ...)                                \
 out:									      \
 	va_end(args);                                                         \
 }                                                                             \
-EXPORT_SYMBOL(func);
+EXPORT_SYMBOL(func)
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
-define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8);
+define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16);
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16);
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.34.1

