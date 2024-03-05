Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9247F47B
	for <linux-staging@lists.linux.dev>; Tue,  5 Mar 2024 08:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709626224; cv=none; b=U2tC9z5LSHiHqnIWNovLSC8s6jO0Vfx+NRpj9n+Pi4scmcxKujYJk8yI1ujQUmFu/XkeH44qFL904GmOJ37XU8FZxiVl1XoV5DgIVH/KGQlgDAnLoHx5/rWx5aI75oJFAH5QeUfBG7ROUNzmXszqJ/gPxMO3hLU1AHkwPf70P+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709626224; c=relaxed/simple;
	bh=F5BlVsuhvWC2GtH6uTrcle/WPkOfV7YyfzeFIDl+jN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lKPMrTtIRvC/gNidmQ4GygEEoWrph/3IT+mINwdW/Qg0kLNo5HTqTuzKBAQSraAmsuVGz9BhI/xmccxFBqvtGpPffp8hYwG5P8/PbP+aJ588cVzoOi4bmQrv5P2U4pGl1L1mwyxXEIaX1oxYUz+OVaEh4/isS+FI4xtlbGwKpvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZoWSSPb7; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZoWSSPb7"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5673b5a356eso310321a12.0
        for <linux-staging@lists.linux.dev>; Tue, 05 Mar 2024 00:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709626221; x=1710231021; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3QEnP1Zo7GPy1G38e1yW5EBhU1W/tD/j3BEX4L6gGIY=;
        b=ZoWSSPb73oFgXKQ81YesxInNo3Av7sbnQN7FpEUEqBZIoPjnQAyEY7NGgxoDoujRPp
         MPOnkCcyX9hcZT1TTrcqOJilM3HJd5MOjFjkETYnWi3KrvAOHYkzMfOXE99Pal/OuhSn
         d47Z/vB0tFtaaMZAeetvVi7dtIpyvN68TU8byA1DThNpvKf4Z08qdj+pmhGkFtPzetQA
         xPV9nNhjK+M2vUIKFODS1ElqkvHISS3QWMKQbhgMU7xKugaNJpVHLiYTw7GXbzRBjWgH
         BXRN0Nqe2irtfZeG5fgXVmMmQlFc/hufIp4Fypsyb+ZKVzZaGb+wtkF3vZfPMQjqtVCH
         8VmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709626221; x=1710231021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3QEnP1Zo7GPy1G38e1yW5EBhU1W/tD/j3BEX4L6gGIY=;
        b=DgbMMYhsXvSQ8GRj0A//UCdydHQt5tZiTUWHqHOUIGSQerjMeGCJLky+yH4P5I7NOc
         G7McQqazuFihG4qpof6jti7jDFt63QoJoGSZiaCp4Pi46skudBihhixxdTsQJ+baGarC
         D0i3OWdHCLN/A+zqeMMQkeKo4QNsWLVAQbGh2OJMcS0zmkBWkxDwV4v/FGEBmQqiq+o4
         jWjnLsIkilLXUjBX2wRCVIhysqn35HoaJTNX+Uh/39zXq84nbUq+mvZbJxKDIi7hdeOJ
         o26EchgeWNfuD8DFC3mD/z4aWUodS9rwfJvR0mIxiI1+ak8YD5T2a4bmHgtVt0W0p971
         40KA==
X-Forwarded-Encrypted: i=1; AJvYcCVKH+/+fkiCkgqEPu38LvxQ+7MaN1lzMvB6pfZh+M2IGYedYiWaWW/LFt4FiaA7Jhyu50nj+rmS5lPDxh016lFZm3tFq4uLyDj0pt7Yqg==
X-Gm-Message-State: AOJu0YxhA5wqefuGrx5Mi7P103ra4oXuOGvmnNPYwpLbBMeWRwkuGd8f
	0dKLcVVsOfOFbGyYNXz+b2B7d9BxcodTxLwLrsZEqIZ3pK6OSDjrtXt9PceLpl4=
X-Google-Smtp-Source: AGHT+IEUFz0whAzjP/w3ArbV2XByVoLVg8gEw+KDtZyK3QNrs63HBJ5fAjAIzHdiod+FR9KiYzjnJQ==
X-Received: by 2002:a50:85c6:0:b0:566:4a85:ceb3 with SMTP id q6-20020a5085c6000000b005664a85ceb3mr7420807edh.9.1709626221441;
        Tue, 05 Mar 2024 00:10:21 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id l17-20020aa7cad1000000b005673b5a2370sm2456580edt.44.2024.03.05.00.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 00:10:21 -0800 (PST)
Date: Tue, 5 Mar 2024 11:10:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dorine Tipo <dorine.a.tipo@gmail.com>
Cc: gregkh@linuxfoundation.org, forest@alittletooquiet.net,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 1/1] staging: vt6655: Correct parameters alignment
Message-ID: <67dfaddc-aa59-4598-a116-92f9552d38f0@moroto.mountain>
References: <08387340-4611-4403-b38f-75d63eb06d2a@moroto.mountain>
 <20240304142603.32982-1-dorine.a.tipo@gmail.com>
 <20240304142603.32982-2-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240304142603.32982-2-dorine.a.tipo@gmail.com>

On Mon, Mar 04, 2024 at 02:26:03PM +0000, Dorine Tipo wrote:
> Align parameters in static void calculate_ofdmr_parameter()
> 
> This patch aligns the parameters with the opening parenthesis for better
> readability and adherence to coding style guidelines.
> 
> Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
> 
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

This commit message got a bit messed up...  It should just say: "Align
the function parameters to silence a checkpatch warning." with one
signed-off-by.

regards,
dan carpenter

