Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFFE6D22
	for <linux-staging@lists.linux.dev>; Tue, 31 Oct 2023 04:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I+Voz8jj"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-32db188e254so3596205f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 30 Oct 2023 21:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698728344; x=1699333144; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PljP2ZlMmz2gyqas2Dp8d470o4avl70xl7PawNITM9c=;
        b=I+Voz8jjE/hsTpC4S5mVf91Kn6dfuRtYbbkSfZIrUUt8zRvVhvByK9dw416BKlVdSU
         AF951DBC8K9B5V+viXKmSzCM+1MP/uQZ2JH514WnOQVNAeH41ses1xMp/PTi4fN37yJa
         3gjrEaiH2cxn8L9wMjJsbiXYV4QXntCHWhWEX7BehANJz9lpmSMtvLo2acpW69VX6/2T
         6s7TnzTlSngyBX793/1g30U3VwUIyjPodTwOkkdkl4nGR8+i9X+j46XlB95426lcoKsX
         /guAvVq7qNIZj3+YzoDNGp+ZCAgLEnpeUYtRrB68ptf0Ybl0CekH6jKMK/JdId3FZtyB
         HRgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698728344; x=1699333144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PljP2ZlMmz2gyqas2Dp8d470o4avl70xl7PawNITM9c=;
        b=gp0ZSc/Z+gqIIjetIlZg20g2hNWhDcOtS6fpA59n4exXO6CuruFeUW8xYbZc9l2qqN
         cEVMM6GAPlqVxtCjeAa9N8n6/36b2k2D3Vlqge4LprJ6Mrmis1gto1Sp2O2F0l8YCVSD
         Pr8COf+8EgZqdViA1in5+IS4BKZIxfQgQeUXfutxBAGaVnIVFdOM4XPW7Cr0ktDa0Rch
         W4Gjw7mIDOXM/m1aysrEmQYOmpRT9OGjFfw+N2002rFOiNDvRHboWn3x2xX4HQts+TZj
         REYcecIykS57k0ZdEQrBLAyR7KI07S9Byavlm+gE7C3GUUKwGPJvNZavs75r9HqFeQi0
         wjdA==
X-Gm-Message-State: AOJu0YyFIMb1LXaRv5LJ3ZdPZKUORKSpXYl8E/+XCf5/TUDIKMQCRUyJ
	65APP2w2cRpoa4dRfJ+xlX13WQ==
X-Google-Smtp-Source: AGHT+IHl2RxQhcYli6doIjuXiHUCX9R4OS22iOsiqPg2Qm2jYD5SfrmNDoelI7hrqYtqna0ZPpIvIQ==
X-Received: by 2002:a5d:6142:0:b0:32d:b081:ff32 with SMTP id y2-20020a5d6142000000b0032db081ff32mr7305820wrt.38.1698728344664;
        Mon, 30 Oct 2023 21:59:04 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z2-20020a5d6542000000b0032d09f7a713sm548908wrv.18.2023.10.30.21.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 21:59:03 -0700 (PDT)
Date: Tue, 31 Oct 2023 07:59:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nancy Nyambura <nicymimz@gmail.com>
Cc: nicydaniels@gmail.com, outreachy@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] Staging: rts5208: Replace strncpy() with strscpy()
Message-ID: <cd6b1b25-1c93-47ce-b15b-726cfe548a93@kadam.mountain>
References: <20231030142751.49913-1-nicymimz@gmail.com>
 <191cf6e2-6a46-4813-a0c4-c86bcf9bd0b2@kadam.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <191cf6e2-6a46-4813-a0c4-c86bcf9bd0b2@kadam.mountain>

I have updated my blog with more comments and examples.

https://staticthinking.wordpress.com/2023/10/30/strcpy-strncpy-strlcpy-and-strscpy/

regards,
dan carpenter
