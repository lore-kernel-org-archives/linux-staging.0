Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FAB194A65
	for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 15:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722354107; cv=none; b=sydLQ4r8KDa/20hWN5PpWP9oq7mWjcw0dl1okUrP5PtrqjC6tpfr9tuueP27CsVkiV/njzXJDVUfI08g9B3/xTJ/BxhPPMjx1nwXHvYU2fKLW+6LyFkWEU+phVEskdZdM9UWZ/J2m2rCVxnKsz3EOMIOjG81OTjx1fjBjk0pDSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722354107; c=relaxed/simple;
	bh=GaXmFaP1JnXhQ67zHiWX0ypEDL6hGeq8fLfXvuMowlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hoSXHiNBrbcakeWH+XGaggHcHL2ifSXL5Qfs2UCsvYSNBcwUWR+zP58BLwXQn8HydT6qS2/dtUWicEDb/MhZNAvKef6wKt+nJMJ18pe86cvy0W2VZJ/4D+uPlkBE+EtJC+Vw/IJAYkNfe+jhWrsqX1H+SgHa2YGdg/LVVvwa/ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f4uG+c5/; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f4uG+c5/"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7092dd03223so1113643a34.1
        for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 08:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722354105; x=1722958905; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YUMTdfIhOXXMeKiKn124AIvyqTdCoUvjm0+I3c3GMf0=;
        b=f4uG+c5/IS0uIkiNMlVu+/190WJgL/Os30BQBDvyE9nkme7XUv7WNrHOy7kivqJCsl
         /zROLogYaIhE4yvFGiOPKI++k30DQuw5LioRCrjQiMEBYqq6sT9BcqAsUnAUhmwV0dyB
         MuI1M7yZ2JO8QVh5boVQ9iJY2DIzCZYQJnFOCN8CWMnK2o3/Vi/XNYWj31K0oDagKrk4
         3t+Ag344Twfr6hmwi6ztp5FVIgnWbmwpy6Gat0J5I4ifEbY23vLLz0OyMT/yBku0MZZ4
         x+oM7tbbKC0Da/JGpOWZ1Lw0rTLUuXnXUZhqP/9p8jEt9bDFCtGD89pRio9CwmmfqHg2
         Yv5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722354105; x=1722958905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUMTdfIhOXXMeKiKn124AIvyqTdCoUvjm0+I3c3GMf0=;
        b=iZHF5+G//rQfuZoJzWumQ3mAqKwYGHM0bMzecA4i4jAiosMCuZAhu68rpjqwqcY387
         NiD0MA/lMkBddaiQD+n1Iu4Ska4P+J6KmC+x//40qFiHH6o91Q9H3SIAH6Se1dsJSJ3u
         Q8z5jPkIiU1uTPxdXSgBSS4SqakuOcvLpPtw9uiapjnE7wxK0Yg8W4QUvb62vzGc8lfo
         JdeC7PK7E2m8jiMi2x82mGYpTlsWlQsol/Nv88uju6BXTIS0rirSiuX9ZGi52JRtX3EM
         SEDWZgNpJT3TtxeCNspDrSPprHCzzhxERY6EcvtIS3lg73vzBlxCAOiDN747LM33/eJd
         /S5g==
X-Forwarded-Encrypted: i=1; AJvYcCUKRSNCvAU7qbw/E/pywm/3oyPsjMLRJbeXs92EepFh8bqlTwfzkYTb0rIYluFeKSK8xL/3LUj8HGi59ekB5RkJQPf46Y0IRG85oqr8iA==
X-Gm-Message-State: AOJu0YyTQfZPZI4FCnm7j5k6vCuKOhyh42z1ozdX3NIJsKIBQ1vzYmqA
	gdVjrwNqacTflFB32ayUPfxy/W1S/O72iiZfS337vPEfL7XxIgNRfhSvpg03DXk=
X-Google-Smtp-Source: AGHT+IGAi0AOjYfdQgi1I72Zi8FVSlopeOu/VyqLGs2Wm2TPoLc2w3QjuCw20toB+DZKbDsGP9JBDg==
X-Received: by 2002:a05:6830:358e:b0:708:b40a:fecc with SMTP id 46e09a7af769-70940c04016mr12287729a34.1.1722354104863;
        Tue, 30 Jul 2024 08:41:44 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::17c0])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7095ad4e7f7sm433525a34.2.2024.07.30.08.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 08:41:44 -0700 (PDT)
Date: Tue, 30 Jul 2024 09:56:05 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Benjamin Somers <benjamin.somers@resel.fr>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, ~lkcamp/patches@lists.sr.ht,
	helen.koike@collabora.com
Subject: Re: [PATCH] staging: rtl8723bs: Fix spacing issues
Message-ID: <50c89422-2ccd-4ed0-b2d9-8337f5e8778f@suswa.mountain>
References: <20240730070518.2850-1-benjamin.somers@resel.fr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730070518.2850-1-benjamin.somers@resel.fr>

On Tue, Jul 30, 2024 at 07:05:18AM +0000, Benjamin Somers wrote:
> This patch removes superfluous tabs at the beginning of the file and
> commented includes
> 

Please do this as two patches.  Patch 1 delete the commented includes.
Patch 2 delete the tabs.

regards,
dan carpenter

