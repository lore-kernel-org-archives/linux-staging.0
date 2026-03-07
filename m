Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFE9329367
	for <linux-staging@lists.linux.dev>; Sat,  7 Mar 2026 20:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772914814; cv=none; b=kofCA6ZEhrx410ttSx/ICbmMNmTdUJbKq7kjnVmQxT/go4pAMZ9MYlp0lJnlt1B6Mj3chGHkvAs64K2Z3nPisqoSPsLkP7YwVFlPxmiSunbMbzLS6Gv92o49ORVXr5ew/jn3z2KycmNnLwDwo+6K2SX4U9t/p3jreKuDotSi1fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772914814; c=relaxed/simple;
	bh=qPflMS+v+RVkITycBz0IrKsfMXDQhAfHvG6C1XJuY+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GkGkSoZRjniIKSf3QEk8CTkySkqOmSzAB3mKfDav1QSkC6dcOOSmJtw5y/LTZ3Pq5W7m5Sd5AAkaovI9E8l2lhetEivcPBXikZNkCCjS23Z6NZSDNHlwIqCWcXuW0k+LWT6VhUNMUPBvEvSMGQ48egWkAKmLjuy2Y9Fb/WPAU7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RfCIIdut; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RfCIIdut"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4852f8ac7e9so8529115e9.1
        for <linux-staging@lists.linux.dev>; Sat, 07 Mar 2026 12:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772914811; x=1773519611; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPflMS+v+RVkITycBz0IrKsfMXDQhAfHvG6C1XJuY+M=;
        b=RfCIIduthT+U42nw/ekmGpO0RCtvghP+nfXzikxyX0O9n2lAxPGNQnMCqEwE8mkhQt
         kLe33C39QEISnoLB0rx8s0EFs4HeJ61Eo7/8LBYDbFzqa76BZW7UlxBF4KfSnMi/+ecW
         EVV6GVbTIZCEpNY6lvmN3YBZIaAgTMaKa5cUfXgn154GFXird7HYhlvX4GXdr5vT8YoX
         JkVK9GHy3z6YM64nCQc+UWstmhyoR79xfrjvIgdWZlbLUbcVE6FT8P8izjgzTGH69oaP
         BvVvSVaPhVCNrCugRyj2aDvUO6bIaAbjBfGv187ixOQljmr5vGv9SsLJK21f0QY7FbhR
         U0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772914811; x=1773519611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qPflMS+v+RVkITycBz0IrKsfMXDQhAfHvG6C1XJuY+M=;
        b=l/odZ/UmZ2ZGLu06p9LFOvYQfNR4VF2tEYlCInXkYg+16+SIAzU26PBIceBkDVvbo6
         bRPycapGjzmoOiALmy8v+8QF1D1Z+8z9SUcoRM12ONcypSjJAhWc8ah4qn2aBMvB8gEE
         S+UTWXhUSuamKzzVAfJ4pCO/2/0X2EoKYdIFHPw0tT3p79WCcjJd/bmirVu0dpcbJxRd
         6SE/HFYvBOxJzvI7mYTDV0fJGtLCDsI1y2WsjMWG3S/KiPe/a95z9uij4ydK9zzvICIk
         LHqH9r00kYu2rQ6NIO40LP+CWWUqnZmu7yvLwqbmPVJuXDKreZWIznPp/ignkcBbtRQM
         pAsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUP5yH7YMRLncFEmMyF0cLdFzdwKhLKH5u2IOEgGJ/q62fAwsLjjh4dAz8tTu2tyL+2iWu/2BM/L1Eb3Vn7@lists.linux.dev
X-Gm-Message-State: AOJu0YwVOrrZzKlHbscrLmYVAX1iAWX1ojPQ30O7UE5QrS8kSP3EhTGC
	gV2T6tAoa/kx07S/CyCv0HjN7Q2A+qGtDDxiWr+s1A0PXE7jVsrHPFeF
X-Gm-Gg: ATEYQzz9D4IzZC+xcOmxXNdvWTbuOD8voYFnq3YOeTvdac+OMIZOOcVCy0qF7+Bfe2n
	a6FoJE4K3xJLi5fZLVtdqymLA1Rrg5orUS9Nx1vr/t4umCkZpfx34l6d9fco6vigaLm0MOt8X4T
	GGi9cmixzHSMRv3o5wUDLxEB5pnIl7CdyHnnDNrlk/sP1SFEKQSEQlA89fQxLlu2CHLH0QSaQWx
	ZMXiYeIWsDoaBrTkhOJI0gJ7+GTaHt4wTqf8Q+cgjtTqbdVFKVJ1bkCVE3FVN8APAgHBOhQ5f7m
	4ThByqxwZrwPJamYFB9NpAeLYEZ4rJIlz8wb055XQmYuXXwDKmvSmZgTbKL9U++IhayhUKkaNPz
	JHXUWMUtvF/mCuwsKlDjkhSKkU/mr4RXHUWJH7j8MqKXYFxof9QxYiW8ScMzpXT9nEJQzWIHJ/K
	uZfapL0V8bWQ2z/l360684+77QPA==
X-Received: by 2002:a05:600c:3e08:b0:483:7eea:b172 with SMTP id 5b1f17b1804b1-485269675a7mr115250685e9.23.1772914811151;
        Sat, 07 Mar 2026 12:20:11 -0800 (PST)
Received: from BERA.localdomain ([31.223.72.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485256b1eacsm89622285e9.0.2026.03.07.12.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 12:20:10 -0800 (PST)
From: =?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
To: krishnagopi487@gmail.com
Cc: benjaminpotron@gmail.com,
	daniel.baluta@nxp.com,
	gregkh@linuxfoundation.org,
	karanja99erick@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	simona.toaca@nxp.com
Subject: Re: [PATCH] staging: rtl8723bs: hal: remove unnecessary braces
Date: Sat,  7 Mar 2026 23:20:08 +0300
Message-ID: <20260307202008.1071-1-b9788213@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306161128.72571-1-krishnagopi487@gmail.com>
References: <20260306161128.72571-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Don't write hal in your subject. It must be:
[PATCH] staging: rtl8723bs: remove unnecessary braces

Otherwise your patch looks good.

Thanks,
Bera
