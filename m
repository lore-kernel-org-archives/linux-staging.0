Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385621C84A0
	for <linux-staging@lists.linux.dev>; Mon, 10 Aug 2026 02:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786328207; cv=none; b=TWEzEO3PSecUXhqme0n+SSuJHAxdVQuroCCCBb9l6qQBE4JrIw1MfvY1P18Jc6+n5kXMDx9/OUy7X+f0fQzMzCPb1juQZHthQAozkiO5LrehgySPKob87Z8zaMVkbGLwxBKXrFW5AoucfGTBrJWo4pLxUoi3fNxf4Us+6FbgQ6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786328207; c=relaxed/simple;
	bh=d6fyS4o6oHm6FjRqR4vniJmeWIw+Ne8bx2l2lJLE6Kk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oex0w9dh1hN55xER97u14Bz/Z79qglIbleyy347NPxt1o0zBXSdWH9QNwNE/qF9sc7P0DDXeO+VjRLamP1yozLi6jqsO06yRrtsLPNDutYt+o1mjvafDRGyfQdLcCwL9Qz8jk14+1+81OPojweRFZo/3OfqWjabde9jcolTjaTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TqGZM0u9; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TqGZM0u9"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c9fe3c9bd5fso2513261a12.0
        for <linux-staging@lists.linux.dev>; Sun, 09 Aug 2026 19:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786328205; x=1786933005; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T50296aExFxsj0I/+ZL970YLUh41lH37G/h3Ek1dg8U=;
        b=TqGZM0u9myYpVfM6jALE3Co+28YGWU7NJ4voA2Wk6LcOTWMtLTKxeXGKdbGPypKHOe
         NxV7cf0Vn/rb7lPiUAHLaLValsenxQkopyu03jcg4wwI/HZ2kHpglm1OZ4uEQbexQygr
         M9lLe4DrhTfZEivoQ6Kb6pTZf2lTs2HVuomgwcNzpJRklXO2Zpdg8L9Qs4BHgp6taUA3
         vgNGWjFKRrJNSYrOxlMgJesxMuGenud1dCVWtK8gEN+IWK+kL/0Yjv3Slo3/IhDkxw/Y
         jmtTXYqhcwdehWGbo9OfOqrxwxv8Q1IeA3kn2ML6VgnNfk6lU12gtDqkbYJN9HTBSSzw
         D4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786328205; x=1786933005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T50296aExFxsj0I/+ZL970YLUh41lH37G/h3Ek1dg8U=;
        b=rFIXQNbHpH7es6SowVdJpCWpFLujZROP0Do1syOWQ5AxHu8XPr4xFgv63buGGe8sZN
         fMqM1l1lI3HgBEqhdzCld8uSENbDnQZZgyuzgwzE8P90dhgXUEAL6vI4cw3usLUy+Hlk
         fIt8osMSFBdlhgnUJXlC7DXXxOs1UIf/cvYjjjQoCBJw7DyxNWYOYGAPmxyG1FisANzC
         IirjCyzZW+5NNmNRmgb0W4wXQyXDIVzj9CCc0USBKsq5MBPHN9QnrEDIPSm2z0f6W1pr
         9Px8oDheU3UdgrVdu2aIniRE2dHIx9ZmeO90CNhZLhIBqWhqwiUAfQaFZdbHaanvNuG/
         MAaQ==
X-Forwarded-Encrypted: i=1; AHgh+Roxt1w1YzQJelyEdOL3a8UlMCuo6W36UDGwnUzyyQkkHvhFACBystDePmgVUhjfRYZaw3X0CtQVHuOPjXOk@lists.linux.dev
X-Gm-Message-State: AOJu0YyLTpXNW99EFWR2UWAIvSboPJZf/Z0vTsaUI4ZkITGf8HQiXSjk
	X6YR7dLcgdSfyq6tNKa8u2Dd4pBsbrNaSKOmoF8ASCQzkCsC6KRSkGMM
X-Gm-Gg: AR+sD11u9x2Tba+gBaCYDxmw2bmIsdGJ8eLaPFFfIdb6P09e5edHtSCMgRKKorwpIW7
	G/ZVWq4CJy7KA+5Sz7Liq2H5MLOfJGkNNYHj9oGKBafvOXlYDU52E+euOaUI45U0rkLh1a+U8pj
	f6DbZ3IulEe+DrWExpqkOQW5PwjcEeF7Ks6KAWjeuNFVvMM3EtXJDh7xvvX14PtQhmHN7b+tAjC
	iQL93QUz1G6t6USMJPdNdmVw+Zg5HywD4nygebmXe5EojPjqMjDreikI2VcZUfiEe5z9xr3e4JJ
	GBcewargKvraPuoBwClBBwjTeU/hUGMwxEMur23cWT3J96TMCrtg3PXybhcu8f5S7UBU0IoB8P2
	r07I13jtAu9FjGqvBeMJlMI2XgwySJ50yAMSX2QvMI6VhNV0ULmrGif60pAdO9t4hYr2peAWXFJ
	f8XeOUINkGKDwYAPsKy4WyvRjnVURnHWf8xBw+f3RUmu7uzuzMHKtwHgoY2w1t2E1hNY0HCHYdn
	KUZ3du380SHIYKEAbELENBocTgcJ5SzzEayX/1xIIGdrOf62T/WPY1hRa0gJzNMJh+OJtyDUIs=
X-Received: by 2002:a05:6a21:4916:b0:3c4:320a:737 with SMTP id adf61e73a8af0-3cbd3bc5576mr17285040637.16.1786328205375;
        Sun, 09 Aug 2026 19:16:45 -0700 (PDT)
Received: from kernel-dev ([49.36.97.234])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14101b95b20sm30050607c88.15.2026.08.09.19.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 19:16:44 -0700 (PDT)
From: Aditya Chari S <adi25charis@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] greybus: usb: fix response buffer size for fixed-length hub requests
Date: Tue,  4 Aug 2026 05:21:55 +0530
Message-ID: <20260803235155.356199-1-adi25charis@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <anbmj5m_fiASaOzK@stanley.mountain>
References: <anbmj5m_fiASaOzK@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dan,

Before I go through your questions point by point, I want to flag
something that affects the confidence of the whole patch.

My rationale for hardcoding fixed sizes per request type
(GetHubDescriptor/GetHubStatus/GetPortStatus) was based on reasoning
from rh_call_control() alone, without checking how the actual Project
Ara module-side firmware behaves. I went and found the firmware at
github.com/projectara/, and the relevant file at
github.com/projectara/nuttx/blob/master/nuttx/drivers/greybus/usb.c,
gb_usb_hub_control(). It doesn't support the assumption I was making.
The module allocates its own response buffer purely from wLength and
passes wLength straight through to the hardware call:

	response = gb_operation_alloc_response(operation,
						sizeof(*response) + wLength);
	...
	status = device_usb_hcd_hub_control(usbdev, typeReq, wValue,
					     wIndex, (char*) response->buf,
					     wLength);

So it's deferential to wLength on both ends. I don't see evidence here
that the module would ever send back more data than wLength implied,
which was the scenario I described as the "impact" of the original
FIXME.

Given that, and given this driver has been unreachable at runtime for
11 years per commit a96493560cd1, I'd rather get your read on whether
this is worth pursuing further before I go answer the rest of your
review and send a v2. Happy to keep digging if you think it's still
worthwhile, or fine leaving the FIXME as-is otherwise.

Thanks,
Aditya
