Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B91A53
	for <linux-staging@lists.linux.dev>; Sat, 26 Aug 2023 20:23:53 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5734b893a11so989000eaf.1
        for <linux-staging@lists.linux.dev>; Sat, 26 Aug 2023 13:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693081432; x=1693686232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9lcWcCXv8OT4XG644XlAy8AhtBPlDPs1wMzTD6YdsGY=;
        b=QI53S5/9RQ3APPWOxAKs26tw0SUKsVCAPApBbA8LVgLQ84TXLfvot8164rlx8S3uGk
         D94yMhSVH0TGdQk27JLaDrB2SUuoqpife0Ed129kVcvNYrQRl6VatSLitnwzlN0KrGEN
         k0hhw1q09jMj7N3L2vJ5Xr1LL5tDNSSD2LAWnqQchYJMJhnYVWTkCPmIbdI8nRHTPa5U
         Y9fyztFHySOiLtU7dMeBj5czSZ6wEAsg5Na09dRlgdO3Zc/hPOMANscf/460QC+ln1sV
         /7cmST6UNdlGi8BRrQ36FrGUTKyQGZt2lwbg8WM/I0Sj0lLBXP3KknaOuJ1Y9aGOQlQt
         t/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693081432; x=1693686232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lcWcCXv8OT4XG644XlAy8AhtBPlDPs1wMzTD6YdsGY=;
        b=JvwFbuHYXvE1LVM36DBDSX+xGOgCXV+VMV7oe+LjIpJgZchEb3XBFfzG00m2hScaH/
         b3GUw2YhN5KjKfetew7zgTJ5XrNVzG8tazmEtjxhXgvev20EEHJy+dU193R5s+2xkHyn
         f6xu/DpTgXCGeikhkZ6wWIXFK4PJetTUnpLAZl5S4+zfgGbHk/IVH5H84CluRWN8tZKL
         svfMKr4no+f+VqWV7mqSmLCYq55osmj8aQtY/JMaj9pr9R6YQ3AqOoY81Ub297uoJ3E8
         Y+7HGR0XDSPLucGfof8cOSilSlR5esGNjDJVdMY2/t1PK2gHk760Ip+FNgdIB/Mav0m3
         rfCg==
X-Gm-Message-State: AOJu0YzvaHz0V0zRWJRCdpsDwkN24bexpPUaQdjMyWkc0ZNdG8QWJBkJ
	FXnA+jNI8hUWyJUpfQE3Zuk=
X-Google-Smtp-Source: AGHT+IGeSFUnm+9YqJ16+aPdTw/oxQ7OsZraSpzfNRKNC2x4v2nOt7gFNtZL4eX4W3xHVVym4AQ9YQ==
X-Received: by 2002:a4a:dfc5:0:b0:56c:7120:835f with SMTP id p5-20020a4adfc5000000b0056c7120835fmr9066950ood.5.1693081431975;
        Sat, 26 Aug 2023 13:23:51 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:82ea:8c7c:b784:3f92:988a])
        by smtp.gmail.com with ESMTPSA id q137-20020a4a338f000000b00573444697easm2030634ooq.1.2023.08.26.13.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 13:23:51 -0700 (PDT)
Date: Sat, 26 Aug 2023 17:23:46 -0300
From: Alexon Oliveira <alexondunkan@gmail.com>
To: Nam Cao <namcaov@gmail.com>
Cc: gregkh@linuxfoundation.org, martyn@welchs.me.uk,
	manohar.vanga@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 1/4] staging: vme_user: fix check alignment of open
 parenthesis in vme_fake.c
Message-ID: <ZOpfUjRy3jDwZixX@alolivei-thinkpadt480s.gru.csb>
References: <ZOoWgZ7ZnGyWHUKe@alolivei-thinkpadt480s.gru.csb>
 <ZOpWxBjONs0QpFlU@nam-dell>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZOpWxBjONs0QpFlU@nam-dell>

On Sat, Aug 26, 2023 at 09:47:16PM +0200, Nam Cao wrote:
> On Sat, Aug 26, 2023 at 12:13:05PM -0300, Alexon Oliveira wrote:
> > Fixed all CHECK: Alignment should match open parenthesis
> > as reported by checkpatch to adhere to the Linux kernel
> > coding-style guidelines.
> > 
> > Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>
> 
> Patch series should be in a single email thread. But your 4 patches are sent
> separately :(
>

Hmm, ACK, I didn't know that.

> Have a look at how your patches are sent on https://lore.kernel.org/linux-staging/
> and you will see what I am referring to.
> 

Indeed they were sent as separate emails.

> Here's an example of how patch series should be:
> https://lore.kernel.org/linux-staging/736c8159-90e9-4575-3c22-5a62515d5c03@gmail.com/T/#t
>

Please, if you don't mind me to ask, how's the best way to do that?
I've already wrote the cover letter, generated the patches' files again,
but I don't know how is the best way to send them as you instructed me
using mutt.

> Best regards,
> Nam

Thank you.

Alexon Oliveira
