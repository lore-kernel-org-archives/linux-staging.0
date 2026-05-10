Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5583628504D
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 20:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778443727; cv=none; b=hRO/i06i1b9eia4w35TTyxjJdfZJCpRAghfaIcvE5BfwsleKcs/jCUrcj77azsRlLzY3KGUtHFEFpI9JbultXNE3vrppzJm8u2mCxEn4+n+AzISY5or7p2Ib6mmlB1mDzpp3n3yV9KIs7hIaP6be9HaFh0sr8wGVdjR/37Jf/QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778443727; c=relaxed/simple;
	bh=21WHH0QbB3VNwq6/T0Y/xk8TQkWPCQC+ybk6aX5b6VI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XZOorQIutARlq25QikpDbXfOjiZAYYDhks9pYBAcL7wdOP9UDQCvVcdSO8WHyMNxBo7gxa6+iIVE8mpbahBTqIPhWlmFC/PaK5HBrQ0PpGjEHTGoXgMYGBHPXCXWrWG/OTZJsgGOgenljVXamkwr0upvI2QnoJq6nRyVOwsV6RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iNCZMiHl; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iNCZMiHl"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39389398838so31394071fa.3
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 13:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778443724; x=1779048524; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xq0eCfFFVhhwTW1CrahoPKVwikBFH7u1M96F2j+Id8I=;
        b=iNCZMiHlFRLp8QelIgbCpGJ8p4XoWJUwwAPLkjRbtjla8TcnBmYl0BF2AUX6hXHUcz
         cz9JzDy7RqSRgFCynQ9lOPg9DfLvqw81eyrtCLh6bFNXhfcF6JkS5lzibeIFFhoqDooK
         Dp5H/ECzSq4RGQ2rDLgT2f73cAVVXNpBHqI5TLYjUNIfhphUsDmKCtIO8VvCufJAiFZt
         1i+VIqu76VDX0fO/fJCt3SVQcLdmd7ahFLHjzHtov5OaiXz38Kuqoheye53JECTJHLiY
         /XJj3Yy+FEKESVTDG00iAvsjmDxpfVwS76KDKYlUUSCQ6F+QOE6rWbEsNW4jGHft1UWz
         kFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778443724; x=1779048524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xq0eCfFFVhhwTW1CrahoPKVwikBFH7u1M96F2j+Id8I=;
        b=DcGxzF4yi1oXFFdsF/y5dBrcTzjTju4n/A7gYatrv0X/XAwi8DB+wZWFM4yIW9tsP7
         mhUwLv4U8g3otvZ+MpCg2CBjl0uYmlYnuJP0/ZK4xOL43J2VRfLQQ9GqO8vCvtw3Jf8X
         yqbkaN986S1xfStZUC/qnmP1Sh7K5ZqJK9LNxdAs9HxrA1xSnl+vsnWEtt8xX5zCoj6y
         0ftcvNTJb8EWtBoXNbOWvbjJZ4H8GarF3lx+y+d9KC9/3vszqfWgn0x0L2qmn06CbspP
         d5hkRibSDAuA5V3NdYaTglz5QS30vJdioSi87baw1gr9L4V3Pu516hot1USqVwU/5c5D
         1XHA==
X-Forwarded-Encrypted: i=1; AFNElJ9a++K0ZXhszZW228w5+6Xqgoebqj4twrbQcc2gHKfog//89GGcL7U0/oyvr4e7sy7esuexA5vO/dn4CFSF@lists.linux.dev
X-Gm-Message-State: AOJu0YyGB4SLRLSMGI3nlhe0HYBHIxWsEIMktFcT7XE07lRd5ElwHJEX
	0U723nC5ZnF1OMVE0vs+++I1QhUH/ACpQ+PUSLNg2RohOHNrzEDrssPjH+sE6qnq
X-Gm-Gg: Acq92OFGopMvDxmPZ01lnbaTxe8mZ69pV4a95Zn/jA/JU8fAXaLMx8KzHDIavDZ+Zbn
	0VMkKbe1ZDF1WCxMWf2eJ2Bb05Yq1B4X/FS+zUV0UGw5X4UIKitZJhavNDnH4s9gYgBPqq46JN4
	URvKjE9sb7tNT+opOSRQvvsgIVvvObBVbzMJi75R7Cw+Ffu9TNV8c+jJ0r1c3aY4zScm1qtqj1l
	o+N49umu4mZqzxG31E6BxFipEqvlh/EWSRbv2klrZgqSr9x3UT1xodj0T7SdmUtLcs9BQ4ciwVN
	d0m321mqoTSb6luKzqzcWy5clc2iZZG+F56GZoq5lpsK0NoeAXJFl7FcPh/KBy/qbKTY7vpSLwr
	AnEJN3tU1b14SbPtROklgKdX8NHRR3PW0cLti3soLFxs6oESU/LkvQ5+6cdLW2LJKhn5W9fnXT/
	Wue1OeE2dZP7qyuN/N4yEqfZDTF43GIG+6JoM=
X-Received: by 2002:a05:6512:3ca0:b0:5a8:65d9:613f with SMTP id 2adb3069b0e04-5a887cdebadmr9613127e87.24.1778443724396;
        Sun, 10 May 2026 13:08:44 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f18d50sm20978221fa.4.2026.05.10.13.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 13:08:43 -0700 (PDT)
Date: Sun, 10 May 2026 23:08:41 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Pramod Maurya <pramod.nexgen@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] staging: rtl8723bs: Clean up coding style in
 include headers
Message-ID: <agDlyTzCTj2LXPVH@archlinux>
References: <20260510175103.562518-1-pramod.nexgen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260510175103.562518-1-pramod.nexgen@gmail.com>

On Sun, May 10, 2026 at 01:51:01PM -0400, Pramod Maurya wrote:
> This series fixes two separate checkpatch.pl warnings in the rtl8723bs
> include headers, split into one patch per logical change:
> 
> 1. Remove superfluous consecutive blank lines from six header files.
> 2. Remove the redundant extern keyword from function prototype
>    declarations in cmd_osdep.h and fix extra whitespace in struct
>    parameter types.
> 
> v2: Split into one patch per logical change as requested by Nikolay
>     Kulikov. Added cover letter. Previous combined patch was sent as
>     "[PATCH 2/2] staging: rtl8723bs: Fix coding style in include headers".
> 
> Pramod Maurya (2):
>   staging: rtl8723bs: Remove multiple blank lines in include headers
>   staging: rtl8723bs: Remove extern from function prototypes in
>     cmd_osdep.h
> 
>  drivers/staging/rtl8723bs/include/cmd_osdep.h      | 9 ++++-----
>  drivers/staging/rtl8723bs/include/rtl8192c_recv.h  | 1 -
>  drivers/staging/rtl8723bs/include/rtl8723b_dm.h    | 1 -
>  drivers/staging/rtl8723bs/include/rtw_ioctl_set.h  | 1 -
>  drivers/staging/rtl8723bs/include/rtw_wifi_regd.h  | 1 -
>  drivers/staging/rtl8723bs/include/sdio_ops_linux.h | 1 -
>  6 files changed, 4 insertions(+), 10 deletions(-)
> 
> -- 
> 2.52.0
> 

Looks good to me.

Reviewed-by: Nikolay Kulikov <nikolayof23@gmail.com>


Thanks,
Nikolay
