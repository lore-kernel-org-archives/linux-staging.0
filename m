Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246E4157A5A
	for <linux-staging@lists.linux.dev>; Mon, 14 Oct 2024 09:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728896793; cv=none; b=KgFbklyFQPB22O6uvqgeX1Q6SNZH3yrg8qFUBX8T5EdJzAuNHTcDAINIjM/0b1ntr5DGp8QBWXFoE0a46gpyqVBNOdKxZrJ1fUTUvqOmRwvZxvRIfjirivXGZMisUL/omEoBL57rTU5rPAH6RWXsBHgA5KUswg7mld3WMNagphU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728896793; c=relaxed/simple;
	bh=/6AkSe9ZsMWGEegbX5mWdCWRk8oikiSE5pvH24z3A2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A5L1q+8CcQUEkDkgFIsbQ7wqgq5OCenBwC03svOIm5z7i7bWR864TXEye1MtPABvqa1azLLHbvNAYHvQ0O/+SQs5PhpfSh5P297RO5uN6tBp2gM9fTEsJAtDQNHa/qDAvq2dSgO81e4ctTvL0zbud9BI8PJz7cFZkkYRX6ep55o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L850OZND; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L850OZND"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c97cc837c3so1149241a12.0
        for <linux-staging@lists.linux.dev>; Mon, 14 Oct 2024 02:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728896789; x=1729501589; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yQ7N4NGsrBS9erfMRFf3mr/u/TsgsOX0nwQxEKrF5/8=;
        b=L850OZND4PNIaV7yCWzIqvymycCsXbeNtdP5ZNqo5idmTalqBXMC144vCk2L2LC3Pp
         uJKolM+1eh1P6a0PBJ+VMslW+qHHXcKgf5AyHoFcO0myxN3n3sTe7LmqaO6TVbTBRJy2
         y8yqBLMC2PXOd8mBczM6qejhIQucH3Oa4O9391iWDXIdsm0uSZLdwcdGNzkOIM9vKnLB
         MZ7mZbqmYCCSjzpajrowjhDt8he4sWEtlYl8jAKgu8sSt11+7023R+EWtTzS2mmV+el3
         pLUzHOK6hHnsO1B1wTH1RAJHNKHwDWJK3tz1VWYP8+rRYv+rzRV9mZCbTwlnJ7fGF57Q
         lCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728896789; x=1729501589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQ7N4NGsrBS9erfMRFf3mr/u/TsgsOX0nwQxEKrF5/8=;
        b=ITg5Wyzt6Zmfbunq2KB84k5Dr9oqUL+SuTdPYnW+SFRX8z5QJBo30tSReJcs6ifLRA
         7oAujmDdGNL/dyFuJ+RMT7eye+hlkIBhb2Tk8JLR9G6qKP289x0iIQ6HzGMZ4E8wsz4Y
         omy1y9mqR0694kAI8Uy3y0Upg8b9AtMDS20u7JvsgLUCyAKWkkdcjCWWT2NAZFee7UT1
         gamKVv/pmYjdehGebD5KvLEjzXtlRs8/QZOMsbo0G26OOPVOqLPLrNTCxrrPfEebzZ7D
         cLMUkbu1MSqg4M+87lCT3l+8y4/uZsobFnw912u31MA2cmbBCzlqeSQzOxsTmDgZRd/a
         GFTg==
X-Forwarded-Encrypted: i=1; AJvYcCUl3zhI4d30boXl9wXtQIv0jOcWlDJiQRH8/7XRIA/9/Hpx8xFInfO2Gs8Ptn/4K+pAwZ3Fidba5Clp4+Kn@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+cFLd5sPEM0SQhon1LIZYvgsCfLLtRQUGikIT7T+OzBPKXuLU
	d4D7rnrx+Y3b26vVPYfU7VayjRVmDqvYRs4z/T8TIRQivmoGGQX31/A7oc7zXN8=
X-Google-Smtp-Source: AGHT+IG3luq/hzR8Bl5xe7C7iS7FVcUq7MLtlNd/M/noM85vm/NAE/kbPKiFAuv1GvAh9JyzUb1NfA==
X-Received: by 2002:a05:6402:3207:b0:5c8:f905:9fe4 with SMTP id 4fb4d7f45d1cf-5c948d6a54fmr9188289a12.28.1728896789469;
        Mon, 14 Oct 2024 02:06:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c9370d25e8sm4699269a12.4.2024.10.14.02.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 02:06:29 -0700 (PDT)
Date: Mon, 14 Oct 2024 12:06:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] staging: vchiq_arm: Fix missing refcount decrement in
 error path for fw_node
Message-ID: <63e1351e-d8f3-4b98-8abe-a2541f95281a@stanley.mountain>
References: <20241013-vchiq_arm-of_node_put-v1-1-f72b2a6e47d0@gmail.com>
 <a4283afc-f869-4048-90b4-1775acb9adda@stanley.mountain>
 <47c7694c-25e1-4fe1-ae3c-855178d3d065@gmail.com>
 <767f08b7-be82-4b5e-bf82-3aa012a2ca5a@stanley.mountain>
 <8c0bbde9-aba9-433f-b36b-2d467f6a1b66@gmail.com>
 <20d12a96-c06b-4204-9a57-69a4bac02867@stanley.mountain>
 <a3a8418a-57f2-4f3e-80a3-011de2af1296@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3a8418a-57f2-4f3e-80a3-011de2af1296@gmail.com>

On Mon, Oct 14, 2024 at 10:49:28AM +0200, Javier Carrasco wrote:
> In this particular case, and as Greg pointed out, that is not a real
> threat anyway. My digression comes to an end, and v2 is on its way.
> 

I mean the other thing that we would accept is if you moved the NULL check to
be the first thing after the declaration block...

regards,
dan carpenter

