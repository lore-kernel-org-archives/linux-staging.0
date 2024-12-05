Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBC32163AF
	for <linux-staging@lists.linux.dev>; Thu,  5 Dec 2024 10:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733393178; cv=none; b=sM1TbtUWA4kpGqmlbskowWudSAVaiirxsdM7WaGxCtUeBbZru4FOnLcI/tS58SK9mFUt3DbLVoWSXWrl9N8Y7SAklkRZsoIfQQhuZ34Q7OecDz7nz9K2LI347Keej7xc7pM4pZJmsjF+TzX8DKd5vv1Xc5tXtYnZSdOr/J8Dpmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733393178; c=relaxed/simple;
	bh=duPje3LygJnHrXaaI0cTK/M8CS+WA9ne+Dj6Zrq6UK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cSLHSZ0uvTcpgVGxuyG37RGwXlZLHdEzBhq36O2SwZkdr9IwWxpA4Oj/JmZIsEYix0RD0pyZvEWVrwztFsZDbI00mKlmyJkRwRmp2beRyqJRUUW+bMk9dl5WJmgvwqM9KIIld9W+doyBJx+ynWxl+H6hO2n58IfHkWmw9YUAtpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=efSDQHMl; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="efSDQHMl"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385dfb168cbso350055f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 05 Dec 2024 02:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733393174; x=1733997974; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M/kQOpXWTUOPQmOqqeamFyujejmTR09eYwRs0b1/cOw=;
        b=efSDQHMlubb24qTNvCywb+ratXQ/Ud6Bo+Gq5mhq+LYfiypLRUzGhRfuSI2rjKW3rm
         Q6jBu3eTl/2EGEkuWc6XMHTsKzz3wyoqn5PD3Xk58KtbSMnGKGbuwEvl0/EM5QT7r/eG
         5tipz5OBBuP49TthtZ1SpvI5zl1mazyAWGyn8natcw/NV76FJTAIP7TnPBvHS2EjxZsj
         zJc5LcjeC/HGkK7Dk/7QXLiqxzv/xITWsVc/ecH75iKfRXcmkdQDE12ScqNmMdRMcfGB
         fKfiC7RyiEEeII3dg9P6a6fDZV85a4J9HxYGH8TsBR67LC5qfXqR+/NGjAMWdyp0bdVE
         KCZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733393174; x=1733997974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M/kQOpXWTUOPQmOqqeamFyujejmTR09eYwRs0b1/cOw=;
        b=OjTJHUQWo/mbNP7YcBm57imBVthe+fRS8B3kAEpQqO92ep6eqPCZFSJVwE9OH4l8cu
         0Pg6+GpPCddtjauFgj19jYsJD2IKGbHjLeOJ63piAOkDgOUY8lkHB78KIFgr+DqXx1WO
         /dTUS4C+xJuArxFUXiAkIG82pWXHSGJHXoH4kOnxCgqH2cd4HY/7THi1t7E0nj8YL0Xp
         f+07Mn/YrtNz6aZDAexCg6mYUIzihGbmHgLTtaVmZb59AdPW5A8j3+LT75fALxVm+Pbx
         WALuJvSOcVWUFGV9Jwf3cd4/1xXQfj674yrv3R1/BICyalhcJTIRkyxPcJT/VTHynJs9
         IiJw==
X-Forwarded-Encrypted: i=1; AJvYcCUp49zXUmiuyIC0dSoYmeLDKHsKZLJhTl2wjBVkSDJHxUgIBHh91b26Lr5TTz42qW89197c+7n6Z3FxiStL@lists.linux.dev
X-Gm-Message-State: AOJu0YyIJI3nLhZ+66x/91AU/MhIxGM+SVMvYDzskBtZ6XlDIsmaPcpS
	cXzCb0OUwvv7esaFwVns4AfY8q6CuWBoKqLgGQqM2CQx75pevGyQynMhMRuG46E=
X-Gm-Gg: ASbGncvfeKuIn5BdkocXWQQAYJLzZeKlo9Xai2vPTeO7BGzFREAEy/huPvICBlQemYT
	rXMw02AgdxQ94bWAtWd4yVI6zJE3q77XO3JWINHoVPHLZ2BdNu0iEw88q1kxbWjPvOvVu0BjKhe
	IVW/WqQe7zqoW6p3erGiVG38G2TsKq6MedWOxldLvf3sBaioMZyC0AUVv8yJ21VL5sYxXNwynMS
	l7UhubgFvlJUrZh7idaoRMz4v7hVkIAjJG0hl6QQZ/psnDC/kmTLJ8=
X-Google-Smtp-Source: AGHT+IFKUP4XEhaH9l0KWirCvsRf2IyP3F1dJ5FSJTnmx+VqsQDiutPTjsI+5MMwOtaQ5pVTxO5vKQ==
X-Received: by 2002:a05:6000:1f8b:b0:385:f249:c336 with SMTP id ffacd0b85a97d-385fd419e08mr7365729f8f.45.1733393174622;
        Thu, 05 Dec 2024 02:06:14 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-386221a607csm1487807f8f.103.2024.12.05.02.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 02:06:14 -0800 (PST)
Date: Thu, 5 Dec 2024 13:06:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marcello Carla' <marcello.carla@gmx.com>
Subject: Re: [PATCH 3/4 v3] staging: gpib: Fix erroneous removal of blank
 before newline
Message-ID: <36f9a87e-ad02-45e6-a8a0-8da65461b346@stanley.mountain>
References: <20241205093442.5796-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205093442.5796-1-dpenkler@gmail.com>

On Thu, Dec 05, 2024 at 10:34:42AM +0100, Dave Penkler wrote:
> The USB_GPIB_SET_LINES command string used to be: "\nIBDC \n" but when
> we were merging this code into the upstream kernel we deleted the space
> character before the newline to make checkpatch happy.  That turned
> out to be a mistake.
> 
> The "\nIBDC" part of the string is a command that we pass to the
> firmware and the next character is a variable u8 value.
> It gets set in set_control_line().
> 
>  msg[leng - 2] = value ? (retval & ~line) : retval | line;
> 
> where leng is the length of the command string.
> 
> Imagine the parameter was supposed to be "8".
> With the pre-merge code the command string would be "\nIBDC8\n"
> With the post-merge code the command string became "\nIBD8\n"
> 
> The firmware doesn't recognize "IBD8" as a valid command and rejects it.
> 
> Putting a "." where the parameter is supposed to go fixes the driver
> and makes checkpatch happy.  Same thing with the other define and
> the in-line assignment.
> 
> Reported-by: Marcello Carla' <marcello.carla@gmx.com>
> Fixes: fce79512a96a ("staging: gpib: Add LPVO DIY USB GPIB driver")
> Co-developed-by: Marcello Carla' <marcello.carla@gmx.com>
> Signed-off-by: Marcello Carla' <marcello.carla@gmx.com>
> Signed-off-by: Dave Penkler <dpenkler@gmail.com>
> ---

Thank you!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

