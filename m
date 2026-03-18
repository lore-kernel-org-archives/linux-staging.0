Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13223B961D
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 09:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773827597; cv=none; b=CUIEeESuBhfUznPk8gUNuZTulvGcLxyjCa7BeM/Co6FWbNsPzQJg9VavbmJ1jDA8oGruonDNx5Ezoc4wxqZku80Mtqd4wo8NCHfj0RRG2xMHbxY5AHrxADhyLu2h57TSiOGIsdT0yCYosx1jgUJNF+lHXGkDCgIRYRlwzku2QVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773827597; c=relaxed/simple;
	bh=sfh80WbxBbLt4xnCJNeuRiTn5KYSGMlCVnRfiHpd/EY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=apvcIAAs7kRK8KSVlBRtBqeGYec0UpBW9S+WpF3lL51UOrPi0HL+O6l0afBJqnhun+Zs3aQht/ucOdG5DgdjmrZgsnoKKZfIkEH8pA7gX1coCiQYoYCFUIQ9b/rGHLWGutrgf+VC1AVoJLjWwtihhhOAPCac/2DyYy8H8ZahMPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ypcuM9Ss; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ypcuM9Ss"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43b44c0bcdbso2874949f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 02:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773827589; x=1774432389; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sfh80WbxBbLt4xnCJNeuRiTn5KYSGMlCVnRfiHpd/EY=;
        b=ypcuM9Ss0bWxwL+DZa/Kl9HAsHNwOdEMeXXNQ9G9JASje0ohEyLa0zLda6t/kSYvP4
         KEChgX2P9UTtHCjw/Dd4SEHtQLC74vGqyIwak8ucJF1E7Wyz4OhdR3r9TNuQtDnwVPpJ
         nj9G41DBWrWxawGv370Ylnwi9jdMs8gv6jgSCdLL91uzCMKt9NmWgFc25+b994BY5ZG1
         tiMriVkRXxq3xjcyNonn0qdLnaT0ISkK4ASTjnOO7/rPJQxs6WYozyZOopBxPjjVcgU5
         bYxBCiYKoFXIB4NHN3d40PBnhkJSzDGic/GceYkwe74daj+Et8lq21sWlf5qlhUrHdak
         GI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773827589; x=1774432389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sfh80WbxBbLt4xnCJNeuRiTn5KYSGMlCVnRfiHpd/EY=;
        b=sjkxWXaDKlRMrd7a0p6N9nSJ80YPyDW9a4nr0ZwKRsOvodLVe0bAb8StMfmaf6jmP2
         BkjqVjhxZRRPoPjXOmbD/6DgfewhwvHooUGDMirKvoBBCBw5lRHZtJ+h2pFDYGzM9bsT
         0j/r+j8lWl+v6O4HU6RghHoZfNcKNj9uA+4P1JWEj+nyQ+kRvfQaUwLh0G+1UI5CDmvb
         UU0ivFydKCzDT2uZfGYXtqTHA4STlHkPvUR/aMGWwsYuu02zKq26n/+563hVrYj9TxWL
         QjEfwdamPaNcCi+AvnSS2lWHEk8/X1NiBRgWsJAjhy92tSqm0VasM9Gdq1IPlMS2Jz6Q
         Xnrw==
X-Forwarded-Encrypted: i=1; AJvYcCU46/zmTqas2V1Fua753tmR2cadsQ/CCTZq6MrrZy/9Hjn1PxF6aQbH5KmAO4NU4EEYTBJFDu1jmPT/9VRR@lists.linux.dev
X-Gm-Message-State: AOJu0YzY5zerGmbx9NoGQQ1HHKNszSS/beZY5uFjgGnFSzwoeyYhVuu5
	sCTjpHXqMr+CLrJr3ReSzZ8LcNQm2ORkIDTNdIYNuMbCrz8mqMzyFbdLlRKG7xsuyRw=
X-Gm-Gg: ATEYQzzHkkqT+lAkOtUM3x60jyQKH3xePibSAn3H5AxcIydK2hHEJaNg0ccdKkFRS3P
	bnciTQCDMDvHNWuoYgJnK9vc80ViuCEKeRoW7qv7X2HkCTZEzOePKyh4H+NzglNRYV/85CqrC+7
	BGn8HHRpPABfxrHE1mTMR1l26aZKgfa7ZjLxeqrQOtWBCGh2YprjbGD52aKbCLRJAWxbvdylBeK
	8wg4pU03UH5bqIMkLFvUAH/BQ2srHddAukeJijzkUMVQJmVd7v97wWWTvjngQ36TMpfEM60jQ3D
	4ikTN48nSZqf1BTMUTLGU0brk0gFgOBqQnE96iVvoz5gEUUKNcRYhwiOqANo8wChqSJ8a7QvIZp
	bgnefaQTVoU4uHkojvylV42kLzZyew+o+EGILS6eUlHqodYzf3AtD+eNb9WZRmZiKy+28ww0qzY
	OF7zhzsw6jnSkN9Jy1q/YejwtjUTT6
X-Received: by 2002:a05:6000:4287:b0:439:c58e:eb26 with SMTP id ffacd0b85a97d-43b527cb18fmr4158545f8f.49.1773827588834;
        Wed, 18 Mar 2026 02:53:08 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b518922absm6773291f8f.18.2026.03.18.02.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 02:53:08 -0700 (PDT)
Date: Wed, 18 Mar 2026 12:53:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Aadarsh Mandal <aadarshmandal9354@gmail.com>,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, straube.linux@gmail.com,
	ethantidmore06@gmail.com
Subject: Re: [PATCH] [PATCH] staging: rtl8723bs: clean up coding style in
 sdio_halinit.c V2
Message-ID: <abp2AUVoF2Ig2WuO@stanley.mountain>
References: <46281493-328B-478A-985D-8F7A9218441A@linux.dev>
 <20260318092639.27055-1-aadarshmandal9354@gmail.com>
 <80CB87F0-7F01-4E5C-BD38-45BC93297C49@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80CB87F0-7F01-4E5C-BD38-45BC93297C49@linux.dev>

Please line wrap your emails at 74 characters and avoid top posting.

regards,
dan carpenter

