Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F9B11CBC
	for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 15:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cMYNfd8h"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3231df054c4so1820536f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 08:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697210274; x=1697815074; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4rfoZ5XVzKB5xUSk2Mi8aOy+1livfWwwFoYiv9POKdA=;
        b=cMYNfd8hyZv9JCKpnLWLG56Kqa9VX6cDzdtw2c8m39NzAtg2EytHr1J5mDpW9gDLp5
         cpiChHwGFkm7aUxTOg26TxBxOlEoScVAV90cYRDmac3KQKvp7XN28ROpaqZiC7eeLWmU
         wNWp+PlemJ+ruqzZfKOWYxJE5PXwmNax19TXl7Sw+FnBIkth+MHnaTY+uaNyC4PgAiiA
         wSkz1nHgA9vp79aquGO23hS8CqrpyioAEKEMRxEc3Pb2jIYAA/PXFLhzvRh42ffxcK/M
         XODFTdm8jZwtjnrRg9umx6JncAIkBkvPqLe9VpiWZlkhz4f4ALLkZdyraVcyAHFrCoZO
         qjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697210274; x=1697815074;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rfoZ5XVzKB5xUSk2Mi8aOy+1livfWwwFoYiv9POKdA=;
        b=Bckg2+BS4jWzQnYqV63KbvPJAOrpx4glrPiUnYGrvFHw5i4wl3ZXEpzXf9ro03wRy8
         jcWNVU2crE1D440Kos2OP2kNEyoHJaTPiicekV3wQquHFB05g5jSEeP50g5WUe6kpEnw
         eWExlxf82lLjccyrTjhAk4g66OGfT16XODXgMKSTGzG7zqDKlLud9DVyODRU2i/DTEvs
         BuLFtQh5zqMkOySynFoCAjV+8bj2bLU0sNOFZLJPKqL7rnebs7LyP58nRILlEcCgw4RL
         4DNKLfwXCbzZ0l3ZtiGGoG9on4S28LhilZ8JHE50AC/qBcyQ93/7wz8ZHyZddhEQ0Jis
         Hziw==
X-Gm-Message-State: AOJu0Yysf7pXa6J0aoaJiXcfAV4g2GeISXvyE9ofKLlHXUJSErZ3fTNw
	AoCAuEU5GPag6xh6II3UIkKAaQ==
X-Google-Smtp-Source: AGHT+IFLj03Y3alNcqYWEIf7+s3KhO7qp+5XajSXh6icVIyX7sXIXB6Rc+8gqDWeOOd8LUu2jpETFQ==
X-Received: by 2002:a05:6000:888:b0:319:7b66:7800 with SMTP id cs8-20020a056000088800b003197b667800mr21871867wrb.55.1697210274230;
        Fri, 13 Oct 2023 08:17:54 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e6-20020a5d65c6000000b0032326908972sm4941696wrw.17.2023.10.13.08.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 08:17:53 -0700 (PDT)
Date: Fri, 13 Oct 2023 18:17:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] staging: rtl8192e: Remove unchanged variable
 dig_enable_flag
Message-ID: <2ae55a15-0b0e-4423-838c-6abce81d1570@kadam.mountain>
References: <cover.1697127817.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1697127817.git.philipp.g.hortmann@gmail.com>

On Fri, Oct 13, 2023 at 04:43:37PM +0200, Philipp Hortmann wrote:
> Remove dead code leftover from previous patches.
> 
> Tested with rtl8192e (WLL6130-D99) in Mode n (12.5 MB/s)
> Transferred this patch over wlan connection of rtl8192e.
> 

Your patchsets are always very good, Philipp.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

