Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792651693;
	b=SJAnrMIwPCR7RZqEIb5JrCjZb9RuGeDbcGSzXJJg6fMTK7rK4bqYo5jlu1zpXPPEKYQF
	 AUB1etIKS2cSY25oKgVNFY+VRjKBwiaMf0MzVNGtUcXaWSygav5fzweAhnn3vUeR7/SdA
	 0k7WZdy8jsAgY57zHKeNAAM14c8WDIIRqHTs0jSm8q4arHdlZGiABL22LbkSpM3EliRCN
	 OWM1PDNeGF8fM+tDggJq5W0jl9VQMtCdhaH7yMTEoPc9PNQqRueEMk55xQe3Dfed5j45o
	 Gwid7IA/Uxvt3JJOkjLxTJ4Hy6gqOnBEn7AiOIpyZLBuX4e10mpO767IWChJI8YzTow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792651693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=yIFW7u5Qk7xxuUPgKR45tAVUFJEOPQMn/9vgAno+ziw=;
	b=MusnmD5S1pfDqlC9v1LFv/SW3JLeGLzNITtd2Q0qMmdO4VxOYzE/2zPNA4ES2R41TCs/
	 jpBE2zlXJnKFdAo7q3Epu/sl7AjrqLfN5hf1jPrACXHwsHtlVGsyWjNtKc20Vi/RBzBZz
	 UJt+VOBjulTmCPGZi8TUXMARUIwOsa8EdDMBalBBl3AWUUle95s03Xk5Y5L31HliaijB5
	 YIu2aYhwzlxXcof+CqqsxRhS3C68drRc4lOZLTwHygLWUCFWYyoY10CIhZy//nbUnnYmg
	 NKiMIkiwbeC2yh8LfP+e7gP0fq/ietOVYwJlIMq7m/6TPH9pET6+4dM1D/OAzbUBotQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FD7606A327
	for <linux-staging@lists.linux.dev>; Thu, 22 Oct 2026 06:48:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77FD7606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a209a7fd1bso743025e9.1
        for <linux-staging@lists.linux.dev>; Wed, 21 Oct 2026 23:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792651687; x=1793256487; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yIFW7u5Qk7xxuUPgKR45tAVUFJEOPQMn/9vgAno+ziw=;
        b=TfqCKgog5uHUcWF9nx3WSGRj6tn2tLeUN1PwMgWp0c7Z/Fl+cYZ0rA+DGo+NYSuMIh
         3bKuxIldvFBIDjZHAvJEr11bQkbvRkzjK/RG/NEIqGG9BXJZ1fePzqDmeuPpjmbyw/SK
         lfV7DTxBdqTMj1bmaDKquUZBqGuUmmW0XSGFkgkUVZ2RT0/FyPxd+h9sb2R8Fdqo+Pgq
         1h9H05RG5yCPt2XcixuRhDmYBqjZQsvNSetOb8rgwmSFz/U/nEVcajLzdgxSE2Va7Sqy
         lM/ddDSlwETYbp4Rb7gyBgnbJjeXz8yrhbOvyjSDuKrLb9jW4+ZkRWbU2m3RJ4+798ji
         tihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792651687; x=1793256487;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yIFW7u5Qk7xxuUPgKR45tAVUFJEOPQMn/9vgAno+ziw=;
        b=Tk8uNNZ5fEBMHh6ToYtjxO1pKsd5cIYciBkDsVWA7Gv1Vt47D0J1g9L7fz3GTyfGgg
         iiHK/YrBYQ8dCwwpwkZfRe/ObjRAnTi+i7Us7NVu3fZWoQno+MHMAVSI9tKPSArOwiU1
         3U8joGr/reJs77V8tIVxIjnS/kKqqj4DNMkl7o52f2jGDaS5y02ab573sUAXdPRcAe75
         c79+4wfV0Dbg4C1dgrnXgMd82cnyLz1zmfOaiAZlzTblqR4WRa4DUCBaoXs/dHZKhd/H
         Pk5XKvXd2TeFowFBs8hsSeC3szkpI2DO10+fqpFClGoL1gUnpL0Kh+6U2wTk0v/LyKL/
         cr9Q==
X-Forwarded-Encrypted: i=1; AKwUvByloScuKtpDY/IikF/I5QAu26M0XhgxtnBaua1/ahSds7miTWCYKLHXUm3b2h00HdTDRTHOO1TDqg+JQHmh@lists.linux.dev
X-Gm-Message-State: AFq9FYJJzasIB2q6IRqj++7U86CHhKfZZac5JF5x3FCi1PwSegveiA2N
	pEQl78Fue+D2VtCzV0bTmJ92qTAlUpypt6mbHSz1oNxWYR7telpfLUtG82BSC8IlNhuEZp2a
X-Gm-Gg: AYBFou00Ly77PMH1AJzvJoP1gBzvLTzsTgcNJgFFHuZHU7Z99Jj4kBI83tUjnaD5RXD
	cPuU8u6jeTJiroeWtzbyWoDb4bDJEm/P0CmBSVZVHgG/g00z8ZEscoHSpE87d/GZbRUdFPvQIzu
	BRH+vqfhR3N5kpVo5E+saTsxIXmflwTi/EVxpTOcvwFISEeEBRcnYHBM1s+IJObQscv+HCSFlnH
	7e83fIxC/haPAQwcEf23zTMLUYDX9E+KIYELqAgPWPA+NCSYfgPsrARyxG1O4m+LRqC7gF+Ly3r
	q597hXFZ0DlijCEaM79PeQWIfuQH0PpLAz8HQltOMW5Usgi8T6jc2M2Aes1q6D1ur7g52yLqCSA
	fHcwDZrzC7OdbhlwDfVOGLObPPxCYsTS+0ebLxwT78NsO2CPu3iagSf9UCdk95irp+IAi30/hII
	VokEzActY29RAH4Oaqd2adL4kDDuExIK9Jmoc5OjHVZrR7beflJOwSsHVF4j8eQs1iuD7HOeu88
	+ocEz6mLSiK7YCU85hyQEVspOerC+/v1lTa0NQYmq96f8VfwFl+
X-Received: by 2002:a05:600c:6995:b0:4a1:fb0d:3878 with SMTP id 5b1f17b1804b1-4a1fdd3d619mr80013245e9.22.1792651686627;
        Wed, 21 Oct 2026 23:48:06 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a207b29276sm44521885e9.6.2026.10.21.23.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 23:48:06 -0700 (PDT)
Date: Thu, 22 Oct 2026 09:48:01 +0300
From: Dan Carpenter <error27@gmail.com>
To: Akshat Rawat <akshatrawat095@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: add missing newlines to sysfs_emit()
Message-ID: <atmxoeUJ5onEYKbO@stanley.mountain>
References: <20261022064535.13466-1-akshatrawat095@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022064535.13466-1-akshatrawat095@gmail.com>

On Thu, Oct 22, 2026 at 06:45:35AM +0000, Akshat Rawat wrote:
> According to Documentation/filesystems/sysfs.rst, sysfs attribute show()
> callbacks should include a terminating newline. Add the missing newlines
> to the sysfs_emit() format strings in gb_audio_module_*_show().
> 
> Signed-off-by: Akshat Rawat <akshatrawat095@gmail.com>
> ---

Assume that old warnings are false positives and do a search on lore
to figure out why.

regards,
dan carpenter

