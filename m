Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943F5301471
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 23:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774828531; cv=none; b=Bvn+kiaTYGycVGK3BTW2qrQrfbItGkQGZ4dqHzZil0uGcxdnuOAy210k1KdF3iBen20KnQ0YZVz8EPT3HVBSXhzC62BS3/VUfYmddKJLwjsO5AlKd/LMhFLsDtb5qmgJX36T6F8POlKfS/s9lDd3x9TalAMRCs1/udtSG3z6yAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774828531; c=relaxed/simple;
	bh=iK6k6wVWoGSPxebog6GSGeYMdrd9VWXxq/T6SufUUhI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=j+pog/GP/DvcXKg0G5IpCLei189u0AngKcoUPVTWEONhnF0Iq3EJsLo7eQoR8mzFb5A7PA2Dx8u/ysMRdTzaAqRcb/Gk2t/jkeaKfDycJ4wrEysyqaaPSp0VXzawjqpbD7b02qjkYFSpcM7Qxvz0CNkbtEB8g9P09Ocn+3xoznI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uq1weXCn; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uq1weXCn"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6501d242e3fso284042d50.0
        for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 16:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774828530; x=1775433330; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0VU3rURASB3xmKXbpfEuIdWMLBUBmM/GB0+ERKVpfc=;
        b=Uq1weXCndEH2O2/vx0GtIlrMabP+hdVUMoJ9VxdJwLZbLdzsebOGgSQSUCCKy/PJLZ
         I0qRNsSqyUynCWWuuYz/nIz7rIPDq0NJ2XsEd4qOKxR1D+0goyOOd19u9XaRvJGOs6ZJ
         Fu6KG+lbLiyEUdwSfoyAfm9aVWdP/OQE8jzMbGRFYhVq65M3PLdn+oNSwyydigzCcbOy
         X2MQ934PIQmUVBWAsluQXW9FEhb6+Ml99eWu2w7IFpFCtbQJIRea7KP/6eVhV5Pq29UF
         DkFTU4tXWwhidlvYAIGYAw49Sbqr5dyc8Zxl6Zn/WotBbT+GXRr/IImsaOM+T3CN0UvK
         WOFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774828530; x=1775433330;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a0VU3rURASB3xmKXbpfEuIdWMLBUBmM/GB0+ERKVpfc=;
        b=S4xkPl7isKCZ8izmhaO3QhZ9TwmJHKdmQdfaNH503QMRcqGF49bZJignJeat8PvnJU
         WnSzMVjgrFBcYg7sNOWdBB61t4d/RZleyl3ghSVPVqDhFPTDilXMjwrAnkXd8dpqvlYN
         5tGMtlU1LKbNmefFIkKZsPPFTJ60qVgghD+nOfGN7gCuSCkkLRG/YqQKExH+ae/VznHk
         v07nsw4aqUqe9RnIs51c5oHBZ7ZcWlHk1e49IbM5FBoEEESvrLBY+U12G7JaiGvsKonZ
         w58pkCXxrQsHccK636geEpDHjGr9pjRYWYRHCuKFypg/cSXaHJlK7h/e85lVuO2iv8J5
         m3Vg==
X-Gm-Message-State: AOJu0Yxnmgcqink1WKEV6GWe2xe1ooJ2oBrdJJttZUt3xNVFjxNZFaEo
	+goMhfe2GsN5b6zOOMZt/rRK4VmfBVy9NNoOB+xaq0Fqpq+CsygEjO+/
X-Gm-Gg: ATEYQzxbdgZ47fmptEKr2QquoElCGomdAN9dWdYG+Jm7MNd/3VC0FaZZCicalMOs071
	yoIdOeiilhbwH/WYdUsRfl0tSFs1HSBZprmK0DAzymZ5IZeyeXFdtF4hOWM8rlhrH9NNrocv4lY
	ibNGQuXD6vL0nnC/my+BnviH8OlPv+4EbzLBHkb2ku5yIkO+QL35TNkmjxTe6Zm3SLzX7Bsfrzr
	rwYo0I7RySQ/9zxqUyEuHsIix17iY1+AypQ5Hku7F+Ku2BJOEyk4fOwXAF6HMyhNkMLkQZcb3MD
	46YAgUbap10edMb5aJTJOOG6fW7cG5cHAHq+86X+/DQ4tn8ZL580141YutcxkU4Nq3IFk1On1i7
	bzh27EL49xa8OvjNhcZNgOXz5C3Ii33W2H/lDPDeOFYkKdSijupJn1gcsrXf9eS+FTU70bH3qJp
	NHOgIJEkPXb3xRVsmTzGVNVbeJ+p2DHq9A32I3WGT5UByH6H/6e1v4uD4IAMgCbOQizj8uj4GpB
	7tYIkcyv+M4+kZd8HxniGP7v4jxTtxRs/XQOpBhBCY=
X-Received: by 2002:a05:690c:e3c2:b0:79a:38a2:d8d4 with SMTP id 00721157ae682-79bde08102dmr97798557b3.49.1774828529616;
        Sun, 29 Mar 2026 16:55:29 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79cba1730e6sm27548827b3.36.2026.03.29.16.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 16:55:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 29 Mar 2026 18:55:19 -0500
Message-Id: <DHFO7A4A1HSI.1WLUP4HZPSOKL@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: rename camelCase variable
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Bhavya Gupta" <anim8tor.ing@gmail.com>, <gregkh@linuxfoundation.org>,
 <ethantidmore06@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <acjdwatHpEkfBiXT@gamin8ing>
In-Reply-To: <acjdwatHpEkfBiXT@gamin8ing>

On Sun Mar 29, 2026 at 3:07 AM CDT, Bhavya Gupta wrote:
> Rename the "pIE" variable to "ie" to comply with the linux kernel coding
> style.
>
> This fixes the following checkpatch.pl warnings:
> 	CHECK: Avoid CamelCase: <pIE>
>
> Signed-off-by: Bhavya Gupta <anim8tor.ing@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
