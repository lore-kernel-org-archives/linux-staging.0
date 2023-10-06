Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4A3273F9
	for <linux-staging@lists.linux.dev>; Fri,  6 Oct 2023 15:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M/O18aW5"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4065f29e933so21771835e9.1
        for <linux-staging@lists.linux.dev>; Fri, 06 Oct 2023 08:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696606235; x=1697211035; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I3c82TQumh06vWIwbRDa6r1GsoIQwjGbKt5vXDIgETs=;
        b=M/O18aW5N/wRPxAv3rB3sKVYDEXB5lBapyLgUfPwZL/hxj6I7+SXLfqZNW5TwkF/kO
         kBxs5aiaKx7sD3Igl2qaETvcoS6b4+TPmVP+9eWBlR1Sul19KsrqM+2liTQzF5P28FaD
         upTGKtAUu3+mIikdY7t68EoU67zCoIr7Pq/jbEU3T1vBk8k6xSPnKzfxt6sMDyTKo3pa
         b8enxFKBuxqdN3y4SmHP4i6jCqqKgx8wQojUDbF9+PENQWlMw091ukomo13B32BgyWZM
         fP0xoJIYt73ZmCs/sVmYmEDusZN/FCCleT+fJzgkVmWyja0yFdS404erxOuoVnJRvPcD
         yPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696606235; x=1697211035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3c82TQumh06vWIwbRDa6r1GsoIQwjGbKt5vXDIgETs=;
        b=KyP82yRCnZLMFsPd+jx2WwzNCRwsRxtEvPFnBaJwdTIYS1GRxESem2QPREDIKG6pQX
         AXomk23EzUV2mpWGzbQAfcT6ZYnzjIJHyiDGL8AB2xE/XtrQApU5sKuiDCltdVLx0Z2S
         kw4ne/krYEBwd3TKVBFSVa4ezh+hn8abrPeAVaaByR3IXFmQIv8EsYi86kyASEYTMpxi
         ZtRc3MvsrglArPp1O42PEYE2tKeImJwJw4p9s7k2KhysAOEh3L3UbiUyZowfbLH2I07M
         sh5QGFrW460VzPYrY4gTNJbAxOAk9Kwua6gkqi2SM3IOS6+bJwmgnh4LEKwsww6nXtvS
         ISYQ==
X-Gm-Message-State: AOJu0Yzab8MxvxAysZFRaK07JF7675OZQSATbH2tP0tlSpTNIfurI6ot
	y/j8BU9Uhz1NofGIcQNt1o4=
X-Google-Smtp-Source: AGHT+IEa8xsqBPHQqp2wAhP91yEP0x8xXrYcu5d9meoWgs7nJt5C4R28dW32XmTynfkfrqxHsZAE8Q==
X-Received: by 2002:a1c:7c0b:0:b0:401:daf2:2737 with SMTP id x11-20020a1c7c0b000000b00401daf22737mr7557350wmc.30.1696606235095;
        Fri, 06 Oct 2023 08:30:35 -0700 (PDT)
Received: from babbage ([2001:818:e906:400:b2bc:40c:b83d:9c16])
        by smtp.gmail.com with ESMTPSA id f19-20020a1c6a13000000b00402d34ea099sm6210733wmc.29.2023.10.06.08.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 08:30:34 -0700 (PDT)
Date: Fri, 6 Oct 2023 16:30:21 +0100
From: Ricardo Lopes <ricardoapl.dev@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: manishc@marvell.com, GR-Linux-NIC-Dev@marvell.com, coiby.xu@gmail.com,
	netdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: qlge: Replace strncpy with strscpy
Message-ID: <ZSAoDYYqgoXXV4s_@babbage>
References: <20231005191459.10698-1-ricardoapl.dev@gmail.com>
 <2023100657-purge-wasting-621c@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2023100657-purge-wasting-621c@gregkh>

On Fri, Oct 06, 2023 at 03:32:28PM +0200, Greg KH wrote:
> On Thu, Oct 05, 2023 at 08:14:55PM +0100, Ricardo Lopes wrote:
> > Avoid read overflows and other misbehavior due to missing termination.
> 
> As Dan said, this is not possible here.  Can you redo the changelog text
> and resend it so that people aren't scared by the text?

Yes, I suppose removing that sentence and keeping the checkpatch.pl
warning output would do?

Thank you,

Ricardo Lopes
