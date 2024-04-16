Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9875FEE3
	for <linux-staging@lists.linux.dev>; Tue, 16 Apr 2024 12:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713271137; cv=none; b=A+Zi3a5B9p9+L7SIIA/yPO9QxvL2ghMvz81Kqk691kKB1LkUX8W5RyC4nzL2FYzqXN1dxUeuDNArYFPVzckuO6XN750oKl8b5C5IbiVlspljnOriNx5/aY/p4/88iVFskEfuhH6XRkI7FZph0n8ZM6dbxXLECm2HUdRrnK9HcNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713271137; c=relaxed/simple;
	bh=RmzZf7KFhcOYGC2I6q3cNiiYlOfQWLYJ71vx42JQWRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iP3FD+iCsCUqdOQlj5w/rZJ/oh5X297ZcAVUxFNnFFKzEVFkp53oQzKXLltdYJQKGDLLsIl0uMJPKG61pbA94oaNazWgmqwjO65QNrbbUbNC2ReJsEDIL+F+2Zxb/wlOwtS5JTzyig7DS66rPGz/VZeikH2DTXLAEbpasndUvRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kf31EdD/; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kf31EdD/"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a51a7dc45easo486063566b.2
        for <linux-staging@lists.linux.dev>; Tue, 16 Apr 2024 05:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713271134; x=1713875934; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nmaZPsA5/bY9fp2hcNvKXfbEk2+XWrkUqrlml8f+fjg=;
        b=kf31EdD/jqK+6D+oBA5cUK3VvU6dEaNEol8SC8au8m2DuScFjmAoJjXpX3UItXJj13
         FoB91vFFMkfb5N7HYvoNZtKq5DFvrn3A53ThDxebB/lefIc5/MLoZpAZlaeMoC4aC9Ru
         2IyUJK0t+xujzh0NXZMlUbPVKlrgdKj0TiSsqXyucrpVoCs+k1x4DXwUbfIe/aT4TYDG
         H9z8C7ti4ohq7bdhB6jPG2Z7Iq9/m7J8z/sIMtPqYMSj0ZKKAUVfPK2n1wJN6s3LjM0i
         1/3a4RyMN02cAPs9PlmtSv+9jajmUDyFYwfPp50erBdxtMNpmXbx/5YhCo2hnLz6D2Lw
         wTJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713271134; x=1713875934;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nmaZPsA5/bY9fp2hcNvKXfbEk2+XWrkUqrlml8f+fjg=;
        b=naw5GaCYsN9BW4QBU2VLCHooMV3iZ0mYwHBVxgS/9aFop65JLqkF1YHvrd/JqA2/AB
         gSlxlYkSsjFN6DYwNslqc+l0L0fIxU+AW+D6IIda/k26fTBl6I3x0k3P00seWAyjek6J
         HJsllsVxEOqdvYys/DHFqbdlqtyJaj/13KlHlThnVEEqG9H9g+n+xa39sruV+0tlJxJ8
         5hKDztI7h/L+7p3wbuaBvX5ek4j/EUG/zsH9QpesmvvcMyo2wfVMtFg29eAAC+7ba7kh
         60z8fDyR8EOWYsa7nKrdbJEwkeVk2pIUBj2ZAQdr4CbTDoVjC5y/BFb6dhcF96uKD4v4
         4jyw==
X-Forwarded-Encrypted: i=1; AJvYcCWvP5Vy1ZdiK43ZmoO78x8qLEwjqLcDVKwCZFyKf3+UOwCe8oY+q3JkYcyd3g4kQNG9I4KeH/rFdDmE54jAwHIKlW/tHynpN64dGr0kFw==
X-Gm-Message-State: AOJu0YzGp8tmObmPD2zevRQ+2pXTIXTBV/cR+Qs/uohZHohcjZu+Od+b
	TkDNa97V3e7sTeNFn1PcdisVqfWFkte9XQ5QnHGYL/8Lt4AqOoH5AwbCMKlTwyE=
X-Google-Smtp-Source: AGHT+IGz3VKYK2E3xDM7FfRYh+Y9LTHdgWe5Ey7fM49QWy+hpmVdcxxwvu7Ke0VgRiRjbYE8DUnyXg==
X-Received: by 2002:a17:907:9496:b0:a52:30d3:41dd with SMTP id dm22-20020a170907949600b00a5230d341ddmr11072034ejc.41.1713271134447;
        Tue, 16 Apr 2024 05:38:54 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id dm18-20020a170907949200b00a51983e6190sm6766884ejc.205.2024.04.16.05.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 05:38:53 -0700 (PDT)
Date: Tue, 16 Apr 2024 15:38:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Karan Sanghavi <karansanghvi98@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging : ks7010 ks_wlan_net : Fixed Unnecessary
 Paranthesis, Prefer Fallthrough and Line spacing issue.
Message-ID: <c45387e6-1af7-40d9-a2f5-5cc174154485@moroto.mountain>
References: <20240416115903.92706-1-karansanghvi98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240416115903.92706-1-karansanghvi98@gmail.com>

On Tue, Apr 16, 2024 at 05:29:03PM +0530, Karan Sanghavi wrote:
> Fixed a coding style issue.
> 
> Signed-off-by: Karan Sanghavi <karansanghvi98@gmail.com>

Greg likes parentheses so leave those alone.  The other changes are
wrong and also break the build.

regards,
dan carpenter

