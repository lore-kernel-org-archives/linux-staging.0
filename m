Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82343FC0
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 12:11:10 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id mf2so7262850ejb.9
        for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 05:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tpw2AuoZ5uilE8E10lWdNIvs/omFPqAAG7Y/I75dW9M=;
        b=leRLTPB9gTHR0pX0nav9Z01iyQai2iWOg7SmSihwePLc3cJsOol8QJtwQGgzHu96/c
         orQkXXDWt+pYRujIvlVxz0EBTr5BLlyOaGIKEfDFnKFhTBSO7UOcFmCrTlmAgWPdYGOX
         tb+l8aHdq9GzT9RczvYp3r2zaphq4ScgDqcl22wbtBXBYIhbukJnz7LNFrWaYX8B93+3
         6ZEaKqodGuvl0S1WakUZvvFF0wtXI+OlN2fYaIHorzEIom0wS6WpTLLLd/q3qEAqg2IM
         YKG++IM0+xVOgByfnOStDWsDxza+wbQ/AiPFJOwMgGMhNrFlwkINyDQemu34Sig0a/+4
         AAoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tpw2AuoZ5uilE8E10lWdNIvs/omFPqAAG7Y/I75dW9M=;
        b=TBEqPbuTb3Vf43yKbCHu3Qt5mAU/H/FDRfMmKfofuQPG5YD7pFNDgFcAKCw280nF+4
         KjMDEp7ecJU03BLz9MBC6ysS/fCgcDsv8PVkPzN7E4UAHBXn4wWUC+CRci4/AP5ImSmQ
         2sJrX+++ysufg+/w+RplkB+uukfM4MiGlYeJdWB2+gRAWjKy7bEsHTttmdTX9pc2D/+k
         L5eKPnj98qo0Qn9+bDz7f8vtr05PXar3qWzwxjKOEWPOGOcCiII2OEAgX7KMAwLaeCXl
         M/l2JfqurhNjT7oD1coPPA6H7oNQpMII7IVXXbOrF21q+7CvM+0aPj19C+NmsouOEuLl
         dz4Q==
X-Gm-Message-State: AOAM532dtVktGsMSHwDEvwDSspWkORJvRn1b8CV9WqwE7CPMjZHG3ikm
	4QA5So1BNwaWpEW0vRVTpOk=
X-Google-Smtp-Source: ABdhPJybNMq0exV3RFmKZfRNZoQ51Q/aCHPVCu7Rhydr20wNiL9EJ6KEKtWZcJegkkKuzk/1f0bOnw==
X-Received: by 2002:a17:906:781:: with SMTP id l1mr26450485ejc.289.1629547869042;
        Sat, 21 Aug 2021 05:11:09 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id v6sm4222010ejk.117.2021.08.21.05.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Aug 2021 05:11:08 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, gregkh@linuxfoundation.org, straube.linux@gmail.com, Pavel Skripkin <paskripkin@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] staging: r8188eu: add proper rtw_read* error handling
Date: Sat, 21 Aug 2021 14:11:07 +0200
Message-ID: <1985029.ipg07BJOT0@localhost.localdomain>
In-Reply-To: <31d61caa-d07d-193f-cd8e-adfbda1ff9e2@gmail.com>
References: <cover.1629479152.git.paskripkin@gmail.com> <5720270.rXTAdOU5UK@localhost.localdomain> <31d61caa-d07d-193f-cd8e-adfbda1ff9e2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Saturday, August 21, 2021 12:35:48 PM CEST Pavel Skripkin wrote:
> On 8/21/21 8:55 AM, Fabio M. De Francesco wrote:
> > On Friday, August 20, 2021 7:07:36 PM CEST Pavel Skripkin wrote:
> >> rtw_read*() functions call usb_read* inside. These functions could fail
> >> in some cases; for example: failed to receive control message. These
> >> cases should be handled to prevent uninit value bugs, since usb_read*
> >> functions blindly return stack variable without checking if this value
> >> _actualy_ initialized.
> >> 
> >> To achive it, all usb_read* and rtw_read*() argument list is expanded
> > 
> > []
> >
> >> --- a/drivers/staging/r8188eu/core/rtw_io.c
> >> +++ b/drivers/staging/r8188eu/core/rtw_io.c
> >> @@ -34,44 +34,44 @@ jackson@realtek.com.tw
> >>  #define rtw_cpu_to_le16(val)		cpu_to_le16(val)
> >>  #define rtw_cpu_to_le32(val)		cpu_to_le32(val)
> > 
> > Not related to your patch, these macros are useless and misleading.
> > 
> 
> Sorry, I don't get it. I didn't touch these macros, it's part of diffstat.

Yes, correct; in fact I wrote: "not related to your patch".

I just saw those macros while reading your patch. The code is  I just noticed 
that those macros are useless (in case someone wanted to
address that issue). 

Obviously, if you find it interesting, you shouldn't do that in your series,
because it is entirely unrelated to the purpose of your work.

I hope now I've made it clearer, sorry.

Regards,

Fabio 


