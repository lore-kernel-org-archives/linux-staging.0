Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F26063DC
	for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 10:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wdTqKyhS"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4054f790190so22440425e9.2
        for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 03:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697193886; x=1697798686; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XCTYo1QvPgr9D8OOo/ac1BFS2ndiObZ+hWV0ZomsWcE=;
        b=wdTqKyhSvCOiVrDL5PCL6VvZQ/2b/NqQGhrFWcM+H7znx13O/COeKKS11m8wvdTZDl
         LwFZMBOl+4jBLdtEscMhOi0Bc46V61Y4N2LyF5c8IgTS9JyLqYOTxfrsTD1jG6y2mLvw
         HKqoqrqrlOjvJNzhSbU6H+F9P7AeePEN/2MU4o9Fk1p2BhIz6Vsoqg/i3n0HfRR0hXvx
         HBOdW4LeMJETE/1ORpuf/+LIPqo2IdCeNdiFf8ApPJ+uAsNLKhJpId8Ciu8Ecj+JNjKs
         S7lgHSuMKF2oR/TTn2/MzOIOf4uqHmJWBptRWIAy3zMPcZ2xJI3bNeRV/Jh5gh5cqR2A
         jtBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697193886; x=1697798686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCTYo1QvPgr9D8OOo/ac1BFS2ndiObZ+hWV0ZomsWcE=;
        b=REKjZ1Fx4jFbLIyY2W7BbB24ZxJYWqRFT6lbv7MZ6QOo7vMMA+pya27S+o4z2FK4Wb
         aJghgrDfnV+yHDifH/k0YknMjYhHhB7jkeifmkXIKTXonpK/cxjmOMiJZDpUbp1VvkEd
         hf7R4fraeLEugYPuWgKeGJ5cyfjsa2HFFUfgRY9K9/BwGa+GbKhc6rqFLAdgA3FYX50j
         5G5RpOwU/DCcP8+m6+aZIk64wOasBN0LUaNP4FrTxKdh69zL6p1vRBjXDTI5/IVhIhPn
         4bbR5mC+oOZteNJ3hbpjXppX7MLK2scZ5vybDGjrb+sjFrKT1OJng3MaUoKRp+SOr/Fd
         3Pmw==
X-Gm-Message-State: AOJu0YwfGcRE1eC2giAmwqTCfLKcQuyxXEh/6h80bj+aEL88+tjptp9w
	y38/V5x7E8RjjGlHnk6aDzjdmw==
X-Google-Smtp-Source: AGHT+IEubGhPXfLRKaMsQ9DF2i292nfBVjTNlhOLd8k2zPnDChgrer6Ha7bPCC/VPK1enKrQ7MnLKQ==
X-Received: by 2002:adf:eec5:0:b0:319:7134:a3cf with SMTP id a5-20020adfeec5000000b003197134a3cfmr23692272wrp.31.1697193885917;
        Fri, 13 Oct 2023 03:44:45 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e2-20020adfe382000000b00327de0173f6sm20515196wrm.115.2023.10.13.03.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 03:44:45 -0700 (PDT)
Date: Fri, 13 Oct 2023 13:44:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Calvince Otieno <calvncce@gmail.com>
Cc: outreachy@lists.linux.dev, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Luke Koch <lu.ale.koch@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Simon Horman <horms@kernel.org>, linux-staging@lists.linux.dev
Subject: Re: [PATCH v5] staging: wlan-ng: replace strncpy() with strscpy()
Message-ID: <4679268f-63ca-4854-808a-5cb45624167b@kadam.mountain>
References: <ZSkaIYGqAg5xJakY@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSkaIYGqAg5xJakY@lab-ubuntu>

On Fri, Oct 13, 2023 at 01:21:21PM +0300, Calvince Otieno wrote:
> Checkpatch suggests the use of  strscpy() instead of strncpy().
> The advantages are that it always adds a NUL terminator and it prevents
> a read overflow if the src string is not properly terminated.  One
> potential disadvantage is that it doesn't zero pad the string like
> strncpy() does.
> 
> In this code, strscpy() and strncpy() are equivalent and it does not
> affect runtime behavior.  The string is zeroed on the line before
> using memset().  The resulting string was always NUL terminated and
> PRISM2_USB_FWFILE is string literal "prism2_ru.fw" so it's NUL
> terminated.
> 
> However, even though using strscpy() does not fix any bugs, it's
> still nicer and makes checkpatch happy.
> 
> Signed-off-by: Calvince Otieno <calvncce@gmail.com>
> ---
> Patch version v5:
> 	Removed v1 patch details from the revsion history

This patch doesn't apply correctly.  It has been white space damaged
for some reason.  Tabs replaced with spaces.  Read
Documentation/process/email-clients.rst.  Hopefully the first paragraph
convinces you to just use git to send patchs and you can skip the rest
of the document.

I try to catch these sorts of mistakes earlier instead of making you
send a v6 but I thought the issue was the v1.  Sorry about that.  The
good news is that now you can delete the extra space character Julia
mentioned.

regards,
dan carpenter

