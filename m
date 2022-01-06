Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37D3173
	for <linux-staging@lists.linux.dev>; Thu,  6 Jan 2022 20:14:36 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id l10-20020a17090a384a00b001b22190e075so9784617pjf.3
        for <linux-staging@lists.linux.dev>; Thu, 06 Jan 2022 12:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iY7kaZWechPsDL3Q2mJcGuDW8q/eF7XLJPP9KZVQVwc=;
        b=KNr05I3wAGKIk2RV2Y7lMTmPYQBJlch8m8XX0o7OWe+L0TVKyIvZD1S8rJIAERnHYu
         zyvGrekWXD22/FLLNq8ZbeS10yDkiJ3tz/6LufLZY/yO6vQuIGJ3k9qvxRb0/dXrFeC9
         Z+l0BpaawmD5Ou0HPcfrTJZstZXTdcgoE7P/YgpKW9zcTUpGtTKHUFp784fc/KY6rhdv
         eEC1McorJRnQxaFvO/iI/3tyGUXMpFL1vHubhfBb3uKqrvH0Ghhd8CI/fcq0WuaYaZMh
         R5MqhowepaKmn/lyjMtUgAMI8VHRVb47pLBnfHljv23hOVi9ppF7S5oCw/AgxcH9Rik3
         GoVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iY7kaZWechPsDL3Q2mJcGuDW8q/eF7XLJPP9KZVQVwc=;
        b=nCAY4sGIeR7Do3kDi8SK8HrH94xdkMBuR9mEm9Kizg5NdQbipTdqEPsT1+1rmbnHQA
         QY/BeulMtIQsA5V1kBKG+jCvLYyV/EBS8Ma9DHYvEgv+ot3yVAH1wM/hWrNHVItwOJWq
         YPZn87aIm5KjLp7v5A/ARM4k/XQwcgGQOxn5umdGlIUaanezv3gMhoRgQ7DeSnWtDxmc
         Ks5+ymK64Ul8oF1b1S59x5Md+/yziJakS+MM/EEV4NH4obF0uKlKqOPwZiZJ0vm+KtWS
         T+wB4/nhcqcfEWQlwIwegBJ6plz/nf/TnGIM1EnXNdtKEin1uxBMk4ovg3FP2mB0u5w7
         WLMQ==
X-Gm-Message-State: AOAM533dpJNjuwsxlh7fBGX2RthrRMickYRSphXaAYK0D6q0a9ZQ+fQ6
	dqnygVeZs4fRPA9WoxTiTrw=
X-Google-Smtp-Source: ABdhPJyygoC0sktO/hQHbN0E2GrqJNnr8NvPR62/Rpv92McIKlH1hsaYEaz6rmQFd+qkok9K7LQc/A==
X-Received: by 2002:a17:902:7fc6:b0:14a:663:f359 with SMTP id t6-20020a1709027fc600b0014a0663f359mr464061plb.169.1641500076487;
        Thu, 06 Jan 2022 12:14:36 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id c6sm3285512pfv.62.2022.01.06.12.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 12:14:35 -0800 (PST)
Date: Fri, 7 Jan 2022 09:14:30 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Sidong Yang <realwakka@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: pi433: move get version func to where all other
 functions are
Message-ID: <20220106201430.GA3416@mail.google.com>
References: <20220106093110.GA20011@mail.google.com>
 <20220106101946.GA23794@realwakka>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220106101946.GA23794@realwakka>

On Thu, Jan 06, 2022 at 10:19:46AM +0000, Sidong Yang wrote:
> > +int rf69_get_chip_version(struct spi_device *spi)
> > +{
> > +	int retval;
> > +
> > +	retval = rf69_read_reg(spi, REG_VERSION);
> > +	return retval;
> > +}
> > +
> If we don't modify retval, why don't we just return directly without
> retval?

fair point, I will change that.

> > @@ -17,6 +17,7 @@
> >  #define FIFO_SIZE	66		/* bytes */
> >  #define FIFO_THRESHOLD	15		/* bytes */
> >  
> > +int rf69_get_chip_version(struct spi_device *spi);
> IMHO, I think that we don't need to include 'chip'. Because all other
> functions in this code don't have 'chip' in function name. and version
> code seems to be more accurate representation.
> 

will change that too. Thanks for taking the time to review this patch.

thanks,

Paulo A.
