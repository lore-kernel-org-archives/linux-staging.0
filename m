Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64FA30E0CC
	for <linux-staging@lists.linux.dev>; Sun,  3 May 2026 09:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777800342; cv=none; b=qZxcUOggbMelMNq90Bxuoh9HdFXv0oHN9/eLODD+BopZ5p5ByfzQTWFi22r7IxTbfnWJIgqlk49X3LE7zMbarBdmk+n1tXc9AsNjJ9nXC8H69E4tpde3wHlrvZKTKtryacxmyUu02Wo3EQVV0/GaYgcf+pCiIel2qDnA3YIcJBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777800342; c=relaxed/simple;
	bh=uc7hy+erXi+KvgPkTbZWgj85ppkKZVAF6lDx++czlMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ULtXqNH38N8YyezNQ6/ehffEGqCh+4W9UrycbpaHypc32yb1kb1iTp2cMZJIQA0kTLIyDHIrf7wZ2prxWi9S3yk2yFMofwdFXqKvDOk1TqNafoinBbntfr8Cxqp0MclRAa2VIpspsLrRKdRw97jRbtugFPmcOgvxsIObOxniNds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JoFVtR9m; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JoFVtR9m"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a3cee3a271so3091717e87.3
        for <linux-staging@lists.linux.dev>; Sun, 03 May 2026 02:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777800339; x=1778405139; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ySr2nmXRbTadYaKgGsRRMB5U6QdBoQ543sIGpZ5HyGU=;
        b=JoFVtR9mTRY7GPqX0N7PpdK35e8dPHJtHc4/51DyxMETJpaKh3u2uDS95lvitUxgIr
         +B/7PLZYqvlzXdi5u0jcw3s+0mcxPV5RyltV2HyvlutEpcuFiDUEU7OmCWZoxVZGNf6u
         /UY+UYN3yuup0tnw1Uv1ivjPQnKGQgZnbLBVVu2HwzsWj2SA4PrIFGXSAY4VThvCKeSC
         bosNpRReGcdUaZhdlzp15Htw3kWcaGkty8r1KpwRGijpM40JI41Ad3stZ4F6Uz2p2XzU
         tXG6H+wBn4ELDEQJ75qewg30ro7/VmJvC5HtzL6kwizvOIv1nwSwnG/rKba9FD7SHAQd
         Jhkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777800339; x=1778405139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ySr2nmXRbTadYaKgGsRRMB5U6QdBoQ543sIGpZ5HyGU=;
        b=l4ZfoVa9OQ2/IZI1ADyXIKELK72fSBynDMvhiYHRxeqy2tKbv/QeIIYIZ3EChYRrrx
         VR+xrmQ0svlgy2H0eSjJdHB+YoDMapD8qQpijMgIIv22IQFAJUQH5UNiMdpSp/gX+zQ2
         ctDbU+R8dTwFq0INOuMOOAUO1RK37FLhWQ7gVcYFW3r1r2a2MegVRZHb8Pwys0dyjoy+
         44mZAStcbRHhzbICp7OH8xi02WpsNlFgd+9BtHS3kIEEVbwjQWsEsKmmKjhRZI+xBEPC
         mc/+XbjvhRNAklx3LEbsXJU2BEVdd9LHaTAsOakwqvppOH3sfoqbD57xlZOJO41s4iWM
         CUlQ==
X-Forwarded-Encrypted: i=1; AFNElJ+K2Qd58Ay1pJzdP7EMU8mCnLsvayv0NkXwipUJLJyEPz9D3IfFyaOx6bRulos6mU9EY0hZk7olEIVo6n1n@lists.linux.dev
X-Gm-Message-State: AOJu0YznqkeoevuH6pUvY30l26SRwVshyES7Ii5CylPCXh72rK5Ll0ct
	HN+PVp+UYDcFIx+6pSaEFxQhBnO8+nqPm3qOr+cvBOnR3fA5Hi1SQeys
X-Gm-Gg: AeBDieuY3Of6xuHfeb1arMr06WFQ2NqtdpImrjbiRZRWOyd8lwMNKJBAjy/nR5N2wZ5
	C78o0/V2rb4I2W9xwFI5+9IWKs/YXw0xsxCin3/0ghD88zCajwgaQqQIBoiyJFQ5vIVr1bfzoM5
	ks2RqkR2zT4yHw0leH4ooz5ASCIaSoyn+4JwCvQUynpkrMvRIHyjzxJZipBW7yCA99gv8b+x6MU
	A5w4rp47mg3cdKyVYf5DpNrPCwt3frj34+1/Yej2nhRZjwwKJq2u5TLw5cZxD82WVVF3O0P54hU
	hTy3wTxeaYzTSXPmORhxTC4FNPCn2gzPC6JM73P5UmAQ3gxtlo8k03PbzC8w/UfdGd44dbepN+U
	Bc2UwwyPtlTrZXoei2uo8m169+u+QiXmAvvx3SV3ycih35t08Ql4pJ7P/ksE1M6M9Tk0SDfq69K
	4PMEa4M6hyfONhILk+EflddQqJRarD4hYKqbM=
X-Received: by 2002:a05:6512:a96:b0:5a2:a0b0:94a with SMTP id 2adb3069b0e04-5a8631b9e95mr1458532e87.25.1777800338644;
        Sun, 03 May 2026 02:25:38 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8690b9fc6sm932104e87.4.2026.05.03.02.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 02:25:38 -0700 (PDT)
Date: Sun, 3 May 2026 12:25:34 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: msohail22 <mohd.sohail.biz@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: simplify NULL pointer checks
Message-ID: <afcUjiVlxZIj3Ma0@archlinux>
References: <20260502112017.234436-1-mohd.sohail.biz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260502112017.234436-1-mohd.sohail.biz@gmail.com>

On Sat, May 02, 2026 at 04:50:17PM +0530, msohail22 wrote:
> Replace ptr == NULL with !ptr in rtw_recv.h and ioctl_cfg80211.c.
> 
> Improves readability and follows kernel coding style.
> No functional changes.
> 
> Signed-off-by: msohail22 <mohd.sohail.biz@gmail.com>

You should use your "real" name, like this:

	Signed-off-by: From Author <from@author.example.org>


Thanks,
Nikolay

