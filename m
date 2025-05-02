Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BAF19DF41
	for <linux-staging@lists.linux.dev>; Fri,  2 May 2025 07:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746170185; cv=none; b=NtJhW1v+8nmo8+tI5YoIvSXZ/H/xkw4tH4mNNO4sPmm/bKJyvie0bXfuNLgVWtoGs3Q2DDaodmLvSdujoaSSaTPGT9WBzPlPizrWBKGso+rhdDbuPf5tcqI5nJSRoXN3gO54h2J9A59L07Brt+8z1u86/31klc5RZtcRYfCjd3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746170185; c=relaxed/simple;
	bh=TEn8q9fQLQPZ4XryW0ZjyzXlzHST0D5QNErlYACy7d4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UpVw/wx7DARxpS4I0lDQ5STWXLUpRhJx0GAToad1uMrXU1fO0eu0tfFkSQ51RvZjO61uBLAXGxmSrfRJq36kSUrIVbobH6NCqraIPbGG9bk3Zi4wFlFATWRbC7VEwQlwr0B607GA7RNEXK7ABeb3QyVbWs00Trdvi0nAPHyGRYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WWCxI61T; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WWCxI61T"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-440685d6afcso13100605e9.0
        for <linux-staging@lists.linux.dev>; Fri, 02 May 2025 00:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746170182; x=1746774982; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gBU2uNDQCYbDHEbrbUInGkBBuJpJ+ziGBCavc7pVcyw=;
        b=WWCxI61Tlccr/feGNnqdp5QIvJT4Xoe4OIoNACyA1IimAdgGRNQZXQQA1hjWoR+I+1
         QEnoQndDU1MaItynHrX2YjPbhaM0axgSGldS1WbgEuR2OqnnWD2nJgChlK+2zT1oHaYK
         YdjbHblFH0jZr/BX0tCTqCo5nChw7PoQw94UPRaspP88c2WgE5wWMSqKXVUmFprFHpsE
         kz4rNDkF4TAkAyvKileT1+CyRW0q70Fy8quDw/iEugWy7hv7rAdY5WQonsLIxKd4V2JJ
         RpPhnXsECW4iJInoeT06JQwoCD43qxUiCsvurPoeHb0rQGZ1J8umb2FH53PtgVtEhtFq
         PPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746170182; x=1746774982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBU2uNDQCYbDHEbrbUInGkBBuJpJ+ziGBCavc7pVcyw=;
        b=RWuTwTexMMmFP5jJFx375Sb+G/YArsSZfaDHGWmU7u9F2MEgrYvBYgvD8Llp2/8t6W
         ZYGMt4jRMKlaoxd38XMhcroR1NlALki0OTmr+L0yRXzgmkl14hmWAbVgSDko65ynBgri
         oXjuZorI9LFVS4bx6Sr6gEd5mzgd0KbrLT1sjPXCiTqzpJSb5TPuR8HfFxipvwh6TWAJ
         cQcDKeFDbVuEet+Tq8Q3ytGUn216EaQNuH2Kz8IBlVG1c2YYlE/QNJJV0vj9BHDfRDWF
         tckWH4tBZtX6hYuziY+iBpudHjzcVbHuOECb4RBUGH6VeIdrMht5GkWM1qJjHm1pCZr6
         GMXA==
X-Forwarded-Encrypted: i=1; AJvYcCUchSmSguGsyWJ46qAyQuu+lOAC6ZF+0qXoHfQ2GYAjm8HyB5m/BWxPreEG6PgUaKSL4n372hH+P+jsZUUv@lists.linux.dev
X-Gm-Message-State: AOJu0YzJ7pnwXdREM+f7E6lcHdz5nDQEz1hW/77Ci+aN8drTRwuiU0Ij
	U9oKkp0LRGres9V4dkCbOq8Vxs3VWJQNk7j/f5zWMhAtKm37HxULXjFAS4lhybM=
X-Gm-Gg: ASbGncuPx9UYUgSw8g7oDNlYfcIEXvqbsATGCTUA49zTigLcodaCyZlnAP3Fnypp/u9
	rsIIRGeWT1ZDWuXShL4NenYFRzonteTTK0wDt5bbfijqMmw2qgJM9CP3gNwqShvt3nlNn5Mi0VR
	74Xba4dMfllNjOOivvGo422ykPRiNg0dh9h+dquYWXkf/4CiKf2VXP3sdg4sEghPjg3o/rtiwZ/
	+9XligN5Q41wCqkjvhQo+leWCRRIQBkKdi6JbUgjHAJh1CgX0hRRAXFzMFqObRfQ7isg3xjRF6s
	z7tO8xbYmG+q721Sf8nrOJHoT3nshdZrp+ZVtiSjeWRRqg==
X-Google-Smtp-Source: AGHT+IGoljjX2Mq++EkXquUoZWnI1wA/aHixjMFIJrg5drkNpGswC9dHeERArqW4lNSPCvTr79mfoA==
X-Received: by 2002:a05:6000:4205:b0:39e:db6a:4744 with SMTP id ffacd0b85a97d-3a099addb5dmr1039941f8f.32.1746170181783;
        Fri, 02 May 2025 00:16:21 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099b170d0sm1308789f8f.99.2025.05.02.00.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 00:16:21 -0700 (PDT)
Date: Fri, 2 May 2025 10:16:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Andreatta <thomasandreatta2000@gmail.com>
Cc: dpenkler@gmail.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: Re: [PATCH 1/8] Staging: gpib: agilent_82357a: changing return type
 void in int
Message-ID: <aBRxQhLxs13zuFZy@stanley.mountain>
References: <cover.1746133676.git.thomas.andreatta2000@gmail.com>
 <e902b9d53283d350e6f97399dd3fea646fdb5d88.1746133676.git.thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e902b9d53283d350e6f97399dd3fea646fdb5d88.1746133676.git.thomas.andreatta2000@gmail.com>

This patch will break the build.  Also you need to work against
linux-next.  Dave Penkler already did this work.

regards,
dan carpenter

