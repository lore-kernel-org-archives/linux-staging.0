Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25BF2D4B68
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 09:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782205215; cv=none; b=DrN75E/vqB47L462ZHdVpd8bumxywBRTQF76USO8udTMcYFIh11e1duZwM1EHPXmkeFhh1A63WYOUy0twrO+DzmrKHVITtOCUf5yiaHHlkGf9U2D9FPIcGnvMjAzgCtDCuncsWugTUj8/pxheDg5BthlBM/vDOOOG0X+8HwWdcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782205215; c=relaxed/simple;
	bh=IA6DnmpsemgYjF0EMK73a8x7Pqm7RpM398h0o+omG6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ssKI6Sw/TnfrLUMkR9ncmStpG48Y1c7t48B/5gOMyLOwyC2i+6kuLJxr+1rkC12/a0ssjRV0iqD4HFf7IyBc0/eD29SeGiBrYm/QiQRofR+Wc9zQVNOBvdJhAaBCe8DWTigm3Tc7ivGenFwDO5vwbnwfiJ0GPjpvivo4gGV0Hq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TD1+nnfE; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TD1+nnfE"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-68bd9fce347so9962473a12.2
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 02:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782205212; x=1782810012; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MOQX8xqxBJPocdJUjjpZRh5SF3BDRR1529+3bYBkUq8=;
        b=TD1+nnfEeRVrpDCpMm0Txv6x+AtdIxv37IqGwnkUXdfWMqw1yWOLEXStzUFdPp/o4V
         cBZCNfJd7kEL4sE+S5pqTbvSEVJf/T9VzqHjbTGD8R/3SaSnM1neT3Ba91pY8IjcQ+6r
         4tdY/dZ8ajug+wjocuB1dKiVTfPO1kuK1HB/G5BrTCmtnt+DFhSiYRqSmNrb3cbMixPE
         WUlxgW4+2S3UaEE8twBY0eMFeiWpYAJIGQdVg7nZZGmCpfpKr1P02Mf4a/cBRKb4Ilfg
         d64isiPOLZ8N9icd6bBNCGimG/g1l+BbTw941bLYGpmvGu0xSe/tssSeHBS6M0uwhyh1
         safQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782205212; x=1782810012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MOQX8xqxBJPocdJUjjpZRh5SF3BDRR1529+3bYBkUq8=;
        b=YQ9CX5Pg6J06pIl6u976cOFZS3x5Tye812FdN7aCv0DA7RFI8kYh7yA9rQ6KqxcrQX
         ceaxVAp/FBh45b/3X+wCI9OHdbC0dKiYReNg3/jCnOokk31SD3uzdcFSCm9elV+5oZhl
         CbdkdgsKo4ikiD8x4/Gz3KKidoFmZv1gMiafS+Qa9PxA7vFtLHmeeUpyh8ZIu4wxfUya
         ba4ruBjhD1ZeisXNeZC4dqQcKPd8Qzit8PLVgpGLtJGO4JJY2quN/4LP2giDPGyHwm1S
         yUVnJ2hvPwe+Bs33Aml/6zqO/kmFR1vj6NM0SZoKojc/q52EhrrjQ/FprUguA7Lo5TcD
         teUw==
X-Forwarded-Encrypted: i=1; AFNElJ/UhhkJINYEXlD9+YR+D20LQsJmeeEnB6et8BbGo5KRLDFqcxDS/Vbm/NKMX/4HrZmvAo1VqrggzYH4CAPb@lists.linux.dev
X-Gm-Message-State: AOJu0YxhLwEqpk4XIlnC/p2Ojhc0OVThtlDpTPccSrFo7Xoxw6rSrC9s
	WrmQOUQ2UVk8bXT4XGKaNmRaz8Sa5jQ/sLuetWTeMWykxa4BDmQnE3hq
X-Gm-Gg: AfdE7ckOFwzW6NVKBhPCOAVKapUbTGt+YYLQhTrD2WOWG6+n6SCuGPvqWu/hlotmh7c
	qgYYf8n2SpddS1GSd8lGxRwBuA76tCxaoLrj2o+t/SVPLQro7J9UXjcpqnzuFJxa1KvyJkpJNEW
	+QH11O5DtMVrb2K+1KDLVeMdUpob+zTK2+yONugCcO9Jf8sHjRZEsJtSa4PbUt0mpgmQzJs1HfU
	zfVXQADhDpLR1PjslX8oR1JXCNo0ZFVfBzMphlWtQHj1PXj9h0tw1G3CmnlYUf9WHmauPbYNtMQ
	fuJDJDaZfVaJyUGYPA+4P18ez/5iManLriMXu76VpDdBjT78e7yrHs5dfC2mfVkcQBRja8kuOAV
	0QA5cirVwM5dy4ACv+1at1wMAZo1TwHCgkFlswOU6Znpzhrosbw42Ta8XA8NAN9MqFcObzVWOGh
	aMcnUVhLZ2tuoQl8XT4pM=
X-Received: by 2002:a17:907:3e21:b0:c0e:b685:66d with SMTP id a640c23a62f3a-c0eb6850993mr413768866b.41.1782205211794;
        Tue, 23 Jun 2026 02:00:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60aca46csm480036766b.36.2026.06.23.02.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 02:00:10 -0700 (PDT)
Date: Tue, 23 Jun 2026 12:00:07 +0300
From: Dan Carpenter <error27@gmail.com>
To: Aditya Chari <adi25charis@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unused function declarations
Message-ID: <ajpLF34Tvh2u1TFe@stanley.mountain>
References: <20260622052543.61590-1-adi25charis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622052543.61590-1-adi25charis@gmail.com>

On Mon, Jun 22, 2026 at 10:55:43AM +0530, Aditya Chari wrote:
> rtl8192c_translate_rx_signal_stuff() and rtl8192c_query_rx_desc_status()
> are declared in rtl8192c_recv.h but have no implementation and no
> caller anywhere in the kernel tree. They are leftover from when this
> driver was derived from Realtek's shared vendor codebase covering
> multiple chip families.
> 
> Verified via grep across the full tree that neither symbol is
> referenced outside this declaration, and confirmed via a full build
> of the module before and after removal that no warnings or errors
> are introduced.
> 
> This addresses the "find and remove any code for other chips that is
> left over" item in the driver's TODO file.
> 
> Signed-off-by: Aditya Chari <adi25charis@gmail.com>
> ---

You're working against an old tree.  Work against linux-next or
devel-next.

regards,
dan carpenter

