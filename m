Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CDE2F25;
	Thu, 16 Mar 2023 11:55:26 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id x13so6600735edd.1;
        Thu, 16 Mar 2023 04:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678967725;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=obgcXj/DJg2WhaGcvR0ghP06Pui2+uVQTrLvBZH+b4E=;
        b=pYOIG1unIu4vGsj5VkPtPl+Y4Z5YQQurw7iWw8BdsNaD9qG99c59NJUQLfh1jUxWI4
         4dYltVg8kWn/rfhheNJiE2+23czC7LyFCdU1jsL5YBbFS7LaDOj/VIUIal1rZbP0HTyj
         4BMFgVL7gz2ED+OXoax0DnKaIR6xOkWlCOwPTnyEov+wMVTkfBn9p4iEm3A//i+yVLPn
         dcaftlvKZGFwoX+lQNOwdJRibh9ZuaAfRIgnWvq03XZXYwoqJ/zVyGe/49sKV98cF0xp
         8DteN1dKmJDAWTMzE8nfPdi566+VDq4+2v3WPOfqKMxke9PEEZnEmS2HfNa3KVsI3MS5
         xQ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678967725;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=obgcXj/DJg2WhaGcvR0ghP06Pui2+uVQTrLvBZH+b4E=;
        b=8DHk3UkMDypv9W/jU/wPbpJG0KEblLxBPZr3QalSRWX3F8M0v51vaLGE9QX/T9Dvss
         k+hvkMJezNRKQdRP+XTqV0EAXLms31wh0jCZO/eF4sjbC0bOy8eZ/7xqVcePiFl6ATu6
         +slJ0nxD1liy19hUYfUOoriRe4IWzFgMNtU06aiMUAABpa1WipmcDUb+T4GHfr9O5Ynf
         EEIFaCpHgbLoOHqDN4RcgW+KjeaTNnYlfylGGNHNDEwxLzwJjGTyTK9BQNBeKl0+hTE7
         YtPqBpLX0WtSqM3uwezPFGp1BZIXxCwzq0Ly+mX75E+aPL1KGQ+pcvCK7wNBnQT+wNAo
         pYJQ==
X-Gm-Message-State: AO0yUKXIBj8hh5qnvPrVzPcfLXxfst3BbYY/OjVX3WpyefSgZoq6/9GY
	V9yl8RDTFxS1IHidaMMcjPg=
X-Google-Smtp-Source: AK7set+7OVYmujdt4eAkckYId+Q2zv4BouMjgpVb0wUw8HHthKoPZYGPWXfIfadj1ofMs0xM0JQsnw==
X-Received: by 2002:a17:906:70d1:b0:8e0:4baf:59d7 with SMTP id g17-20020a17090670d100b008e04baf59d7mr9864376ejk.31.1678967724875;
        Thu, 16 Mar 2023 04:55:24 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.209.88])
        by smtp.gmail.com with ESMTPSA id x20-20020a1709064a9400b0092b86d41dbasm3780850eju.114.2023.03.16.04.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 04:55:24 -0700 (PDT)
Date: Thu, 16 Mar 2023 16:55:21 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Alison Schofield <alison.schofield@intel.com>,
	outreachy@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: initialize timeouts in probe only
Message-ID: <ZBMDqXMWpjNzsf4p@khadija-virtual-machine>
References: <ZA9mThZ7NyRrQAMX@khadija-virtual-machine>
 <279821116.9N5E1g01tA@suse>
 <ZBLsoTBeKbuYbhCi@khadija-virtual-machine>
 <1902746.IobQ9Gjlxr@suse>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1902746.IobQ9Gjlxr@suse>

On Thu, Mar 16, 2023 at 12:39:31PM +0100, Fabio M. De Francesco wrote:
> Hi Khadija,
> 
> Sorry for being here so late.
> 
> I just saw also your other messages with further help requests.
> Please do other work while waiting for help on a specific issue. 
> 
> If I understand you correctly, you are saying that you can only build axis-
> fifo in-kernel because you cannot change the '*' to 'm'. Correct?
>

Yes, corect.

> If so, you have probably touched other configuration options in a way that 
> forces that driver to work only if compiled in-kernel). Therefore, I'd restart 
> from scratch.
> 
> Please delete your current .config and make a copy of the one from your 
> running kernel. Then check the three options Alison and I were talking about. 
>
> Remember that you cannot see the axis-fifo module entry (CONFIG_XIL_AXIS_FIFO) 
> in "Device Drivers" -> "Staging Drivers" section if you have not yet enabled  
> (either with 'm' or 'y') CONFIG_OF and CONFIG_HAS_IOMEM. 
> 
> Now you should end up with a visible CONFIG_XIL_AXIS_FIFO that can be enabled 
> as a module with 'm'. 
>

Hey Fabio!

I am on it. I have undertood the steps. I will let you know if this
works.

Also, with the help of Nathan's feedback I was able to reproduce the
warnings. I have changed the files to remove the warnings and it works. 

I will submit another [PATCH v5].

Thank you!
Regards,
Khadija Kamran

> Let me know if this procedure works.
> 
> Fabio
> 
> 
