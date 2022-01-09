Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DDB2C80
	for <linux-staging@lists.linux.dev>; Sun,  9 Jan 2022 19:05:58 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id e17so868671pgg.6
        for <linux-staging@lists.linux.dev>; Sun, 09 Jan 2022 11:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BQ4h91QqsPHm6HjZOcUGZRO8VEa/eScc4Z91WrPb7XI=;
        b=U6gVy720BSs9zO0CrU6qSvI7hrI9jAgUbfPCaMx80LUgYmVUB18PIT9thL9Dg4Yn+O
         umdgL6PwcmgVO1uX5dmQEOm9n1XMbLrZlJnNeA54LlkoUuGeRhfHuS3K4D6j5CITxW+H
         RMMW+095t9Movo9GVvPAky+IeO3nU34ZQqMrUmxFGx03EE7Ku+LOZybpB+J6pCbkuagp
         0opPV+VMlYs3pLZdgkOwwbB5XBgvMDBNV5ls+aiSKSlOX5UyfX1V6YCXSSo3zKAE5LEy
         +yESHq7pohNhqVuUtJcpcgE8ZY85J2GsifYyF5eqOMeXj8GPa1s/L91JLvEV/0QO+MwE
         BErg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BQ4h91QqsPHm6HjZOcUGZRO8VEa/eScc4Z91WrPb7XI=;
        b=n3HAZUlu3blTvY1jliY2n1bzsrFY8eLjMLjjeyUuy4FM3hDeUVpQ+YRmHyPqzIUO+F
         wO5v/Fh1A8xvv/0zlXXLU7QPOhAfnYW6cVOHTQjcv/k4umsrKUFyNpnLdka/qRV9n1kY
         nKeXwFtycc4PKWJaETCMfTaGSzCUrd8yEcS1UOZ0XMX7TSNJhcHMAOvWI8hwuYk8Sk7+
         MifvVaw+dKSOrOVpZ74sJE/kZ+RPPF9HgcvXNlMzYU1u6kJXt90C1/4yOjs2g23w1frd
         TCx/xMe3klXtsuWgF5Wr52CDLLBFB7sIdj2XpXhq9jbHfYfDFg0fRmW6guB/PGWtpk4l
         S8SQ==
X-Gm-Message-State: AOAM530Lqex/umWbt2wl+dnkf4jZqKlNgoGas7nmSte4f/eE1pw+Fp3a
	YrohANjsjEd2wPbcLPyRARQ=
X-Google-Smtp-Source: ABdhPJycVV5XiVesKcyfg7S5laH9Rf8gj0gL2w4EiphtUBuCuCmlpnARu9Q8HMynTqOCE0ezmeiWcQ==
X-Received: by 2002:a05:6a00:b90:b0:4ba:c269:eb07 with SMTP id g16-20020a056a000b9000b004bac269eb07mr72971333pfj.71.1641755158166;
        Sun, 09 Jan 2022 11:05:58 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id p186sm4245463pfp.128.2022.01.09.11.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 11:05:57 -0800 (PST)
Date: Mon, 10 Jan 2022 08:05:52 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Sidong Yang <realwakka@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: pi433: enforce tx_cfg to be set before any
 message can be sent
Message-ID: <20220109190552.GA2928@mail.google.com>
References: <20220108222652.GA11883@mail.google.com>
 <20220109154950.GA27767@realwakka>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220109154950.GA27767@realwakka>

On Sun, Jan 09, 2022 at 03:49:50PM +0000, Sidong Yang wrote:
> On Sun, Jan 09, 2022 at 11:26:52AM +1300, Paulo Miguel Almeida wrote:
> 
> Hi, Paulo.
> Thanks for the patch.
> I have some opinion below.

thanks for taking the time to review my patch :)

> > this driver relies on exposing a char device to userspace to tx
> > messages. Every message can be sent using different trasmitter settings
> > such so the tx_cfg must be written before sending any messages.
> > Failing to do so will cause the message to fail silently depending on
> > printk/dynamic_debug settings which makes it hard to troubleshoot.
> > 
> > This patch add a control variable that will get initialized once tx_cfg
> > is set for the fd used when interacting with the char device.
> 
> I don't know that adding flag is good idea. It seems that initializing
> to default is better than this.

the reasons why I thought that the flag was a good approach is because of
these points:

1 - it returns an error to userspace to help the developers 
troubleshooting what is missing/required to make a message to be
successfully tx'ed. Unfortunately, once the message is in the chip
queue, there isn't much that the user can know so, from my humble point
of view, any way we can avoid hard-to-debug problems, we should.

2 - rf69 work with multiple frequencies (315,433,868 and 915MHz) in which
acceptance varies from region to region. Essentially, picking 1 default
frequency may be ideal for one place but not right for another.

Let me know if you agree with my train of thought above and if not,
share with me your point of view.

thanks,

Paulo A.

