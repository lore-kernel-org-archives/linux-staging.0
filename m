Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50ACF12DAC
	for <linux-staging@lists.linux.dev>; Thu, 10 Nov 2022 11:24:09 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id t1so926810wmi.4
        for <linux-staging@lists.linux.dev>; Thu, 10 Nov 2022 03:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Mo/HZpj8w38ANVpEVSro9TPOmrz4MXgGYRbhOeboqg=;
        b=Btd6nmuMr4PsvGpdVwfteWzw4NkDlkaneWAUfCD8UO4/JuLHh9wcR+JtHPs+sPRpOy
         KxyTIeppbNF955qujMWbr365v6mdM546i8zMJp3Z1bL51oAY3vyEvfY9QOMWpz8KGKb1
         DYP/mdtmwLipFJeX2f+M4AeSNFiJQLlENqDuTLIDYo5v5lk8nNSoc9+YD+vUTII9noCq
         0H9TOx7I28qDKwNjvlt+iWQMmFkKYq/4EkuBsOmeX7a+EbJ2ETLJFQLuisfEHx1SRB2V
         73oZFS8m6J845TxgIJmkKdyBrikZvSicpAh5dE3A0Sj03nHCwF9SoD4HoqoEtySd0TBf
         BeLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Mo/HZpj8w38ANVpEVSro9TPOmrz4MXgGYRbhOeboqg=;
        b=q+Ovrzg6sYfYUV7aCuJ7pOaoVydppBRKoRq1REh0/LrXBdOem5qnvt5C32WV51L4Rj
         yHf4ypo/pUr86WB4LKaaH5Wu4KefMuKscnAiC3aHOafXJzz9jLl1A++bBE4GX+fiUM8l
         zGjF4hzhEHeTASoK0De2hgz4ffJF/Rgqmb9k5jq9iH8BzLJUWpJD2kM0axR6Gng7mvN6
         Lg2MKd9k+QPunkZMeNfr+SdZW2NDZRPWjM+kqa98bUQTYHANznKEAIRbKYx/tdd4qzLn
         WssijLKdqZjXOtbD7bj5bBfoePorD+1vHb41xxZgDBxgmQOeXzTIMVcZ/Y606grgO+m3
         d71g==
X-Gm-Message-State: ANoB5pkiAJ0GFNgWyTDSdiwFAjniR7mcc9rq9MqVbkt7YzpKFi5pF8mc
	YxO8b4R3tg+uYSnTEUQXoHrkQ24d8Dw=
X-Google-Smtp-Source: AA0mqf7a4QVTKL4NLbGglhdl2KfKEyVq2aRSN6y8tzERBF/mhOqgcSzHi05o3QOaAIUS6GyjPH/GQg==
X-Received: by 2002:a05:600c:3049:b0:3cf:a985:767d with SMTP id n9-20020a05600c304900b003cfa985767dmr14659772wmh.32.1668079447504;
        Thu, 10 Nov 2022 03:24:07 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u6-20020a05600c19c600b003b497138093sm5312260wmq.47.2022.11.10.03.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 03:24:07 -0800 (PST)
Date: Thu, 10 Nov 2022 14:24:03 +0300
From: Dan Carpenter <error27@gmail.com>
To: Jacob Bai <jacob.bai.au@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] staging: rtl8192e: rename tables in r8192e_hwimg.c
Message-ID: <Y2zfU+Cw0/odYATm@kadam>
References: <cover.1668075486.git.jacob.bai.au@gmail.com>
 <01eb4d9cb22be5f76aa39eedd406577cdfd9f486.1668075486.git.jacob.bai.au@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01eb4d9cb22be5f76aa39eedd406577cdfd9f486.1668075486.git.jacob.bai.au@gmail.com>

Look at how these defines are used.  Take RTL8192E_PHY_REG_ARRAY_LEN
as an example.

On Thu, Nov 10, 2022 at 09:35:10PM +1100, Jacob Bai wrote:
> +u32 RTL8192E_PHY_REG_ARRAY[RTL8192E_PHY_REG_ARRAY_LEN] = {0x0,};
> +#define RTL8192E_PHY_REG_ARRAY_LEN 1
> +extern u32 RTL8192E_PHY_REG_ARRAY[RTL8192E_PHY_REG_ARRAY_LEN];
> +#define PHY_REGArrayLength			RTL8192E_PHY_REG_ARRAY_LEN

It's only used to create the PHY_REGArrayLength define.  Layers upon
layers of indirection.  Get rid of the RTL8192E_PHY_REG_ARRAY_LEN
completely just do:

#define PHY_REGArrayLength 1

Except get rid of that as well and use ARRAY_SIZE().

What I'm saying is don't send a v6 of this patch.  Just step back and
try to figure out how to get rid of all this code instead of renaming
the variable.s

regars,
dan carpenter

