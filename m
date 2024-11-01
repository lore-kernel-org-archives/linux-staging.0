Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22661D0B8B
	for <linux-staging@lists.linux.dev>; Fri,  1 Nov 2024 19:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730490924; cv=none; b=LICx7iakEJgqP/NlJu9dND4bL1hK7rHxX3iAma5xgsHwDwOWjIB1WVbyVSMqhB3bgy55GDZ/pdPzgz/+c/NY01zU30JRfIMaGyU5De3e7v8OBTa9Zd8y6JkHugUuhVE371tXPFDC9e11Qz5bVOEfDBHN20TuZ70VNHNFSK07HN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730490924; c=relaxed/simple;
	bh=kiXT218rgaa/i6xragvSEs2O7A/U/zKhIUlWSZvWPy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WdUbdvpSH4TyIFo8vgDAMdHoG67S6JTDemvJ6lvbyZ5VFbwPhB07lrAIvhguptspWsIMlPyncbq1fBI3VzFOIpAq3c0nPdO/AfeqH/jjQWetSefDBEqV1c+dKq/81rXpwCNNK9v4BUvyouxOXCK9yuqRtyPuSkHyPlLdEPTERyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zf3JqrV/; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zf3JqrV/"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37d447de11dso1804218f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 01 Nov 2024 12:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730490921; x=1731095721; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2KfVmPf7yDTyzuQV5+HlYzS4nyXc918Np3+MFMf2YBE=;
        b=zf3JqrV/n09eSwCttlgKzjG1wI4EtYMkDotkRnd87HlGA2gPA6ybGOyiAEMpFDvu0N
         3Wl0y+a9zicm+3P/sBHSEDOHTbQPLTUWhU9c+J7AStE9QASRct5jhDNKKP7Y5PFy2Plp
         xbX57OU+PppVStzOSbOt24ObJw88NljNiKqRZiHWfSLyX71VFz8hD+favGkXngvYdrSe
         ARrC5hv1HD/XccmAnLYlWatZg0JXndEbPiJ2x70F2b0zm5bhXuoCEDkB5pPZtZVlqDIW
         rHlP6gx2TbUl9/MG2jQbV/Up+45UF0iO8VlaCn847fSk/FJ3iwxdvyVSoj1kA/srG3bU
         Oplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730490921; x=1731095721;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2KfVmPf7yDTyzuQV5+HlYzS4nyXc918Np3+MFMf2YBE=;
        b=EAfk+Aq+xTuadfDvX4ib9/WOxXnSYeccpR2NP+7K8g8+CAo3bZuNl0LOFWnhIjh5L5
         HoZ4BpzlsbiATZO0UTTRamLGKhN7Q7V0AissnkiqHjsgs9zVzZwx1pZvXNLK84J5xGsY
         c1YyVGWfzefqckOh3HvcG1WW4nE/oweCI9/tB+55WzKmpkT+DOT3vyXLQwKAxZxjweda
         gfK+xDuS7injxnkRuf7TZZL38RbKQ/86qJ9V6pp0lbLyTu18xckDz2rV33ZfQbhkFSfu
         b5IWqv0JlaiDBgcvoXHvJoBccwh2W/2zFGyRKxwlmApy7JyZKkcT0RpXCDOpoMhzYeDJ
         Tu4Q==
X-Forwarded-Encrypted: i=1; AJvYcCW/r3nwerzSN7mT5NjWO706ILTdMSOV2Mr4rc4XMtAX6uI2MTEpiykOJZvgSLRk5wQsgPdfjpNrB7cciIDX@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7tlRwZ5j7mmV5gsEdxWTQ24Q6bEmPEXoGJHJK8TYWDM+59Cdk
	yWhmVrogMc+Q9trvA7aX6fvQNzCkHm3/NG0ZvLUTfM/oZ/w7jUjdhMnGi0+7Fho=
X-Google-Smtp-Source: AGHT+IHt3uDFbfzDcf71B+rvAWS1uwMPRAkznrr0HHExtuL8F7pBTpvZ0BozP1TN+HDS/qiK/kLfcA==
X-Received: by 2002:a5d:64a1:0:b0:37d:4fe9:b6a7 with SMTP id ffacd0b85a97d-381bea1c1f4mr6976997f8f.36.1730490920787;
        Fri, 01 Nov 2024 12:55:20 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5c65b8sm71002735e9.18.2024.11.01.12.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 12:55:20 -0700 (PDT)
Date: Fri, 1 Nov 2024 22:55:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	arnd@arndb.de
Subject: Re: [PATCH 8/9] Rationalize lookup tables
Message-ID: <42c115a0-9611-42ca-b326-e28b13988c5a@stanley.mountain>
References: <20241101174705.12682-1-dpenkler@gmail.com>
 <20241101174705.12682-9-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101174705.12682-9-dpenkler@gmail.com>

On Fri, Nov 01, 2024 at 06:47:04PM +0100, Dave Penkler wrote:
>    Remove bcm2837 table as the only difference is GPIO14 and GPIO15
>    which are not used with the current pin maps.
>    Remove GPIO14 and GPIO15 lines from the two other tables.
>    Re-order the tables so that the bcm27xx table is used first
>    as these devices are more popular and numerous than the older ones.

This feels like the patch needs to be split into three separate patches.

regards,
dan carpenter

