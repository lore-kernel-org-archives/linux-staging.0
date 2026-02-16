Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D059F1A317D
	for <linux-staging@lists.linux.dev>; Mon, 16 Feb 2026 00:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771201392; cv=none; b=lo3e3+evpAtFmmsQG4hVWNeNQS0GidAI/7SVxE2gh/iCL9dLM4VqrRWkjE7YvLc5O/oiCjlraO5m1ZaysPmMJPEfWb5x+ek4MmyKuaQXlvE0SGwbyKegi1gyAsz/W62xZT05QBOIV0a+JQYudHx+28IIdEgaLhSwsKMjnShv7WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771201392; c=relaxed/simple;
	bh=A7PTid8uH9HASkLZiiSgK1xVqwd1EjLATUNW14KZh0U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=j3HhT/v/2aySCFbv58h0NissxnGoErd69pqzyhQQLqIj0nEa54HO910LGg4My2APAOyYxP776jVi0mEvygG3C7QrbpnVMYRWaMc/GJ/ooRHpJ/PG7znhFQr7N18fT5HdqD31oGLBKgD/sGdrvv2SDNDTpgNa3zcaXqDH/5SKB9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ui2xALle; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ui2xALle"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-797d3864d89so365777b3.1
        for <linux-staging@lists.linux.dev>; Sun, 15 Feb 2026 16:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771201391; x=1771806191; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7PTid8uH9HASkLZiiSgK1xVqwd1EjLATUNW14KZh0U=;
        b=Ui2xALleJOzsRY4Dwx9BEMm4ymlJuTVqq1yYxVifH+qAnWR460IJe7LaOfzi+Hyem2
         oIH8Jt0S9+HliDHeFznFRh4Jc81PVcWJyPYvhaVI89LhfMxgx5ICvZGzfe6L4C/CwnL+
         FNBehob2GysW6dXsNTxo9IITIKEqmCD2knMEztDtMizgBZnPJl1IjgLNm54HFObEmDZ5
         /Q0nlNI3pZEnnjG8F4EPqr7APJ22XTEmUlT0BVMB6JAAfSk4Rw3Unrysc33jFtylOXKq
         VuHcw3W86e9Q39haYnbggE3K1bmxYEIwrCQIMJESvWHiV/F9qXb/zLD97Cc2G+zI060p
         byFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771201391; x=1771806191;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A7PTid8uH9HASkLZiiSgK1xVqwd1EjLATUNW14KZh0U=;
        b=J832FvX5N+mrll+b6XQgmHGsKm0wSclpl4ObLlZ+p+mpw95p8VYh5Gb7pSmHJtl7Xl
         sd+EzFqKR70wWcb8H0z4IvQz6W7mO3s+cwgkBoKuCfU8szFdOYsQS1jPnRYIb1atCSJ2
         GOppw/gKQv1d64itD3w6uypXP6lTAFD7XjbRGSz2M3Ec7fJ+0JMxP+lViP6H4db+c/PV
         /gcMt/krCtmkRnIK/D56iIRCkxdJdrmY6c3m40TGH8j/WsiWOu/Enw2vqgoK6P8q+PdB
         kylSBLXgyQUdNgyL5ANRe2m0W0LopM48kfPOu6603YqLhxcNulPqoXurJrEbEuWvxV4a
         WpuA==
X-Gm-Message-State: AOJu0YyaolbziKihINqa0quuBFiFc3j4vxzN6ZYsjh6QFjwmbzLjkD47
	mmTve6m/bljrMnZaK/98nAJmiEun5skifPlgtoJxf3oBYrNK10uYTXBR
X-Gm-Gg: AZuq6aJOYQkWDQOvMV6K/YHvrKZUVHA0PbUp3BuIOPKCq/hQ+Vc2Pauhmme0hpUKSGJ
	fflCTPs0yasw6nrji1rB1JW5iiLGRU5x1oxrohbpxVIYEDObYFA0i/Aw9sCYppf96DgEmV5D8TJ
	WqmltwTp8/aaK6bXmb4tF3IsS3HErQ7x3Rhkgsx1C9dkB650AIHire6YY6XAMu2XwFncabcFjO3
	+6FoeNoizYaR8+svqgznZ1t2iNho8hpGABepDmgMvzU+z8Lhzkm6f73EqN+AxesTScLwXdDVYwe
	0VWkcpNpqRWuByN+xUrJWOWwau5hY/mU71PmHita0KhBvg3kQewAGZUl7R5JjkDyfWiwifS/Lz8
	/mq1KmvZnb7mQR5u3CQzz3bU3dfHIHDQw1rkNnAVUqmMguwUFWzuUI42Ktmvn5sYb99nJ63t9ty
	6LaaQyA3vmNoxn1l+yT41IfA5BrU07Gw5f5ozwwNz/7VKZPvr91KqaqaV2iuBPCIM0mH5HZeCoG
	m91tNN47oaO1kp18Og7Qm4JX+8U808GMTTG1JZ9FsMYH91hvIo=
X-Received: by 2002:a05:690c:c511:b0:796:2976:a464 with SMTP id 00721157ae682-797ac4d7dadmr48285637b3.9.1771201390568;
        Sun, 15 Feb 2026 16:23:10 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00:e3a8:26f7:7e08:88e1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c2533ccsm95017347b3.36.2026.02.15.16.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Feb 2026 16:23:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Feb 2026 18:22:53 -0600
Message-Id: <DGFYHI8O4AM5.3OX6BUEUNT14U@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: remove unused MAX_PATH_NUM defines
 for other chips
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Azamat Rakhim" <azamatrakhim8@gmail.com>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260215155659.67324-1-azamatrakhim8@gmail.com>
In-Reply-To: <20260215155659.67324-1-azamatrakhim8@gmail.com>

On Sun Feb 15, 2026 at 9:56 AM CST, Azamat Rakhim wrote:
> Remove MAX_PATH_NUM defines for chips not supported by this driver
> (92CS, 8188E, 8192E, 8812A, 8821A, 8814A, 8822B). Only
> MAX_PATH_NUM_8723B is used.
>
> Signed-off-by: Azamat Rakhim <azamatrakhim8@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
