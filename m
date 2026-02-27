Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7079B284B3B
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 09:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772182989; cv=none; b=oT2UlSQpfyqjMNL5wH5pKEAg2repbEQqwlMGDB/2PiYGWY9AS2xuBEcyLuCp+MR+nBgG5EWw23Yql15HF2R9yA6YEnKO2Ns/z9fplAK1IIjCC9dazxmaUrsANWCHl27KR/leuxgMmzlTYlWeUhleZyUU5FXGhl3McPUt0Lmaif4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772182989; c=relaxed/simple;
	bh=/rdJVoGRmXCk0Y9KPBj+F9umll76N+hl7u2yJyEUBnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K/m1R5wid8/mXk2eExIju+o8KhH8gXIfyRtc2EHxtsb0YfqqhrK1PsgidAAqQQGetxptp1SZB+dVLsCMLPv1S/r579fqxXbPsWyCYikEATox5y6KldH4nTK/W54quG7FYTDY1Ymi4Yp+XAVwidwAEZf8cTM7e/are8xdIMN5Q8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T0sWVnIR; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T0sWVnIR"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4833115090dso17932245e9.3
        for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 01:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772182987; x=1772787787; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LK3kLvJU/BNP7pb7k7IBNvzbVws1LlhpsC95zzr3Y4E=;
        b=T0sWVnIRRspaPiOLFm9z/mC6n9WHlr1D2vqUZ5VdBdMPJlmSa4XBel0W4ut2VEpiVk
         BX1PnNkoWGqbx4ZkwTGzHrYHInhfk49PC7ATj2Vy/w33MAteC3txzwBTkwD8qR9DzmmG
         vX1n4/0cDFUknGL8ACJl1N+SX2zNy9mDs4tULd2NKy+hTiTlvg50qnIynRjtIu6cqt6N
         ohv5cnZMv5mN+2vgu+9K5VtgJEjDJTsA4AZvI758/EyFlCF59fccpKkvnDfnB+kueNXe
         LnHrijfQD51rgA+QslGFPCvOAX8T4aXXx0AKFDQZ4EV86tHkgq07sfMXvaFqyM7dGB1b
         OUhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772182987; x=1772787787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LK3kLvJU/BNP7pb7k7IBNvzbVws1LlhpsC95zzr3Y4E=;
        b=Hg/zgx3KTvZykWBPUWZeGRGSLGYP3dQKmFXKmT6CXTVoPhLbpcZgdl081uLdB0xC7I
         itO1y4VLlvI+ulttpd6BSIDdn80/DOdeStaLNeUWOBe/3hAGS1O+QfjosudV30H/z7Ql
         ut5PMiOZUvJS0mOwFWqQhb25On/II8FE155wilQWm3jUFkRpNWt8DksafYioKWPNJv4f
         StwHmamL1krtcJjGGZAjb1TJgIviisiMjtaFvFvwAcVB2rrZYvTLFgfKVYp4UX/8xfhV
         ZmUyiRuCvh7AwL3JYrPzlDmnQM1+4k/4kMJBOJS7hvVI1CmxnuAtBZyc8xgErlEIsAPT
         b+lQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvcb+bar7VK7d+gsgawLB7easv3VCOkwdehdDRCvi2SFwbmOfNPlWIG7y0fSp8cFTG9ZQUzeYPoN5v31jM@lists.linux.dev
X-Gm-Message-State: AOJu0YyLVVvkId6Q958DieIBax0odo3M6YGamiYuPYWtN2NAiJXg2sDz
	+i/QJaY3KFLwAnUZm2KzJEIjYKYXJ1ohRsA45nsfTUcBSvc6aN07/KAoNaD+Rf9/SIA=
