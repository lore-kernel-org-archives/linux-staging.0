Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0AA7E1;
	Thu,  3 Nov 2022 06:40:24 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id l14so1231810wrw.2;
        Wed, 02 Nov 2022 23:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ESHWUn7hNVM3hhfp0corAi9A6QZkBTRcaV/Qj5TdN2M=;
        b=m8etF77RJYcU7J1sOVO1hLLRMjfj5Tf7qPlNpIPyaWyIHVdPjQspnr0Z9tyRdcsdoX
         V4ZQJxuzny0UrPq0nxtj+ZXBkiaJjzbvXjieN43wSvdsP4oAGp9FSr7HXK5shYlXUUFo
         poF5wJbHyCCQQf5LvWd3uaGeoyLCOlt05/4VwRq3n/ggLtCfygcow+k0xTvqFipf1Meq
         ejRtVxrskaCTQ5VHYzOoAiDxxh8thuQ50etRTkalqsQs89Osn9w40d9O269UVWfjz4yA
         4x4566vCnM6ZZVrFQd+MxZaG+PHHFciBmILdQLuHcgjTZmU8jRTpKDbuhXrQA2V4k6Xp
         4KxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESHWUn7hNVM3hhfp0corAi9A6QZkBTRcaV/Qj5TdN2M=;
        b=MUbtSf6HRpYiil4wjFxJNrljIJoURW2gk0GraNnEfrWmRctPVtk7k0xRsFw9NxfGvs
         WGKnO2lCXq/HufzjdhxpQRVXlA1x3AllcGf5oy4TnVCu6YzXg+g+5U9ZK7K0WO0wj/7V
         7G7ueOaDLulaWKHdSikt7yxRl7NxWMrFfh23NanF1cOH9Bx+U5iAsRALTQr3UvDZffEd
         UJnzDjuQ3JlWply8OWyrL1LakQfq6A45c/L45rRS+DdVVIvYHG8otumwIbFk6YmTX31F
         hhnvO4aRda3G1uf3U7OHA8dpkdvp28lhko2APiss4fBJFqBbzDrY55n8xxbU5GDSWc8g
         P3yw==
X-Gm-Message-State: ACrzQf05bRmbnqKBclEN7yANCBGAdrP3+6FjJmuOmG08dO2bDs+vhRF5
	AFNfEJ9BW4SEd2Pntpa6MT8=
X-Google-Smtp-Source: AMsMyM7BwKP/AL76bBxpVj+2Z8rQIC99KpoZS93KzfFkSfEZudsbo2+YXLYhQaWEbMIGw+fSyb0Eow==
X-Received: by 2002:adf:f081:0:b0:236:5e7c:4ec2 with SMTP id n1-20020adff081000000b002365e7c4ec2mr17024440wro.641.1667457623087;
        Wed, 02 Nov 2022 23:40:23 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n18-20020a05600c4f9200b003c3a1d8c8e6sm249628wmq.19.2022.11.02.23.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 23:40:22 -0700 (PDT)
Date: Thu, 3 Nov 2022 09:40:19 +0300
From: Dan Carpenter <error27@gmail.com>
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [RESEND PATCH v2] staging: vt6655: change 2 variable names
 wFB_Opt0 and wFB_Opt1
Message-ID: <Y2NiUwrvFt1V6xdK@kadam>
References: <Y2Ncr9fQ5P6OChuV@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2Ncr9fQ5P6OChuV@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>

On Thu, Nov 03, 2022 at 06:16:15AM +0000, Tanjuate Brunostar wrote:
> These variables are named using Hungarian notation, which is not used
> in the Linux kernel.
> 
> Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> ---
> 
> v2: corrected errors on the subject line of this patch
> 

Don't put RESEND in the title.  RESEND means that the first patch was
perfect but the maintainer accidentally ignored it.  v2 means the
maintainer wanted something changed.  RESEND v2 means that v2 was
perfect and the MAINTAINER ignored it.

regards,
dan carpenter

