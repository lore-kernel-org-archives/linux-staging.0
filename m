Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2521227472
	for <linux-staging@lists.linux.dev>; Thu, 19 Oct 2023 13:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jjXcwFby"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6b87c1edfd5so4684861b3a.1
        for <linux-staging@lists.linux.dev>; Thu, 19 Oct 2023 06:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697723280; x=1698328080; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BliccIy+de7xYxoFZodWYzkchyJ1PaiIyTfG2nYkRFE=;
        b=jjXcwFbyZ7Hc8brr44Wb0F6g0WQzoG/XLpNbMQlAXPIjPdzKJtG3m0z83pJ0yiIT8D
         e8YHLSjFjDknT8HlhMI8ciGFqC2dwGJ0rx1N5ZUwUojiRB5SZ11XjxrTx/v8i3jYmC3y
         VaCkZT8pQ630zH9tj9fRDML4pKhwoX6wIovPc//nJHF4X9kGU/k5GqGbDNkVDlnA79W5
         aYTZSymaXMl9Nrqk/kOTDc/gxY+tE6HP0mel+3CJLV3tMpSMgzD18BAJKKepBWD5KZW9
         cMmWueBImR/+9VMYoaiNkHPLUAfvxju9mCZDJ5SYeTlNiV+9EDCzLCgslODx3xB5BBCF
         MmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697723280; x=1698328080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BliccIy+de7xYxoFZodWYzkchyJ1PaiIyTfG2nYkRFE=;
        b=gpAzGHWOfrNW83cSX5b+LSau0TyMsZQg7Q3Hm0+lQ5IN32JaX8n3ZFEaPD5iTG2nRE
         jChR3mFMko35tOCBJbH92bJzFGzJTSIyAR9h+b/HIjlswxlXRL8AW09vzCp3EvPqTmA0
         5d2Qnab6gdX880gSoAf0qZVMFj6OWKUmxtgxHVxuDfIxm1OLh9bl6iTFj9b9HzAO+D64
         m4SJkAkZk6hGEU2ssmkdS4yGc7yRQ0soAu2unJMlPQHuLWzSdphyNwA+9Of/21JGonf7
         l00Az61Qwi//OjRaWgLRrjBLyBSBDkHIUqhdTpRlz4JWAwEACv27ihiULFFAu7p53eCr
         zTlg==
X-Gm-Message-State: AOJu0Yxpkx+n+QK9TX6myaBHzppuS2/csH1BCn05WlxicXTnj9edHZqR
	HxKKlqks/STu8lCHfxtyH1Y=
X-Google-Smtp-Source: AGHT+IFls3pZjV2ctOYZBjQmps7xxPwUMRdJUFsqmphuiHlQtlyJ71NSndQuEO/mqkcOewM5dQq+Fw==
X-Received: by 2002:a05:6a00:1408:b0:68f:fa05:b77a with SMTP id l8-20020a056a00140800b0068ffa05b77amr2241339pfu.31.1697723280325;
        Thu, 19 Oct 2023 06:48:00 -0700 (PDT)
Received: from ubuntu ([122.167.60.51])
        by smtp.gmail.com with ESMTPSA id w28-20020aa7955c000000b0068fe76cdc62sm5252528pfq.93.2023.10.19.06.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 06:48:00 -0700 (PDT)
Date: Thu, 19 Oct 2023 06:47:55 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Simon Horman <horms@kernel.org>
Cc: Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Coiby Xu <coiby.xu@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	netdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kumaran.4353@gmail.com
Subject: Re: [PATCH v2 1/2] staging: qlge: Fix coding style in qlge.h
Message-ID: <20231019134755.GB3373@ubuntu>
References: <cover.1697657604.git.nandhakumar.singaram@gmail.com>
 <cec5ab120f3c110a4699757c8b364f4be1575ad7.1697657604.git.nandhakumar.singaram@gmail.com>
 <20231019122740.GG2100445@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019122740.GG2100445@kernel.org>

On Thu, Oct 19, 2023 at 02:27:40PM +0200, Simon Horman wrote:
> On Wed, Oct 18, 2023 at 12:46:00PM -0700, Nandha Kumar Singaram wrote:
> > Replace all occurrnces of (1<<x) by BIT(x) to get rid of checkpatch.pl
> > "CHECK" output "Prefer using the BIT macro"
> > 
> > Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
> 
> Thanks Nandha,
> 
> these changes look good to me.
> But I would like to ask if not updating
> Q_LEN_V and LEN_V is intentional.

Thanks for the review Simon.

I have already sent a patch for Q_LEN_V and LEN_V and it is accepted
by greg k-h, so didn't updated here.

regards,
Nandha Kumar Singaram
