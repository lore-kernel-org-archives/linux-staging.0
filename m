Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B8656458
	for <linux-staging@lists.linux.dev>; Wed, 15 May 2024 09:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715764527; cv=none; b=Q0WUiAjevlJZzBIki0V2zSA1DI3YVrMxZ4rukuRHClrlqKTCuhONnOU3kdFSPCidU666E4dnh2P/aRSlU92rzxhMXBxRRZPAD2KOfqNHbwgxVhuk715A/SSypYCA91gm5SF8oQRrXG+jek/COoiuLEstMUUwUEXeh90gFoXbHGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715764527; c=relaxed/simple;
	bh=P/HmKa64i6J06kGw4UB/yDL2SRVNBtVvTV8ov96LlWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J7zqv0ftZkkUOz5Gx0uBwLtpDS4CUa2PG9I6py81eKqrjsM1gvUyRWEQOu8W91U+6lPlJfFKyTwYOn30zoM4j8linsAlB5rio9thhsqfrgBvAG5x60wMA/JcVal0TMZ3aCJxkLN9AEU9Ht6eafxZkG/N5S0jQMFw3SlZBc9N7gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y6cf0hrS; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y6cf0hrS"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-41fd5dc03easo40666775e9.1
        for <linux-staging@lists.linux.dev>; Wed, 15 May 2024 02:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715764522; x=1716369322; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x/8H4twMQ08jXWD/He9ul5nNDZsvIBXg3kfowyA9eX0=;
        b=Y6cf0hrSxvNpdJeqsi0odYKRXFhMo8Zf+6bsN5Xn3T/iBrXpSELP5BqSwIwt5hpYEr
         oSiy8FaRZ2E8iJtzbuX80EbvW1tSFT6iSZf6WEWlO33jJIkRTHYgvBIhZd+SeUKJ3iZj
         BebbKIY8p6qnpyyDTSXAMxV//m+9npY+lt/PAIFEXPmQhiEkopvqMkakRGdS3UyCoRlg
         wvX9P/jc0cOLSRaUHsWF/sXcAzgDhGR0Xlj3+dRzpkXRvlpOTb3mWicSMGJaoX1kEvAG
         aWFrxfyrucQYUWq3pQDAARUENtMxXMeTFtaIop1XEcm+4euKtGUNKHsar0kBhOr/RLHG
         jO/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715764522; x=1716369322;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/8H4twMQ08jXWD/He9ul5nNDZsvIBXg3kfowyA9eX0=;
        b=ocxcCZLDqxDaPpUdbNC8p1T6ohIjPn2yLcfbE706DcFnOsY1P0YaabbndAkMBEgCsW
         OgnVPehlNGr35kkhrkau+s45RfwffSsFF8ryzRy8n290GLHQLQqpSuGS1nMxuod30UWm
         fZL9PBqJKpOR6+EAqzplaIprq9fUN6+qM5lmrQJtCHd+QZjttmQ5jfuo92bj8NzPebdd
         a5UUJbOgWd4IlBOA4dkz6SHgjI8RvjhA8GhDJjmhsRsbhBBtpIX0oWJ3hiiR7/uHsAKu
         F67FqquRZm7hqAm72QpR64trH0TUle0Hvbl1xZ2EdNMcu8DEYSop4KUYeJuFM67KEzT1
         zSkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJTdnXWY4+IqRaSi8st5S2Ua5vPzvliQZBtn7vgCNGFCeanvSopfuPhbXDhSEzjCrEFsZOvK9T7Y8gLKaDhNXGgp8eImssPS1gNcp2pQ==
X-Gm-Message-State: AOJu0Yz2zZyh8qKZk+crDgQ+ldhHQFGyrHziD3uVLsECaluwRTts8qYG
	1Q7vx6Zl25tLsopFnJZ5WDKaZdSuwel3avNuAW5KL7BiJe67AmP5ehDS4Gv5u8Y=
X-Google-Smtp-Source: AGHT+IFqalPaSl4AAIIgaEheMCKHyeisFKgxUKzweu4wr8Znn5IvAhWOarmgR7VH45Doqs/ZLZXWvw==
X-Received: by 2002:a05:600c:35c2:b0:41c:2313:da92 with SMTP id 5b1f17b1804b1-41fea93afeemr126972175e9.4.1715764522013;
        Wed, 15 May 2024 02:15:22 -0700 (PDT)
Received: from localhost ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b8969f0sm15991078f8f.28.2024.05.15.02.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 02:15:21 -0700 (PDT)
Date: Wed, 15 May 2024 11:15:17 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tree Davies <tdavies@darkphysics.net>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com, anjan@momi.ca,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 16/31] Staging: rtl8192e: Rename variable pList
Message-ID: <b1463844-537d-4836-bcaf-8eee868bd799@suswa.mountain>
References: <20240515045228.35928-1-tdavies@darkphysics.net>
 <20240515045228.35928-17-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240515045228.35928-17-tdavies@darkphysics.net>

On Tue, May 14, 2024 at 09:52:13PM -0700, Tree Davies wrote:
> Rename variable pList to plist
> to fix checkpatch warning Avoid CamelCase.
> 
> Signed-off-by: Tree Davies <tdavies@darkphysics.net>
> ---
>  drivers/staging/rtl8192e/rtllib_rx.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
> index 30bd6f49e915..fb679229f173 100644
> --- a/drivers/staging/rtl8192e/rtllib_rx.c
> +++ b/drivers/staging/rtl8192e/rtllib_rx.c
> @@ -406,24 +406,24 @@ static int is_duplicate_packet(struct rtllib_device *ieee,
>  static bool add_reorder_entry(struct rx_ts_record *ts,
>  			    struct rx_reorder_entry *pReorderEntry)
>  {
> -	struct list_head *pList = &ts->rx_pending_pkt_list;
> +	struct list_head *plist = &ts->rx_pending_pkt_list;

The p stands for pointer.  #ugh

regards,
dan carpenter


