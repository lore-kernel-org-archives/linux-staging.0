Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAEE79C5
	for <linux-staging@lists.linux.dev>; Mon,  4 Mar 2024 20:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709585599; cv=none; b=G2hso6Ok0tNqVfARlMmIbMfqvfeyB9RLmePPvg0WBFt4FizyByGtgEXZykVswGfwvbkkDxopmhDx3VCD1M/M46pNOQVugJ/wrOD1JYnT970ltPhCxqhoi9Fg5USjS3jNCuhsPR7ptLqJgT7hDR2TSkTbl3awSKDI3c9dXN2Ho8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709585599; c=relaxed/simple;
	bh=EUEfQKNoIbx5qaBmLxzZbVI7rtU59ZfHjKcXBw/gOco=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=URXZJtmiL+MsFv1NQlfB9FvAwkFXjrLjnblZraBYAOdnM2MdrgwlgJzLe1neu1QAd2VeZoJwVYrjiI6CDqSWfFUrn8+yE9fSZlkU6Q1wsVHcbNoMDQkVoSYKCkPzBQJep78IR3xN8DFdMtgeW7xDcxZNeu/86FNYueUo1+7yl7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MnNqph1P; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MnNqph1P"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33e0c9955edso692804f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 04 Mar 2024 12:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709585596; x=1710190396; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aRYkvEHqQcdpM/H6Viq5zXehFeV2lG7pQmAPd0nVJg8=;
        b=MnNqph1Ph3vNWAAxiMerdUizKrWrgw9VQpnCbQSP7R6XmiOaFrnbsu+4Jur/GlqaV9
         Dtse9z7ra+aN4EKEQYX5GxZZ8KzadIOgVxxE7WLLbhvodbUVg4SYDoGH9s5XN01+vF3v
         JjeKTY+XZ1IsKK7WONwAMfY+JzvDtDFbCsSZLYaoHFCbrkpmykckiK82Jl9mzpPWGgeE
         gakhIaDFAHXtyJsmIHsXuuhh0qq2iiM85BML7s9g5VQZsd3tzbwD18L0DhDbhWrnvDFD
         OA6kX3o3ogFR2cAdmPKsOvyggtl5khN35LJQjnfUOu9PwZC5f24jSVxD2X1xBdUHEbiu
         sLlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709585596; x=1710190396;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aRYkvEHqQcdpM/H6Viq5zXehFeV2lG7pQmAPd0nVJg8=;
        b=KAtFM+Txous6XoajUYtToExAsCIfvexwE3DscF7OE80wDAOEdLgKTIiTlLeF5pUaRv
         L+D+DKxrID+snc/XaM1xvC3IwA8VhF78DMmVl01oH+UuDBE5+mFrY9lgfegfsgQ6nXHL
         TOFEu6UzTzQ8iJ/esKW2j6mBJX8sxOZb51rHuO/mtH4B8YzPxUIOKoiUyFZOKq6D5JyE
         PWvXiBPUSq8hYaukN1I1r11XdYVMJL0dCHKUDNzfW9jla2X2vNDkN/H0z2Uon0i50qZ+
         t3bqFjL6ecXl/DiDsth6YJHsbWN2Xxc1lQeSYDrJp3l9b+5z1QBpL8Uxn6Iyu02ZOruP
         uDOA==
X-Forwarded-Encrypted: i=1; AJvYcCXVUWNpgB9yxJYO98qAAVOng1WTESvp/nl44sGufAmoA65bofLAJm14yVRewpnWYnBDbiiyeaQo7l45XwMoMRWO1Uk7eXyOXriZpsnZVA==
X-Gm-Message-State: AOJu0YwcTtr1rwK10eriWeMrd0jyzz54uKOu8utaKH4ehdaHCFrwxzur
	uA8KAmn5jC3VmasVyf5tKTbhdg3eti4RKKNhoIuDo2n6NcywsNhJ
X-Google-Smtp-Source: AGHT+IF3hBGN4JVVydQeqC9K7EMuNrbV4Vikx+c3I+jFNu9fdtK+ZGUdJlgrMs5KnCUjALWzwiLFew==
X-Received: by 2002:a5d:58d3:0:b0:33d:9e15:12bf with SMTP id o19-20020a5d58d3000000b0033d9e1512bfmr70220wrf.3.1709585595925;
        Mon, 04 Mar 2024 12:53:15 -0800 (PST)
Received: from [192.168.0.102] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id k6-20020a17090646c600b00a44bbd08371sm3559404ejs.155.2024.03.04.12.53.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 12:53:15 -0800 (PST)
Message-ID: <2ac49025-0cd0-4ea2-b06f-f1bfb5f8ee8f@gmail.com>
Date: Mon, 4 Mar 2024 21:53:14 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] staging: vt6655: Correct parameters alignment
Content-Language: en-US
To: Dorine Tipo <dorine.a.tipo@gmail.com>, gregkh@linuxfoundation.org,
 forest@alittletooquiet.net, linux-staging@lists.linux.dev
References: <08387340-4611-4403-b38f-75d63eb06d2a@moroto.mountain>
 <20240304142603.32982-1-dorine.a.tipo@gmail.com>
 <20240304142603.32982-2-dorine.a.tipo@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240304142603.32982-2-dorine.a.tipo@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/4/24 15:26, Dorine Tipo wrote:
> Align parameters in static void calculate_ofdmr_parameter()
> 
> This patch aligns the parameters with the opening parenthesis for better
> readability and adherence to coding style guidelines.
> 
> Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>

Hi Dorine,

please use only one Signed-off-by. See output of checkpatch:
WARNING: Duplicate signature
#19:
Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>



> Correct parameter alignment in bool card_update_tsf()
> 
> This patch aligns the parameters with the opening parenthesis for better
> readability and adherence to coding style guidelines.
> 
> Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
> 
> Align parameters in card_get_tsf_offset()
> 
> This patch aligns the 'local_tsf' parameter with the open parenthesis.
> This change improves code readability and maintains consistency with coding
> standards.
> 
> Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
> 
> Correct parameter alignment in bool card_set_beacon_period().
> 
> This patch aligns the beacon_interval parameter with the opening
> parenthesis.
> This change improves code readability and adheres to coding style
> guidelines.
> 
> Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
> ---
>   drivers/staging/vt6655/card.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>

If you have just one patch you do not need a patch series. Omit the 
cover letter.

In the description please do not describe what you did. Only write why 
you did it.

Look under "git log" of your repo what is good.

Please insert a change history below the --- (You can take it from the 
cover letter)

Thanks for your support.

Bye Philipp





