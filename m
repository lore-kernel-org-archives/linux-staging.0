Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE09D379EE3
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 07:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772610197; cv=pass; b=ut/jXH8r5rXiMuf3dps5/Ar8jqIeYwn1TWhv5ImnCKX+VtZqF+t9AbwTL0sQ3ylx4KOPXYkOI3L2RdF8zR5eynceNUCoDg4GZRbYX+Zqbr1bHeJMC5zJ5Zbmy+xqGWceJJsXJB4YGKs0I//kTXLFdw+o0VBauwp6AQXRkuHK2lQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772610197; c=relaxed/simple;
	bh=rtntRDq4NKTpWNAYm4XDuk9dirDy3xAZZ59vCu4RFME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mDSAl7sk8mHjpYcKioxOnvLMKGudqi9RQV2VNOdZSGn9pKODj0F3x5cz/zB1N27mHXy3r9PE85f2Kj1sfR8Nh2dONQnUz9/2FgtytF/F1c3CFZmZfC70KgbKoGR3F/mH0NHGM7cnaS7e6J5Hz+VxQn8+PwwPN80L668mQl2cY90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aIvavjHe; arc=pass smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aIvavjHe"
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-3598661fe57so539780a91.1
        for <linux-staging@lists.linux.dev>; Tue, 03 Mar 2026 23:43:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772610196; cv=none;
        d=google.com; s=arc-20240605;
        b=fF7hlF0Po69Dba4bkt4V7GwL9M6u7MLDAP6CysQ2SZ3uDeP+3vILsZroxPa9IwG/Up
         gBVvNL3hiYBIcecNrdefdD0LzXxnlt5hK03ZV8LlBKMiiLHxhlXJoixpjVHaYpbGbW7x
         JIwtXZ9uSq8kjQvAiGuXeCebt1hVWYYmNouyX6HvSPv4dwyILjY2kVKrLVof3vVgfnWJ
         khl/JQaQuU7aBogPm2ycNsz9WkxZtMe6vDVjdba+B7KXVHSf42ZDxEwiVnCavYsmGpDM
         5hwSoCLK2S89noeYzXBNiVMwJs57Ur5n2hVFVi60yXqp+bCL7YhZ2XZmIqCIXs1GiW2I
         RfcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rtntRDq4NKTpWNAYm4XDuk9dirDy3xAZZ59vCu4RFME=;
        fh=+/fJSQgeq5boJBzR2M07VAlmVm7ovKJKOyDUIkKnzzY=;
        b=WTKUMRmr+XwZ4rz8Xmpfghz8gZtYc1GHBzLPu9nzeWNGwuf17SPv/lwZGr3bsffqh4
         CYr1RdVN+j1ZHgzwcKqzbsQi0/oEgQbKnQotanJnloAE9sEV7FU6AGFxNoZzDJ+sZjuq
         j6yuaNNUH4ifhkPxOQeDZlwSWeMMfY/Pm3PHqhz7IhD9Hd3H0bYDgQ0BRlQeiyLlCYvr
         6PGYL7qcmuupZRYSNCQ3W4RXDZZ1M+SuzBsvjvPTEnrgBEcwRxuWMgPrvdkoMPVFKRwg
         9Zkxh7lNgX/oNneKyOOB0xa6ul3euzFKygaJy/uWpYbYQgmfUHkl6YPnaa1q9RM0eOzN
         Y5UA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772610196; x=1773214996; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rtntRDq4NKTpWNAYm4XDuk9dirDy3xAZZ59vCu4RFME=;
        b=aIvavjHeX7ROAot8hNz+w8+bIMbywLfcAGDytTofR8a5p8SgZMf45YBV91U87P8LCo
         GSaRJ5afgDxdS27LXqWjmdDq2PaFwis4C8jogxN8+wuf3d+fUv45KjIfJrwZ65c25l+I
         YlHxjrmSc9asy72rkg+TgN3X5cTb7fb7J+bF2CFGxHtykbHYkFrALWvCUANyihgv5PrB
         fzg6OjrFtSObq6ua8ZIQnJqLSPyvfavVpr6/YUt/FEK+Yg+UGvoMdAvPZxQhYfj4nUWC
         7VjMf+DL1jQvWKSVaxUQjCvdZndR005ap9iglWdOIy0RO1LWztsF/ZwOWP+xyFAak4I+
         KSTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772610196; x=1773214996;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtntRDq4NKTpWNAYm4XDuk9dirDy3xAZZ59vCu4RFME=;
        b=xAEpBQiw1LLkda1DLOW66frq3CdW/845PD5kHS1o6LPeUXSfDH2+WcMe4Mux2pz9JJ
         Yf8r4i/4uCT5PPvsXIzMfT6AOoIKd55wmbcDZ0hCcgdc/GChqyuy643JuXjK6U6Oajtk
         81QI2+NR5r1tUZnPqw6TZUn+wLaFduOGTO3e6UXe1DY0/itp/mjiMwegHGU/O/902AUG
         FGFHG5UwYabisqQ5pwvpdLDffolfuVxonqlgkfw8k3wPPSFk85q3K3kQODGY3D6XZo/0
         7Eo43YYF+yy924pgDNoS0kT9qQu8yggxbGGIgnKkWP5GfYkSuXuTZzioHy9MPb2DA+X3
         SX4Q==
