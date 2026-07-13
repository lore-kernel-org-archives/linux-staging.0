Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5772C36897C
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 08:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930585; cv=none; b=btneX2gn3u1FDqLec/oLBAC+henl7Fp243vNItxN/MxOL93c4UjVA3Vm5NfI68Ox3V8wgp1euhdMHNNnzg/lBnAFf9PDWHlrUOd3lOL2ZNUCirk83R7QEPFQ0Hc45sBEi4Jx0OTXkIPXpo1i8zVjU22sInMLgCC2zK46GmXgGT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930585; c=relaxed/simple;
	bh=5qOJVuaCwnHASwJkzTnlQPrwD6gwK77M2l3bU3w7MEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CDfBHhhWCchgHXejqUlqaptJGneIuna69NpVlZF6sZPGyqsxDvJtyPTCn0acMtvYTPYTmpPtuJBP41icy2wTay3J/+skbg1+rAEldd+eXgxBJ8W+ZVhb1TLP5hbl88BrbBhrX1GU1fXgWpXExF3Hj1KGbVoHeacaevzzu8IvkBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GpxJ9UYH; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GpxJ9UYH"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7eb64085c45so1745214a34.2
        for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 01:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783930583; x=1784535383; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AOBfVJjWep3oCgIsv7QYQvk7wgfT+fXTMSGIhMj/ORs=;
        b=GpxJ9UYHs6sVio4AoVx2GSyRLWVkpnIjAuOGBZX9um/4FeNPV+Z/I3GdFr2mG4txFU
         +Nqzkk+vMlr1QO9BHuWpLgiYy1htaSIBOwCw8PhXZVhCvQENklw4Li+kgXMImN5liMj4
         UK4Gnf2ilAhco+wMHnvxZ/iFbnys1uHo1BB/6YaVX82AI76iGHYJP9HHOqWuWw20vlFS
         ShAJeEt1emKk4tj6q1nPCjBVC834NDxSVmtwK7OVp8ZJ3VeTcwyqc9u3x/AvALuKgg9n
         pNcnKlqBUFGS3RhmVuObl6XBTyMhRPgGvt8lmjzTdXVbHxzO+92eWxOzGq8/EzJGgEir
         vU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930583; x=1784535383;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AOBfVJjWep3oCgIsv7QYQvk7wgfT+fXTMSGIhMj/ORs=;
        b=L9Ad++nmlBHp6/3BQKcoUwvNZvc4kOkzw9MksYXiD0AvCw/KcIZKvo7zfg4FG48G5e
         JGVU2En1lqStwGkA1aT/4qpIRP34l6NZv/N4T0lHV/mE/X2GPE4E7tRFParTBzBNBiov
         qRE9jEVH79fCtmw5bmuN2vnMni+wTuJpsEdNDhQCu42IOUO4fhmzyXi4XY48sqOPXqoX
         1Bih90zym8VS02EuXB2BkfWrX727ZIFf73NsNOzb16k0b5M6amN4IvIJKfhF5Ptp8UtD
         vcyEoLL7P28azycCufu3bZd8dki7cdNds4J56xH8mP3QeIGbMXUiXDT2PLv3sVxb13O1
         xsNQ==
X-Forwarded-Encrypted: i=1; AFNElJ8yoQrtcXJnKjQyEupskvHskbyXFWvvupOt/f4fl1/8t8ExCfrTMh7F5UXUOg20+EhI0Zg1F+GnIJXYz5XB@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8K5/nSkfH65/x+6uMz1A4VUORzuU0ov/DFW7AAcf7nGWL7cWD
	xih9+P7zZ8Ss8wy9EXGhKF2lyCAV9i/I0fy7xQKdbl8UG6lDD2rYAFXV
X-Gm-Gg: AfdE7cl+MqzJx7fPT0cJHx8eaVQG0sAi/H2rnxzydhImndkth/17ayh17P6IoCmLJ/A
	HpZaDQn97bMCAkLia0ODJgjISQ0sTCOtiI80U3G413miV7aAEqcBDHrgTY7gRownRYO3MntpsOV
	oe7Csqij0Rl/TADZ1ouNR31JKIz9wAZzedh9+2jniV1JsxvYZOQ3VjCj8l2tCCQLqp02NnwnLiu
	IfnlZzuKgKNR4KKgnLkvSUt0i81Fi7zxYoqjsaUYnXPuIHcIPk3AnbstS6tjxq7bXu3WQh7g2Tk
	Wb3nbOqE4z7dbQzsrL3udw6GcqtUlXRadVohrO/8AXc2Q13NenPdYB6qdrlLFTkqtsNshNWf7iB
	ar9VQT55tU0tTZuiGI/RQV0E+wHajW5nn2mgPp5Bt+Gr02e+rXcx/8ujCPAMfEOLkqV2762cQCv
	pU8mSb
X-Received: by 2002:a05:6830:906:b0:7e9:e7ac:907 with SMTP id 46e09a7af769-7ec0987fcdbmr5944193a34.31.1783930583398;
        Mon, 13 Jul 2026 01:16:23 -0700 (PDT)
Received: from localhost ([74.80.182.78])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcb3f6826sm12539712a34.27.2026.07.13.01.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:16:21 -0700 (PDT)
Date: Mon, 13 Jul 2026 11:16:16 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: gregkh@linuxfoundation.org, khomenkov@mailbox.org,
	khushalchitturi@gmail.com, s9430939@naver.com,
	nikolayof23@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] staging: rtl8723bs: convert rtw_make_wlanhdr() to
 return errno
Message-ID: <alSe0AzpI79IM3nl@stanley.mountain>
References: <20260713070537.15903-1-dennylin0707@gmail.com>
 <20260713070537.15903-3-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713070537.15903-3-dennylin0707@gmail.com>

On Mon, Jul 13, 2026 at 07:05:34AM +0000, Hungyu Lin wrote:
> Convert rtw_make_wlanhdr() to return 0 on success and
> a negative errno on failure.
> 
> Update the immediate caller to handle errno return values
> while preserving the existing _SUCCESS/_FAIL semantics.
> 
> No functional change intended.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---

Unrelated to this patchset but it would be good to make rtw_make_wlanhdr()
static as well.

regards,
dan carpenter

