Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E5440F8F8
	for <linux-staging@lists.linux.dev>; Mon, 14 Sep 2026 08:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376091; cv=none; b=gYePK7+z1ZtpV8Nh5YM/nOqLlSsfO5afFiUdrkMbB2g64f2pD02b542BZQwxaYZmgPmOfkairgSyDrD7djPtMKBmmHGazk6Pg8FBTwlclAmb5s0bxSZMz74YGXpFJLJv3PutGcV2aOWKrC6NjmeO8BTKFcu+yivHm9VCwu8oUyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376091; c=relaxed/simple;
	bh=Oex4lP6M1jAXUHgnrRyELQLIdsFXA2FcI8B6FYB04/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lWjjM1dunsJsljCYPkAWOcYUSiLvXPyP19BbByWo+bGyzbyiq+AWavIrbazkz48TdteufH7b9LUTc2WEyNLgvIWjsaFrcYEqmvcd/mFbllHPjzNU9eEuiEhWXry+k90MaZARordqaYD3wxLsXyHHTf3D5GWtBzGUCqMQGvcvCQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AC7cCLT4; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AC7cCLT4"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6056be4d2so1419985a12.1
        for <linux-staging@lists.linux.dev>; Mon, 14 Sep 2026 01:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789376081; x=1789980881; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=61OP6MUp9ANJJBq18hSWE5M/OYvgWHC2avjw9EhrCSI=;
        b=AC7cCLT4nk32chjIlpmUfcysXMu1ncyFMxer/sYVx8nwAIv5og3EzNxUsfQkPtJ8Kq
         3Vz5JMsCMVZMj5TeFOJ+5UnI2DMSwP7+miFJ6CV9HTJmD8Oz0e3DB0vxHliP+SrxKzPu
         tFu3qGteWQhDqP337vmp2iAIjVIclp8as08qaTIkDa1L9kIaZWe42QEJTnBBDtePtO7D
         R5xMScpYgPiy8UxER+yPULDHQOYQcgp1uEudogSGUR7E07f4U+xI/7dNkvVa1MZ0gNwK
         ZJx++K25o956jathkFdhbWOxaM+SIHXQgTqGA8tCEuX3DJSLp0paAZNxYLlFBhshrcQ1
         63Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376081; x=1789980881;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=61OP6MUp9ANJJBq18hSWE5M/OYvgWHC2avjw9EhrCSI=;
        b=Mum3gf9B2uDxetjsXNPTcRAcxGOUpwYFlRj9C39u7NZJ26z8FjLuIneeQPbBxGGtUL
         MKNzHE6jwUohZUZKJCcnLWWauXL2MmoSXxR3gU4SNK+WG2aNrEyS67P07K3fcGTCB1ir
         nddii+KrGEFN2nJBoVwgKe+Q0ojCrCTlI1wIDJgFmxh+Sz3YSArdaBN4vDMW7iUKy+ey
         AggBQDWetY84ZpA4u9sR7hIGd6kwXSoA4D3FGD+up2dOTCdwRy9F9v+KksHiNmzd1+3D
         4tz5W8Z2M/GVBL24kRpRxB72/cDsZCT+3EOXPhJ1/iGUr31hsISy18ma/JG8nS/pCnQf
         lFLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDK9V8a7UlSDYv1PKGMZl0MLW7U1DvH7WS/0IcJIEXI5H53EMnV0dMufuyyn3GIMoFQ7h5BizrTVLyl3HI@lists.linux.dev
X-Gm-Message-State: AFuF++lf6M/L94mfTFooeN2YOXvAe8CqQwztawz6YZb9HVjrRzCq6E+M
	dr03ZrDisg4SgXzKzhP0BIKbVihZ5H23vSB1hKmTWudjGGuhgXjmwAxj
X-Gm-Gg: AYBFou2vmTIOUmcGnIqvqI6behl83/pKYWcQzIKpytEyZna5frx2wjrxFwZ96hUVq6O
	+Fp5cMfrZnLKE/8pvDTVBSzN6/8MfUeQAWVez0wB12arBlRbFCt5heAaTJ0qwvlVh3IGpfZCMW6
	cc9YxccM+epDXwcvVu2Rq2evDKaxEEA/vRFfTA3jPvelJKa6SHO+GxNQ2jXToCxpqEFxcBx9N6z
	tKAEEq/qlsGfy2KRV6u//il592XrEZX6n/C8lNEw1Oz8Pwl+1zlsXEZRvGnE+8F3KgEtOVniCGe
	LY7rYnLX+UC/bI+dOzaPRXRorXVZ/tVWlhVktkJyywuAS+NIBzBkTe+ts4JRzOJV1B6VRcqMF+5
	v1XggPVuAmLr/ECknDoMbCKvUf3e/ZwiYAdDoDFKvTbticsbRGxL4oNuvQGX6+4vYSWmSlHQPYJ
	zKsWkvPN4lePYfOtTM5lucaAx47m++leO/v/GZqkEMnJsbLm/bcFZdJ+rq63Pcbbocb5YDgGmjm
	Xy2yg==
X-Received: by 2002:a05:6402:450a:b0:6a6:32e3:9ba with SMTP id 4fb4d7f45d1cf-6a9f652d7e2mr1058343a12.10.1789376080524;
        Mon, 14 Sep 2026 01:54:40 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9bf18d240sm3677157a12.6.2026.09.14.01.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:54:39 -0700 (PDT)
Date: Mon, 14 Sep 2026 11:54:36 +0300
From: Dan Carpenter <error27@gmail.com>
To: Gabriel Changamire <gaberashawn@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: sm750fb: clean up sm750_hw_imageblit()
 kernel-doc comment
Message-ID: <aqe2TCpR7FSoykOE@stanley.mountain>
References: <20260913040140.4517-1-gaberashawn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913040140.4517-1-gaberashawn@gmail.com>

On Sun, Sep 13, 2026 at 04:01:39AM +0000, Gabriel Changamire wrote:
> The @start_bit description contains a stray ">-----" artifact -- a
> literal copy of an editor tab marker -- that leaves the continuation
> line "0 to 7" garbled. The @fg_color and @bg_color descriptions are
> also missing their closing parentheses.
> 
> Replace the artifact with a plain indented continuation line and close
> the parentheses. Comment change only; no functional change.
> 
> Signed-off-by: Gabriel Changamire <gaberashawn@gmail.com>
> ---

Acked-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

