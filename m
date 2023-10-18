Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC7D3C091
	for <linux-staging@lists.linux.dev>; Wed, 18 Oct 2023 17:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i2xYdt7f"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-57f02eeabcaso4320051eaf.0
        for <linux-staging@lists.linux.dev>; Wed, 18 Oct 2023 10:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697648477; x=1698253277; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hr0ycA5aHb6vFQVTChWOwllkgCks7I3a7aaUZga0s58=;
        b=i2xYdt7f37Eb+SUGHajdC/WVwpmNMpdmLmyITlb/bWlSrNGYjwPUa+hwSoGLM3rhQw
         Y6FGjsoDdPyHJMJnXOhBafdFrClAdwOEzlqvhbHTdHC7e7UKcb3ImsMk/7qmHzKBL4zc
         ub+WxKRIp1bQ50ZIEO90pXtiVb1yaJjV9/KYs1Ez6y/k41ET4DeyXeZl5QXsBlMAh+pG
         kBaDfdOyPsd9WJudj0O1Lc0RghFfu4NgUPvpWaCZ8Sq3nrM+eT1veKVS+KSaX3OwxopA
         0LONS4UUOjoo+WFtSybjGPV47DkMG1QuQPyesK3ZzhDbF+fWqqbhN7Izm9jZLabajdET
         h6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697648477; x=1698253277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hr0ycA5aHb6vFQVTChWOwllkgCks7I3a7aaUZga0s58=;
        b=sw8ExKTAFqU+G+OQghQwTOtO05cHcrYhcLbP2pRuZAdcUGs1X4707rd/BSrduUnOJf
         8dYmBw/YSSrouo67Ll1XS6pTJO0KNoi/s1E9pKpSbkBmKXMSug1Iv3BejfIlcD5IU7vI
         0PIrW6mK5V/uVFdlSB368AL/9XlIJA7RxhK9DtuE9F6txMFRGkcRlK2cEZQaNsg5mTfi
         OUoyJEDwg7y/SoisafmXMyOzRbDhktvgLPYD4GrLPCrwpIuX+z9IdGxg92Q89w9PzdHr
         XqvDprLXNuLmW7Cwu9MOLUb/HiWv5keN8AzTGqEoLMuTrMh9O41nPmbTBOQBfKJqsj1n
         90/w==
X-Gm-Message-State: AOJu0YxQymjASl4kO+y+mbfL56wjbmGgwFAwyx4kQ0ixIlmNGl3QIzo+
	5mrEpn4Sy9Fcwdu0DCPQdQg=
X-Google-Smtp-Source: AGHT+IGAR9FT9S+HPbNUPuOZJAwG3+pwoP70aGYbDGxtB3QICfIgpn1ejznN/Qqo1qW4b5zRSrP3bg==
X-Received: by 2002:a05:6358:ed7:b0:166:94b8:da17 with SMTP id 23-20020a0563580ed700b0016694b8da17mr6604656rwh.16.1697648476989;
        Wed, 18 Oct 2023 10:01:16 -0700 (PDT)
Received: from ubuntu ([223.226.54.200])
        by smtp.gmail.com with ESMTPSA id v14-20020aa799ce000000b006bd6a0a4678sm3574595pfi.80.2023.10.18.10.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 10:01:15 -0700 (PDT)
Date: Wed, 18 Oct 2023 10:01:11 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Coiby Xu <coiby.xu@gmail.com>, netdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kumaran.4353@gmail.com
Subject: Re: [PATCH 0/2] staging: qlge: Replace the occurrences of (1<<x) by
 BIT(x)
Message-ID: <20231018170111.GA3452@ubuntu>
References: <cover.1697568757.git.nandhakumar.singaram@gmail.com>
 <2023101856-visa-unlimited-a365@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023101856-visa-unlimited-a365@gregkh>

On Wed, Oct 18, 2023 at 03:28:30PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Oct 17, 2023 at 12:03:57PM -0700, Nandha Kumar Singaram wrote:
> > This patchset performs code cleanup in qlge driver as per
> > linux coding style and may be applied in any sequence.
> > 
> > Nandha Kumar Singaram (2):
> >   staging: qlge: Replace the occurrences of (1<<x) by BIT(x)
> >   staging: qlge: Replace the occurrences of (1<<x) by BIT(x)
> 
> You have two different patches doing different things yet they have the
> same identical subject lines.  That's not ok, sorry, please make unique
> subject lines as obviously you are doing different things.
> 
> thanks,
> 
> greg k-h

Sorry greg, thanks for your feedback. Will update the patch

Regards,
Nandha Kumar Singaram
