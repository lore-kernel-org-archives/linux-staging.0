Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291D7A53
	for <linux-staging@lists.linux.dev>; Sat, 26 Aug 2023 21:13:11 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-41095b84d8eso12675521cf.2
        for <linux-staging@lists.linux.dev>; Sat, 26 Aug 2023 14:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693084391; x=1693689191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dxBlAav8Zz0D9zczblfMAjObARWz8Ttnug16VaVeiRU=;
        b=XOmLr57DehjSWK7Sr0d2wM6Cee6pCSp+K7erAfF0eQBAi4YNvsRd733NxZ2qpaaNvL
         0OTMHKGm5Yw1iyZ1mQSrLARbo37zTmZbHx16VNjVbx7SdKNdEOlKsKvPGpff/SFU2NRx
         8HThL149YEvqIm0iEusUg1dwcSj+WvYA7fEGNlsJIdBCflxhEa4tUfe9UQxxnI5EWVaM
         Qs5JxvGqzWwmjwyEk5HWudh7IDvOvD9n6hRVv60qjFnOfu5Kbm+/Foy57TsJzps7Ti3r
         BGngRxzQK0oApP5idiBCDfQpFxGNnZe0ajEdNK063mZjcJc4wtkneCl8HZN84CEPno1t
         KcDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693084391; x=1693689191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxBlAav8Zz0D9zczblfMAjObARWz8Ttnug16VaVeiRU=;
        b=DRaf4zbFpHsFrebEbTHDUiYGxvpeeHpLzOD8XVH7/jJdxCeouvo+su+WAWdtexRHoq
         r6TddX20o72Jg6wv2Js3mp1mg5hvn46/OCG7mZbxnVqLxvr3XuEDibbK5Hzj9GG2qdjl
         z1vvu1I2mzjFvlRxDvJN/NHOyrvUjIV/B3RVnXErqVjFvLnPr4Duaibprx09HSaMJgQx
         j7RWWAs2I52TSBjdKzw7TWWYLT8dLDcpI5VU5P1QAFGr8bxy7WuB0bhj7l5SnmL17e8x
         DCYtL86Zh+zhwPgOdb/aQU/NkehpkYXdQJP0iZO1GzsW5edIfn2HJ6HUvsJeE5l64vx1
         JX6g==
X-Gm-Message-State: AOJu0Yy/MQ1XuzLt5W27CAp5zHNPu8eSlZ8/mAFjPdvA2KM/WBp9XYaQ
	bnumQ5uYkh1Lv+xjWC1c8RsGPv+5ZCg=
X-Google-Smtp-Source: AGHT+IHSSHE+Vdi69ofKRVlQLK/u/lkgZQMr+2PtfVW1S+KbGlJ1oOZ4Q95Vmz6W4SORvm/aEDw3Ag==
X-Received: by 2002:a05:622a:1c1:b0:403:971a:44ab with SMTP id t1-20020a05622a01c100b00403971a44abmr27156550qtw.58.1693084390742;
        Sat, 26 Aug 2023 14:13:10 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:82ea:8c7c:b784:3f92:988a])
        by smtp.gmail.com with ESMTPSA id s14-20020ac85ece000000b00410a9dd3d88sm1312553qtx.68.2023.08.26.14.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 14:13:10 -0700 (PDT)
Date: Sat, 26 Aug 2023 18:13:06 -0300
From: Alexon Oliveira <alexondunkan@gmail.com>
To: Nam Cao <namcaov@gmail.com>
Cc: gregkh@linuxfoundation.org, martyn@welchs.me.uk,
	manohar.vanga@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 1/4] staging: vme_user: fix check alignment of open
 parenthesis in vme_fake.c
Message-ID: <ZOpq4t22iRXewekD@alolivei-thinkpadt480s.gru.csb>
References: <ZOoWgZ7ZnGyWHUKe@alolivei-thinkpadt480s.gru.csb>
 <ZOpWxBjONs0QpFlU@nam-dell>
 <ZOpfUjRy3jDwZixX@alolivei-thinkpadt480s.gru.csb>
 <ZOphYXeTMM+QhnTk@nam-dell>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZOphYXeTMM+QhnTk@nam-dell>

On Sat, Aug 26, 2023 at 10:32:33PM +0200, Nam Cao wrote:
> On Sat, Aug 26, 2023 at 05:23:46PM -0300, Alexon Oliveira wrote:
> > On Sat, Aug 26, 2023 at 09:47:16PM +0200, Nam Cao wrote:
> > > On Sat, Aug 26, 2023 at 12:13:05PM -0300, Alexon Oliveira wrote:
> > > > Fixed all CHECK: Alignment should match open parenthesis
> > > > as reported by checkpatch to adhere to the Linux kernel
> > > > coding-style guidelines.
> > > > 
> > > > Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>
> > > 
> > > Patch series should be in a single email thread. But your 4 patches are sent
> > > separately :(
> > >
> > 
> > Hmm, ACK, I didn't know that.
> > 
> > > Have a look at how your patches are sent on https://lore.kernel.org/linux-staging/
> > > and you will see what I am referring to.
> > > 
> > 
> > Indeed they were sent as separate emails.
> > 
> > > Here's an example of how patch series should be:
> > > https://lore.kernel.org/linux-staging/736c8159-90e9-4575-3c22-5a62515d5c03@gmail.com/T/#t
> > >
> > 
> > Please, if you don't mind me to ask, how's the best way to do that?
> > I've already wrote the cover letter, generated the patches' files again,
> > but I don't know how is the best way to send them as you instructed me
> > using mutt.
> 
> You must use the argument "--thread=shallow" while generating patch series
> with git format-patch. Then mutt should correctly send them in a single thread.
> 
> The instructions can also be found here:
> https://kernelnewbies.org/FirstKernelPatch
>

Yep, I did like that, however mutt was not sending them as it should,
in a single email thread. I had to send them using "git send-email"
after all. I hope it's correct now. Thank you for your heads up and help
with this.

> Best regards,
> Nam 

Best regards.

Alexon Oliveira
