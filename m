Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4365383C8E
	for <linux-staging@lists.linux.dev>; Mon,  2 Mar 2026 09:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772443197; cv=none; b=sNOxQDkLQfkWI6KQLGoQogN8K3YAISHQgseMK6reH+r04h9RyySxuiB2RwDpHmTmeVBY+AFuUNFw7MOabhp0h9JetHTRTpQiGQ96yvLbNoRXhG/f/+x7BmOoo3tIRIZCwotwayLhhMkoI3vmrq9jmhCbUQGwgjf1PXDMp2ZVg/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772443197; c=relaxed/simple;
	bh=+4BPUeiVd33LezGgcOEmiSM/4J2xOaksjNlfOVV97bc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sovZmcYZw0UuzQtL/VNVLZnDJycUZczp9fLj1LNM+V+U3WzgChuGLjemocFXwcjToYk5JfMRKpbFz4pTGHaihsyZBmTNSIIk1/WRoqtn+NMr627cLPczv+0pwLTQGZSKbnNto803NZHFDMUFp4ig+WjoEwqCPq7TTtP0b/OyXws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hZ8kB45X; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hZ8kB45X"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4836d4c26d3so31020045e9.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Mar 2026 01:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772443194; x=1773047994; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/+oBze4vXvnPIkWErfvE1r12oWDSGjqF38nam5PE7iU=;
        b=hZ8kB45XCz5kbe6Y1jRNSLfx82JG1GhMRMbzATYB00Rqq5W7/Rpw/EEPv9NmMkuNtp
         A8HzBDXiUU73XX5CQDUZC+GNwFZEPzUgX716/cm4oH4/kOefjyDOoCNX/gOQ76uS81g3
         EYbZcPzPzqCJrRKnlCZJR/Zxed/P9rOJ5PHz3b5DZsRISd1x2Z8C8V4os+55T2qAXe3V
         aHEWn4ZHnrX8+GGXA0LAYmcoAMTChdGkTARyYuB6Cnwf3BYJyDpbMUUVMLO09113uO+p
         BbNpIpWdpERrH+GG+2ZnmLD2C7tex3BM4GJDLhewyGjZO4NyiLLhlbVreKeyt4QTr0Y+
         i/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772443194; x=1773047994;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/+oBze4vXvnPIkWErfvE1r12oWDSGjqF38nam5PE7iU=;
        b=WuwMvVUROM2ZPC5fHCWOhrz/Lyy5ppK+LvV3bSmPM5rIq9hPG6KOzpcjJtMqZhc64k
         0CY0bUMi8/eqwj/P5ZeX76QJHcCzntvcFCoYVNo4UNZg13XFmYhfHGhI4GhGBlFhXPLr
         5a1fvjSRWsFgwJk6mW/RhhIRfaPl/rXDzYMVndKRLFyVqzbg8mGZXfKATmYS3lzW/rFh
         vqV/7aeMQnYvAeNFWLdJx9yTLQCNs4Colyq2LbfQkraBjNDiZkD+ejbEt/L36bbdWViA
         kmqnbUyUfLHonmz3X1Ex48eDSSy3djXZsBSivWvCVr9BxCs224WlpynLPTXZgjox9mYi
         s4TQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGJxL0end7auBZaD8Tr56vLmiE3SiM29kB5s588yM/UQQ5f7ANQglNV8fC1Viz+j3E/Acs62Ks0bUPchrY@lists.linux.dev
X-Gm-Message-State: AOJu0YyjG20xJwS4B3L+TZ+HPvV43b6q1foG6CFllOFvH2AKLXGTNrHA
	bNencTjyjWRWchRGiw6B6Q6RkhOb36xJjS3EVtDqzU596x+bPahU5F9yz67zZfeP08w=
X-Gm-Gg: ATEYQzxuuArF2TmYr68j8tslaOGCreIt9hd4vydN88ybh7sneU9K1onacCY6N//WA5A
	bi975GZJRoYUH387rwEotFZ59xYfbA6+HjV9XU0eEF0kYyj+3WjwLJxv+N2sXX04z5oBR8SVTvI
	WFQ5YafZEQZXptuVSZjbIbZUbPoQlQGSofoHJE+sgJJ3gHJ1pOKl2M7a6rqd7nzk+jXv86NVmOC
	LAR8eBdTFsSLjHSnElKonXv4xyK0v03pWcDzj75BBHlOpy2OO7bc/E4vXgAN02s7SDQZYxi0DKJ
	j/uUAqgYwX6tbynljjRVCltqXQHkacrMf8bOZYzryuIbvbXe5IDlmmuPYLK+jerXfmecQekieR7
	dNEuI17KFG25fRHGM8RIp31lbrSUjKHTLW3NcOE7LvskCM4QFPgOH5oIreKC9f4zptWKAH7t+Tj
	6cvy1CekWLlSXiKKL8Ywb37vP++LMgNdqpbFiGdGc=
X-Received: by 2002:a05:600c:3e86:b0:483:47ae:7c00 with SMTP id 5b1f17b1804b1-483c9c02502mr179820115e9.20.1772443194187;
        Mon, 02 Mar 2026 01:19:54 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfba9a5esm271423245e9.4.2026.03.02.01.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 01:19:53 -0800 (PST)
Date: Mon, 2 Mar 2026 12:19:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Josh Law <hlcj1234567@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: Re: [PATCH 1/3] staging: axis-fifo: simplify resource mapping
Message-ID: <aaVWNmR0Otegqld0@stanley.mountain>
References: <20260301005519.2512706-1-objecting@objecting.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301005519.2512706-1-objecting@objecting.org>

On Sun, Mar 01, 2026 at 12:55:17AM +0000, Josh Law wrote:
> Use devm_platform_ioremap_resource() to simplify the code and remove the unused struct resource pointer.
> 
> Signed-off-by: Josh Law <objecting@objecting.org>

Run your patches through checkpatch.pl.


regards,
dan carpenter


