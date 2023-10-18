Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E791179A4
	for <linux-staging@lists.linux.dev>; Wed, 18 Oct 2023 09:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hpYqZ7xC"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2c523ac38fbso42803101fa.0
        for <linux-staging@lists.linux.dev>; Wed, 18 Oct 2023 02:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697621482; x=1698226282; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5QjheaEjRfKcRJsWNr6c0V1v0c9oT2H9QVa83EftNSs=;
        b=hpYqZ7xC9MN8P1TJCjFHpycWUenN6wIh6DTG+mooaq+XyfuU8IggfP4uGEJApqjoUW
         80RsObysAaqD5IMiD2ThWLMadW/Ce3XDNDXtcg0hEudhGqwHPO2OTRsJNKrA4rO8vJmy
         F2aT+Q1JGAL94CTbaEeSF19ivGHChNX9gJfxcvSRG9QzD7lpsX0TEbOORsIf2e5iddCN
         mJslVSFzjAXaLhvn0lldmQdJzozlDFYj/xPQQ9uecyt/m9N+JNLVjj6lHN3eaWTryZbd
         8naTcERrjzNxl1pkjTYgAA9izFTsr/TfsJwAFUGRc0bFmp96XPuH1bgYXjq6jGAMPABT
         ZaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697621482; x=1698226282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5QjheaEjRfKcRJsWNr6c0V1v0c9oT2H9QVa83EftNSs=;
        b=iRet9hUiRA/UV/zDiYqss0//wty24eEy4F39TTmKo0MrblHiOmKodiYRL/rVC9ZVKR
         MlSaUD3upIDfqKGlpEeb122shGJJE1mkobWedeAtWrIo5QKBZ2sav/J6rbgAQMpcrR4t
         XjepX+P22tBkgUrT9H0FoT2mKKnDrTT5muFAxJ6BbXcn6VEwd4mnxDzRJu14tPxY9meH
         rpbSTWudNl5g3vkk2CW42OlxwmWbsUpzv0YNcGEXScQtPtZGQPjTicfOHYb15/SFQXl3
         A3nVUMhvNvz/yJv5vQ10f5bxEeV6sCGJhKv/iygT/niDZw3FDCyI1bMdI0ViIor9p8O7
         /uyA==
X-Gm-Message-State: AOJu0Yz4bMwsya+ISq9bhxoatMS8saogj2Umy4ZAm8ILJI9Vw82E/B+I
	GdRwhd4BSPTjxR2CW5q2uWkwyA==
X-Google-Smtp-Source: AGHT+IFHc/k/rIU+sAYuQvOHqwFIxrnmxpoL8ylYokPeKwjOidRYHM5IwFIWSNd3wG8Wr8cIoMs15Q==
X-Received: by 2002:a2e:9c51:0:b0:2c0:d06:9e65 with SMTP id t17-20020a2e9c51000000b002c00d069e65mr3332079ljj.8.1697621482061;
        Wed, 18 Oct 2023 02:31:22 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p12-20020a05600c358c00b00401b242e2e6sm1171689wmq.47.2023.10.18.02.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 02:31:21 -0700 (PDT)
Date: Wed, 18 Oct 2023 12:31:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: Dorcas AnonoLitunya <anonolitunya@gmail.com>, outreachy@lists.linux.dev,
	julia.lawall@inria.fr, andi.shyti@linux.intel.com,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Staging: sm750fb: Rename
 display_control_adjust_sm750LE
Message-ID: <d219a6b7-0b59-4894-a0c3-01e286f6a132@kadam.mountain>
References: <20231018080416.25931-2-anonolitunya@gmail.com>
 <870b9b74-75bc-2a0d-7138-ae8df237f980@intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <870b9b74-75bc-2a0d-7138-ae8df237f980@intel.com>

On Wed, Oct 18, 2023 at 10:12:19AM +0200, Karolina Stolarek wrote:
> On 18.10.2023 10:04, Dorcas AnonoLitunya wrote:
> > Rename function display_control_adjust_sm750LE to
> > display_control_adjust_sm750le. This further enforces snakecase naming
> > convention for consistent naming style throughout entire file.
> > 
> > This change was suggested by Andi Shyti <andi.shyti@linux.intel.com>
> 
> You can use Suggested-by tag here, if you wish (as per [1]) before
> Signed-off-by line.

Yeah

> 
> In the first line of the commit, "Staging" should be lowercase.

There isn't really a rule on this.  People do it either way.  But, sure,
in this directory it's a 404 lower case vs 51 upper case so better to
follow the majority opinion.

In outreachy people are way more strict about some process issues than
we would be in real life.  And that's fine, because it's an educational
process.  I just worry that there is a certain amount of bleed over
where people start "correcting" people who haven't signed up to be in
outreachy.

regards,
dan carpenter

