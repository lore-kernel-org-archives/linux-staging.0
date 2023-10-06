Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E5327720
	for <linux-staging@lists.linux.dev>; Fri,  6 Oct 2023 15:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Op1m3hgg"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-32329d935d4so1985095f8f.2
        for <linux-staging@lists.linux.dev>; Fri, 06 Oct 2023 08:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696606622; x=1697211422; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D/urUhEVDb9b6U6nA5x5SbH6GwCmmMY65Q2l1I2ccds=;
        b=Op1m3hggWRuc6QSywqfvgrlvXHl8NJiwF20aesQfBwYQK/+AX3EJGgHtQ3jHE4EIaf
         KiGraxBsH4nhn1XqxgagiYB7ijOqpLl9fO78btb/3MwJboZ5NNYRJ2W64txXZEMiVQGY
         yt8lYPbL4EqlGP4j9tERuQi01DvRTpZb+eSb6j/uXBWs08v3tYTcoGY7x7dXlcYPe4ld
         9R+764SgmnyFEcx1nxhYz6wv0m907pOP+nwhv0ABmpq49TEID/HcN+NoLO7Tvg2IPde+
         opzTSMKRaXW7yKL9UN0cB2uxJUlWGyHym4BLvdheAo83gnkSEZsaivGUOvt+j5vpI1mn
         0Hqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696606622; x=1697211422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D/urUhEVDb9b6U6nA5x5SbH6GwCmmMY65Q2l1I2ccds=;
        b=lbyiDt7OmQqHwDlbdyStG3LOj1sxA5epcM6fTHrFsee0p+sFkUrwbAh238bxDkKdrq
         TifexkopOSfA7emF49n4XN1j5JFlOgcm6MEA6X5zx+R1cP0/0C1SN0cIQCxfbX51SJOw
         pD/cKoKGcEP+5chupVua/MD1n1KnzIht9q/QqiOOEuIfc12aau6doXPrr5sgtKtqrq/W
         jNIAnBp7xh7+G1Ubr+pTQWiRNqg+l3ZEVbl/XTysQHelrPL96u9Zcf1TWvhhL7gpNrNg
         H3ZnWHQ8bXmF0XnCThWnbzISx1dX5oHQT1DJxfuxAm4c7jBkwed87/Mf2xIK0sPFmliL
         bYtQ==
X-Gm-Message-State: AOJu0YzKL/gJnhMGdXoAS2EqD+x+XqiGCdSHzJY8Jei9mPNIJCkF22Yn
	CMKdf7lIh3ADWuNRNMI2aJw4tA==
X-Google-Smtp-Source: AGHT+IFhUnnVEJUHmy1LCmhtDxaQkbgyka+3XLQF18Cyaq/blQPoPH0cdviXGeLDfUZ6BOOYmD2gUA==
X-Received: by 2002:a05:6000:12cd:b0:320:976:f942 with SMTP id l13-20020a05600012cd00b003200976f942mr7751664wrx.7.1696606621912;
        Fri, 06 Oct 2023 08:37:01 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c6-20020adfed86000000b003279518f51dsm1909859wro.2.2023.10.06.08.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 08:37:01 -0700 (PDT)
Date: Fri, 6 Oct 2023 18:36:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ricardo Lopes <ricardoapl.dev@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, manishc@marvell.com,
	GR-Linux-NIC-Dev@marvell.com, coiby.xu@gmail.com,
	netdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: qlge: Replace strncpy with strscpy
Message-ID: <9987d46a-ffbc-4a1c-bddf-084b17d14cf1@kadam.mountain>
References: <20231005191459.10698-1-ricardoapl.dev@gmail.com>
 <2023100657-purge-wasting-621c@gregkh>
 <ZSAoDYYqgoXXV4s_@babbage>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSAoDYYqgoXXV4s_@babbage>

On Fri, Oct 06, 2023 at 04:30:21PM +0100, Ricardo Lopes wrote:
> On Fri, Oct 06, 2023 at 03:32:28PM +0200, Greg KH wrote:
> > On Thu, Oct 05, 2023 at 08:14:55PM +0100, Ricardo Lopes wrote:
> > > Avoid read overflows and other misbehavior due to missing termination.
> > 
> > As Dan said, this is not possible here.  Can you redo the changelog text
> > and resend it so that people aren't scared by the text?
> 
> Yes, I suppose removing that sentence and keeping the checkpatch.pl
> warning output would do?

Yes.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

