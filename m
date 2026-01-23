Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32672262FC1
	for <linux-staging@lists.linux.dev>; Fri, 23 Jan 2026 09:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769158952; cv=none; b=Up7jvD2waEWIeJNploWYc07+aDBHJcICkJaAwVSceFb4466v4BPJJUGr81mZ6WelQW+87HRAMNXJxwy5rqd/eRybzFn49Zws8z/wKVX1Bzo/KhHufYVZvTRQevPp0fd14Lj6LjjMGe0epjhJbh8lQMzuUilijDtT/GmvvIelSuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769158952; c=relaxed/simple;
	bh=aWwB09OHfzjrEGJ1WjLbt4jhfPVsDmb2oqk3Uy4yxdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a2MQJN/EbOZTk+PFO5TIItnlWwwsPoxH0woFlndPqka7cWCFI01Klfvs+/cWPx/AKAJ7jN6D59EU4SbMTeIFE89UUgHpwEtgrWQ2ZOje6talYm35oF8qa6o3anRugoFNhTSEO88xTNWmjxK54ObTD2u98no8nxFbytRQ4cA5t60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ofUNiUaY; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ofUNiUaY"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b884a84e622so251212866b.1
        for <linux-staging@lists.linux.dev>; Fri, 23 Jan 2026 01:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769158949; x=1769763749; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sbX16+sGtOKpaVoSIjx13QfQPgcDS419pJdlbx5EMvg=;
        b=ofUNiUaYncJSjZePFZDI/ij3FSbNzwLzA4CttAzzRkKubKQvvaSOe1xLDfU3EOzMud
         3uYwGcha0fOOp4Mf8T0pU2e/ZeqVqR7/57ZHdXA/VcCYrD0h7iuLmkdguVINuPGI35ix
         AjfrB3d0MxL7YdoNYYJdeXuGMXr8Whho78j05hSUPgjcBVAjas2aHJ/tQ0ac+xIRO5vD
         INg3MCccoSGQp/iHfofFoV82uP/5u7kqnRifNoEC/U1Jk+8637NZfBvsOltCbt6TItVc
         aRs88KPyu9eWARCXQPUwZWGrVDVnUxiLHxz9/14+NUW4yBo24CHRXmNf5XPDWtHevfNk
         QmTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769158949; x=1769763749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sbX16+sGtOKpaVoSIjx13QfQPgcDS419pJdlbx5EMvg=;
        b=ctRBTUtcZRiQbD3DeuPdJpNvKaCxeSOQe/41IDJZfLfR4yxOXUohTGA39+w6Tt2azR
         eeXoUL6vTv+iFR5tAXwiKcOau6AQCrABMuEl2gAyoXXRa/LgdYs642sYe32zpAKf5/0q
         CMLuZPp2FSQCWyVgRdknXI6g+leNaA6rJ9zSlN6Vld8uxAYUFdvesZCDBhvJU5VJvYSO
         h7oGg43jKnDo5Cd6toFI+qo81Gl7tbDsESRpPl2lvrjwl+vNNOF8CQZrK94VD0fZw68v
         guSEJagvEy+6pjIr2DJsaAo6ynEpiQ+02BJy3ANh5EKrgx/p+BORvYm9583i/niPPbHp
         1Cyw==
X-Forwarded-Encrypted: i=1; AJvYcCWpDWxmMExAefmT8WA3nfO9VcrYe2kHCiQf4lmA4CaAbRFbkZ0k9hYn1sUQN9HSRqECyCG5pajsbyicLRBH@lists.linux.dev
X-Gm-Message-State: AOJu0YyQHW71iSKvpnnS3/3EchX8Ib3CRHXWHbkEgrS3iP6J9OQOuN1b
	y7PuaIjfo6mm6PlLoviq+tkjj2+5bqweXjkIfmKbWgBAJxI9NTJo3cS/dC03XrxQHL0=
X-Gm-Gg: AZuq6aIJPLnJkyJQSrdf58d+QoRErcZhnA5S8koXFauAVNcdKED5zZyipY+XXG6LC1O
	exU4L8zdIaUT5v6VgmX4m/rw4uajADAhO94/Z6IiDk06gy1/ufbeh/kL/pVOC047KspgqO1nEY1
	mNVyenD8Y7l3ghHqRQ1HdpX/EtmUJ0nVpczw+SQsp88G/nLCKy7Jqb0FzPDppuXwC9XsCQBkZKe
	W0Siwma+xiwId+CZi8Fhpl2yNqjWxqSAg/KKr1bXjwg68IZWhYr3ebbbhYloldVzu6ZXZanFFwj
	hX6egUFkIKTE1qnE04/4BcFJa/UpdmDRhlZV/CDRbaRCm8MoKeoYPPep4QnFhqEC0gIz7c2qYn9
	GGhuVHwPR+ad8Drg29m833Lx/M1fDujwpfHGRA85VBqn3bYMGGjRZ++3YKu5xlfifkoljfyYQ8d
	URzvJjv5EAq6QTypu7vOtv5ygb5rQ=
X-Received: by 2002:a17:907:944e:b0:b87:1d71:f44d with SMTP id a640c23a62f3a-b885ac0fd3dmr137875866b.11.1769158948448;
        Fri, 23 Jan 2026 01:02:28 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f73855sm4997958f8f.29.2026.01.23.01.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 01:02:28 -0800 (PST)
Date: Fri, 23 Jan 2026 12:02:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] staging: most: dim2: replace macro with static inline
 function
Message-ID: <aXM5IcS9jNTytEgS@stanley.mountain>
References: <20260123054708.11140-1-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123054708.11140-1-ethantidmore06@gmail.com>

On Thu, Jan 22, 2026 at 11:47:08PM -0600, Ethan Tidmore wrote:
> Replace unsafe macro with static inline function to avoid side effects.
> 
> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
> ---
>  drivers/staging/most/dim2/dim2.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
> index dad2abe6c0c9..a075a2df349e 100644
> --- a/drivers/staging/most/dim2/dim2.c
> +++ b/drivers/staging/most/dim2/dim2.c
> @@ -113,10 +113,12 @@ static inline struct dim2_hdm *iface_to_hdm(struct most_interface *iface)
>  	return container_of(iface, struct dim2_hdm, most_iface);
>  }
>  
> -/* Macro to identify a network status message */
> -#define PACKET_IS_NET_INFO(p)  \
> -	(((p)[1] == 0x18) && ((p)[2] == 0x05) && ((p)[3] == 0x0C) && \
> -	 ((p)[13] == 0x3C) && ((p)[14] == 0x00) && ((p)[15] == 0x0A))
> +/* Identify a network status message */
> +static inline bool packet_is_net_info(const u8 *p)

These days we tend not to mark functions as inline since the compiler
is smart enough to do it on it's own and it's mostly going to ignore
our inlining suggestions anyway.  If it really matters in benchmarking
the use the __always_inline annotation.

> +{
> +	return p[1] == 0x18 && p[2] == 0x05 && p[3] == 0x0C &&
> +		p[13] == 0x3C && p[14] == 0x00 && p[15] == 0x0A;

This should be aligned slight differently.
[tab][space x 7]p[13] == 0x3C && p[14] == 0x00 && p[15] == 0x0A;

regards,
dan carpenter

