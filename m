Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97CE71
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 09:04:05 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id m9so2895558wrx.3
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 02:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=qAycWgL50Bb206IaW++W2ixsVOoTd8eyjvhFQR4cHts=;
        b=rJmE+oeCKQqym+3INuHfS/BbPhfPCQO+TBuJJzrhd6TgDvAX+BpDSa8sVHElkL0/SD
         bdsKrG+bMPsHoTBhJB0OvTCp2wvQOMRfJsUKp4Hagx91VzQ1ad+LGa9Bb9Mj0vBiKemG
         cu9aLsOzBNdYcJSth/g7Y14djCTebwThuZD6TWSg3aSrgx+tUutbYuc8t01jKHj50ats
         YpnU6+KUieFh07bezbrVUVtBF317BJmQyc2Yei5uXNHN9XKhaGpgd2WCGLgxPujb31tx
         JC+5zPHvbUG/f0K5YTBUry5G+Y4NsPjx8jWURDI6iwFDQUbYJ9Y9E/0xleXPc4gaaMAN
         9EAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=qAycWgL50Bb206IaW++W2ixsVOoTd8eyjvhFQR4cHts=;
        b=D0xioA4YUJmtvw2omcocXu6igY/roiO0xA2m6YeA/4xJUgV2q0zaRFfZmwBLRtRh5j
         oOBzhpGVHv5pvmdsug6iqmnr17z/KHZUDCnbC8zVRwZ8HJ3FrP8nFQ8XAJlqie2srILC
         lSv8UrILvWcXgiIPbIhuRvMcXQ8ZDzCaNIcr4Hxcji20dkk6T4GADHKM1xgWh0mbf0FU
         N23pUQKMrA5rWKB3GxjtjA3gmmYU46hsUVI3//GRmhbvd97VIubljv3JpfeHdts563KF
         d09+lOgMfVhBgMA3cU8oqCJED4FEypR7uAUQaKfxihF4h8UlIeYglUXIz3otnWLDhVQL
         3Pyg==
X-Gm-Message-State: AOAM533Ru/3fAZkrTt2c19R7A2ErckC+9XoCIJXMPYx4V6EXKA71RTAq
	bERMtwpiFNOs0FVQbsQXvoQ=
X-Google-Smtp-Source: ABdhPJxDqNctt3Zm6LpWHn9ldjzDoS5gfH8D62Bn62qiJ1xCmEbvhdcWM2q2docMiG7y7MCkPzxdFw==
X-Received: by 2002:adf:f543:: with SMTP id j3mr34999738wrp.259.1618304644560;
        Tue, 13 Apr 2021 02:04:04 -0700 (PDT)
Received: from agape.jhs ([5.171.81.136])
        by smtp.gmail.com with ESMTPSA id g84sm1801370wmf.30.2021.04.13.02.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 02:04:04 -0700 (PDT)
Date: Tue, 13 Apr 2021 11:04:01 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org, joe@perches.com, julia.lawall@inria.fr
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: cocci script hints request
Message-ID: <20210413090400.GA5477@agape.jhs>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi,

I would like to improve the following coccinelle script:

@@
expression a, fmt;
expression list var_args;
@@

-       DBG_871X_LEVEL(a, fmt, var_args);
+       printk(fmt, var_args);

I would  replace the DBG_871X_LEVEL macro with printk, but
I can't find a way to add KERN_* constant prefix to the fmt
argument in the + code line. If i try this

@@
expression a, fmt;
expression list var_args;
@@

-       DBG_871X_LEVEL(a, fmt, var_args);
+       printk(KERN_DEBUG fmt, var_args);

plus: parse error: 
  File "../test.cocci", line 94, column 20, charpos = 1171
  around = 'fmt',
  whole content = +	printk(KERN_DEBUG fmt, var_args);

how could I do this?

thank you in advance,

fabio
