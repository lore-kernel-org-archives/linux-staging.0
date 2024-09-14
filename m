Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886711CFECD
	for <linux-staging@lists.linux.dev>; Sat, 14 Sep 2024 16:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726332692; cv=none; b=BzL78yUQXd1Weembao4KWbZP/Qx13ch8YvbL7NVOr9cMt2b1S0rphQIbe6NS1Xve8nqgnm35AeSySaSDDdi+imAxBjKIJoclo97y2QKPe0XKnmWbZkuTpwYuGC3MfVb6jLgu5HJq/8XJpewjPJQcY0jTtGt0LQv2//1H9Yspg/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726332692; c=relaxed/simple;
	bh=4YIUED8NTvL+pJU9x1zOi1xxGpnRcuZT+fTCARpcsEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fardyu6jNSII0jwGC5KqETyti5ay50aP7TriExCujDpnkLJ2IzZaQvbgV11mDNnUtx9psHQfU1C/wvtkjPeMSk/53Nna3MsEen+D2a4/N93SoJDQej0Y8CRMpyD/sVkJ2AlhcarOwfzUA+t4RJH4Mmq1b0ckYKK6SDQJTuuXfZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dCDVidU4; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dCDVidU4"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c3d209db94so3732515a12.3
        for <linux-staging@lists.linux.dev>; Sat, 14 Sep 2024 09:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726332689; x=1726937489; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=260L8wObmIZ37leKXxRsSt6Vzwvxj0E4EQRxHhUduKk=;
        b=dCDVidU4XwjlixS2AoJbm3hI3u0MIqqA4mQ7azy0AS8DcIjnz4svS7068HHoqA+EhT
         ELb39lOr+0PMN2lXuQKDRkxniHcQ8nz7/c040UhC7qIMzGxDKEWuU2T2xM4bVx8Yhj+K
         bZQIX+HDqDgQ7t5AFuDyPrzH9L31RtWTuprQarV8MxsmjZSG638+B7lVXyGA9d9FEtQz
         H5EjgvCcwtKKWhfZJF7Ay0ki5sQXUcMgMK/zq8MJ2qo2suL1P2gxLWoE3KaTJzGifhYU
         2hAacIzaiOfqEyUwr+ZT8l2j8CXW8vwuDi3vwDx82tMr/cSunyVaEfPtjqGURQ6B12xK
         93xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726332689; x=1726937489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=260L8wObmIZ37leKXxRsSt6Vzwvxj0E4EQRxHhUduKk=;
        b=WrCAPv27ETAodd3YwcS0Q04jdSDi7KPIJFuO4dNtS9D8Lu5rE410FPLJekjmwoJYLg
         gkC9ymFdvAXm264s0rRh0aCMh9Q7scq2qfKv3GhmJ37pbyE7zSh6q6P2BXdKIQByVB7g
         OFvi3cUPGRIufg/9IuS4a+hF701H+6iQR78HyPvRRnyNhf+09R49pvnamZuVgiP9ZioH
         yjLGPuS0BfWLQs5uDk1vgMGcemfhZQVL19Cqeou0Aw5NslMX5xEWQzx98JA3mPDt3yww
         LG6SaRBaJDlJ0u0aQxJ6EZB6jcAXhwozIQvn3AmJSckmp23IF+2zlt/sONIV1+P0/thP
         g8Vw==
X-Forwarded-Encrypted: i=1; AJvYcCVSLNMHU9/RTRJ2A2T2EvPnKyUEUSzJOhfSvOYvgVkrE7JVtDzG20tFtoIOICt/2RkldcGZ6oLHmIxBxrCK@lists.linux.dev
X-Gm-Message-State: AOJu0Yyg1NBhXe8KOfi3w/BpFBkUfv5LMWB/Yfxh/fA0u3hpm3gb7/JQ
	4opJUGkjgUiWHknBLMnBsY63zRqw7lb+muMIiFdqTlmIDML4GsIuoFmSe20q0Zo=
X-Google-Smtp-Source: AGHT+IEg9Ep2YCZ/L0TFudDfeLg21XrwMV52bqJ4ziTDK6kTpQLQzJiKRJFmO88/YXaT2/T/CXXbOw==
X-Received: by 2002:a17:907:6d28:b0:a8d:1655:a423 with SMTP id a640c23a62f3a-a9029678c66mr1159702366b.56.1726332688539;
        Sat, 14 Sep 2024 09:51:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612b3997sm98312866b.104.2024.09.14.09.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 09:51:28 -0700 (PDT)
Date: Sat, 14 Sep 2024 19:51:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: octeon: Use new initialization api for
 tasklet
Message-ID: <3d9ff743-01bb-4b40-9551-fb220bf3c7f3@stanley.mountain>
References: <20240913191734.805815-1-abhishektamboli9@gmail.com>
 <2024091424-glisten-unmanned-bb8f@gregkh>
 <ZuW9iInzizGypLRt@embed-PC.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZuW9iInzizGypLRt@embed-PC.myguest.virtualbox.org>

On Sat, Sep 14, 2024 at 10:14:56PM +0530, Abhishek Tamboli wrote:
> Hi Greg,
> 
> On Sat, Sep 14, 2024 at 10:20:02AM +0200, Greg KH wrote:
> > On Sat, Sep 14, 2024 at 12:47:34AM +0530, Abhishek Tamboli wrote:
> > > Use the new api DECLARE_TASKLET instead of DECLARE_TASKLET_OLD
> > > introduced in commit 12cc923f1ccc ("tasklet: Introduce new
> > > initialization API").
> > 
> > This says what you are doing, but not why you are doing this.
> > 
> > Why is this needed?  What bug does this fix?  The code is the exact same
> > afterward so why should this be accepted?
> > 
>  While this patch doesn't fix any functional bug, it ensures that the 
>  code is kept up to date with the new Initialization API for tasklets.

You need to resend the patch with this information included in the commit
message.

regards,
dan carpenter

