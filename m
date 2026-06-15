Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D123EFD34
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 12:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781528064; cv=none; b=AdMLJrI85FrBFbJXydTYEOpuIrpM3fmM9VtoTePfY4q7Wl78YTTpI5VxaJpeWebHl+44N7QGXQs/h5U5s2Yly8fyU+VDB6340rq9PKzVWk66YdKjrWY4mACGpipNxszjbFtsQD/u1zQA6D6ueMHppuSy0HqkRQCiFAX+tVnTVzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781528064; c=relaxed/simple;
	bh=ygWh7XPPeN2IhJW13xjw/ayHmo1XbiUx1EBBvIUWe1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JEO0JvB37xSgOEAweNUc1pp6tK+wyVtPDgeNCKEUx/C0rlXSQS1EDf3Ob6tueouAmfUuBi8XeKoXZB/iYftZ0gk8dTOaz5sJn0xNZvWAmuBoDhQzvk8kjM9uU/5yMW/eN6voUrMwgC6qk3QuEngzYBNsDtpMlF1dCQg01k0CElU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIad7OwA; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIad7OwA"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-915d64fead9so439683785a.0
        for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 05:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781528062; x=1782132862; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dmd48Hggmv542DQUj/7sD0NrDzOrMbip1lNCqoHIvs4=;
        b=jIad7OwA+/fTe6dXu3U1jkIgvJGWvy9MaGonrniOiCRh51Q19uZe2U6xmwErBlZX/W
         l4jwBMazGGQhKjj4GlX22TTH5CfmjimZievE1WaxYK6VEI7LpZiBp63n4E9JKDFDcXbz
         LQL16N/Ljw3scnatkgYaZRT4HueCKoK1nwAAv7XoT6nlR4Jrp76QZI/iC3XqiYVWkOyX
         29pPEkc+lIQT3XXx9JLKmbbyPsE2HeqshcobmsxTWoPlnYYBRIP2mLK8ksxUARj3Yrs8
         lHwy5UwRvAntTIknf4Vhhdm0YorkrMlCCl9zjlt47qEBJbyzXvHXKTrGuSFLHQcB1Igh
         McbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781528062; x=1782132862;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dmd48Hggmv542DQUj/7sD0NrDzOrMbip1lNCqoHIvs4=;
        b=XKuA+xQxM61gNoWVF6FQJpAxOKZJIc6NqbeTXBrT8poo5ZNJA1r+eZ6yBN/LhxnoEz
         ael7VKVraMipJM2KCynBQha205fmKGuvArrqThqkBKO0TeuJK4NBk9oOaV9Wo1vKvAao
         z3+LQGZn5z2/1IQMaHRuZmOib1Iwa5Y7FSO2okCxgSv3xwtJcxZWazfsmkFiX/WZl9Yy
         LmBMmR4Tf9T32GSSVNuBLWx4fmht6Wy+AZ0FdDXiGy48sDsW/h5lg0aiHfMZPntl98V0
         voxxV0X5XRDsyK8hWKTpTdpENwO6M8FZDk82oXk57iaPej5dxxLRBrxgEOK10oUastJz
         SiDw==
X-Forwarded-Encrypted: i=1; AFNElJ+Usq33TCu864n8KK0xEELEQ/aHK+FZiBa8SXx2vSPjNzOXz5hWUbo0UB0PzElxI3yl8O027LneuOOV7IKu@lists.linux.dev
X-Gm-Message-State: AOJu0YyxXxIrVv+mHMKbOIkfCgncoaxfaTcAzB6a+MQvPbHE2C4xccZ2
	fGGucsWbRl1q246vDvg5Meg6hjZr7c9yo6Ap196TeH9JDzAm2KISh0Bh
X-Gm-Gg: Acq92OGw024BGra8AXDZ3ZqL/HXs9zhhVdkjP+kp58mf25QKEzskCkK+w0ukITeFLLL
	b1rNX8Y3X7FVFnIwriRkllHJQkbaEIEQ/zUz9Uy+szaT+qwylJFbWdeQjFEsq6h2HHaNR4qpHpF
	qsrxdH+7CYDnxuVLhrlGc8TqZsfxr0wcTMM1g4grypumT7MpG9f+AJlDzxTPsB5Hy1fIMf+QANf
	Tzsl2HvC3ckadG3wsZ0XOHtrqL0wdxBEfpolpGslqU0jnLc0LTiZIRMuHK/BvExXTDfjfOy6LBR
	31xGhYcIUgrf5tW2T/kondDK7gKEayQVgA3se/Yw9hziG8qKOwOECy4OQ0t6sXahj+lpXeXtE75
	sONm3h9Q797bfva2w+q7cZPtfp6NdXvEceDJ8TRuEsGQBUkID7q1YmLJtOmsAjYCmsnmk5Nt7y3
	PG0fi/6YjI45vnou2D
X-Received: by 2002:a05:620a:2681:b0:910:c1ba:91d3 with SMTP id af79cd13be357-91619f7d7b3mr1822650185a.45.1781528062312;
        Mon, 15 Jun 2026 05:54:22 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91619ed7215sm1064856085a.7.2026.06.15.05.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:54:21 -0700 (PDT)
Date: Mon, 15 Jun 2026 15:54:15 +0300
From: Dan Carpenter <error27@gmail.com>
To: Devansh Soni <devanshsoni874@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: wrap long pointer arithmetic line
Message-ID: <ai_199LQK4cGqXYu@stanley.mountain>
References: <20260615122822.31103-1-devanshsoni874@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615122822.31103-1-devanshsoni874@gmail.com>

On Mon, Jun 15, 2026 at 05:58:22PM +0530, Devansh Soni wrote:
> Wrap a long pointer arithmetic line to resolve a checkpatch.pl
> line length warning.
> 
> Signed-off-by: Devansh Soni <devanshsoni874@gmail.com>
> ---

Please wait a day between resends.  Follow all the other v2 rules
etc.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

