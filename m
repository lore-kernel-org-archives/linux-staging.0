Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA1313957F
	for <linux-staging@lists.linux.dev>; Fri,  3 May 2024 05:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714713114; cv=none; b=fBuz3wISZCtM8AazPu7dCLQoHNfn5sLhMooJSdcSBqm/yHk3jLt6QcOWIh0Fg+Yg/Dw9mYzrUJmq2BQkYNND8GKgl1BoL1jK99979zBnYlw3w+20/st1f1tBV91sefc/2h+hsOZcGtoDFQdJaZ+n0nYfXMHokj4+gLnsV4Qe5tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714713114; c=relaxed/simple;
	bh=4IFUujD0WtUytHMnCa5Oq26awC+SVnMB+m5+QMpSIrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OJgl8izRrjnRAfWIK512DCkggdAzXFxGRMtqIX9joa4fUmgtwqJqkGPCr0G2m5ruJv9bLg5aonqm9xWykj2GvTHGsWGlU1ZtCcctJuSnpGpgXrY0E7FhJOoWllnNrPZQ7OoTQBBXfn6K8uJCQf50bu/G4+0uCpE1Cm0FPG7aLTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xVcC5cKQ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xVcC5cKQ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-41b79451128so51756435e9.0
        for <linux-staging@lists.linux.dev>; Thu, 02 May 2024 22:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714713110; x=1715317910; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IZ52txFEn84DZ4Gx318II2hjm45dLlkgVXuI6MMj02M=;
        b=xVcC5cKQNvrGv/SPXS64c9gYnGhPhiiYyBC9V6nWZ92nFxz7lH9v5VpbKA0GnbqiXC
         J+zsguCr2JnG8JMz8nFbLlB3cLiKxw+3pFDT/v+9srru1dhOfDHGsT3Sp2kM3zttPERd
         MkQ4mZYDF2KXY5H3qvC9dVLJmtYybYVpg+OM960uDD1KyUDgP6dpqJWYec0FmUe6f5po
         OETCBrCkUSkG4FJ/mCINb5/lPVd4EBfpa+7iaYm6LBNVitlgz+v6eHgn7SaG6AlG1rQg
         kRaQQa/mKoJSE3xFt5yKZ0vSgy0IAxelu+Mc12G3bZnxVjok15xObW4a7K+G6jNGchnp
         Wk0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714713110; x=1715317910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZ52txFEn84DZ4Gx318II2hjm45dLlkgVXuI6MMj02M=;
        b=GwalAPAHtUTAm8WUBYTKkUkhwkfD4iqBbcMqagBtqZuWXlRll9qiKxObjfhdTpJv8Y
         A2lUPM66yaud/7RFdg1GO2OZUvHZeYpvHDDmvAEKofF4rTp7XPzgtAjbvhVI+C/HnmRV
         pTEIkTfNJiM+xAOCXoF4aiCfNJwLYqSgqe8zVNdB9rqi4Zauuqovr4mHPCoux38U74Le
         XacM0v9eXdtRUTMRCcPZ/cHAfy7qQa0XebqP+W61iD3rNqBuoqHLvFKjvhLHDYpRohvi
         QsJOFtvw1sRn0ee4XA5P2PEgRyVCIPGI4x3lpejpuIq1Nx0x1dcBbQUBVjU86V9OAs82
         5aPg==
X-Forwarded-Encrypted: i=1; AJvYcCVHybJ4pTWLp4I1v++CLoCoe9imMsEB9yokZu29ko6Zw2ip+7Nzg8B1b8Zt8Pj1DHFmcYgwH/AMwjFLZcFiQARzx/bhTnJWkbaB9e7r8g==
X-Gm-Message-State: AOJu0YzannWZN0LVafXBb+r35qMyZjq7kJpnLyoeTEDK49Xc17ThaBEJ
	9KCKUGqeiiMiWe9QZ4KqJGmiiXYFO4U1nX9VXjWdcBT0UiTVNJ2akpT8EhqqKt8=
X-Google-Smtp-Source: AGHT+IHlVU6WqV9hfbm78/kvRSpT3qBzDU+6UDBfCiHBW2deYrVDpU1cdv/gO3y+VfA5WQLnrHXNhQ==
X-Received: by 2002:a05:600c:3c93:b0:419:f2a0:138e with SMTP id bg19-20020a05600c3c9300b00419f2a0138emr1271927wmb.34.1714713110268;
        Thu, 02 May 2024 22:11:50 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id g19-20020a05600c311300b0041496734318sm7964771wmo.24.2024.05.02.22.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 22:11:50 -0700 (PDT)
Date: Fri, 3 May 2024 08:11:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ashok Kumar <ashokemailat@yahoo.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: fb_tinylcd Alignment to open parenthesis
Message-ID: <37db687e-ce7f-4f18-8464-f9b04226e14c@moroto.mountain>
References: <ZjRDUO6/M+RDCcQJ.ref@c>
 <ZjRDUO6/M+RDCcQJ@c>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZjRDUO6/M+RDCcQJ@c>

On Thu, May 02, 2024 at 06:52:16PM -0700, Ashok Kumar wrote:
> Corrected coding style CHECK: Alignment should match open parenthesis
> 

The original author was aligned it deliberately to improve readability.

Just ignore checkpatch on this.

regards,
dan carpenter

