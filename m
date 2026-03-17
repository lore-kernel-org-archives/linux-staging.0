Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F9A34DCD1
	for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 11:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773747801; cv=none; b=KWIGNKpANzZ/QKOeq8hg7dOPlD+g1R1PkGtkgKtacrahlAKRrPDnPy3E82MT8HXOIi6HkJgSD9KaWVnIuV9bb8xoyV//sQVlyuB4VWtNvJDWwBRPoBXuJG+tBgGN9U+uH0Ku/JR34S898+4S6G0ZHyTSj4Y7b05lZNnuGvNNJEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773747801; c=relaxed/simple;
	bh=iLUZn14+6rtimFfKhoQnVQGHBQrCrfF5eg0tdX9ApFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jhlLnMD7MLCWraqIY1jiJGJ5yGeVxEC5+8LpRoWL4qcNQDFCcaRZMKRTBbzBVWfxJR+sUTxj0TCNVMf7WeCcpMXV4QQjQh3JrllJv+uUhncb66BWlAcVeiZZT8ugbox6z2kPNcbfSQj0aHXEF8rs8r1vCYl70GnGQTo8o8eTxxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LxXDnpma; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LxXDnpma"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43b47b95a77so1294585f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 04:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773747799; x=1774352599; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8fNR5wIxvlPYlAMd4vfb8Hl49r1pKDzcdGZFsZ2lfMA=;
        b=LxXDnpmarr7zUZWKguKomowp5pSfHwjWw1BwbjHvqkFxW0ByhBNKOv4sDyvO38Xij+
         V3JeNWWtrZa4NI8ggtJ76sCgPC7v2fd4sybxFqAG4EU5JJjviGy2NIqWimcyaxBITxOW
         5U3OOPbglsPwfZUaJn11PiG0yCi4rnDGD9o8JIsPHBOMp6qBKT4pnI6uK5v3MqtA+qtI
         hANUaIcaCwApHTVvz5rFQt/xfPw6OGD/VxD81RdSGqHe38Q7jh3KnNkTLFl0EzPEVH2n
         qaGal6L02pXU1HLMSJiivffsgcj4KZmxBzup0qZkw9zZBaaFb1hS9PbhqVrBYAiVX59A
         Xc0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773747799; x=1774352599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8fNR5wIxvlPYlAMd4vfb8Hl49r1pKDzcdGZFsZ2lfMA=;
        b=YUwiOzhu8Xdeb5MrvarmoYhSI/hkv6Z8Wjyy/4GTVa9jIDIfh76DlPiPIZYOQxAuOe
         CYqgVo0d/KGkci8+gY6I23ZJy3VK4J3PiNI7lL0QOYkmC3s16htkVcWM8dqyIX8ZfyVb
         c1tpzWw4pTGMuSVGwbuzjzp1Tz94BWjBSgNxl9CZsdx2eY6nVkvfqVknRFWRSILyV+Yv
         c1Xy9slgqwmOr35Bcwfprrb7fYCfqwIKZGs6nkg/V68uhAmBH4P6778p/9mEK64CbzB2
         XfbT7AGeCoCt8G4ZstxAxjJRFQiz7tAPESFZ3LImNBEnIBJApnfeUqFu947b1yiHoxDQ
         g9tA==
X-Forwarded-Encrypted: i=1; AJvYcCU2P81a7EuwMaXU1UNN1gOrH+GqqV95x015RclPyGb/EsDC65ze5vGcTpL6/bdOdO8c4sSSvtXEPBzB68C7@lists.linux.dev
X-Gm-Message-State: AOJu0YxcIg7VIKoJpQys/DZaRcI99wbmzpeLX/6CoYfUA8z+W1AbnQZs
	y+En3Px8a98X2hjivhnnDAPhU+QyhmtjpRNfP/8WBoOtzBqu4z3rT0DtVxvL5xmnTOs=
X-Gm-Gg: ATEYQzwMVUsWkLpMcH1CJPoainTrwglwKwYt7tjXeW5k5XbS762ZQCyviNqjEnCkP33
	I1t0lPfvsdOfKK41ps1nx0t014W6Ep5PSbbaljWUfFkvUxmMofd1GuFWAvDvzHtsoTZ2UGdlX65
	xIEmm9OM73XxpC8Z5zk0LnmMkIX4ysEmpXL62V8Btm38Q45/O4r8iI1078SQyp0CFyoIBSKeNbR
	B0Atc1K+qPSTmOfTftz+JK0ROkwdRGKf+lDbNkkEuU+R8ZgxKQEH/NpvXsBJ4YC/VIY5kPgft0i
	eyJ53jWZffaRcLMpwNTgfU214m6nKXtIZEG6/E5kUl9fj1uHcCi0qDoF1bbeCSlZ0aKS0qyJ31/
	DARi2ZD0E8UejPRI7LPIFFMmGkDTlNQbBWFCpAGtiRpgpovpxdzjo65UdzF8OHmVC3JkeqeLfW5
	uaxqp8LfWn0vWg0b9TiietT6dbgOXVz6Lxc2AFHZM=
X-Received: by 2002:a05:6000:4014:b0:439:b541:a092 with SMTP id ffacd0b85a97d-43a04d83c63mr29302718f8f.8.1773747798917;
        Tue, 17 Mar 2026 04:43:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b45e5c233sm15187046f8f.33.2026.03.17.04.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 04:43:18 -0700 (PDT)
Date: Tue, 17 Mar 2026 14:43:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marcos Andrade <marcosandrade95963@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] staging: rtl8723bs: Cleanups for rtw_xmit.c
Message-ID: <abk-Uwo4EDoLu8Nm@stanley.mountain>
References: <20260316221924.4904-1-marcosandrade95963@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316221924.4904-1-marcosandrade95963@gmail.com>

On Mon, Mar 16, 2026 at 07:19:22PM -0300, Marcos Andrade wrote:
> This patch series cleans up rtw_xmit.c by replacing magic numbers with
> proper macros and updating the sleep API, as suggested by reviewers.
> 
> Patch 1 replaces network magic numbers with EtherType macros.
> Patch 2 updates an msleep() call to the new fsleep() API.
> 
> Changes in v5:
>  - Collected Reviewed-by tags from Ethan Tidmore for both patches.

Next time, don't do this.  Maintainer scripts do it automatically.

regards,
dan carpenter

> Changes in v4:
>  - Fixed commit message line wrapping in patch 2/2 to comply with 
>    the 75-column limit, as suggested by Ethan Tidmore.

