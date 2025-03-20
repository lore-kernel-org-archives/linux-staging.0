Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118521C3F34
	for <linux-staging@lists.linux.dev>; Thu, 20 Mar 2025 05:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742449171; cv=none; b=OCUH413p2muHTNFjRsR7agHSoOi4Agk+u5xQ8AWqGqLGWpG2ZUzdbdBUcBLvmRwvoPHMzWe0VDRhhm+3HbDlMn3qPMkko+/vUEcQI1ibTduBk354r+oOBqVCwpMjJimCTFKE3g5opH5P4A4mD/iFA2prVij2Lj85O2B0d1Uy2qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742449171; c=relaxed/simple;
	bh=HSCSKfhfDD7I1zTxBolH/tzZ9w0jNV+XNDv1/LCD76o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OaXoBejeTS+SiYxgbHunHr309KqNRtoOdSAaG5buTkoRyn5qrvF1b76QvNa/SH278jKOtxTUI1U6zQNi0iZcGpv6aNPk1Ks2JfTrTH7pXgpo4wOoM9PvZjyPCAbtiF02Doq8LmbDOrNxEejwcPv7ioU83vNvu37DNw5Z66OEJ5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ME/UOifP; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ME/UOifP"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-394780e98easo177040f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 19 Mar 2025 22:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742449168; x=1743053968; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T1xfmCIlDCLZv6ta1QqTTHp5D0zhqGln1AOW6eZ+4nQ=;
        b=ME/UOifPB9KvG0ohGdD+ACUiKU5S2E57LG8Cd4atKuUWD+dGqUcDxzNNVDBMx7zvgT
         W8rlOm+ERDsS3NgyqbmkMVdfC1Q4Rf9cEMcScJy1oHpL0DgOFeeYfG+Pgw0tuJ1/1iab
         7nEKKfeoWHat9qXXgdlY2wb1gzWFFwx9dFePeIjzFycHLwGlleV24S+ZNJAV/IgCTTdi
         8hKOTgBaT2VcmdVhEulMFEmiodRlTva8Ib23U+TKTY5QDDxvnNR92YOoOLuqx0qQ620d
         FW5aScYhOQD5JHzhTtdsXey9E0sH+6juY6DlwMdxNekP6Yott9YuLOZh4XB48nogjb3z
         6rWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742449168; x=1743053968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T1xfmCIlDCLZv6ta1QqTTHp5D0zhqGln1AOW6eZ+4nQ=;
        b=FiIc8nRcvKcVPQcFZqc6zLu4Akpn3oxFXpDvAtERQSpmHc21BQHLniuyzK9ZrZCVKA
         4B+YXFGIMUtrIS9pSqcYFGB8+PuwM/ImeNLjeJOfhEnp5lxWp8e6AOs6GdZ31zjPrzC/
         PR8H1zQyG0aaXrnw8BcC/nupiQPvm8PxpfrduVhOUTkf44c5uYIDR3dCrd9sJ3mBb5p6
         Ud7tswHIA/NrD/eHvDZ5hZo6xxGV3shTFMzmIEwPOFaqar8Apw7TiJ9qExsbeWw9amiu
         DxuD6rqyOithsEicQekxs4XzmkBdpSJIue1u47rl2a8AseowzwKMZ46nnjN5vgnWEju8
         AmpA==
X-Forwarded-Encrypted: i=1; AJvYcCWSmEV/t62M4/RduotVX1RQ1lkXCKkNyXNXy4HhPep+ugmSedDGDpepe7r7KYrr2ViEHeaMOLOXS/WYMTfk@lists.linux.dev
X-Gm-Message-State: AOJu0Yxkl/cftc357ri6fcaapE6rgCc/WHwz9VorNRJa5g4GZIwzEhBQ
	MbgPU3k+4mWiT1PlxNJFYwA2U3YcMbyuRY8Q/tAyarxncEKvhELHNXgsqn4lUVs=
X-Gm-Gg: ASbGncuzR6x9vVON13O7XUXMXIUVwXhth1cmBfs5ihW1BKfpXrbRhdasIj99l7elotx
	ZXxZHjXrEyooMuLMZCXD/4xk0MNyl5EjHp8f0lm4G+a7b8tMQWulRY5GSv9JKyJ6BQ6A2YYLBgF
	kzArEuKnuZdjvOifjBfvg65ZhXbmoCQfO+z8QJNN9W+r7np4rmDlmYbkFFaLW2Jvqeo3oeLPRNZ
	okhZVi26AiNxVuo4KvdcGAqdD8lr0iLjYS8DdT8ScrTAc+ldvM4cJpsJY4Xl8CH/aNiXf4gHbqe
	SLiR72auHHqKe3Z2rqgDU7UN64eng5B8YxZ3Htn0ln8+fBVM9g==
X-Google-Smtp-Source: AGHT+IGQzpC9EimzyS/t+4sa9m1WxjhJGJdtlCwpcWgQVOt2GkYCyDGik+tts44dUuzfVSiwyZSIYA==
X-Received: by 2002:a5d:5888:0:b0:391:231b:8e0d with SMTP id ffacd0b85a97d-39973b32bb3mr6150923f8f.39.1742449168214;
        Wed, 19 Mar 2025 22:39:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-395c83b6a10sm22976809f8f.36.2025.03.19.22.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 22:39:27 -0700 (PDT)
Date: Thu, 20 Mar 2025 08:39:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: brauner@kernel.org, tytso@mit.edu, jack@suse.cz,
	viro@zeniv.linux.org.uk,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	ernesto.mnd.fernandez@gmail.com, sven@svenpeter.dev,
	ernesto@corellium.com, gargaditya08@live.com, willy@infradead.org,
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [RFC PATCH v2 0/8] staging: apfs: init APFS filesystem support
Message-ID: <541236f7-adb5-4514-a888-19fef74c14f0@stanley.mountain>
References: <20250319-apfs-v2-0-475de2e25782@ethancedwards.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319-apfs-v2-0-475de2e25782@ethancedwards.com>

I don't think this filesystem should be merged.  The real upstream
is out of tree.

regards,
dan carpenter

