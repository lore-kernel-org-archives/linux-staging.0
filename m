Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DA01EB194
	for <linux-staging@lists.linux.dev>; Tue, 18 Feb 2025 07:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739864892; cv=none; b=NJ55nXnaIB4KIPaB3EPyZiVsQGn3nbfHEF6Pvum6UhQLuUzJhSVkai0GqDgRGzWlqhnZ72C7zZgs74BI/S9hxeu83IzWaT6vITT27jjmuPgj+aBxS16wYz8xf0pt22zDiP4CINw1iTPz5359TA99mEzPFrQdfkjpHHZ7/eEAIP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739864892; c=relaxed/simple;
	bh=NyklA13Dg9i+m8NkOQ63eTCA+Cty6PL2AVsa6doGskw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qizOX3d0C3i1QmZSP1AsYvjrEkzeFgjuR5zWofaiqcYajW5aY03gKPyboYLrbbywQiTk7cdO6de04CQM8F/zhAVlb3wrzy1zW+BsE8WVFQfM3uOLeNNK2ZPMT3tKAma/gzutyoGAQuF+w4OoNvbfZMH+NtB2SGckGe24mjQHb5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r0GusJ2i; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r0GusJ2i"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5dea50ee572so7917111a12.1
        for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 23:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739864888; x=1740469688; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MnwvAMuVQSCRRozrvNJADX8ge3CuPmWawHTGZ6gaoIQ=;
        b=r0GusJ2iEo/JnqvXJQp09WF3yyz5vhjS685Mi6n0NlcGll8xmuPhADBNlyKuw7HndM
         mrY1AcK0VDo0Vl8v4js301ltRqAHb+nLAhfWBnf4xev5uGr11ktXy7OPRowcPpTIxZ1y
         TUOcL4vtgP6IxFhwKzSTTyM20QRnNdxe0Fg9mZTHEvbS8eBMY7GPpwDFJnsVLAWaLJY7
         STzG+bT0az1HGcgIJCsYAYEiEilVLcJYQCzP3u6GVZ31+4jl2n5OvGrdbHdFrVgAdY4N
         P2a+QFo8+OsKxp0u3rl86mZmeTGIN9j7bUUw9w57QJolcI9KK/Ydciz9TYox0353aSod
         8seg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739864888; x=1740469688;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnwvAMuVQSCRRozrvNJADX8ge3CuPmWawHTGZ6gaoIQ=;
        b=NQ0d9Ks2pXNaMOwk9K/Gml61Z1YV/VbTz1q1VLWQzvOIrEKbRsd7IxuxhO1YuWGlnu
         xrN/pj3xOr6bewj1PBIx+SwXySq3lcnTOR9vha9BTcqGhTMOTaVHhv4rMOSUY9c/GVGb
         6x7aG+ToCTVktpA+uR9W8g5Ix3XvEpJ+NSVHW7DursHhWC5PcDGiM/fJwp8mSE8sPU/6
         DaLGayScY7nEJuN1dVwTqGeUX0wauXBSoWhEOaa/gufHeLNulpiC6zbqE+li73M8nc19
         wMQqz07vVBdhLj6dRc0Oedy97Bsh4OASKzc/L0oWgiFkhRmotZYtWnF2ohaPHAKTRkLA
         /AYw==
X-Forwarded-Encrypted: i=1; AJvYcCV1Z85ZrnLC1XKHnIds7ZdTi2XRBtWWGp7uVfYHT56YtPeLlhLyk2WOJEh4X/eFWcusYa4tcJFoA3H7pGw2@lists.linux.dev
X-Gm-Message-State: AOJu0YyNkazWXPhyQOFeoi6K68FVFc5Mz3y932m1PJmVkA/nJ7iRtRcR
	4MrmiisVaytNjj8ui5grQ37FyAh5htxDHQTmvhrLYh9yMi35DUNNYGlDC5ZwgH4=
X-Gm-Gg: ASbGncuxdUo4UcbIMApdyBcmBi5Vr9em/7f9GcSbPpYh/+LHo5rHnW2KnWZNlPgb03N
	Rzz07185WO0GPYI24Cnge9NL0SGZuW3v2lISx0qwbGh7E1DOOxtdngCKGlLth3IZ6dj/9PG9tib
	noO5gTeLBgmsoWemKJrb6oYZqfVN9q2sQ3iEHeBYwISMoCGz+2btRh8o8OzJwcnvwkfe/la+EIu
	UBnF0D9upGjQuZ7jkRYT20s7KHB3ng/rZBfpQXxbsBhuP3pufSkb7U8sr40edax82OlpPYUZ04g
	HnzFIlIjdnbHt3t+JH8f
X-Google-Smtp-Source: AGHT+IHk7Yiy7MzG1HeqNaUTij3OexQs/BZTmTN/h+Lrj2OEPwUOnLWZ6xFUVh3ErJl8crizrrH1SQ==
X-Received: by 2002:a17:906:3118:b0:ab3:84ac:4dbc with SMTP id a640c23a62f3a-abb7052fcc8mr1092489066b.0.1739864887694;
        Mon, 17 Feb 2025 23:48:07 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abb9d1a0049sm303370766b.40.2025.02.17.23.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 23:48:07 -0800 (PST)
Date: Tue, 18 Feb 2025 10:48:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ravi Kumar kairi <kumarkairiravi@gmail.com>
Cc: dpenkler@gmail.com, gregkh@linuxfoundation.org, kuba@kernel.org,
	rmk+kernel@armlinux.org.uk, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] staging:gpib: typo fix and cleam up
Message-ID: <4b1bf65d-bd16-495f-abb5-3d59b65a59a5@stanley.mountain>
References: <20250217195050.117167-1-kumarkairiravi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217195050.117167-1-kumarkairiravi@gmail.com>

On Tue, Feb 18, 2025 at 01:20:47AM +0530, Ravi Kumar kairi wrote:
> From: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
> 
> minor typo fix and cleanup
> 
> Ravi Kumar Kairi (3):
>   staging:gpib:agilent_82350b.c: fixed a typo
>   staging:gpib:agilent_82350b.c: cleaned commented out code
>   staging:gpib:agilent_82350b.c: removed braces from a single if
>     statement

Thanks.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

