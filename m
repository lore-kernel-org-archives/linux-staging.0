Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666991ACEAC
	for <linux-staging@lists.linux.dev>; Sat, 24 May 2025 16:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748102992; cv=none; b=lGkFD0sHgWLbcORmd1Dj47P/fE0Ax5VFhFpuWrEsqlTuDm0WJOf3K3/MAezYmRAitnOrmvUuIXg7HYVYgAr8bg6AuKdwMlSydyLJH3oepuU+OTSM9xXr82sVF76ALPoWLXjlpeebLJ1IqvVwWy2po3htIIeAI/PGxjV1SwU3a7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748102992; c=relaxed/simple;
	bh=0pVO+6KQK+7gvYGZz1o8g2GLpTLjtwURPnQTls8/nhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=myiV+14Re/jbr5Y3LbU00szGxVVKCIxecXAFFzqeR/It1hp7aZ6V41Lu3NyY+AQdZjj6VLDTXfhnMF/XVA9P9LSz0a7p79UxSF7hORdnGN7dek/T+CerW4xwT6vCaBkyKG6AVL637oW7csrA+0p4h9Up0gllWKMRftzrajNPuBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ArFCQwBY; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ArFCQwBY"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5499614d3d2so1054287e87.3
        for <linux-staging@lists.linux.dev>; Sat, 24 May 2025 09:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748102988; x=1748707788; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tb/w3rI6ziugmXcmP7HoKq767/fmZNaAMBdJDjrQVmE=;
        b=ArFCQwBY6YVKLWzXxaKXal0FrYcW8lOzoIjX7lTjoNBVG6eh4AcRODJEeF+EqPfbqM
         8GY7O7p/TeXfcR1rM4XnHMm6JrPkci35w5ybfADnIhOdE6dXywd3Fb+3LxdY0uSELSxw
         hFBUfAN0d715mQ2aoNB38EsDbZZAtpqVFyQT1pTLaENwHyLxk+d3zwmvHw7rFBnYpac3
         7i5DmIAkC+cuXosfrZ7uR9khuKl+Fh+Dt8RtQgSqtY6oOoMjR5Spj7IHXrlrSeZeFAyA
         d3zhVpxKLyaoYLr3rJWZUNtUosvgfDie9OO31knBtnZLxEYjeDCB50KJwR4fN4SX0fqi
         /gXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748102988; x=1748707788;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tb/w3rI6ziugmXcmP7HoKq767/fmZNaAMBdJDjrQVmE=;
        b=JkcpXb2ZXW6lRKJvsMmwEn+BzmK8Wer5ppzdolx/QFcZONHzp6SaCMtRRToxsCSZHI
         GnvUbrMVJ+aHED0c5No0AcNxGmazYceQdHK3lktP6VEaAg3cPBTs0icRWmW5tsaeRM3w
         AFGBa8VdrUmZHTyFkRxdOTbArtdrXMQ/t7nswtU73iAxetlzjOvYwrHO5i0+g9EcwWaX
         /CWLQMCELEjlescxnUk0/7G6r0F9LlyRno+qDpndzx7A63kRWvHnc+MfaENscskCN2dp
         i8LANYrLN8x9b4DB9Cgd9jiaGD/QFLH4pvGUcgTqMVhMa+LOtB5stx2gJkwKhepaYbTC
         j2xA==
X-Forwarded-Encrypted: i=1; AJvYcCWNJpQtGMsqH+801GBnYYwi30ZmhGA+IwHQ6j/hDsOItlxLwe5JhiIAgNfaP3tGrv6GahxigXQUAU4+6bny@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7I6whJy4UyO2oHsSmcFaY6JpUPyzsWhqwmkNMkXxOG5QHyata
	+CEUDkzz4Xe9irBFI9+j4RH1i3Zk+WCyC/LSakLA0LEppZOyqwku9KmO
