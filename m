Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8F53126D7
	for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 19:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774465577; cv=none; b=ggsBjDaDBBb494PO8q/92NY+1gT9U+bEkUmwnnP/4oNvFtC+WPSgB15yVs4ZHsza5FgQ5JBBcvOG/DGvMbvyA3sDgXdilgpDpCV4AgNuril3xTs3tdG9VEZomJe3arG+cLVP/M7upD20K5KIOm9CJQQtZ4QWP/+uPFR5IeEPoq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774465577; c=relaxed/simple;
	bh=3cgGEfzr3By+806g7SYIG8HncFcXEyZ5gf6k09EtRus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j5VJ1PfofV8DOeJDhgPwdvV/2/OJ9rCVr+oFztERxJQ3dQl3LtKybDLW4fT8xw+bwDLtFubX+9gppNfwHazngsLicTaYtid6g0b6LMUwudnDE+qxyLsLwZavoustQBup/y5MFFyDi2B1mDJyv3miDQ4NgLda/qMGpLc8bHj2lxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=plZHuc0q; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="plZHuc0q"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439b94a19fdso140144f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 12:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774465574; x=1775070374; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XHLRWHx5Jf8edhrhT7losXbkmzGi1gIj7HwGLnxxPHA=;
        b=plZHuc0q14Y5huJ3u6/9QpThkxk5elLaMN4QfTCGo3OOItvXL4/hzWUqylcMtRY0Fv
         4E1xS7Kz+x1x11w/empa5dgMmJjkk2j3M+uj+kgyU+dmSFcRSbC78VXgZ3rnMwUXSGrj
         genL9aqZicQ02ClYJJkk/IaYZqzzwmRKl4mOI6I/hFiH9kEEnqPYZ7dKecwZ8Fq4ZvbL
         0TJt4DD+dMtPCjBVk4kN+qmY3KZVq1EtqgHz46RAZXBYSxg9mMLVQQeoxzCdSVLSG6IT
         2vCNNpKYf4bQRS5iqBEr8O/uLenQ/Neyo+AgTFEiD8Jj4Xv7L9gyUWvFi3Yyuh5a8uZF
         el1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774465574; x=1775070374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XHLRWHx5Jf8edhrhT7losXbkmzGi1gIj7HwGLnxxPHA=;
        b=M2kteIn1Xd90oNIi376F5s+s9M0ajj6iupy2lTAbxkHn7f4aYnp3M67hqeHKSheFS8
         uawtkPC2LYg95w4wSDkq5R1jG1qOzSWUDJsnDVgXLfGw7KAdqTu+pBMW4G4Gj7tJW5VR
         R2hiU7u0bg4s+U0dJU7iQoRfEX/lq+jTo+Cma4xaeK+nmIJFnsI0VjIRJFqFGqEFcUma
         UThAvNgV2Knk1gxZn3ylGARWVxnC6+WfsRmgGFVVeg7cGZRC6HJU30V9WR1I1iTaHAiH
         /RJApynfJqxlV0fsCXBKDQlYtA3W4zLn3xpHREv9OVYVjl2NCP5kOtQdkzkP3nbrMpyV
         QJfw==
X-Gm-Message-State: AOJu0YxXTjZJYYyewtpvId9EnzlkLCrUIrwNg2qS6mQqGnMsDmtGNo0V
	0yu8BAbBxszjYF7uCknaBK4acLpwaES9sEil7l7udECtd6s8XDNmiWHt
X-Gm-Gg: ATEYQzxUBqmEHaKXnr6tsMtKQIDwZWqPNQCyq+6cHf0Q4Drp0BVFg8RafVLf/obBP0P
	I8fDSlkldfMtmJlfWx84yDCafYH/s7LvsVovMTW8CYRxdDF2vzxLapHQQKJ5Iy6dX1Mj28OpIu+
	a8t28bOyCTi5YjlGG4nF/J2YAsZ/n4w0QMhSadz7hFWOp1VKn2m27segWeS3jMilCij5jojb+OF
	/7Ab3iSaa/sSDylJLW7Wv4GjBFmUI7LzvcGvmGI1kNLJt+Scdr2GJPzy9DKSw67ZUuQpeFkBYDk
	plnKgphr9Bva1aeZgu09cuZU1eTyUa7YtG7A7W+Ocvpt91dfDkX7s45fqVLPqiZLxSWPgDSOX3H
	/NZkCfY5E2YzvTR+bDRM4WEG7d6ywCP1Z4P5/XEMZBUwpAO6ryUO4QgqEBTmZ0YoCWmCaNi1xe8
	cJCS5v2/lJ6PZG7jlViNI4txw=
X-Received: by 2002:a05:6000:18a3:b0:43b:490a:db51 with SMTP id ffacd0b85a97d-43b889c10d7mr7161241f8f.24.1774465573457;
        Wed, 25 Mar 2026 12:06:13 -0700 (PDT)
Received: from potato ([31.176.175.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919df7dcsm2090294f8f.27.2026.03.25.12.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 12:06:13 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH v2 0/3] clean up error handling
Date: Wed, 25 Mar 2026 20:05:57 +0100
Message-ID: <20260325190601.7906-1-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260324220453.47406-1-omer.e.idrissi@gmail.com>
References: <20260324220453.47406-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sdio_init() propagate standard kernel error codes instead
of returning _SUCCESS/_FAIL.  There are two callers for this
function.  rtw_resume_process_normal() already returns negative values
but the caller doesn't check for errors so changing this doesn't
affect anything.  sdio_dvobj_init() returns NULL on
error so leave that as-is.

Omer El Idrissi (3):
  staging: rtl8723bs: use direct returns in sdio_dvobj_init()
  staging: rtl8723bs: cleanup return in sdio_init()
  staging: rtl8723bs: clean up callees for sdio_init function

 drivers/staging/rtl8723bs/os_dep/os_intfs.c  |  8 ++++----
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 21 +++++++-------------
 2 files changed, 11 insertions(+), 18 deletions(-)

-- 
2.51.0

