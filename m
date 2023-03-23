Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5CA8C12;
	Thu, 23 Mar 2023 12:04:12 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id eg48so85290201edb.13;
        Thu, 23 Mar 2023 05:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679573050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AnbYtNnlzzUQXg+5sh9fvVtP5rpKDt1j7cHIJ/Ccm7A=;
        b=MEqxckmFA/t4XUBdp7zkwHodfWMJSzg9HH1+3fxAvT3VK8JdReO8kpSSUrBjeQ9A16
         Aaz/ZD27sm9R9MVs4cE4K/J4EFql8L/ZtjfvIQrazHph1bKcS/WZvLszbIcXgelgTxHr
         q4A3vctN8FT677qsn/7aTH+m7BbC1XymXwf3ixpFaUU4CL6IA9jjc6hSn3a7QwCkV2J1
         fNI/iqiRkYRSWNdXDi+fHIMZPne9WdNmRHbVWlO+ZVQpxZtUWFdIjzHTh7mWCoEcaGFT
         gwT0HbTa9pV+tj0pjrzM/f7k2YGBh/GCP2gwLAJudKOhOEIb5vfFMlPIn1WogObkvybO
         6aHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679573050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AnbYtNnlzzUQXg+5sh9fvVtP5rpKDt1j7cHIJ/Ccm7A=;
        b=PLSoCup2MyoMq8jWgQxUwyxm7N1MliCsE/82VUODBjyk3dZZ5kJYsK1s7p8cn8yH+f
         nWrvykn36Ogd17i3YY/L3laaBuhjrMzRmrKouB9/esNkZ58SeQspPEDTdF4Iz1/XvryG
         0VUYVsuoJg5Td/ZTvlDyRoivoAWkIDGWBr0CISFrDQzCgSfLBGAfrZlMxWF8aNDl6WHD
         5tXiiv3w8/CORwympMc+GPwI/3ANtI/XuW6sttPXBRHigDbUkIopWRCKZ/9jJ8MtwNOQ
         hbo4m2suVrxsn3JAJKncIC+9ZPw8IB5428xoF/73ooxhSrXFjH027RNcUZpu9cH7LT7h
         OseA==
X-Gm-Message-State: AO0yUKXQsIg0Ultx7/ZJnBN+Q293FyFvDBCOrzzf7AFwAIK3RMb1ueK2
	YeHLBuO25WXt1+uv/Cv5kww=
X-Google-Smtp-Source: AK7set/IfY5+JeNps0uY0WIhutpb2BPEBr0Ch8GjVZHmOhLHZm85AnDwXsyBuClOvu0pWT4tei3dhA==
X-Received: by 2002:a17:906:8553:b0:928:d4f6:6f77 with SMTP id h19-20020a170906855300b00928d4f66f77mr12226869ejy.29.1679573050392;
        Thu, 23 Mar 2023 05:04:10 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id b9-20020a17090630c900b008bc8ad41646sm8465454ejb.157.2023.03.23.05.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 05:04:09 -0700 (PDT)
Date: Thu, 23 Mar 2023 17:04:07 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>,
	outreachy@lists.linux.dev, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] staging: rtl8192e: code cleanup patches
Message-ID: <ZBxAN0YkVQ2xSkZi@khadija-virtual-machine>
References: <cover.1679521517.git.kamrankhadijadj@gmail.com>
 <9cdfab96-ee7d-db11-4bde-71648a640385@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9cdfab96-ee7d-db11-4bde-71648a640385@gmail.com>

On Thu, Mar 23, 2023 at 06:56:32AM +0100, Philipp Hortmann wrote:
> On 3/22/23 23:07, Khadija Kamran wrote:
> > Fix several cleanup issues reported by checkpatch.pl in module
> > staging/rtl8192e in file rtllib_rx.c
> > 
> > Khadija Kamran (4):
> >    staging: rtl8192e: remove extra blank lines
> >    staging: rtl8192e: add blank lines after declarations
> >    staging: rtl8192e: add spaces around binary operators
> >    staging: rtl8192e: remove blank lines after '{'
> > 
> >   drivers/staging/rtl8192e/rtllib_rx.c | 73 +++++++++++-----------------
> >   1 file changed, 29 insertions(+), 44 deletions(-)
> > 
> 
> Checkpatch:
> WARNING: From:/Signed-off-by: email address mismatch: 'From: Khadija Kamran
> <kkamran.bese16seecs@seecs.edu.pk>' != 'Signed-off-by: Khadija Kamran
> <kamrankhadijadj@gmail.com>'
> 
> Is this wanted?
>

Hey Philipp,

Sorry about this. 
Let me resend the patch and fix this problem.

Regards,
Khadija 

> 
> Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
