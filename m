Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5021619FA8D
	for <linux-staging@lists.linux.dev>; Fri, 14 Jun 2024 20:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718395208; cv=none; b=B+7oqX8+LbkKi1PvNcYqtXkdBMRzVyIC1v90UugoELLbxc0OcutFrlGLsZuKWoI/cjSsoSH93M5jFTVBJiQ9Ei6OYrQ7231ldLtfpcYowJGw742e8pv7Y6HmuT7v+jejZLqbsPRA5LUgusvHejyt7Njq+lYn3k7wgBp8G2RvanU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718395208; c=relaxed/simple;
	bh=UecWv9IJeqO0ogDEFKZ30msCBczVQJG5/sT8DUT1gZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hMrr4uyvQErik8Gze8e3gEh+c/kT59qDEZh7KqW1vP0WvPXI1m4ztauWSi3xhQCqfcMW97FcyXiMQxSChnspwKA6uhK1c3O+WP5rJLbE2b/ugu8Y6P5GlR2UHY02lC39zSJU4CzSXmCxb3i3GOBAFxvTZVay/Thi7bVr5Kneals=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O1SWfXLP; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O1SWfXLP"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a6ef961f566so30528566b.2
        for <linux-staging@lists.linux.dev>; Fri, 14 Jun 2024 13:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718395206; x=1719000006; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1sffmBRRqxvVZKL+gZwYpJ+2d0Xa8nclbjp8aHRZVxo=;
        b=O1SWfXLPR/W58rx2lW0oM0Pd97BM6IdUJxNvREq3dzNQFFOCq7TAexT8obnDtRpgLh
         dd23ERHbbbOZRavz1Meo+HIOdaWVBVcvNVDALRqYpFOe2xa/jC5OfFPAIP7ZjbbUZgt4
         kxN83Ih3gjqn0ESa8YZuMDxBjSn3ic3Z1KHq79cJ34S0lqkLb6OEBcLOUMiUz0dbYuD0
         id6577kkYs7+nHUFhboNDqauav4+hBLt2u5soPoo3vYQNh2tZCbOsMoMWROF5FbywV0o
         Tyv66v9M6Z0qjrxCBBuluVtbE0gj2UBAkVM4htNxi0XU/7hFz6cMF0HMtNYxvl0C8h6u
         CHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718395206; x=1719000006;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1sffmBRRqxvVZKL+gZwYpJ+2d0Xa8nclbjp8aHRZVxo=;
        b=vnZetp1tfs1HNk3eld/HbVugXNxjgB2mpOktYty9htCbjP5UszgL4HDn03cNqz7+oF
         b/rYdR56uBjjUXDnDdDdudOPsk8GSafyvS5T3hECK2RxzKN+Ce6skD2vbK7GN/Vqv8s5
         AwME9adADoV4HogocHhUnphwLyZIPjG7AHRoF1Uu6m9nfEy94wnCwnJEhAt6JfKP2kPd
         17jcNhBC2ZtzUVFe3o9IbvCV0UQMsnmDZW0xxx5w/N/Mahch26yaGQnMuClUaNaqB/qw
         OQ9Ee5U+9atRT9sw+KyPSe1jaLmjHHgMeRYjrvwaJe9RppjxBONBnDI+XyYnloy/Wjog
         N2Ig==
X-Forwarded-Encrypted: i=1; AJvYcCVKpyQioa3QrNHTYfleBdVrki/HnVzMcOXRXA7XXDjDioNHZk9wMdLsvpxsk6ia5TvLPcSQuq1P14JEhSO5fKpgFGvfcKwMnOgyyrJxwg==
X-Gm-Message-State: AOJu0YyedYwRXHF/RZZnyrJLMowQW2ftUGZDMVJTGaw5AEpXtgIjKA+w
	CGicaHEd+R2cwJt1Qf99p+Qe7T+/+MiahbBf9m8BNlKZvcjRzb6K
X-Google-Smtp-Source: AGHT+IHuBi11JQJsVJTkYZSJBQdsXFWebGBbRzzvC/b2FAzj0+X9BAS2A1lf02+zZ0XxgNKvQEv3Qw==
X-Received: by 2002:a17:906:f5a3:b0:a69:edd:3323 with SMTP id a640c23a62f3a-a6f60d13971mr290842166b.2.1718395205371;
        Fri, 14 Jun 2024 13:00:05 -0700 (PDT)
Received: from [192.168.0.104] (p57935a9b.dip0.t-ipconnect.de. [87.147.90.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56ed359bsm217076966b.137.2024.06.14.13.00.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jun 2024 13:00:03 -0700 (PDT)
Message-ID: <4a18cc93-5495-41b1-a40f-7873954200f6@gmail.com>
Date: Fri, 14 Jun 2024 22:00:03 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] staging: rtl8192e: Cleanup multiple issues
To: Teddy Engel <engel.teddy@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1718309120.git.engel.teddy@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <cover.1718309120.git.engel.teddy@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/13/24 22:15, Teddy Engel wrote:
> Remove some unused constants, macros, and structs.
> Capitalize a constant.
> 
> The patch order matters - please apply in order.
> 
> Teddy Engel (5):
>    staging: rtl8192e: Remove unused constants
>    staging: rtl8192e: Remove unused struct phy_ofdm_rx_status_rxsc
>    staging: rtl8192e: Capitalize constant RegC38_TH
>    staging: rtl8192e: Remove unused macro dm_tx_bb_gain_idx_to_amplify
>    staging: rtl8192e: Remove unnecessary pre-declaration of struct
>      net_device
> 
>   drivers/staging/rtl8192e/rtl8192e/r8190P_def.h | 9 ---------
>   drivers/staging/rtl8192e/rtl8192e/rtl_cam.h    | 1 -
>   drivers/staging/rtl8192e/rtl8192e/rtl_dm.c     | 4 ++--
>   drivers/staging/rtl8192e/rtl8192e/rtl_dm.h     | 6 +-----
>   drivers/staging/rtl8192e/rtl8192e/rtl_pci.h    | 1 -
>   5 files changed, 3 insertions(+), 18 deletions(-)
> 


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
