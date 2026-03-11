Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D354371892
	for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 03:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773199275; cv=none; b=dRayrHDOr5FA+qJODDlUlgfMATNInzkdb8V5FnOjVRkZSzIk1WYE6JD1lfj1NwtSBtVjcn1iOmyj/UTd0UpWlb6IhIatDigQZfO3eE/tmqbSL7YrWbukFlofkha07256EqbWtsonXhvLRUSiEGdZffD6pQmrmO+0d2UdeHMiMxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773199275; c=relaxed/simple;
	bh=pAD1jJPmnzYXBwYRkDWvN33pavGj3GkxKTLqRUf6UZk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=WOKyben0HS98ZchFwt05MHLbRvD39NWtyKgOU+2sRYq56+ATLiJX5NVo2w0CgD6IobMM/P0gLk2yieddvVyK3eVZ0e6poEBFp/WJVbnGfgwKpa1+ObmVAL15gCecBcsNtwzlczJ7tuMH8aUjJ0/P/5rv16cw461f82nA4JIG/Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RCH7eSwT; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RCH7eSwT"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-793fdbb8d3aso162983427b3.3
        for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 20:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773199273; x=1773804073; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pAD1jJPmnzYXBwYRkDWvN33pavGj3GkxKTLqRUf6UZk=;
        b=RCH7eSwTzfCo7/Rnu8ntgS6oFFJkXXnrVRlLXBnXiVgrpBSnhSyP2Q0brNfdfeoyiH
         b6G1dKO6o8vltB6NvMG3iOork9Sdg7foW4CfIdn+kJUk3p8jXYGAcPak1tRZPttEh6jd
         ftEZyR10/dM/j/m80085IpCd/btF3Iv2A3l1Cu/O+gE+gsgUV5JcQa3v/5YSxCMeHT4T
         1KTCl3dNgpXWjrQ5JrpXb4mDZF3jNZIKXkYl/RThOJkHisWVfxhTNO663biuBx+a+J0p
         FsYoThIIETBwht9rejhW/6xYKOGToilE6VOPwc6wXIAhE9usRLlqaXM9qOJvI9hKskVV
         B8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773199273; x=1773804073;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pAD1jJPmnzYXBwYRkDWvN33pavGj3GkxKTLqRUf6UZk=;
        b=bZZMKAMtAZutGBrABM3lHc2QGb9krye0YyYYgngxY9LbbUvfB/VfB0U4V/vVYRnnF2
         RwjBH0hcNY5l8/fJB/x69CiNBY0dHcRfKXBn/higkMfNfstufKkDJpyvw1FKzmMEqr9Y
         9oq9q+jsBfcM9L7kQ7eNWGxCqQYxuLYbc06/E9L9nf6gFE6k1z/3McdH9LfVzBC6JES3
         vq9IxBoXcV4QlokgLL5P3Ei7nOdegsYZCkAa77z9v5f05bbQggflYCiU2dgKJc70SMW9
         rWh22FZSRZQEalxnp0Lbra23tkf77aWikIcTZEvCcppr16uW2rxyZ2gYnN2gW6IzVqjq
         dwuA==
X-Gm-Message-State: AOJu0Yx+Qgb+fL5pkuQeTqo/mLe92u+84RHBFw9GjI9QjW0ioXlkJ0TI
	TSfXQdmJuvdrSGovaXoUHqB92EYbNftSWIolyueTW9yHP45Aj3vtKt7C
X-Gm-Gg: ATEYQzwfBFa+p97YEXRaR750K8Qt3CeeAdG6nLB7GkRDc3ht4qFdMT4dIsvm2zlfUOl
	LQ1W0edc3LXJkd2HncoGb6o04/R0iYiQVgkkyHXFPApbM8wvg1p4fTEg2e0LbMBbqlBiboWDapQ
	nRmDawFbzDrBbXu1fxZuMfeyh1S2574TOQvF45oD1VAej0QHyuagsyLx3o1AH5oA0FzNcuTznqv
	rHCVTFy/aKa1Ox6uLZAwmdh8SmxIKDqEZtiIbttA37gYk+AGyfEK51WBq6cj8TCq68SZHmqOEcN
	Gl7L6NsSXrS/jMC+Xx9hTxILBdo91BxUkL/S3xBcmqrTucCAMijIsYaoXuJQbH2wJOtPfn+hqC2
	5n1sNaa1fvoCeGF3rWFiLGZCvQkPfQcI6+4RKpPHZRdG7EF+pp0NVQJWn5tdyWqmXWCD4rsI9mD
	u6umLiXaxqh+bfuSkEDrenYcVUXVSZVWdQ+TT7lGkeEDZw844iV644Rhc/m1z1LYix0/H3Yjbtl
	iI/mP7+n/5fv2IQA09Ccy9QOcruqgLolvAIAO/RKiUnF5mr21PzxfBubzmPkMfYDXUNcw==
X-Received: by 2002:a05:690c:f08:b0:798:23f:7c4e with SMTP id 00721157ae682-79917fb00e0mr9809417b3.45.1773199273432;
        Tue, 10 Mar 2026 20:21:13 -0700 (PDT)
Received: from localhost ([2600:1005:b11d:678c:cdec:c045:5f40:fbfa])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79917f37b98sm5554337b3.49.2026.03.10.20.21.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 20:21:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 22:21:11 -0500
Message-Id: <DGZMOJPIMJM0.1FOEWT4HT0CYP@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] staging: rtl8723bs: replace kzalloc/memcpy with
 kmemdup
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Lin YuChen" <starpt.official@gmail.com>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0
References: <20260310192256.864370-1-starpt.official@gmail.com>
In-Reply-To: <20260310192256.864370-1-starpt.official@gmail.com>

On Tue Mar 10, 2026 at 2:22 PM CDT, Lin YuChen wrote:
> Replace the open-coded kzalloc and memcpy combination with kmemdup()
> to make the code more concise and idiomatic.
>
> Signed-off-by: Lin YuChen <starpt.official@gmail.com>
> ---

This same change has recently been merged [1].

Thanks,

ET

[1] https://patch.msgid.link/20260305102318.43034-1-hossu.alexandru@gmail.c=
om
