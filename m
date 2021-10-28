Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A646F2C82
	for <linux-staging@lists.linux.dev>; Thu, 28 Oct 2021 15:36:21 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id ee16so13534924edb.10
        for <linux-staging@lists.linux.dev>; Thu, 28 Oct 2021 08:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Km7RN9DuYhSgIdZd4vw5rE9R6RjCpFJ/7Jxi8UL+wpU=;
        b=AlM+eueZXz8t3SOmFz7G6PaqrKh/8fZ7t4ebW1BfNzZVsiSmiuBcpXUbFbzFr80EPh
         b3wK5Fp0Dah+Kr1sNSpyk3ND5UYWlrL/QOBud8eo4PQUE0gfQoRFuRqEgC+ZOIoJMKVD
         4srzw4IwWjmkY1d/GYfmTHou9jwST8itfs7PmfHN/JidMIqJqyLQy1VyqeLduhjGFjyn
         6XUaxx0+1udNHyqUeGnqhCwUy1wftttRahRagX9OMuFb4FiDStKPkPdoxEjwwkPgSmBg
         CCcgJHeJRZtecoilsnWiJCaQtgJ/bzROBO8Pv3XJtxy4/e3M5GVe7t7ezA0qUiXdr1Cs
         3CTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Km7RN9DuYhSgIdZd4vw5rE9R6RjCpFJ/7Jxi8UL+wpU=;
        b=y4egjdmA7NbvZn3y9NwrxGIrGiAYtlE407PwxyK7m6zWQzFHQjNjF8AlOoZLXfhy6l
         JDvIRpjNKypT8zBmzmnzucptZW0R1vikDVaDpmUEXU6J8Q6pZrKSjkTJ2sPtY/5C8p4M
         dVsbNeg7jx0BPaZUuUkt3nollnrtfWo8xmiF4ELhBTDbFnr1fDYmHZECxrsrsp6WrZND
         B7GRKp7j3F0cbQKpwvJ07V27IunPxiA0ZcWS3ODrERd/HigSa5xFvQilar4yvU4WfNVa
         N8pbAExbwzuCbB1nqeE6f58Eml5bu9mfOyR9CTYWFpfrcR71/Rw3sDcAIsMzyVs2W3OX
         vYQQ==
X-Gm-Message-State: AOAM530v6vkeWrtuloC9i5XYEHnmndsqjo8VCPUr/evQir1mSNASbE9e
	yxZBJrWE9cdAJfFbWXZ8llI=
X-Google-Smtp-Source: ABdhPJw/Yo90kJQEQRr1eUujrIVd2cC+gKKUV9sZsn77IH1geIQKq/vGEVJuhyTYNpeKCW9Gy0hPKw==
X-Received: by 2002:a17:906:1848:: with SMTP id w8mr6316533eje.485.1635435379975;
        Thu, 28 Oct 2021 08:36:19 -0700 (PDT)
Received: from localhost.localdomain (host-79-56-54-101.retail.telecomitalia.it. [79.56.54.101])
        by smtp.gmail.com with ESMTPSA id hv9sm1604735ejc.51.2021.10.28.08.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 08:36:19 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>, Karolina Drobnik <karolinadrobnik@gmail.com>
Cc: outreachy-kernel@googlegroups.com, gregkh@linuxfoundation.org, forest@alittletooquiet.net, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH 5/7] staging: vt6655: Rewrite conditional in AL7320 initialization
Date: Thu, 28 Oct 2021 17:36:18 +0200
Message-ID: <9038076.3kJb6oI6SG@localhost.localdomain>
In-Reply-To: <6d2590b127499ba7ae1e7bc36d71064a5262659d.camel@gmail.com>
References: <cover.1635415820.git.karolinadrobnik@gmail.com> <alpine.DEB.2.22.394.2110281505170.9518@hadrien> <6d2590b127499ba7ae1e7bc36d71064a5262659d.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On Thursday, October 28, 2021 4:35:30 PM CEST Karolina Drobnik wrote:
> On Thu, 2021-10-28 at 14:36 +0200, Fabio M. De Francesco wrote:
> > As far as I know by reading some Greg K-H's replies to other
> > developers, this 
> > "<test> ? <true> : <false>" style is not well accepted here.
> 
> I thought that the expression is simple enough that it can be written
> this way. Julia nicely summarised why I think it's a good usage of the
> conditional operator. Still, there's no problem in changing it to "if-
> else" statement if that's the preferred option.

If I were you, I'd leave the patch as-is and wait for Greg review.

I was only reporting some words that I recall I read in some emails of Greg. 
But it is highly probable that those contexts were a bit different or that 
the statements were much more complex.

As far as what my personal preference is, I think that you shouldn't care 
because I'm not one of the maintainers. Above all, even if I were one of the 
maintainers I'd never prevent developers to use their own style with this 
kind of statements.

To summarize, you'd better leave the patch as-is.

Thanks,

Fabio

> 
> Thanks,
> Karolina
> > 
> 
> 