X-Gm-Gg: ATEYQzxFl9/0335tRyVHJ5ZSdkgg6TrBmD1A/OCymKsBbDq6/9yETTCvErMaBysed/v
	gPP3nPJaLmI0r3HcLV7TqYhKlXabJMvP0voNOq225zdsp7XKZlLhwPwTzmXk7GWCiMVdZjnLFm6
	EwfBhntB651W6ZVNSEcarYirBsiZhksZD527hDa5niQLBdlkVEkKbh5gDAI1ajnonRycyhVA6a6
	WdIjlTcWmcUspvOq+dRyE5GMGsRrEk9pxRu9wHrLQOLD3xLs4DsYqdXSUhsy4KVvT1wrrHQjC+c
	g6hOUEkPjZDOgJ0jYcWFn1Lef71NaYn11z7W64PEP3lxGlMjyjdsGF08BibeWcIjWtt5BdjP+Wt
	b08b4VQ0gq0ri380EnfqJr/eTLMI9Ws3ICNbjYNXdbdPeq1QcpQOrC5z2jcyLn0z8p+oFSVzaxd
	/lxBMp2eaaM4ZGASq68TwjlKv7kyzl
X-Received: by 2002:a05:600c:3512:b0:480:7162:fa48 with SMTP id 5b1f17b1804b1-483c9bb1fcfmr29700645e9.13.1772182986616;
        Fri, 27 Feb 2026 01:03:06 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b3d24dsm80363625e9.5.2026.02.27.01.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 01:03:06 -0800 (PST)
Date: Fri, 27 Feb 2026 12:03:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: gregkh@linuxfoundation.org, dtwlin@gmail.com, johan@kernel.org,
	elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: greybus: uart: add descriptive lock comments
Message-ID: <aaFdxqxEUzZFVIqQ@stanley.mountain>
References: <aZ_9V7cldGzWNDrb@stanley.mountain>
 <20260227065220.8039-1-chakrabortyshubham66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227065220.8039-1-chakrabortyshubham66@gmail.com>

On Fri, Feb 27, 2026 at 12:22:20PM +0530, Shubham Chakraborty wrote:
> Replace vague lock comments with specific descriptions of
> what data each lock protects:
> - read_lock: protects iocount and oldcount
> - write_lock: protects write_fifo and credits
> - mutex: protects disconnected state
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---

When you're writing a v2 patch, you should first start from a fresh
kernel tree.  This v2 assumes that we applied the v1 patch.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

>  drivers/staging/greybus/uart.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
> index fe554eba555a..1e51818e34a8 100644
> --- a/drivers/staging/greybus/uart.c
> +++ b/drivers/staging/greybus/uart.c
> @@ -50,12 +50,12 @@ struct gb_tty {
>  	unsigned int minor;
>  	unsigned char clocal;
>  	bool disconnected;
> -	spinlock_t read_lock;		/* protects read operations */
> -	spinlock_t write_lock;		/* protects write operations */
> +	spinlock_t read_lock;		/* protects iocount and oldcount */
> +	spinlock_t write_lock;		/* protects write_fifo and credits */
>  	struct async_icount iocount;
>  	struct async_icount oldcount;
>  	wait_queue_head_t wioctl;
> -	struct mutex mutex;		/* serializes port operations */
> +	struct mutex mutex;		/* protects disconnected state */
>  	u8 ctrlin;	/* input control lines */


To be honest, I'm likely never going to be happy with a four word
explanation of what these locks do...  Probably a paragraph would be
better.

Don't just think about it so narrowly...  For example, does the name
read_lock make sense?  What does the word "read" have anything to do
with "iocount and oldcount"?

Why do we need two separate locks for read and write?  I understand
how write means write_fifo but why do "write_fifo and credits" go
together?  If write_lock protects credits, then why are there several
places where we access gb_tty->credits without taking the lock?

Then as you go along, you're going to notice weird things.  For
example, in set_serial_info() it allows non-admin uses to set the
close_delay and closing_wait to the existing values.  What is the
point of that?  Do other .set_serial() functions allow that?  I
haven't looked, so maybe there is a good reason!  But when you
look at this code with an open mind then you'll find all kinds of
questions like that.

What does protect really mean?  What would happen if we removed
the locking?  Is the locking even correct?  If read_lock "protects
iocount" then why do we not take it in gb_tty_get_icount()?

The locking around disconnect probably is meant to prevent a use after
free.  What are all the variables we allocate and how do we free them?
Does the disconnect process work?  Go through the probe make a list
of allocations.  When is the earliest we can call disconnect?  What
if we set ->disconnected = true but we haven't called
gb_connection_disable_rx() so we're still receiving packets?  I haven't
looked at it so I don't know!

regards,
dan carpenter
