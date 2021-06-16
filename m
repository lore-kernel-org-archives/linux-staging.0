Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983BF72
	for <linux-staging@lists.linux.dev>; Wed, 16 Jun 2021 16:56:43 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id nd37so5023818ejc.3
        for <linux-staging@lists.linux.dev>; Wed, 16 Jun 2021 09:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CDUWKMhDng5NBWGQ0iuMjqcvNRC2fdcuBx5BZPpTnHs=;
        b=VdFt53cWOxe/3XDbVYRmakE9EmrsXFMokamCiiY15CYCKtf4OZ0ItHDjSJ6uMtNsXp
         DK/7kYxbtSy1jHEfG9Toh8PiHWKzGLyOUsT4F0l3vKozRuIu/aXs/WmIRHGhMuMeZBDt
         074icNiwRKS26w0nOEKzihcaCTfvkTOY+wjP1e394d3fQogawwHu0tauf0XJG/vEo91R
         JZ4PHxprUrjnhCsw022zYZ7M+loop5NXjhHHk9Y5U4zj/OC2suhKXjxL7K7SLTYajgGd
         ysh/Ort/YJdViCCgvyzRN/dxQFnp3r5Ez/7YemD5j3pvMQ6rOsVz8KoEWvWt4uceO5dS
         136w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CDUWKMhDng5NBWGQ0iuMjqcvNRC2fdcuBx5BZPpTnHs=;
        b=hwMP3wv/mjxwePgam2WEdaFORzF5mhBV5f3q9FufXMPljNYtWBeoH+SIuepPwBRq+U
         +VsX+ZVAGCp7aKXJfRGw1mMcqEhfzBv5sMlB/5FM1RB2qJ10spmgj3cFOlgpVUGvjZX9
         2C9SPKObh7vHk7JpXYGMIqeF5rHW0NCuzJLQkxLrg9w5HQh+N7aYjkdlPHcVcyDsi1hz
         ZONuhUbRfZKLzxK0PUTJldGltvTRQOxVpTuRFXMeJfKL9Gy6GuEcugMxzmQLCzVfQPDT
         MIAs+Xzkh9O4PkBA58NLgLrmS77+qz2NQtnzeXZ0Ifm2Eax/Ag/qJGTttbgqt4ZMVZ8m
         dJEQ==
X-Gm-Message-State: AOAM532G5lF4SfdFJ87AEnkLu67kQ0kwHVh+FK8RlpA5PKgaagOk8fT6
	8/7VYKCdi00gw8aPRbPlvsg=
X-Google-Smtp-Source: ABdhPJzWQcE3F9VJ/gAUCFIYQHzJFiVfBo0ITH+0drszHNqZs2ESSkKAVXLXEDHtKXNB94LbaSEidA==
X-Received: by 2002:a17:906:6814:: with SMTP id k20mr455348ejr.455.1623862602139;
        Wed, 16 Jun 2021 09:56:42 -0700 (PDT)
Received: from linux.local (host-82-59-55-132.retail.telecomitalia.it. [82.59.55.132])
        by smtp.gmail.com with ESMTPSA id ci4sm1901102ejc.110.2021.06.16.09.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 09:56:41 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Kershner <david.kershner@unisys.com>, sparmaintainer@unisys.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, Daniel Vetter <daniel@ffwll.ch>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v8 RESEND] staging: unisys: visorhba: Convert module from IDR to XArray
Date: Wed, 16 Jun 2021 18:56:39 +0200
Message-ID: <3316425.tqDOt8T8LQ@linux.local>
In-Reply-To: <YMiT9+msL8H2+3yV@kroah.com>
References: <20210514081112.19542-1-fmdefrancesco@gmail.com> <YMiT9+msL8H2+3yV@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, June 15, 2021 1:50:15 PM CEST Greg Kroah-Hartman wrote:
> On Fri, May 14, 2021 at 10:11:11AM +0200, Fabio M. De Francesco wrote:
> > Converted visorhba from IDR to XArray. The abstract data type XArray is
> > more memory-efficient, parallelizable, and cache friendly. It takes
> > advantage of RCU to perform lookups without locking. Furthermore, IDR is
> > deprecated because XArray has a better (cleaner and more consistent)
> > API.
> > 
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> 
> Given a lack of response from the unisys maintainer, I'll go apply this
> now and see what breaks :)
>
Hi Greg,

I'm really grateful to you for having applied that patch notwithstanding the 
lack of response from Unisys. Understanding IDR, XArray, and the flow of the 
code, has been a hard task for a newcomer having only a month of experience to 
kernel development.

Thanks very much,

Fabio
> 
> thanks,
> 
> greg k-h




