Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C321622A1D4
	for <linux-staging@lists.linux.dev>; Tue, 11 Nov 2025 09:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762854340; cv=none; b=lt7ysNurvoeCKIlVbNsWvLfSByIiiXWxeiKiTaO02xAhQakwPPT3/y6w/WL7GtAs3ho/OABqVgO4Rd/0SptAVnokewzKeFYZtooJnsiper/HdImqMm2WF1AdcR7W4Y7Pjz2tdyfGQIn6rs0oq7e5IP2PgY6QfvNUju0xhUvzeoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762854340; c=relaxed/simple;
	bh=gPYWZCrFWH5A95MUItopTio1Dv+bF3Yimo8m+Fu0LPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YoqfIy14ksPuo2egRo6jb9Am8HOAqYFHCH8hBV+cSLUfboTgnr4207wQPH4m2B/bHjmynxNLLGw2yJUB8eLLJ2wk51HWZrsL1IFrxO9vCLt1UyJizQYP/lPKu7hGiQTvYda/dXlE31iSRQ3psfO15tenfTw6VRxGaloA1yLVI0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2E/wM2d; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2E/wM2d"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b3669ca3dso1073929f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 11 Nov 2025 01:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762854337; x=1763459137; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDWEaabtponRDh5izzcawYcKRcbqPl2YaKoP5YJjm8U=;
        b=O2E/wM2dZTlkD+odfydTuHUY82k1RlnD+eMXhea9T1vUHH1Xw94QuupzY3cAHzVX2M
         y8ql6TXCSPixTE4qDT/ILpMz+8XqzZl6OEbk/GnFzlmx6leeuW3XptWvhweqMhvTHJSL
         C/rIX0ePFn+SLLIvuSlo2X9kD/APkzGotm1nVKaO086zNJxu6cVOh/NxwfDDJ32iQx5e
         pChZCRVEfRPfA52PO9Aw2Buz491MkH8PZ5hIhkv+58KQ5SZletn2kaXTy2MKCeE3uHFS
         Nq7DoE7tVi1VNkeb0YPcCP0Y1qspSAgrAaziWsV+vG59Lu+1kR0YnorjntJdmvV97NS+
         qL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762854337; x=1763459137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DDWEaabtponRDh5izzcawYcKRcbqPl2YaKoP5YJjm8U=;
        b=Xz8AFa/16d/zKhHW71IH7mOvqdRzBFBv21iNlssqfVUYvseI1lhnUiBFRPIPFvB7kh
         oxe/rrinzuIGO2ukeZxuaoPosFnnHh7T3LTqQKIpcTs+kRlyv6owWUJQlz+MShPtzF54
         inQnNId17rZAOIfl57KIjj2eRfaROEFCvIF6AG7xcwNSSIdccFZJdZCtmU/WC+qJBnSf
         Nhor9Bc7+phN7yloqGxUxQd/72lkBUK7/UsidJSbDmDWUB8Iibn/OiCQx33symShsxZk
         j/VJ6akHSbLJc4bCy3bNmEn2lGwDg/JGPItFu4s/EJsLQoWXSIx75/YlRhmhqLSgKSiI
         GsKA==
X-Forwarded-Encrypted: i=1; AJvYcCXploHnpa82XnEZz1mpQz9mpWVXVRL52lk5yFpKaU0NOmTZ9ZtmkCmOxDLqAtqLjOGWHnpJr0Or4gsH7cxW@lists.linux.dev
X-Gm-Message-State: AOJu0YxvubZ5vvLwc6MTsp/bxz73Ke9ySi1AKUDq8up4TlN0zbQs1JGG
	TObLBGEQoUclLambrayY0WI5/TUBOZ+GjkdUkVurOX61gi+y9UcZ7oHJ
X-Gm-Gg: ASbGncstrwUHMxfk4a47j8ZxLn7M1QtBnmvij8RpnAkY/uDY2iraalgapVVuUjVGOFT
	fY3OIPBGgn8NVQkPDw49wDAXBScNbfnZ0RbvpcFlE6FSDRFCLqdLts7pvGtLSrKWmfUS1mmZCiF
	7+/tbAWprbLb5lg9F0mJAbm1LX7wD0iLhuYmZy6ZLeEE3AbBuDDI/CpGP3zCeqXOYV7BRNkBLKv
	qoBCPi5sfE47FYPU89s3JuAKflbMAi31DJTZh6ShMEfESt2fHzQtQUbyL5gTtYyZmkAfdb2KNYm
	H3LuCyIcIXxSQFTLLb+eQCO2Ik7Q72t668g+oY7NQ4K4qqrxwbLzTWz83gKfJi8YpeNoXBeo5BW
	Gqrh5w1qN1auYbn1ruC8+GfZdXn4RynQJ+LAgYfUsJRtOe8AntfPGzz92DJnNvzwVOovl3GXEGw
	BwoPJRSUJLOsFzC7/OVSn6ailCmew=
X-Google-Smtp-Source: AGHT+IExuH+PVoLExRQBwIKsEjtrfazluW8ziX/dmQroSwi+F/XKMEr1tAorQ3AKtLmRG7bYHA7BUg==
X-Received: by 2002:a05:600c:4fd5:b0:475:da13:2568 with SMTP id 5b1f17b1804b1-47773286448mr91686425e9.25.1762854337066;
        Tue, 11 Nov 2025 01:45:37 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775cd45466sm359537865e9.0.2025.11.11.01.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:45:36 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: johan@kernel.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH V2 07/10] uapi: linux: Add common gpib interface headers
Date: Tue, 11 Nov 2025 10:45:09 +0100
Message-ID: <20251111094512.6411-8-dpenkler@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111094512.6411-1-dpenkler@gmail.com>
References: <20251111094512.6411-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The gpib user space library needs these include files in order
to communicate with the drivers. Copies of these includes were
previously used to build the user space library. Post destaging
they can use the includes from the kernel headers.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 {drivers/staging/gpib/uapi => include/uapi/linux}/gpib.h       | 0
 {drivers/staging/gpib/uapi => include/uapi/linux}/gpib_ioctl.h | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename {drivers/staging/gpib/uapi => include/uapi/linux}/gpib.h (100%)
 rename {drivers/staging/gpib/uapi => include/uapi/linux}/gpib_ioctl.h (100%)

diff --git a/drivers/staging/gpib/uapi/gpib.h b/include/uapi/linux/gpib.h
similarity index 100%
rename from drivers/staging/gpib/uapi/gpib.h
rename to include/uapi/linux/gpib.h
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/include/uapi/linux/gpib_ioctl.h
similarity index 100%
rename from drivers/staging/gpib/uapi/gpib_ioctl.h
rename to include/uapi/linux/gpib_ioctl.h
-- 
2.51.2

