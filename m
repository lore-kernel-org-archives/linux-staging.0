Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF48BC14A
	for <linux-staging@lists.linux.dev>; Fri,  4 Aug 2023 15:55:03 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3fe32016bc8so20379185e9.1
        for <linux-staging@lists.linux.dev>; Fri, 04 Aug 2023 08:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691164501; x=1691769301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k+kAnvbmstCT1otvJqPfzEvIYiB3WoAn6HzT1+Ufosw=;
        b=VBNk+ZzDISqhAo5iXSyXbZzNOFz7p5vQRvDirLKlPpEs3JPtzNElbtlosw3wSxfMsz
         o+nCrPeEimJLSnVbyAPGuudoM0Z4zxR+LOic3rO+/QebbLl4d9uKmEQKilMfO/I+uEk0
         e/yCerm7jhUoqBfub2WYV+pof10yu7vbS7n0wJGmB6lYmzHGhXiCaenu+LeoPBpOXfAu
         DcAfDJVvEtnlvaelCRZ3+Fj6NlJFvjl5QTyItglCuqnnshuLhrKjSYkVjGmsvmahqMow
         HvbP/F9ngJRx/VVKBizi/+qEIAQL6v2i/Xl1OVfVzQvzmvtHUiSxPQ3vriSoSFZUxxFH
         /2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691164501; x=1691769301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+kAnvbmstCT1otvJqPfzEvIYiB3WoAn6HzT1+Ufosw=;
        b=ltY/mUQlVL6mm++lx+2Ug67fPEM3CXn3BIrToMl7WQLIykUuXIr5x/nd1WV6ZewSMm
         xtuf06s4OF93fiwpEcapc63qKlVdsfdvfNviplDFB8EQovQFIMZRZU3H8AmPRNcDr68C
         z2dPJD26bHA86FLfH7PseECx5ePNhwcfDp3aOZmYYdAN8giknNIlNrEs4gYKNH2h1CRM
         cnnU7e7Z93k/I+yZ4vPQNYfNxvgCEu1YOkIjQJFCu2uXOci1/l7qorn7nsAN4JJCyx0y
         n3lUN7NwGhPDQNzvuEGX3muh6YcRvmZkCNrYOjO0LgqmhbKkYEY4prcY0s+LQuw1OB2c
         D3Ww==
X-Gm-Message-State: AOJu0YxfASHpmeh++/sth3j3fRZGUM29kb/fUzrVIbCK31cGHvneYpJu
	hxce7h5LNenBOPUXmt0qkYwlxw==
X-Google-Smtp-Source: AGHT+IHWK7qRi49IeNlIskLcJux6pIAEoQbpRrVKOoacBoB1NeHje2vU0A8deu7hI2ISASdAVaf6/A==
X-Received: by 2002:a7b:cd94:0:b0:3fe:3521:d9ca with SMTP id y20-20020a7bcd94000000b003fe3521d9camr1774229wmj.3.1691164501478;
        Fri, 04 Aug 2023 08:55:01 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n8-20020a1c7208000000b003fe11148055sm2674064wmc.27.2023.08.04.08.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 08:55:01 -0700 (PDT)
Date: Fri, 4 Aug 2023 18:54:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alexon Oliveira <alexondunkan@gmail.com>
Cc: gregkh@linuxfoundation.org, martyn@welchs.me.uk,
	manohar.vanga@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v4] staging: vme_user: fix check alignment should match
 open parenthesis
Message-ID: <a440a7c7-cfb8-478f-baca-af7e4d684ca8@kadam.mountain>
References: <ZM0QPaWv4lp93rGF@alolivei-thinkpadt480s.gru.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZM0QPaWv4lp93rGF@alolivei-thinkpadt480s.gru.csb>

On Fri, Aug 04, 2023 at 11:50:37AM -0300, Alexon Oliveira wrote:
> Fixed warnings and checks as reported by checkpatch to adhere to the
> Linux kernel coding-style guidelines.
> 
> Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>
> ---
> 
> Changes in v4:
> - Fixed changelog again
> 
> Changes in v3:
> - Fixed changelog
> 
> Changes in v2:
> - Fixed CHECK: line length exceeds 100 columns, noted by
> Greg KH and Dan Carpenter
> - Fixed CHECK: Alignment should match open parenthesis
> - Fixed CHECK: Lines should not end with a '('

There you go.  You managed in the end.  :)

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

