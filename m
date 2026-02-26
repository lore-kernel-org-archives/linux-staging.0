Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25ACE355F3D
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 17:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772128713; cv=none; b=NgPEz3nm4eZPaz4G4e7twotyyKUVnceaKLhYyeHv2GJoSn33Y1/M+SN1cS74XmN5iL7YzDCVhak7gsHUirphGXbEZw9xI7RGTyCsEQcBe9SaPVdR80dMToPbyxFo4ms8sOZGG8TEZIiCPHPJCfTK7Qv01hz48Qbi26Wxb4wH0Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772128713; c=relaxed/simple;
	bh=YJLRMsLLh6RoXlQaUqAZ1rl6qsmJSmxpR2KNMW8P0t4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LwPo4z+AoCWrI1tbUTIbAX0lFlhzZd4P4G68IHOXBuux/N7JgdKReUodTu6TcXZ9DMTurHf6RCktF+6cqRneBSO9ArzF0+Jq1DAahnROZJqkOtXdzULBc+Gubr7E+xfkxiUD8Gq5Fafng1bSB0tS5uDWAO5q0rfQ/Mg1iBh/0Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FYCesfti; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FYCesfti"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c6e191c4b8fso405982a12.0
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 09:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772128711; x=1772733511; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJLRMsLLh6RoXlQaUqAZ1rl6qsmJSmxpR2KNMW8P0t4=;
        b=FYCesftijmfoO299iGYc+LzC8BHqJBiBob7wQE8N3w5dfHeqLsDJxVlbVwcJem71bV
         BETxf4b2FxpvuS2trtpaFotrerrJLLBGqJskpPU8ZfTVWg5z5hpkwcMiGKTlSjRLzBdh
         e4vRgiVVgiBSDIzDOZ2u3FxvbUqMuvDmQF6i3AFX4aqYED1r7w157hszArx30iqWpxSU
         rt5pe07wDxtlnSGRwXwmpN1hpg/jZlQj7Ke/7AcpHpc/SeDS11kuE/AHEWCg0ErOG7DN
         V0/EpmL0Y0bYBiXjjRu8RJEc5HSPJRRxGibvN0pVz63UtGqVmwL3EJ8ifZSV1YPTeO7D
         Vfyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772128711; x=1772733511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YJLRMsLLh6RoXlQaUqAZ1rl6qsmJSmxpR2KNMW8P0t4=;
        b=v8KVo1IQAjPNBwFtiD1WgFRcLk6QtI8FQLvEh9NZBkash1sgyIWZ+aiHpytDrj9Q6P
         eqkD/YBG8U/pE95NO8Wk5peANkU2yJB832i1WQE1LPZvkVPsFMpTBHornkA9KNx2OzCe
         hKjCCGEs1Kq7PtLcVbEpEb6xe9PjXALee4fc3V3BTAQw8/lXTzrtR/iLptsHSTt/fxJ2
         Brqh27+yFIb7978pB8/7qdVoyzFMuBLt1c3kAPRyO2OM3OGsdnU3TbUrAr5X0JTfM1KW
         MI5IQSv4FbaQ/1j6Fe+xAncR7PA9V5y7KnvmgDpicajyu5ph92czuud74j2xCyo0KhOr
         Udlg==
X-Forwarded-Encrypted: i=1; AJvYcCVEpsd+qvCeJ8TR66VpwhX+SARS5hnsNzu6LoymxZcZsOYcnXUiUnbGGKxCM1n9kyNL/IBWh4iV6sSEwWR0@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+hv3WkAN33t5SGwq8m9DQjt5QuS2XX9hvWW6H6tgwd2DA2BZl
	k5SNkPC2twep6F4o4pQ8xLj5nq7eQh62dLkphwwbeKLP5uP9dytsVD1j
X-Gm-Gg: ATEYQzwxVhNE7GQ36ol1GpUDN4067pxiMLuUA/8WHOiFng9TeJgZgk0deE1zdTZsX4w
	sWOsPo8Ybm8kxkydkc2Zf9sKyyMJjPvpfU28RkVXhuIaottWgognk/Zx5ahVYQ3X/JcM3oeuabH
	FOoqAN5OR0LJIiVA126K9KFaObh1H6DYGTmogI6YG3wX35O+q/Pj9u7JrvoB9z8PQEJR59/PT29
	OlYjegVOLlj2E92RhjA0WalG2C8a9iLzVALaiEb9Y4Cya2GA283v/KAk1cEVk/6coggDYyv+cNx
	NCDVkhrGazIiMYHRlDpflGVBhjq+g7TMRN0EkTUT9UT8V+2Gy510Sk/3t0eDVrpdvz7oKxIJvJL
	gfGs6vNQrOCFToT7M7RH4CwWXjdZ5Vh0L5J4PljhQve7+zjN3W5BZRP8fs57brg8lwt/MtpRWXO
	CGO1Fi6RFQwXQsi0vcKYOcDmK1buYyVXY4MlXhQdNuBLMB
X-Received: by 2002:a17:902:d2c2:b0:2a9:47ff:1020 with SMTP id d9443c01a7336-2ade9972102mr37058085ad.8.1772128711372;
        Thu, 26 Feb 2026 09:58:31 -0800 (PST)
Received: from fedora ([2409:40e5:1160:7851:d9ac:d756:7e02:e043])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb757a8dsm45547195ad.40.2026.02.26.09.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 09:58:30 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: dan.carpenter@linaro.org
Cc: dtwlin@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: greybus: uart: fix style issues
Date: Thu, 26 Feb 2026 23:28:11 +0530
Message-ID: <20260226175811.17881-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aZ_9V7cldGzWNDrb@stanley.mountain>
References: <aZ_9V7cldGzWNDrb@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dan,
Thanks for the review.
You're right, the comments are too vague and don't add much value.
I'll review what the locks actually protect and resend with more
specific documentation, or drop the patch if it doesn't improve clarity.

Thanks,
Shubham
