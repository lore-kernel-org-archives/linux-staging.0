Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A317B;
	Sat, 11 Mar 2023 14:43:24 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id k2so632325pll.8;
        Sat, 11 Mar 2023 06:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678545804;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nXM/UF5GgRup6jMt6h+LtaT6QVXEZj0KXMptbShshHE=;
        b=E40t+zgvZHCVKrNiHeVevkeIBFXt6i7FUBglkpE3LbyP3kQToKv7UGIlA0fuw90AQJ
         Z8ycKySARL3yraVxMwdcrGohyv+D1Vt/bPJq0T3Sfrmrk+QWdH+dDZITKpMEwjOZa+wG
         mZWtYUIgt7VHJ5f/L62Xm7U6EFsfDEKuVVHJV7xbeT8khQbVk2oMAKdJn+if+2miRKi/
         jqy+jyJNQmmCMN2JL2lXP+hZyunW2Jc905Lt9PHRu9C8JSMOsao+S3OCy9Yur62cnaYC
         jmf6s7bFbd8xkQmSx8rXPaMDV2nFOHElzrqddd+TzXf2KB17sYKZcezQXYl7FH4HvYLj
         6I9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678545804;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nXM/UF5GgRup6jMt6h+LtaT6QVXEZj0KXMptbShshHE=;
        b=pigI6Yk1RtPylHorQPHKKWkXOOTLUKEcaXUUAvsQ5jT3ARoYkbMsLMCan595noSxsE
         vbJ5+t5ts9SIapFTZCcYVnUAvhXvjybIqgYs9KXUwkLS4T+J79dBS7LsyuqWlCVby8yC
         9ILJXIlHIbWWPH80CwaENtJ495D4EMie+hzCMpKq8nHTs3dqxuJ+CrBBRmcyKNNQg0kW
         muhGSetgvnep898+cuGbd/eUDP3jcvjDt2wbE4+IuV9bnHoNjeFvxLxv08tMO4Qvakbk
         0mbbEmKuE9//oURS0B7AEW4pc0cq2EUnrfQhqc6Of02X6BcGvWcNka/VxuVd1/LH4zrQ
         SoLw==
X-Gm-Message-State: AO0yUKWAMho376CkXCemOW8lAC5+3fxNHYWFhQ78KJb8RlOmz6oEnwKQ
	DItodfllXp8ZDKYVceOMeEXop2ctYFngdQ==
X-Google-Smtp-Source: AK7set9voO5GMcwrRcvfHrGLQVHExBuHPtdo+Kpw/RjvPtE8MU6m/kk4cyI3ss5Oyeea+j2xYefQdA==
X-Received: by 2002:a17:902:da91:b0:19c:d7a9:8bf0 with SMTP id j17-20020a170902da9100b0019cd7a98bf0mr6351397plx.10.1678545804050;
        Sat, 11 Mar 2023 06:43:24 -0800 (PST)
Received: from ubuntu ([117.199.152.23])
        by smtp.gmail.com with ESMTPSA id ld5-20020a170902fac500b0019f3095ae28sm727554plb.157.2023.03.11.06.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 06:43:23 -0800 (PST)
Date: Sat, 11 Mar 2023 06:43:18 -0800
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: error27@gmail.com
Cc: GR-Linux-NIC-Dev@marvell.com, coiby.xu@gmail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, manishc@marvell.com,
	netdev@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH] Staging: qlge: Remove parenthesis around single condition
Message-ID: <20230311144318.GC14247@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4caf380-bac5-4df3-bb98-529f5703a410@kili.mountain>

Hi Dan,

Your suggestion for correcting the indentation to
"[tab][tab][space][space][space][space](i ==." conflicts with the 
statement "Outside of comments, documentation and except in Kconfig, 
spaces are never used for indentation" written in 
https://elixir.bootlin.com/linux/latest/source/Documentation/process/coding-style.rst

However, If you still recommend to correct the indentation in the manner
"[tab][tab][space][space][space][space](i ==." Should I create a
patch for the same? 

Regards,

Sumitra

