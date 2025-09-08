Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE762940B
	for <linux-staging@lists.linux.dev>; Mon,  8 Sep 2025 05:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757310359; cv=none; b=MIJQjTVBt6/V/dYCNGDBZKuiiWzeUjKA1Wh0SHK9tBpZeygzMWBCx+jLSm6f2Aa6Pz3DLueJH8hKTB2RZpUejfzcCSc/W9n+VUeI2n7//lI/mM2h8uxz7rp3ovD49uKJ91Sfe617LAQadSapkPqGbf2Uy/YWm3izdRLD6WiVnwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757310359; c=relaxed/simple;
	bh=Z93EEMLZ8bdepan4BINitcyJFnBNPlN2fw5mo9Yqvos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bMBm1OATf9WGVM2T0lKDvM0OM4mZ3s7MZJ9BvCYm98fv6q2qwuwkdZR+cmLwVRzXQfMTiBk9OmNAg8lee79U2bPiC4kR6k0EXkHcszXD7RDCYfCPvEwwlJu8TTwxOBee9i8CmosFrRvr+BU6nw7k8SzkDguHIw+1o+sQtiW6+C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MmWcQgR7; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MmWcQgR7"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45dd505a1dfso21135595e9.2
        for <linux-staging@lists.linux.dev>; Sun, 07 Sep 2025 22:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757310355; x=1757915155; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G+fMI7jrlec1AYc5iE/AykLzEwl5evDQP4qBoNzK6d4=;
        b=MmWcQgR7mhsy2X3b85GkqLYVrVtCdaAdj/ROTzCI+7jjyFe0PjzWNwLLrYl/tNDVVQ
         vZixroHs9SVw7D/4NZ1+4zxKcAirGqdWwScgN3aXXXZVV75+HBM9TodrPCmKvdXk8jXL
         twWiqiXAHbI+XoepSvbQxqWTOgG4baIEupplkxTtOS2MM54MHT82pybcMKzwgnPEQFhT
         9IJTtJ780nS8pUG6Ib9k2bPmstqD2p48eYF6E4+DI7i4te+cgBNMHxTxz3qhMqZIUyD+
         2EXuHljHq8V/Yk7aJP2SZAuVGw8RzqUVvKcTXO22PBA3BnK/QMTH5VoxMJpVFHoIdYps
         4txA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757310355; x=1757915155;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+fMI7jrlec1AYc5iE/AykLzEwl5evDQP4qBoNzK6d4=;
        b=LBbUx2VeOoxtK33xvh6W2l9xksBlPyVa4V+WOB28ydT2CxmeJLURPuLtcQ7UcEYftG
         TaSYwI9jokIhRqMcZJmvMrDt1wH5IW2o3mQrKya7lkrp3pfA6dOW21lQ+g0pelIR/5oZ
         WyY7i3PT1Hudbl/+NUHuueQEq+bX3kuJKggY8vXpshKQkKO/4UCYM+CKO0WIG+bfL/qg
         dNb/Z3JCgQRtSBjrSZUkOD9MJJC3fjV/B1M+oAWi2TrX8rrIgqEdjf8QfwsvCvWKn/zr
         SDhrbpgUdkki8IPJoNOV3+0cmX33JXUsehLO+bqTmZhnYBay2z831hqfzyrW8aK9ig8M
         /4mA==
X-Forwarded-Encrypted: i=1; AJvYcCXvieKMKxf9Syw5B/zOfcpish2Xkjfhgz9dsxZDHjW6td+3PcyRbY6rYVbj4DpzQqSJUm4TJyn+TJ4LMWUT@lists.linux.dev
X-Gm-Message-State: AOJu0YzIapdPifTP/k2msRqNDMAn0t6H42cwcS0vblJetCeukaSJnVBZ
	sQ5HrjyFo+TpHMkTLTwa8WiCBMF3yKoieAkTWcfgzsjH7DM8f6TTbinQU7PnzUTiwjs=
X-Gm-Gg: ASbGncv4trmp4RACbFqQGodVwXr7UG8He2KLnF4afJixk6ZpvXBE7264SVw72rfdTdE
	OTlVAWh7fJ6IlT+w1Bdt2wyscluJQ3Wb43F7TY4B7+Vq6wfGlXuKdM8uoiE96RbfFFDJk86c3m1
	L43jmpG3JkN0vd7TmiQf4BW/z/EtnhPpCgfLqTXsGJueff44WZMl/KNFLbwLpgnVRfhxpIbbMru
	Hf8M+BCejTRQc9GRzDwjIESuwkABDTNCOJCZK9E/7rK2+ZFbHQHUOv2z/CEB9E3dtwhA+x1hmPW
	EUd2dAqp0nEFKnHGf6bMIO3DYPmLqw72AHphj3YY8zbMDB7HtHJf7JOpR9rcQ/oR5LBq0wPiRHf
	Cq9khgk19HW69xBTXGj3MN8IqIJE=
X-Google-Smtp-Source: AGHT+IFrY+W8Zw7FZwKYzK8IHAxbMi7aFqUaLDdeIhsBhJpxTXZZW2/teY75/VCxA00xqU8hHX5z9g==
X-Received: by 2002:a05:600c:1f90:b0:45b:8f11:8e00 with SMTP id 5b1f17b1804b1-45dddee8f49mr43141705e9.37.1757310354706;
        Sun, 07 Sep 2025 22:45:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e74b2e0511sm1114669f8f.62.2025.09.07.22.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 22:45:54 -0700 (PDT)
Date: Mon, 8 Sep 2025 08:45:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yiming Qian <qianym1996@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: fix coding style issues in sm750.h
Message-ID: <aL5tjv_2YkvHPs5C@stanley.mountain>
References: <20250908052133.8888-1-qianym1996@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908052133.8888-1-qianym1996@gmail.com>

On Mon, Sep 08, 2025 at 01:21:33PM +0800, Yiming Qian wrote:
> This patch addresses several coding style warnings
> reported by checkpatch.pl:
> 
> 1. Replaces CamelCase variable names with snake_case:
>    - dprBase -> dpr_base
>    - dpPortBase -> dp_port_base
> 
> 2. Removes unnecessary use of 'volatile' qualifier
>    from the lynx_share_struct members.
> 
> These changes improve code readability and maintain
> consistency with the kernel coding style guidelines.
> No functional changes are introduced.
> 
> Signed-off-by: Yiming Qian <qianym1996@gmail.com>

You need to split this into "one thing per patch".
[patch 1] remove volatile
[patch 2] rename snake case variables

regards,
dan carpenter


