Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCD625B0AA
	for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 10:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779531795; cv=none; b=WvOREzQy957pxJO8x7TEhLsWGbwGbizIeO5yU+wUYagfR+5c7pv7HEwnLJv3sHs4KpDNz/f4nt+9c+ctUtcixtlcHtVPjwK5aagDL7RJsYByq/BppWi8DguPjGk2mFuAItYEJrCZbRt2jwkAjtYlK0WTWvcWM2vgR8JQd9ZB3s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779531795; c=relaxed/simple;
	bh=Gd/SjD0Yc+0C5cLmQVDIyRohFZqt3MX20uLcciLoqsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a65NL636sJO2yiLqAGeQEo21l8+a1cv16x4GVuygp5GhQbLLJsGcZlJY/YUu36P0L/1PWNsmWJTDczftZ1EtPO3YIvIqyXa2SjjtHso5c2wIQRY1uqzFO+GLRUm1f32w5WPsU7qSCphqBqD9ZMm3W3xPV0bySefu+WeTSiPaAZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XNOh+b7u; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XNOh+b7u"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-44ce78ab5feso6719950f8f.0
        for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 03:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779531793; x=1780136593; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9OwKYYr3GBn268kHvXc2ShFhOmxklHzPpvQguPHVjME=;
        b=XNOh+b7u46F2Cf9SEHQUuMsWjKfBzNT48xmaBFYnNzyoMaSJu+ASNayoLhWLqJs0Ot
         UfVHjjqd/N3a5U0f+gK3Dlq6vpht8+O9LM2uFXQKsYRsvuIQQB5lVRcM/EakRU9Royq2
         zLURZ1Q4CdWX5ZyNpUoKyIoyzWzc8z/bh008mAA94WDyIAbuW+ToxDd+NGI/3M1RL/X+
         UZOyZigxFF08KmkfIjoq+4Xd6JepMw8vZQNWsnH3nkOeKW2KZ9ZVtRyKAHgCq7kZFNn9
         nql0CyqGcRCsWIw1gW+j728Z/CM128MtOcvozFyiYK11nj2EPFEYZYsundm+7dEpEooK
         ZhHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779531793; x=1780136593;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9OwKYYr3GBn268kHvXc2ShFhOmxklHzPpvQguPHVjME=;
        b=U8iIj4z6WGl995yYYQP/3jhzb0bmzOuDljLhB9V35ozV7tNq6ZrfXV/5kKWivdB98x
         CXIuDDbvEmlSLkNmeGnN4LJ7bAfLeK2mfkJDmsIS9qXgHt3aFzTtKXdt0ycIfcuFcsDJ
         W39Ko/ulA4U8eMGJ1NKF/n/OTVOIrXihLiK7upCJI3fEJzRux5I+ra09651smu/+bXYO
         mrkPoew5ultRPLUU71civCfOWQmsYJjtkbg2bZM42lQI5dIGeVGH8coRPRrvGishjfmb
         Efg0CBCeBQzSyJjt3wusWEwHNMxjL4j6aYAFSKwCDOpYzpKh9gaXyr3BZoECr5g4toCU
         a1Aw==
X-Forwarded-Encrypted: i=1; AFNElJ8Hp9mKhV6AzhKUf5Zg2tOGDUuf9Ij7sVBpWfXbflIFN7lFoUla9301DKWdotwMWMOxT+ih5G3M62s3picw@lists.linux.dev
X-Gm-Message-State: AOJu0YwxEP6kTkT8/CYJqkm0JDV/wPxiOSzVtUqZZTdVDZPYKINovNFC
	fa3q/YDwCOLnpK/MaD0dfEvtjY372A7vuJSVMK8el0Ss1fb/Xevn/GCu4nm2Pg==
X-Gm-Gg: Acq92OFjHTOb3+ByZ26UREYvsWVgkLaadtFPcLSuSQRZVuNqCGr8adYHrQvMjk2yvNC
	4enViKHFbE29ORgD8b8Iudm2PlyT41V+tKaCIS3EwPFGoAH7KVV0Y59o39NPcFwCw3fWHBNIunN
	AuXra5k9vEbYx0kNi2n/c3b6dBwvQi5shUwm4j2K+3gNsxbuGuPqUtbfL7gYtN+tbk9BpNlfAt4
	5pNFe6Y7SJLw3Czz8OY0yV7LxgwnKbPaCS5iln1QLqcSisoew27KSWiGnDthcHZnteyZyGryI/U
	1v1ExDCMnveLVxPwxDfzNMS2zB/hDTyY4A0GzD/Ch661fVaAUSMsh+tkPL21JsuAGAdgjxL6BKR
	L6rtN5Bm446/CyPCjlCnKPJLCmaZbIq8idPyg7fF+KXWnASr2oH2Zd0h2CvF0BUJq54o3WAeAsn
	vaplmhxkJZc3SIelvA3E0j9BJSms/WgRHRKQ==
X-Received: by 2002:a05:6000:4917:b0:43d:dd:8ca4 with SMTP id ffacd0b85a97d-45eb36ab5c9mr11788096f8f.14.1779531792574;
        Sat, 23 May 2026 03:23:12 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9de2dsm10729678f8f.4.2026.05.23.03.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 03:23:12 -0700 (PDT)
Date: Sat, 23 May 2026 13:23:09 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ashwin Gundarapu <linuxuser509@zohomail.in>
Cc: gregkh <gregkh@linuxfoundation.org>,
	linux-staging <linux-staging@lists.linux.dev>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary boolean
 comparisons in rtw_recv.c
Message-ID: <ahGADW1fpR8e12Dl@stanley.mountain>
References: <19e53a283b8.4f2498e045168.7106069608127124839@zohomail.in>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19e53a283b8.4f2498e045168.7106069608127124839@zohomail.in>

On Sat, May 23, 2026 at 12:30:20PM +0530, Ashwin Gundarapu wrote:
> @@ -1841,8 +1841,7 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
>  			/* Duplicate entry is found!! Do not insert current entry. */
>  			/* spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
>  			return false;
> -		else
> -			break;
> +		break;
>  
>  	}

This is a bug.  You have to think about what checkpatch says instead of
following it blindly.  Also it's unrelated to the patch description.

regards,
dan carpenter

