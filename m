Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E02339360
	for <linux-staging@lists.linux.dev>; Tue,  4 Aug 2026 12:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785845485; cv=none; b=f5TzKYhsnU8wCNF+BY1DaKSQ2Zd118+wfYyOr8px9lGBbzGNKaa1MxsZ2kTz9m7kQIS3MEmEIcbnh627a2EK8F71FO9ovi6/ieECTfsFBRNmnzhXBejwT1iimZ+jhlA1/b4yexPEMbgWtAeyyK4f6gsnwYuRBHyT/ximjAOpBTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785845485; c=relaxed/simple;
	bh=gdvqsoZDauSKbuK8JVk7/FuygUkQSM+flJUBcR3la6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s82LR61T6IKxGxGaaYED42T8fiKvTE6uBOcbwpU/NphtpyCZgGy0oHN8lw9G1t+mJUWo8ASKjtfC5MIBpkoeHNzXEqzwOPBvEvwc958UMAWasqOS52TSW7G1kawy0mOBalX58LmY4rer6E0krmTBx3wtlI7JwCmINaeCJLlkm8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q9LDdlIa; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q9LDdlIa"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84874b52eabso5938449b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 04 Aug 2026 05:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785845483; x=1786450283; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JkdEkpDmK/siHWbsxxW9Vf3NMr3wTKTZgRi6uSb9CHk=;
        b=q9LDdlIaB3tlCPWLuarYFLS4yiPzkufnU/Y8PTSbP5MyuwEbon7H/R/1v9N9FS6Ouz
         Nj7GCHFOXc3riRD0rf9dhh6hQM+doBc2QvV1wr+pIOReWTqP5GLkjYNkUzq7XMTKwqZD
         GipOoM28Ad2dyCaZawp6I5d9SL2juK3cEeZKn/Jxq9WVgywQKDS1O8+P2OMPoY7yFWoO
         /rx3KUXF+6BAjTKC82n7fu4UoNDRP9UMqii3ufRjU9vhevWNMSyVGT5/O9fujpqFjJPv
         3XklA+NDFPqWUL4huutP+cS81NYyTE0jqMDJS92Kz03iRogO0oUR8xuyHFzCDdQpyL+S
         GN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785845483; x=1786450283;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JkdEkpDmK/siHWbsxxW9Vf3NMr3wTKTZgRi6uSb9CHk=;
        b=dxM+/0KrKZSE56zFi3IkpxUGLipPjBBIEIUuHNpkctTvp1dyx3CLo96ecOH7bd+2LJ
         lsHZnDly0ctenW6lAZKYDO/SRxfhisPl3qbg2IrrM1CF0nSh6WwBxniO4YXgVS+XqcpF
         lHpeefqqWK68VHPXAOjDM0NGokCLngka4Oi6IDR7dd5H1TF46VCQQOsKHLSGj+9ATTyp
         ZkCzz/jvczG5tiesbD9rm+rTlCO3iXySYx4P4cmzxlba5dXEGwr9g9MsGYPWcCS2Cw8k
         OJPB1uQpYuTGHXa8pwN796KeDVmyXFu+AooE0WQHmmFG4CUaCAOQMgcafCllSa5MYsal
         OS4w==
X-Forwarded-Encrypted: i=1; AHgh+RpAJ6647EPJq1FYl13vg7ZkTx6ZJarco3Bz8zaCAuBcT3Jz4ikDxBlyYU0dYss9N3KbZw7Z0czo/XORdSt+@lists.linux.dev
X-Gm-Message-State: AOJu0YydbhegmRyIK2I7Ow4LJu21t/4Fv7fpb0jAv9TNUEUgvnJykX+P
	5IBrycCHhlSloRlUuhgkpTeX4D4ewLcTesVuxnDnXQF74j5mGsuctlPj
X-Gm-Gg: AR+sD13kqdbpczkBliii2uSjID1ncPWrt2+SM5saz8bqeGvTB9I7zuH9TskDkesgBaK
	VXs9Ee4B+7e3SHVss3ImUo6Hh23+wMxqry5ENjIq/jkl3w/7S0bImDwmz/Fx52kB18tcbqD2rkd
	OuEgezD8nODoj5RYy2dkxw19l3dyzu4ATLlPZW+ObHVdSLhCS7ERx/iUEEFRU0A9jeyaFW6Or5r
	SW4Q8hhqur7tUWlBAO2bOufI9kPSgGkAq+U9dN3me2pxBJUVygEmtOui4RnrBEgHv2/dHsbxpPO
	ZGmqqAdK1jlMZY2cpGJ7ah2XL8WjDDlsJdChMDevx0YnNlL3SlZGQUw0EzZ7gPOOkUqFR6ZO86L
	nR8O0Ys7dCAdp44jQS8qGIW1Mn+17t71zcT2mP8eZlDATsZtO9VKetFLKgowsvdryhAbFtIRjxd
	gJdzestRHVAikruZS3xaEq3A7aGEFbrXZaj6hta2FE5cuCUbdcS2YBRQ==
X-Received: by 2002:a05:6a00:300f:b0:84e:2bb:2d3e with SMTP id d2e1a72fcca58-84ee47e4825mr13869945b3a.9.1785845483364;
        Tue, 04 Aug 2026 05:11:23 -0700 (PDT)
Received: from localhost ([172.216.252.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc2d7c03sm5029337b3a.50.2026.08.04.05.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:11:22 -0700 (PDT)
Date: Sat, 1 Aug 2026 00:23:07 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] staging: rtl8723bs: clean up management transmit
 return values
Message-ID: <am0SO51R2cyCfm9j@stanley.mountain>
References: <20260731155228.22526-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731155228.22526-1-dennylin0707@gmail.com>

On Fri, Jul 31, 2026 at 03:52:25PM +0000, Hungyu Lin wrote:
> This series continues the cleanup of management transmit return values
> in the rtl8723bs driver.
> 
> Patch 1 converts rtw_mgmt_xmitframe_coalesce() to return kernel-style
> errno values.
> 
> Patch 2 propagates the new return value convention through
> rtw_hal_mgnt_xmit().
> 
> Patch 3 makes dump_mgntframe_and_wait() return void, since none of its
> current callers use its return value. It still uses the return value
> from rtw_hal_mgnt_xmit() internally to determine whether to wait for
> completion.
> 
> Changes in v2:
>  - Clarify commit messages based on review feedback.
>  - Make dump_mgntframe_and_wait() return void instead of converting it
>    to errno values.
> 
> Hungyu Lin (3):
>   staging: rtl8723bs: convert mgmt xmit coalesce to errno
>   staging: rtl8723bs: propagate errno handling for mgmt xmit
>   staging: rtl8723bs: make dump_mgntframe_and_wait() return void

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

