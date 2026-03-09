Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC371F181F
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 19:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773082818; cv=none; b=j1/CYucx2KinTuDxNUGNFTtIy5zd+z9vLlREIcIoqycnIvuZZ8CDzDK1xigDf6xCT1HohhQ3AytDOeGZAq0pAgajqI8JScUwwNCucxxGgJRCbAASgWtiJ71n7oSjUAl3N1Z3Gzxm9baTHJwc3a9O1kGQT/R0N2bNr0fdL8bHHJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773082818; c=relaxed/simple;
	bh=/M7nU1lWk33H3ijRcWSRP5DxBK/Dv4iYbWmH4saZbpY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l2YN/fHcyD76U9PXzbmWdR1s5Bjr1qK8rygU6HNSD8AEd7Yi7uODWBMLXqgRwladI5QjD9Q6qgP1KHjicYgX2z9eFfUuymIxu22V2WTk848JeQQqJx4+oML5uDTXhDG1r0NavyBUqdpkcT88j0zljzTPAtC/U8d5rfDRM520+90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l6r6aGXd; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l6r6aGXd"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-439c5cce2c6so5630497f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 12:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773082816; x=1773687616; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rk4eiR8iW6V2fQWBKMqrjJjRmQac7l67o7Skoy6dR+U=;
        b=l6r6aGXdNbCTDRfu7sPTSJq6QYcH/WPwJgew0OviCibfO4/xMeC9v7LGiMjHuh4kxd
         0L/q+ka5cpVQVFWjmLH+8ilYEyThAp5vqycmbxTX+lknzUdAC+2uUfZXtUaG2Y7DvTIt
         d2t+2vjEHM98GXEZUFu423Ldk/y5+oLK3btI+GUcIg78/WKk00F7ZTaPI7isGZfpS2LR
         bKSGVGpwzfaD0xB4nlRRsuhYIwPnYEUPFcveFmCd14nkC3+kl8enomd3HWGv9bClGyEN
         AGuFMXuhfYvfSAGzTlQHpLYAncVPd3lQmho3xkxaKNrtObhDFs3Ca3Tjs3XKgMwDv1cH
         ot/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773082816; x=1773687616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rk4eiR8iW6V2fQWBKMqrjJjRmQac7l67o7Skoy6dR+U=;
        b=Gropr0xFazjUEfMDLvcKbBBv9CABN/foIaOSFLlhPGKZGikWw5Ln20PCB0/5DjBB5J
         //220NHjV6YY4/iLJ/RVsRnyov+qZeKcsYEkObyO9G8Lk3K5D15ASStBbvqcTZc4mIGF
         ucmYv/me2Ph8hCnkAhQ1nkFWpbqoKUFpNC0lFpBEogZ/3zuOcj1HGRktGdrpa5pPicC7
         pd73spIh90QUhzIcLVkDdE0HwnzX0Cl9VAcmY3KzC92fWnWL10E/yOsSd8//1947YYy9
         HwN6wZqGwT1Ar2lNFS4+juZIRx1E/HXKnJ8Axpa6RtflMq2H/sUKms6Q+cR2mrn3P1+p
         MhUg==
X-Forwarded-Encrypted: i=1; AJvYcCX74jv4rXw+dKfrHvDq6wkO8wI4vrr+9J+4qAm7xU8Afy8mu5CYM+Dz+A3K7DTKdMBcrFXXJ+WzUM6h4DiV@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4HAtVNEPlCI+ffBdDBzrjvu2+oXcOe4KswWm6XmfnL9YZ0U1D
	/3FrASO/tJGUpcjYdV6WUz6AHWRDY5ETbhpqUC4gXxX1o+X4ZumRiDxq
X-Gm-Gg: ATEYQzyAKzDacCq1OpCw1gpsiBIn8U6qtECHvFNJpt1jcjpXQzGji0Opi8trFB5jhRb
	XCuy6EMB8hXxtzHnnkIug4M1wwuPYehaVm+EjeZJ+DJThZ4i6epwFFQff+gh4QNaw892gLpz/vE
	ly3yn87Hu2pNFv4CmuFnyED8xvUQWASnEWDjNEWMOnqL6YJD+vyQ/jz6qvtVCh7VjcHQuw8HIgG
	Hy1C4RCEVBbioWh+kPxY0oSF2iFnIL3/wpfJt29zV1+zOrU1LJ1xEm/sbT6C/XBHhJVefU0F//T
	M3wgm4Yi4bNGkUtpE7/skZyMGCcNJbZeWYbH7tb/+0/4K7fr71dy8e7XKzzv+tIW1DR3wjeXlfL
	ku3W+5NJaVXHWL6Efv9RFoBdCgya8WTWy55Uryj7wtwO4SkooyjzN2+rzLLYOPDpDOG1cWZBO2/
	sKamq8z/ImiMWCJjE6BpSIPjdcwBmPbqsyj0o74vG0
X-Received: by 2002:a05:6000:400f:b0:439:b374:c6d8 with SMTP id ffacd0b85a97d-439da89bbdcmr20514811f8f.46.1773082815471;
        Mon, 09 Mar 2026 12:00:15 -0700 (PDT)
Received: from DESKTOP-BTQF5RC.localdomain ([85.110.79.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae57c05sm26734093f8f.39.2026.03.09.12.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 12:00:15 -0700 (PDT)
From: =?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
To: me@dipeshchaudhary.in
Cc: dan.carpenter@linaro.org,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	=?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
Subject: Re: [PATCH v3] staging: rtl8723bs: add missing blank line after declarations
Date: Mon,  9 Mar 2026 21:59:26 +0300
Message-ID: <20260309185944.1059-2-b9788213@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <c34f031c-3271-47cc-9a06-fc3406a25aac@smtp-relay.sendinblue.com>
References: <c34f031c-3271-47cc-9a06-fc3406a25aac@smtp-relay.sendinblue.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> Add a blank line after the pwrpriv declaration in rtw_set_ips_deny()
> to satisfy checkpatch warnings and improve code readability.
> 
> Signed-off-by: Dipesh Chaudhary <me@dipeshchaudhary.in>
> ---

Is this patch too minor?

Reviewed-by: Bera Yüzlü <b9788213@gmail.com>

Thanks,
Bera
