Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733F2420496
	for <linux-staging@lists.linux.dev>; Tue, 18 Aug 2026 08:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787042566; cv=none; b=i84c7wsZ/bJjFtuV/uhK47WHInFM0BZFNkY/NQBwJ4njVVPwTpwv2GQIL1o5yukbd0TcZC8XDxca/X3ByZPmgKqWzC8CE13OZEnX2UpI5NpxOkLo+FamluwKaQoTu/nGjJBi2o4vDyIQJIseQT7+0IrPHEcd7L6BKlpXbSqN2oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787042566; c=relaxed/simple;
	bh=5XZe3NZLMgufTp3JCAAmwFymD3a/Xq1SRhcyproH2b8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y/F5PQ/gpZ1TX2VH72/FmTrzYDx/neQGMKOFgm8xjRcv/BpDLxvueDml09tKF9xE2Sp2Rm76uUjcGcafaD0y/4RT5IR/9HAIaqfW6IpIbtTkHtYKXK6KhwpoeXfZWxHaRP/qgsmVHILHk+9gYZYCGlaCfkTkEPg4tsPh3UIVIJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r7JoZJC6; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r7JoZJC6"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-495437bb891so6801575e9.1
        for <linux-staging@lists.linux.dev>; Tue, 18 Aug 2026 01:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787042562; x=1787647362; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cXJNXcxC2Oi4PDZX2LMxQQZUAfuD4xaxdp0+jcGWDfo=;
        b=r7JoZJC6t/kFZKo1zxkacI6H8a2R1OAdWdszeZnb6TnwWZuk9lPQ1rXtUZmwjnE9yt
         1XJxW0qfml7OraVzegjoePwPfuxrPAg2fKEAPc/UUhNA8Cxp5yXvkIj9ImzpLNh89SpS
         rxJMEyTZO+T5QDvBNkZ8AgH3fz5Okz58/xr2U1zSSP8o3XgCoVCmY2o8T7/b2CWdKVkB
         J/TE0rBCdeoag1XMdAotBzczYbMHGehLex7kIDSHhdl7VbvvRdixE/37+tKNipPAwNqT
         nNMPohpK4wbtYJlQZtXQg2fDo7daQ6cmyarslpcPShenFH6kWAh72reyZ7m3gNKa6qxd
         H7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787042563; x=1787647363;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cXJNXcxC2Oi4PDZX2LMxQQZUAfuD4xaxdp0+jcGWDfo=;
        b=DK6IqiGRISwUKk/wZRmDrEsPyIkjRrck5YKbAcU61IUk/nv1BgtCRC6WPxE0C9bkvQ
         Tb0UHCHBkW5B7xy0l3vR5b3Gf2d/7bQ2f8WMKfNj30VtHrQMrTJ+1tB4EsB+mL2P4Jpj
         37w1WyRU1hqDpuJmTycg0d3mysZ9jJOEN1hPWR2QQEPV4Hw/JBvxQafmc98++9MtrQfY
         YON/7D2LZIEv+G97/b2Wpo75CQwDEyi0UHNEtzLaCw2s+m70z0E2IYloH8cBC8QEabLh
         uUaJh1YLE5HAcDyMLQ9dROgeMoodSUOwx44C42JTdOQ9L8oD9gxJ3lOFDT/zeS7C25QO
         ZByA==
X-Forwarded-Encrypted: i=1; AHgh+RqKR+Hqzd2EtPcJqDWToEeklEu71ViruVgvpd83QeIinDrAZAdSujJGD4QqNtMYqqCTU+JFcjZCbl8mxOFi@lists.linux.dev
X-Gm-Message-State: AOJu0YzTRfb1W9omgdgG7wHa0y6OWKHwKX+vj26P6o3RkyXve4zk8d2g
	YXcJwAkdWz4zQpxCgulrfK0a9fmNCSWzqg/C/DwW8PbWXONomTkdK3hF
X-Gm-Gg: AR+sD129v8FkcuH+CsjVSQkHm1aFKsQuSsnsXZcOLu4L363NzUfarfPudI36c2u8Xut
	VB14Umn2cLF4LLZYncOce5pnuPC1UZCOm7Lw00wK5R0xujy9/nS8ZxA8Of+c77mo7pPLQ+vmYTq
	43V5Be97qNtMzGUGBoiXLxFoHbeLBtr6NOAUK+KsaT8fNdvP4uLITCl0HWtXzX2Zcxzhdg/u30B
	YjJmpJgk3op3InsHNgMNBNJ+TRvaw0ajATl35iUO5jMZV4KhuKEJCICcPmZnbd3mekeZ2p2K0nj
	P/De4eInneKNZhLtFvt2NbizjlMbXA2lmgE18WxT0V7RNyXIyG1Y8Dwx5PBf2KIqt9NC4jq5UV4
	NMRNcTYobiqzCixpblpY8gd+8x/2izfIYTc9A8PkDoC2kQF93P4vi8dfrCZsWVoyl8En0VXJ8hU
	vkYZ28zSlHhGVtCWibc6EaFz7CjhWGbwBYwMmAgn2U7OaHgaj2dEAoPGhKswNNMppLvyo=
X-Received: by 2002:a05:600c:858e:b0:499:5f81:8ca1 with SMTP id 5b1f17b1804b1-499a08d2c5fmr79367705e9.6.1787042562460;
        Tue, 18 Aug 2026 01:42:42 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4999d0876b8sm164833375e9.8.2026.08.18.01.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:42:40 -0700 (PDT)
Date: Tue, 18 Aug 2026 11:42:37 +0300
From: Dan Carpenter <error27@gmail.com>
To: Malathi <malathi.a2000@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: rtl8723bs: remove unusual
 'NDIS_802_11_RATES_EX' type
Message-ID: <aoQa_RWy2iBsLRZg@stanley.mountain>
References: <20260818082622.1186194-1-malathi.a2000@gmail.com>
 <20260818082622.1186194-2-malathi.a2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818082622.1186194-2-malathi.a2000@gmail.com>

On Tue, Aug 18, 2026 at 08:26:22AM +0000, Malathi wrote:
> Remove the 'NDIS_802_11_RATES_EX' type and replace the variables of this
> type with an array of 'u8', which makes the code more understandable and
> gets rid of an unnecessary 'typedef'.
> 
> 'u8' and the 'unsigned char' the typedef expanded to are the same type and
> the array length is unchanged, so there is no functional change. Also
> update the comment in wlan_bssdef.h that referred to the removed type.
> 
> Signed-off-by: Malathi <malathi.a2000@gmail.com>

Do you sign legal documents with just the one name?

This doesn't apply.  Please, work against staging-devel or linux-next.

regards,
dan carpenter