X-Forwarded-Encrypted: i=1; AJvYcCX12HFrdAgZN+Y5vt+bdtkzgZ/y+bn6f7eAW5bgE1MHlx0DE2uj8hTQBaV4nXT7MTrUFkrqUltU9ZX4DyY0@lists.linux.dev
X-Gm-Message-State: AOJu0YyL6IjIMToR5ZxS0SGBVorsrJLKIpCU2FaAWf9uiF7qqVB9M+w7
	Odj68ecmtMZgSJ6hqakkuLWMap0oxK5g+OLeJpce5Tocq0AwEBNfv93ZiU9EKQ+2jWIPG2DBgUb
	ajyWqlvugq9nS6v6bpE5abnryy1Egnec=
X-Gm-Gg: ATEYQzwHUd6z5DzS7evLWqcE7eQA9Cz384vaGHBq6GOL/El4iCL9L9r/awWWIzYyFP9
	lY1nRHfC1NCk5G82lEMpcAaatBPM2Iw8aLZCuqE+IfUO4840xp1VXHFkeNDqG8b08mac2F76sam
	JM8ik6tHBGoNQkJRU1iCnRkpXCSbg4mVbJr7H1lT5h/3BxHwjRcaK98RWlfsfYqUJuxUTPfDlUe
	AJm4UJwn/g+4qK56lKrQINCttw0Shs812KIgbAInSmszSwzF8rzUME2PK4tsjpBltNxiUpCdswd
	LmJ72QOx4xKCssKjlXGdVLrOBPKRr5X2wEGSfShfR4PmJdQCdoZkrFwzqj87/SvqZdFj6MRV6aX
	Vp9JbAnWtb9AaSykrXDqgm3g=
X-Received: by 2002:a17:90b:3a4d:b0:359:8e93:4fd6 with SMTP id
 98e67ed59e1d1-359a6a7bd40mr838957a91.4.1772610196217; Tue, 03 Mar 2026
 23:43:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260228202008.40063-1-officialsohamkute@gmail.com> <aaVXtbHMfUFJW_Tu@stanley.mountain>
In-Reply-To: <aaVXtbHMfUFJW_Tu@stanley.mountain>
From: Soham Kute <officialsohamkute@gmail.com>
Date: Wed, 4 Mar 2026 13:13:05 +0530
X-Gm-Features: AaiRm52nF89l5pCedHQ757Fy73kr_WYmSkfZtqwFhuxnzI4f-qifOwfktduk5J4
Message-ID: <CAFxoRw0yZM8opXig2vgnFZR6mTPFgj0JFxKYx4vtv2VyqUWSJw@mail.gmail.com>
Subject: Re: [PATCH] staging: nvec: kbd: use -EINVAL instead of -1
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: marvin24@gmx.de, gregkh@linuxfoundation.org, ac100@lists.launchpad.net, 
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

Thanks for pointing me to smatch. I built the DB and ran the queries.

From what I can see, dev->event() is called in input_handle_event()
but the return value is not propagated back up. The smatch caller_info
table shows type INTERNAL for that call which I understand means the
return value stays internal and never reaches the caller of
input_event().

So yes, this patch has no runtime effect. The reason I sent it was
that pcspkr.c uses -EINVAL in the same type of event callback, so I
thought nvec_kbd should be consistent with that.

Also noticed atkbd.c has the same -1 in its event callback. Should I
send a fix for that too?

Best regards,
Soham
