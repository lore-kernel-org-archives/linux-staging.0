Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBE414265
	for <linux-staging@lists.linux.dev>; Wed, 24 Apr 2024 18:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713983610; cv=none; b=bYoko/e6suywIseIgoFPwB8IXu6rDJcgMYpzLcmSAZNy2NN0wogoHJYrPWXYDW7ilWnJen0rZHaKSdq0fLvfVs/Q2oJJPrjOUJ9VZ18RddO233ntpHymvLYoTBAIcxlmaumR7DntIsVPpFhiNooOtFiK2jWSJDXs9Hmgm4vOJMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713983610; c=relaxed/simple;
	bh=kHEzDIv3XUVBHeAWKXNAdviJULHuAQPFpdGHRXmFYH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=YXYVzo19nq3oTvLGC6rMUELG8k9/FPIHIKVflKGRncpgIMtKdRLD8Hcgy89NAxAF6RkGCAb0sYX/aBaFBMgqtjPcnQjYa9xom3D0d5n4klkSSu518ZFOSObuW7jLhjZH61oy+vlIDvtCgmbm/VTAo0+3gvIpKnHCcJc52ZKhgHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QmN5x2K7; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QmN5x2K7"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-570320bed10so13084a12.0
        for <linux-staging@lists.linux.dev>; Wed, 24 Apr 2024 11:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713983607; x=1714588407; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mymcTcoFnmfCuBd9tSV1M+VIzBLDz8u1np2D12YjbSY=;
        b=QmN5x2K7HVsv7NTE/NQEqg7Ee3cpo4hRkZL85//rHdHHoj352tyuKTq2VpELAGXNJg
         wt6R6P1fh/DKXbKFcWT+6eg1p+LB/L+gUQqh37XwQKueXSsxvr/VVK9suR8OO2NW9Ad5
         VXf348rHmCfMtoXo4Wv9uPUbsI2NQ3LGD5kenS+nHurUmey4p8pcWbuWD0CvpgkJVFfG
         vNXvjOr9WRPup5LXTMTAckay3pIs1CMeOJlWenqKmm1xvU3v2qcJ91c4qTI6c7C9Z9xH
         +86e29+325G0q3nvaNuo8m12UhW7LVC7QlFejk2Dlyag1fDYC1GWEyfCjcEhs2W4esR9
         /0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713983607; x=1714588407;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mymcTcoFnmfCuBd9tSV1M+VIzBLDz8u1np2D12YjbSY=;
        b=BlYoOMNpPHRz1mAzjTcfdb0eiJCD0bukDkG6Sp9snMk40ecKLgEM2fDB2setrVUA/P
         w+5Hi4Trc+bLXZjq/ZMl481SBCG2SvT+KNyKjqfkT2jD0KVPQ3VPGrChEhKT5/dMJSiu
         4RR37mDrMJELgPCkV7tEg23MwApwt1f2jZ6QFgBizhb0kdZkQaYxZJisRmewt8Rs/b/U
         wPmHaDCUKEsOpBcUpWjbPWoo14y9goIivck8oMKDFsrQH9CRmm8eCWfh+ewzl+CYuH2o
         DdEOGrsVHq7O+kk2zaUMkxz+Nlk7gn22s8QP+wyUm9z4klfPEexWjmk6AEQUBXxaB7Qk
         W+4Q==
X-Forwarded-Encrypted: i=1; AJvYcCX4r8janXDh7PrMbBh8lTsSFXkL+M2v0AMP6yBK1ydb2lmDHBxIAmFB4jKojIWg73UaB8SU0KQfxpK5QmbebNFxZ7VSxu2hILK3JKA/+Q==
X-Gm-Message-State: AOJu0YzLLGN6C/ZGMdp3FweTQPndXdTCuhwtqb9ERmImFvfC7Kw/AtKL
	KMS1FJ7qpFNBMAGhzveX6hSmmd3Ku+9TXib5HY/y7ZlE/t6TgD/7
X-Google-Smtp-Source: AGHT+IE9WvvwGZMCcIImCTKQ+CZB4Pk3J+Ehqq7A2TXWkBPqei7QD2l8gfXMiDVCtONY53pQNY2vbg==
X-Received: by 2002:a50:9e81:0:b0:56f:e1af:58ab with SMTP id a1-20020a509e81000000b0056fe1af58abmr2749373edf.4.1713983606461;
        Wed, 24 Apr 2024 11:33:26 -0700 (PDT)
Received: from [192.168.0.104] (p57935690.dip0.t-ipconnect.de. [87.147.86.144])
        by smtp.gmail.com with ESMTPSA id g22-20020a056402091600b005721f9fbb60sm2265577edz.63.2024.04.24.11.33.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 11:33:26 -0700 (PDT)
Message-ID: <78b521eb-4e89-4c01-8dfc-1fb990e6887d@gmail.com>
Date: Wed, 24 Apr 2024 20:33:25 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [RFC] staging: gdm724x: How to proceed with drivers gdmtty and
 gdmulte
To: Jonathan Kim <jonathankim@gctsemi.com>, Dean ahn <deanahn@gctsemi.com>,
 Won Kang <wonkang@gctsemi.com>, support@gctsemi.com
References: <f82fffbf-a983-4ab4-897b-b5a810426f04@gmail.com>
 <igi27iwrzg3ovgj3sym4gsi45timpkt4vkl5ss5dbftdzat6p4@ctxcjocvunpt>
Content-Language: en-US
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <igi27iwrzg3ovgj3sym4gsi45timpkt4vkl5ss5dbftdzat6p4@ctxcjocvunpt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Sirs,

Won Kang contributed a driver gdm724x to the Linux kernel staging 
subsystem in 2013. Have you done any tests with this hardware in the 
years up to today?

struct usb_device_id lists the following devices the driver can work with:
PID_GDM7240		0x8000
PID_GDM7243		0x9000

but on http://www.linux-usb.org/usb.ids I can only find:
0x1076  GCT Semiconductor, Inc.
	0x0031  Bluetooth Device
	0x0032  Bluetooth Device
	0x8002  LU150 LTE Modem [Yota LU150]

I am asking because I tried to find a test device to test it. That is 
difficult in 2024.

Do you think the driver can be removed or should it stay in the mainline 
kernel?

Thanks for your response.

Regards,

Philipp Hortmann



