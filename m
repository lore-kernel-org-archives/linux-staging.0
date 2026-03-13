Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF463375F88
	for <linux-staging@lists.linux.dev>; Fri, 13 Mar 2026 20:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773434330; cv=none; b=dABNfNv85k36XTplSxheMRrqwXjgzfP5aMHycr6k+79Ln+4XmQfRFRmPVsvRB2D0ZCLgcuqak4pMH3BlZha3keakQUc81888SeOvodsPYr7WDyUIsbYVKiy2hcGqh4cab9WOxDSmfKC7mq/3GzyTy1UdVQxqmUR7HtYM9FvB5RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773434330; c=relaxed/simple;
	bh=S9WGoRxbPgTn6X4TZ6YBiKFPjCvVfu5fQZ/LON6ZvSo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=IpcpFtmnTVKWQdDuRams5TDvW/OGuY3nWpPnCSxKcMJn1oQ2+ZiUZ2tHe6MWe7FiZb+hC9VFilMYTCKe/hDWKXjEjSRGhlzuYElKXAJuVyqq/j/1xfe3mHNGv6NxLUcluLnq/tPMbEr4vBAVUkt2bDlaBB8mmvF4V763Ssyu47o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XyfwjnfV; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XyfwjnfV"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-79860421382so24847887b3.0
        for <linux-staging@lists.linux.dev>; Fri, 13 Mar 2026 13:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773434328; x=1774039128; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9WGoRxbPgTn6X4TZ6YBiKFPjCvVfu5fQZ/LON6ZvSo=;
        b=XyfwjnfV5Q3OxxPhHG/2GRVSMfqpZeqw40/BcoIKqtLGbs/vKjXkTTKxaVgnc9j1cN
         7sSbClZxFAEqYiYJr9tspJp18UXANYQO3XwrPejuBP/nHXFO+JWpYi7Vk4NhRgMu2W7a
         4QQRIMgVTqqXZmHROdutbw4/9eT0RtkE4/P2IvtTxXNeldt49rJ1FamcYjmr7OSdeStC
         qbeQxESLDpgc7wm8VtnUSrajqnjMmBWxP/Zz+jj220u7312vqp5H0KC081j3hBibMOu6
         oS1GBpjLvk1XhbMzDX/RwSaCQxx2wAClYIFRLPxpfsoWjfXyoigIrL5o6Itv4y9kJ+iQ
         mfxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773434328; x=1774039128;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S9WGoRxbPgTn6X4TZ6YBiKFPjCvVfu5fQZ/LON6ZvSo=;
        b=XRiO1p96hF4j9kG9YCe3mxDkRWTW1oBrzF2l/ceGey+l2JQvcWdm4QRtGJY+EQF/1C
         p3ruDBXFYLTL6FwibABhguOfv+CAZW4ujNVA4UVqQCA856Cu+b6AllGlve7xaMhxInQc
         Sav51QVJYZej08VVhi8PEYWe1HdLLE6WyP1JyKAovZsdngK7gzkaQjB4+p9VW/T9teSq
         lJBD8kMUFp+j+hJEiZNvvRkNP8RKkW2dycOpWFEb/YEv4a4eRZIIhSpJLuA1HCdfu6sr
         oQsOi/RaZzs0FyjZWwqzZUn/W7fJjxjxDx/Zzudvv0K90/IfSBlCLuUhau0ULnRJnhcQ
         r+7w==
X-Gm-Message-State: AOJu0Yx53MO7ruoHukxu7cp8BsIbfYj5/dcFcfIYLM8FazTEDR61Q7JV
	rOPAYorBPNiJcDmS/EUEQ1S0X6IYbQR8bQtFTJ2F04xWDopkcEAqHuO3
X-Gm-Gg: ATEYQzzV9PI3CPf9PWaDtQRZab7iKdLpGiDKLurv9xzD2ehxJ7S9TkhAYJLmW2d5Zhj
	Jtb5aOmbTqL5mBUhCSLhjDBStF1YTmjdgS1B4E1n4ZlS0DsSXM8xRmHSBvHCVYijiZGTUt/Euzx
	6UXx8XJMhyqpRdpL1I2AdKFMznBn+2zrQvYE3YmBc6q7ToblkZR27p6ueRrmYiLs0CxufOxlCXu
	8cw2t25LilfvQpUjjHZ4gwaULisPoCOcIYsOWZF/ty+aquy/r9vAivCNSj+mEMXEG6p+AcL8qhk
	loUqn0UqjQg4UVwII1GD27Txa9UhNb0g4SrdDT7nZR9C7jJd8lcB/zhpR/bwoiLtePXgYkT+WGa
	/7MtWNEWjzWoFehX1pKASSn7btOHTQAqZVuHRtr9sq+LdHaiLU+WWfefB1dLS+yMwGu91Kfj8Ag
	kOvmRKdm97sPgRuQY1u2iJhumvaFviyaaSf97ijvNJZz4/1xgPIv5T+S2GXm7Ic2UIiM+pJxYmm
	DvO4hFlF0JUYRa7Mv26ekE0Bi6A1myC
X-Received: by 2002:a05:690c:81:b0:797:dd60:abdf with SMTP id 00721157ae682-79a1c08aad6mr52145397b3.3.1773434327500;
        Fri, 13 Mar 2026 13:38:47 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:4c00::5585])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79917f0fb0bsm52324937b3.40.2026.03.13.13.38.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 13:38:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 15:38:26 -0500
Message-Id: <DH1XZTEG6LLK.XCP0EGMICAR@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] staging: rtl8723bs: remove unused
 rtl8192c_query_rx_desc_status declaration
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Azamat Rakhim" <azamatrakhim8@gmail.com>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260313190658.13525-1-azamatrakhim8@gmail.com>
In-Reply-To: <20260313190658.13525-1-azamatrakhim8@gmail.com>

On Fri Mar 13, 2026 at 2:06 PM CDT, Azamat Rakhim wrote:
> The function rtl8192c_query_rx_desc_status is declared in rtl8192c_recv.h
> but never defined or called anywhere in the driver.
>
> Signed-off-by: Azamat Rakhim <azamatrakhim8@gmail.com>
> ---

Looking at rtl8192c_recv.h, it looks like you can rather easily just
delete the entire header file. Just put the things that are used
elsewhere in the driver into rtl8723b_recv.h.

Thanks,

ET
