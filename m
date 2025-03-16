Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FDE3B7A4;
	Sun, 16 Mar 2025 03:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742095905; cv=none; b=NDTuXj65V8+nT4R7I8rBEB0vE0ZavvxVonWraQq6cEPjSMOm6/G2vnFQp4fQ/tFnhv5Sodc979xUjiQzg3WsDae45cXtvTJSPxEBLW5cdsAYgjLpL7lW/f9acs+mMeXG7FnKOiNZ6clJmZYwLOxd9r5QEDP/Ry/kBLQn3isgUxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742095905; c=relaxed/simple;
	bh=pD1Yck7ydAIpMEylqYKXsYLm81BbZCKaQWMdqrtkrqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJcdq8+7LAM7TvC78wjN3ZsgBFtfGf/R15LEF6U69v3VzJ259w+zsE093F+PeoBFGkwQeBke8ORph+rPYoMDIxejR3xWGXMI93woPVRLDmAmFN9HBSaG7miK9hLOM67RN5BMGwK/mWqvGffZVcVVmcNhBt6EvfIdIucES0aR6Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kCB6fe9v; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kCB6fe9v"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2260c91576aso330165ad.3;
        Sat, 15 Mar 2025 20:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742095903; x=1742700703; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pD1Yck7ydAIpMEylqYKXsYLm81BbZCKaQWMdqrtkrqU=;
        b=kCB6fe9vo88IzbMTRrnkD4tH96TXAT3cCMpZP1RATpXIdcjuuOf3M8PynuA3GEmXqj
         hbqZ1K2vocKVs17dGwSB+qHPX9chZ29X6UxNsfzCU+lZX/BxXURNG9areBNXnObyqcry
         98wbXjupfDxyX3YT1iw+ag1tz8abgzNZEaW2QTMFZOuHhXVZZR7ThHkWj3L0IzA4N5Lu
         iC25RalyNrCmoEMiLkpCtp1gS/DPFxJ7b6741fs+Eu97OvloHB02qY7DY6AkbPutDXCA
         GAvR+wj5zOMQe0tELrISO94xUQ6dyNCIfZ5a8bGIxZU4OxTA8+O5c0X0cl1Ni+pN2hAI
         SOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742095903; x=1742700703;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pD1Yck7ydAIpMEylqYKXsYLm81BbZCKaQWMdqrtkrqU=;
        b=JLkW2ucUefJM/nOPAd7tIRYuy3UUj50emiC6zPsFrSnD6Qqaa6N0wxzA4QLBDFHyHQ
         gyLoehGmQdyzQM+qiEBq+nTsFl/6HG/qn2E/+viO7jgnEn0iJ9FnqiJlSHu2CzEQLPBo
         HEPWiGdmlmPwq+5d0uduLnGnv+folEfBUlCR3TXf7Qv9KP/AccEK47sBKllVrB72lIE9
         hgKMcBOpwnJapMFZcNqK+Oc5QknGZohPw+iQXhdJhAyxhloSJrOcaUP2KNMoZ44wwWRB
         huDAXbihJLk766czqgdpQaIInMLUvrFrpEJZv29jdNrRd9gsfp+P1GChO9Ita0e1kLXr
         eXJg==
X-Forwarded-Encrypted: i=1; AJvYcCUX/cV5vyZ2EM9ItyF4aae6tvqWCryYRpmZSshbHmCrlk9LWkd2IU+c0H7D7PvQAnVrpwZxGMMujOG9Yg4gjg==@lists.linux.dev, AJvYcCXmufoXGLnrFHeFKk58aTp5fCzlDmXjODckQSha0r4vpc7+HpTWCsrGhcqtWvMPh3ZK1VUkmg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxfWnfwsV0qJ8/GZXF5Pi818YhzdtNv3GITd/S3t6SVh7EDPrYs
	z9QxSeNdrVD2p/pleMZ/WwtW2gebEAUlhreveFlUBHmg8JHUshA1
X-Gm-Gg: ASbGncszy58wzP+6zc3r+L6v8J7BVCW/IOsvQ3OnfE+pTyO4mo08NljQWha6ES1VayS
	lQh/DO9LpV5OUOxu9f7vZTD5UyLwYLXj46v6H8+W+vkaLXmRbUeHWysBQ/BmeVL+OI7iVFDdBBW
	qCuS5j8Mm04jSrIuSiUv7/1h2v7DtLAoNJhnfskbulmq6TJWgHH9/V44PANWLhbdY/Vu3FGWFcB
	aPfbksKlccTSpcvXB4+cI8wvuNM5Fc3Ixq4Cvszwfo6jHhr8HPl2HFJBaLRTnNLLNjEfhKga2V0
	7wmKYa9spsDIZerwneGow+E9ZJWJQQ8/+XZ6P7RMzmoNKNIb9RZzyH+UkGOHLyY5
X-Google-Smtp-Source: AGHT+IGpbDM3YcgmMRmMt+HOj3GJEp13IU+ynAj5/Sp7d74TkBgUMj23JdRZJfWsImx58hn63y8Ijg==
X-Received: by 2002:a17:902:e884:b0:223:67ac:8929 with SMTP id d9443c01a7336-225e085b857mr107024325ad.0.1742095902790;
        Sat, 15 Mar 2025 20:31:42 -0700 (PDT)
Received: from eaf ([2802:8010:d581:4700:c99b:1600:cbda:3005])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbfb5asm51134575ad.209.2025.03.15.20.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 20:31:42 -0700 (PDT)
Date: Sun, 16 Mar 2025 00:31:33 -0300
From: Ernesto =?utf-8?Q?A=2E_Fern=C3=A1ndez?= <ernesto.mnd.fernandez@gmail.com>
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, tytso@mit.edu,
	dan.carpenter@linaro.org, sven@svenpeter.dev, ernesto@corellium.com,
	gargaditya08@live.com, willy@infradead.org, asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [RFC PATCH 0/8] staging: apfs: init APFS module
Message-ID: <20250316033133.GA4963@eaf>
References: <20250314-apfs-v1-0-ddfaa6836b5c@ethancedwards.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314-apfs-v1-0-ddfaa6836b5c@ethancedwards.com>

Hi Ethan,

I'm happy to see your enthusiasm for my driver but, if you want to help, I
think you should simply send the changes you have in mind to the out-of-tree
repo. That way you'll start learning the codebase while I can review your
work and run xfstests for you. Filesystems are very dangerous things; I've
probably done a lot of damage myself back in the day trying to help out with
the hfs drivers.

As for upstreaming, the driver still has a few rough edges, but I don't
think that's the real reason I never tried to submit. I'm just no longer
confident that filesystem compatibility is a reasonable goal, and I don't
expect much interest from reviewers. There are too many risks, and too many
hardware restrictions these days; regular users have much easier (even if
slower) ways to move their files around. Other uses exist of course (like
Aditya can explain), but they are a bit esoteric. Of course if upstream
people disagree, and they do want the apfs support, I will be glad to
prepare a patch series.

Ernesto
