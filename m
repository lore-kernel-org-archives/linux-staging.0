Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B54DA53
	for <linux-staging@lists.linux.dev>; Sat, 26 Aug 2023 19:47:21 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4ff9abf18f9so3132035e87.2
        for <linux-staging@lists.linux.dev>; Sat, 26 Aug 2023 12:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693079239; x=1693684039;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JfqtSyOOEfYeYXPTw3WvhRqU9e0vvdpGdFZBiD7IMmM=;
        b=fw2iNj9Em5f7sj12SJcskjFuQM5sRPS6mGTZYIck6eSj9Xy4xQaUl6bA2aMC9A1aix
         a3f62p5aLukbSQz1bkTravregpJUVE9HcLQDHqSUUg+IEwwoxhLA1JmZ/gnhDLycldML
         vwWf18/OyN947xDFz8T8Iw2Yw6xOeJR+0ZyBzKfP57SGD1epCVcLFKUCplq4y/KuMygT
         /1/4L+GswEAhu3vZYYxI7Jn71TmNaQbKkkTK6CvqLxHVOU6XpWvvvg7TO8qiD94LLMQH
         btuft6vPPIB0pCeTAXDnmb7TQlK99WW66+j/y9GEfaJnFXoGsVNonorroXvv1gkR1i3o
         NpRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693079239; x=1693684039;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JfqtSyOOEfYeYXPTw3WvhRqU9e0vvdpGdFZBiD7IMmM=;
        b=SO2YRlBZBv/PGM7ClZxVsO3sBQkYcH2RkoZZN14sx9DQa1ST6pVaKPdyVb342Qk/Hb
         vyJ+EgPgGl6FBP6zEUTgEYWkO3qjEK2VyS663GW60oO83bZOVFlMscIU7kuOCU8F5MZ0
         UJMJzyjcO7ACIaIdb0FqqwCvVcIQSsyKOuHk4qmTKtqzMvHnXsbp3JwMpybZ/cX7qnZ3
         pSKao7F6dDAOGEZV0Ejpyv4wrjGKGk0v0JcYSHYhfL26rYLFU8YBTv1OWE9FxoYbKGUD
         EAweZNyULZhGyWq51+OtkQJDrTgDRhvNm70Qttz8wpG9OwlVnsSuPx8t0XALf7Zb/5+L
         6Njw==
X-Gm-Message-State: AOJu0Yx8Hb3FVQ8ZUiUVvWy4WVXxhGgZGrtHSqTEGso4j4L2+erdpfWc
	9eQY63lbCZ1dJ8YgRlC2AZtxZZWyPN8=
X-Google-Smtp-Source: AGHT+IH6qDpM6m/YAxoJlYEq00WDgoVHO/8PUUtiAVqxMxmaYkeqIRnLFr71BPhd0b7U0lVKDdaOdA==
X-Received: by 2002:a05:6512:313b:b0:500:81fa:46f1 with SMTP id p27-20020a056512313b00b0050081fa46f1mr11357717lfd.67.1693079238415;
        Sat, 26 Aug 2023 12:47:18 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id f18-20020a170906825200b0099364d9f0e9sm2543939ejx.102.2023.08.26.12.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 12:47:17 -0700 (PDT)
Date: Sat, 26 Aug 2023 21:47:16 +0200
From: Nam Cao <namcaov@gmail.com>
To: Alexon Oliveira <alexondunkan@gmail.com>
Cc: gregkh@linuxfoundation.org, martyn@welchs.me.uk,
	manohar.vanga@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 1/4] staging: vme_user: fix check alignment of open
 parenthesis in vme_fake.c
Message-ID: <ZOpWxBjONs0QpFlU@nam-dell>
References: <ZOoWgZ7ZnGyWHUKe@alolivei-thinkpadt480s.gru.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZOoWgZ7ZnGyWHUKe@alolivei-thinkpadt480s.gru.csb>

On Sat, Aug 26, 2023 at 12:13:05PM -0300, Alexon Oliveira wrote:
> Fixed all CHECK: Alignment should match open parenthesis
> as reported by checkpatch to adhere to the Linux kernel
> coding-style guidelines.
> 
> Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>

Patch series should be in a single email thread. But your 4 patches are sent
separately :(

Have a look at how your patches are sent on https://lore.kernel.org/linux-staging/
and you will see what I am referring to.

Here's an example of how patch series should be:
https://lore.kernel.org/linux-staging/736c8159-90e9-4575-3c22-5a62515d5c03@gmail.com/T/#t

Best regards,
Nam
