Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640EF657DB
	for <linux-staging@lists.linux.dev>; Mon, 29 Jan 2024 15:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706540801; cv=none; b=d0PsOfAKQzJrgs4FwaF2ECcVaBqHjWEoml1h5U6fGHIPz/BjbPd8MTI5EFzt2JXvJzTGND6HO3DYHCyu+MUc+SzDL3E9OXWXJOM0bnhHRKc5p5MVsm4V5OhsqqS1zxNqizmkLB5U9yI6Gog2Ptdw7tmsKaYArngh4yrhnX+yS2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706540801; c=relaxed/simple;
	bh=UdVE88RvKofu1niD7h9x7NM6QyJbb3bceyHPaqVCFyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UBJIBKQ1kj7rnnq8ImIcG6UJC1pXjt7W9f3BrDVz3aFoioL4AsIjUQuMa2fOz0QBg1NT+zgOt3fCD7LmQ+XetiSF5wBecKsscLYbPXI6xU6Iyp+NUB8SvFxWBfZHm3zwo5NmSYWX4EJvP4WmyqXnIMIM9/HOPMwsQGqGUswFsKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bxQ4Bti6; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bxQ4Bti6"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3394b892691so1572936f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 29 Jan 2024 07:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706540797; x=1707145597; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SB7k/BFApJBDg3KYf+GK3Duye99o6PLwEtImHq4bcyM=;
        b=bxQ4Bti6VTJKrwqZOvBri+HheGadbkQ+Fdy4tDA5KdAKg6DhEMpXUqCWOWC1azsFOt
         gp7SFREKR1VAOSejI1XmkoFfcYhCvBCQTT6jdpAOQp84WgJNjs7Cmc7KOkXaF7cC2GKf
         rxCW6ZLYpy4ppdtKRP596XwPB2SxReiSZjA5ryzyfrPjrwlD/1OjgeNO6HlfsZO2nRhh
         MKAALg+I5wOkZdxqYPttw+zhUcgLrVMXrtsn3dxwV4x31qnyYZtWDrCtA35HY+ZWvdJD
         arOnSCaCzRDPvrkXJbN9PaQh2DUP5TqcFMkrQqox+aP9feDol6BBUX8wyc5vLq6ETZQ1
         quDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706540797; x=1707145597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SB7k/BFApJBDg3KYf+GK3Duye99o6PLwEtImHq4bcyM=;
        b=FDigkODKXqzcQa7+/fGjm3MkFfta7AJ/T9gkYKr1qpTPbb5ZRJ3StJtDG8m7pxWWl3
         44Zg60+sH8v5JjX769znMkU88gI0sWn3bdlzIYW3bpURxFX+1ND2J1WUL+9xt4trs0KI
         F1HiIzZQ+4wNVA2nW/HADhu6qBl2fT2mVGHmDEXn5W4YnPPSlER6OYSikvMnJQtyOGtq
         Fs9qtfPqA0MHtKMuISxAfDNdufv07d18BLitUtSJXWJ2yRp5x2A4ML2fBxQa8DcPgLhX
         5MqO9ZOZ6B1yv0JlG+TSaJt4M52ui9Zl4Bey5nDXLNc4W7wixcpzcKGTqVopbdhb52+u
         Rj1Q==
X-Gm-Message-State: AOJu0YyuLrvF9d5DGnHGNZVVOUmBpmAVl8al/106kUINV2M7bhlQNwVr
	s8oBSJiYW5+l4fnJptGdvsRfxd9ZK0y6eb1gy/GTr7s+xtVo7dEMtQy/6yBYbls=
X-Google-Smtp-Source: AGHT+IE+uX7yUe7MwfmkZ12D1Eijb9mak9vnudqGmL2IFa7HkMwnDFRdrTBve8PDAwKPyZ2UDUlpMA==
X-Received: by 2002:adf:ce0d:0:b0:33a:e559:5357 with SMTP id p13-20020adfce0d000000b0033ae5595357mr4148708wrn.28.1706540797491;
        Mon, 29 Jan 2024 07:06:37 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id k7-20020a5d6e87000000b0033addeabd6fsm7642647wrz.18.2024.01.29.07.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 07:06:37 -0800 (PST)
Date: Mon, 29 Jan 2024 18:06:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Meir Elisha <meir6264@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ruan Jinjie <ruanjinjie@huawei.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] Staging: rtl8723bs: Fix block comments warning
Message-ID: <888364a5-0445-467b-9e3c-6662019852e4@moroto.mountain>
References: <20240129141856.416532-1-meir6264@Gmail.com>
 <20240129141856.416532-4-meir6264@Gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240129141856.416532-4-meir6264@Gmail.com>

On Mon, Jan 29, 2024 at 04:18:55PM +0200, Meir Elisha wrote:
>  /*
> -struct	wlan_network *_rtw_dequeue_network(struct __queue *queue)
> -{
> -	_irqL irqL;
> -
> -	struct wlan_network *pnetwork;
> -
> -	spin_lock_bh(&queue->lock);
> -
> -	if (list_empty(&queue->queue))
> -
> -		pnetwork = NULL;
> -
> -	else
> -	{
> -		pnetwork = container_of(get_next(&queue->queue), struct wlan_network, list);
> -
> -		list_del_init(&(pnetwork->list));
> -	}
> -
> -	spin_unlock_bh(&queue->lock);
> -
> -	return pnetwork;
> -}
> -*/
> + *struct wlan_network *_rtw_dequeue_network(struct __queue *queue)
> + *{
> + *	_irqL irqL;
> + *
> + *	struct wlan_network *pnetwork;
> + *
> + *	spin_lock_bh(&queue->lock);
> + *
> + *	if (list_empty(&queue->queue))
> + *
> + *		pnetwork = NULL;
> + *
> + *	else
> + *	{
> + *		pnetwork = container_of(get_next(&queue->queue), struct wlan_network, list);
> + *
> + *		list_del_init(&(pnetwork->list));
> + *	}
> + *
> + *	spin_unlock_bh(&queue->lock);
> + *
> + *	return pnetwork;
> + *}
> + */


Delete the dead code.

regards,
dan carpenter


