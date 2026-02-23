Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3249218EB1
	for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 07:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771831064; cv=none; b=k01CsQhfUQLwPiku5itoiw/IeJYcAm94SoXesjenKB+xDT2Kx3axM8QH1zAGOAh5aoT53LKqpeYTeL7eJjVSc/EVBvcCdARbsIfsyvsQFXOm4Iexm2MIf5/w7o7Udw/QyKnIwArcuyBzCKxK0HZha4WOtLOEfjh36N71wtQ5ucw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771831064; c=relaxed/simple;
	bh=y+81v/YDFm/rqVef2pgD1kgrpnFkW948cmeH62+6foc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wt8VPk6vK0iSyhiQ7J3MTEEl+hFcE1eFpMk9XWBJmHs++07n2zX/C0vUzWLJVCYALjHrCjlKtH39knbv3AAsFtkDCMvkXZI+PiaLyAhd9iX01o63/PNktVUmHD/PUTYujqE7+915eroz4GN0jYp+tRTw0WacIndqIss17ea/2CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yWL4fKB5; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yWL4fKB5"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4359108fd24so2404096f8f.2
        for <linux-staging@lists.linux.dev>; Sun, 22 Feb 2026 23:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771831061; x=1772435861; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mE+2D643UXeKKd5dpYg+oSbT/nEmKAbAThxpB3BsRyw=;
        b=yWL4fKB5C6hBv5csOVsU6LJ+U1qenjdn+DndcM9IMrCdEmWgCy7TRVI0CQdI0X8a2D
         a0YszJqkHkTgdpe+mPahl8JNoZmHlYljXGdVD47b837tcWyL8xVbrNfOpePym+8bn+Jv
         0C75W+XMSoh3DeihNzqspYFkoVhuPHXdN3npAFk4gqWCZduzYjP9RT38RSH6d+2oWuVv
         rYRsStys/yOy4WXi2k87/FIv3FChOp2rovllMBvklbYlPzidqBCOekuCeNRTIGdqqYIM
         VHlg6aE3HQxLJrXmylRc+G5VtGA+uIYebVAqayPmzQRSgpiA/V3CX+nIZ3dW760Kq0Pd
         VkqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771831061; x=1772435861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mE+2D643UXeKKd5dpYg+oSbT/nEmKAbAThxpB3BsRyw=;
        b=iyc5nOnVuQY6udq2jYDcm+L6QJYyguhIj7unFkFIL0k3APNH1Um1OpbQ1uQf7jQfK9
         pju6FqQLKxHGhlzYlvEISC/fYnAo4P++dHDtnjM1aVo2qiBgFqVwXizlr3aGMNY2G8xE
         DFo4rGywtkdydPVd9uHxm31ke4KU+8bpaHM7BzFZuPctuTTooiY+S/MkjGEKL+wvJPjY
         Hu67P7BllO4LCXwS0nejQEi2ncUrmVFQRn8q0S6FmGf70Jfvdht2VkMMFT+ePyc3gjsb
         T8s4uVmanNR+II4g7VxCyxiF0g8b/XHwYblmCzQ2CXkPNLkxHY38hONNcnL6+irkpWj6
         chUw==
X-Forwarded-Encrypted: i=1; AJvYcCUqfX914EMTzVeJHmaIKG5gMLugNXREFaIZGYcOH7zbZwrEVxNuZ7X8wBJz0JPQ9w1RC+CVXuFOaLwYH6h4@lists.linux.dev
X-Gm-Message-State: AOJu0YyuNVAWUfYKScbVaJpx6nlsBICfcik4h9xK2uA1vY8DbRj/gwd2
	aPjpnYhlbktW89mvpmNSlbiYYkt2aSWHH/p+9mAAQPTp06A9rY/htZvf4W+mcYh9aBk=
X-Gm-Gg: AZuq6aJEL0b/EvskaJZORb+/yW1tMjcQJzFc5vnxuGKyJb1XCOX9fN+gD/joT6EApQG
	B5dyLhz0AFM+bPPsflvYu4zZWT/4v8d4rfS9Rs4/R6P8O/W18IbM7VVa3MgnBbTKR0F3QKgmqUS
	MARVKkaFe2VHvAT5XBjGIH6NrBMUbsYFrbJSXSLM4Hj8kBAEvByXV0n3AtCT2dBxLBmgnJjqd8M
	uzgGDNHlEQX65r8cm33ei6PUCSBfM+EhyY66saX1fd+zHVKqnnjlcYvM5eDIXf9qJyEirwZfB78
	m9iOsbqbowscSCq/KhTskMJ3+PAnw7pJG/mgivV3AieyU3A+vXtswf7izYDeF5ZyxJQqGqo+mr/
	RMTOeqz3Q5yucydAlgds4P+6/kXcIle4qHGPFvNrRoiRSkHWdxFPzBL1qfl0pf4AufmeWHWvHZs
	uBtDlLihL46S7eGJ1E0wDh297GteaGbrzHZQbqHFc=
X-Received: by 2002:a05:6000:2403:b0:436:324:6db with SMTP id ffacd0b85a97d-4396f15cf8cmr11726359f8f.11.1771831060873;
        Sun, 22 Feb 2026 23:17:40 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970b703f4sm18712764f8f.0.2026.02.22.23.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 23:17:40 -0800 (PST)
Date: Mon, 23 Feb 2026 10:17:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Priit Laes <plaes@plaes.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Minu Jin <s9430939@naver.com>,
	Archit Anant <architanant5@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bryant Boatright <bryant.boatright@proton.me>,
	Philip Thayer <thayerscirez@gmail.com>,
	JJ Strnad <strnad.jj@gmail.com>,
	Tanjim Kamal <tanjimkamal1@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	Navaneeth K <knavaneeth786@gmail.com>,
	William Hansen-Baird <william.hansen.baird@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>,
	Michael Huang <tehsiu.huang@gmail.com>,
	Nino Zhang <ninozhang001@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	=?iso-8859-1?Q?Rog=E9rio?= Fernandes Pereira <rfp2005@gmail.com>,
	Ingo Molnar <mingo@kernel.org>,
	Omer El Idrissi <omer.e.idrissi@gmail.com>,
	Diksha Kumari <dikshakdevgan@gmail.com>,
	yingche <zxcv2569763104@gmail.com>,
	Milos Puric <milospuric856@gmail.com>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	SeungJu Cheon <suunj1331@gmail.com>,
	Akiyoshi Kurita <weibu@redadmin.org>,
	Erick Karanja <karanja99erick@gmail.com>,
	Sun Jian <sun.jian.kdev@gmail.com>,
	Yuvraj Singh Chauhan <ysinghcin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/11] staging: rtl8273bs: Simplify regulatory
 initialization functions
Message-ID: <aZv_Eaa3AZ4UXXmq@stanley.mountain>
References: <20260221190628.50273-1-plaes@plaes.org>
 <20260221190628.50273-10-plaes@plaes.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260221190628.50273-10-plaes@plaes.org>

On Sat, Feb 21, 2026 at 09:01:39PM +0200, Priit Laes wrote:
> Simplify code, by cutting out wrapper function in regulatory
> initialization code.
> 
> Signed-off-by: Priit Laes <plaes@plaes.org>
> ---

This would be easier to review if you did it in two patches:
[patch 1] delete _rtw_regdomain_select()
[patch 2] delete rtw_regd_init()

regards,
dan carpenter

