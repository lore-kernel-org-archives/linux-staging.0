Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06F813FE7
	for <linux-staging@lists.linux.dev>; Tue,  5 Mar 2024 17:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709658364; cv=none; b=FFcCJAGYhLPQDfqt7+Jg+X1DAJxKgIpEOPhqz1soOKY3UqquM7kDde51yn0JHBau8qSHmhQvDj5KlseS8IKygBpKgpTtlVVffCI8PvlLyBVZrRDIMHnh/j5iPsEJ0XliWkXthHMlPiBstnCbFoI3zsj5bkcmVZoVdG/JGFg6Uwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709658364; c=relaxed/simple;
	bh=9hB7kebOY+ApV7hOhqdHnmKf9HqXW88QoEAtE22lPyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eExEV4uthUWe/MfH0pEhN0wxynlFvQntiDehO9bVXzAcV7xpcVSmYCdyOrPDX39NntUkP1b16xsjFWs47f/uYeFqWsP9fHwvTD72XA0St57SZ36bXViUdx4FCOmadyPCxCbJpBm4k8CfguzufMoYlhskdopsO6QipH+iMUAi5Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7yTCBym; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7yTCBym"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5131bec457eso5117667e87.0
        for <linux-staging@lists.linux.dev>; Tue, 05 Mar 2024 09:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709658361; x=1710263161; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Vv0jpxd/xF2263SdlkZJNOdtU51Ivq7MydTX7x7qB4=;
        b=i7yTCBymt6X24/TBe6kQB01VqDUmGAcCULZRVAagNen7XuLxbEibzEdWi4TgOOon4Z
         Jyu/xIe7XjnebMTqO6MHMGhclQsKN63KHtyVLIqdxZsbqTwkaIqKtx/HBm5bqfM6Irq9
         xehJs6PLXlQBbuD8pXN8+QLZak9Zt/pHnzEDfbnLgR6ba87LIBd/peGjgKV2yMBP+kxk
         9sUR2q/2/xWRsrcGDeYAYj8i6VeTJZgFzUTWoSsoiQPCWU3Iw/BGxOua4qQG2HhMv0MN
         B3uPx0m5pnzqVT7X4U4g//Opq6SQAuYf2OfQbndrR/vXwqKh4H/mxRxm2bcDSeC3nGB7
         /BWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709658361; x=1710263161;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Vv0jpxd/xF2263SdlkZJNOdtU51Ivq7MydTX7x7qB4=;
        b=S0cCu/SvT+CwLvT1awsEibFrYCkKkZ9QXDRqgAyC6V6Di9FIJ9G3iDQTEpi0Sxxcnz
         blmsteQPA6M7StL0jrzlQR0vcknwswV2jTvAw8g12Evrc3MGuVI+/XqprN7AXSuCqMJ+
         Vzmb2tBsMgsf++1dwLSyzSkvU+ZYeyMyD7Oj7HCgeMeSkwshoCZACI2WeK2y5WDuSeek
         V4gXdKApkdieD4BHGVsYbru25sg14EPnXJF1ohQtjKyqBKGTV+PW+c1E4SJUEZX9Muxt
         j+2v7DFkIbibyK75rQCK1ooUmWN3bqoWsNJoaBUOh85IidPDp5sJnHIppB16PihfME3V
         QjWw==
X-Forwarded-Encrypted: i=1; AJvYcCWxFx4y3CS7EdcPEN1jF2wOZlKH8WwWfKkREtT24Mjj91T28nDG0jY2OueUpfcwEUH1p367iSidMn5wK3vemHeVPIi60kmX6hECTf3C6A==
X-Gm-Message-State: AOJu0YyOKiJrqwViXBIO2Xhy6MmHhrTXO1VujxSXCJDE+w47fGRAY/8v
	l9dDBgzJBPEl0jeVvfyTaTBFlh/bY45HOrUzVqqx22bloAwyASqZ
X-Google-Smtp-Source: AGHT+IHBMwrDwxHyDONoPE8x+wLL5t36iq8HBi84FUfUY3f0bljsiU3xqW/J7kEHl4UnH8xUkv5Y4A==
X-Received: by 2002:a19:ad08:0:b0:513:486a:579b with SMTP id t8-20020a19ad08000000b00513486a579bmr910603lfc.0.1709658360569;
        Tue, 05 Mar 2024 09:06:00 -0800 (PST)
Received: from HP-ENVY-Notebook (c83-255-0-123.bredband.tele2.se. [83.255.0.123])
        by smtp.gmail.com with ESMTPSA id y17-20020a197511000000b005131cefefd8sm2238050lfe.240.2024.03.05.09.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 09:06:00 -0800 (PST)
Date: Tue, 5 Mar 2024 18:05:58 +0100
From: Jonathan Bergh <bergh.jonathan@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/2] staging: vme_user: Add a newline after variable
 declarations
Message-ID: <ZedQ9kyNwY+j7Umr@HP-ENVY-Notebook>
References: <20240303100547.153636-1-bergh.jonathan@gmail.com>
 <20240303100547.153636-2-bergh.jonathan@gmail.com>
 <2024030549-sanding-finisher-dc6a@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024030549-sanding-finisher-dc6a@gregkh>

On Tue, Mar 05, 2024 at 02:13:23PM +0000, Greg KH wrote:
> On Sun, Mar 03, 2024 at 11:05:47AM +0100, Jonathan Bergh wrote:
> > This patch makes the following change:
> >  * Adds a newline after the variable declarations as per checkpatch's
> >    warning
> > 
> > Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>
> > ---
> >  drivers/staging/vme_user/vme_tsi148.h | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/staging/vme_user/vme_tsi148.h b/drivers/staging/vme_user/vme_tsi148.h
> > index 2a92497c5570..a1b8288b101a 100644
> > --- a/drivers/staging/vme_user/vme_tsi148.h
> > +++ b/drivers/staging/vme_user/vme_tsi148.h
> > @@ -34,6 +34,7 @@ struct tsi148_driver {
> >  	void __iomem *base;	/* Base Address of device registers */
> >  	wait_queue_head_t dma_queue[2];
> >  	wait_queue_head_t iack_queue;
> > +
> >  	void (*lm_callback[4])(void *);	/* Called in interrupt handler */
> >  	void *lm_data[4];
> >  	void *crcsr_kernel;
> 
> Please always look at the change to see if checkpatch is correct or not
> (hint, for this one, it is not.)  Also see the archives for many people
> who have done the same thing in the past :)

Got it, thanks for that. 

> 
> thanks,
> 
> greg k-h
