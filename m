Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977BD385501
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 16:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773072742; cv=none; b=CfBwF0cXkZ3fPhl2+5VQO6fjIdeIEo2nTpDXHTgDLEu/iL1cTmF8agsQPxpAf39WTPOeSU5nzIoLrJ6mZ3SnmzCcO791e+bYnp01+EuIgx+jYb7bHUZxf2jZFT/RirclDcUOFJWFXRd89St70GPytX6VOD9ITdrYwZHxN5hoQaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773072742; c=relaxed/simple;
	bh=30X2AvH9mqLKlpMiSMCKLYYvEvkAeqcQ7eA7dzSxE2Y=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=hYPWKJhJiy8Krszd6zEvsKgk9CD2U1ue7OtmV3gJnxa7yqJsl0eW5gzYPjRi+bJbl5e8upz1ZuHnBWyNwcVSiBpYuKnIlNaZM7USdU5ifz2BQ7UdSu3fZ4ahFExmxmmKsovmLb5o9Ye5TSI17JV4Yo08iagxDtyXKlxcb144CDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GCXmuf7B; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GCXmuf7B"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48534e9076fso11011325e9.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 09:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773072738; x=1773677538; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=30X2AvH9mqLKlpMiSMCKLYYvEvkAeqcQ7eA7dzSxE2Y=;
        b=GCXmuf7BLedeKcndnqs1ppDFb0Z3qgnsQX8bQuJcgZW5p37wDLf+30Af7/BA6xBt1n
         C6pF776MczicIRuyl7cx6XICF9RQ3I+SqzDVFrMs4ERx4hZH49Ceki5ke+tylLXK11QN
         /fCAZsd8ayeuUXxoyZzrA7y/ZuBJH9JELrzMTtAYQtw5iK8WY5T1y+Oso8DCKCDNAn+t
         Ozc7RBGcbq/VjXd5c/AXBNoarTlQXviT/by42jevRMEWsPLnHegYLnWpCGJqPFoC7dMn
         jhUwuwgZUMh4BEJfw/ax7UeQ5Wxjp/8OTjhLygXtgb/0MUVDJi3KomhyAXrhh9FW1iL9
         DaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773072738; x=1773677538;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=30X2AvH9mqLKlpMiSMCKLYYvEvkAeqcQ7eA7dzSxE2Y=;
        b=wgsgSqJaTil1ZqUuPN8yHskRGbXHRqIVTxUR3f2qq/H5Ot2nf+kLYbULHcVesK3yxw
         7hJZA5uzJBBW9uHHlSgIPJ94Iwb2LwEZaanM2H1+KjTS6qPh/BWuq7mx3CCudBDLA6r4
         Y2s0xYw8phoAXqC/MBamlrWcTkf5uC5/xMFRIOHaeDG8G0HNZhOjpDrUxB3L9VLlzPbM
         CpRrHZKbmWFSGmV/z58neMZQUw1z0Hsg4dRaqZEx7jj/AS7Ki0e0ZP85vxLKXAVFQbU3
         slUPo/5AthPN5MYkZ+aJ89r/tWI2DPcGY+NcrYF2xS+SdIkTbLNGbJFHVaJF6LZ7nl5F
         TOLQ==
X-Gm-Message-State: AOJu0YzWsWlFBz3+GHSzMpCsZxYr3vPaBpZZuVb3ETWRDeJLT2CdL3MT
	ADIo5o+blzBL/K9HhP4XkROENewJD5s2ceO80sTUOXy+MiIFFQoBJsXV
X-Gm-Gg: ATEYQzw+7oYAaHSwNCKq/JPBCYZgmZHacNkvyzwUnGRe3C1YocXChpteWcEYXX6w7xv
	hhp4K5x/HmLhf6shBoBJk/jZcID95rtYcYc3H3MjpGbb8fXEHNPYjcpIQShbmTgIzM28J6USi9j
	z7LyvGbi/B3kFnMuieF0HOnIioP0vznkeb2bAeOFAad4OoBL54ChHyH30ixQXrwWWzJCi/LyPfP
	tUGj35TLkPR5oQrxHaWIqgtiMCXRzjD+/Oy6QHP9dFVupX9L5I9o5yIQkApJA/tjR2sOoA3aExU
	o/HcqT8M23TnDXAodyAlrlgBhOoB1UD55eSKd6p9dUchf2yLwNXGZbHTkep/Csqyd6SJM7dsB2U
	YikYEZ82KYUIJLGXCoSrgKTrrMNryMskiI1ZBsidZ+HJI+yMhB1K2/ZanV+VhMCDOuuG54+LBkm
	6AmEwep7Ul4T43rVk4
X-Received: by 2002:a05:600c:4445:b0:483:a27e:6706 with SMTP id 5b1f17b1804b1-48526922533mr209546285e9.9.1773072737618;
        Mon, 09 Mar 2026 09:12:17 -0700 (PDT)
Received: from [127.0.0.1] ([86.1.69.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541a900easm2115795e9.9.2026.03.09.09.12.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 09:12:17 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:12:17 +0000
From: Josh Law <hlcj1234567@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Message-ID: <532d31d1-0c06-4c8a-af80-86b6fdf07225@gmail.com>
In-Reply-To: <2026030908-destitute-rely-9997@gregkh>
References: <20260301005019.2510157-1-objecting@objecting.org> <2026030908-destitute-rely-9997@gregkh>
Subject: Re: [PATCH] staging: axis-fifo: remove redundant goto end
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Correlation-ID: <532d31d1-0c06-4c8a-af80-86b6fdf07225@gmail.com>

9 Mar 2026 16:09:27 Greg Kroah-Hartman <gregkh@linuxfoundation.org>:

> On Sun, Mar 01, 2026 at 12:50:19AM +0000, Josh Law wrote:
>> Signed-off-by: Josh Law <objecting@objecting.org>
>
> No changelog and your From: line does not match your signed-off-by:
> line, as others have pointed out :(
>
> thanks,
>
> greg k-h

I think I made V2s.
