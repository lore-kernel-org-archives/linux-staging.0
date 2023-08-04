Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C879CA56
	for <linux-staging@lists.linux.dev>; Fri,  4 Aug 2023 14:33:35 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2b9c0391749so36319881fa.0
        for <linux-staging@lists.linux.dev>; Fri, 04 Aug 2023 07:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691159614; x=1691764414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kJceY5070lCje9P8hIH/TGu5+TQ0hwpi7Lw9dbd0KDo=;
        b=Gtkh0KewHJRP0GX1gq08SEcRN1NtPosJofSJGhpkQlryJLREADTu1c2tTZSEBAriFb
         pm4yDPClhkOImF2dNEfaSRwj2mlv/ZDSnVWGthRMl79mIlnY675rZGw3L4ReUd8LH0A7
         Kgt2KV69Hev2faxLPNH7Wp0pp3HG8XGh5Z6IYdk6bo1JyrEMXy1acfIqOvLUdqzuSYiD
         NnmSacrXDT/hZUKvlmmWEzzMWmyT3d+4LBtxp85YhLjXUPkFPB46m3AlAQqE613TtlJy
         lwjv9O11uk+56jWNjVEeqHnCJmu0aQNl1DUrosaTJeAkyUTBv0Wt+eFVdAnZBYK/fFM0
         cLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691159614; x=1691764414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJceY5070lCje9P8hIH/TGu5+TQ0hwpi7Lw9dbd0KDo=;
        b=LOf+npbf5QpbOxEYQzHRwHo09JTQIi3A0Z5c8RsaDAJ041pAPuzzQPUdvy9uLTHXSy
         pMY0sE2JAPD26r0M41ntqTYQqTisEnUo3lGAafqtZZKPFWi1quS2eahHA++ZvSDZC7Oo
         GCpNuduqAsi/nNPJ9gs4a8SwYsagM76drOAnYYIqEpLyRqxy6ZdGeU7DGeJWbytKgW9e
         23KgxBzknOjskQYd7IuO4mxtY/bigQ0u4QO1AhDAa+X7nmdeedsABpeuKq72d3CaFqWo
         x7VRrz5eTbzKzm0z8zVgDYZfcvv5MFLXck/gWo+YsyALoneRgPSG92Xdk34sGFUilG9E
         1VQA==
X-Gm-Message-State: AOJu0YzU4TqZ0WH23iJ2mbHIAV6U0u02NVl9JFw0AVH+0eSa+P7/nyjS
	7YCsNWCQ9YE7sP5Yy7tDa+qvdQ==
X-Google-Smtp-Source: AGHT+IFiFzjIO+ZLID319RKbJYXRmZHCV0URpVEiP/kd1jfJrpk0xC3qN5zBQkf0ICpI5ZOMCaxJWg==
X-Received: by 2002:a2e:7c03:0:b0:2b9:e8d6:c486 with SMTP id x3-20020a2e7c03000000b002b9e8d6c486mr1560433ljc.27.1691159613879;
        Fri, 04 Aug 2023 07:33:33 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u25-20020a7bcb19000000b003fe1cac37d8sm6985302wmj.11.2023.08.04.07.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 07:33:33 -0700 (PDT)
Date: Fri, 4 Aug 2023 17:33:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alexon Oliveira <alexondunkan@gmail.com>
Cc: gregkh@linuxfoundation.org, martyn@welchs.me.uk,
	manohar.vanga@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] staging: vme_user: fix check alignment should match
 open parenthesis
Message-ID: <5539044a-0d67-43d5-9d75-42c65d616239@kadam.mountain>
References: <ZM0Lmt5Dp/k6iO21@alolivei-thinkpadt480s.gru.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZM0Lmt5Dp/k6iO21@alolivei-thinkpadt480s.gru.csb>

On Fri, Aug 04, 2023 at 11:30:50AM -0300, Alexon Oliveira wrote:
> Fixed the following as reported by checkpatch to adhere to the
> Linux kernel coding-style guidelines.
> 
> Changes in v3:
> - Fixed changelog
> 

Nope.  :P

> Changes in v2:
> - Fixed CHECK: line length exceeds 100 columns, noted by Greg KH and Dan Carpenter
> - Fixed CHECK: Alignment should match open parenthesis
> - Fixed CHECK: Lines should not end with a '('
> 
> Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>
> ---
  ^^^

Changes go to under this cut off line here.

regards,
dan carpenter


