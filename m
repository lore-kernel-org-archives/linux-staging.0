Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3272EB5A1
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 19:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771959921; cv=none; b=uJwh/eCZMczvv/Scn2Yl74A5JXkaNt7ZHqU3vKIkDY/kHrSyBspuySETkV9B4aFogd2o1uVbgAp/cKxGiFRaNwYKagUBuitqpQm/P1OYxL/yAJ95tsaDr6yOT4Z9FoBx23IjFc6CNJH/mO9wRSsQypJ/vSY3L+2C5Q4Z1P/UFfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771959921; c=relaxed/simple;
	bh=0FuowrmXWz5fweQD82lQddocIRrSqNVvenJqi997sYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XCMauAfIGE4a9YVwQjZsoMTwGDuI8KHpojhvH12Rfx0BMG7rlzV6pThY3pBwN+n6lpm/4zXtL/9VtV1ZYnAr7mc0L+yPJPgSrQGBWYZj+Vk14K5PaYlx/MBBI5jU2cf1GG3BCn4xy6n1bRazwAPW27UWSi4y//NfkmkbxFsoNnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aPFlSKf/; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aPFlSKf/"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-358d80f60ccso746056a91.3
        for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 11:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771959920; x=1772564720; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0FuowrmXWz5fweQD82lQddocIRrSqNVvenJqi997sYE=;
        b=aPFlSKf/6hui633uKaK+O5pOZjv2XLeSnAv5XUWgk2+VWc0AiizrPSvQR7sp0l5u/M
         /D8hb8E8rrd7sKvPsSykNM0P63QhXy/0rLt/aevH9BT9GT/3Ui0yAo1FdK2czB/QWcWc
         cqhd89ZF0cu9AxRygjD+qQx+u+333ZgnWfYpGLNzzl9VW2RTGmir8elinSC8PsOUMGhL
         sMTkMQFnqpx5A+xM8HJ8bzsbFc2EF7Tn5IqMnTU3QXx9yuRZlrQAuf795YiGUdSgC63w
         WqRyJbTLZDxG6fYhmCYkXfU62pbF+exoOrRBssQuEoHro4Nt5438g6SCCBv1VphekW80
         AifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771959920; x=1772564720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0FuowrmXWz5fweQD82lQddocIRrSqNVvenJqi997sYE=;
        b=enlgs3h6MHNjQDWKsDt3aqRu/oAjtmKfRHgqXbuIJ4cBOIhJYv6fO/QZhprmlOW8AX
         izUPVgYyZ2AdSCRv1SWG6P6E1yiDQ1Yvx0YMFIVmkgVk8B30o3zCyNBNxRGXJBzwWU1o
         0Nyuq03FVlCw8t7CxBbMe5rZYjs7R7ibd+e4iQTVlJo7ExG682/LBhl9CjPAMOI6a0QK
         IHiF1V3B/wfKN0KALAZrklvMB6i636hLlgNmDFiNg5iYAe3qUjrv/Q/KXMrWK3s9VPjV
         8chSgJBdEechSjqTGaPiJOHBYIX7iQcioJbaaoHo+AZVa7DSyS/ODrfr2m3almNHNMTK
         To7w==
X-Forwarded-Encrypted: i=1; AJvYcCWdP6wCM3r2HjgimNhiCpw6oydZe0lVPl7vRY1XT8XDxM1W+dDz2PICLYfuspPQ8FEgLG0ZMoznKI4WYNVT@lists.linux.dev
X-Gm-Message-State: AOJu0YwzuAFxpgKQOVRCClDmKdzs9tqq1flrPQEJp+fS4gp2OGtrUphr
	mIud0ZJPEjQXZUI63QXFezaDn4XYZmf/DiaSbDlL7xpkwb4EmZVP7NeT
X-Gm-Gg: ATEYQzwbVlToqn4Egbw65XWhYp6JxC/BMspbP7L7eZ9ButIQrrgOV6mqsFFteM8dYn8
	PMc61lHLJByq9QZIFGl1xj5TbdtCt0SKTNn07SvYwlwivwuYx/VkkRw8RqeKdD8t/jpr0JsMscY
	GCvT8y+KWOHVtL8tH/tqvlMosiEwvjpqgGkIrlWEhdQHo50sz6spk4eDqN+k9YPJvCsVT5F3enA
	sCIbMG6Sr60/EoZFoKU4PeAEKu2JAHHV5l+Dll2BlPYfLZv9sKDcqpOujmVCydCFthesz7KCrBW
	tgtf5OcCVxYBMi4Ok+3EKXQs3LlFWxNXnL7MaR7drSqx0CeUY1gqF4+jt7OGI5Xk2kX/RFbaLT2
	/JU9cAVuYWvw4Ee94T741d3vX2y3TevR359iv03bee5rAEj0zwsNw53NpxVDkhTtfpkr5HEkNJc
	CRRRL8408noaFxqd9R2CHyOsYR6tybZln0fH8=
X-Received: by 2002:a17:90b:3d8c:b0:354:b2f6:b4e4 with SMTP id 98e67ed59e1d1-358ae6adc2amr9880998a91.0.1771959919516;
        Tue, 24 Feb 2026 11:05:19 -0800 (PST)
Received: from fedora ([2409:40e5:11e8:25ba:c234:5daa:9801:9675])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359029d9d2fsm566993a91.13.2026.02.24.11.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 11:05:18 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: gregkh@linuxfoundation.org
Cc: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: greybus: audio: Use sysfs_emit in show functions
Date: Wed, 25 Feb 2026 00:35:04 +0530
Message-ID: <20260224190506.23334-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026022438-gamma-blog-1561@gregkh>
References: <2026022438-gamma-blog-1561@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Greg,

You are right. The \n additions were a mistake on my part — the original
sprintf calls did not include \n and I should not have changed the output
behavior in the same patch.

I will send a v4 that does a pure mechanical conversion from sprintf to
sysfs_emit with no change in output, keeping the format strings identical
to the originals.

Thank you for the review.

Shubham
