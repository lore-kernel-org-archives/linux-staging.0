Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF8B7F7ED
	for <linux-staging@lists.linux.dev>; Tue,  2 Apr 2024 10:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712054091; cv=none; b=jVnAOM9X4GyYTEcZ5Pst2pCNY/sSFI9x0aTcOopl6JwU6QBNwSunQv0T25muCvRlHL9i3FviuGn8aryZzEUY+3tcTKVi/fh0dTF+L5MjKRTAYbP3owvjzMI/Mfq052S5FmAdRaA/1GODnVp45m6CtuZxHIFTX5uDV5+qDEYAuRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712054091; c=relaxed/simple;
	bh=m4o/iU+AQ9jMOTYN6ooaE1NHa4LcKTSx7PoeD5OTS2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=urtSJmGRpeIYg51MdZ1xRYYzWc/O4ws6Qk09E2txDfpswa3vShJDaqlLHvmm3iN+3GGCWYFEj6CN/XO3WzSPAw3hoFgglVeiGpHSXBDAf1yiHTycst/P0FNTNJYTgnFtXWzYkzF7lrODRIzqEfQOxpvv+OGTJXQmjWpaclqjmrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M/oKEPSW; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M/oKEPSW"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56df42c2773so358374a12.3
        for <linux-staging@lists.linux.dev>; Tue, 02 Apr 2024 03:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712054088; x=1712658888; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G16lC2YSuCH0nQG087sinHXSeTqOMb9VBJ6YVFLPItk=;
        b=M/oKEPSWRVSu1dUybT3qKu4gPS1wb/6TolOuben3zltZE26rd5KD/hIb5fnnypp/Qu
         VEaDDJniwXCy4Lf+TcA+kz9QBYy1VoGl9EgYCwlgHMQ03lecMv10OxQZ/F3I+EGOWTNl
         vly1CeuNnUgeulLmYf2+iho6ICVQRdSiMj8B3egxSbse+8orS20o3JebpAqD51zHvVn/
         QoLE9+PtwuR3KJ47V2XFvisKNoWoBiemG05oj5Z0VJ24a5F9kXeCSJ/hfJ1WACm/k+af
         jCn0CnG6LRAa1IV4eTrXuvZ3p/r5dSsKegC5z7+voaseuIcE4CfOvFohtCw5jWMNbA8r
         mSXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712054088; x=1712658888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G16lC2YSuCH0nQG087sinHXSeTqOMb9VBJ6YVFLPItk=;
        b=rhqQ165zIEVfLBUlnrqECHxi6eE8w4r1XoRexGp/aDxtf6vReIIxSMILDalz1ZycB/
         kEUzt16KVPLNbJQ+VN+uiPujl4quGhHra2+52ISrjuMG+31P+SEv3XobyfgAsdrqCkcq
         dY9OlX7W+QUn1FBgrwhYRuKDWU2vS+anSmgl02mgi0LLPkwdNx3xubFxP3Yv1qp/c3pL
         I5ojWxXbkWjCGPPr6RMe+AkzcZ7Lj39Z2TXAelctuG9iXHI3lRS6H+C4u6yeqAVDflVm
         mFRYWZgXz0rtKrrySzQYpQbCm1xK5nMiMPociyzlt1r5qf/IYWjcq7ds5pb6RK1y+bV5
         AJ7w==
X-Forwarded-Encrypted: i=1; AJvYcCV7o7cLXGJA2pqjjFVgW64vVGUTPSGyV77Dx1yI0/RmvtRlpauFqkKriO/itB10CDWg7LJ3zvLiP815gVVYITSZFEYeCqI1IBjEOKymQw==
X-Gm-Message-State: AOJu0YzTmhbI/6SQg3HzgGmsJ97scogLwHa6Fcjn1sjAg06p+qlnPyqS
	7A/P68lz1C+jPqHhCSpaqDzTEoO/XZpyXennwM7EwH0OT8sOZHKBNnqiN4QRxGw=
X-Google-Smtp-Source: AGHT+IH7mjufzReUXPa1rRJkfPuCBfvZvh+cNz4FnNh9ylUnbPbSVtG647+yZI90FUnmu2wp5DzR3Q==
X-Received: by 2002:a17:906:c413:b0:a4e:904:3c7f with SMTP id u19-20020a170906c41300b00a4e09043c7fmr7047920ejz.50.1712054087537;
        Tue, 02 Apr 2024 03:34:47 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id an3-20020a17090656c300b00a4e7c2b2070sm1338235ejc.8.2024.04.02.03.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 03:34:47 -0700 (PDT)
Date: Tue, 2 Apr 2024 13:34:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Prasad Pandit <ppandit@redhat.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org, rjui@broadcom.com,
	sbranden@broadcom.com, linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Prasad Pandit <pjp@fedoraproject.org>
Subject: Re: [PATCH v4] staging: bcm2835-audio: add terminating new line to
 Kconfig
Message-ID: <6da2518b-19bd-4ec3-889e-ecf401ba0ee3@moroto.mountain>
References: <20240330040411.3273337-1-ppandit@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240330040411.3273337-1-ppandit@redhat.com>

On Sat, Mar 30, 2024 at 09:34:11AM +0530, Prasad Pandit wrote:
> From: Prasad Pandit <pjp@fedoraproject.org>
> 
> Add terminating new line to the Kconfig file. It helps while
> displaying file with cat(1) command.
> 
> Signed-off-by: Prasad Pandit <pjp@fedoraproject.org>
> ---

Acked-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

