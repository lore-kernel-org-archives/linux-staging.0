Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4AF4D5A9
	for <linux-staging@lists.linux.dev>; Mon, 22 Jan 2024 23:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705966205; cv=none; b=VobQ1O0BQAuZmKJtlfQu9WTOYy1ks6oy+vvl6GUYnMbNrG5mnI5tXMjQoLfuWuuzZW0vyXGEyYiAEPsoeD1brRkgQhr+1Q2k2BKrVxz0ZaBQUweOe9CObnI3vhiD6eQJ7NRfb3Ywgfh/51fSkosTjjyoRRlvPATDHE17IpE6Q1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705966205; c=relaxed/simple;
	bh=8f5V1pIN+HwrIPe3zxmztqaVm66Xypxbk10pGL6H3AA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=guvefQl95ycpuNxJIEmVklp+EBGPn5qEHHb1SMWPEkX1ZI8JT0CvgsoxpXdHNTl5iNWylSW7rJs/iKuy3Hlzw6+IAbQ+SLoE0YLg2ox5R/UwgI9Ynmehy42zH8nQn6SeRMe/otXAuba/UAOrvsH2opSlH2tryCcdMX71VLK9FVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O9jsyCMC; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O9jsyCMC"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6da202aa138so2892125b3a.2
        for <linux-staging@lists.linux.dev>; Mon, 22 Jan 2024 15:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705966204; x=1706571004; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DUOidC22dDHlSk4Qftb/5fCyWMGT9ty7KwSP2qXw47w=;
        b=O9jsyCMCK/PM9YWDLjHxnUzYHPWQFqQ8fF+A+33KNKLrrvPhP70zVC3p4ckw3dqsmP
         P1LZvnP5MBZCHmyw+pHp9gb4+cM6Ryrsffo9EL9r8gceDX9bis8QR43wRVkucc9POkwu
         D9J2ZpKeHThl17UdaS+DwjFjnGdUNdaocUV/GVJU/NEdZkwzMVa3r3rk2R2LIeXi7iWf
         q+ekmeRNSCFIlDq/QQSL5SNVSkYxnbP7LA9GcChjIC5cGA+gijLIV/a7H77jOCClX1h3
         +D2p3NX8MZY67+NYv9aCZiUbBeoMUE9SM8CnV+OAPyQ9EmSJGJSckg6Jr16ZOyNQNolX
         PL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705966204; x=1706571004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUOidC22dDHlSk4Qftb/5fCyWMGT9ty7KwSP2qXw47w=;
        b=Q7HmXKEJO588cRmd0XCHcqRITGN59MDHEfRr02ta7ane0Db9vbu250c2s0w6Jsg5kA
         YBRtaCSr7Mrh15rN2QQkHZDZSxZyVZ8OGNeMZcfYDyXxdiQ6qr68XxxygQV6aiH9lwQM
         bNjKybMgJZtg4C+QuPn1MTfh756LS19qAbV2LtYBiHB+6ixCfZGA3FqXPm1qTk5yU9Ez
         sSl+PF2QVZ49NXcAIW65Z+vZ2IBB+jDP97m7AHjwVOGUNlUJ/Pdd72ghl6FoV7lumXF4
         AqXd5NwG+s4kGy+ntwKpTTsSe5QA2YAX1MmEibNVrOX/yOF83VdPipCcD+p/Zh9x1ISv
         i2Xw==
X-Gm-Message-State: AOJu0YxOXoWvk+I+U7CeZQ1w3x8xZ15IoqtNu/543c45IoBiw746OIUt
	dHZLHBI6B4RDu8IVCd9C4J/ai8okjxLQ0J5idiiJUIoiAjwffF5nwv84dqW5nbBx4w==
X-Google-Smtp-Source: AGHT+IGsuieeQgTUkrvX4zvqFlP0YJjBALSTDR4c2hkefINgj+fgj+/O3bqH4oa6zR146MXuactozg==
X-Received: by 2002:a05:6a20:bb25:b0:19a:4e25:be96 with SMTP id fc37-20020a056a20bb2500b0019a4e25be96mr5084877pzb.67.1705966203509;
        Mon, 22 Jan 2024 15:30:03 -0800 (PST)
Received: from LAPTOP-7VGLEE77 (19.216.252.27.dyn.cust.vf.net.nz. [27.252.216.19])
        by smtp.gmail.com with ESMTPSA id o6-20020a62f906000000b006dbd3aec001sm4077744pfh.146.2024.01.22.15.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 15:30:03 -0800 (PST)
Date: Tue, 23 Jan 2024 12:28:44 +1300
From: Hoorad Farrokh <hourrad.f@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] staging: rtl8723bs: remove unnecessary braces in
 while loop
Message-ID: <delmvvkjuq2t76jrrxxb4a33tuef3m7bhkzpnopp5x7xzjdntb@ceybtr5piecl>
References: <4ii7ptqhz7ion46dczabnevuj7tjfv4iofvzedms6tvfgsfu2e@6rvcsdyodny2>
 <39fbf9df-d6da-4275-be3b-191108f94ec2@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39fbf9df-d6da-4275-be3b-191108f94ec2@moroto.mountain>

Hello,
Thanks for your comment.

> 
> This function doesn't do anything...  The name says "free_all" but it
> doesn't free anything.  I would prefer to fix this warning by adding
> a comment:
>

I didn't fully understand this part of your comment. Do you mean I should add a comment
to the while loop + my changes and submit it agian? or 
do you mean I should find a way to free things in the while loop? then submit again?

Great regards,

Hoorad.
