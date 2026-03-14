Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08D940DFA1
	for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 21:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773522961; cv=none; b=nKALsa7gCjO5NLOCmIDJEEgWKHCBoyzh0bn3WxWtKpA7Cqu9BA5F+nKrWnlNgbyueXPn1g6bps9L5eLNVNt4+ASetMv31yyDw14yCzoq7VsCX/udfdoLQg337YXNOsrsRX3qb4D6nOW6/Ooca0Uw0iyiQt8U0MoiMGR83+7ZHD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773522961; c=relaxed/simple;
	bh=PXp0UJW1KcE0gv+LECPrULNv/xmNQRUU8w7JOQquz3k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=u5vXfmhoAG11ERztTGEnhmm2ouwWTcUpaeuyFXTcXxE2krFM2kAraCY098zQTWyr5WPhszZN/UBNqmkeIyGYb/5xclcGErsZ0CWlrcFaz5uokp6XS7gxrQ6MrtnosDByMvENqTWStz6mf0NoYpZb9OSP2vcFhsXdnLrPQG4CZnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YuRyfpvs; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YuRyfpvs"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64ae222d978so3651915d50.1
        for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 14:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773522960; x=1774127760; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PXp0UJW1KcE0gv+LECPrULNv/xmNQRUU8w7JOQquz3k=;
        b=YuRyfpvsY2wB79pJab92g/miRZcQz+W1d9HHpwlAQVKQXgH1Kkdx3fjrhPo7oG5V7Z
         JZqtmIgtenSNLEp5rBVpFKIhsEKxFMxiBEdiXNM541pPZWPzZOCGLuIDSkpZ2Qkg6O5I
         e1wpOVYu5i3hwwLbjHySnt02dGObl1I3LZRb0XBx9TMleSPxTiS4s/UpCyuMxh4h1AtL
         anfnbr48wvY9QFIC0WSIY+8ODL9BYcwmtvJVlBQg3xBgfIq3KBSif/CleF9Acqs5TYqP
         MJJq3zo8+2SnSzPGT4NoafRmqNU+4KJCwvJnNMoBBb1E6I7GiaJ4/kSArgWe24SlWs/B
         CbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773522960; x=1774127760;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PXp0UJW1KcE0gv+LECPrULNv/xmNQRUU8w7JOQquz3k=;
        b=ELSshttxVooeLMmIrSHwrfF5t+Ow3j+JD3JwTs0VbpeVVBMDGhWuPRqnXQRnIatfqT
         1QKw5sZqhDiLYa/7ZDCb4KjrhJqTr+JQxlUdccAGiXCK39IDjVlaTJlAYP11F26igUEd
         6iMvucSIK35REsaDKQWCY7cwc7vKTN7q6KCOjz9VZ8zy67a0rxmi0WnG5R6LgSII8R5D
         wozRGcronjPmCZO6IdGdU673v+A2heaXRv5g6mqJQJSgYBMpf1Podpcx+NkkCcrD5e4R
         nTuyKH0UIn6PrAdu1yITwWOwyU+K0yikNjqz2XcMNFHtmTDi8sX0nUFy2SY+2Tw6IX6O
         ADYg==
X-Gm-Message-State: AOJu0Yza5RlcN8A93CxkIaSE4ADqyLVEN6zzSxVt/un9RTPD89NZI9OI
	cO9e2SM686WowfzirfZyi7c6en0kVTJMf8hX0Tfj50XoxM1gVsWs9VzlI6mkTF6T
X-Gm-Gg: ATEYQzwqt+MLG6S1dGMFMtFfE7Qz7XuQYgnfSohAcQrDtaIePYWI5/WVS3edoeUxUEf
	GJF58L1gHqhMu/6NpNlp6JXRSaHVZPtXKwPNw3yzHbXQ+ry+3tiOUS19UFD+NdKvVRDAVegDWxk
	8NEEI38TbrdG5qeqyRf1kmWRPuknm0R2EtrBPnvTBNBNaip3G3VnZcWpq24rqSH/LC5w1Tgf73R
	1fC/ziRRlaLmSa3SzH4ZRrQkt5A4/9wVJfYFKA5rpeeqfF+8hcS1kFfqxA2ZHkEqqstwg++t9p8
	m3mw8lWxwyYg7yOzw3nPEP4GlKJglq3wEMZVEsrjSk/XB3GkQmMR+FRKyRoTZmIBCOYBfX9sN3i
	cQJxY1jwBjrTDAG56FbdMysd4yZo97fHXspSIQ4q2oW2MipG2Sw9fiDdCJOEtFRvypu8lOiyoc6
	22v84FS4pZDy1XfzRuzaoIdEyBtwxSbmbi3PS2TjmvXKRDxjVqGcD2FI+GNUvSpUFav8D6v+H4m
	41V+C0YL0hpo57POCF/uJj/HBr4UwvEo+nehb4iUyz/o+0o9TtO6oA9RSc1i6NlXgc=
X-Received: by 2002:a05:690c:38a:b0:798:65ed:bbb1 with SMTP id 00721157ae682-79a1c268375mr83434307b3.60.1773522959952;
        Sat, 14 Mar 2026 14:15:59 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:4c00:f174:ec69:bc86:8883])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79917ee4feasm65929687b3.30.2026.03.14.14.15.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 14:15:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Mar 2026 16:15:59 -0500
Message-Id: <DH2TF3SNCHVK.1M0NFX71ROPMU@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: rename 'status' variable to 'ret'
 for consistency
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Omer El Idrissi" <omer.e.idrissi@gmail.com>,
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0
References: <20260314165600.17146-1-omer.e.idrissi@gmail.com>
In-Reply-To: <20260314165600.17146-1-omer.e.idrissi@gmail.com>

On Sat Mar 14, 2026 at 11:56 AM CDT, Omer El Idrissi wrote:
> The kernel commonly uses 'ret', 'retval', 'err' etc. for return value
> tracking. No functional change intended beyond style and error handling
> improvement.
>
> Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
> ---

I think the code is fine as is.

Thanks,

ET
