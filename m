Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A453D168
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 22:28:17 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id w24so25739901ply.12
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 14:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=scLme1me/0UxlFwtDPAEkrpt4SJIwSBGjImUO7Hvan8=;
        b=F89F64Oh0gYb1DYapXQNgjUITveKUu0OV6oM4B/4RDoodqY2nAR+EexPKklhohGfAx
         W3tb/mGgwIQU7U3x9oU5bozXzZfbYqmuseRyu8xVvoOOg44r19Z/H0EM3ylxBT91pWLn
         lNeHlm4f9ZEzePdt5aBjW1TM2MWM0p+mDJXonaWgwrep8nsatqChgyLSRtUQMtK0IqLY
         wdxjEhj7kjQf8/teJNE98QVxSZW9FWR9ek3v0djD/VzaYw4hvETTkfwe9CbUWRx584x3
         KyKtMwHHYntNDgG8tm0A9ElPTAiggQo1WmjG/vpYYISbRG6VIwbDN+uVvUKlMEZOWSe0
         jZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=scLme1me/0UxlFwtDPAEkrpt4SJIwSBGjImUO7Hvan8=;
        b=s10d/rpXNArUPUgojWCc+XUY3EDf9p/o9rFCFj26OLoqBt41VXd18Lx4/01LhWrUH4
         KhaVM+Gx4CopfsqJvg8Zo5X8VTMa3O5HLDXne1YlB7nq8dQD3lyhLgyBu7HiGMiatu6a
         26dgk7GpdHFwqoQp1jmwwq8EgPBO+9WHtOWxH+NLQmb1dDeLCfzvdoXI5yIIg6UHMT7F
         9oRxMh09yrz2Q5nP1bejP6KI8GeFDAUTFZ+21hD0Ws4CfT2N+QVRZEFLZOkyHwFIeyA6
         R5DBWk6mQt8Jfs+DwNkoszSAQlyyc8zEkso+in/qTbvq/v/3swg9n9yKcwe4ThrrXt63
         n9JA==
X-Gm-Message-State: AOAM532yln5qcRofnZpMU9tfgpHyrAMY5wNM4WntDx9h9oIQLtzLdZZy
	xgRXTOo3QGEz5HFzOJI5L+A=
X-Google-Smtp-Source: ABdhPJw5Eh9ze8vem7JU3X38Brouv0NzrOiB7e98/fWKYp9QBYY6dQ6jHK+N3CtndO/3A82N0A5Azw==
X-Received: by 2002:a17:903:228f:b0:148:d5d0:5be0 with SMTP id b15-20020a170903228f00b00148d5d05be0mr47419628plh.104.1641248897119;
        Mon, 03 Jan 2022 14:28:17 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id b65sm38452265pfg.209.2022.01.03.14.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 14:28:16 -0800 (PST)
Date: Tue, 4 Jan 2022 11:28:11 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>, fabioaiuto83@gmail.com
Cc: realwakka@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: pi433: fix frequency deviation check
Message-ID: <20220103222811.GA6995@mail.google.com>
References: <20220103081135.GA11642@mail.google.com>
 <YdL5rtWw2PTXdsRM@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YdL5rtWw2PTXdsRM@kroah.com>

On Mon, Jan 03, 2022 at 02:27:10PM +0100, Greg KH wrote:
> On Mon, Jan 03, 2022 at 09:11:35PM +1300, Paulo Miguel Almeida wrote:
> > -	// calculat f step
> > +	// calculate f step
> 
> This change should be a separate patch.
>

Thanks Fabio and Greg for reviewing my patch. I just sent a v2 of this
patch with that line untouched.

thanks,

Paulo A.
