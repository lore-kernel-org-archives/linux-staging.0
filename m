Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525371B78F3
	for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 07:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771831533; cv=none; b=hmJ7gkqZ5KfTcTwILnrwKUcMuciF2SzG++95HSICivc6zm3Z7Vktrzgega2QtV1+xWzrzUdeS4Hy6PgLM7Mwv/Un2ArrxLtU2/EtAan9b0N87/t10yoPPBVNUcouUaDM/iQg/xEj8SXdteXaXG5SuqHFERZw9HqEXTyzJuc2uEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771831533; c=relaxed/simple;
	bh=Nj9IvoQ2TET8dOCt0A3JLw+Ju2xN80bROENk0J6iODc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZMsjTDw/oWg5v+q7SQrlDEK54YBy5J1HCSsZ8Vi+0dgZyR5G3ztvpEq81QKu1jWDtnl8glfQqZn+jDE9QjGMAYVdKOC5nNeD2bz8J+DiX6BuhASq51Lsu0TAVOyI7rX7m4TMMGXn/VZFB04tfV/5Fd4zZaZ23VhQ6JOu3KMWwvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XkKrRW8R; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XkKrRW8R"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4362d4050c1so4187762f8f.2
        for <linux-staging@lists.linux.dev>; Sun, 22 Feb 2026 23:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771831531; x=1772436331; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QOfkAbajpI4O3L9mnGnnKcpCg1DOYncC5Z3jTXcjvSA=;
        b=XkKrRW8RZMsygrfiqa0Lml3lXI1SSEz4qzdYkwN+SHcughnaw/eDm51Ft7eDPZGM0M
         othYRPUbfK4AWSaqdv7GXcdKUmNgSzd0kBKRteEE7cXDoHZR5YGWDw2AZTfPi4iLpRVx
         fW5xfaBNnmoxERPNLZeqE/A0qPGwA+DLjnEJn5i3QKIrCEQ7/e/K7mQXA6/+ARGhwjHn
         05ZrksfqXlAAHwP53ivG6zJ+jRjyd+xsbU+o4WtXgj9NMkhnxuECgLAsUSqhCzPyHfnH
         NH2+4vgLB12GTMyODDj0ixvQ8as/5IZ74s4wiozYSaaTWyUCVV8TtXQkQQE5mNBELJ5T
         KuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771831531; x=1772436331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QOfkAbajpI4O3L9mnGnnKcpCg1DOYncC5Z3jTXcjvSA=;
        b=odGKvlO2oJ2W4oQYvBW8iMdJCVFXqkfe3lDa8d5GH32TzzPnz7RuxART0c4FKGdzEZ
         fxdS38PsykaLSSot7n7hr8GMaVUEl5VK+Z/JlCnD0F6WR2YV2S5O0QiGeQ4KC/E8cfBZ
         TKd0py0tN+Gr9RfAAxPncfmmHO7RGOyfm8oQQD1F2euGn95/X0A4wFaxdV/Gvsb3lI+3
         0ayl4JGhfs5ef61ilVSCRlsrJeuvDjVK7rsyeFFZROxSQ+E92PVRj5l9wOuPMDKGMPGY
         dKqeuBjY7UuJXYri7Uox26430mqJgxprUkGEuWxcb3dontpznv2aruq3HwF4FpN1sO8I
         1yog==
X-Forwarded-Encrypted: i=1; AJvYcCWMeN3inEoAIsJz75FEqpm8ciuxTHzFFp9ZH2d3m0Jdu09xojV3MGGmeNw+/fssLIioOk2CExiZbN80LRv2@lists.linux.dev
X-Gm-Message-State: AOJu0YxutZ9BuQwzfzUZs7Qf5IWDVPVSx+LiA0WjAR3kddUqC7diugxI
	uu9kRK+nk6QjBKyCT9uFbrRePszhdHWK1UEmlY3OfakVF7IDWCOB5PopPiRtB+ZrG/k=
X-Gm-Gg: AZuq6aKgXJ7lNQMiVxfKwsnVyr1z0p4ViZv+CtQA4aHruqxevp23LKe41xJztlWc0OM
	N45qrzWr33EvqCN9G39Vvt5oQnKqNNyQw0KDPYHZloWE8aS3T1tYDVjZzTT6Ne+l13B4buBRQh5
	GFJeneEiSdFMe50hnHzo3YUQvwFTPMRTsFXV25OZpDL2TztHWpcGiujjrpfAX3+KEP59Bm5jWMy
	OYNT0LVwVGSheEQqJQ/9b1qoqxX96LlBguV1f3VCDeKdD66sJ3f/GfW7nQAgy60qUOO3rp0bu2t
	YdXrLsFYblPlf6HfNBUCwYfBfwpYNINpzNmSzzIo5n2k6JcA7ksj49AsoiXpytPVU0eAInn3WvW
	iahcjZpAQmwlgFy8RKiqvGhhXBh+DvokFjnf8XnccGgMj7cjL0FMLdAy8XVhteYQ58O1FN0QnTI
	hBZfVU9J7wboJ0EPVgWsULUSRjOuPe
X-Received: by 2002:a05:600c:4505:b0:477:7b16:5fb1 with SMTP id 5b1f17b1804b1-483a95a854amr127032285e9.7.1771831530565;
        Sun, 22 Feb 2026 23:25:30 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9cb3f31sm167881265e9.13.2026.02.22.23.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 23:25:30 -0800 (PST)
Date: Mon, 23 Feb 2026 10:25:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Priit Laes <plaes@plaes.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Minu Jin <s9430939@naver.com>,
	Archit Anant <architanant5@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Philip Thayer <thayerscirez@gmail.com>,
	Bryant Boatright <bryant.boatright@proton.me>,
	JJ Strnad <strnad.jj@gmail.com>,
	William Hansen-Baird <william.hansen.baird@gmail.com>,
	Navaneeth K <knavaneeth786@gmail.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Tanjim Kamal <tanjimkamal1@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>,
	Michael Huang <tehsiu.huang@gmail.com>,
	Nino Zhang <ninozhang001@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	=?iso-8859-1?Q?Rog=E9rio?= Fernandes Pereira <rfp2005@gmail.com>,
	Diksha Kumari <dikshakdevgan@gmail.com>,
	yingche <zxcv2569763104@gmail.com>,
	Karthikey D Kadati <karthikey3608@gmail.com>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	SeungJu Cheon <suunj1331@gmail.com>,
	Akiyoshi Kurita <weibu@redadmin.org>,
	Erick Karanja <karanja99erick@gmail.com>,
	Sun Jian <sun.jian.kdev@gmail.com>,
	Yuvraj Singh Chauhan <ysinghcin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/11] staging: rtl8723bs: Clean up wrapper functions
Message-ID: <aZwA5uus-CbDYOxW@stanley.mountain>
References: <20260221190628.50273-1-plaes@plaes.org>
 <20260221190628.50273-11-plaes@plaes.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260221190628.50273-11-plaes@plaes.org>

On Sat, Feb 21, 2026 at 09:01:40PM +0200, Priit Laes wrote:
> Remove wrapper functions in cmd queue handling.
> 
> Signed-off-by: Priit Laes <plaes@plaes.org>
> ---

Again, this would be easier to review if it were split into
multiple patches.

[patch 1] delete commented out code
[patch 2] move _rtw_free_evt_priv()
[patch 3] move _rtw_free_cmd_priv()
[patch 4] move _rtw_dequeue_cmd()

regards,
dan carpenter

