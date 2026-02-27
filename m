Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E89275AF0
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 15:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772205983; cv=none; b=kv9CTZkowIxqMtwGLFPb0dCDmf4StGbwixHZKXXekZMeBi0WOdrWD1KPe6Iz9iTUYwQtD86Mf4uK9ULG/AKIr/Lwwr3/Z/SIat9ekTWG3JMzfX06A/qbnqB/sKsSxcgPWYYeh3OF9i1KQm3d7/fjEfY2lgfpa9a16ngvl/iCJ8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772205983; c=relaxed/simple;
	bh=JyNYlAFq+mZXJ6l7xmFjj/hTQpbWxmf5PUerXEm4Pcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eiQL0fES4tEfVGkWgw8qYSMlv0RMdNpecQ0WzjAGOyPng9zK6hkGXD1HeLWeVfT8xtw6gcVKYa3idYRQNRprd1WCuofzTUw78JwPqno1w77r8Yothf5e0zHX6gcblZsmDje9ZiT76zVF1SSYAf9RP6+EA00EsJMW6Qs36Iwn+Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wle2OVnS; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wle2OVnS"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-79853c0f5b9so19029357b3.0
        for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 07:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772205982; x=1772810782; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7jTsh1OGilDd7V8krzK/KaTZbBztl+bUWqraBmttTak=;
        b=Wle2OVnSO7Nn0uSvn9P+LDAa+0hUP/YGJ5p0eZ1kJdLNQ7n1u1doHIdsobjtHZmttf
         1OT5szr74UrgHQEEvgTIJMkfyrmN5P/wKPLiH6FMYEKG+StCR9cUnrOLyRO1Cbtj2Qnx
         YNWKzSwAua21RFt0Hz56udIksdmoxolbj9HIcAGhBoX94DR3NwrskU0Xrjh6IZ4cwr5v
         SHEJr9rAuXIyealJHMXBF9+PCCxuF6Jdwwpy+pUZvsSg5SMrnnltmtRlFeIIB9u4pcDL
         yDClgX6xNvDboeBJQ1dIittLLiUQXn4QO+ycXExXKE8GpaFC1XQRf1bDrNPp4Xod6zSl
         wkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772205982; x=1772810782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7jTsh1OGilDd7V8krzK/KaTZbBztl+bUWqraBmttTak=;
        b=cx2hSlDMve7nurB4feylKcX0s5hxi+YdXT5wCiHpe4X1zZr9hIKYVOI6g1NGVZ1Pwq
         yuq455mHqn9+mAGZNsNYGQgC1VWIQe7d7BmjRQRc1Ga3OedgJ88ABGtC7r9CN3hxityy
         EFoZJ5xdFMXhY2OJ4nBb6GRr/ow/yxwxwUB3TDz7Gk2pBtwr5E5o21DKiWJEOOfhksmw
         xRRiQC9ozu9sZ7hI94KLhpdWMrQtGIpBkK25tlwwv2xHVO/8NCGF1QoqdoTYNoR/Pq6r
         FpR3c3KaSNGREGxv84/oRDianujVM1zHm0Y1OcD4bHXFomTbI6pImymQn5BmYmXJmGc3
         P76A==
X-Forwarded-Encrypted: i=1; AJvYcCW7AjhTKdaweNy6xtKfYXLzMjLmiCQfyGZS6OA99jPwycHEQ9hdmm1+gQe66D17DpkJfXj2Lwyz3GKGG9c7@lists.linux.dev
X-Gm-Message-State: AOJu0YxsqrHh1GwO/e48a3ZTF5kUCxVpP5teGGVhIvejde2VGRFgTM+7
	clHt2dCUbiBdUAdOUDg947MJcvmMxFP4KMOfjjwsJuEVG324ZCX4i7ic
X-Gm-Gg: ATEYQzxn87/FjfEOxetvl+ydJzjy953uMfUi6PY6WDRNzBjvumPRfVAgnopWYQwb6mJ
	QTairQgXvAQHFIf+NVlVzGjR91bjrVPyi1+ddC/g/hGSKi3hJSi94wKIGGgcI7gu3rRNj/HGkpj
	s71dsS5EkOhwimBom4B7hkIeIoEY3oSh1YtqR/i0BrFXgycYvm/tQ5CPlmi+yqKe+azau+zSyxI
	Te0dBLVakbLcDy0UOar74WvtoFqLIEFneSi5w9yNvlhh9XXqBkKoqPqdiKWZsEAm+8LgPJ60hun
	oVkE3X/AuydDrkzswkiSLAkKyqpBcl4s9spU5tThMnPafJ/px5VBNo9tsfHhQP+iYe3zCkuDvic
	8C97krZ5ux+P1kdwsACQwWtXTNC5shlfHSsmzUMdPNxvHgk+AOeYsVncZrvBtxYZZpy2NDATkEd
	GilSpOsJ3MAfzWHLGufM0X8KDB
X-Received: by 2002:a05:690c:89:b0:797:b06c:1a73 with SMTP id 00721157ae682-798854ae1a5mr25992167b3.13.1772205981429;
        Fri, 27 Feb 2026 07:26:21 -0800 (PST)
Received: from archlinux ([185.140.163.152])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876bf9211sm22448407b3.29.2026.02.27.07.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:26:21 -0800 (PST)
Date: Fri, 27 Feb 2026 18:26:16 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: gregkh@linuxfoundation.org, dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: remove unused 'ratelen' parameter
 from rtw_check_network_type()
Message-ID: <aaG3mJqfNxZui8lw@archlinux>
References: <20260226141333.9909-1-nikolayof23@gmail.com>
 <DGP0F87MHPIS.1IE1IQAR5Z8QB@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGP0F87MHPIS.1IE1IQAR5Z8QB@gmail.com>

On Thu, Feb 26, 2026 at 09:47:57AM -0600, Ethan Tidmore wrote:
> On Thu Feb 26, 2026 at 8:10 AM CST, Nikolay Kulikov wrote:
> > The rtw_check_network_type() function takes a 'ratelen' parameter, but
> > does not use it in any way. Also remove the local variable in rtw_ap.c
> > created just to pass a value to this unused parameter.
> >
> > Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
> > ---
> 
> ...
> 
> 
> > @@ -890,7 +887,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
> >  		support_rate_num += ie_len;
> >  	}
> >  
> > -	network_type = rtw_check_network_type(support_rate, support_rate_num, channel);
> > +	network_type = rtw_check_network_type(support_rate, channel);
> 
> I think you can delete support_rate_num in this function too.

Is it possible to remove it completely? It's used as a temporary buffer
for 'ie_len', so perhaps just the last line that increments
'support_rate_num' can be removed:

> >  		support_rate_num += ie_len;

since this value is not used anywhere below.


Thanks,

Nikolay
