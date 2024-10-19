Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CFB1CCB2D
	for <linux-staging@lists.linux.dev>; Sat, 19 Oct 2024 06:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729320343; cv=none; b=XUKsolBrOJTF75sP4xTLsidoXtMSTW2HN0ERXyln8v58ahha3dn+lrbzE1RYwwYHV7RyIjRHMfZ1HmzhBseQxrkFCD1wYg8xI7ZuPLzRITDgfUJzsSYoVDMdK/9XEXnWhE28J8XNnoepcRRvnydBiXMPzaGmck9mNtnpGAGMa1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729320343; c=relaxed/simple;
	bh=wTUixt+BbMqQ/Ysusg9cMMvxAyJMxvwCB9wzUw3vUIE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=kE9Da/V5wr4oGbIaG7i3th90xpwa43XXbAzDOxYBopDSiWH2NAPQe3+wdXrlc4eGnYwuECVLIOfHn+chUYZrGtsjxqY7TnqZE4SuU3CmVBmohATqMDlhoGq50VlRp4gdEepQUYxRKUHZCV/ue1Cjs+bEXaB2K75QynVS44N2pgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GYCdnY85; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GYCdnY85"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539e690479cso3158008e87.3
        for <linux-staging@lists.linux.dev>; Fri, 18 Oct 2024 23:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729320340; x=1729925140; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/xBFEYk5+1PnZWk62QbDei5REpQoLrsRgMuFoSkY2M=;
        b=GYCdnY85GNDWH208UK+iihLOz1D/XpTzX+u541YQnN4lVMGyrUxPpojx2GpeChUuFr
         t17iaRGtNpVHhYF2vn2nRo0W83OrCQCRjx4ciu86hDzXvmwjemdRmVVjQCUvbbfHbAgG
         qFYa2SRvj45Ak8n0L5sm4CngBAtgAyAs3DZKMks0pku4ZIliXQa4ylpruvu8vVM2je17
         YI0M/m1tLUbh8KWsjXKW1yOJlvKKd7yr1lVLRNBZoA5mFuklgWRev+JH45zePTVm/jDp
         IWp0/1ptmOalDVAzAkKlBi8SwFaDMCmiQzilxgkb75ZIhmSu0f8daNaYbqSCf2ZS7vou
         XCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729320340; x=1729925140;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I/xBFEYk5+1PnZWk62QbDei5REpQoLrsRgMuFoSkY2M=;
        b=JWQTwwy04O/+XyZZbONC2pxQUghmi3rj3v3/ppirU+Kr+rIe7Crh/NyzDarv3lVNHj
         gj6yAPTq73EJ0O68ZxY6d2whGbK3WgPgZm4iH1IxyW5W/2+KNnE3e/Hu4kXBVC9jhcwi
         W21sDCe1pj/oqj/RHOVt+v8p4uHuGXt8b4ErcBlSyXm3s2/ldaKIxStqtlJ8YeilMBwP
         v2QCnHPy5RiNaMAuNJMn+Re6G6LECKfAoQTzfEGJHyE7o23i6M/tbh/cecRw7rz3xTYJ
         g9CItDBtQ31+xsg2hjZuea1T751pQYhT/MqlnIDu1WeYn7ZESMwf0Kg9mA6yDpyChURN
         Tn/w==
X-Forwarded-Encrypted: i=1; AJvYcCWjz/hK+1s+ZaGOA0roTLOcUd09KCgvk2acb7pIVi7bZYYbkV+80xfdybOJ6RuV7G1MRILNTdx1XUENTS4+@lists.linux.dev
X-Gm-Message-State: AOJu0YwciJle0f0AAhCR6TvkVB6JW5htzAx903e4TiXSWHwh+irrxUHS
	0mGmEUUePTBFfeIxY6s/M0wYttMR2HGxfiKKMsBZl+CMiw3qzcZe
X-Google-Smtp-Source: AGHT+IGj+oVaKApjcHHkZ5rbaWGEk7pnvLlMQPmRLcjNNo1A92fJ0dMwx1gGK6vOZmivsNapG6RqWg==
X-Received: by 2002:a05:6512:224e:b0:52e:9762:2ba4 with SMTP id 2adb3069b0e04-53a154a9eecmr3025761e87.25.1729320339483;
        Fri, 18 Oct 2024 23:45:39 -0700 (PDT)
Received: from [192.168.2.105] (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ca0b076d7dsm1519593a12.14.2024.10.18.23.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 23:45:39 -0700 (PDT)
Message-ID: <96ae2b42-c0ce-4d9a-8933-eb874dc5589b@gmail.com>
Date: Sat, 19 Oct 2024 08:45:37 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [RFC] staging: fieldbus: Proposal to delete driver
To: Sven Van Asbroeck <TheSven73@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: "Ricardo B. Marliere" <ricardo@marliere.net>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Ruan Jinjie <ruanjinjie@huawei.com>, Zhu Wang <wangzhu9@huawei.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Deepak R Varma <drv@mailo.com>, Ajith P V <ajithpv.linux@gmail.com>,
 Tian Tao <tiantao6@hisilicon.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Ding Xiang <dingxiang@cmss.chinamobile.com>,
 Jing Xiangfeng <jingxiangfeng@huawei.com>,
 Cristiane Naves <cristianenavescardoso09@gmail.com>,
 YueHaibing <yuehaibing@huawei.com>,
 Oscar Gomez Fuente <oscargomezf@gmail.com>,
 Nicholas Mc Guire <hofrat@osadl.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Sirs,

Sven Van Asbroeck contributed this driver in 2019.

The following points let me propose to delete the driver:
- This driver generates maintenance workload
- only 11 patches during the last 3 years. Part of the patches seem to 
be motivated because of maintenance (for example - remove deprecated 
function)
- Maintainer lost interest, last "Reviewed-by:" is May 2021
- no blog about usage of this driver

The staging subsystem is the way for drivers into the kernel - at 
current speed and interest this is never going to happen.

I think that fieldbus is an interesting topic. But when almost nobody 
cares about this driver, it does not make sense to keep it.

Please consider that support will remain for years in the longterm kernels.

Thanks for any response about your thoughts.

No response will result in a patch for removal in 14 days. This time can 
be shorted or extended by appropriate comments.

Bye Philipp
