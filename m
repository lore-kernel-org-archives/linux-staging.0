Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF0B214A9B
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 08:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776067736; cv=none; b=kNkNgPqkTBLbnUOu0vqQ4UcsZC3p4G2GNTsGFdPWwM3tfDrVsS8PcPBSMn/fbZM3s1qxgNwWGeA75LmOsP231ogVvo901dSZB+7buE1rWf47x7by3ussKH6m40iErezG5rNsQznMlMap65cR3+QqecGAEz//XLSPtgOE0wtXdl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776067736; c=relaxed/simple;
	bh=07XUjGti6c23bhhuDREuvLhUWrCtiIEv05+fAHNkL7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kIitTzyr8COIS1UD1tiR7F6zA67uzHRg8gpiHoOJEWSFM/O/SBDhAVMYVWy0LQiw88klHE0FSuTa8vP0cNHfIO1AO9Q3nu08zL3hEIkcqaBKLmPdq3tciegV19CGz856g1fH6IYW728Saaj704/cNhiG5Nzc98qa29YURzJ3PGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=irRgvZm6; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="irRgvZm6"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488d2079582so35649785e9.2
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 01:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776067733; x=1776672533; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bqvPWwnQajWp/ZMSh8mExyk1McDwKxudtQ4kJAZDswY=;
        b=irRgvZm66BFVVveKbgqsoBUBeJFGiHPsDTRXDoGe8ItYINmvPbh5rLnBD9wD+0BT1v
         DS75CQku1MWnTuinJK/d9y68I0oDpDA2MiLBlj7SO8bsytP0Z4C787QzPJmh7r5QnLx/
         XWBuoky9GTlK1KtsOueB8DzTftOpl2eC9TvS5r3RIWvvUzpEXTu+rcCjZNLM5NoS0xIr
         mC5CgAHmrCr1Rd7rMO1yBW7OOTfYHLGhjnBO7sIwtmHVutvO7GkH5LeVNMPTMYIemVEQ
         eQXeZLE0AXUStfrk+JR1XLezEJol333xnwD+Ols+BVwRnLdQHI0flQxp0lmgQFerMwwt
         gdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776067733; x=1776672533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bqvPWwnQajWp/ZMSh8mExyk1McDwKxudtQ4kJAZDswY=;
        b=R4j56KdLZMgHDmdxD9+C4A2GyMv6ibo0mkMB+i6jOKbEK9+RXLWWyhu/fMjIeg9WJU
         CmrImFImrPzrcPAiUm1WGVK0U3zxVE4ndMuAWhsN9HLRHFJtAWPAcINB6DK0NuSKyS8Y
         JQ+EYaC8nbuWjq+MA0BO4wJ4meWKhgB/gyN/oGwRZK79crDdhAB8vy4FkEqnrPZ8Jio3
         2fdAxlOFVXb66K95OlS56v9d/JLEKkI2mpTNrx3qFLpnJeBlDPFi1Mml+ONQHEnoZEYF
         vqse3gR2vupafugB7Xmme/ndeIALJZFf7qBsKqN1Z1HyC269jjIbYsJEHL6VcR/D5Ove
         5Drw==
X-Forwarded-Encrypted: i=1; AFNElJ9i5E9XjqhnLGhhgBAWQ9AfyRaQeTis531PffgFzZsW+eYgJUNzDGUHRX93NvvybwsJF3cgZ5lrEyRfd3eq@lists.linux.dev
X-Gm-Message-State: AOJu0YxslGKnCd/LwNG3wBMpy6xp1RWzKw0vc4TFRyBDW2amWGtHxKat
	p+HnYaQpz8tMoHurPPVOoFHUzDrmduhMetvFA+kfCycBFikUfXD041jt
X-Gm-Gg: AeBDieubvVynEvTgCuGSMXeTSNLIJIfzHbLoF6PWNGu0Jbm5k7fUwLL6zdcq8UaxtLo
	QyMiy2XrMhF8ZCdPqE2zRK+AgfwktU1PxSO+/HziQTxFjXDXfZ/tBqCGWyHa16X0CurZcaq/Qav
	z6hfUmx/WC9fXwl/bw7l2ufcWz3zs070e7mSrq5j70HZ6B4mK3Fg1X53w2vq+GwGaG4dYD9Gq4P
	4yULNxcRk7tEpw/SJa2bcpB7tnxvk+5v69ULPt+Jts5FRixFxphGdVU5WhpHeNLXaRWLaYGFtIv
	CrfyYPWgj0XG0kfp6QLgoQEC7ZMx8f6dq5ELmRON0zGW1xfCFCCC2MsRquAEi5c2vjhsIcj7c/+
	kMGSQZJf0rYHrdjzeXRgtys3HgCR6WsWXNMwEr3OwYIwvvtEoHabM2Kx17n1leULoIcgZH5uhdP
	lJrCPT692jKM63yiRUWz0=
X-Received: by 2002:a05:600c:3150:b0:486:fcc7:d6a with SMTP id 5b1f17b1804b1-488d67f4c4dmr185375045e9.13.1776067732487;
        Mon, 13 Apr 2026 01:08:52 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d68712casm91433755e9.30.2026.04.13.01.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:08:50 -0700 (PDT)
Date: Mon, 13 Apr 2026 11:08:47 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: linux-tegra@vger.kernel.org, marvin24@gmx.de,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] staging: nvec: fix use-after-free in
 nvec_rx_completed()
Message-ID: <adykjx57doahzkWH@stanley.mountain>
References: <20260412205117.387125-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412205117.387125-1-hossu.alexandru@gmail.com>

On Sun, Apr 12, 2026 at 10:51:16PM +0200, Alexandru Hossu wrote:
> In nvec_rx_completed(), when an incomplete RX transfer is detected,
> nvec_msg_free() is called to return the message back to the pool by
> clearing its 'used' atomic flag. Immediately after this, the code
> accesses nvec->rx->data[0] to check the message type.
> 
> Since nvec_msg_free() marks the pool slot as available via atomic_set(),
> any concurrent or subsequent call to nvec_msg_alloc() could claim that
> same slot and overwrite its data[] array. Reading nvec->rx->data[0] after
> freeing the message is therefore a use-after-free.
> 
> Fix this by saving the message type byte before calling nvec_msg_free(),
> then using the saved value for the battery quirk check.
> 
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>

Add a Fixes tag.

> ---
>  drivers/staging/nvec/nvec.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index 952c5a849a56..75877038847f 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -498,11 +498,14 @@ static void nvec_rx_completed(struct nvec_chip *nvec)
>  			(uint)nvec_msg_size(nvec->rx),
>  			(uint)nvec->rx->pos);
>  
> +		/* Save before freeing to avoid use-after-free */

Delete this comment.  (Obvious).

> +		unsigned char msg_type = nvec->rx->data[0];

Move this declaration to the start of the block.

Otherwise, it looks good.

regards,
dan carpenter

> +
>  		nvec_msg_free(nvec, nvec->rx);
>  		nvec->state = 0;
>  
>  		/* Battery quirk - Often incomplete, and likes to crash */
> -		if (nvec->rx->data[0] == NVEC_BAT)
> +		if (msg_type == NVEC_BAT)
>  			complete(&nvec->ec_transfer);
>  
>  		return;
