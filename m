Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A7D78F45
	for <linux-staging@lists.linux.dev>; Sun, 16 Feb 2025 15:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739718680; cv=none; b=gK8vVfrb8JX/Y7s5vGcp1VmnmFP6T3Rw/RIdP4F/cQDqc2AhTP9/Kbin1Dpdr4gWFxl2q1FyGzU88HJe+Sy2Bq+Sao0z9HoxXIxLA8qMsFZAkif1eIPeiVAfzNMuEDy8JCF4mg1OfkYtpbCgz2lglK7ljlACIyadm1WyPd+mCJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739718680; c=relaxed/simple;
	bh=7WAIv/jydcGvBTgK8OPF3JMDNPpY8FU3evihuDqV3eo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s01PlgmtXOdpW45DLkyNr0eNTwDs9oNzBoArTEYi9j8zdzQPfUbq6ggVkn2b7uO+t6bOBWn94PUqvAHAz1XAdRKkZAhapKzy88Hl5mQg5dqqXpX1a3sNfT8WWgYB+a8C9iCciTY00T7ITt4cpv9Gx/gx9LuKXlu04YdPiuPZm5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KxeTg1It; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KxeTg1It"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e04f87584dso622223a12.3
        for <linux-staging@lists.linux.dev>; Sun, 16 Feb 2025 07:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739718677; x=1740323477; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TspFxOjpJNNIOaEIYEoqWsypLxhWcsewPPhTBv8nP+M=;
        b=KxeTg1ItcxL8BF6zmljJ/1KUxwJMMXmM/R30jT0Gdivb67r0Q75No8cMQrpSuga7/X
         FObKHldxchXDJtEklI8Qi9B8Inq8elcR+idqHmzvh4ykqVq/bsWa7Pko0ed05SwP2GEJ
         rJeGcubyCv31wE6UPJKJeswIZdubBwWQ4gQT1Xu32+3h4WpjCDHf92E+7/9pD8xu9i8e
         P9NlYyti9G7xKjhiGFXJj+G6Lz01sT8Pt0tiWSQRzLhGeZe36nu1BWV28BMJhOTQmLz3
         2U1GMmll8we0pnc6TW+QPKb+pHw4loHfw71o0CF2qVp7CNDjCtlX3liha0P2LdjKORZc
         qi2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739718677; x=1740323477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TspFxOjpJNNIOaEIYEoqWsypLxhWcsewPPhTBv8nP+M=;
        b=LR9vQlDzkNsXNkP1AFn7JRPhYQxZorpoqrBNEFuPXflto0LTbT34BxaWaOtP3aWCV8
         WqzZY0kNc9qwgzfN+Fv+0q2UQ2XOLPNjbmNnu42U/fUcWuSwxjpeyAbOxOCTVFUaB7lU
         PVAH9twDOjOA+E9U9apoq4bg7VISHE9I6YZn6NgpM6327MUMcrbAsAzLbAP6SZfQYoHI
         /N2BqNYleysKnssstk2m50CBhJg8e3xriEpvSsIX110yOK/6S6ux8MncdrnYBLYpd82/
         whpOpKynDsh8JPN64HCXVjqNgd/c2Hq7x73Z0EcB8dutIYRcm/b1Z/Fjq8IuNouST6K/
         Fx3Q==
X-Gm-Message-State: AOJu0YwH9SKbaL3CHbyfjVARHzbPJ2tWHCU6QJmHBnqq8nt6EEFgqETM
	aTT6HfRhOdGeFwSRkGhEVwH/Z9IH/tKSppbvxYJiEp8b4TiJssj7jXMusVxXC6Y=
X-Gm-Gg: ASbGncvYTBmQJd+hrZKrHeCNIbvyoyEFTu1Fck/ElbISoYzKPoaZMaAP44X4I6uQ3EU
	8uuwI4wRczRFhY1WcpZRqK5Rwu6/rxMYJtCDXV9gV4tKRElLQGd9xKRjudQQVBaZPBkwIWnNY/e
	KMhLT7GPE327W+QyMOk0v/g4i8ABUaektN7581cw/IvLzaV5uplLXr+OjQZdGmiC0CcgLtbZ1Zp
	1ASGxqBqdGsoZZsoQlg0ttG9WsK5qWswaehGQtIIo4F26X66UxIPAIWDqvGh3cJfwbpP0xm6Ix2
	whrv/jQJUXaH7w8KExOG
X-Google-Smtp-Source: AGHT+IH6o0esJkgkTbUCvIMQRI/0gjQPiw2MQI3TprBRP0yx0cbzYpgZU75xT6HBbS0hknVkKfQMiQ==
X-Received: by 2002:a05:6402:350b:b0:5de:a74c:3dbf with SMTP id 4fb4d7f45d1cf-5e036175cc1mr7121487a12.28.1739718677152;
        Sun, 16 Feb 2025 07:11:17 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5ded709a92bsm5000065a12.63.2025.02.16.07.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 07:11:16 -0800 (PST)
Date: Sun, 16 Feb 2025 18:11:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gaston Gonzalez <gascoar@gmail.com>
Cc: linux-staging@lists.linux.dev, dpenkler@gmail.com,
	gregkh@linuxfoundation.org, arnd@arndb.de, ajithpv.linux@gmail.com,
	roheetchavan@gmail.com, niharchaithanya@gmail.com,
	eleanor15x@gmail.com, everestkc@everestkc.com.np, kees@ijzerbout.nl,
	skhan@linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] staging: gpib: remove unused variables
Message-ID: <cff414c8-4820-4d46-92c6-09683a005ea8@stanley.mountain>
References: <20250214195456.104075-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214195456.104075-1-gascoar@gmail.com>

On Fri, Feb 14, 2025 at 04:54:38PM -0300, Gaston Gonzalez wrote:
> Remove some unused variables found compiling with W=1.
> 
> v1 -> v2:
> 
> Address Kees Bakker review:

This looks good to me now.  Thanks Kees for finding the bugs in
v1.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

