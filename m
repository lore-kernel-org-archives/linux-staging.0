Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFEB7B
	for <linux-staging@lists.linux.dev>; Sat, 11 Mar 2023 04:34:31 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id j2so6821269wrh.9
        for <linux-staging@lists.linux.dev>; Fri, 10 Mar 2023 20:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678509270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dOcaj2VgQgUfN6zBtbhzdtrOPUOvgaYMHqMxs0tI/I0=;
        b=NpbjceENrwn9DTlnwg+sdU0u3g+3ZIjU4++tFCqXCv9Sik0pK/gvM8trRb6XyGOJpj
         7uPFrZQ4f3SCa6roJirMILFNq9CcU2lS4E/3wg5QGn56fKEjPepPX9mFlcCxH7rJUPnk
         99NOmqHH6n/cracFd4/39H3/cofXsu6LQ8qYltYLSX465qaxabwLYKf1EZtZodFs1ys9
         QVgS85/mlk4xT2P/y7h3z8eYpY2Qh/z6BtoO0yj9qaeuesY/X8CWsQcVnQrnCdXf8jbY
         jvNkMPG6+AR0tXZ3ATCnkMpUm4K/ZXSJmT+sDcY3NvNb/8SYmswg6B4ysT3n62KE7t0S
         AO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678509270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOcaj2VgQgUfN6zBtbhzdtrOPUOvgaYMHqMxs0tI/I0=;
        b=OVynD8sQM/RztX230Tb8UXor5K0QslXc0c2ilMG6AKpWDFJCwkPM5GDuz888I78g5m
         cfH44w7MFQpDil/Ye/2YzFe8oSBBaeYrU6+379BqlS9peuFCNCbL0JBIUYMptgPe3rFN
         qNqGtcUGTBjBd0KQhx2Pa9MzwBGeglT7/sNZxV8Mbr37VIkncgLsoS2eSGqo9SR0GjfY
         d8iNz7msRUA+STTrUO1EWHBMHZVH3zI9dnR7wNw2+mktVFSrNveoirFW7mpbBBS++tr7
         WNSkdA2vVW4QudhTT+C29oTkNY01WWxS+WWjivfuVThgIDry6yJIB/XDXa4VEGO8VZIt
         NiCg==
X-Gm-Message-State: AO0yUKUC6cU4dq34qF0nvXv8bLLzB+k0eytBmGZ7Bv8Xt2ftD2fpedsj
	rJxB1a7pe3aYysFhORZz2hc=
X-Google-Smtp-Source: AK7set+wTMHlCrHHPZ8bqyJ8xVk6w6RKq8Z1T30ImLl1acNcF1PCeLG/bXzqucha6xAuGpVAnsk7+A==
X-Received: by 2002:adf:db05:0:b0:2c5:5ee9:6b27 with SMTP id s5-20020adfdb05000000b002c55ee96b27mr3283631wri.13.1678509269828;
        Fri, 10 Mar 2023 20:34:29 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h16-20020adffd50000000b002c56af32e8csm1342913wrs.35.2023.03.10.20.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 20:34:29 -0800 (PST)
Date: Sat, 11 Mar 2023 07:34:25 +0300
From: Dan Carpenter <error27@gmail.com>
To: Archana <craechal@gmail.com>
Cc: drv@mailo.com, linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH 2/2] staging: wlan-ng: remove else statement
Message-ID: <a4096cdc-97d1-4265-8ce4-b8021ecf5933@kili.mountain>
References: <20230310205917.2161-1-craechal@gmail.com>
 <20230310205917.2161-2-craechal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310205917.2161-2-craechal@gmail.com>

On Fri, Mar 10, 2023 at 08:59:17PM +0000, Archana wrote:
> else block is not needed if j is set to -1
> before if block
> 
> Signed-off-by: Archana <craechal@gmail.com>
> ---

Is Archana your full legal name that you would write on a legal document?

I feel like the patch is nice and I like that it's based on reading the
code instead of checkpatch.  The commit message isn't great.  Here is my
suggestion on that:

Subject: [PATCH 2/2] staging: wlan-ng: small clean up in plugimage()

It's cleaner to set "j = -1;" before the if block and remove the else
statement.

The main differences are:
1: It says that the motivation for the patch is a clean up.
2: Capital letter at the start of the sentence.
3: Period at the end.

I try not to be too picky about commit messages but the issue with your
legal name is important so you were going to have to resend anyway.
Also everyone can use capital letters and periods even if English is not
their first language.  We could figure out the motivation for the patch
easily enough but we like to be extra strict with new people so they
develop good habbits.

regards,
dan carpenter
