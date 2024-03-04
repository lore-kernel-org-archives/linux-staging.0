Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D068314A8C
	for <linux-staging@lists.linux.dev>; Mon,  4 Mar 2024 08:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709540717; cv=none; b=hfgZlSlZq0ACHDuYLiIi0EopkAIr1WfnDN65Qh968OzfwncaLsEXLSw5z1gpepMh3kHNz0uJmlOHGoOlZNLnzAJDdUlBlAxZ0/If538z3TNefAHYtVMVNWWHZq51kYB/Kmyi9bxkdyIRtCUZcT66kjvgUy894XlyI3WcehPXV6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709540717; c=relaxed/simple;
	bh=PA43H0l92iEdSQLpl7NEJdLZAEyAWSnu7uYqTERALdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qnNXlFrYT/sR+XELPibDR+Uv8NL3s+g21dm7XRE8hQI3VmwJQkxnIX3cv5vqu7P0UbOnh63Vg4ibYgxFaUXcaLGezvgV+k6hW5oyBnW96F5XXnh5YGc+lmVBanvU9wvkxQLlAZXuNCz804/5MfrA65RPq5nN2h8W4KXZK5gWm2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NCbz77OJ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NCbz77OJ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-412e2dfa58eso3636365e9.0
        for <linux-staging@lists.linux.dev>; Mon, 04 Mar 2024 00:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709540714; x=1710145514; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G1k8H6YNmE9fVEof3VA99d+GcsZvQR5zaYJWZxNgnyQ=;
        b=NCbz77OJYL2kHWdewmLa2nM/ySInbZqusI2dmL0RrgtKpnc/kP/1LFZeap3UntLkLC
         5jMxzannOfyx8nWvAcERs010/bk7IaPa8heZTYbMu7XAkdgr7iL+EyC+6pMN2dvrU1JK
         0hUtUP+vs+nKXhNWPlgMsIaXJYIJkQ/icBDm/2eVin5Op1An1tju6AI/DXH6DdjYELYL
         nXodyefGfy0vCNJ8g8r68XYOOp8YlFMhz2TDtERwLQniLitDZrh9M8WojxyfDa1JKVSO
         brDQ8kBR/97n9wN1Z0pAZ8U8rmpQty5pONWCQsqUBv7sAI/hYgS1vqfS/7zrLYINr/q+
         e3qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709540714; x=1710145514;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1k8H6YNmE9fVEof3VA99d+GcsZvQR5zaYJWZxNgnyQ=;
        b=fz+Rep+42y+Kn3Pb/JytdVwIA1a1sFHUXOKM0RZqk51n/moGYGWZCceiuRAWZ/tCTc
         a4Wl3tJvyYqkhCY1jKN/21elKc4dYWzWHQgxdy0btCS0l+JVvsfjMzBigd+DhJi/QZqw
         SBJAXxkCP7KGbR4EvTMD0yecQpsW8x9WsUWn4iAjWOwZhDVnFYBiiGoFZvoAhCA7Jr1C
         Nx6JsC1Zfn2bnooT2dNtHTKHFp8fpPYC67B+aM+MgvpoRHJI3HwXlJlccyKBSdhkBX+W
         NEELLceHEJz/6uV+R/PBdgxEffNXQWJIk9Ot5piF2nkXxbfBNcJWoof8Yc9qnpoSODA3
         4QvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKXv3/eOOmjHi52EKehlCSP9IQSf5diigPjt+ub6+X+NL1huGGzKOCAaLUDchWU3OttzQNJrqkU98c394DNT4zH5M+z9X+Zr7REq8mzw==
X-Gm-Message-State: AOJu0YxJMvoCNEFqoMIZG5CA8eo9rMyjyA/jV4WXf4zyHJ3yOz8wLn9m
	zhONpqvSQA96cvi5hE5KKsZVQdfMPdtYNq02ANXhjCFUnptr7dGnSp/36wnl0NqWzJTtKJWPwQ7
	C
X-Google-Smtp-Source: AGHT+IGRYYV2sBVydhBNDWXMz41tOoAB8DFTf7PFILtuT+3zsdGozNazJl76p4ctyMkytSLGw64LLA==
X-Received: by 2002:a05:600c:34ca:b0:412:c790:5a8a with SMTP id d10-20020a05600c34ca00b00412c7905a8amr7713599wmq.15.1709540714327;
        Mon, 04 Mar 2024 00:25:14 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id h9-20020a05600c350900b00412de55135dsm3950291wmq.41.2024.03.04.00.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 00:25:14 -0800 (PST)
Date: Mon, 4 Mar 2024 11:25:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Aman Sharma <210100011@iitb.ac.in>
Cc: Gregkh <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Staging: pi433: Updated bitrate range from datasheet
Message-ID: <1440d44b-c16d-4307-9457-5c3ae44716ff@moroto.mountain>
References: <91454ef9b4a12f01e13d69b675d81aff@iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91454ef9b4a12f01e13d69b675d81aff@iitb.ac.in>

On Mon, Mar 04, 2024 at 11:23:40AM +0530, Aman Sharma wrote:
> Updated bitrate range for FSK and OOK modulation from the RFM69 Datasheet.
> The values are mentioned in Section 2.3.2 of the datasheet.

Have you tested these as well?  Sending untested patches is not
necessarily against the rules, but it seems like maybe you have this
hardware and can test it.  Could you please talk about what testing you
did?

> 
> Signed-off-by: Aman Sharma<amansharma6122002@gmail.com>
                            ^
Missing space.

regards,
dan carpenter


