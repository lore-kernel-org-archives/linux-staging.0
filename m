Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A69B2F21
	for <linux-staging@lists.linux.dev>; Mon,  9 Jan 2023 12:54:03 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id h16so8034684wrz.12
        for <linux-staging@lists.linux.dev>; Mon, 09 Jan 2023 04:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jpALXoXpCmM6Wx/GvS4p5SqoIuRwrqLRndRGfMcQdMo=;
        b=jPVlcPDCpNm0wFe55b5nj3FOkyrYD0IM/QY80s6I8jKX205AHL26/y6nzKNScJRz3b
         riYbtLc6nCb2F3HkR9fQf5bC/z4mAVmCjFRIalRj5I8Bp9inzcvs8qEd4WLKCwBZKU1j
         va6Cysh5MUZXfzWuPaI+CCDf2Div9Xor8L8i9Gw9R5ca/BG+A+cOdICjDSayGFNJTfvO
         LjVQiGdNxLT8EghskdJKez0ZZQuBCXlZhanYebj4bsOy/ijp4scwpI88vMccjY2mnmm9
         FAMbL1XsP5QudgGZnexziTJBw/xFaeGuyY8itVbsUpYFZTf8rn+G9xWRqIZNq+cQE/sa
         lEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpALXoXpCmM6Wx/GvS4p5SqoIuRwrqLRndRGfMcQdMo=;
        b=a4+HS5o8qaveAYJh9rzBSUTw4OiHRQP66TSypyulI0vaHAHmEoxXaxDSf7+ZCHp0mF
         J4IArezLo53pvY90/I5MyjfglAAsoC94aY5dcVbCGRvO2LZbZyzGny1+FJ5EgO3q6wlM
         2pU6aZnFf9g8aRPIR8GwmI6UPefNnAImHOGAbrXVRxmpAK9nlz6gY3KuXD/JiLrNONR5
         CPiEG+TdRthN6gEukLxq2260ePxqAG7u9aWipal7oFS8EWB2W1tbg2hJwIERWhCqrhZD
         W+fbDfVY9idOuKQRyEg3RRLG93diniJgF/fHx2AK0sg6lBReyzorFw1wkVuzMRz+yyDX
         HNGA==
X-Gm-Message-State: AFqh2krphGffUxwxko1wRAtxhc8OFyTXbE/KEBnMhzjVlklfPhloASD3
	FopS2cmgeC1pXzj98tKltsw=
X-Google-Smtp-Source: AMrXdXs4Xe4cX/Ag+ggvmUxZJ/ShYF74MSOFZNVmuDL2d57KHfApHqnZ/NjGN6ZGjKU7iyWO4mg+IQ==
X-Received: by 2002:a05:6000:816:b0:2a4:d913:b179 with SMTP id bt22-20020a056000081600b002a4d913b179mr13657093wrb.0.1673268842347;
        Mon, 09 Jan 2023 04:54:02 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u5-20020adfdb85000000b002ba2646fd30sm9910837wri.36.2023.01.09.04.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 04:54:01 -0800 (PST)
Date: Mon, 9 Jan 2023 15:53:59 +0300
From: Dan Carpenter <error27@gmail.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] staging: rtl8192e: Rename TSSI_13dBm, Pwr_Track and
 NumTotalRFPath
Message-ID: <Y7wOZ0tm7XiJ4Bhx@kadam>
References: <cover.1672330343.git.philipp.g.hortmann@gmail.com>
 <c7d3be41602e656170de46ea649b5bdf1081d5cf.1672330343.git.philipp.g.hortmann@gmail.com>
 <Y7Pni7tvFPhcz7bu@kadam>
 <50111a6f-08de-1da8-0deb-50b0e7a172b7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50111a6f-08de-1da8-0deb-50b0e7a172b7@gmail.com>

On Sun, Jan 08, 2023 at 03:09:40PM +0100, Philipp Hortmann wrote:
> On 1/3/23 09:30, Dan Carpenter wrote:
> > On Thu, Dec 29, 2022 at 05:25:46PM +0100, Philipp Hortmann wrote:
> > > Rename variable TSSI_13dBm to tssi_13dbm
> > 
> > I would probably have kept this one as-is.  It's not CamelCase, it's the
> > correct way to capitalize it.
> > 
> > regards,
> > dan carpenter
> > 
> 
> Hi Dan,
> 
> sorry for late.
> 
> No issue with keeping this variable as is. But can you tell me the rule for
> the rest of the variables in this driver?
> 
> Here just some examples: (I know that checkpatch is not always right)
> CHECK: Avoid CamelCase: <Avg_TSSI_Meas>
> CHECK: Avoid CamelCase: <TSSI_13dBm>
> CHECK: Avoid CamelCase: <Avg_TSSI_Meas_from_driver>
> 
> Are those OK as well?

You can change the others.  It's just dBm where the capitalization is
correct in the original.

https://en.wikipedia.org/wiki/DBm

(Ironically it's capitalized incorrectly in the URL, but it's probably
too late the fix the URL).

regards,
dan carpenter

