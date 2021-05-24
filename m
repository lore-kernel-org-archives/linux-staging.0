Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CE917F
	for <linux-staging@lists.linux.dev>; Mon, 24 May 2021 16:06:19 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id b7so10681623plg.0
        for <linux-staging@lists.linux.dev>; Mon, 24 May 2021 09:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=amwVUky9MqlTVVhpmO6BWTN5J8sLtzk/G9RML5qrBlM=;
        b=YSqO1zrh9r3ssxfZ5btGlX5EebqEvZYA1/7HPV0pd1RN9mTjtx3cvQHDkmKTkXllOO
         S2DZ49h1DPgzYc036mn3xiUEBRQaVzxpIqc89wZlVbV+O1kWYgJtIIDr/JrTL3zEZQOO
         sSRd6M0XxDqnPikpENLdq72KhSCYk0WTClyIHzS0bM9cmDhVgaTUFT+KjsfMM/5M6tqt
         npMMIhfXsEc7U8lf7BQ0Q8/4EdjGSCfHiZRyLE5MPOkROTrDNkOFvrXZPxN/0pEhzHRn
         joiA0PnE1YcGB6OVcgGXocZ7zA/fItq8qmBPQUBai7Twyhw116NpS6pMds3TDYrdk/RA
         YVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=amwVUky9MqlTVVhpmO6BWTN5J8sLtzk/G9RML5qrBlM=;
        b=G7xHTa36nQpXrQLwZEoUJuN+zDAjT844S7VXVWyK0lNQXEwqNYNNbDRkQrfbPypOPF
         JvBHXX8Pu0iUQNn6uiEizYJ/EI8e8mjz++zQ3m7kRe9+vccSz0IBtx28nBmMI12JqpG/
         Q+oQgTIu+62JpAIEnHtDziMf/OamnR2wwxIB3tEYQedYh9idmMeaxefHpLtdAeHbML2L
         VgCxVGF+kspmoDx/iL0plcREtUQ8o6UhppbaOlBOBjdyJw3KH9jbecVnk6zxWQ4A+5gq
         ihKzu/CUxpj3lLTV77ISx4al8ZaKAn8JvSg0k07P9dRn154E4VYxLXGP+c7m5q3q98lj
         3qNA==
X-Gm-Message-State: AOAM533PBXGQUCWckxV5mMN8EGcEtJgEmacQMqFambM+ExuZWmnFhrj/
	oF+hQiTML+a9sbsD7nhzm9w=
X-Google-Smtp-Source: ABdhPJzrT+5T6O9m5eJqE5epnPoKQVE1ASyJ5OZOk1du9p7jnyFRO3alH3Q3ykBZTRcbnOtLrUdBRw==
X-Received: by 2002:a17:90b:1d8f:: with SMTP id pf15mr25904975pjb.164.1621872379379;
        Mon, 24 May 2021 09:06:19 -0700 (PDT)
Received: from fedora ([49.36.218.98])
        by smtp.gmail.com with ESMTPSA id o7sm12536760pgs.45.2021.05.24.09.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 09:06:18 -0700 (PDT)
Date: Mon, 24 May 2021 21:36:13 +0530
From: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, fabioaiuto83@gmail.com,
	ross.schm.dev@gmail.com, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@bger.kernel.org
Subject: Re: [PATCH 1/2] [RFC] staging: rtl8723bs: refactor to reduce indents
Message-ID: <YKvO9U9q7nHS6TCc@fedora>
References: <20210522091719.64277-1-chouhan.shreyansh630@gmail.com>
 <20210522091719.64277-2-chouhan.shreyansh630@gmail.com>
 <20210524090557.GM1955@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210524090557.GM1955@kadam>

On Mon, May 24, 2021 at 12:05:58PM +0300, Dan Carpenter wrote:
> 
> Using swap() is the correct thing to do, but send that change as a
> separate patch.
> 
> Don't send RFC patches, just send normal patches.  No need for comments.
> 

I have resent the patches. I will keep it in mind for the future.

Thanks,
--Shreyansh Chouhan

> 
> regards,
> dan carpenter
> 
