Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B2B1F8AD3
	for <linux-staging@lists.linux.dev>; Tue,  4 Feb 2025 06:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738652294; cv=none; b=mVWeIFjGBaOlaR0gqv+Biu3L6m4tLZ4EXFt6/1mqtX8ZuKChlF2kIbT5ZnFJGyAiFZndS+/lhQaVy80tEUkuy5OYsintJGy1qsPyFFV2Ypt7zYNtBB83ag0xMgJ6ngwEnnKiVdq5lOY9GdKZXyBk6JUvUIoUKptJCl3krWCi+Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738652294; c=relaxed/simple;
	bh=tL/T+gEcI/MPXxHsekGpjQ9f8hZPbdl/K3I9bR50nlU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rJt59TUL0vdjE6Hc4dsOhAORTP9gDzdEq5qQ43jusZJ3Xxp9rD4EMiIMDaxM1htr4Bgo3s63BpeghH28G43t1SRsvsoasZgyQgUM5Uv76bBR/ZqsAbqTEYOHq9HV7u/sQ7RSaJA/27PRPScJqUZm8qf3nZA1JAENVcuitoBFqsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZSyA5un; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZSyA5un"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3f34101f68eso554513b6e.0
        for <linux-staging@lists.linux.dev>; Mon, 03 Feb 2025 22:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738652292; x=1739257092; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7LEx7Frw8JjvjTg++iYaavH3tdfrNyzCkmo7RQSiQfE=;
        b=bZSyA5unmLTVraqDz3TAJz+3sCZQaxN8rJsDZABZemkikuoc0MsbXWDKC5hEc/7IC8
         Z4soBqHumGJjaw7nti36+dS/UZVSCXCTjfKD9aKw3poZfTXnwhNkSe9RTRmk72C+esOI
         Pyp/Y4mxrxkWgeD9SlsqZ3y+A27gd6FJU/Kqjonqg/ifgV7VyMQ9XoVHkYecC84rYeY4
         JmXe+9eoUmz7EAV3VzQSn2Z9zOUN/u8a07PA2KwRQjM6G2WeYEpT7aHMQ4VT03QNoKjV
         lXQQHGUoMs3l9fe+OBFprotIi1UqIsvDf0Iz2ifYAgGX6JdDOBUZRWyotIV/iDJeklTB
         cyHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738652292; x=1739257092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7LEx7Frw8JjvjTg++iYaavH3tdfrNyzCkmo7RQSiQfE=;
        b=Hwpr9/LCpIT4TITXSzlboc9WU4uv/9rP3MycfhMGphM5mgEif8Ow0U9m5YZYMt2acN
         BugZ+hh9IkDre0BP7N5xXI0rS2Z5zGPcN0L6QOQ8+d4Rd0LgMEatiQwWX8KasFN9j6MK
         zWA4b96+y7NqUdeL/8tK09pBfdhikxBBpU7o3mz6HPPAIXFDWbLZ6Wwe/D5RMROsrZhl
         rw1rq99WW2ZFwhHgA8wpLd2kwuDE7/ALrXfF9ThRMgdEVuMYvlBX3Cj9pn+oMOS1aEeh
         yNLMcmU19VYO/V5N6mwaf1o0dsSWTJvV9TfUwpouE02Cnyx2hQ/Bb5fncO0QMYTZi2sv
         jcIg==
X-Gm-Message-State: AOJu0YxXbI3YKwno2psI0YQcd+exA6uZqTEFgJWYEGWSgVD+0Za9p3OW
	ImrzezIjTjdpnLki8A43S/iLNcMt8L26U7/p04Zq4MetVGjPujER
X-Gm-Gg: ASbGncv/nYwm6qr8vbIg7P/Hb9rR8of6Ip5/PDhBEXo854emZRV73LEjHkeFDd2UTo3
	DVF1Dijy69qVYTcnXJ6k6rzgRGuKpv755ZY+zHItGoug8zhzXvXy/pm0bUy/yfEPdxgpkJ+HulT
	XOMdAg60wlVb0ct5UO1c8WrJM20KE7gH7+3dlMu8b4hk7+bJpITnPob59dZSNZKGsXKBbZd8CRq
	Ua6eu++ZfVS0lBbeEYJdFcib5Fua+sacU1y2XkLeuTnsOHC4FON8KA6d+CHFMsiz5NVnQizkojz
	yfsZ68S57f2hEh12QC6b3BmFpddRG8Z0PubicdjhrVmUB1mV8TTw7v5ouzvqPp/lvtxKW6kaDCA
	s
X-Google-Smtp-Source: AGHT+IH+UQuPTOIDX3XYEd8V1IhA/dflzMYDzCH+I3ySQSxYohtMyVB0hNQEiuB2AvfJWgsTd+5xgA==
X-Received: by 2002:a05:6808:3c85:b0:3eb:8855:eff7 with SMTP id 5614622812f47-3f323b47f38mr14285691b6e.27.1738652291704;
        Mon, 03 Feb 2025 22:58:11 -0800 (PST)
Received: from DESKTOP-GL3U3CJ (162-207-94-177.lightspeed.irvnca.sbcglobal.net. [162.207.94.177])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f333558bacsm2899938b6e.20.2025.02.03.22.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 22:58:11 -0800 (PST)
From: Ian To <onlyian4981@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ian To <onlyian4981@gmail.com>
Subject: [PATCH 0/4] Code cleanup patches
Date: Mon,  3 Feb 2025 22:57:18 -0800
Message-ID: <cover.1738651582.git.onlyian4981@gmail.com>
X-Mailer: git-send-email 2.45.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes complaints reported by checkpatch present in the staging/rtl8723bs
module.

Ian To (4):
  staging: rtl8723bs: Add missing spaces
  staging: rtl8723bs: Split up long lines
  staging: rtl8723bs: Remove unnecessary parentheses
  staging: rtl8723bs: Format comments

 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 175 +++++++++---------
 1 file changed, 89 insertions(+), 86 deletions(-)

-- 
2.45.3