X-Gm-Gg: ASbGnctzymQM0N5BYvsro1HhNHXzyY0wlRrbjrh8bqQ43nlyG2+JZb/6rXD745eeOYK
	NNqDouXq5M9kEBzlIC8qHyQ3HDHLDCFFPC9iBoiwRpsU2Y8rcjlZt8hlgavSekVkxmvG4OhdPND
	KlcJvI2iz2rBrlOiagEX0+oUFwOMnx3fPoIcmvdvXMa502fO70j4R0A+9TOoS1WSmriC5YRNttU
	V/SqpAZzbNQ2mE8zBJZONqY+1TK7WhZkFB/K8NJz2LN6jl2r/wmb2sCKSuOtVS60eqHyh3jV+9n
	E8FcusH6uGwGsah1BsEegSq8MVTkt9cjTarZ0o9pX20rZmse5cI0iTe3XW6Q+y+2N2rIbQN3pvc
	fN7GxrnAhY+uG5N6RDc28gArNoo9MWsSGtf/K2bDXpWCP0gpWy8l/iq5pzHw=
X-Google-Smtp-Source: AGHT+IFFCyCqcSoZYJ3lm3zpXv+H1YStSbGf2ED6N2LRYYO17ovSBaD4YnLRHxY9kZDW9zOWK0DwNg==
X-Received: by 2002:a05:6512:a8d:b0:551:db39:75c2 with SMTP id 2adb3069b0e04-5521c7a847dmr802226e87.4.1748102988075;
        Sat, 24 May 2025 09:09:48 -0700 (PDT)
Received: from Lappari.v6.elisa-laajakaista.fi (nzckegel0mtun0nsea8-1.v6.elisa-laajakaista.fi. [2001:99a:20b9:a000:aab0:f0be:4d4c:9e50])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f165c7sm4386195e87.32.2025.05.24.09.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 09:09:47 -0700 (PDT)
Date: Sat, 24 May 2025 19:09:46 +0300
From: Heikki Huttu <heissendo88@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: add missing includes
Message-ID: <aDHvSicbJpYBY-dn@Lappari.v6.elisa-laajakaista.fi>
References: <aCZDHXJTyfJRseho@Lappari.v6.elisa-laajakaista.fi>
 <2025052136-backstab-dork-de2d@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025052136-backstab-dork-de2d@gregkh>

Wed, May 21, 2025 at 01:43:24PM +0200, Greg KH kirjoitti:
> On Thu, May 15, 2025 at 10:40:13PM +0300, Heikki Huttu wrote:
> > Header files use u32, size_t, dma_addr_t, struct device, struct list_head.
> > Add direct includes to make the headers self-contained.
> > 
> > Signed-off-by: Heikki Huttu <heissendo88@gmail.com>
> > ---
> >  drivers/staging/vme_user/vme.h      | 5 +++++
> >  drivers/staging/vme_user/vme_user.h | 2 ++
> >  2 files changed, 7 insertions(+)
> > 
> > diff --git a/drivers/staging/vme_user/vme.h b/drivers/staging/vme_user/vme.h
> > index 7753e736f9fd..55499b240dc3 100644
> > --- a/drivers/staging/vme_user/vme.h
> > +++ b/drivers/staging/vme_user/vme.h
> > @@ -3,6 +3,11 @@
> >  #define _VME_H_
> >  
> >  #include <linux/bitops.h>
> > +#include <linux/types.h>
> > +#include <linux/device.h>
> > +#include <linux/list.h>
> > +#include <linux/mm.h>
> > +#include <linux/dma-mapping.h>
> 
> If you are going to add these, please do so in a sorted way.
> 
> But really, why is this needed at all?
> 
> >  
> >  /* Resource Type */
> >  enum vme_resource_type {
> > diff --git a/drivers/staging/vme_user/vme_user.h b/drivers/staging/vme_user/vme_user.h
> > index 19ecb05781cc..297b25fab164 100644
> > --- a/drivers/staging/vme_user/vme_user.h
> > +++ b/drivers/staging/vme_user/vme_user.h
> > @@ -2,6 +2,8 @@
> >  #ifndef _VME_USER_H_
> >  #define _VME_USER_H_
> >  
> > +#include <linux/types.h>
> 
> Same here, are you sure this is needed?
> 
> thanks,
> 
> greg k-h

Hi Greg,

Thank you for the feedback.

I was under the impression that it's generally preferred to use direct includes to make headers self-contained and avoid relying on transitive includes.  
If I was mistaken, apologies — feel free to disregard this.

Best regards,  
Heikki
