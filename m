Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FFC37D133
	for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 20:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782764444; cv=none; b=e1W8xI8tQbcLHGrjoHBLnbBmtGqhUhLchTNFLTIb7+jIYGZyED+LcmSCSAQPF2CH2BUK5+YpojpmuNjzNVDN39I2PjXZ4KWSiY24mciNyd4iCzGHFXtbsziFG7YMflMdKpN+BS3HEBAISd+XQDPDbJ/EUhAD/YprproPbXyxFdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782764444; c=relaxed/simple;
	bh=eJGfCIZ983cy+KSCiM99vghVGJPNc4oj7iqaDLIJHnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cdvYhwNnePN+2wlecvOu2dbkz4CRbKBh+C77gO0iDiwcksQ+ybXxBJo+EbIzHCUiDkQy8QGxkKoCJJ8kbCkfk8TYC2wqRQ0HSygznLS7G8JglC10anuJQHqUd7wqXVc77OZp5y7966njZIFiNtKSFEy/xX8uARIm9CxYVtgcimw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rGnD7IkE; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rGnD7IkE"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aeb2b17167so1333621e87.0
        for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 13:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782764441; x=1783369241; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s3Hmv6n+TVIHEbLLaun6gkP5EAn7oCMsJ1Ka6zfxwKU=;
        b=rGnD7IkEk4UepA82dNmZgiLGgSyFNtyUg+14Dc0oMv/FMepsBJ4/HfkUo1fBmXSPOX
         Y3+yFb9mu2LVXUm4d99jIrihtDjEVxD3UFx32TlOhDWRYFgHfFpypdnKBLiDQOZP7yh/
         oLRgmoUhdu7/IFgxYz8fBlK8XH/QFEvufEd664i2AtvhfdpH3eTUfZcFRqql5qTXvLzb
         bPRFEVwIPfhty1EeSlvqzUGc3k6kesl9hROJ1pnJPrS2gnJChCO/C6Wr5Vv1wiErKFqp
         mRD8+E9UsU0KyciD2Y6/KCZ4RYmyH9vgh8jsAO55b9S+EIYSuqWUoHbYOEr+/TGkj9C7
         hsPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782764441; x=1783369241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s3Hmv6n+TVIHEbLLaun6gkP5EAn7oCMsJ1Ka6zfxwKU=;
        b=Ddc21aZI9vRBdLYAMWNz05H2cRq3vuolWSVguIzotyqR9gen4WnIJslRjYlI+HTGhX
         +U0PX61e3pZxPdPRNBalSkF0gPiy20Fcc8c8qniopvDQ9flh75DLuwEdU8Vg+qD2DZw3
         mugWFjqnvaVX4YJHAiTjirEwoo0UYZTiNE5MHkudiymDmEVIWe5uoqIEUOwbTGOnZvWv
         E6TxMdlhzrYdMfLsnpjvSPmasDiQRHJfUte31ctyn8ba9ZCf6pMltBbYAR9pEFFdyfiS
         tkBmaxEVUzM0Ilw5qyTUr1OoCLzBH3MQVwkPs+ceiyyFScJskQL1aX6aUsO1wihao60I
         I3xQ==
X-Forwarded-Encrypted: i=1; AHgh+Rruk3apGdulN3JN2t8zRCsisMTLcTDJ3ESVsXGPM/jdAj632GdeGvPES9tXv5Npa7hFwy8nUqxDfSmvyMds@lists.linux.dev
X-Gm-Message-State: AOJu0Yyg9/WQrw/NGnMysI0hI8NAKmB4SRmuZ1VEPNiFUJwbznrSLe5p
	UmKk+AVCi7TlEO8dbXBiAZsB+IS8suYGPahXU+C1RppcxPm9NFvkNeMU
X-Gm-Gg: AfdE7ck2/3Lk5PSyQPhPhWnTevkHEYrBvFaj0CWbAEhxqPT4ZxRvJgDDxbQV+m5sKjn
	QH8QWlmKfqRvj+Kiq04VHp5xUBWzhIyiezOn3FEW2Zf5Y0KJTBs1Dmw4XQEaBpZsKKyNOfqkO95
	A6TaC6G5uhsZt3Z7CC9enzCf3mLkY0u14Vf3bmzZJOyI2jZU2tIcNKpfKTznqrQnJPEwmrlkF/m
	D5K3qcFlQt5IxzUf9HqScAsKbPfzki3pOuMy3L7oqigBhPBZ22ptAejay4X6xdCKXHvd2FGRiI/
	TpSadVoxp/Hpc5BeSYstKyWWafek+4mb2TWY2C3DTCutYHtMXuBdLoFmeWmccMA/lrEEmwsDv0a
	miuLX16CujNIOJUZyiH68EWrJ+yMHu417+l+HOCxXiQgkxXDIFZeaAlpCwc7juINmFjSCfjFcxE
	49ogci1YZa2vUtf2Sdfj6iIcbARpw=
X-Received: by 2002:a05:6512:b93:b0:5ae:bb1d:ce35 with SMTP id 2adb3069b0e04-5aebdb579e2mr152172e87.3.1782764440981;
        Mon, 29 Jun 2026 13:20:40 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:7b92:9ac1:b9ef:5287])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aebe4a9e61sm61835e87.72.2026.06.29.13.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 13:20:40 -0700 (PDT)
Date: Mon, 29 Jun 2026 22:20:39 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Prashant Rahul <prashantrahul23@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] staging: octeon: Improve initialization error
 handling
Message-ID: <akLQajauW7N5rCjx@soda.int.kasm.eu>
References: <20260628-staging-driver-octeon-panic-v1-0-fe8c34989254@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628-staging-driver-octeon-panic-v1-0-fe8c34989254@gmail.com>

Hi,

On 2026-06-28 12:31:23 +0530, Prashant Rahul wrote:
> Hi all,
> 
> The TX and RX initialization paths currently call panic() on some
> initialization failures. Instead, these failures should be reported back
> to the probe function so that it can unwind any resources acquired during
> initialization and fail gracefully.
> 
> This series replaces those panic() calls with proper error logging, propagates
> the errors to the probe function, and adds the necessary cleanup to avoid
> leaving the driver in a partially initialized state.
> 
> This is my first time working with drivers, so please let me know if I
> have made any mistakes.
> 
> Thank you! :3

I happen to have an Edgerouter 6P which uses this driver. This builds,
boots and seems to work, so

Tested-by: Klara Modin <klarasmodin@gmail.com>

> 
> Best regards,
> -- 
> Prashant Rahul <prashantrahul23@gmail.com>
> 

Regards,
Klara Modin
