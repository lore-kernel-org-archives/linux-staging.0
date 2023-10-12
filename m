Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E0520B39;
	Thu, 12 Oct 2023 09:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FCeYea39"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5a7b3d33663so10295627b3.3;
        Thu, 12 Oct 2023 02:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697102237; x=1697707037; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v6dAMz+0PBoS2XhVtGEyBlFK0C+DlTpY1GdaToHa8Jc=;
        b=FCeYea396gCZzRMNaSfw3kLUhXddYZ3GtHoEx+puCuPgObhyGGWhvaXf41WRlqFOzC
         SWM83Vmtx1EyzXsOd3PyDvYPJua9bPGuJlZOlaSyl7D5VcDxJQxo7yTPlf4WsDPdEtWz
         0Iol5b+P+aEBHaK8J/F5Mi2u8CZq0Fa/VVZSKrZTyJcXSoHwK9E7fxTkV+KBCUdtB4oC
         XLUc8f1cuhNRG7k2GM72qyR/yN02sMtCvVsErdSHh4Bq9jifP3VvgLDi34y0vPhrk12a
         zzrjSEkyLOKn43qldk6cjxrrHOzrmRNgAurdhL+RO3K/mC2O+6ziyNZpzuPDRWJqNGRw
         S21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697102237; x=1697707037;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v6dAMz+0PBoS2XhVtGEyBlFK0C+DlTpY1GdaToHa8Jc=;
        b=NJUNnnUmT17LrjXBOefVckDewhN/+iMaMJrq3c/ojdfj2lU5PPrd7HLlefB/2OzKPQ
         3W/h65qfXbImX025I+c3VjMGZ+6gdLWZRJK3ws1SpOIzRd/+gwfY+Y/aPmYyed4GRKX8
         jhBdHtvFZq9iCAlYLejugZEDubV/K2ObRzef9bZr/F4hDLmZTUUm1+myR5G89DVnJw2E
         H4jkiVXZFtZLMB11yoWPRByUTozDhgPc0d54Xym6POcE3+Jo9wOiIOYtjMze1edtTcsz
         CFjwrMCU5fNtvd3YA5ox9oFo6Ucyk9oTvnQrUEQb0K791MU4NDMb1gjU3uzSlLJKkK5i
         CE7Q==
X-Gm-Message-State: AOJu0YzLGRHjhZ6ZnSl1Phu15F8MiHLV0X2kR2EH5ngSSi0js4fEVnyn
	PEmWuR1wR61svV413hhcCL8=
X-Google-Smtp-Source: AGHT+IFuQMSMzJzJH2GkD7eihBN8OFvYqFcC1HGLtYAHbbnx3UQ7tSCfZ0ufU5iKSpJBX7SkHxuqpg==
X-Received: by 2002:a81:6ec2:0:b0:5a1:db6a:6459 with SMTP id j185-20020a816ec2000000b005a1db6a6459mr23340529ywc.40.1697102237316;
        Thu, 12 Oct 2023 02:17:17 -0700 (PDT)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id i1-20020a17090a2a0100b0027669cbc30asm597246pjd.1.2023.10.12.02.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 02:17:16 -0700 (PDT)
Message-ID: <1e2cfefb-c4dd-4611-867a-2b2e9e5f7467@gmail.com>
Date: Thu, 12 Oct 2023 16:17:11 +0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging/wlan-ng: remove strcpy() use in favor of
 strscpy()
To: Calvince Otieno <calvncce@gmail.com>, outreachy@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dan Carpenter <error27@gmail.com>, Archana <craechal@gmail.com>,
 Simon Horman <horms@kernel.org>, linux-staging@lists.linux.dev
References: <ZSeD1UojAgrsOh16@lab-ubuntu>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <ZSeD1UojAgrsOh16@lab-ubuntu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/10/2023 12:27, Calvince Otieno wrote:
>  		if (j == -1) {	/* plug the filename */
>  			memset(dest, 0, s3plug[i].len);
> -			strncpy(dest, PRISM2_USB_FWFILE, s3plug[i].len - 1);
> +			strscpy(dest, PRISM2_USB_FWFILE, s3plug[i].len - 1);

Is this strscpy() behavior same as previous strncpy()?

-- 
An old man doll... just what I always wanted! - Clara

