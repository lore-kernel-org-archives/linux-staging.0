Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F86016B725
	for <linux-staging@lists.linux.dev>; Wed, 21 Aug 2024 18:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724264589; cv=none; b=eHMCGXXk9nQoEPjKK53DGYqG5CO1jTkS90bMyDzmN3QLeHWGPkZtniTrGuyHbCOvjp7vx77PnCtH931PzlENlyPcsN8g64CzYlEHJVjhrfZ2zB03GVjtkNBzNRKszCOobr0nGHahZvnWw0itFQaQ4K0dyKgviWkM6iVtCYjlJIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724264589; c=relaxed/simple;
	bh=QUKGxRkk8/mkSrwuSlLsSbgUgk5OGBB2HN54PKBTREc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B0qX5RSE40KQn54zp5qhm4rfOBQOk4NUMssiuHME4sa+0LCHGaEzXe+yIt1bsZndCwwXridBumQk4aDN29l5YsrvfiYhyXWmeIZbTtsBofNyi9G+OxUYI/uK7AR80RZaeUYzoulxPzsn4YV6QwpEyRF6P+Nxor66ddC7YCLPSOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yHCI+1nj; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yHCI+1nj"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5bed83489c3so5947323a12.3
        for <linux-staging@lists.linux.dev>; Wed, 21 Aug 2024 11:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724264586; x=1724869386; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0MhXaKx6yN6hoftmycyXZ+ElE9Hp5n6s8cfDPZOoBHM=;
        b=yHCI+1njs9rqM6BrP7tGQjrtZGBAR/k1UggeS35Zj1S8S2ZgtpUrV7YY5IhJ75E4w7
         3fuT6LebINMNI5Po+mD+bAyLwgLkSSfF/5O4KFyyCz6eICrvoHcSb/Mu0JKlAoV9AH1B
         yKducKEMr4PhVRt02Y1TslT/NCHt1akuXo0RZ2Es02XXuAox/3YyzYjz/AdPxLUs5i6I
         UbXJgSF2UaAiI9KE3TCF20J5LWk3qpbexXbTab8Y3QqeBZumf8PCRy2zWhdZ/JtkuTcd
         LCmHIzJyz1UwQlAmLdgKrLnqZXqQ2PVR3b4nfGgWdzvVlvkW9rNl1TNHfPg2I0Y89KeO
         chOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724264586; x=1724869386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0MhXaKx6yN6hoftmycyXZ+ElE9Hp5n6s8cfDPZOoBHM=;
        b=OIeJMxzX3BUx/7RGrEM+w/c0UMVE8HGrOywZYL97IjPUGdaVD6SF/fm40SSIGbi2B9
         oy3Eg4KRJKmBhMKt7gS4F+qnW+h646cGXAAfpriLsluOAOTb1AVDd8tN+cWgc7Ulx0R8
         Q4SQGE0fvNRF5v1cV/zB1RNF+NqaJHRrlL4aGvnw8yw6B8ZIzX53LdrReqGhVwSbI+gp
         TzuPRqdTJsWksOj4TK84t6U9lzcEDN3diztSqcXE2A/Ty9y2pm7is82XqZZ8+6IbtcmH
         TVb/uyCETmKRO3cD3lXCaJpyp7AfHzzW3Fa/aNkTXkqYX9h6PE8gbLvqbkvkgAEECYEl
         /OSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxFv58kUAj3h1SOf0WIaDRhYLKvGxf6kSFhBc7c1u+D9q4xO7/ZBJeZAR+/tULitF5gkcPfSIPPHLBhBGp@lists.linux.dev
X-Gm-Message-State: AOJu0YyNudUIlRSoSXtsk90ZbQqKbSTX5f4OVHuMLnATWzD07Kclm3Pl
	fNHC1r959j/rPFeBVzJi/a5VA/RWw3QJy2m2idoWEqFt8raE5mjZ9YZEK26wbkI=
X-Google-Smtp-Source: AGHT+IFU6t+Mu6hID3xlC+1CO1fUMB8oA7lQ5D7nMlujTXX6yhTp0eJws1S2crYlDzU/oWrgudCx+Q==
X-Received: by 2002:a17:907:ea1:b0:a7a:a3db:c7b3 with SMTP id a640c23a62f3a-a866f2d7aaamr178974666b.19.1724264585535;
        Wed, 21 Aug 2024 11:23:05 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a838394716esm942312166b.146.2024.08.21.11.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 11:23:05 -0700 (PDT)
Date: Wed, 21 Aug 2024 21:23:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Abhishek Tamboli <abhishektamboli9@gmail.com>,
	gregkh@linuxfoundation.org, tdavies@darkphysics.net,
	philipp.g.hortmann@gmail.com, garyrookard@fastmail.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192e: Replace strcpy with strscpy in
 rtl819x_translate_scan
Message-ID: <510b12b8-91d5-43ce-a191-9ee0a6c91460@stanley.mountain>
References: <20240820184216.45390-1-abhishektamboli9@gmail.com>
 <2348e646-e1da-4deb-ab55-c438a42e25b3@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2348e646-e1da-4deb-ab55-c438a42e25b3@wanadoo.fr>

On Tue, Aug 20, 2024 at 09:38:22PM +0200, Christophe JAILLET wrote:
>    - if a "mode" matches, do we need to iterate the whole rtllib_modes
> array? (have a look at wireless_mode)
> 

Can only one mode be set at a time?

regards,
dan carpenter

