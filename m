Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A1D2C8A
	for <linux-staging@lists.linux.dev>; Tue,  5 Oct 2021 20:30:42 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id r7so1549584wrc.10
        for <linux-staging@lists.linux.dev>; Tue, 05 Oct 2021 13:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wBNlZZkiMH+Mp143AH/+rkdwa9fTaldZmAwRAtYfAMc=;
        b=WRtf5Yyw5nQz/RbpMbvLD8suBC7UO+bOzeK4VycRBmHQG9Wy3xxoewgGX/9Zf7gvwn
         QBPBJWLmO963lswX6pod93p511M5Q2U3Qks0KOlfBaCFFNHexDiJyjNgUdByq1GmyLEi
         pYYwHYfAr96r8g9Ji4XCk8QAMzqeYAA6xQLlANrpI27i3ET/g9+X9dYJ6oYyhR6wr9wz
         tL9Zy3v1M2818mq+h18LgXxYMlopQxDrCPjRN7LqfDT4ytZzPFd4duW5pJA3ULBcM3Il
         Pn2qfCMqkoR2i31CA96wYduEyaAB3I2H+mPf6r7UFyLjp8O4jq5QQfy6IMq2gGmWNY13
         vygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wBNlZZkiMH+Mp143AH/+rkdwa9fTaldZmAwRAtYfAMc=;
        b=PKRCITe7Swnj1lsuh2Boq35a2W3CFRmii5k/SIvmyvizK1tz8NwtCCDUHE0hNBuHsP
         YSAt4JM4QgaXuVTpHzKX4ZbRu8OxorMrP+k6IBTA4CGTOQh1+qMsJcViw4FigAwzfJnX
         2p6QrYFbOSl+o89q+pbMPlD1LcWdG+DCQoNsnOFGEswsmwW27UU/i8jjEtUm9iUtomu6
         6iupOcnKt4Q09YBcXnYA/y34sFTbXtoYfnlwRcnLq+zN12cQOl5m5N+O92LNjSgvvF91
         fqi5X27lwb6Gq6JRHu/ioC9v70xVjmLFEopInMUChGshWm1yjGnMgHR6iHU6vn7ZxHBC
         s+ig==
X-Gm-Message-State: AOAM532CoaBYItsK6dr9B1BzI6dQvm3Td/qwbA5/gVWgvF+V/qMNUgYk
	MFS6z9ylQokxF3psNX/LHXc=
X-Google-Smtp-Source: ABdhPJxKiu9hq5n5ZE7QLxfnjVTdnmVxFZVs9SwZICs4JeRTHN4ojEEQYyExTawhhriXdJ9DkEUu5w==
X-Received: by 2002:a05:600c:291:: with SMTP id 17mr5614109wmk.131.1633465841229;
        Tue, 05 Oct 2021 13:30:41 -0700 (PDT)
Received: from tom-desktop (net-2-42-54-217.cust.vodafonedsl.it. [2.42.54.217])
        by smtp.gmail.com with ESMTPSA id o12sm3772999wms.15.2021.10.05.13.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 13:30:40 -0700 (PDT)
Date: Tue, 5 Oct 2021 22:30:38 +0200
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Madhumitha Prabakaran <madhumithabiw@gmail.com>,
	Yujia Qiao <rapiz@foxmail.com>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	Aldas =?utf-8?B?VGFyYcWha2V2acSNaXVz?= <aldas60@gmail.com>,
	Deepak R Varma <mh12gx2825@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/3] staging: vt6655: fix camelcase in ldBmThreshold
Message-ID: <20211005203038.GA4833@tom-desktop>
References: <20211004223200.70524-1-tomm.merciai@gmail.com>
 <20211004223200.70524-3-tomm.merciai@gmail.com>
 <20211005083936.GW2048@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211005083936.GW2048@kadam>

On Tue, Oct 05, 2021 at 11:39:36AM +0300, Dan Carpenter wrote:
> On Tue, Oct 05, 2021 at 12:31:57AM +0200, Tommaso Merciai wrote:
> > diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
> > index 49e3d09480f2..e74372263e14 100644
> > --- a/drivers/staging/vt6655/device.h
> > +++ b/drivers/staging/vt6655/device.h
> > @@ -215,7 +215,7 @@ struct vnt_private {
> >  
> >  	bool bEncryptionEnable;
> >  	bool bLongHeader;
> > -	bool short_slot_time;
> > +	bool bShortSlotTime;
> 
> Trolololol....
> 
> https://www.youtube.com/watch?v=2Z4m4lnjxkY
  
  Arg.. damn me. Thanks.
  I don't give up. :)

  regards,
  tommaso

> 
> regards,
> dan carpenter
> 
