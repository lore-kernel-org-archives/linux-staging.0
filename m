Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC5929D283
	for <linux-staging@lists.linux.dev>; Tue, 26 Aug 2025 10:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756203557; cv=none; b=BcbbhBzT8zGhWUy3ED3agCC0oFMJNLTqMfhCcsGNsLyagUbvdrf22S5gaPKcituqO+CgElWNCNyoIgCI9w+yRhPlzKcmpeThePlTAY218Htv5YOKcaMb4+/n50gfGKbdCSBh5g0V30yFbhO9JwYhIulrcK1ABK0TnuJk3tjvcx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756203557; c=relaxed/simple;
	bh=P9Vdw9iylpzk0qKP9kKWFec9BuKBYaZ64z20IOqIxAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pk4yDZ2NdEnHF0V0uU7geqxYbrKknO+LhKostZJbx9eu6oumwD3MgaiDrBxdvxgIrZc9onYLl3bS/MBkx7bd/1QIF5wW0YkC9sXlsqhgPuxZZ4kuWfrXRPTqclr8UIcFmlJtkShlQzogInX9/ynds6FlqxWK3Q8/Bb7GRfBqwyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OQXIine9; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OQXIine9"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3c51f0158d8so4066526f8f.1
        for <linux-staging@lists.linux.dev>; Tue, 26 Aug 2025 03:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756203554; x=1756808354; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KA08p19n2dBZD6F6oasWBo8WpykXDUnkHMST64oT7b4=;
        b=OQXIine98tq7R3RquX5o04ArpkmEm2WwP67irT/VAvbUgtDt7RL1YxiSbxr18CPyEj
         iJdTxIqOv5LXRQYv7/smvp7ls+I3SVquSJY6dt/jsGwNPdHfHgNVjYZXKzNVtPr5m4MP
         CibrHt7LT6atKyjnydtK2mMJwsnSyKW5OW7AN3qwGvX2WV4bimQy9yWCgAyT5XrVnerp
         KkfVJQkVkuZUwtjJ+Xu2nCH/6liy+vmeIjQ0Vtaf9W1CtKdeeXzLKwk2YROVc9pJoEus
         PXgiJK/+ESChazbW60ZP053jD3+wG6zxKWOK3WsmzUc7bgPy6FqLWUqWhfvdI3xUhzjP
         pgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756203554; x=1756808354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KA08p19n2dBZD6F6oasWBo8WpykXDUnkHMST64oT7b4=;
        b=kfIBs0HoBNnGMfHhAqT878seeZw8Jq7EgDR+MYvV1W1kyJpXZ0WtnkOnOdii3yioCq
         Tf+Ocsb1a+16WZ0/XqvoVorOiirfRoI9u2dCB+N/M7MyRFXjUOx6RvaA78AxtM9IhhvK
         wR+Ju68yz/rMSlPS3NX3RpdjLLWvFU7hX+EIzwvzncBD9PGRVFMsY8FRZYMsZqsyV+r5
         cvlgHW0FilrZgRe84A+bj2/eJXJGBkf330qcS583phDeQ5h1TW56/DvAHyFLMu3us6x4
         4orxAk7cH6vp5DfUQYdZrq6HwXeLc7owzxxT5AS/GFqp0kHWGOCEQBK4/TT6gHWQbPdL
         OZPw==
X-Forwarded-Encrypted: i=1; AJvYcCVuk0dygCIhU+OgXJ2J07kgh8ldxvS7eLIpOlhhXmOaXeVst0tee1TNUkiGA/BYvpvPQOjPVqwTe3cxFdA5@lists.linux.dev
X-Gm-Message-State: AOJu0Yx672LjrvOGeEmRSStfmZdYEU3KOBOH3sxhs8EYlCDgajP5uvKO
	C+2V3nQpUatR+5n2TBqJc9o2CeCHKLF4/lptCalaPENSrm3nqbFzD96GfHa5UPvucU0dCXNocKF
	k/bBO
X-Gm-Gg: ASbGnctCILyVFTRsxgha6qe6IbReH7hsSMq34E0iKzKXlY4EDc5sVkMTkMmk2PaZKEz
	JZ0H1bclIF6dBfe8KezvNKomp+AZM1Ey9+JADANssTNG4MFzQ9N8vKKMt/ufZpI8Zsgu/4rbVn2
	ZVwyit5yzB2LArQ227pm/3lMBl+HfJIrMPxcSgzNXqGdxFQ1zrnuk51kFvj/PVAaJDnzVuTs1Me
	vJsupe6IrLSH15Y94amUtJLTuy73dPPywIQhYnjDkAuzNOLQuEIUgH18zvIvlakXs//6qw0De19
	uRwMJAAgucEKjvSdcPbbRSONMDozre+pHRbWn04ntVWBVUAFTNojqjWo36BQdhK1pAG0lzQsS0w
	NONjdeakMnIewuNj9UFof3qTNwKPTYhPhjCeQug==
X-Google-Smtp-Source: AGHT+IHk9cosoz3/LRw9lg5Dp7C24orHPU6oYSaVahz4ew+BPbdCGzHMxX5ITzmTxE3NR4Fgi9pymg==
X-Received: by 2002:a5d:4846:0:b0:3b7:6d95:56d2 with SMTP id ffacd0b85a97d-3c5da7402e3mr8297216f8f.7.1756203553895;
        Tue, 26 Aug 2025 03:19:13 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3cc0ea9e0d7sm27392f8f.25.2025.08.26.03.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 03:19:13 -0700 (PDT)
Date: Tue, 26 Aug 2025 13:19:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Rubin <matchstick@neverthere.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: gpib: use int instead of u32 to store error
 codes
Message-ID: <aK2KHhaFqWbd5S_O@stanley.mountain>
References: <20250826095907.239992-1-rongqianfeng@vivo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250826095907.239992-1-rongqianfeng@vivo.com>

On Tue, Aug 26, 2025 at 05:58:59PM +0800, Qianfeng Rong wrote:
> Use int instead of size_t for 'ret' variable to store negative error codes
> returned by bb_write().
> 

The commit message needs to give a motivation.  I would have assumed from
reading the patch that this caused a signedness bug but it doesn't.
The commit has no effect on runtime but fixing the type is a nice
cleanup.  My commit message would say:

The "ret" variable is used to store the return from bb_write() returns
either zero on success or negative error codes on failure.  Storing the
error codes in size_t which is an unsigned long, doesn't cause an issue
at runtime but it's ugly as pants.  Change "ret" from size_t to int
type.  No effect on runtime.

regards,
dan carpenter

