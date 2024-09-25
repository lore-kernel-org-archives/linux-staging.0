Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C801D158D8D
	for <linux-staging@lists.linux.dev>; Wed, 25 Sep 2024 08:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727251853; cv=none; b=EXmeYW0jkjyKVIphX44tbzlCtU7JjTkKrKhfEyKWCn5B7NRSgOqQz7bFGYOZOfLyu1TkG7vAXQF9wRCZLP+yCdfFnZa9BouCZ6SNRh04XKl8OAeiBMYwlW/7W/7UGiHaFfA0C9V7IcOuQGMMIJeqdzwwxQpKF5iT5LaNIVlA/0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727251853; c=relaxed/simple;
	bh=wUF1o3AkPJBZeRpaPm+2e/bxd2DtFAMDs4G51MfPD6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=loRzeuR9I0WtK3b2W3llmcMUHuv89TC9At6o3dgxM+pyOYZblNeiqw1ZkdVUPpJYHqXkavG5YFAeBxy3DQqpny5kF9PnlFUQYBwXDBG0OYm0xXiUbhSDwEErVZDOJw5UaEyZUdi02D/mVlJ/dDNuOirb7RbADGxFVyOzhs8HRAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NBY1adRE; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NBY1adRE"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42cbb08a1a5so61328825e9.3
        for <linux-staging@lists.linux.dev>; Wed, 25 Sep 2024 01:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727251850; x=1727856650; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wUF1o3AkPJBZeRpaPm+2e/bxd2DtFAMDs4G51MfPD6I=;
        b=NBY1adREC5dalD7QP/3edFCXMR6+xwGhUKTYxaf2kjM+p8CWfMPOjj90zr7JDH6YI2
         ZqveDpkADZYH4L8ieGwEixvnb4pfrER7t3HeshRpBBpOOA8+MWYwjrd6VencSH7+PvQ1
         xz1iOMmCixTVA0H3YuuLnxXpiswANrSuWfj9o3GEBDRSIJrBvCElU2vYt2a3Yk1HVIf9
         NnTEZNu0WmApJFIDa1k+pJnz+yjeakfdJSrtri4wLMutdY2FkMe7mFHPgte1d9+ZpKfX
         Tqv+D9IgHv0j3oKEf+zg+ZveJZj3DGzJi8FScca4rlVEt9f19ldI69jCeKzYiIfH17mM
         1dhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727251850; x=1727856650;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wUF1o3AkPJBZeRpaPm+2e/bxd2DtFAMDs4G51MfPD6I=;
        b=C3vGE2Na8cUlrNxSsleFuB51twRP8Xmq/JLCmsbHIJRWQ0IIIe++dNHNetuPXKhvsA
         FGSkPXoPrvXj6+giY690AhYOpL4ajvWFTd2zHfqU3hc/Dj4ua9o0rg8NnQZamTgvGysP
         /v3eCtkVxXFp43JOud4t8hlM2186xV6ic8MGOi05tfuyJdtHOGNUJsPDT4Sf0eqe6D8z
         Vzy6L+y5PIoELuMMoDf74uNg+obVs5oPPaH2ACBdl19UwIFgseyFQhj/QHcVDva1qTgl
         ap5iwg6T/H150KrQwBqNplwAWX+YyiqNIuGmJ5wYBDduX1dF2kiGhnL+95EgIPiJusz9
         NSjw==
X-Forwarded-Encrypted: i=1; AJvYcCWuth35iPJfwe5HqzDUvp7epN/7gBBfClz8012k7bpxX/NB7ufpsC5tuoL79B7O3S/KHuuZP2KmPRckBhX3@lists.linux.dev
X-Gm-Message-State: AOJu0YzfbeX4F5RzwrvXqUgfIYqHKAW/8lr3BBoxaqo6+9PWwJqhKR49
	whCtd/dccIkpu+XPE6ta/apcBKhJd+Gf92RVbiXQAV0vba4azkKaaoIEbenRwpg=
X-Google-Smtp-Source: AGHT+IGn6GRJD8Rwx5J8w8ZJjTWua9r/sU/GDxbO3mmjVPsYbj0GV7sfKvfSRKx47UxiedbotWn/Jw==
X-Received: by 2002:a5d:4576:0:b0:374:b5fc:d31a with SMTP id ffacd0b85a97d-37cc248beabmr1185242f8f.25.1727251850028;
        Wed, 25 Sep 2024 01:10:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc2c1eb8sm3308269f8f.42.2024.09.25.01.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 01:10:49 -0700 (PDT)
Date: Wed, 25 Sep 2024 11:10:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Fabricio Gasperin <fgasperin@lkcamp.dev>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, ~lkcamp/patches@lists.sr.ht
Subject: Re: [PATCH] staging: sm750fb: Rename function
 sm750_hw_cursor_setData2
Message-ID: <0125af58-3070-4ee4-bf14-f5d0d498aa9f@stanley.mountain>
References: <20240921180612.57657-1-fgasperin@lkcamp.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240921180612.57657-1-fgasperin@lkcamp.dev>

If nothing is calling the function, then just delete it.

regards,
dan carpenter

