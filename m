Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDBD4204C
	for <linux-staging@lists.linux.dev>; Tue, 21 Nov 2023 21:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cwtzLG3b"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-54373788ec4so1477613a12.0
        for <linux-staging@lists.linux.dev>; Tue, 21 Nov 2023 13:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700602790; x=1701207590; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ErP2QbBSryU90jbbhUT9w3qIH4Nqm8yBb72ux6w1ytg=;
        b=cwtzLG3bPtl4w2t8AJVLoGIY5DILtoNy0+C3jKRxV5A+x9DahVLcOB2SwkQQYfT5Jp
         SdEPP4U69f0dKPhROI8Tc29wjLuNIRmuRkQACF4M6M9y7GKROlQn3oRxCvDTejFVjs3T
         MhJbIQy1wqmTH8hCfqd5vfO23qYQ9WZ2dj9dipRdo/G/IVnHyGJfwH2PnuNBFxQBStuA
         ihdccVncTAtXgV1xZxXqT5R2ulgLbJAQnFPEPdURZzsIEk56JtzDE51N5vc4VqOlxi8B
         EzRoXaaeh47r8wlrfo7KZuQAx4iEatT7vq4Y4uxgcBHdNrwayNY/YSLNU5tYD5SNpgS7
         TjWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700602790; x=1701207590;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ErP2QbBSryU90jbbhUT9w3qIH4Nqm8yBb72ux6w1ytg=;
        b=DF7Y0QdKLNZmQjA2Wmk5gmMQJxJKfTi5jI8lQ5d/5R696zMXJ86aO9BPTIegt6/18s
         q1U51RhLif31kmqkoptKbGyFEShOK2TzMUMBVd5nIYyEcly3fCoKrPGXQ0NED+3j8X/z
         cRQzdlniQqDQWuitWeJH7Ng6U1EPBOUIouNgvmlgwQr6K0/52xaF8cTxhKBsyo7vOTaM
         QRG9uyj8GS8LwrCnXOKyYcbNaJVKh9vvxu3XGAQd+RcO9k0kmYkTiUrHaPRkAhgOoMaT
         8xqcDwwgXuNVKTjUcNm96m85ZN8ACHNi6zdaLg+6UnMti6NVXGeTfxhyj5pmYPhayiIZ
         HXqA==
X-Gm-Message-State: AOJu0Yw4HVeVmKne7SEadhTBN31WH5hRWwCmpQDlnO1vUTfwjkg8kvUp
	mfTFmL7/VcZxEBz6Y4iHvtY=
X-Google-Smtp-Source: AGHT+IE3eASFefohbz6YfGH63DNUdruC91vTO+VWFsUrK7HjURzQLhpeO1KSldfpf4U5iASxSjC9aQ==
X-Received: by 2002:a17:906:74ca:b0:9dd:5609:55b9 with SMTP id z10-20020a17090674ca00b009dd560955b9mr187091ejl.2.1700602789518;
        Tue, 21 Nov 2023 13:39:49 -0800 (PST)
Received: from [192.168.0.100] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id cm42-20020a170906f5aa00b009ff8f199f21sm2443879ejd.19.2023.11.21.13.39.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 13:39:49 -0800 (PST)
Message-ID: <4004f37e-66f8-4ba3-bfa4-41235e979043@gmail.com>
Date: Tue, 21 Nov 2023 22:39:48 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] staging: rtl8192e: renaming of 5 different variables
 patch series
To: Gary Rookard <garyrookard@fastmail.org>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20231121181435.9337-1-garyrookard@fastmail.org>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20231121181435.9337-1-garyrookard@fastmail.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/23 19:14, Gary Rookard wrote:
> Hi,
> 
> This patch series renames 5 different variables from
> Pascal/CamelCase to snake case.
> 
> Linux kernel coding style (cleanup), checkpatch Avoid CamelCase.
> Driver/module rtl8291e compiles.
> 
> Patch 1/5) renamed variable from HTMcsToDataRate -> ht_mcs_to_data_rate
> Patch 2/5) renamed variable from TXCountToDAtaRate -> tx-count_to_data_rate
> Patch 3/5) renamed variable from IsHTHalfNmodeAPs -> is_ht_half_nmode_aps
> Patch 4/5) renamed variable from HTIOTPeerDetermine -> ht_iot_peer_determine
> Patch 5/5) renamed variable from HTIOTActIsMgntUseCCK6M -> ht_iot_act_is_mgnt_use_cck_6m
> 
> Regards,
> Gary
> 

Hi Gary,

this patch series needs to be a V2 with change history.

The next patch series you are going to send is V3.

The cover letter of your patch series seems to be hand made. You can use 
git to do this.

I am using this command to do this:
git format-patch -o ~/Documents/kernel/patches/ --cover-letter -n 
--thread=shallow --to="Greg Kroah-Hartman 
<gregkh@linuxfoundation.org>,linux-staging@lists.linux.dev,linux-kernel@vger.kernel.org" 
7b88c62d3cc5c3fb670b5448c7381c7c099b3518^..HEAD

There are now 31 patches pending for this driver. May be it is a good 
idea to wait until those are accepted or rejected. May be this is 
happening on Thursday morning. Or you apply the patches before you put 
yours on top:

https://lore.kernel.org/linux-staging/c464f4a8-753b-417c-97bb-7aa29ab5bf59@gmail.com/T/#t

https://lore.kernel.org/linux-staging/cover.1700296319.git.philipp.g.hortmann@gmail.com/T/#t

https://lore.kernel.org/linux-staging/d911d509-8677-444c-ad7f-92dd141e8e1e@suswa.mountain/T/#t

In case of question feel free to write to me.

Bye Philipp
